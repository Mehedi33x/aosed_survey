<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class SurveyForm extends BaseModel
{
    protected $fillable = [
        'project_id',
        'indicator_id',
        'activity_id',
        'title',
        'status',
    ];
    protected $appends = ['NumberOfQuestions', 'has_survey_result'];
    protected $logName = "SurveyForm";

    // relations
    public function questions()
    {
        return $this->hasMany(SurveyQuestion::class, 'survey_form_id');
    }
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

    public function getNumberOfQuestionsAttribute()
    {
        return $this->questions->count();
    }

    public function getHasSurveyResultAttribute()
    {
        return $this->questions()->wherehas('surveyBeneficiaryResults')->count();
    }
}
