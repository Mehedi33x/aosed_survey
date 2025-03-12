<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $arr = [
            MenuSeeder::class,
            AdminSeeder::class,
            RoleSeeder::class,
            SiteSettingsSeeder::class,
            CountrySeeder::class,
            CategorySeeder::class,

            StateSeeder::class,
            // DistrictSeeder::class,
            // UpazilaSeeder::class,
        ];

        $this->call($arr);
    }
}
