<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\ProjectAchievementSetup;
use Exception;
use Illuminate\Http\Request;
use Storage;

class ProjectAchievementSetupController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = ProjectAchievementSetup::with(['project', 'indicator'])->latest();
        $query->whereLike($request->field_name, $request->value);

        if ($request->project_id && $request->indicator_id) {
            $query->where('project_id', $request->project_id)
                ->where('indicator_id', $request->indicator_id);
        } elseif ($request->project_id) {
            $query->where('project_id', $request->project_id);
        }
        if ($request->status) {
            $query->where('status', $request->status);
        }

        if ($request->allData) {
            return $query->get();
        } else {
            $datas = $query->paginate($request->pagination);
            return new Resource($datas);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ($this->validateCheck($request)) {
            try {
                /* $exists = ProjectAchievementSetup::where('project_id', $request->project_id)
                    ->where('indicator_id', $request->indicator_id)
                    ->exists();

                if ($exists) {
                    return response()->json(['exception' => 'This Project Achievement Setup already exists.'], 422);
                } */

                // Create the new Project Achievement Setup
                $data = $request->all();
                $res = ProjectAchievementSetup::create($data);

                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ProjectAchievementSetup  $projectAchievementSetup
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $projectAchievementSetup = ProjectAchievementSetup::with(['project', 'indicator'])->find($id);
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        return $projectAchievementSetup;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ProjectAchievementSetup  $projectAchievementSetup
     * @return \Illuminate\Http\Response
     */
    public function edit(ProjectAchievementSetup $projectAchievementSetup)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ProjectAchievementSetup  $projectAchievementSetup
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProjectAchievementSetup $projectAchievementSetup)
    {
        if ($this->validateCheck($request, $projectAchievementSetup->id)) {
            try {

                $data = $request->all();
                $projectId = $request->project_id;
                $indicatorId = $request->indicator_id;
                $exists = ProjectAchievementSetup::where('project_id', $projectId)
                    ->where('indicator_id', $indicatorId)
                    ->where('id', '!=', $projectAchievementSetup->id) // Exclude the current record from the check
                    ->exists();

                if ($exists) {
                    return response()->json(['exception' => 'A setup with this project and indicator already exists.'], 422);
                }

                $data = $request->all();
                $projectAchievementSetup->fill($data)->save();
                $projectAchievementSetup->fill($data)->save();

                return $this->responseReturn("update", $projectAchievementSetup);

            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ProjectAchievementSetup  $projectAchievementSetup
     * @return \Illuminate\Http\Response
     */
    public function destroy(ProjectAchievementSetup $projectAchievementSetup)
    {
        // delete

        $res = $projectAchievementSetup->delete();
        return $this->responseReturn("delete", $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck(Request $request, $id = null)
    {
        $uniqueValidationRules = [
            'project_id' => ['required', 'exists:projects,id'],
            'indicator_id' => ['required', 'exists:indicators,id'],
        ];
        if ($id) {
            $existing = ProjectAchievementSetup::find($id);
            if ($existing->indicator_id !== $request->indicator_id) {
                $uniqueValidationRules['indicator_id'][] = 'unique:project_achievement_setups,indicator_id,NULL,id,project_id,' . $request->project_id;
            }
        } else {
            $uniqueValidationRules['indicator_id'][] = 'unique:project_achievement_setups,indicator_id,NULL,id,project_id,' . $request->project_id;
        }
        return $request->validate($uniqueValidationRules, [
            'indicator_id.unique' => 'Project Achievement Setup of this project and indicator combination already exists.',
        ]);
    }
}
