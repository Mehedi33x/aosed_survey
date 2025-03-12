<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use App\Models\District;
use App\Models\State;
use Illuminate\Database\Eloquent\SoftDeletes;

class Upazila extends BaseModel
{
    use SoftDeletes;

    protected $fillable = ['id', 'state_id', 'district_id', 'name', 'sorting', 'status'];

    protected $logName = "Upazila";

    public function state()
    {
        return $this->belongsTo(State::class);
    }
    public function district()
    {
        return $this->belongsTo(District::class);
    }
}
