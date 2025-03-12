<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\Indicator;
use App\Models\Project;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Storage;

class ProjectController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Project::with('indicators:id,title,status', 'state:id,name,status', 'district:id,name,status', 'upazila:id,name,status')->latest();
        $query->whereLike($request->field_name, $request->value);
        if ($request->status) {
            $query->where('status', $request->status);
        }
        if ($request->from_date && $request->to_date) {
            $startDate = convertToDatabaseDate($request->from_date);
            $endDate = convertToDatabaseDate($request->to_date);

            if ($startDate && $endDate) {
                $query->whereDate('start_date', '>=', $startDate)
                    ->whereDate('end_date', '<=', $endDate);
            }
        }
        if ($request->state_id) {
            $query->where('state_id', $request->state_id);
        }

        if ($request->district_id) {
            $query->where('district_id', $request->district_id);
        }

        if ($request->upazilla_id) {
            $query->where('upazilla_id', $request->upazilla_id);
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
                DB::beginTransaction();
                $data = $request->except('indicators');
                $indicators = $request->indicators;
                $res = Project::create($data);
                $this->storeIndicators($indicators, $res->id);

                DB::commit();
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                DB::rollback();
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        // $project = Project::with(['indicators' => function ($query) {
        //     $query->where('status', 'active');
        // },
        //     'state:id,name',
        //     'district:id,name',
        //     'upazila:id,name',
        //     'indicators.projectActivities'])
        //     ->find($id);
        $project = Project::with(['indicators', 'state:id,name', 'district:id,name', 'upazila:id,name', 'indicators.projectActivities'])->find($id);
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }

        return $project;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function edit(Project $project)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if ($this->validateCheck($request, $id)) {
            try {
                DB::beginTransaction();
                $project = Project::find($id);
                $data = $request->except('indicators');
                $indicators = $request->indicators;
                $project->update($data);

                $project->indicators()->delete();
                if ($indicators != null) {
                    if (count($indicators) > 0) {
                        $this->storeIndicators($indicators, $project->id);
                    }
                }
                DB::commit();
                return response()->json(['message' => 'Update Successfully'], 201);
            } catch (Exception $ex) {
                DB::rollback();
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function destroy(Project $project)
    {
        $res = $project->delete();
        return $this->responseReturn("delete", $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {
        return $request->validate([
            'project_name' => [
                'required',
                'string',
                'max:190',
                \Illuminate\Validation\Rule::unique('projects', 'project_name')->ignore($id),
            ],
            'objective' => 'nullable|string',
            'start_date' => 'nullable|string',
            'end_date' => 'nullable|string',
            'status' => 'nullable|string',
        ], [
            'project_name.required' => 'The project name is required.',
            'project_name.unique' => 'The project name must be unique.',
        ]);
    }

    public function storeIndicators($indicators, $id)
    {
        foreach ($indicators as $key => $indicator) {
            $newIndicator = new Indicator();
            $newIndicator->project_id = $id;
            $newIndicator->title = $indicator['title'] ?? '';
            $newIndicator->total_mark = isset($indicator['total_mark']) ? intval($indicator['total_mark']) : 0;
            $newIndicator->achivement_percentage = isset($indicator['achivement_percentage']) ? intval($indicator['achivement_percentage']) : 0;
            $newIndicator->description = $indicator['description'] ?? '';
            $newIndicator->status = $indicator['status'] ?? 'deactive';

            $newIndicator->save();
        }
    }
}
