<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class BeneficiaryOccupation extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "BeneficiaryOccupation";

    function beneficiary()
    {
        return $this->belongsTo(Beneficiary::class);
    }

    public function occupations()
    {
        return $this->belongsTo(Occupation::class, 'occupation_id');
    }
    
}
