<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use Carbon\Carbon;
use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class BeneficiaryFamilyMember extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "BeneficiaryFamilyMember";
    use HasFactory;
    // file image push

    // date format

    public function getFamilyDateOfBirthAttribute($value)
    {
        return $value ? date('d F, Y', strtotime($value)) : null;
    }
    /* public function getDateOfBirthAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d', $value)->format('d F, Y') : null;
    } */

    public function relation(){
        return $this->belongsTo(Relation::class);
    }

    public function beneficiary()  {
        return $this->belongsTo(Beneficiary::class);
    }
    public function occupations()
    {
    return $this->belongsTo(Occupation::class, 'occupation_id', 'id');
    }
}
