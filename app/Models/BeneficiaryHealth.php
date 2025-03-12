<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class BeneficiaryHealth extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "BeneficiaryHealth";

    // file image push

    // date format
    public function disease(){
        return $this->belongsTo(Disease::class);
    }

}
