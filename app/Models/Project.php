<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use Spatie\Activitylog\Models\Activity;

class Project extends BaseModel
{
    protected $fillable = ['id', 'project_name', 'objective', 'start_date', 'end_date', 'status', 'state_id', 'district_id', 'upazila_id'];
    protected $appends = ['location'];
    protected $logName = "Project";

    public function setStartDateAttribute($value)
    {
        $this->attributes['start_date'] = convertToDatabaseDate($value);
    }
    public function setEndDateAttribute($value)
    {
        $this->attributes['end_date'] = convertToDatabaseDate($value);
    }

    public function getProjectNameAttribute()
    {
        return ucfirst($this->attributes['project_name']);
    }
    public function getStartDateAttribute($value)
    {
        return $value ? date('d M, Y', strtotime($value)) : null;
    }

    public function getEndDateAttribute($value)
    {
        return $value ? date('d M, Y', strtotime($value)) : null;
    }

    public function indicators()
    {
        return $this->hasMany(Indicator::class);
    }
    public function state()
    {
        return $this->belongsTo(State::class);
    }

    public function district()
    {
        return $this->belongsTo(District::class);
    }

    public function upazila()
    {
        return $this->belongsTo(Upazila::class);
    }

    public function getLocationAttribute()
    {
        $upazilaName = $this->upazila?->name ?? 'N/A';
        $districtName = $this->district?->name ?? 'N/A';
        $stateName = $this->state?->name ?? 'N/A';
        if ($upazilaName === 'N/A' && $districtName === 'N/A' && $stateName === 'N/A') {
            return 'N/A';
        }
        return "{$upazilaName}, {$districtName}, {$stateName}";
    }

    public function projectAchievementSetups()
    {
        return $this->hasMany(ProjectAchievementSetup::class);
    }
    public function activitiy()
    {
        return $this->hasMany(ProjectActivity::class);
    }
    public function projectActivities()
    {
        return $this->hasMany(ProjectActivity::class);
    }

    public function activityInfos()
    {
        return $this->hasMany(ActivityInfo::class);
    }
    public function projectAchievementViews(){
        return $this->hasMany(ProjectAchievementViews::class);
    }

    // public function beneficiaryAssign(){
    //     return $this->hasMany(BeneficiaryAssign::class);
    // }

}
