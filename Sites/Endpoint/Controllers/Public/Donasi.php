<?php

namespace Sites\Endpoint\Controllers\Public;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;
use Sites\Endpoint\Services\PaymentService;

class Donasi extends ResourceController
{
    use ResponseFormat;

    protected PaymentService $paymentService;

    public function __construct()
    {
        $this->paymentService = new PaymentService();
    }

    /**
     * POST /endpoint/public/donasi
     *
     * Body JSON:
     *   amount             (required, int > 0)
     *   payment_method     (required: qris | va_bca | va_bri | va_bni | va_mandiri | va_bsi | va_permata | ...)
     *   session_id         (optional)
     *   tenant_id          (optional, int - asal tenant)
     *   donor_name         (optional)
     *   campaign_id        (optional)
     *   note               (optional)
     */
    public function create()
    {
        $json = $this->request->getJSON(true);

        $amount         = (float) ($json['amount'] ?? 0);
        $paymentMethod  = $json['payment_method'] ?? 'qris';
        $sessionId      = $json['session_id'] ?? null;
        $tenantId       = $json['tenant_id'] ?? null;
        $locationId     = $json['location_id'] ?? null;
        $donorName      = $json['donor_name'] ?? 'Donor';
        $campaignId     = $json['campaign_id'] ?? null;
        $note           = $json['note'] ?? null;

        if ($amount <= 0) {
            return $this->respondValidationError('Amount must be greater than 0.');
        }

        // Validate payment method
        $config = config(\Config\Xendit::class);
        if (!isset($config->paymentMethods[$paymentMethod])) {
            return $this->respondValidationError(
                'Invalid payment_method. Allowed: ' . implode(', ', array_keys($config->paymentMethods))
            );
        }

        // Amount limits
        $isQRIS = ($paymentMethod === 'qris');
        $min    = $isQRIS ? $config->qrisMinAmount : $config->vaMinAmount;
        $max    = $isQRIS ? $config->qrisMaxAmount : $config->vaMaxAmount;
        if ($amount < $min || $amount > $max) {
            return $this->respondValidationError("Amount must be between {$min} and {$max} for {$paymentMethod}.");
        }

        $db       = \Config\Database::connect();
        if ($sessionId) {
            $session = $db->table('reflection_sessions')->where('id', $sessionId)->get()->getRow();
            if (!$session) return $this->respondNotFound('Reflection session not found.');
            $tenantId = $session->tenant_id;
            $locationId = $session->location_id;
        }
        $reference = 'DON-' . date('Ymd') . '-' . bin2hex(random_bytes(4));

        try {
            if ($isQRIS) {
                $result = $this->paymentService->createDynamicQR(
                    $amount,
                    $reference,
                    $note ?: 'Donasi Refleksi Diri',
                    $config->paymentExpiryHours
                );
            } else {
                $bankKey = str_replace('va_', '', $paymentMethod);
                $result = $this->paymentService->createVA(
                    $amount,
                    $reference,
                    $bankKey,
                    $donorName,
                    $config->paymentExpiryHours
                );
            }

            $now = date('Y-m-d H:i:s');
            $db->table('donations')->insert([
                'session_id'                 => $sessionId,
                'tenant_id'                  => $tenantId,
                'location_id'                => $locationId,
                'donor_name'                 => $donorName,
                'campaign_id'                => $campaignId,
                'amount'                     => $amount,
                'payment_method'             => $paymentMethod,
                'reference'                  => $reference,
                'qr_data'                    => $result['qr_string'] ?? null,
                'status'                     => 'pending',
                'xendit_payment_request_id'  => $result['payment_request_id'] ?? null,
                'xendit_external_id'         => $result['external_id'] ?? null,
                'qr_type'                    => $isQRIS ? 'dynamic' : null,
                'channel_code'               => $result['channel_code'] ?? null,
                'va_number'                  => $result['va_number'] ?? null,
                'bank_code'                  => $result['bank_code'] ?? null,
                'expires_at'                 => $result['expires_at'] ?? null,
                'created_at'                 => $now,
                'updated_at'                 => $now,
            ]);

            $donationId = $db->insertID();
            $donation   = $db->table('donations')->where('id', $donationId)->get()->getRow();

            return $this->respondCreated([
                'donation'   => $donation,
                'payment'    => $result,
            ], 'Payment created. Proceed with payment.');

        } catch (\Xendit\XenditSdkException $e) {
            $errorDetail = $e->getError()?->getErrors() ?? $e->getMessage();
            log_message('error', 'Xendit createPayment error: ' . $e->getMessage());
            return $this->respondError('Payment gateway error: ' . $e->getMessage(), 502, $errorDetail);
        } catch (\Exception $e) {
            log_message('error', 'Donasi create error: ' . $e->getMessage());
            return $this->respondError('Failed to create donation.', 500);
        }
    }
}
