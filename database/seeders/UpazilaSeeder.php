<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class UpazilaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('upazilas')->insert([
            // 1 Dhaka District Upazilas
            ['state_id' => 1, 'district_id' => 1, 'name' => 'Kafrul'],
            ['state_id' => 1, 'district_id' => 1, 'name' => 'Shah Ali'],
            ['state_id' => 1, 'district_id' => 2, 'name' => 'Keraniganj'],
            ['state_id' => 1, 'district_id' => 2, 'name' => 'Narayanganj Sadar'],
            // 2 Chittagong District Upazilas
            ['state_id' => 2, 'district_id' => 5, 'name' => 'Chandanaish'],
            ['state_id' => 2, 'district_id' => 5, 'name' => 'Anwara'],
            ['state_id' => 2, 'district_id' => 6, 'name' => 'Cox\'s Bazar'],
            ['state_id' => 2, 'district_id' => 7, 'name' => 'Feni Sadar'],
            // 3 Khulna District Upazilas
            ['state_id' => 3, 'district_id' => 9, 'name' => 'Khulna Sadar'],
            ['state_id' => 3, 'district_id' => 9, 'name' => 'Bagerhat'],
            ['state_id' => 3, 'district_id' => 10, 'name' => 'Satkhira Sadar'],
            ['state_id' => 3, 'district_id' => 10, 'name' => 'Jessore'],
            // 4 Rajshahi District Upazilas
            ['state_id' => 4, 'district_id' => 12, 'name' => 'Rajshahi Sadar'],
            ['state_id' => 4, 'district_id' => 13, 'name' => 'Naogaon Sadar'],
            ['state_id' => 4, 'district_id' => 14, 'name' => 'Bogura Sadar'],
            ['state_id' => 4, 'district_id' => 15, 'name' => 'Pabna Sadar'],
            // 5 Barisal District Upazilas
            ['state_id' => 5, 'district_id' => 17, 'name' => 'Barisal Sadar'],
            ['state_id' => 5, 'district_id' => 18, 'name' => 'Bhola Sadar'],
            ['state_id' => 5, 'district_id' => 19, 'name' => 'Patuakhali Sadar'],
            // 6 Sylhet District Upazilas
            ['state_id' => 6, 'district_id' => 22, 'name' => 'Sylhet Sadar'],
            ['state_id' => 6, 'district_id' => 23, 'name' => 'Moulvibazar Sadar'],
            ['state_id' => 6, 'district_id' => 24, 'name' => 'Habiganj'],
            ['state_id' => 6, 'district_id' => 25, 'name' => 'Sunamganj'],
            // 7 Rangpur District Upazilas
            ['state_id' => 7, 'district_id' => 27, 'name' => 'Rangpur Sadar'],
            ['state_id' => 7, 'district_id' => 28, 'name' => 'Kurigram'],
            ['state_id' => 7, 'district_id' => 29, 'name' => 'Gaibandha'],
            // 8 Mymensingh District Upazilas
            ['state_id' => 8, 'district_id' => 31, 'name' => 'Mymensingh Sadar'],
            ['state_id' => 8, 'district_id' => 32, 'name' => 'Jamalpur'],
            ['state_id' => 8, 'district_id' => 33, 'name' => 'Netrokona'],
            ['state_id' => 8, 'district_id' => 34, 'name' => 'Sherpur'],
        ]);
    }
}
