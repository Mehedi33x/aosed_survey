<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use Carbon\Carbon;

class SurveyBeneficiary extends BaseModel
{
    protected $fillable = ['id', 'survey_id', 'beneficiary_id', 'survey_date', 'group_id', 'total_mark', 'admin_id'];

    protected $logName = "SurveyBeneficiary";

    public function survey()
    {
        return $this->belongsTo(Survey::class, 'survey_id');
    }
    public function admin()
    {
        return $this->belongsTo(Admin::class, 'admin_id');
    }
    public function beneficiary()
    {
        return $this->belongsTo(Beneficiary::class, 'beneficiary_id');
    }
    public function group()
    {
        return $this->belongsTo(Group::class);
    }
    public function getSurveyDateAttribute($value)
    {
        return Carbon::parse($value)->format('d F, Y');
    }
}
