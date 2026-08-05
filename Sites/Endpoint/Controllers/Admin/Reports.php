<?php

namespace Sites\Endpoint\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class Reports extends ResourceController
{
    use ResponseFormat;

    public function overview()
    {
        $db = \Config\Database::connect();

        $totalTenants = $db->table('tenants')->where('deleted_at', null)->countAllResults();
        $totalLocations = $db->table('locations')->where('deleted_at', null)->countAllResults();
        $totalKiosks = $db->table('kiosks')->where('deleted_at', null)->countAllResults();
        $activeKiosks = $db->table('kiosks')->where('status', 'active')->where('deleted_at', null)->countAllResults();
        $totalSessions = $db->table('reflection_sessions')->countAllResults();
        $todaySessions = $db->table('reflection_sessions')->where('DATE(created_at)', date('Y-m-d'))->countAllResults();
        $totalDonations = $db->table('donations')->where('status', 'paid')->select('SUM(amount) as total')->get()->getRow()->total ?? 0;
        $todayDonations = $db->table('donations')->where('status', 'paid')->where('DATE(created_at)', date('Y-m-d'))->select('SUM(amount) as total')->get()->getRow()->total ?? 0;

        return $this->respondSuccess([
            'tenants'       => ['total' => $totalTenants],
            'locations'     => ['total' => $totalLocations],
            'kiosks'        => ['total' => $totalKiosks, 'active' => $activeKiosks],
            'sessions'      => ['total' => $totalSessions, 'today' => $todaySessions],
            'donations'     => ['total' => $totalDonations ?? 0, 'today' => $todayDonations ?? 0],
        ]);
    }

    public function sessions()
    {
        $db = \Config\Database::connect();
        $startDate = $this->request->getGet('start_date') ?? date('Y-m-d', strtotime('-30 days'));
        $endDate = $this->request->getGet('end_date') ?? date('Y-m-d');
        $tenantId = $this->request->getGet('tenant_id') ?? null;
        $locationId = $this->request->getGet('location_id') ?? null;

        $builder = $db->table('reflection_sessions');
        $builder->where('DATE(created_at) >=', $startDate);
        $builder->where('DATE(created_at) <=', $endDate);
        if ($tenantId) $builder->where('tenant_id', $tenantId);
        if ($locationId) $builder->where('location_id', $locationId);

        $sessions = $builder->select('DATE(created_at) as date, COUNT(*) as count')
            ->groupBy('DATE(created_at)')
            ->orderBy('date', 'ASC')
            ->get()->getResult();

        return $this->respondSuccess($sessions);
    }

    public function donations()
    {
        $db = \Config\Database::connect();
        $startDate = $this->request->getGet('start_date') ?? date('Y-m-d', strtotime('-30 days'));
        $endDate = $this->request->getGet('end_date') ?? date('Y-m-d');

        $donations = $db->table('donations')
            ->where('status', 'paid')
            ->where('DATE(created_at) >=', $startDate)
            ->where('DATE(created_at) <=', $endDate)
            ->select('DATE(created_at) as date, COUNT(*) as count, SUM(amount) as total_amount')
            ->groupBy('DATE(created_at)')
            ->orderBy('date', 'ASC')
            ->get()->getResult();

        return $this->respondSuccess($donations);
    }
}
