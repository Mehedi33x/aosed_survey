<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\BeneficiaryFamilyMember;

class BeneficiaryFamilyMemberSeeder extends Seeder
{
    public function run()
    {
        BeneficiaryFamilyMember::factory()->count(10)->create();
    }
}

