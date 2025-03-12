<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class Group extends BaseModel
{
    protected $fillable = ['id', 'title', 'sorting','status'];

    protected $logName = "Group";

    // file image push

    // date format
}
