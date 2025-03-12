<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use Carbon\Carbon;

class Survey extends BaseModel
{
    protected $fillable = [
        'survey_number',
        'project_id',
        'indicator_id',
        'activity_id',
        'title',
        'survey_date',
        'remarks',
    ];

    protected $logName = "Survey";

    public function project()
    {
        return $this->belongsTo(Project::class);
    }
    public function indicator()
    {
        return $this->belongsTo(Indicator::class);
    }
    public function activity()
    {
        return $this->belongsTo(ProjectActivity::class);
    }
    public function surveyBeneficiaries()
    {
        return $this->hasMany(SurveyBeneficiary::class, 'survey_id');
    }
    public function surveyBeneficiaryResults()
    {
        return $this->hasMany(SurveyBeneficiaryResult::class, 'survey_id');
    }
    
    public function getSurveyDateAttribute($value)
    {
        return Carbon::parse($value)->format('d F, Y');
    }
}
