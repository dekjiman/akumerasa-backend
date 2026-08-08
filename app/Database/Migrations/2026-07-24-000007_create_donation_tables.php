<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateDonationTables extends Migration
{
    public function up()
    {
        // Donations
        $this->forge->addField([
            'id'             => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'session_id'     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'amount'         => ['type' => 'DECIMAL', 'constraint' => '12,2'],
            'payment_method' => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'qris'],
            'reference'      => ['type' => 'VARCHAR', 'constraint' => 100, 'unique' => true],
            'qr_data'        => ['type' => 'TEXT', 'null' => true],
            'status'         => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'pending'],
            'provider_ref'   => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'paid_at'        => ['type' => 'DATETIME', 'null' => true],
            'created_at'     => ['type' => 'DATETIME'],
            'updated_at'     => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('session_id');
        $this->forge->addKey('status');
        $this->forge->createTable('donations');

        // Payment Webhooks
        $this->forge->addField([
            'id'           => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'donation_id'  => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true],
            'provider'     => ['type' => 'VARCHAR', 'constraint' => 50],
            'payload'      => ['type' => 'JSON'],
            'signature'    => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'processed_at' => ['type' => 'DATETIME'],
            'created_at'   => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('donation_id');
        $this->forge->createTable('payment_webhooks');
    }

    public function down()
    {
        $this->forge->dropTable('payment_webhooks');
        $this->forge->dropTable('donations');
    }
}
