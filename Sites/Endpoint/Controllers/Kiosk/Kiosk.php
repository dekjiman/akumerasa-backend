<?php

namespace Sites\Endpoint\Controllers\Kiosk;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;
use Sites\Endpoint\Services\PaymentService;

class Kiosk extends ResourceController
{
    use ResponseFormat;

    /**
     * POST /endpoint/kiosk/heartbeat
     */
    public function heartbeat()
    {
        $json = $this->request->getJSON(true);
        $kioskId = $this->request->kioskId;

        $db = \Config\Database::connect();

        // Update kiosk last seen
        $db->table('kiosks')->where('id', $kioskId)->update([
            'last_seen'      => date('Y-m-d H:i:s'),
            'app_version'    => $json['app_version'] ?? null,
            'printer_status' => $json['printer_status'] ?? 'unknown',
        ]);

        // Store heartbeat
        $db->table('kiosk_heartbeats')->insert([
            'kiosk_id'       => $kioskId,
            'storage_used'   => $json['storage_used'] ?? null,
            'network_status' => $json['network_status'] ?? 'online',
            'printer_state'  => $json['printer_state'] ?? null,
            'created_at'     => date('Y-m-d H:i:s'),
        ]);

        return $this->respondSuccess(null, 'Heartbeat received.');
    }

    /**
     * GET /endpoint/kiosk/config
     */
    public function config()
    {
        $kioskId = $this->request->kioskId;
        $db = \Config\Database::connect();

        $kiosk = $db->table('kiosks')->where('id', $kioskId)->get()->getRow();
        $location = $db->table('locations')->where('id', $kiosk->location_id)->get()->getRow();

        $xenditConfig = config(\Config\Xendit::class);

        return $this->respondSuccess([
            'kiosk'    => $kiosk,
            'location' => $location,
            'settings' => [
                'idle_timeout'       => 60,
                'idle_warning'       => 45,
                'session_timeout'    => 300,
                'printer_width'      => 80,
            ],
            'payment' => [
                'enabled'            => true,
                'payment_methods'    => $xenditConfig->paymentMethods,
                'qris_min_amount'    => $xenditConfig->qrisMinAmount,
                'qris_max_amount'    => $xenditConfig->qrisMaxAmount,
                'va_min_amount'      => $xenditConfig->vaMinAmount,
                'va_max_amount'      => $xenditConfig->vaMaxAmount,
                'expiry_hours'       => $xenditConfig->paymentExpiryHours,
                'status_poll_url'    => base_url('endpoint/public/payment-status'),
                'webhook_url'        => base_url('endpoint/webhook/payment'),
            ],
        ]);
    }

    /**
     * GET /endpoint/kiosk/manifest
     */
    public function manifest()
    {
        $kioskId = $this->request->kioskId;
        $tenantId = $this->request->tenantId;
        $locationId = $this->request->locationId;
        $db = \Config\Database::connect();

        $now = date('Y-m-d H:i:s');

        // Get active campaigns for this kiosk
        $campaigns = $db->table('campaigns')
            ->where('status', 'active')
            ->where('valid_from <=', $now)
            ->where('valid_until >=', $now)
            ->orWhere('valid_until', null)
            ->get()->getResult();

        // Filter by targeting (simplified)
        $eligibleCampaigns = array_filter($campaigns, function ($campaign) use ($tenantId, $locationId) {
            $target = json_decode($campaign->target_config, true) ?? [];
            if (isset($target['tenants']) && !empty($target['tenants'])) {
                if (!in_array($tenantId, $target['tenants'])) return false;
            }
            if (isset($target['locations']) && !empty($target['locations'])) {
                if (!in_array($locationId, $target['locations'])) return false;
            }
            return true;
        });

        return $this->respondSuccess([
            'campaigns'    => array_values($eligibleCampaigns),
            'emotions'     => $db->table('emotions')->where('status', 'active')->orderBy('sort_order', 'ASC')->get()->getResult(),
            'contexts'     => $db->table('contexts')->orderBy('sort_order', 'ASC')->get()->getResult(),
            'themes'       => $db->table('reflection_templates')->get()->getResult(),
            'quran_verses' => $db->table('quran_verses')->where('status', 'approved')->get()->getResult(),
            'hadiths'      => $db->table('hadiths')->where('status', 'approved')->get()->getResult(),
        ]);
    }
    /**
     * GET /endpoint/kiosk/static-qr
     * Returns the reusable tenant QR for timeout/offline fallback.
     */
    public function staticQR()
    {
        try {
            $reference = 'STATIC-' . $this->request->tenantId . '-' . date('Ymd');
            $payment = (new PaymentService())->createStaticQR(
                $reference,
                $this->request->tenantId,
                $this->request->locationId
            );
            return $this->respondSuccess([
                'mode' => 'static',
                'payment' => $payment,
                'amount_required' => true,
            ], 'Static QR available. Donor must enter the amount in the payment app.');
        } catch (\Throwable $e) {
            log_message('error', 'Static QR fallback error: ' . $e->getMessage());
            return $this->respondError('Static QR is not available.', 503);
        }
    }
}
