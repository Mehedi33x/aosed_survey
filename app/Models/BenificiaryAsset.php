<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class BenificiaryAsset extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "BenificiaryAsset";

    // file image push

    // date format

    public function asset(){
        return $this->belongsTo(Asset::class);
    }
}
