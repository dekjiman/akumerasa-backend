<?php

namespace Sites\Endpoint\Services;

use Xendit\Configuration;
use Xendit\PaymentRequest\PaymentRequestApi;
use Xendit\PaymentRequest\PaymentRequestParameters;
use Xendit\PaymentRequest\PaymentMethodParameters;
use Xendit\PaymentRequest\QRCodeParameters;
use Xendit\PaymentRequest\QRCodeChannelProperties;
use Xendit\PaymentRequest\VirtualAccountParameters;
use Xendit\PaymentRequest\VirtualAccountChannelProperties;
use chillerlan\QRCode\QRCode;
use chillerlan\QRCode\Output\QRGdImagePNG;
use Config\Xendit as XenditConfig;

class PaymentService
{
    private PaymentRequestApi $api;
    private XenditConfig $config;
    private \CodeIgniter\Database\BaseConnection $db;

    public function __construct()
    {
        $this->config  = config(XenditConfig::class);
        $this->db      = \Config\Database::connect();
        Configuration::setXenditKey($this->config->apiKey);
        $this->api     = new PaymentRequestApi();
    }

    /**
     * Create a dynamic QRIS payment (online kiosk).
     * Amount is embedded in the QR — user pays exact amount.
     */
    public function createDynamicQR(
        float  $amount,
        string $reference,
        string $description = '',
        int    $expiryHours = 24
    ): array {
        $expiresAt = new \DateTime("+{$expiryHours} hours");

        $params = new PaymentRequestParameters([
            'reference_id'   => $reference,
            'amount'         => $amount,
            'currency'       => 'IDR',
            'description'    => $description,
            'payment_method' => [
                'type'        => 'QR_CODE',
                'reusability' => 'ONE_TIME_USE',
                'qr_code'     => [
                    'channel_code' => 'QRIS',
                ],
            ],
        ]);

        $result = $this->api->createPaymentRequest(null, null, null, $params);

        $qrCode = $result->getPaymentMethod()->getQrCode();
        $qrString = $qrCode->getChannelProperties()->getQrString();
        $qrImage  = $this->generateQRImage($qrString);

        return [
            'payment_request_id' => $result->getId(),
            'external_id'        => $result->getReferenceId(),
            'status'             => $result->getStatus(),
            'qr_string'          => $qrString,
            'qr_image'           => $qrImage,
            'amount'             => $result->getAmount(),
            'currency'           => 'IDR',
            'expires_at'         => $expiresAt->format('Y-m-d H:i:s'),
        ];
    }

    /**
     * Create a Virtual Account payment.
     */
    public function createVA(
        float  $amount,
        string $reference,
        string $bankCode,
        string $customerName = 'Donor',
        int    $expiryHours = 24
    ): array {
        $expiresAt = new \DateTime("+{$expiryHours} hours");
        $channelCode = $this->config->bankCodes[$bankCode] ?? strtoupper($bankCode) . '_VIRTUAL_ACCOUNT';

        $params = new PaymentRequestParameters([
            'reference_id'   => $reference,
            'amount'         => $amount,
            'currency'       => 'IDR',
            'description'    => 'Donasi Refleksi - ' . strtoupper($bankCode),
            'payment_method' => [
                'type'        => 'VIRTUAL_ACCOUNT',
                'reusability' => 'ONE_TIME_USE',
                'virtual_account' => [
                    'channel_code'       => $channelCode,
                    'channel_properties' => [
                        'customer_name'  => $customerName,
                        'expires_at'     => $expiresAt->format('c'),
                    ],
                ],
            ],
        ]);

        $result = $this->api->createPaymentRequest(null, null, null, $params);

        $va = $result->getPaymentMethod()->getVirtualAccount()->getChannelProperties();

        return [
            'payment_request_id' => $result->getId(),
            'external_id'        => $result->getReferenceId(),
            'status'             => $result->getStatus(),
            'bank_code'          => $bankCode,
            'channel_code'       => $channelCode,
            'va_number'          => $va->getVirtualAccountNumber(),
            'amount'             => $result->getAmount(),
            'currency'           => 'IDR',
            'expires_at'         => $expiresAt->format('Y-m-d H:i:s'),
        ];
    }

    /**
     * Get payment request status from Xendit.
     */
    public function getPaymentStatus(string $paymentRequestId): array
    {
        $result = $this->api->getPaymentRequestByID($paymentRequestId);

        $paymentMethod = $result->getPaymentMethod();
        $methodType    = $paymentMethod->getType();

        $response = [
            'payment_request_id' => $result->getId(),
            'external_id'        => $result->getReferenceId(),
            'status'             => $result->getStatus(),
            'amount'             => $result->getAmount(),
            'currency'           => 'IDR',
            'created'            => $result->getCreated(),
            'updated'            => $result->getUpdated(),
            'failure_code'       => $result->getFailureCode(),
        ];

        if ($methodType === 'QR_CODE' && $paymentMethod->getQrCode()) {
            $qr = $paymentMethod->getQrCode();
            $response['qr_string'] = $qr->getChannelProperties()->getQrString();
            $response['qr_image']  = $this->generateQRImage($qr->getChannelProperties()->getQrString());
        } elseif ($methodType === 'VIRTUAL_ACCOUNT' && $paymentMethod->getVirtualAccount()) {
            $va = $paymentMethod->getVirtualAccount();
            $response['va_number']    = $va->getVirtualAccountNumber();
            $response['channel_code'] = $va->getChannelCode();
        }

        return $response;
    }

    /**
     * Map Xendit status to local status.
     */
    public static function mapStatus(string $xenditStatus, ?string $eventType = null): string
    {
        if ($xenditStatus === 'SUCCEEDED' || $eventType === 'payment.succeeded') {
            return 'paid';
        }

        return match ($xenditStatus) {
            'ACTIVE', 'PENDING' => 'pending',
            'EXPIRED'           => 'expired',
            'FAILED'            => 'failed',
            default             => strtolower($xenditStatus),
        };
    }

    /**
     * Verify webhook signature using HMAC-SHA256 and return parsed event data.
     * Returns null if signature is invalid.
     */
    public function verifyWebhook(array $payload, string $callbackToken, string $rawBody): ?array
    {
        $expectedSignature = hash_hmac('sha256', $rawBody, $this->config->webhookToken);

        if (!hash_equals($expectedSignature, $callbackToken)) {
            log_message('error', 'Webhook HMAC signature mismatch');
            return null;
        }

        $eventType = $payload['event'] ?? null;
        $data      = $payload['data'] ?? [];

        $reference = $data['reference_id'] ?? null;
        $status    = $data['status'] ?? null;
        $paymentRequestId = $data['id'] ?? null;

        if (!$reference && !$paymentRequestId) {
            log_message('error', 'Webhook missing reference_id and id');
            return null;
        }

        $localStatus = self::mapStatus($status ?? '', $eventType);

        return [
            'event'               => $eventType,
            'payment_request_id'  => $paymentRequestId,
            'reference_id'        => $reference,
            'status'              => $localStatus,
            'xendit_status'       => $status,
            'amount'              => $data['amount'] ?? null,
            'payment_method'      => $data['payment_method'] ?? null,
            'raw'                 => $payload,
        ];
    }

    /**
     * Create and persist a static QR via Xendit API for offline kiosks.
     * Reuses existing active QR for the same tenant.
     */
    public function createStaticQR(string $reference, ?int $tenantId = null, ?int $locationId = null): array
    {
        $existing = $this->db->table('xendit_static_qrs')
            ->where('tenant_id', $tenantId)
            ->where('status', 'active')
            ->get()->getRow();

        if ($existing) {
            return [
                'qr_id'       => $existing->xendit_qr_id,
                'external_id' => $existing->external_id,
                'qr_string'   => $existing->qr_string,
                'qr_image'    => $this->generateQRImage($existing->qr_string),
            ];
        }

        try {
            // PaymentRequest requires an amount. Use Xendit's QR Codes API
            // for a reusable static QR where the payer enters the amount.
            $payload = json_encode([
                'external_id'  => $reference,
                'type'         => 'STATIC',
                'callback_url' => base_url('endpoint/webhook/payment'),
            ], JSON_THROW_ON_ERROR);
            $ch = curl_init(rtrim($this->config->apiBaseUrl, '/') . '/qr_codes');
            curl_setopt_array($ch, [
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_POST           => true,
                CURLOPT_POSTFIELDS     => $payload,
                CURLOPT_TIMEOUT        => 20,
                CURLOPT_HTTPHEADER     => [
                    'Authorization: Basic ' . base64_encode($this->config->apiKey . ':'),
                    'Content-Type: application/json',
                ],
            ]);
            $raw = curl_exec($ch);
            $httpCode = (int) curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $curlError = curl_error($ch);
            curl_close($ch);
            if ($raw === false || $httpCode < 200 || $httpCode >= 300) {
                throw new \RuntimeException('Xendit static QR failed (' . $httpCode . '): ' . ($curlError ?: 'API rejected request'));
            }
            $result = json_decode($raw, true, 512, JSON_THROW_ON_ERROR);
            $qrString = (string) ($result['qr_string'] ?? '');
            $qrId     = (string) ($result['id'] ?? '');
            if ($qrString === '' || $qrId === '') {
                throw new \RuntimeException('Xendit static QR response is incomplete');
            }

            $now = date('Y-m-d H:i:s');
            $this->db->table('xendit_static_qrs')->insert([
                'xendit_qr_id' => $qrId,
                'external_id'  => $reference,
                'qr_string'    => $qrString,
                'tenant_id'    => $tenantId,
                'location_id'  => $locationId,
                'status'       => 'active',
                'created_at'   => $now,
                'updated_at'   => $now,
            ]);

            return [
                'qr_id'       => $qrId,
                'external_id' => $reference,
                'qr_string'   => $qrString,
                'qr_image'    => $this->generateQRImage($qrString),
            ];
        } catch (\Exception $e) {
            log_message('error', 'Xendit createStaticQR error: ' . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Cancel a payment request on Xendit (void the payment).
     * Uses raw HTTP DELETE since SDK doesn't provide cancel method.
     */
    public function cancelPaymentRequest(string $paymentRequestId): bool
    {
        try {
            $ch = curl_init();
            curl_setopt_array($ch, [
                CURLOPT_URL            => Configuration::getApiBaseUrl() . '/payment_requests/' . $paymentRequestId,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_TIMEOUT        => 15,
                CURLOPT_CUSTOMREQUEST  => 'DELETE',
                CURLOPT_HTTPHEADER     => [
                    'Authorization: Basic ' . base64_encode($this->config->apiKey . ':'),
                    'Content-Type: application/json',
                ],
            ]);

            $response = curl_exec($ch);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);

            if ($httpCode >= 200 && $httpCode < 300) {
                return true;
            }

            log_message('error', "Xendit cancel failed (HTTP {$httpCode}): {$response}");
            return false;
        } catch (\Exception $e) {
            log_message('error', 'Xendit cancelPaymentRequest error: ' . $e->getMessage());
            return false;
        }
    }

    /**
     * Generate a QR code image as a base64 data URI.
     */
    public function generateQRImage(string $data): string
    {
        return (new QRCode([
            'outputInterface' => QRGdImagePNG::class,
            'outputBase64'    => true,
            'scale'           => 10,
        ]))->render($data);
    }

    /**
     * Map Xendit payment method type to our internal method string.
     */
    public static function mapPaymentMethod(?string $type, ?array $pm): string
    {
        if (!$type) return 'qris';

        return match (strtoupper($type)) {
            'QR_CODE'            => 'qris',
            'VIRTUAL_ACCOUNT'    => 'va_' . strtolower($pm['virtual_account']['channel_code'] ?? 'unknown'),
            default              => strtolower($type),
        };
    }
}
