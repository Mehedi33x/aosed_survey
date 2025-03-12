<?php

namespace Database\Factories;

use App\Models\BeneficiaryFamilyMember;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\BeneficiaryFamilyMember>
 */
class BeneficiaryFamilyMemberFactory extends Factory
{
    protected $model = BeneficiaryFamilyMember::class;

    public function definition()
    {
        return [
            'beneficiary_id' =>$this->faker->numberBetween(1, 5),
            'relation_id' => $this->faker->numberBetween(1, 5),
            'title' => $this->faker->title,
            'name' => $this->faker->name,
            'date_of_birth' => $this->faker->date(),
            'family_nid' => $this->faker->unique()->numberBetween(100000000, 999999999),
            'gender' => $this->faker->randomElement(['male', 'female', 'others']),
            'marital_status' => $this->faker->randomElement(['married', 'unmarried', 'divorced']),
            'last_education_info' => $this->faker->word,
            'earn' => $this->faker->numberBetween(0, 100000),
            'occupation_id' => $this->faker->numberBetween(1, 5),
            'yearly_income' => $this->faker->randomFloat(2, 0, 500000),
            'is_student' => $this->faker->boolean,
            'goes_to_school' => $this->faker->boolean,
            'remarks' => $this->faker->sentence,
            'sorting' => $this->faker->numberBetween(0, 10),
            'status' => $this->faker->randomElement(['active', 'deactive']),
        ];
    }
}
