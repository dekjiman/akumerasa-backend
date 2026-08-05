<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateKiosksTable extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id'                => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'location_id'       => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'tenant_id'         => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'kiosk_code'        => ['type' => 'VARCHAR', 'constraint' => 50, 'unique' => true],
            'device_secret_hash' => ['type' => 'VARCHAR', 'constraint' => 255],
            'app_version'       => ['type' => 'VARCHAR', 'constraint' => 20, 'null' => true],
            'status'            => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'active'],
            'printer_status'    => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'unknown'],
            'last_seen'         => ['type' => 'DATETIME', 'null' => true],
            'created_at'        => ['type' => 'DATETIME'],
            'updated_at'        => ['type' => 'DATETIME'],
            'deleted_at'        => ['type' => 'DATETIME', 'null' => true],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('location_id');
        $this->forge->addKey('tenant_id');
        $this->forge->createTable('kiosks');
    }

    public function down()
    {
        $this->forge->dropTable('kiosks');
    }
}
