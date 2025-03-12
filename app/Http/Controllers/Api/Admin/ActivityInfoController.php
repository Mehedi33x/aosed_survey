<?php

namespace App\Http\Controllers\Api\Admin;

use App\Rules\Base64Image;
use Illuminate\Support\Str;
use App\Models\ActivityInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rules\File;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;


class ActivityInfoController extends Controller
{
    public function getActivityInfo(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'limit' => 'nullable|integer|min:1',
            'search.query' => 'nullable|string',
            'search.project_id' => 'nullable|integer|exists:projects,id',
            'search.indicator_id' => 'nullable|integer|exists:indicators,id',
            'search.activity_id' => 'nullable|integer|exists:project_activities,id',
            // 'search.from_date' => 'nullable|date',
            // 'search.to_date' => 'nullable|date',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => $validator->errors()->all(),
            ], 422);
        } else {
            $search = $request->input('search', []);
            $query = ActivityInfo::with([
                'project:id,project_name',
                'indicator:id,title',
                'activity:id,title',
            ]);

            /*  if (!empty($search['query'])) {
            $query->where('activities.title', 'LIKE', '%' . $search['query'] . '%');
            } */

            if (!empty($search['project_id']) && !empty($search['indicator_id']) && !empty($search['activity_id'])) {
                $query->where('project_id', $search['project_id'])
                    ->where('indicator_id', $search['indicator_id'])->where('activity_id', $search['activity_id']);
            } elseif ($search['project_id'] && $search['indicator_id']) {
                $query->where('project_id', $search['project_id'])->where('indicator_id', $search['indicator_id']);
            } elseif ($search['project_id']) {
                $query->where('project_id', $search['project_id']);
            }


            if (!empty($search['from_date']) && !empty($search['to_date'])) {
                $startDate = convertToDatabaseDate($search['from_date']);
                $endDate = convertToDatabaseDate($search['to_date']);
                $query->whereDate('execute_date', '>=', $startDate)
                    ->whereDate('execute_date', '<=', $endDate);
            }

            $limit = $request->input('limit', 10);
            $activityInfos = $query->limit($limit)
                ->latest()
                ->get();
            if ($activityInfos->isEmpty()) {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'message' => 'No Activity Infos found',
                ], 422);
            }
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $activityInfos,
            ]);
        }
    }

    public function activityinfoAdd(Request $request)
    {
        $validator = $this->doValidation($request);
        if ($validator->fails()) {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'Validation failed.',
                'details' => $validator->errors(),
            ], 422);
        }
        DB::beginTransaction();
        try {
            $existsActivityInfo = ActivityInfo::where('project_id', $request->project_id)
                ->where('indicator_id', $request->indicator_id)
                ->where('activity_id', $request->activity_id)
                ->exists();
            if ($existsActivityInfo) {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'message' => 'Activity Info already exists for this project activity',
                ], 422);
            }

            $filePath = null;
            if ($request->hasFile('file')) {
                $filePath = $request->file('file')->storeAs('upload/activityInfo', date('Ymdhsi') . $request->file('file')->getClientOriginalName(), 'public');
            }


            $activityInfo = ActivityInfo::create([
                'project_id' => $request->project_id,
                'indicator_id' => $request->indicator_id,
                'activity_id' => $request->activity_id,
                'execute_by' => Auth::user()->id,
                'execute_date' => convertToDatabaseDate($request->execute_date),
                'total_beneficiary' => $request->total_beneficiary,
                'file' => $filePath,
                'image' => $request->image,
                'remarks' => $request->remarks,
            ]);
            DB::commit();
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $activityInfo,
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'An error occurred while adding Activity Info',
                'details' => $e->getMessage(),
            ], 500);
        }
    }

    public function activityinfoView(Request $request, $id)
    {
        $activityInfo = ActivityInfo::with([
            'project:id,project_name',
            'indicator:id,title',
            'activity:id,title',
            'admin:id,name',
        ])
            ->select('id', 'project_id', 'indicator_id', 'activity_id', 'execute_by', 'execute_date', 'total_beneficiary', 'file', 'remarks')
            ->find($id);
        if ($activityInfo) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $activityInfo,
            ], 200);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No Activity Info found',
            ], 422);
        }
    }

    public function activityinfoEdit(Request $request, $id)
    {
        $validator = $this->doValidation($request);
        if ($validator->fails()) {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'Validation failed.',
                'details' => $validator->errors(),
            ], 422);
        }
        DB::beginTransaction();
        try {
            $activityInfo = ActivityInfo::find($id);

            if (!$activityInfo) {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'message' => 'No Activity Info found',
                ], 422);
            } else {
                $existsActivityInfo = ActivityInfo::where('project_id', $request->project_id)
                    ->where('indicator_id', $request->indicator_id)
                    ->where('activity_id', $request->activity_id)
                    ->where('id', '!=', $activityInfo->id)
                    ->exists();
                if ($existsActivityInfo) {
                    return response()->json([
                        'success' => 0,
                        'error' => 1,
                        'message' => 'Activity Info already exists for this project activity',
                    ], 422);
                }
                $filePath = null;
                if ($request->hasFile('file')) {
                    $filePath = $request->file('file')->storeAs('upload/activityInfo', date('Ymdhsi') . $request->file('file')->getClientOriginalName(), 'public');
                }
                $activityInfo->update([
                    'project_id' => $request->project_id,
                    'indicator_id' => $request->indicator_id,
                    'activity_id' => $request->activity_id,
                    'execute_by' => Auth::user()->id,
                    'execute_date' => convertToDatabaseDate($request->execute_date),
                    'total_beneficiary' => $request->total_beneficiary,
                    'file' => $filePath,
                    'remarks' => $request->remarks,
                ]);
                DB::commit();
                return response()->json([
                    'success' => 1,
                    'error' => 0,
                    'data' => $activityInfo,
                ], 200);
            }
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'An error occurred while adding Activity Info',
                'details' => $e->getMessage(),
            ], 500);
        }
    }

    /* protected function doValidation(Request $request)
    {
        return $request->validate(
            [
                'project_id' => 'required|integer|exists:projects,id',
                'indicator_id' => 'required|integer|exists:indicators,id',
                'activity_id' => 'required|integer|exists:project_activities,id',
                'execute_date' => 'required',
                'total_beneficiary' => 'integer',
                'remarks' => 'nullable|string',
                'file' => ['nullable', File::types(['pdf'])->max(1024 * 10)],
            ],
            [
                'file.mimes' => 'Only PDF files are allowed.',
            ]
        );
    } */
    public function doValidation(Request $request)
    {
        return Validator::make($request->all(), [
            'project_id' => 'required|integer|exists:projects,id',
            'indicator_id' => 'required|integer|exists:indicators,id',
            'activity_id' => 'required|integer|exists:project_activities,id',
            'execute_date' => 'required|date',
            'total_beneficiary' => 'nullable|integer',
            'remarks' => 'nullable|string',
            // 'file' => 'nullable|file|mimes:pdf|max:2048',
            // 'image' => ['nullable', 'string', new Base64Image()],
        ]);
    }

}
