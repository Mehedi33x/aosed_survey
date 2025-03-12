<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\District;
use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\SoftDeletes;

class State extends BaseModel
{
    use SoftDeletes;

    protected $fillable = ['country_id','id','name','sorting','status'];
    protected $logName = "State";

    public function district(){
        return $this->hasMany(District::class,'state_id','id');
    }


}
