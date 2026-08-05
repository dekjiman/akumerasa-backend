<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class AddReflectionContentTagsAndDonationLocation extends Migration
{
    public function up()
    {
        if (!$this->db->fieldExists('tags', 'hadiths')) {
            $this->forge->addColumn('hadiths', [
                'tags' => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true, 'after' => 'source'],
            ]);
        }

        if (!$this->db->fieldExists('location_id', 'donations')) {
            $this->forge->addColumn('donations', [
                'location_id' => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true, 'after' => 'tenant_id'],
            ]);
        }
    }

    public function down()
    {
        if ($this->db->fieldExists('tags', 'hadiths')) $this->forge->dropColumn('hadiths', 'tags');
        if ($this->db->fieldExists('location_id', 'donations')) $this->forge->dropColumn('donations', 'location_id');
    }
}