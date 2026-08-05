<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateUserRoleAssignmentsTable extends Migration
{
    public function up()
    {
        if ($this->db->tableExists('user_role_assignments')) {
            return;
        }

        $this->forge->addField([
            'id'            => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'user_id'       => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'role_id'       => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'scope_type'    => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'global'],
            'scope_id'      => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'tenant_id'     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'valid_from'    => ['type' => 'DATETIME', 'null' => true],
            'valid_until'   => ['type' => 'DATETIME', 'null' => true],
            'status'        => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'active'],
            'created_at'    => ['type' => 'DATETIME'],
            'updated_at'    => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('user_id');
        $this->forge->addKey('role_id');
        $this->forge->addKey('tenant_id');
        $this->forge->createTable('user_role_assignments');
    }

    public function down()
    {
        $this->forge->dropTable('user_role_assignments');
    }
}
