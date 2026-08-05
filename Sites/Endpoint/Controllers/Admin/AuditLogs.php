<?php

namespace Sites\Endpoint\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class AuditLogs extends ResourceController
{
    use ResponseFormat;

    public function index()
    {
        $db = \Config\Database::connect();
        $page = (int) ($this->request->getGet('page') ?? 1);
        $perPage = (int) ($this->request->getGet('per_page') ?? 20);
        $userId = $this->request->getGet('user_id') ?? null;
        $action = $this->request->getGet('action') ?? null;
        $resourceType = $this->request->getGet('resource_type') ?? null;

        $builder = $db->table('audit_logs');
        if ($userId) $builder->where('user_id', $userId);
        if ($action) $builder->where('action', $action);
        if ($resourceType) $builder->where('resource_type', $resourceType);

        $total = $builder->countAllResults(false);
        $logs = $builder->orderBy('created_at', 'DESC')
            ->limit($perPage, ($page - 1) * $perPage)->get()->getResult();

        return $this->respondSuccess($logs, 'OK', [
            'current_page' => $page, 'last_page' => ceil($total / $perPage),
            'per_page' => $perPage, 'total' => $total,
        ]);
    }

    public function show($id = null)
    {
        $db = \Config\Database::connect();
        $log = $db->table('audit_logs')->where('id', $id)->get()->getRow();
        if (!$log) return $this->respondNotFound('Audit log not found.');
        return $this->respondSuccess($log);
    }
}
