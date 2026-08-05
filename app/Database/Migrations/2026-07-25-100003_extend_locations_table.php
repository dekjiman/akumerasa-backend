<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class ExtendLocationsTable extends Migration
{
    public function up()
    {
        $fields = [
            'code'              => ['type' => 'VARCHAR', 'constraint' => 50, 'unique' => true, 'after' => 'id'],
            'type'              => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'masjid', 'after' => 'name'],
            'district'          => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true, 'after' => 'province'],
            'postal_code'       => ['type' => 'VARCHAR', 'constraint' => 10, 'null' => true, 'after' => 'district'],
            'timezone'          => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'Asia/Jakarta', 'after' => 'postal_code'],
            'country'           => ['type' => 'CHAR', 'constraint' => 2, 'default' => 'ID', 'after' => 'timezone'],
            'contact_name'      => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true, 'after' => 'country'],
            'contact_phone'     => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true, 'after' => 'contact_name'],
            'contact_email'     => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true, 'after' => 'contact_phone'],
            'logo_url'          => ['type' => 'VARCHAR', 'constraint' => 500, 'null' => true, 'after' => 'contact_email'],
            'cover_url'         => ['type' => 'VARCHAR', 'constraint' => 500, 'null' => true, 'after' => 'logo_url'],
            'maps_url'          => ['type' => 'VARCHAR', 'constraint' => 500, 'null' => true, 'after' => 'cover_url'],
            'operational_hours' => ['type' => 'JSON', 'null' => true, 'after' => 'maps_url'],
            'facilities'        => ['type' => 'JSON', 'null' => true, 'after' => 'operational_hours'],
            'submitted_at'      => ['type' => 'DATETIME', 'null' => true, 'after' => 'status'],
            'reviewed_at'       => ['type' => 'DATETIME', 'null' => true, 'after' => 'submitted_at'],
            'reviewed_by'       => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true, 'after' => 'reviewed_at'],
        ];

        foreach ($fields as $name => $definition) {
            if (!$this->db->fieldExists($name, 'locations')) {
                $this->forge->addColumn('locations', [$name => $definition]);
            }
        }
    }

    public function down()
    {
        $this->forge->dropColumn('locations', [
            'code', 'type', 'district', 'postal_code', 'timezone', 'country',
            'contact_name', 'contact_phone', 'contact_email',
            'logo_url', 'cover_url', 'maps_url',
            'operational_hours', 'facilities',
            'submitted_at', 'reviewed_at', 'reviewed_by',
        ]);
    }
}
