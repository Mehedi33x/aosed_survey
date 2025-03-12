<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class DistrictSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('districts')->insert([
            // Dhaka Districts
            ['state_id' => 1, 'name' => 'Dhaka'],
            ['state_id' => 1, 'name' => 'Munshiganj'],
            ['state_id' => 1, 'name' => 'Faridpur'],
            ['state_id' => 1, 'name' => 'Narayanganj'],
            ['state_id' => 1, 'name' => 'Gazipur'],
            ['state_id' => 1, 'name' => 'Madaripur'],
            ['state_id' => 1, 'name' => 'Tangail'],
            ['state_id' => 1, 'name' => 'Narsingdi'],
            ['state_id' => 1, 'name' => 'Munsiganj'],

            // Chittagong Districts
            ['state_id' => 2, 'name' => 'Chittagong'],
            ['state_id' => 2, 'name' => 'Cox\'s Bazar'],
            ['state_id' => 2, 'name' => 'Feni'],
            ['state_id' => 2, 'name' => 'Comilla'],
            ['state_id' => 2, 'name' => 'Khagrachari'],
            ['state_id' => 2, 'name' => 'Chandpur'],
            ['state_id' => 2, 'name' => 'Brahmanbaria'],
            ['state_id' => 2, 'name' => 'Lakshmipur'],

            // Khulna Districts
            ['state_id' => 3, 'name' => 'Khulna'],
            ['state_id' => 3, 'name' => 'Bagerhat'],
            ['state_id' => 3, 'name' => 'Satkhira'],
            ['state_id' => 3, 'name' => 'Jessore'],
            ['state_id' => 3, 'name' => 'Kushtia'],
            ['state_id' => 3, 'name' => 'Meherpur'],

            // Rajshahi Districts
            ['state_id' => 4, 'name' => 'Rajshahi'],
            ['state_id' => 4, 'name' => 'Naogaon'],
            ['state_id' => 4, 'name' => 'Bogura'],
            ['state_id' => 4, 'name' => 'Pabna'],
            ['state_id' => 4, 'name' => 'Chapainawabganj'],
            ['state_id' => 4, 'name' => 'Natore'],

            // Barisal Districts
            ['state_id' => 5, 'name' => 'Barisal'],
            ['state_id' => 5, 'name' => 'Patuakhali'],
            ['state_id' => 5, 'name' => 'Bhola'],
            ['state_id' => 5, 'name' => 'Jhalokathi'],
            ['state_id' => 5, 'name' => 'Barisal'],

            // Sylhet Districts
            ['state_id' => 6, 'name' => 'Sylhet'],
            ['state_id' => 6, 'name' => 'Moulvibazar'],
            ['state_id' => 6, 'name' => 'Habiganj'],
            ['state_id' => 6, 'name' => 'Sunamganj'],

            // Rangpur Districts
            ['state_id' => 7, 'name' => 'Rangpur'],
            ['state_id' => 7, 'name' => 'Kurigram'],
            ['state_id' => 7, 'name' => 'Gaibandha'],
            ['state_id' => 7, 'name' => 'Dinajpur'],
            ['state_id' => 7, 'name' => 'Thakurgaon'],

            // Mymensingh Districts
            ['state_id' => 8, 'name' => 'Mymensingh'],
            ['state_id' => 8, 'name' => 'Jamalpur'],
            ['state_id' => 8, 'name' => 'Netrokona'],
            ['state_id' => 8, 'name' => 'Sherpur'],
        ]);
    }
}
