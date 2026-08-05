<?php

namespace Sites\Endpoint\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;
use Sites\Endpoint\Services\PaymentService;

class Donations extends ResourceController
{
    use ResponseFormat;

    protected PaymentService $paymentService;

    public function __construct()
    {
        $this->paymentService = new PaymentService();
    }

    public function index()
    {
        $db        = \Config\Database::connect();
        $page      = (int) ($this->request->getGet('page') ?? 1);
        $perPage   = (int) ($this->request->getGet('per_page') ?? 20);
        $status    = $this->request->getGet('status') ?? null;
        $method    = $this->request->getGet('payment_method') ?? null;
        $tenantId  = $this->request->getGet('tenant_id') ?? null;
        $campaignId = $this->request->getGet('campaign_id') ?? null;
        $startDate = $this->request->getGet('start_date') ?? null;
        $endDate   = $this->request->getGet('end_date') ?? null;
        $search    = $this->request->getGet('search') ?? null;

        $builder = $db->table('donations');

        if ($status)    $builder->where('status', $status);
        if ($method)    $builder->where('payment_method', $method);
        if ($tenantId)  $builder->where('tenant_id', $tenantId);
        if ($campaignId) $builder->where('campaign_id', $campaignId);
        if ($startDate) $builder->where('created_at >=', $startDate);
        if ($endDate)   $builder->where('created_at <=', $endDate . ' 23:59:59');
        if ($search) {
            $builder->groupStart();
            $builder->like('reference', $search);
            $builder->orLike('payment_method', $search);
            $builder->orLike('donor_name', $search);
            $builder->orLike('xendit_payment_request_id', $search);
            $builder->groupEnd();
        }

        $total = $builder->countAllResults(false);
        $donations = $builder->orderBy('created_at', 'DESC')
            ->limit($perPage, ($page - 1) * $perPage)->get()->getResult();

        return $this->respondSuccess($donations, 'OK', [
            'current_page' => $page,
            'last_page'    => ceil($total / $perPage),
            'per_page'     => $perPage,
            'total'        => $total,
        ]);
    }

    public function show($id = null)
    {
        $db = \Config\Database::connect();
        $donation = $db->table('donations')->where('id', $id)->get()->getRow();
        if (!$donation) return $this->respondNotFound('Donation not found.');

        if ($donation->payment_details && is_string($donation->payment_details)) {
            $donation->payment_details = json_decode($donation->payment_details, true);
        }

        return $this->respondSuccess($donation);
    }

    /**
     * POST /endpoint/admin/donations/:id/cancel
     *
     * Cancel a pending donation and void the payment request on Xendit.
     */
    public function cancel($id = null)
    {
        $db = \Config\Database::connect();
        $donation = $db->table('donations')->where('id', $id)->get()->getRow();
        if (!$donation) return $this->respondNotFound('Donation not found.');
        if (!in_array($donation->status, ['pending'])) {
            return $this->respondValidationError('Only pending donations can be cancelled.');
        }

        // Attempt to cancel on Xendit if payment_request_id exists
        $xenditCancelled = false;
        if (!empty($donation->xendit_payment_request_id)) {
            $xenditCancelled = $this->paymentService->cancelPaymentRequest($donation->xendit_payment_request_id);
        }

        $update = [
            'status'       => 'expired',
            'updated_at'   => date('Y-m-d H:i:s'),
            'failure_code' => 'cancelled_by_admin',
        ];

        // Log whether Xendit cancel succeeded or failed
        if ($donation->xendit_payment_request_id) {
            $update['failure_code'] = $xenditCancelled
                ? 'cancelled_by_admin'
                : 'cancelled_by_admin_xendit_sync_failed';
        }

        $db->table('donations')->where('id', $donation->id)->update($update);

        $message = $xenditCancelled
            ? 'Donation cancelled and payment voided on Xendit.'
            : 'Donation cancelled locally.' . ($donation->xendit_payment_request_id ? ' Warning: Xendit void may have failed.' : '');

        return $this->respondSuccess([
            'xendit_cancelled' => $xenditCancelled,
        ], $message);
    }
}
