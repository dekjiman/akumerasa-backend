<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class AddTenantDonorCampaignToDonations extends Migration
{
    public function up()
    {
        $this->forge->addColumn('donations', [
            'tenant_id'     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true, 'after' => 'session_id'],
            'donor_name'    => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true, 'after' => 'tenant_id'],
            'campaign_id'   => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true, 'after' => 'donor_name'],
        ]);

        $this->forge->addKey('tenant_id');
        $this->forge->addKey('campaign_id');
    }

    public function down()
    {
        $this->forge->dropColumn('donations', ['tenant_id', 'donor_name', 'campaign_id']);
    }
}
