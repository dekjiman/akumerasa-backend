<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateAuditTables extends Migration
{
    public function up()
    {
        // Audit Logs
        $this->forge->addField([
            'id'            => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'user_id'       => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'action'        => ['type' => 'VARCHAR', 'constraint' => 50],
            'resource_type' => ['type' => 'VARCHAR', 'constraint' => 50],
            'resource_id'   => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'old_data'      => ['type' => 'JSON', 'null' => true],
            'new_data'      => ['type' => 'JSON', 'null' => true],
            'ip_address'    => ['type' => 'VARCHAR', 'constraint' => 45, 'null' => true],
            'user_agent'    => ['type' => 'VARCHAR', 'constraint' => 500, 'null' => true],
            'created_at'    => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('user_id');
        $this->forge->addKey('action');
        $this->forge->addKey('resource_type');
        $this->forge->addKey('created_at');
        $this->forge->createTable('audit_logs');

        // Roles
        $this->forge->addField([
            'id'          => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'name'        => ['type' => 'VARCHAR', 'constraint' => 50, 'unique' => true],
            'description' => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'created_at'  => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('roles');

        // Role Permissions
        $this->forge->addField([
            'id'          => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'role_id'     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'permission'  => ['type' => 'VARCHAR', 'constraint' => 100],
            'created_at'  => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('role_id');
        $this->forge->createTable('role_permissions');

        // Print Jobs
        $this->forge->addField([
            'id'            => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'session_id'    => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'result_id'     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'kiosk_id'      => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'status'        => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'pending'],
            'retry_count'   => ['type' => 'INT', 'constraint' => 11, 'default' => 0],
            'error_message' => ['type' => 'TEXT', 'null' => true],
            'completed_at'  => ['type' => 'DATETIME', 'null' => true],
            'created_at'    => ['type' => 'DATETIME'],
            'updated_at'    => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('session_id');
        $this->forge->addKey('kiosk_id');
        $this->forge->createTable('print_jobs');
    }

    public function down()
    {
        $this->forge->dropTable('print_jobs');
        $this->forge->dropTable('role_permissions');
        $this->forge->dropTable('roles');
        $this->forge->dropTable('audit_logs');
    }
}
