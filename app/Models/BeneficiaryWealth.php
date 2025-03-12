<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class BeneficiaryWealth extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "BeneficiaryWealth";

    // file image push

    // date format
    public function wealth(){
        return $this->belongsTo(Wealth::class);
    }
}
