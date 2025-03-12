<?php
/**
 * @Nogor Solutions Ltd
 */

namespace App\Models\System;

use App\Models\Base\BaseModel;

class SiteSetting extends BaseModel
{
    protected $guarded = ['id'];

    protected $logName = 'Site Settings';
    protected $appends = ['original_logo','logo_one', 'logo_two', 'logo_three', 'original_logo_small','logo_small_one', 'logo_small_two', 'logo_small_three'];

    /* public function getLogoAttribute($value)
    {
    return ! empty($value)
    ? url('/').'/public/storage/'.$value
    : url('/').'/public/images/n-logo.png';
    }

    public function getLogoSmallAttribute($value)
    {
    return ! empty($value)
    ? url('/').'/public/storage/'.$value
    : url('/').'/public/images/n-logo.png';
    } */
    public function getOriginalLogoAttribute()
	{
		return getJsonMediaUrl($this->logo, 'original');
	}
    public function getOriginalLogoSmallAttribute()
	{
		return getJsonMediaUrl($this->logo_small, 'original');
	}
    public function getLogoOneAttribute()
    {
        return getJsonMediaUrl($this->logo, 0);
    }

    public function getLogoTwoAttribute()
    {
        return getJsonMediaUrl($this->logo, 1);
    }

    public function getLogoThreeAttribute()
    {
        return getJsonMediaUrl($this->logo, 2);
    }

    public function getLogoSmallOneAttribute()
    {
        return getJsonMediaUrl($this->logo_small, 0);
    }

    public function getLogoSmallTwoAttribute()
    {
        return getJsonMediaUrl($this->logo_small, 1);
    }

    public function getLogoSmallThreeAttribute()
    {
        return getJsonMediaUrl($this->logo_small, 2);
    }

    public function getFaviconAttribute($value)
    {
        return !empty($value)
        ? url('/') . '/public/storage/' . $value
        : url('/') . '/public/images/nogor-favicon.png';
    }
}
