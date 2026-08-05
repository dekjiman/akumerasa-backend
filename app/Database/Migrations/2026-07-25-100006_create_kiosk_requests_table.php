<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateKioskRequestsTable extends Migration
{
    public function up()
    {
        if ($this->db->tableExists('kiosk_requests')) {
            return;
        }

        $this->forge->addField([
            'id'                => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'request_number'    => ['type' => 'VARCHAR', 'constraint' => 30, 'unique' => true],
            'tenant_id'         => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'location_id'       => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'requested_by'      => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'request_type'      => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'new'],
            'platform'          => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'windows_electron'],
            'printer_type'      => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'thermal_80mm'],
            'quantity'          => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'default' => 1],
            'donation_mode'     => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'optional'],
            'sponsor_enabled'   => ['type' => 'BOOLEAN', 'default' => false],
            'priority'          => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'normal'],
            'status'            => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'draft'],
            'admin_notes'       => ['type' => 'TEXT', 'null' => true],
            'reviewed_by'       => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'reviewed_at'       => ['type' => 'DATETIME', 'null' => true],
            'approved_at'       => ['type' => 'DATETIME', 'null' => true],
            'fulfilled_at'      => ['type' => 'DATETIME', 'null' => true],
            'kiosk_id'          => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'created_at'        => ['type' => 'DATETIME'],
            'updated_at'        => ['type' => 'DATETIME'],
            'deleted_at'        => ['type' => 'DATETIME', 'null' => true],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('tenant_id');
        $this->forge->addKey('location_id');
        $this->forge->addKey('requested_by');
        $this->forge->addKey('status');
        $this->forge->createTable('kiosk_requests');
    }

    public function down()
    {
        $this->forge->dropTable('kiosk_requests');
    }
}
