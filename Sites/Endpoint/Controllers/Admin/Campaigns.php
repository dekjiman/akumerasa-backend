<?php

namespace Sites\Endpoint\Controllers\Admin;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class Campaigns extends ResourceController
{
    use ResponseFormat;

    public function index()
    {
        $db = \Config\Database::connect();
        $page = (int) ($this->request->getGet('page') ?? 1);
        $perPage = (int) ($this->request->getGet('per_page') ?? 20);
        $status = $this->request->getGet('status') ?? null;

        $builder = $db->table('campaigns');
        $builder->where('deleted_at', null);
        if ($status) $builder->where('status', $status);

        $total = $builder->countAllResults(false);
        $campaigns = $builder->orderBy('created_at', 'DESC')
            ->limit($perPage, ($page - 1) * $perPage)->get()->getResult();

        return $this->respondSuccess($campaigns, 'OK', [
            'current_page' => $page, 'last_page' => ceil($total / $perPage),
            'per_page' => $perPage, 'total' => $total,
        ]);
    }

    public function create()
    {
        $json = $this->request->getJSON(true);
        $name = trim($json['name'] ?? '');
        $sponsorId = $json['sponsor_id'] ?? null;

        if (empty($name) || !$sponsorId) {
            return $this->respondValidationError('name and sponsor_id are required.');
        }

        $db = \Config\Database::connect();
        $db->table('campaigns')->insert([
            'sponsor_id'      => $sponsorId,
            'name'            => $name,
            'description'     => $json['description'] ?? null,
            'creative_url'    => $json['creative_url'] ?? null,
            'placement'       => $json['placement'] ?? 'idle_screen',
            'target_config'   => json_encode($json['target_config'] ?? []),
            'schedule_config' => json_encode($json['schedule_config'] ?? []),
            'priority'        => $json['priority'] ?? 0,
            'weight'          => $json['weight'] ?? 1,
            'status'          => $json['status'] ?? 'draft',
            'valid_from'      => $json['valid_from'] ?? null,
            'valid_until'     => $json['valid_until'] ?? null,
            'created_at'      => date('Y-m-d H:i:s'),
            'updated_at'      => date('Y-m-d H:i:s'),
        ]);

        $campaignId = $db->insertID();
        $campaign = $db->table('campaigns')->where('id', $campaignId)->get()->getRow();
        return $this->respondCreated($campaign, 'Campaign created.');
    }

    public function show($id = null)
    {
        $db = \Config\Database::connect();
        $campaign = $db->table('campaigns')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$campaign) return $this->respondNotFound('Campaign not found.');
        return $this->respondSuccess($campaign);
    }

    public function update($id = null)
    {
        $db = \Config\Database::connect();
        $campaign = $db->table('campaigns')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$campaign) return $this->respondNotFound('Campaign not found.');

        $json = $this->request->getJSON(true);
        $updateData = ['updated_at' => date('Y-m-d H:i:s')];

        if (isset($json['name'])) $updateData['name'] = trim($json['name']);
        if (isset($json['description'])) $updateData['description'] = $json['description'];
        if (isset($json['creative_url'])) $updateData['creative_url'] = $json['creative_url'];
        if (isset($json['placement'])) $updateData['placement'] = $json['placement'];
        if (isset($json['target_config'])) $updateData['target_config'] = json_encode($json['target_config']);
        if (isset($json['schedule_config'])) $updateData['schedule_config'] = json_encode($json['schedule_config']);
        if (isset($json['priority'])) $updateData['priority'] = $json['priority'];
        if (isset($json['weight'])) $updateData['weight'] = $json['weight'];
        if (isset($json['status'])) $updateData['status'] = $json['status'];
        if (isset($json['valid_from'])) $updateData['valid_from'] = $json['valid_from'];
        if (isset($json['valid_until'])) $updateData['valid_until'] = $json['valid_until'];

        $db->table('campaigns')->where('id', $id)->update($updateData);
        $updated = $db->table('campaigns')->where('id', $id)->get()->getRow();
        return $this->respondUpdated($updated, 'Campaign updated.');
    }

    public function delete($id = null)
    {
        $db = \Config\Database::connect();
        $campaign = $db->table('campaigns')->where('id', $id)->where('deleted_at', null)->get()->getRow();
        if (!$campaign) return $this->respondNotFound('Campaign not found.');

        $db->table('campaigns')->where('id', $id)->update(['deleted_at' => date('Y-m-d H:i:s')]);
        return $this->respondDeleted(null, 'Campaign deleted.');
    }
}
