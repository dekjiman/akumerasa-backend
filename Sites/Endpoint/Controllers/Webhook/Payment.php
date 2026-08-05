<?php

namespace Sites\Endpoint\Controllers\Webhook;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;
use Sites\Endpoint\Services\PaymentService;

class Payment extends ResourceController
{
    use ResponseFormat;

    protected PaymentService $paymentService;

    public function __construct()
    {
        $this->paymentService = new PaymentService();
    }

    /**
     * POST /endpoint/webhook/payment
     *
     * Xendit sends this with:
     *   Header: x-callback-token = HMAC-SHA256(rawBody, webhookSecret)
     *   Body:   { event, data: { id, reference_id, status, amount, ... } }
     *
     * Must return HTTP 200 within 5 seconds.
     */
    public function handle()
    {
        $rawBody = file_get_contents('php://input');
        $payload = json_decode($rawBody, true);

        if (!$payload) {
            return $this->respondError('Invalid JSON', 400);
        }

        $callbackToken = $this->request->getHeaderLine('x-callback-token');
        $eventData     = $this->paymentService->verifyWebhook($payload, $callbackToken, $rawBody);

        if (!$eventData) {
            log_message('warning', 'Webhook verification failed. Token prefix: ' . substr($callbackToken, 0, 8) . '...');
            return $this->respondError('Invalid webhook signature', 401);
        }

        $db = \Config\Database::connect();
        $reference = $eventData['reference_id'] ?? $eventData['payment_request_id'] ?? null;

        $donation = $db->table('donations')
            ->where('reference', $reference)
            ->orWhere('xendit_payment_request_id', $eventData['payment_request_id'] ?? '')
            ->get()->getRow();

        if (!$donation) {
            log_message('warning', "Webhook: donation not found for ref {$reference}");
            return $this->respondSuccess(null, 'Donation not found, skipping.');
        }

        // Idempotent: don't reprocess final statuses
        if (in_array($donation->status, ['paid', 'refunded'])) {
            return $this->respondSuccess(null, 'Already processed.');
        }

        // Idempotent: check if this exact event was already processed
        $existingWebhook = $db->table('payment_webhooks')
            ->where('donation_id', $donation->id)
            ->where('provider', 'xendit')
            ->where('JSON_EXTRACT(payload, "$.event")', $eventData['event'])
            ->where('JSON_EXTRACT(payload, "$.data.id")', $eventData['payment_request_id'] ?? '')
            ->get()->getRow();

        if ($existingWebhook) {
            log_message('info', "Webhook duplicate ignored: donation_id={$donation->id}, event={$eventData['event']}");
            return $this->respondSuccess(null, 'Duplicate webhook, already processed.');
        }

        $update = [
            'status'     => $eventData['status'],
            'updated_at' => date('Y-m-d H:i:s'),
        ];

        if ($eventData['status'] === 'paid') {
            $update['paid_at']     = date('Y-m-d H:i:s');
            $update['provider_ref'] = $eventData['payment_request_id'] ?? null;

            $paymentDetails = $eventData['payment_method'] ?? [];
            if (!empty($paymentDetails)) {
                $update['payment_details'] = json_encode($paymentDetails);
            }
        }

        if ($eventData['status'] === 'failed') {
            $update['failure_code'] = $eventData['xendit_status'] ?? 'unknown';
        }

        $db->table('donations')->where('id', $donation->id)->update($update);

        // Log webhook
        $db->table('payment_webhooks')->insert([
            'donation_id'  => $donation->id,
            'provider'     => 'xendit',
            'payload'      => json_encode($payload),
            'signature'    => $callbackToken,
            'processed_at' => date('Y-m-d H:i:s'),
            'created_at'   => date('Y-m-d H:i:s'),
        ]);

        return $this->respondSuccess(null, 'Webhook processed.');
    }
}
