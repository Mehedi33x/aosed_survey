<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use App\Models\SurveyForm;

class SurveyQuestion extends BaseModel
{
    protected $fillable = ['id','survey_form_id', 'question', 'mark','question_type'];


    protected $logName = "SurveyQuestion";

    public function answers()
    {
        return $this->hasMany(SurveyAnswer::class, 'survey_question_id');
    }
    public function surveyForm()
    {
        return $this->belongsTo(SurveyForm::class, 'survey_form_id');
    }
    public function surveyBeneficiaryResults()
    {
        return $this->hasMany(SurveyBeneficiaryResult::class, 'question_id');
    }
}
