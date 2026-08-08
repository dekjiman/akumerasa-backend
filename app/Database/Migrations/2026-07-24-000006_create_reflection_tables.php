<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateReflectionTables extends Migration
{
    public function up()
    {
        // Reflection Sessions
        $this->forge->addField([
            'id'             => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'kiosk_id'       => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'location_id'    => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'tenant_id'      => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'visitor_name'   => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'visitor_email'  => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'emotion_id'     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'context_id'     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'cause_id'       => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'story'          => ['type' => 'TEXT', 'null' => true],
            'status'         => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'in_progress'],
            'created_at'     => ['type' => 'DATETIME'],
            'updated_at'     => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('kiosk_id');
        $this->forge->addKey('location_id');
        $this->forge->addKey('tenant_id');
        $this->forge->createTable('reflection_sessions');
        $this->forge->reset();

        // Reflection Results
        $this->forge->addField([
            'id'               => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'session_id'       => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'token'            => ['type' => 'VARCHAR', 'constraint' => 64, 'unique' => true],
            'verse_id'         => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'hadith_id'        => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'advice'           => ['type' => 'TEXT', 'null' => true],
            'reflection_guide' => ['type' => 'TEXT', 'null' => true],
            'printed'          => ['type' => 'BOOLEAN', 'default' => false],
            'created_at'       => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('session_id');
        $this->forge->createTable('reflection_results');
        $this->forge->reset();

        // Kiosk Tokens
        $this->forge->addField([
            'id'           => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'kiosk_id'     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'token_hash'   => ['type' => 'VARCHAR', 'constraint' => 64],
            'expires_at'   => ['type' => 'DATETIME'],
            'revoked_at'   => ['type' => 'DATETIME', 'null' => true],
            'created_at'   => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('kiosk_id');
        $this->forge->addKey('token_hash');
        $this->forge->createTable('kiosk_tokens');
        $this->forge->reset();

        // User Sessions
        $this->forge->addField([
            'id'                  => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'user_id'             => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'token_hash'          => ['type' => 'VARCHAR', 'constraint' => 64],
            'refresh_token_hash'  => ['type' => 'VARCHAR', 'constraint' => 64],
            'device_fingerprint'  => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'expires_at'          => ['type' => 'DATETIME'],
            'revoked_at'          => ['type' => 'DATETIME', 'null' => true],
            'created_at'          => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('user_id');
        $this->forge->addKey('token_hash');
        $this->forge->createTable('user_sessions');
        $this->forge->reset();

        // Kiosk Heartbeats
        $this->forge->addField([
            'id'             => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'kiosk_id'       => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'storage_used'   => ['type' => 'INT', 'constraint' => 11, 'null' => true],
            'network_status' => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'online'],
            'printer_state'  => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'created_at'     => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('kiosk_id');
        $this->forge->createTable('kiosk_heartbeats');
        $this->forge->reset();
    }

    public function down()
    {
        $this->forge->dropTable('kiosk_heartbeats');
        $this->forge->dropTable('user_sessions');
        $this->forge->dropTable('kiosk_tokens');
        $this->forge->dropTable('reflection_results');
        $this->forge->dropTable('reflection_sessions');
    }
}
