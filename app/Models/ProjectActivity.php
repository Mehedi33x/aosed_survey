<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use App\Models\Indicator;
use App\Models\Project;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProjectActivity extends BaseModel
{
    protected $fillable = [
        'project_id',
        'indicator_id',
        'title',
        'description',
        'is_surveyable',
        'beneficiary_attendance',
        'sorting',
        'status',
    ];
    protected $appends = ['beneficiary', 'surveyable'];
    protected $logName = "ProjectActivity";

    public function project()
    {
        return $this->belongsTo(Project::class);
    }

    public function indicator()
    {
        return $this->belongsTo(Indicator::class);
    }

    public function activityInfos()
    {
        return $this->hasMany(ActivityInfo::class, 'activity_id');
    }

    public function surveys()
    {
        return $this->hasMany(Survey::class, 'activity_id');
    }

    public function beneficiaryAttendances()
    {
        return $this->hasMany(BeneficiaryAttendance::class, 'activity_id');
    }

    public function beneficiaries()
    {
        return $this->hasMany(BeneficiaryAssign::class, 'activity_id');
    }

    public function getBeneficiaryAttribute()
    {
        return $this->beneficiary_attendance == 1 ? 'Yes' : 'No';
    }
    public function getSurveyableAttribute()
    {
        return $this->is_surveyable == 1 ? 'Yes' : 'No';
    }

    // progress accessor
    public function getProgressAttribute()
    {
        $reportIndicator = 0;
        $total = 1;
        $progress = 0;

        if ($this->activity_infos_count > 0) {
            $reportIndicator += 1;
        }

        if ($this->is_surveyable) {
            $total += 1;
            if ($this->surveys_count > 0) {
                $reportIndicator += 1;
            }
        }

        if ($this->beneficiary_attendance) {
            $total += 1;
            if ($this->beneficiary_attendances_count > 0) {
                $reportIndicator += 1;
            }
        }

        $progress = ($reportIndicator * 100) / $total;

        return $progress;
    }
}
