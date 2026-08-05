<?php

namespace Sites\Endpoint\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class Tenants extends ResourceController
{
    use ResponseFormat;

    public function index()
    {
        $db = \Config\Database::connect();

        $page = (int) ($this->request->getGet('page') ?? 1);
        $perPage = (int) ($this->request->getGet('per_page') ?? 20);
        $search = $this->request->getGet('search') ?? '';
        $type = $this->request->getGet('type') ?? null;
        $status = $this->request->getGet('status') ?? null;
        $verificationStatus = $this->request->getGet('verification_status') ?? null;

        $builder = $db->table('tenants');
        $builder->where('deleted_at', null);

        if (!empty($search)) {
            $builder->groupStart()
                ->like('name', $search)
                ->orLike('contact_name', $search)
                ->orLike('contact_email', $search)
                ->groupEnd();
        }
        if ($type) $builder->where('type', $type);
        if ($status) $builder->where('status', $status);
        if ($verificationStatus) $builder->where('verification_status', $verificationStatus);

        $total = $builder->countAllResults(false);
        $tenants = $builder->orderBy('name', 'ASC')
            ->limit($perPage, ($page - 1) * $perPage)
            ->get()
            ->getResult();

        return $this->respondSuccess($tenants, 'OK', [
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
        if (empty($name)) {
            return $this->respondValidationError(['name' => ['Name is required.']]);
        }

        $db = \Config\Database::connect();

        $exists = $db->table('tenants')
            ->where('name', $name)
            ->where('deleted_at', null)
            ->countAllResults();

        if ($exists > 0) {
            return $this->respondError('Tenant with this name already exists.', 422);
        }

        $db->table('tenants')->insert([
            'name'                => $name,
            'slug'                => \CodeIgniter\I18n\Time::now()->getTimestamp() . '-' . url_title($name, '-', true),
            'type'                => $json['type'] ?? 'masjid',
            'owner_user_id'       => $json['owner_user_id'] ?? null,
            'contact_name'        => trim($json['contact_name'] ?? ''),
            'contact_email'       => trim($json['contact_email'] ?? ''),
            'phone'               => $json['phone'] ?? null,
            'address'             => $json['address'] ?? null,
            'logo_url'            => $json['logo_url'] ?? null,
            'cover_url'           => $json['cover_url'] ?? null,
            'bio'                 => $json['bio'] ?? null,
            'website_url'         => $json['website_url'] ?? null,
            'social_links'        => isset($json['social_links']) ? json_encode($json['social_links']) : null,
            'status'              => $json['status'] ?? 'active',
            'verification_status' => $json['verification_status'] ?? 'pending',
            'settings'            => json_encode($json['settings'] ?? []),
            'created_at'          => date('Y-m-d H:i:s'),
            'updated_at'          => date('Y-m-d H:i:s'),
        ]);

        $tenantId = $db->insertID();
        $tenant = $db->table('tenants')->where('id', $tenantId)->get()->getRow();

        return $this->respondCreated($tenant, 'Tenant created successfully.');
    }

    public function show($id = null)
    {
        $db = \Config\Database::connect();

        $tenant = $db->table('tenants')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$tenant) {
            return $this->respondNotFound('Tenant not found.');
        }

        return $this->respondSuccess($tenant);
    }

    public function update($id = null)
    {
        $db = \Config\Database::connect();

        $tenant = $db->table('tenants')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$tenant) {
            return $this->respondNotFound('Tenant not found.');
        }

        $json = $this->request->getJSON(true);

        $updateData = [
            'updated_at' => date('Y-m-d H:i:s'),
        ];

        $updatableFields = [
            'name', 'contact_name', 'contact_email', 'phone', 'address', 'status',
            'type', 'owner_user_id', 'logo_url', 'cover_url', 'bio', 'website_url',
            'verification_status', 'verification_notes',
        ];

        foreach ($updatableFields as $field) {
            if (isset($json[$field])) {
                $updateData[$field] = in_array($field, ['name', 'contact_name', 'contact_email', 'bio', 'verification_notes'])
                    ? trim($json[$field])
                    : $json[$field];
            }
        }

        if (isset($json['social_links'])) {
            $updateData['social_links'] = json_encode($json['social_links']);
        }
        if (isset($json['settings'])) {
            $updateData['settings'] = json_encode($json['settings']);
        }

        $db->table('tenants')->where('id', $id)->update($updateData);

        $updated = $db->table('tenants')->where('id', $id)->get()->getRow();

        return $this->respondUpdated($updated, 'Tenant updated successfully.');
    }

    public function delete($id = null)
    {
        $db = \Config\Database::connect();

        $tenant = $db->table('tenants')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$tenant) {
            return $this->respondNotFound('Tenant not found.');
        }

        $db->table('tenants')->where('id', $id)->update([
            'deleted_at' => date('Y-m-d H:i:s'),
        ]);

        return $this->respondDeleted(null, 'Tenant deleted successfully.');
    }

    public function submit($id = null)
    {
        $db = \Config\Database::connect();

        $tenant = $db->table('tenants')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$tenant) {
            return $this->respondNotFound('Tenant not found.');
        }

        $allowedStatuses = ['pending', 'rejected', 'revision'];
        if (!in_array($tenant->verification_status, $allowedStatuses)) {
            return $this->respondBusinessRuleError('Tenant cannot be submitted in current status: ' . $tenant->verification_status);
        }

        $db->table('tenants')->where('id', $id)->update([
            'verification_status' => 'submitted',
            'submitted_at'        => date('Y-m-d H:i:s'),
            'updated_at'          => date('Y-m-d H:i:s'),
        ]);

        $updated = $db->table('tenants')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Tenant submitted for verification.');
    }

    public function approve($id = null)
    {
        $db = \Config\Database::connect();

        $tenant = $db->table('tenants')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$tenant) {
            return $this->respondNotFound('Tenant not found.');
        }

        $userId = $this->request->userId ?? null;

        $db->table('tenants')->where('id', $id)->update([
            'verification_status' => 'approved',
            'status'              => 'active',
            'reviewed_at'         => date('Y-m-d H:i:s'),
            'reviewed_by'         => $userId,
            'updated_at'          => date('Y-m-d H:i:s'),
        ]);

        $updated = $db->table('tenants')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Tenant approved.');
    }

    public function requestRevision($id = null)
    {
        $db = \Config\Database::connect();

        $tenant = $db->table('tenants')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$tenant) {
            return $this->respondNotFound('Tenant not found.');
        }

        $json = $this->request->getJSON(true);
        $notes = trim($json['notes'] ?? '');

        if (empty($notes)) {
            return $this->respondValidationError(['notes' => ['Revision notes are required.']]);
        }

        $userId = $this->request->userId ?? null;

        $db->table('tenants')->where('id', $id)->update([
            'verification_status' => 'revision',
            'verification_notes'  => $notes,
            'reviewed_at'         => date('Y-m-d H:i:s'),
            'reviewed_by'         => $userId,
            'updated_at'          => date('Y-m-d H:i:s'),
        ]);

        $updated = $db->table('tenants')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Revision requested.');
    }

    public function reject($id = null)
    {
        $db = \Config\Database::connect();

        $tenant = $db->table('tenants')
            ->where('id', $id)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$tenant) {
            return $this->respondNotFound('Tenant not found.');
        }

        $json = $this->request->getJSON(true);
        $notes = trim($json['notes'] ?? '');

        if (empty($notes)) {
            return $this->respondValidationError(['notes' => ['Rejection reason is required.']]);
        }

        $userId = $this->request->userId ?? null;

        $db->table('tenants')->where('id', $id)->update([
            'verification_status' => 'rejected',
            'verification_notes'  => $notes,
            'reviewed_at'         => date('Y-m-d H:i:s'),
            'reviewed_by'         => $userId,
            'updated_at'          => date('Y-m-d H:i:s'),
        ]);

        $updated = $db->table('tenants')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Tenant rejected.');
    }
}
