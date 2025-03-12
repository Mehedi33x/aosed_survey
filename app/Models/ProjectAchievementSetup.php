<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class ProjectAchievementSetup extends BaseModel
{
    protected $fillable = [
        'project_id',
        'indicator_id',
        'activity_point',
        'activity_att_lt_30',
        'activity_att_lt_50',
        'activity_att_lt_80',
        'activity_att_lt_100',
        'survey_point_lt_30',
        'survey_point_lt_50',
        'survey_point_lt_80',
        'survey_point_lt_100',
        'status',
    ];

    protected $logName = "ProjectAchievementSetup";

    public function project()
    {
        return $this->belongsTo(Project::class, 'project_id');
    }
    public function indicator()
    {
        return $this->belongsTo(Indicator::class, 'indicator_id');
    }

}
