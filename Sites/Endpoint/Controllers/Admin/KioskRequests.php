<?php

namespace Sites\Endpoint\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class KioskRequests extends ResourceController
{
    use ResponseFormat;

    public function index()
    {
        $db = \Config\Database::connect();

        $page = (int) ($this->request->getGet('page') ?? 1);
        $perPage = (int) ($this->request->getGet('per_page') ?? 20);
        $search = $this->request->getGet('search') ?? '';
        $tenantId = $this->request->getGet('tenant_id') ?? null;
        $status = $this->request->getGet('status') ?? null;

        $builder = $db->table('kiosk_requests');
        $builder->where('deleted_at', null);

        if (!empty($search)) {
            $builder->groupStart()
                ->like('request_number', $search)
                ->orLike('admin_notes', $search)
                ->groupEnd();
        }
        if ($tenantId) $builder->where('tenant_id', $tenantId);
        if ($status) $builder->where('status', $status);

        $total = $builder->countAllResults(false);
        $requests = $builder->orderBy('created_at', 'DESC')
            ->limit($perPage, ($page - 1) * $perPage)
            ->get()
            ->getResult();

        return $this->respondSuccess($requests, 'OK', [
            'current_page' => $page,
            'last_page'    => ceil($total / $perPage),
            'per_page'     => $perPage,
            'total'        => $total,
        ]);
    }

    public function create()
    {
        $json = $this->request->getJSON(true);

        $tenantId = $json['tenant_id'] ?? null;
        $requestedBy = $json['requested_by'] ?? $this->request->userId ?? null;

        if (!$tenantId) {
            return $this->respondValidationError(['tenant_id' => ['Tenant ID is required.']]);
        }

        $db = \Config\Database::connect();

        $requestNumber = $this->generateRequestNumber($db);

        $db->table('kiosk_requests')->insert([
            'request_number'   => $requestNumber,
            'tenant_id'        => $tenantId,
            'location_id'      => $json['location_id'] ?? null,
            'requested_by'     => $requestedBy,
            'request_type'     => $json['request_type'] ?? 'new',
            'platform'         => $json['platform'] ?? 'windows_electron',
            'printer_type'     => $json['printer_type'] ?? 'thermal_80mm',
            'quantity'         => $json['quantity'] ?? 1,
            'donation_mode'    => $json['donation_mode'] ?? 'optional',
            'sponsor_enabled'  => $json['sponsor_enabled'] ?? false,
            'priority'         => $json['priority'] ?? 'normal',
            'status'           => 'pending',
            'created_at'       => date('Y-m-d H:i:s'),
            'updated_at'       => date('Y-m-d H:i:s'),
        ]);

        $requestId = $db->insertID();
        $kioskRequest = $db->table('kiosk_requests')->where('id', $requestId)->get()->getRow();

        return $this->respondCreated($kioskRequest, 'Kiosk request created.');
    }

    public function show($id = null)
    {
        $db = \Config\Database::connect();

        $kioskRequest = $db->table('kiosk_requests')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$kioskRequest) {
            return $this->respondNotFound('Kiosk request not found.');
        }

        return $this->respondSuccess($kioskRequest);
    }

    public function update($id = null)
    {
        $db = \Config\Database::connect();

        $kioskRequest = $db->table('kiosk_requests')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$kioskRequest) {
            return $this->respondNotFound('Kiosk request not found.');
        }

        $json = $this->request->getJSON(true);
        $updateData = ['updated_at' => date('Y-m-d H:i:s')];

        $updatableFields = [
            'location_id', 'request_type', 'platform', 'printer_type',
            'quantity', 'donation_mode', 'sponsor_enabled', 'priority',
            'status', 'admin_notes',
        ];

        foreach ($updatableFields as $field) {
            if (isset($json[$field])) {
                $updateData[$field] = $field === 'admin_notes' ? trim($json[$field]) : $json[$field];
            }
        }

        $db->table('kiosk_requests')->where('id', $id)->update($updateData);

        $updated = $db->table('kiosk_requests')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Kiosk request updated.');
    }

    public function delete($id = null)
    {
        $db = \Config\Database::connect();

        $kioskRequest = $db->table('kiosk_requests')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$kioskRequest) {
            return $this->respondNotFound('Kiosk request not found.');
        }

        $db->table('kiosk_requests')->where('id', $id)->update([
            'deleted_at' => date('Y-m-d H:i:s'),
        ]);

        return $this->respondDeleted(null, 'Kiosk request deleted.');
    }

    public function approve($id = null)
    {
        $db = \Config\Database::connect();

        $kioskRequest = $db->table('kiosk_requests')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$kioskRequest) {
            return $this->respondNotFound('Kiosk request not found.');
        }

        if (!in_array($kioskRequest->status, ['pending', 'under_review'])) {
            return $this->respondBusinessRuleError('Request cannot be approved in current status: ' . $kioskRequest->status);
        }

        $userId = $this->request->userId ?? null;

        $quantity = (int) $kioskRequest->quantity;
        $createdKiosks = [];

        for ($i = 0; $i < $quantity; $i++) {
            $kioskCode = 'KSK-' . strtoupper(bin2hex(random_bytes(3)));
            $deviceSecret = bin2hex(random_bytes(32));

            $db->table('kiosks')->insert([
                'kiosk_code'          => $kioskCode,
                'location_id'         => $kioskRequest->location_id,
                'tenant_id'           => $kioskRequest->tenant_id,
                'name'                => $kioskRequest->platform . ' Kiosk #' . ($i + 1),
                'platform'            => $kioskRequest->platform,
                'printer_type'        => $kioskRequest->printer_type,
                'donation_mode'       => $kioskRequest->donation_mode,
                'sponsor_enabled'     => $kioskRequest->sponsor_enabled,
                'device_secret_hash'  => password_hash($deviceSecret, PASSWORD_BCRYPT),
                'status'              => 'inactive',
                'printer_status'      => 'unknown',
                'created_at'          => date('Y-m-d H:i:s'),
                'updated_at'          => date('Y-m-d H:i:s'),
            ]);

            $kioskId = $db->insertID();

            $activationCode = str_pad((string) random_int(100000, 999999), 6, '0', STR_PAD_LEFT);
            $codeHash = password_hash($activationCode, PASSWORD_BCRYPT);

            $db->table('device_activations')->insert([
                'kiosk_id'             => $kioskId,
                'activation_code_hash' => $codeHash,
                'status'               => 'pending',
                'expires_at'           => date('Y-m-d H:i:s', time() + (24 * 60 * 60)),
                'max_uses'             => 3,
                'created_by'           => $userId,
                'created_at'           => date('Y-m-d H:i:s'),
                'updated_at'           => date('Y-m-d H:i:s'),
            ]);

            $createdKiosks[] = [
                'kiosk_id'         => $kioskId,
                'kiosk_code'       => $kioskCode,
                'device_secret'    => $deviceSecret,
                'activation_code'  => $activationCode,
            ];
        }

        $db->table('kiosk_requests')->where('id', $id)->update([
            'status'       => 'approved',
            'reviewed_by'  => $userId,
            'reviewed_at'  => date('Y-m-d H:i:s'),
            'approved_at'  => date('Y-m-d H:i:s'),
            'fulfilled_at' => date('Y-m-d H:i:s'),
            'kiosk_id'     => $createdKiosks[0]['kiosk_id'] ?? null,
            'updated_at'   => date('Y-m-d H:i:s'),
        ]);

        $updated = $db->table('kiosk_requests')->where('id', $id)->get()->getRow();

        return $this->respondSuccess([
            'request'   => $updated,
            'kiosks'    => $createdKiosks,
        ], 'Kiosk request approved. ' . $quantity . ' kiosk(s) created with activation codes.');
    }

    public function reject($id = null)
    {
        $db = \Config\Database::connect();

        $kioskRequest = $db->table('kiosk_requests')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$kioskRequest) {
            return $this->respondNotFound('Kiosk request not found.');
        }

        $json = $this->request->getJSON(true);
        $notes = trim($json['notes'] ?? '');

        if (empty($notes)) {
            return $this->respondValidationError(['notes' => ['Rejection reason is required.']]);
        }

        $userId = $this->request->userId ?? null;

        $db->table('kiosk_requests')->where('id', $id)->update([
            'status'       => 'rejected',
            'admin_notes'  => $notes,
            'reviewed_by'  => $userId,
            'reviewed_at'  => date('Y-m-d H:i:s'),
            'updated_at'   => date('Y-m-d H:i:s'),
        ]);

        $updated = $db->table('kiosk_requests')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Kiosk request rejected.');
    }

    private function generateRequestNumber($db): string
    {
        $now = new \DateTime();
        $prefix = 'KR-' . $now->format('Ym') . '-';
        $count = $db->table('kiosk_requests')
            ->like('request_number', $prefix, 'after')
            ->countAllResults();
        return $prefix . str_pad((string) ($count + 1), 3, '0', STR_PAD_LEFT);
    }
}
