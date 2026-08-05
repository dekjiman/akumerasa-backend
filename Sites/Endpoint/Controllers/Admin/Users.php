<?php

namespace Sites\Endpoint\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class Users extends ResourceController
{
    use ResponseFormat;

    public function index()
    {
        $db = \Config\Database::connect();
        $page = (int) ($this->request->getGet('page') ?? 1);
        $perPage = (int) ($this->request->getGet('per_page') ?? 20);
        $search = $this->request->getGet('search') ?? '';
        $role = $this->request->getGet('role') ?? null;
        $tenantId = $this->request->getGet('tenant_id') ?? null;

        $builder = $db->table('users');
        $builder->where('deleted_at', null);

        if (!empty($search)) {
            $builder->groupStart()->like('name', $search)->orLike('email', $search)->groupEnd();
        }
        if ($role) $builder->where('role', $role);
        if ($tenantId) $builder->where('tenant_id', $tenantId);

        $total = $builder->countAllResults(false);
        $users = $builder->select('id, name, email, role, tenant_id, status, created_at, updated_at')
            ->orderBy('name', 'ASC')
            ->limit($perPage, ($page - 1) * $perPage)
            ->get()->getResult();

        return $this->respondSuccess($users, 'OK', [
            'current_page' => $page, 'last_page' => ceil($total / $perPage),
            'per_page' => $perPage, 'total' => $total,
        ]);
    }

    public function create()
    {
        $json = $this->request->getJSON(true);
        $name = trim($json['name'] ?? '');
        $email = trim($json['email'] ?? '');
        $password = $json['password'] ?? '';
        $role = $json['role'] ?? 'viewer';

        if (empty($name) || empty($email) || empty($password)) {
            return $this->respondValidationError('Name, email, and password are required.');
        }

        $db = \Config\Database::connect();
        $exists = $db->table('users')->where('email', $email)->where('deleted_at', null)->countAllResults();
        if ($exists > 0) return $this->respondError('Email already exists.', 422);

        $db->table('users')->insert([
            'name'           => $name,
            'email'          => $email,
            'password_hash'  => password_hash($password . env('HASH_KEY'), PASSWORD_BCRYPT),
            'role'           => $role,
            'tenant_id'      => $json['tenant_id'] ?? null,
            'status'         => 'active',
            'created_at'     => date('Y-m-d H:i:s'),
            'updated_at'     => date('Y-m-d H:i:s'),
        ]);

        $userId = $db->insertID();
        $user = $db->table('users')->where('id', $userId)->select('id, name, email, role, tenant_id, status')->get()->getRow();
        return $this->respondCreated($user, 'User created.');
    }

    public function show($id = null)
    {
        $db = \Config\Database::connect();
        $user = $db->table('users')->where('id', $id)->where('deleted_at', null)
            ->select('id, name, email, role, tenant_id, status, created_at, updated_at')->get()->getRow();
        if (!$user) return $this->respondNotFound('User not found.');
        return $this->respondSuccess($user);
    }

    public function update($id = null)
    {
        $db = \Config\Database::connect();
        $user = $db->table('users')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$user) return $this->respondNotFound('User not found.');

        $json = $this->request->getJSON(true);
        $updateData = ['updated_at' => date('Y-m-d H:i:s')];

        if (isset($json['name'])) $updateData['name'] = trim($json['name']);
        if (isset($json['email'])) $updateData['email'] = trim($json['email']);
        if (isset($json['role'])) $updateData['role'] = $json['role'];
        if (isset($json['tenant_id'])) $updateData['tenant_id'] = $json['tenant_id'];
        if (isset($json['status'])) $updateData['status'] = $json['status'];
        if (isset($json['password']) && !empty($json['password'])) {
            $updateData['password_hash'] = password_hash($json['password'] . env('HASH_KEY'), PASSWORD_BCRYPT);
        }

        $db->table('users')->where('id', $id)->update($updateData);
        $updated = $db->table('users')->where('id', $id)
            ->select('id, name, email, role, tenant_id, status')->get()->getRow();
        return $this->respondUpdated($updated, 'User updated.');
    }

    public function delete($id = null)
    {
        $db = \Config\Database::connect();
        $user = $db->table('users')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$user) return $this->respondNotFound('User not found.');

        $db->table('users')->where('id', $id)->update(['deleted_at' => date('Y-m-d H:i:s')]);
        return $this->respondDeleted(null, 'User deleted.');
    }
}
