<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models\Views;

use App\Models\Base\BaseModel;

class ApipView extends BaseModel
{
    protected $guarded = ['id'];
    protected $logName = "ApipView";
    protected $table = "apip_views";
}
