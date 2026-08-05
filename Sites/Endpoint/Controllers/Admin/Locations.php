<?php

namespace Sites\Endpoint\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;
use Sites\Endpoint\Services\PaymentService;

class Locations extends ResourceController
{
    use ResponseFormat;

    public function index()
    {
        $db = \Config\Database::connect();

        $page = (int) ($this->request->getGet('page') ?? 1);
        $perPage = (int) ($this->request->getGet('per_page') ?? 20);
        $search = $this->request->getGet('search') ?? '';
        $tenantId = $this->request->getGet('tenant_id') ?? null;
        $type = $this->request->getGet('type') ?? null;
        $status = $this->request->getGet('status') ?? null;

        $builder = $db->table('locations');
        $builder->where('deleted_at', null);

        if (!empty($search)) {
            $builder->groupStart()
                ->like('name', $search)
                ->orLike('address', $search)
                ->orLike('city', $search)
                ->orLike('code', $search)
                ->groupEnd();
        }
        if ($tenantId) $builder->where('tenant_id', $tenantId);
        if ($type) $builder->where('type', $type);
        if ($status) $builder->where('status', $status);

        $total = $builder->countAllResults(false);
        $locations = $builder->orderBy('name', 'ASC')
            ->limit($perPage, ($page - 1) * $perPage)
            ->get()
            ->getResult();

        return $this->respondSuccess($locations, 'OK', [
            'current_page' => $page,
            'last_page'    => ceil($total / $perPage),
            'per_page'     => $perPage,
            'total'        => $total,
        ]);
    }

    public function create()
    {
        $json = $this->request->getJSON(true);

        $name = trim($json['name'] ?? '');
        $tenantId = $json['tenant_id'] ?? null;

        if (empty($name) || !$tenantId) {
            return $this->respondValidationError([
                'name'      => empty($name) ? ['Name is required.'] : null,
                'tenant_id' => !$tenantId ? ['Tenant ID is required.'] : null,
            ]);
        }

        $db = \Config\Database::connect();

        $code = trim($json['code'] ?? '');
        if (empty($code)) {
            $code = 'LOC-' . strtoupper(substr(md5(uniqid((string) time(), true)), 0, 6));
        }

        $db->table('locations')->insert([
            'code'              => $code,
            'tenant_id'         => $tenantId,
            'name'              => $name,
            'type'              => $json['type'] ?? 'masjid',
            'address'           => $json['address'] ?? null,
            'city'              => $json['city'] ?? null,
            'province'          => $json['province'] ?? null,
            'district'          => $json['district'] ?? null,
            'postal_code'       => $json['postal_code'] ?? null,
            'timezone'          => $json['timezone'] ?? 'Asia/Jakarta',
            'country'           => $json['country'] ?? 'ID',
            'latitude'          => $json['latitude'] ?? null,
            'longitude'         => $json['longitude'] ?? null,
            'contact_name'      => $json['contact_name'] ?? null,
            'contact_phone'     => $json['contact_phone'] ?? null,
            'contact_email'     => $json['contact_email'] ?? null,
            'logo_url'          => $json['logo_url'] ?? null,
            'cover_url'         => $json['cover_url'] ?? null,
            'maps_url'          => $json['maps_url'] ?? null,
            'operational_hours' => isset($json['operational_hours']) ? json_encode($json['operational_hours']) : null,
            'facilities'        => isset($json['facilities']) ? json_encode($json['facilities']) : null,
            'status'            => $json['status'] ?? 'active',
            'created_at'        => date('Y-m-d H:i:s'),
            'updated_at'        => date('Y-m-d H:i:s'),
        ]);

        $locationId = $db->insertID();
        $location = $db->table('locations')->where('id', $locationId)->get()->getRow();

        // Pre-generate a reusable QRIS as soon as the tenant location exists.
        // The operation is idempotent and must not block location creation if
        // Xendit is temporarily unavailable.
        $staticQrReady = false;
        try {
            (new PaymentService())->createStaticQR(
                'STATIC-T' . $tenantId . '-L' . $locationId,
                (int) $tenantId,
                (int) $locationId
            );
            $staticQrReady = true;
        } catch (\Throwable $e) {
            log_message('warning', 'Static QR pre-generation failed for location ' . $locationId . ': ' . $e->getMessage());
        }

        $responseLocation = (array) $location;
        $responseLocation['static_qr_ready'] = $staticQrReady;

        return $this->respondCreated($responseLocation, 'Location created successfully.');
    }

    public function show($id = null)
    {
        $db = \Config\Database::connect();

        $location = $db->table('locations')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$location) {
            return $this->respondNotFound('Location not found.');
        }

        return $this->respondSuccess($location);
    }

    public function update($id = null)
    {
        $db = \Config\Database::connect();

        $location = $db->table('locations')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$location) {
            return $this->respondNotFound('Location not found.');
        }

        $json = $this->request->getJSON(true);

        $updateData = [
            'updated_at' => date('Y-m-d H:i:s'),
        ];

        $updatableFields = [
            'name', 'address', 'city', 'province', 'district', 'postal_code',
            'latitude', 'longitude', 'status', 'type', 'timezone', 'country',
            'contact_name', 'contact_phone', 'contact_email',
            'logo_url', 'cover_url', 'maps_url', 'code',
        ];

        foreach ($updatableFields as $field) {
            if (isset($json[$field])) {
                $updateData[$field] = in_array($field, ['name', 'address', 'contact_name', 'contact_email', 'code'])
                    ? trim($json[$field])
                    : $json[$field];
            }
        }

        if (isset($json['operational_hours'])) {
            $updateData['operational_hours'] = json_encode($json['operational_hours']);
        }
        if (isset($json['facilities'])) {
            $updateData['facilities'] = json_encode($json['facilities']);
        }

        $db->table('locations')->where('id', $id)->update($updateData);

        $updated = $db->table('locations')->where('id', $id)->get()->getRow();

        return $this->respondUpdated($updated, 'Location updated successfully.');
    }

    public function delete($id = null)
    {
        $db = \Config\Database::connect();

        $location = $db->table('locations')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$location) {
            return $this->respondNotFound('Location not found.');
        }

        $db->table('locations')->where('id', $id)->update([
            'deleted_at' => date('Y-m-d H:i:s'),
        ]);

        return $this->respondDeleted(null, 'Location deleted successfully.');
    }

    public function submit($id = null)
    {
        $db = \Config\Database::connect();

        $location = $db->table('locations')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$location) {
            return $this->respondNotFound('Location not found.');
        }

        $db->table('locations')->where('id', $id)->update([
            'status'       => 'pending_review',
            'submitted_at' => date('Y-m-d H:i:s'),
            'updated_at'   => date('Y-m-d H:i:s'),
        ]);

        $updated = $db->table('locations')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Location submitted for review.');
    }

    public function approve($id = null)
    {
        $db = \Config\Database::connect();

        $location = $db->table('locations')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$location) {
            return $this->respondNotFound('Location not found.');
        }

        $userId = $this->request->userId ?? null;

        $db->table('locations')->where('id', $id)->update([
            'status'       => 'active',
            'reviewed_at'  => date('Y-m-d H:i:s'),
            'reviewed_by'  => $userId,
            'updated_at'   => date('Y-m-d H:i:s'),
        ]);

        $updated = $db->table('locations')->where('id', $id)->get()->getRow();

        // Also backfill QRIS for locations that existed before automatic
        // pre-generation was enabled.
        $staticQrReady = false;
        try {
            (new PaymentService())->createStaticQR(
                'STATIC-T' . $updated->tenant_id . '-L' . $updated->id,
                (int) $updated->tenant_id,
                (int) $updated->id
            );
            $staticQrReady = true;
        } catch (\Throwable $e) {
            log_message('warning', 'Static QR pre-generation failed after location approval ' . $id . ': ' . $e->getMessage());
        }

        $responseLocation = (array) $updated;
        $responseLocation['static_qr_ready'] = $staticQrReady;
        return $this->respondUpdated($responseLocation, 'Location approved.');
    }
}
