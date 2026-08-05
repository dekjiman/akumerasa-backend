<?php

namespace Sites\Endpoint\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class Kiosks extends ResourceController
{
    use ResponseFormat;

    public function index()
    {
        $db = \Config\Database::connect();
        $page = (int) ($this->request->getGet('page') ?? 1);
        $perPage = (int) ($this->request->getGet('per_page') ?? 20);
        $search = $this->request->getGet('search') ?? '';
        $tenantId = $this->request->getGet('tenant_id') ?? null;
        $locationId = $this->request->getGet('location_id') ?? null;

        $builder = $db->table('kiosks');
        $builder->where('deleted_at', null);

        if (!empty($search)) {
            $builder->groupStart()->like('kiosk_code', $search)->groupEnd();
        }
        if ($tenantId) $builder->where('tenant_id', $tenantId);
        if ($locationId) $builder->where('location_id', $locationId);

        $total = $builder->countAllResults(false);
        $kiosks = $builder->orderBy('kiosk_code', 'ASC')
            ->limit($perPage, ($page - 1) * $perPage)
            ->get()->getResult();

        return $this->respondSuccess($kiosks, 'OK', [
            'current_page' => $page, 'last_page' => ceil($total / $perPage),
            'per_page' => $perPage, 'total' => $total,
        ]);
    }

    public function create()
    {
        $json = $this->request->getJSON(true);
        $kioskCode = trim($json['kiosk_code'] ?? '');
        $locationId = $json['location_id'] ?? null;
        $tenantId = $json['tenant_id'] ?? null;

        if (empty($kioskCode) || !$locationId || !$tenantId) {
            return $this->respondValidationError('Kiosk code, location_id, and tenant_id are required.');
        }

        $db = \Config\Database::connect();
        $deviceSecret = bin2hex(random_bytes(32));

        $db->table('kiosks')->insert([
            'kiosk_code'          => $kioskCode,
            'location_id'         => $locationId,
            'tenant_id'           => $tenantId,
            'name'                => $json['name'] ?? null,
            'platform'            => $json['platform'] ?? 'web',
            'printer_model'       => $json['printer_model'] ?? null,
            'printer_type'        => $json['printer_type'] ?? 'thermal_80mm',
            'screen_size'         => $json['screen_size'] ?? null,
            'donation_mode'       => $json['donation_mode'] ?? 'optional',
            'sponsor_enabled'     => $json['sponsor_enabled'] ?? false,
            'device_secret_hash'  => password_hash($deviceSecret, PASSWORD_BCRYPT),
            'app_version'         => $json['app_version'] ?? '1.0.0',
            'status'              => 'active',
            'printer_status'      => 'unknown',
            'created_at'          => date('Y-m-d H:i:s'),
            'updated_at'          => date('Y-m-d H:i:s'),
        ]);

        $kioskId = $db->insertID();
        $kiosk = $db->table('kiosks')->where('id', $kioskId)->get()->getRow();
        $kiosk->device_secret = $deviceSecret;

        return $this->respondCreated($kiosk, 'Kiosk registered. Save the device_secret securely.');
    }

    public function show($id = null)
    {
        $db = \Config\Database::connect();
        $kiosk = $db->table('kiosks')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$kiosk) return $this->respondNotFound('Kiosk not found.');
        return $this->respondSuccess($kiosk);
    }

    public function update($id = null)
    {
        $db = \Config\Database::connect();
        $kiosk = $db->table('kiosks')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$kiosk) return $this->respondNotFound('Kiosk not found.');

        $json = $this->request->getJSON(true);
        $updateData = ['updated_at' => date('Y-m-d H:i:s')];

        $updatableFields = [
            'location_id', 'tenant_id', 'app_version', 'status',
            'name', 'platform', 'printer_model', 'printer_type', 'screen_size',
            'donation_mode', 'sponsor_enabled',
        ];

        foreach ($updatableFields as $field) {
            if (isset($json[$field])) {
                $updateData[$field] = in_array($field, ['name']) ? trim($json[$field]) : $json[$field];
            }
        }

        $db->table('kiosks')->where('id', $id)->update($updateData);
        $updated = $db->table('kiosks')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Kiosk updated.');
    }

    public function delete($id = null)
    {
        $db = \Config\Database::connect();
        $kiosk = $db->table('kiosks')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$kiosk) return $this->respondNotFound('Kiosk not found.');

        $db->table('kiosks')->where('id', $id)->update(['deleted_at' => date('Y-m-d H:i:s')]);
        return $this->respondDeleted(null, 'Kiosk deleted.');
    }

    public function heartbeats($id = null)
    {
        $db = \Config\Database::connect();
        $heartbeats = $db->table('kiosk_heartbeats')
            ->where('kiosk_id', $id)
            ->orderBy('created_at', 'DESC')
            ->limit(50)
            ->get()->getResult();
        return $this->respondSuccess($heartbeats);
    }

    public function regenerateToken($id = null)
    {
        $db = \Config\Database::connect();
        $kiosk = $db->table('kiosks')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$kiosk) return $this->respondNotFound('Kiosk not found.');

        $newSecret = bin2hex(random_bytes(32));
        $db->table('kiosks')->where('id', $id)->update([
            'device_secret_hash' => password_hash($newSecret, PASSWORD_BCRYPT),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);

        $db->table('kiosk_tokens')->where('kiosk_id', $id)->update(['revoked_at' => date('Y-m-d H:i:s')]);

        return $this->respondSuccess(['device_secret' => $newSecret], 'Token regenerated. Revoke old tokens and update device.');
    }

    public function generateActivationCode($id = null)
    {
        $db = \Config\Database::connect();
        $kiosk = $db->table('kiosks')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$kiosk) return $this->respondNotFound('Kiosk not found.');

        $json = $this->request->getJSON(true);
        $ttlMinutes = (int) ($json['ttl_minutes'] ?? 10);
        $maxUses = (int) ($json['max_uses'] ?? 3);

        $code = str_pad((string) random_int(100000, 999999), 6, '0', STR_PAD_LEFT);
        $codeHash = password_hash($code, PASSWORD_BCRYPT);

        $expiresAt = date('Y-m-d H:i:s', time() + ($ttlMinutes * 60));
        $userId = $this->request->userId ?? null;

        $db->table('device_activations')->insert([
            'kiosk_id'             => $id,
            'activation_code_hash' => $codeHash,
            'status'               => 'pending',
            'expires_at'           => $expiresAt,
            'max_uses'             => $maxUses,
            'use_count'            => 0,
            'created_by'           => $userId,
            'created_at'           => date('Y-m-d H:i:s'),
            'updated_at'           => date('Y-m-d H:i:s'),
        ]);

        $activationId = $db->insertID();

        return $this->respondCreated([
            'activation_id'  => $activationId,
            'activation_code' => $code,
            'expires_at'     => $expiresAt,
            'max_uses'       => $maxUses,
            'kiosk_code'     => $kiosk->kiosk_code,
            'ttl_minutes'    => $ttlMinutes,
        ], 'Activation code generated. Share the 6-digit code with the kiosk.');
    }

    public function revokeActivationCodes($id = null)
    {
        $db = \Config\Database::connect();
        $kiosk = $db->table('kiosks')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$kiosk) return $this->respondNotFound('Kiosk not found.');

        $userId = $this->request->userId ?? null;

        $revoked = $db->table('device_activations')
            ->where('kiosk_id', $id)
            ->where('status', 'pending')
            ->update([
                'status'     => 'revoked',
                'revoked_at' => date('Y-m-d H:i:s'),
                'revoked_by' => $userId,
                'updated_at' => date('Y-m-d H:i:s'),
            ]);

        return $this->respondSuccess([
            'kiosk_id'  => (int) $id,
            'revoked'   => $revoked,
        ], 'Pending activation codes revoked.');
    }

    public function activationHistory($id = null)
    {
        $db = \Config\Database::connect();
        $kiosk = $db->table('kiosks')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$kiosk) return $this->respondNotFound('Kiosk not found.');

        $activations = $db->table('device_activations')
            ->where('kiosk_id', $id)
            ->orderBy('created_at', 'DESC')
            ->limit(50)
            ->get()
            ->getResult();

        return $this->respondSuccess($activations);
    }
}
