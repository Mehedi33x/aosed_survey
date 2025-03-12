<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\SoftDeletes;

class Country extends BaseModel
{
    use SoftDeletes;
    
    protected $guarded = ['id'];

    protected $logName = 'Country';

    public function getNameAttribute($value)
    {
        return $value.' +'.$this->phonecode;
    }
}
