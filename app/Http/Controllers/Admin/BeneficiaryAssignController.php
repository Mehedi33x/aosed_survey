<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\BeneficiaryAssign;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Storage;

class BeneficiaryAssignController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = BeneficiaryAssign::with(['project:id,project_name', 'activity:id,title'])
            ->select(
                DB::raw('MIN(activity_id) as id'),
                'project_id',
                'activity_id',
                DB::raw('COUNT(beneficiary_id) as beneficiary_count')
            )
            ->groupBy('project_id', 'indicator_id', 'activity_id');
        if ($request->project_id && $request->activity_id) {
            $query->where('project_id', $request->project_id)
                ->where('activity_id', $request->activity_id);
        } elseif ($request->project_id) {
            $query->where('project_id', $request->project_id);
        }
        $query->whereLike($request->field_name, $request->value);
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
    public function create($id, $group_name)
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
            DB::beginTransaction();
            try {
                $insertData = [];
                foreach ($request->activity_id as $activityId) {
                    $indicator = DB::table('project_activities')
                        ->where('id', $activityId)
                        ->where('project_id', $request->project_id)
                        ->first();
                    if ($indicator) {
                        $indicatorId = $indicator->indicator_id;
                        foreach ($request->assignedBeneficiaries as $beneficiary) {
                            $exists = DB::table('beneficiary_assigns')
                                ->where('beneficiary_id', $beneficiary['beneficiary_id'])
                                ->where('project_id', $request->project_id)
                                ->where('indicator_id', $indicatorId)
                                ->where('activity_id', $activityId)
                                ->exists();
                            if (!$exists) {
                                $insertData[] = [
                                    'beneficiary_id' => $beneficiary['beneficiary_id'],
                                    'project_id' => $request->project_id,
                                    'activity_id' => $activityId,
                                    'indicator_id' => $indicatorId,
                                    'group_id' => $request->group_id,
                                ];
                            }
                        }
                    } else {
                        throw new Exception("No indicator found for activity_id: {$activityId}");
                    }
                }
                BeneficiaryAssign::insert($insertData);
                DB::commit();
                return $this->responseReturn("create", true);
            } catch (Exception $ex) {
                DB::rollback();
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\BeneficiaryAssign  $beneficiaryAssign
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $beneficiaryAssigns = BeneficiaryAssign::with('beneficiary')
            ->select('id', 'project_id', 'indicator_id', 'activity_id', 'beneficiary_id', 'group_id', 'status')
            ->where('activity_id', $id)
            ->get();
        abort_if($beneficiaryAssigns->count() == 0, 404);
        $data = [
            'id' => $beneficiaryAssigns[0]->id,
            'project_id' => $beneficiaryAssigns[0]->project_id,
            'project_name' => $beneficiaryAssigns[0]->project->project_name,
            'activity_id' => $beneficiaryAssigns[0]->activity_id,
            'activity_name' => $beneficiaryAssigns[0]->activity->title,
            'group_id' => $beneficiaryAssigns[0]->group_id,
            'group_name' => isset($beneficiaryAssigns[0]->group) && isset($beneficiaryAssigns[0]->group->title) ? $beneficiaryAssigns[0]->group->title : '',
        ];
        $data['assignedBeneficiaries'] = $beneficiaryAssigns;
        return response()->json($data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BeneficiaryAssign  $beneficiaryAssign
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BeneficiaryAssign  $beneficiaryAssign
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if ($this->validateCheck($request, $id)) {
            DB::beginTransaction();
            try {
                $data = $request->only(['project_id', 'activity_id', 'assignedBeneficiaries']);
                $storedIds = [];
                $indicator = DB::table('project_activities')
                    ->where('id', $data['activity_id'])
                    ->where('project_id', $data['project_id'])
                    ->first();

                if (!$indicator) {
                    throw new Exception("No indicator found for activity_id: {$data['activity_id']}");
                }
                $indicatorId = $indicator->indicator_id;

                foreach ($data['assignedBeneficiaries'] as $beneficiaryData) {
                    $existingAssignment = BeneficiaryAssign::where('project_id', $data['project_id'])
                        ->where('activity_id', $data['activity_id'])
                        ->where('beneficiary_id', $beneficiaryData['beneficiary_id'])
                        ->first();
                    if ($existingAssignment) {
                        $storedIds[] = $existingAssignment->id;
                        continue;
                    }
                    $newData = [
                        'project_id' => $data['project_id'],
                        'activity_id' => $data['activity_id'],
                        'indicator_id' => $indicatorId,
                        'group_id' => array_key_exists('group_id', $data) ? $data['group_id'] : null,
                        'beneficiary_id' => $beneficiaryData['beneficiary_id'],
                    ];
                    $oldBeneficiaryAssign = BeneficiaryAssign::find($beneficiaryData['id'] ?? null);
                    if ($oldBeneficiaryAssign) {
                        $oldBeneficiaryAssign->update($newData);
                        $storedIds[] = $oldBeneficiaryAssign->id;
                    } else {
                        $beneficiaryAssign = BeneficiaryAssign::create($newData);
                        $storedIds[] = $beneficiaryAssign->id;
                    }
                }
                BeneficiaryAssign::where('project_id', $data['project_id'])
                    ->where('activity_id', $data['activity_id'])
                    ->whereNotIn('id', $storedIds)
                    ->delete();

                DB::commit();
                return response()->json(['message' => 'Update Successfully!'], 201);
            } catch (Exception $ex) {
                DB::rollback();
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\BeneficiaryAssign  $beneficiaryAssign
     * @return \Illuminate\Http\Response
     */
    public function destroy($activityId)
    {
        $res = BeneficiaryAssign::where('activity_id', $activityId)
            ->delete();
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
        return $request->validate(
            [
                'project_id' => 'required|integer|exists:projects,id',
                'activity_id' => 'required|integer|exists:activities,id',
            ],

            [
                'project_id.required' => 'The project field is required.',
                'activity_id.required' => 'The activity field is required.',
            ]
        );
    }
    public function beneficiaryDelete(Request $request)
    {
        try {
            $beneficiaryAssign = BeneficiaryAssign::findOrFail($request->id);

            $beneficiaryAssign->delete();
            return response()->json(['message' => 'Beneficiary deleted successfully.'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error deleting beneficiary.'], 500);
        }
    }
}
