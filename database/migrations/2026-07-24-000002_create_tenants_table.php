<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateTenantsTable extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id'             => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'name'           => ['type' => 'VARCHAR', 'constraint' => 255],
            'slug'           => ['type' => 'VARCHAR', 'constraint' => 255, 'unique' => true],
            'contact_name'   => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'contact_email'  => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'phone'          => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'address'        => ['type' => 'TEXT', 'null' => true],
            'status'         => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'active'],
            'settings'       => ['type' => 'JSON', 'null' => true],
            'created_at'     => ['type' => 'DATETIME'],
            'updated_at'     => ['type' => 'DATETIME'],
            'deleted_at'     => ['type' => 'DATETIME', 'null' => true],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('tenants');
    }

    public function down()
    {
        $this->forge->dropTable('tenants');
    }
}
