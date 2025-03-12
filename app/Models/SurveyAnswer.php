<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class SurveyAnswer extends BaseModel
{
    protected $fillable = ['id','survey_question_id','answer','mark'];

    protected $logName = "SurveyAnswer";

    public function surveyQuestion()
    {
        return $this->belongsTo(SurveyQuestion::class, 'survey_question_id');
    }
}
