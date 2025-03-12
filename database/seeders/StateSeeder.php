<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class StateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('states')->insert([
            ['name' => 'Dhaka'],
            ['name' => 'Chittagong'],
            ['name' => 'Khulna'],
            ['name' => 'Rajshahi'],
            ['name' => 'Barisal'],
            ['name' => 'Sylhet'],
            ['name' => 'Rangpur'],
            ['name' => 'Mymensingh'],
        ]);
    }
}
