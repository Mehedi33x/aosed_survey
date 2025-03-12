<?php

namespace Database\Factories;

use App\Models\Beneficiary;
use Illuminate\Database\Eloquent\Factories\Factory;

class BeneficiaryFactory extends Factory
{
    protected $model = Beneficiary::class;

    public function definition()
    {
        return [
            // 'title' => $this->faker->title,
            'full_name' => $this->faker->name,
            'name_bangla' => $this->faker->name,
            'beneficiary_no' => $this->faker->randomNumber(5, true),
            'date_of_birth' => $this->faker->date(),
            'nid' => $this->faker->randomNumber(9, true),
            'birth_certificate_no' => $this->faker->randomNumber(9, true),
            'mobile_no' => $this->faker->phoneNumber,
            'email' => $this->faker->safeEmail,
            'gender'=>'male',
            'marital_status'=>'married',
            'image' => $this->faker->imageUrl(),
            'birth_certificate' => $this->faker->text(100),
            'present_address' => $this->faker->address,
            'pre_state_id' => $this->faker->numberBetween(1, 3),
            'pre_district_id' => $this->faker->numberBetween(1, 3),
            'pre_upazilla_id' => $this->faker->numberBetween(1, 3),
            'permanent_address' => $this->faker->address,
            'per_state_id' => $this->faker->numberBetween(1, 3),
            'per_district_id' => $this->faker->numberBetween(1, 3),
            'per_upazilla_id' => $this->faker->numberBetween(1, 3),
            'sorting' => $this->faker->numberBetween(1, 10),
            'status' => $this->faker->randomElement(['active', 'deactive']),
        ];
    }
}
