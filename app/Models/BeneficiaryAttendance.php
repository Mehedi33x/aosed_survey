<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class BeneficiaryAttendance extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "BeneficiaryAttendance";

    // file image push

    // date format
    public function getAttendanceDateAttribute($value)
    {
        return date('d F, Y', strtotime($value));
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
        return $this->belongsTo(ProjectActivity::class, 'activity_id');
    }
    public function group()
    {
        return $this->belongsTo(Group::class);
    }
    public function attendance()
    {
        return $this->hasMany(BeneficiaryAttendanceDetails::class, 'beneficiary_attendance_id');
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class);
    }

    public function attendanceDetails()
    {
        return $this->hasMany(BeneficiaryAttendanceDetails::class, 'beneficiary_attendance_id', 'id')
            ->where('attendance', 1)
            ->where('status', 'active');
    }

}
