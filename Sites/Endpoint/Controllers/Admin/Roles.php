<?php

namespace Sites\Endpoint\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class Roles extends ResourceController
{
    use ResponseFormat;

    public function index()
    {
        $db = \Config\Database::connect();
        $roles = $db->table('roles')->orderBy('name', 'ASC')->get()->getResult();
        return $this->respondSuccess($roles);
    }

    public function permissions($id = null)
    {
        $db = \Config\Database::connect();
        $role = $db->table('roles')->where('id', $id)->get()->getRow();
        if (!$role) return $this->respondNotFound('Role not found.');

        $permissions = $db->table('role_permissions')
            ->where('role_id', $id)
            ->get()->getResult();

        return $this->respondSuccess(['role' => $role, 'permissions' => $permissions]);
    }

    public function updatePermissions($id = null)
    {
        $db = \Config\Database::connect();
        $role = $db->table('roles')->where('id', $id)->get()->getRow();
        if (!$role) return $this->respondNotFound('Role not found.');

        $json = $this->request->getJSON(true);
        $permissions = $json['permissions'] ?? [];

        $db->table('role_permissions')->where('role_id', $id)->delete();

        foreach ($permissions as $perm) {
            $db->table('role_permissions')->insert([
                'role_id'     => $id,
                'permission'  => $perm,
                'created_at'  => date('Y-m-d H:i:s'),
            ]);
        }

        return $this->respondUpdated(null, 'Permissions updated.');
    }
}
