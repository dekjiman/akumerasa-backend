<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class ExtendTenantsTable extends Migration
{
    public function up()
    {
        $fields = [
            'type'                 => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'masjid', 'after' => 'slug'],
            'owner_user_id'        => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true, 'after' => 'type'],
            'logo_url'             => ['type' => 'VARCHAR', 'constraint' => 500, 'null' => true, 'after' => 'owner_user_id'],
            'cover_url'            => ['type' => 'VARCHAR', 'constraint' => 500, 'null' => true, 'after' => 'logo_url'],
            'bio'                  => ['type' => 'TEXT', 'null' => true, 'after' => 'cover_url'],
            'website_url'          => ['type' => 'VARCHAR', 'constraint' => 500, 'null' => true, 'after' => 'bio'],
            'social_links'         => ['type' => 'JSON', 'null' => true, 'after' => 'website_url'],
            'verification_status'  => ['type' => 'VARCHAR', 'constraint' => 30, 'default' => 'pending', 'after' => 'status'],
            'verification_notes'   => ['type' => 'TEXT', 'null' => true, 'after' => 'verification_status'],
            'submitted_at'         => ['type' => 'DATETIME', 'null' => true, 'after' => 'verification_notes'],
            'reviewed_at'          => ['type' => 'DATETIME', 'null' => true, 'after' => 'submitted_at'],
            'reviewed_by'          => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true, 'after' => 'reviewed_at'],
        ];
        $this->forge->addColumn('tenants', $fields);
        $this->forge->addKey('verification_status');
        $this->forge->addKey('owner_user_id');
        $this->forge->addKey('type');
    }

    public function down()
    {
        $this->forge->dropColumn('tenants', [
            'type', 'owner_user_id', 'logo_url', 'cover_url', 'bio',
            'website_url', 'social_links', 'verification_status',
            'verification_notes', 'submitted_at', 'reviewed_at', 'reviewed_by',
        ]);
    }
}
