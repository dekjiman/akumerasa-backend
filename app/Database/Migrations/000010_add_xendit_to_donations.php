<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class AddXenditToDonations extends Migration
{
    public function up()
    {
        // Add Xendit fields to donations
        $this->forge->addColumn('donations', [
            'xendit_qr_id'             => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'xendit_external_id'       => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'xendit_payment_request_id'=> ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'qr_type'                  => ['type' => 'VARCHAR', 'constraint' => 20, 'null' => true],
            'channel_code'             => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'va_number'                => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'bank_code'                => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'payment_details'          => ['type' => 'JSON', 'null' => true],
            'expires_at'               => ['type' => 'DATETIME', 'null' => true],
            'failure_code'             => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
        ]);

        $this->forge->addKey('xendit_external_id');
        $this->forge->addKey('xendit_payment_request_id');
        $this->forge->addKey('expires_at');

        // Create xendit_static_qrs table
        $this->forge->addField([
            'id'            => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'xendit_qr_id'  => ['type' => 'VARCHAR', 'constraint' => 100],
            'external_id'   => ['type' => 'VARCHAR', 'constraint' => 100, 'unique' => true],
            'qr_string'     => ['type' => 'TEXT'],
            'tenant_id'     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'location_id'   => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'status'        => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'active'],
            'created_at'    => ['type' => 'DATETIME'],
            'updated_at'    => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('external_id');
        $this->forge->addKey('tenant_id');
        $this->forge->createTable('xendit_static_qrs');
    }

    public function down()
    {
        $this->forge->dropTable('xendit_static_qrs');

        $cols = [
            'xendit_qr_id', 'xendit_external_id', 'xendit_payment_request_id',
            'qr_type', 'channel_code', 'va_number', 'bank_code',
            'payment_details', 'expires_at', 'failure_code',
        ];
        $this->forge->dropColumn('donations', $cols);
    }
}
