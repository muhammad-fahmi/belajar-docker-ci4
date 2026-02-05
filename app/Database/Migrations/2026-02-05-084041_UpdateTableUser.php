<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class UpdateTableUser extends Migration
{
    public function up()
    {
        $db = \Config\Database::connect();
        $db->query("ALTER TABLE users ADD COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP");

    }

    public function down()
    {
        $db = \Config\Database::connect();
        $db->query("ALTER TABLE users DROP COLUMN created_at");
    }
}
