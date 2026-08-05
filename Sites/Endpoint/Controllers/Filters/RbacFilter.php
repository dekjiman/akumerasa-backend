<?php

namespace Sites\Endpoint\Controllers\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

class RbacFilter implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null): ?ResponseInterface
    {
        if (empty($arguments)) {
            return null;
        }

        $userId = $request->userId ?? null;
        if (!$userId) {
            return $this->getErrorResponse('Unauthorized.', 401);
        }

        $requiredPermissions = $arguments;
        $userPermissions = $this->getUserPermissions($userId);

        foreach ($requiredPermissions as $perm) {
            if (in_array('*', $userPermissions) || in_array($perm, $userPermissions)) {
                return null;
            }
        }

        return $this->getErrorResponse('Forbidden: insufficient permissions.', 403);
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null): ?ResponseInterface
    {
        return null;
    }

    private function getUserPermissions(int $userId): array
    {
        $db = \Config\Database::connect();

        $now = date('Y-m-d H:i:s');
        $assignments = $db->table('user_role_assignments')
            ->select('role_id')
            ->where('user_id', $userId)
            ->where('status', 'active')
            ->groupStart()
                ->where('valid_from IS NULL')
                ->orWhere('valid_from <=', $now)
            ->groupEnd()
            ->groupStart()
                ->where('valid_until IS NULL')
                ->orWhere('valid_until >=', $now)
            ->groupEnd()
            ->get()
            ->getResultArray();

        if (empty($assignments)) {
            $user = $db->table('users')->where('id', $userId)->get()->getRow();
            $legacyRole = $user->role ?? 'viewer';
            $perms = $db->table('role_permissions')
                ->select('permission')
                ->distinct(true)
                ->join('roles', 'roles.id = role_permissions.role_id')
                ->where('roles.name', $legacyRole)
                ->get()
                ->getResultArray();
            return array_column($perms, 'permission');
        }

        $roleIds = array_column($assignments, 'role_id');
        $perms = $db->table('role_permissions')
            ->select('permission')
            ->distinct(true)
            ->whereIn('role_id', $roleIds)
            ->get()
            ->getResultArray();

        return array_column($perms, 'permission');
    }

    private function getErrorResponse(string $message, int $code): ResponseInterface
    {
        $response = \Config\Services::response();
        return $response
            ->setStatusCode($code)
            ->setJSON([
                'success' => false,
                'message' => $message,
                'data'    => null,
                'meta'    => null,
                'errors'  => null,
            ]);
    }
}
