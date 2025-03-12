<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class Thana extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "Thana";

    public function state()
    {
        return $this->belongsTo(State::class);
    }
    public function district()
    {
        return $this->belongsTo(District::class);
    }
    public function upazila()
    {
        return $this->belongsTo(Upazila::class);
    }
}
