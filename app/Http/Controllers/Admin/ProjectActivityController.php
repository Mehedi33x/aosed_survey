<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\ProjectActivity;
use Exception;
use Illuminate\Http\Request;
use Storage;

class ProjectActivityController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = ProjectActivity::with('project:id,project_name', 'indicator:id,title')->latest();
        $query->whereLike($request->field_name, $request->value);
        if ($request->status) {
            $query->where('status', $request->status);
        }

        if ($request->project_id && $request->indicator_id) {
            $query->where('project_id', $request->project_id)
                ->where('indicator_id', $request->indicator_id);
        } elseif ($request->project_id) {
            $query->where('project_id', $request->project_id);
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
                $existsProjectActivity = ProjectActivity::where('project_id', $request->project_id)
                    ->where('indicator_id', $request->indicator_id)
                    ->where('title', $request->title)
                    ->exists();
                if ($existsProjectActivity) {
                    return response()->json(['exception' => 'This Project Activity already exists.'], 422);
                }
                $data = $request->all();
                // push the insert text
                $res = ProjectActivity::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ProjectActivity  $projectActivity
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $projectActivity = ProjectActivity::with('project:id,project_name', 'indicator:id,title')->find($id);
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        return $projectActivity;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ProjectActivity  $projectActivity
     * @return \Illuminate\Http\Response
     */
    public function edit(ProjectActivity $projectActivity)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ProjectActivity  $projectActivity
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProjectActivity $projectActivity)
    {
        if ($this->validateCheck($request, $projectActivity->id)) {
            try {
                $data = $request->all();
                $existsProjectActivity = ProjectActivity::where('project_id', $request->project_id)
                    ->where('indicator_id', $request->indicator_id)
                    ->where('title', $request->title)
                    ->where('id', '!=', $projectActivity->id) // Exclude the current record
                    ->exists();

                if ($existsProjectActivity) {
                    return response()->json(['exception' => 'This Project Activity already exists.'], 422);
                }

                $projectActivity->fill($data)->save();

                return $this->responseReturn("update", $projectActivity);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ProjectActivity  $projectActivity
     * @return \Illuminate\Http\Response
     */
    public function destroy(ProjectActivity $projectActivity)
    {
        // delete

        $res = $projectActivity->delete();
        return $this->responseReturn("delete", $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {
        return true;
        return $request->validate([
            //ex: 'name' => 'required|email|nullable|date|string|min:0|max:191',
        ], [
            //ex: 'name' => "This name is required" (custom message)
        ]);
    }
}
