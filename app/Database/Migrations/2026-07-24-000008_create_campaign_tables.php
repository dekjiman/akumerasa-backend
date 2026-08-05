<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateCampaignTables extends Migration
{
    public function up()
    {
        // Sponsors
        $this->forge->addField([
            'id'             => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'name'           => ['type' => 'VARCHAR', 'constraint' => 255],
            'contact_name'   => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'contact_email'  => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'phone'          => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'status'         => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'active'],
            'created_at'     => ['type' => 'DATETIME'],
            'updated_at'     => ['type' => 'DATETIME'],
            'deleted_at'     => ['type' => 'DATETIME', 'null' => true],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('sponsors');

        // Campaigns
        $this->forge->addField([
            'id'               => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'sponsor_id'       => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'name'             => ['type' => 'VARCHAR', 'constraint' => 255],
            'description'      => ['type' => 'TEXT', 'null' => true],
            'creative_url'     => ['type' => 'VARCHAR', 'constraint' => 500, 'null' => true],
            'placement'        => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'idle_screen'],
            'target_config'    => ['type' => 'JSON', 'null' => true],
            'schedule_config'  => ['type' => 'JSON', 'null' => true],
            'priority'         => ['type' => 'INT', 'constraint' => 11, 'default' => 0],
            'weight'           => ['type' => 'INT', 'constraint' => 11, 'default' => 1],
            'status'           => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'draft'],
            'valid_from'       => ['type' => 'DATETIME', 'null' => true],
            'valid_until'      => ['type' => 'DATETIME', 'null' => true],
            'created_at'       => ['type' => 'DATETIME'],
            'updated_at'       => ['type' => 'DATETIME'],
            'deleted_at'       => ['type' => 'DATETIME', 'null' => true],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('sponsor_id');
        $this->forge->addKey('status');
        $this->forge->createTable('campaigns');

        // Campaign Plays
        $this->forge->addField([
            'id'           => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'campaign_id'  => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'kiosk_id'     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'placement'    => ['type' => 'VARCHAR', 'constraint' => 50],
            'started_at'   => ['type' => 'DATETIME', 'null' => true],
            'completed_at' => ['type' => 'DATETIME', 'null' => true],
            'duration_ms'  => ['type' => 'INT', 'constraint' => 11, 'null' => true],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('campaign_id');
        $this->forge->addKey('kiosk_id');
        $this->forge->createTable('campaign_plays');
    }

    public function down()
    {
        $this->forge->dropTable('campaign_plays');
        $this->forge->dropTable('campaigns');
        $this->forge->dropTable('sponsors');
    }
}
