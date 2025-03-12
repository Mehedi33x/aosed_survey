<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use Carbon\Carbon;
use Spatie\Activitylog\Models\Activity;

class ActivityInfo extends BaseModel
{
    protected $fillable = [
        'project_id',
        'indicator_id',
        'activity_id',
        'group_id',
        'execute_by',
        'execute_date',
        'total_beneficiary',
        'remarks',
        'file',
        'image',
    ];
    protected $logName = "ActivityInfo";
    protected $appends = ['original_image', 'image_one', 'image_two', 'image_three'];

    // modify

    public function getExecuteDateAttribute($value)
    {
        return Carbon::parse($value)->format('d F, Y');
    }

    // relations
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

    public function admin()
    {
        return $this->belongsTo(Admin::class, 'execute_by', 'id');
    }

    public function group()
    {
        return $this->belongsTo(Group::class);
    }

    // for image upload
    public function setImageAttribute($value)
    {
        if (!is_string($value)) {
            $this->attributes['image'] = json_encode($value);
        } else {
            $this->attributes['image'] = $value;
        }
    }

    public function getOriginalImageAttribute()
    {
        $image = json_decode($this->image, true);

        if ($image) {

            $image = $image['original'] ?? null;

            return !empty($image) ? url('/') . '/public/storage/' . $image : null;
        }
    }
    public function getImageOneAttribute()
    {
        return getJsonMediaUrl($this->image, 0);
    }
    public function getImageTwoAttribute()
    {
        return getJsonMediaUrl($this->image, 1);
    }
    public function getImageThreeAttribute()
    {
        return getJsonMediaUrl($this->image, 2);
    }

    public function beneficiaryAssigns()
    {
        return $this->hasMany(BeneficiaryAssign::class, 'activity_id');
    }

    public function beneficiaryAttendance()
    {
        return $this->hasMany(BeneficiaryAttendance::class, 'activity_id', 'activity_id');
    }
    public function surveys()
    {
        return $this->hasMany(Survey::class, 'activity_id', 'activity_id')
            // ->whereColumn('surveys.indicator_id', 'activity_infos.indicator_id')
            // ->whereColumn('surveys.activity_id', 'activity_infos.activity_id')
            ;
    }





}
