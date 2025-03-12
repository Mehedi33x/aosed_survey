<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class Indicator extends BaseModel
{
    protected $fillable = ['id', 'title', 'total_mark', 'achivement_percentage', 'description', 'status'];

    protected $logName = "Indicator";

    public function getTitleAttribute()
    {
        return ucfirst($this->attributes['title']);
    }

    public function projectActivities()
    {
        return $this->hasMany(ProjectActivity::class, 'indicator_id');
    }

    public function projectAchievementSetups()
    {
        return $this->hasMany(ProjectAchievementSetup::class);
    }
}
