<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Models;

use App\Models\Base\BaseModel;

class BeneficiaryAttendanceDetails extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = "BeneficiaryAttendanceDetails";

    public function beneficiary()
    {
        return $this->belongsTo(Beneficiary::class, 'beneficiary_id');
    }
}
