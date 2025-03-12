<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\ActivityInfo;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rules\File;
use App\Action\Util\DeleteAction;


class ActivityInfoController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = ActivityInfo::with(['project:id,status,project_name', 'indicator:id,status,title', 'activity:id,status,title', 'admin:id,name'])->latest();
        $query->whereLike($request->field_name, $request->value);

        if ($request->project_id && $request->indicator_id && $request->activity_id) {
            $query->where('project_id', $request->project_id)
                ->where('indicator_id', $request->indicator_id)->where('activity_id', $request->activity_id);
        } elseif ($request->project_id && $request->indicator_id) {
            $query->where('project_id', $request->project_id)->where('indicator_id', $request->indicator_id);
        } elseif ($request->project_id) {
            $query->where('project_id', $request->project_id);
        }
        if ($request->group_id) {
            $query->where('group_id', $request->group_id);
        }
        if ($request->from_date && $request->to_date) {
            $startDate = vue_to_server_date($request->from_date);
            $endDate = vue_to_server_date($request->to_date);

            $query->whereDate('execute_date', '>=', $startDate)
                ->whereDate('execute_date', '<=', $endDate);
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
                $existsActivityInfo = ActivityInfo::where('project_id', $request->project_id)
                    ->where('indicator_id', $request->indicator_id)
                    ->where('activity_id', $request->activity_id)
                    ->exists();
                if ($existsActivityInfo) {
                    return response()->json(['exception' => 'Activity Info already exists for this project activity'], 422);
                }
                $data = $request->all();

                $data['execute_date'] = convertToDatabaseDate($request->execute_date);
                $data['execute_by'] = auth()->user()->id;
                if (!empty($request->file('file'))) {
                    $data['file'] = $this->upload($request->file, 'activityInfo');
                }

                $image = $request->image_base64;
                if (!empty($image)) {
                    $resizeValue = $data['thumbnail_resize_value'] ?? '600x600,200x200,50x50';
                    $data['image'] = cloudflare(file: $image, folder: 'activityinfo', resizeSize: $resizeValue, base64: true);
                }
                $res = ActivityInfo::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ActivityInfo  $activityInfo
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $activityInfo = ActivityInfo::with(['project:id,status,project_name', 'indicator:id,status,title', 'activity:id,status,title', 'admin:id,name', 'group:id,title'])->find($id);
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        return $activityInfo;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ActivityInfo  $activityInfo
     * @return \Illuminate\Http\Response
     */
    public function edit(ActivityInfo $activityInfo)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ActivityInfo  $activityInfo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ActivityInfo $activityInfo, DeleteAction $delete)
    {

        if ($this->validateCheck($request, $activityInfo->id)) {
            try {
                $existsActivityInfo = ActivityInfo::where('project_id', $request->project_id)
                    ->where('indicator_id', $request->indicator_id)
                    ->where('activity_id', $request->activity_id)
                    ->where('id', '!=', $activityInfo->id)
                    ->exists();
                if ($existsActivityInfo) {
                    return response()->json(['exception' => 'Activity Info already exists for this project activity.'], 422);
                }
                $data = $request->all();

                $image = $request->image_base64;
                if (!empty($image) && is_base64($image)) {

                    $resizeValue = $data['image_resize_value'] ?? '600x600,200x200,50x50';
                    @$delete->arrayImages($activityInfo->image);
                    $data['image'] = cloudflare(file: $image, folder: 'activityInfo', resizeSize: $resizeValue, base64: true);

                } else {
                    $data['image'] = $activityInfo->image;
                }
                $data['execute_date'] = convertToDatabaseDate($request->execute_date);
                $data['execute_by'] = auth()->user()->id;

                if (!empty($request->file('file'))) {
                    $oldFile = $this->oldFile($activityInfo->file);
                    Storage::delete($oldFile);
                    $data['file'] = $this->upload($request->file, 'activityInfo');
                } else {
                    unset($data['file']);
                }

                $activityInfo->fill($data)->save();
                return $this->responseReturn("update", $activityInfo);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ActivityInfo  $activityInfo
     * @return \Illuminate\Http\Response
     */
    public function destroy(ActivityInfo $activityInfo)
    {
        if ($activityInfo->file) {
            Storage::delete($activityInfo->file);
        }
        $res = $activityInfo->delete();
        return $this->responseReturn("delete", $res);
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {

        return $request->validate(
            [
                'project_id' => 'required|integer|exists:projects,id',
                'indicator_id' => 'required|integer|exists:indicators,id',
                'activity_id' => 'required|integer|exists:project_activities,id',
                'execute_date' => 'required',
                'total_beneficiary' => 'integer',
                'remarks' => 'nullable|string',
                // 'file' => ['nullable', 'file', 'mimes:pdf', 'max:10240'],
            ],
            [
                'file.mimes' => 'Only PDF files are allowed.',
            ]
        );
    }
}
