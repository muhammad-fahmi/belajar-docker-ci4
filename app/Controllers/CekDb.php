<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class CekDb extends BaseController
{
    public function index()
    {
        $db = \Config\Database::connect();

        // 1. Coba Insert Data Sembarang
        $builder = $db->table('users');
        $data = [
            'fullname' => 'User Docker ' . rand(1, 1000), // Nama acak
            'email' => 'user' . rand(1, 1000) . '@test.com'
        ];
        $builder->insert($data);

        // 2. Ambil Semua Data
        $query = $builder->get();
        $results = $query->getResult();

        // 3. Tampilkan di Layar
        echo "<h1>Tes Koneksi Database Sukses!</h1>";
        echo "<p>Data baru saja ditambahkan. Refresh halaman untuk menambah lagi.</p>";
        echo "<hr>";
        echo "<ul>";
        foreach ($results as $row) {
            echo "<li>ID: $row->id | Nama: $row->fullname | Email: $row->email</li>";
        }
        echo "</ul>";
    }
}
