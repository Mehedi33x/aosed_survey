<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Relation extends BaseModel
{
    protected $fillable = ['id','title','status','sorting'];

    protected $logName = "Relation";
    use HasFactory;

    // file image push

    // date format
}
