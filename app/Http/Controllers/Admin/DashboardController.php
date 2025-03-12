<?php

namespace App\Http\Controllers\Admin;

use App\Models\Survey;
use App\Models\Project;
use App\Models\Beneficiary;
use App\Models\System\Menu;
use App\Models\ActivityInfo;
use Illuminate\Http\Request;
use App\Models\UserLoginHistory;
use App\Http\Controllers\Controller;
use Spatie\Activitylog\Models\Activity;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            // Menus for dashboard.
            $menus = Menu::get();
            $dashboardMenus = Menu::query()
                ->where('show_dasboard', true)
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

                    // Resolve the model class and count the total data
                    if ($menu->module_name) {
                        $model = $menu->module_name;
                        $menu->total_data_count = $model::count();
                    } else {
                        $menu->total_data_count = 0;
                    }
                });

            // Get recent application activity.
            $activities = [];

            if (auth('admin')->user()->id == 1) {
                $activities = Activity::query()
                    ->latest()
                    ->limit(10)
                    ->get();
            } else {
                $userId = auth('admin')->user()->id;
                $activities = Activity::query()
                    ->where('causer_id', $userId)
                    ->latest()
                    ->limit(10)
                    ->get();
            }

            $loginHistories = [];

            // Get recent login information of users.
            if (auth('admin')->user()->id == 1) {
                $loginHistories = UserLoginHistory::query()
                    ->with('user')
                    ->latest()
                    ->limit(10)
                    ->get();
            } else {
                $userId = auth('admin')->user()->id;
                $loginHistories = UserLoginHistory::query()
                    ->with('user')
                    ->where('user_id', $userId)
                    ->latest()
                    ->limit(10)
                    ->get();
            }

            $surveys = [];
            if (auth('admin')->user()->id == 1) {
                $surveys = Survey::query()
                    ->latest()
                    ->limit(10)
                    ->get();
            }
            return [
                'surveys' => $surveys,
                'dashboardMenus' => $dashboardMenus,
                'activities' => $activities,
                'loginHistories' => $loginHistories,
                'pieData' => $this->pieData(),
                'barData' => $this->barData(),
                'statistics' => $this->statistics(),
            ];
        }

        return view('admin.layouts.admin_app');
    }

    /**
     * Bar chart
     *
     * @return array
     */
    /* public function barData()
    {
    return [
    'labels' => [
    'Age 18 to 25',
    'Age 26 to 35',
    'Age 36 to 45',
    'Age 46 to 55',
    ],
    'data' => [
    Beneficiary::query
    ],
    ];
    } */
    public function barData()
    {
        $ageRanges = [
            ['label' => 'Age 18 to 25', 'min' => 18, 'max' => 25],
            ['label' => 'Age 26 to 35', 'min' => 26, 'max' => 35],
            ['label' => 'Age 36 to 45', 'min' => 36, 'max' => 45],
            ['label' => 'Age 46 to 55', 'min' => 46, 'max' => 55],
        ];
        $data = [];
        foreach ($ageRanges as $range) {
            $count = Beneficiary::query()
                ->whereNotNull('date_of_birth')
                ->whereRaw("
                TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN ? AND ?",
                    [$range['min'], $range['max']]
                )
                ->count();
            $data[] = $count;
        }
        return [
            'labels' => array_column($ageRanges, 'label'),
            'data' => $data,
        ];
    }

    /**
     * Pie chart
     *
     * @return array
     */
    public function pieData()
    {
        return [
            'labels' => [
                'Male',
                'Female',
            ],
            'data' => [
                Beneficiary::where('gender', 'male')->count(),
                Beneficiary::where('gender', 'female')->count(),
            ],
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
