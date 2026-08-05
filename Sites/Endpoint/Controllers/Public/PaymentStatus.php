<?php

namespace Sites\Endpoint\Controllers\Public;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;
use Sites\Endpoint\Services\PaymentService;

class PaymentStatus extends ResourceController
{
    use ResponseFormat;

    protected PaymentService $paymentService;

    public function __construct()
    {
        $this->paymentService = new PaymentService();
    }

    /**
     * GET /endpoint/public/payment-status/:reference
     *
     * Poll this endpoint to check if payment has been received.
     * The kiosk calls this in a loop after displaying QR/VA.
     */
    public function check($reference = null)
    {
        if (!$reference) {
            return $this->respondValidationError('Reference is required.');
        }

        $db = \Config\Database::connect();

        $donation = $db->table('donations')
            ->where('reference', $reference)
            ->get()->getRow();

        if (!$donation) {
            return $this->respondNotFound('Donation not found.');
        }

        // If already final status locally, just return it
        if (in_array($donation->status, ['paid', 'expired', 'failed', 'refunded'])) {
            return $this->respondSuccess([
                'reference'  => $donation->reference,
                'status'     => $donation->status,
                'paid_at'    => $donation->paid_at,
                'tenant_id'  => $donation->tenant_id ?? null,
            ]);
        }

        // Check expiry locally first
        if ($donation->expires_at && strtotime($donation->expires_at) < time()) {
            $affected = $db->table('donations')
                ->where('id', $donation->id)
                ->where('updated_at', $donation->updated_at)
                ->update(['status' => 'expired', 'updated_at' => date('Y-m-d H:i:s')]);

            return $this->respondSuccess([
                'reference'  => $donation->reference,
                'status'     => 'expired',
                'tenant_id'  => $donation->tenant_id ?? null,
            ]);
        }

        // Poll Xendit for live status
        if ($donation->xendit_payment_request_id) {
            try {
                $xenditStatus = $this->paymentService->getPaymentStatus($donation->xendit_payment_request_id);

                $newStatus   = $xenditStatus['status'] ?? $donation->status;
                $localStatus = PaymentService::mapStatus($newStatus);

                if ($localStatus !== $donation->status) {
                    $update = [
                        'status'     => $localStatus,
                        'updated_at' => date('Y-m-d H:i:s'),
                    ];
                    if ($localStatus === 'paid') {
                        $update['paid_at'] = date('Y-m-d H:i:s');
                    }

                    // Optimistic concurrency: only update if updated_at hasn't changed
                    $affected = $db->table('donations')
                        ->where('id', $donation->id)
                        ->where('updated_at', $donation->updated_at)
                        ->update($update);

                    if ($affected > 0) {
                        $donation->status = $localStatus;
                    }
                    // If affected = 0, another process updated it first — return current DB status
                }
            } catch (\Exception $e) {
                log_message('error', "Poll Xendit failed for {$reference}: " . $e->getMessage());
            }
        }

        return $this->respondSuccess([
            'reference'  => $donation->reference,
            'status'     => $donation->status,
            'paid_at'    => $donation->paid_at,
            'expires_at' => $donation->expires_at,
            'tenant_id'  => $donation->tenant_id ?? null,
        ]);
    }
}
