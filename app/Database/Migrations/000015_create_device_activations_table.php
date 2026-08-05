<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateDeviceActivationsTable extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id'                     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'kiosk_id'               => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'activation_code_hash'   => ['type' => 'VARCHAR', 'constraint' => 255],
            'status'                 => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'pending'],
            'expires_at'             => ['type' => 'DATETIME'],
            'max_uses'               => ['type' => 'INT', 'constraint' => 11, 'default' => 1],
            'use_count'              => ['type' => 'INT', 'constraint' => 11, 'default' => 0],
            'used_at'                => ['type' => 'DATETIME', 'null' => true],
            'used_by_fingerprint'    => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'used_by_ip'             => ['type' => 'VARCHAR', 'constraint' => 45, 'null' => true],
            'created_by'             => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'revoked_at'             => ['type' => 'DATETIME', 'null' => true],
            'revoked_by'             => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'notes'                  => ['type' => 'TEXT', 'null' => true],
            'created_at'             => ['type' => 'DATETIME'],
            'updated_at'             => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('kiosk_id');
        $this->forge->addKey('activation_code_hash');
        $this->forge->addKey('status');
        $this->forge->addKey('expires_at');
        $this->forge->createTable('device_activations');
    }

    public function down()
    {
        $this->forge->dropTable('device_activations');
    }
}
