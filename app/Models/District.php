<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\SoftDeletes;

class District extends BaseModel
{
    use SoftDeletes;

    protected $fillable = ['id', 'state_id', 'name', 'status','sorting'];

    protected $logName = "District";

    public function state(){
        return $this->belongsTo(State::class,);
    }
    public function upazila(){
        return $this->hasMany(Upazila::class,'district_id','id');
    }

}
