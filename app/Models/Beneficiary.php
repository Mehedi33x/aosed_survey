<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;
use App\Models\BeneficiaryOccupation;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;


class Beneficiary extends BaseModel
{
    use HasFactory;
    protected $guarded = ['id'];

    protected $logName = "Beneficiary";
    protected $appends = ['original_image', 'thumb_one', 'age', 'primary_occupation_name'];

    // file image push
    public function getBirthCertificateAttribute($value)
    {
        if (!empty($value)) {
            return url("") . "/public/storage/" . $value;
        }
        return null;
    }
    public function getNidCardAttribute($value)
    {
        if (!empty($value)) {
            return url("") . "/public/storage/" . $value;
        }
        return null;
    }

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

    public function getThumbOneAttribute()
    {
        $image = json_decode($this->image, true);
        if ($image) {
            $image = $image['145x95'] ?? null;
            return !empty($image) ? url('/') . '/public/storage/' . $image : null;
        }
    }
    public function beneficiaryEducations()
    {
        return $this->hasMany(BeneficiaryEducation::class);
    }
    public function presentState()
    {
        return $this->belongsTo(State::class, 'pre_state_id', 'id');
    }
    public function presentDistrict()
    {
        return $this->belongsTo(District::class, 'pre_district_id', 'id');
    }
    public function presentUpazilla()
    {
        return $this->belongsTo(Upazila::class, 'pre_upazilla_id', 'id');
    }
    public function presentThana()
    {
        return $this->belongsTo(Thana::class, 'pre_thana_id', 'id');
    }

    public function permanentState()
    {
        return $this->belongsTo(State::class, 'per_state_id', 'id');
    }
    public function permanentDistrict()
    {
        return $this->belongsTo(District::class, 'per_district_id', 'id');
    }
    public function permanentUpazilla()
    {
        return $this->belongsTo(Upazila::class, 'per_upazilla_id');
    }
    public function permanentThana()
    {
        return $this->belongsTo(Thana::class, 'per_thana_id');
    }

    public function beneficiaryOccupations()
    {
        return $this->hasMany(BeneficiaryOccupation::class);
    }
    public function beneficiaryFamilyMembers()
    {
        return $this->hasMany(BeneficiaryFamilyMember::class);
    }
    public function beneficiaryWealths()
    {
        return $this->hasMany(BeneficiaryWealth::class);
    }
    public function benificiaryAssets()
    {
        return $this->hasMany(BenificiaryAsset::class);
    }
    public function beneficiaryLiabilites()
    {
        return $this->hasMany(BeneficiaryLiabilite::class);
    }
    public function beneficiaryHealths()
    {
        return $this->hasOne(BeneficiaryHealth::class);
    }
    public function beneficiaryDiseases()
    {
        return $this->hasMany(BeneficiaryDisease::class);
    }

    public function occupations()
    {
        return $this->hasManyThrough(Occupation::class, BeneficiaryOccupation::class, 'beneficiary_id', 'id', 'id', 'occupation_id');
    }
    public function exams()
    {
        return $this->hasManyThrough(Exam::class, BeneficiaryEducation::class, 'beneficiary_id', 'id', 'id', 'exam_id');
    }

    public function beneficiaryAssigns()
    {
        return $this->hasMany(BeneficiaryAssign::class, 'beneficiary_id');
    }

    public static function getNextBeneficiaryNo()
    {
        $lastBeneficiaryNo = DB::table('beneficiaries')->max('beneficiary_no');
        return $lastBeneficiaryNo ? $lastBeneficiaryNo + 1 : 1111;
    }
    public function attendance()
    {
        return $this->hasMany(BeneficiaryAttendanceDetails::class, 'beneficiary_attendance_id');
    }
    public function familyMembers()
    {
        return $this->hasMany(BeneficiaryFamilyMember::class, 'beneficiary_id', 'id');
    }

    public function beneficiaryLiabilities()
    {
        return $this->hasMany(BeneficiaryLiabilite::class, 'beneficiary_id', 'id');
    }
    public function getAgeAttribute()
    {
        $dob = \DateTime::createFromFormat('d F, Y', $this->date_of_birth);

        if (!$dob) {
            return null;
        }
        return $dob->diff(new \DateTime())->y;
    }
    public function getDateOfBirthAttribute($value)
    {
        return $value ? Carbon::createFromFormat('Y-m-d', $value)->format('d F, Y') : null;
    }

    public function primaryOccupation()
    {
        return $this->hasOne(BeneficiaryOccupation::class)->where('is_primary', 1);
    }
    public function getPrimaryOccupationNameAttribute()
    {
        return $this->primaryOccupation->occupations->title ?? "N/A";
    }
    public function surveyBeneficiaries()
    {
        return $this->hasMany(SurveyBeneficiary::class, 'beneficiary_id', 'id');
    }

}
