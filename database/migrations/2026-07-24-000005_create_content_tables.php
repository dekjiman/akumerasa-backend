<?php

namespace Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateContentTables extends Migration
{
    public function up()
    {
        // Emotions
        $this->forge->addField([
            'id'          => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'name'        => ['type' => 'VARCHAR', 'constraint' => 100],
            'icon'        => ['type' => 'VARCHAR', 'constraint' => 10, 'null' => true],
            'description' => ['type' => 'TEXT', 'null' => true],
            'category'    => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'positif'],
            'status'      => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'active'],
            'sort_order'  => ['type' => 'INT', 'constraint' => 11, 'default' => 0],
            'created_at'  => ['type' => 'DATETIME'],
            'updated_at'  => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('emotions');

        // Contexts
        $this->forge->addField([
            'id'          => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'name'        => ['type' => 'VARCHAR', 'constraint' => 100],
            'description' => ['type' => 'TEXT', 'null' => true],
            'sort_order'  => ['type' => 'INT', 'constraint' => 11, 'default' => 0],
            'created_at'  => ['type' => 'DATETIME'],
            'updated_at'  => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('contexts');

        // Quran Verses
        $this->forge->addField([
            'id'           => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'surah'        => ['type' => 'INT', 'constraint' => 3],
            'ayat_number'  => ['type' => 'INT', 'constraint' => 3],
            'arabic_text'  => ['type' => 'TEXT'],
            'translation'  => ['type' => 'TEXT', 'null' => true],
            'source'       => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'tags'         => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'status'       => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'draft'],
            'reviewer_id'  => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'reviewed_at'  => ['type' => 'DATETIME', 'null' => true],
            'created_at'   => ['type' => 'DATETIME'],
            'updated_at'   => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('status');
        $this->forge->createTable('quran_verses');

        // Hadiths
        $this->forge->addField([
            'id'           => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'arabic_text'  => ['type' => 'TEXT', 'null' => true],
            'translation'  => ['type' => 'TEXT'],
            'book'         => ['type' => 'VARCHAR', 'constraint' => 100],
            'number'       => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'narrator'     => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'grade'        => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'source'       => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'status'       => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'draft'],
            'reviewer_id'  => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'null' => true],
            'reviewed_at'  => ['type' => 'DATETIME', 'null' => true],
            'created_at'   => ['type' => 'DATETIME'],
            'updated_at'   => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->addKey('status');
        $this->forge->createTable('hadiths');

        // Reflection Templates
        $this->forge->addField([
            'id'                  => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'name'                => ['type' => 'VARCHAR', 'constraint' => 100],
            'summary_template'    => ['type' => 'TEXT', 'null' => true],
            'reflection_template' => ['type' => 'TEXT', 'null' => true],
            'question_template'   => ['type' => 'TEXT', 'null' => true],
            'disclaimer'          => ['type' => 'TEXT', 'null' => true],
            'created_at'          => ['type' => 'DATETIME'],
            'updated_at'          => ['type' => 'DATETIME'],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('reflection_templates');
    }

    public function down()
    {
        $this->forge->dropTable('reflection_templates');
        $this->forge->dropTable('hadiths');
        $this->forge->dropTable('quran_verses');
        $this->forge->dropTable('contexts');
        $this->forge->dropTable('emotions');
    }
}
