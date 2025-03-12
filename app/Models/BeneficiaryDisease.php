<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class BeneficiaryDisease extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "BeneficiaryDisease";

    // file image push

    // date format

     public function disease()
    {
        return $this->belongsTo(Disease::class);
    }

    public function beneficiary()
    {
        return $this->belongsTo(Beneficiary::class);
    }


}
