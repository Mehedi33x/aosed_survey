<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class Exam extends BaseModel
{
    protected $fillable = ['id', 'title', 'level', 'sorting', 'status'];

    protected $logName = "Exam";
    protected $casts = [
        'title' => 'string',
        'level' => 'string',
        'sorting' => 'integer',
    ];
    public function getLevelAttribute($value)
    {
        return ucfirst($value);
    }

    public function beneficiary(){
        return $this->hasMany(Beneficiary::class);
    }
}
