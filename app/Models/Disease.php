<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class Disease extends BaseModel
{
    protected $fillable = ['id','title','description','remarks','status','sorting','type'];

    protected $logName = "Disease";

    public function getTypeAttribute($value){
        if($value!=null){
            return ucfirst($value);
        }else{
            return null;
        }
    }
}
