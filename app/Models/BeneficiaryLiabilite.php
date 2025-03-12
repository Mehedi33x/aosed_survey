<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class BeneficiaryLiabilite extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "BeneficiaryLiabilite";

    // file image push

    // date format

    public function liability()
    {
        return $this->belongsTo(Liability::class);
    }
}
