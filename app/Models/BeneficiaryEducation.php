<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class BeneficiaryEducation extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "BeneficiaryEducation";

    public function beneficiary()  {
        return $this->belongsTo(Beneficiary::class);
    }

    public function exam(){
        return $this->belongsTo(Exam::class);
    }



}
