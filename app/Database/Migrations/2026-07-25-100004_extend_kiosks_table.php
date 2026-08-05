<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class ExtendKiosksTable extends Migration
{
    public function up()
    {
        $fields = [
            'name'                       => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true, 'after' => 'kiosk_code'],
            'platform'                   => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'web', 'after' => 'name'],
            'printer_model'              => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true, 'after' => 'platform'],
            'printer_type'               => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'thermal_80mm', 'after' => 'printer_model'],
            'screen_size'                => ['type' => 'VARCHAR', 'constraint' => 20, 'null' => true, 'after' => 'printer_type'],
            'donation_mode'              => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'optional', 'after' => 'screen_size'],
            'sponsor_enabled'            => ['type' => 'BOOLEAN', 'default' => false, 'after' => 'donation_mode'],
            'device_id'                  => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true, 'after' => 'sponsor_enabled'],
            'device_fingerprint'         => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true, 'after' => 'device_id'],
            'ip_address'                 => ['type' => 'VARCHAR', 'constraint' => 45, 'null' => true, 'after' => 'device_fingerprint'],
            'os_version'                 => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true, 'after' => 'ip_address'],
            'configuration_version'      => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'default' => 1, 'after' => 'os_version'],
            'content_manifest_version'   => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'default' => 1, 'after' => 'configuration_version'],
            'activated_at'               => ['type' => 'DATETIME', 'null' => true, 'after' => 'content_manifest_version'],
            'deactivated_at'             => ['type' => 'DATETIME', 'null' => true, 'after' => 'activated_at'],
        ];

        foreach ($fields as $name => $definition) {
            if (!$this->db->fieldExists($name, 'kiosks')) {
                $this->forge->addColumn('kiosks', [$name => $definition]);
            }
        }
    }

    public function down()
    {
        $this->forge->dropColumn('kiosks', [
            'name', 'platform', 'printer_model', 'printer_type', 'screen_size',
            'donation_mode', 'sponsor_enabled', 'device_id', 'device_fingerprint',
            'ip_address', 'os_version', 'configuration_version', 'content_manifest_version',
            'activated_at', 'deactivated_at',
        ]);
    }
}
