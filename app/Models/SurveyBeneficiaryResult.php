<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class SurveyBeneficiaryResult extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "SurveyBeneficiaryResult";

    public function surveyQuestions()
    {
        return $this->belongsTo(SurveyQuestion::class, 'question_id');
    }

    public function surveyAnswers()
    {
        return $this->belongsTo(SurveyAnswer::class, 'answer_id');
    }
}
