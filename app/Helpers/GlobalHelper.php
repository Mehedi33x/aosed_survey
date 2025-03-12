<?php

namespace App\Helpers;

use App\Models\Page;
use App\Models\PageSection;
use App\Models\PageSeo;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

class GlobalHelper extends Model
{
    public static function get_guard()
    {
        if (Auth::guard('admin')->check()) {
            return 'admin';
        } elseif (Auth::guard('web')->check()) {
            return 'user';
        } else {
            return null;
        }
    }
    public static function get_page_section($page, $section_title, $field, $image = false, $size = 'original')
    {
        $page = Page::where('title', $page)->first();

        if ($image) {
            $section = PageSection::where('title', $section_title)->first()?->image;
            $image = $section[$size] ?? null;
            return $image;
        }

        if ($page != null) {
            return PageSection::where('title', $section_title)->first()?->{$field} ?? '';
        }

        return "";
    }

    public static function get_page_seo($page_title)
    {
        $page = Page::where('title', $page_title)->first();
        return PageSeo::with('page')->where('page_id', $page->id ?? '')->first();
    }
}
