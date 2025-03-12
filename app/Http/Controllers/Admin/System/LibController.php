<?php

namespace App\Http\Controllers\Admin\System;

use App\Http\Controllers\Controller;
use App\Models\Contacts;
use App\Models\System\Menu;
use Illuminate\Support\Facades\App;

class LibController extends Controller
{
    private $variable = [];

    private function index()
    {
        return [
            'variable' => $this->variable,
            'app_env' => config("app.env"),
            'profile_menus' => $this->profileMenus(),
            'groups' => $this->groups(),
            'ages' => $this->ages(),
            'questionsType' => $this->questionsType(),
            'gender' => $this->gender(),
            'maritalStatus' => $this->maritalStatus(),
            'physicalCondition' => $this->physicalCondition(),
            // 'sourceofOwnership' => $this->sourceofOwnership(),
        ];
    }

    /**
     * Initialize date of system
     *
     * @return array
     */
    public function systems()
    {

        return [
            'global' => $this->index(),
            'permissions' => App::make('premitedMenuArr'),
            'site' => App::make('siteSettingObj'),
            'menus' => App::make('sideMenus'),
            'categoriesModuleNames' => $this->categoriesModuleNames(),
            'sourceofOwnership' => $this->sourceofOwnership(),
            'user' => auth('admin')->user(),
        ];
    }

    public function profileMenus()
    {
        return Menu::where('show_profile', 1)
            ->oldest('sorting')
            ->get(['icon', 'menu_name', 'route_name', 'params']);
    }

    /**
     * Member designation type
     *
     * @return array
     */
    public function categoriesModuleNames()
    {
        return [
            ['name' => 'Notice', 'value' => 'Notice'],
            ['name' => 'Events', 'value' => 'Events'],
            ['name' => 'News', 'value' => 'News'],
        ];
    }

    public function physicalCondition()
    {
        return [
            ['name' => 'Fit', 'value' => 'Fit'],
            ['name' => 'Unfit', 'value' => 'Unfit']
        ];
    }
    public function groups()
    {
        return [
            ['name' => 'A', 'value' => 'A'],
            ['name' => 'B', 'value' => 'B'],
            ['name' => 'C', 'value' => 'C'],
            ['name' => 'D', 'value' => 'D'],
            ['name' => 'E', 'value' => 'E'],
            ['name' => 'F', 'value' => 'F'],
            ['name' => 'G', 'value' => 'G'],
            ['name' => 'H', 'value' => 'H'],
        ];
    }
    public function ages()
    {
        return [
            [
                'name' => '18 to 25',
                'value' => json_encode(['min' => 18, 'max' => 25]),
            ],
            [
                'name' => '26 to 35',
                'value' => json_encode(['min' => 26, 'max' => 35]),
            ],
            [
                'name' => '35 to 50',
                'value' => json_encode(['min' => 35, 'max' => 50]),
            ],
            [
                'name' => '51 to 70',
                'value' => json_encode(['min' => 51, 'max' => 70]),
            ],
            [
                'name' => '70 to 100',
                'value' => json_encode(['min' => 70, 'max' => 100]),
            ],
        ];
    }

    public function questionsType()
    {
        return [
            ['name' => 'Single', 'value' => 'single'],
            ['name' => 'Multiple', 'value' => 'multiple'],
            ['name' => 'Text', 'value' => 'text'],
        ];
    }
    public function gender()
    {
        return [
            ['title' => 'Male', 'value' => 'male'],
            ['title' => 'Female', 'value' => 'female'],
        ];
    }
    public function maritalStatus()
    {
        return [
            ['title' => 'Married', 'value' => 'married'],
            ['title' => 'Unmarried', 'value' => 'unmarried'],
            ['title' => 'Divorced', 'value' => 'divorced'],
            // ['title' => 'Widowed', 'value' => 'widowed'],
        ];
    }

    public function sourceofOwnership()
    {
        return [
            ['name' => 'Self', 'value' => 'Self'],
            ['name' => 'Inheritance', 'value' => 'Inheritance'],
            ['name' => 'Lease', 'value' => 'Lease'],
        ];
    }


    /**
     * Get Current environment
     *
     * @return string
     */
    public function environment()
    {

        $currentUrl = url()->current();

        if (
            str_contains($currentUrl, 'localhost')
            || str_contains($currentUrl, '127.0.0.1')
            || str_contains($currentUrl, '192.168.')
            || str_contains($currentUrl, '103.169.160.21')
        ) {
            return 'local';
        } else {
            return 'production';
        }
    }
}



