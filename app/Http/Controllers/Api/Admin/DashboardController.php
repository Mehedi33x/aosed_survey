<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Survey;
use App\Models\Project;
use App\Models\Beneficiary;
use App\Models\System\Menu;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Admin\System\LibController;
use App\Models\ActivityInfo;

class DashboardController extends Controller
{
    protected $libController;

    public function __construct(LibController $libController)
    {
        $this->libController = $libController;
    }

    public function dashboard()
    {
        return response()->json([
            'success' => 1,
            'error' => 0,
            'dashboard_menus' => $this->menus(),
            'surveys' => $this->surveys(),
            'age' => $this->ages(),
            'gender' => $this->gender(),
            'statistics' => $this->statistics(),
        ]);
    }

    public function menus()
    {
        $menus = Menu::get();
        $dashboardMenus = Menu::query()
            ->where('show_dasboard', true)
            ->select('id', 'menu_name', 'icon', 'module_name')
            ->get()
            ->each(function ($menu) use ($menus) {
                $getParentById = function ($id, $parents) {
                    $parent = $parents->firstWhere('id', $id);
                    return $parent;
                };
                $parent = $getParentById($menu->parent_id, $menus);
                if (!is_null($parent)) {
                    $menu->parent_title = $parent->menu_name;
                } else {
                    $menu->parent_title = $menu->menu_name;
                }
                if ($menu->module_name) {
                    $model = $menu->module_name;
                    $menu->total_data_count = $model::count();
                } else {
                    $menu->total_data_count = 0;
                }
            });
        return $dashboardMenus;
    }
    public function surveys()
    {
        $surveys = [];
        $surveys = Survey::query()
            ->select('survey_number', 'title', 'survey_date')
            ->latest()
            ->limit(10)
            ->get();
        return $surveys;
    }
    public function ages()
    {
        $ageRanges = $this->libController->ages();
        $data = [];
        foreach ($ageRanges as $range) {
            $ageRange = json_decode($range['value'], true);
            if (!is_array($ageRange) || !isset($ageRange['min']) || !isset($ageRange['max'])) {
                continue;
            }
            $count = Beneficiary::query()
                ->whereNotNull('date_of_birth')
                ->whereRaw("
                TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN ? AND ?",
                    [$ageRange['min'], $ageRange['max']]
                )
                ->count();
            $data[$range['name']] = $count;
        }
        return [
            $data,
        ];
    }
    public function gender()
    {
        $genders = $this->libController->gender();
        $data = [];
        foreach ($genders as $gender) {
            $data[$gender['value']] = Beneficiary::where('gender', $gender['value'])->count();
        }

        return [
            $data,
        ];

    }

    public function statistics()
    {
        return [
            'total_beneficiary' => Beneficiary::count(),
            'surveys' => Survey::count(),
            'total_projects' => Project::count(),
            'total_activity_execute' => ActivityInfo::count(),
        ];
    }
}
