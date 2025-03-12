<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use App\Models\BeneficiaryOccupation;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Occupation extends BaseModel
{
    protected $fillable = ['id', 'title', 'sorting', 'status'];
    protected $logName = "Occupation";

    use HasFactory;

    public function beneficiaryOccupations()
    {
        return $this->hasMany(BeneficiaryOccupation::class, 'occupation_id');
    }
    public function beneficiaryFamilyMembers()
    {
        return $this->hasMany(BeneficiaryFamilyMember::class);
    }
}
