<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class BeneficiaryAssign extends BaseModel
{
    protected $guarded = ['id'];
    public $timestamps = true;
    protected $logName = "BeneficiaryAssign";

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
    public function beneficiary()
    {
        return $this->belongsTo(Beneficiary::class);
    }
    public function group()
    {
        return $this->belongsTo(Group::class);
    }

    public function beneficiaryAssigns()
    {
        return $this->hasMany(BeneficiaryAssign::class, 'activity_id', 'activity_id')
            ->whereColumn('project_id', 'beneficiary_assigns.project_id');
    }


}
