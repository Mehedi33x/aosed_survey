<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class HelpInfo extends BaseModel
{
    protected $fillable = [
        'model_name',
        'page_type',
        'description',
        'sorting',
        'status'
    ];

    protected $logName = "HelpInfo";

    // file image push

    // date format
}
