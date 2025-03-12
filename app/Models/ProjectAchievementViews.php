<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class ProjectAchievementViews extends BaseModel
{
    protected $table = 'project_achievement_views';
    protected $guarded = ['id'];
    protected $logName = "ProjectAchievementViews";

    public function project()
    {
        return $this->belongsTo(Project::class, 'project_id', 'id');
    }
}
