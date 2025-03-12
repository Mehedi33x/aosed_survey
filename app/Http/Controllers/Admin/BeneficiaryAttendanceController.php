<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\Beneficiary;
use App\Models\BeneficiaryAttendance;
use App\Models\BeneficiaryAttendanceDetails;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Storage;

class BeneficiaryAttendanceController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request)
    {
        $query = BeneficiaryAttendance::with('project', 'indicator', 'activity')->latest();
        $query->whereLike($request->field_name, $request->value);
        if ($request->project_id && $request->indicator_id && $request->activity_id) {
            $query->where('project_id', $request->project_id)
                ->where('indicator_id', $request->indicator_id)->where('activity_id', $request->activity_id);
        } elseif ($request->project_id && $request->indicator_id) {
            $query->where('project_id', $request->project_id)->where('indicator_id', $request->indicator_id);
        } elseif ($request->project_id) {
            $query->where('project_id', $request->project_id);
        }
        if ($request->status) {
            $query->where('status', $request->status);
        }
        if ($request->from_date && $request->to_date) {
            $startDate = convertToDatabaseDate($request->from_date);
            $endDate = convertToDatabaseDate($request->to_date);
            if ($startDate && $endDate) {
                $query->whereDate('attendance_date', '>=', $startDate)
                    ->whereDate('attendance_date', '<=', $endDate);
            }
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

    public function store(Request $request)
    {
        if ($this->validateCheck($request)) {
            try {
                DB::beginTransaction();
                $existingAttendance = BeneficiaryAttendance::where('attendance_date', vue_to_server_date($request->attendance_date))
                    ->where('activity_id', $request->activity_id)
                    ->first();

                if ($existingAttendance) {
                    return response()->json(['exception' => 'Same Date Attendance Are Not Accept'], 422);
                }

                $beneficiary_attendance_details = $request->attendance;
                if (empty($beneficiary_attendance_details) || !is_array($beneficiary_attendance_details)) {
                    return response()->json(['exception' => 'Attendance details are missing or invalid.'], 422);
                }

                $data = $request->except('beneficiary_attendance_details');
                $beneficiary_attendance_details = $request->attendance;
                $data['admin_id'] = Auth::id();
                $data['attendance_date'] = vue_to_server_date($request->attendance_date);

                $res = BeneficiaryAttendance::create($data);

                $this->storeAttendances($beneficiary_attendance_details, $res->id);

                DB::commit();
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                DB::rollback();
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    public function storeAttendances($beneficiary_attendance_details, $id)
    {
        foreach ($beneficiary_attendance_details as $attendanceDetails) {
            $newAttendance = new BeneficiaryAttendanceDetails();
            $newAttendance->beneficiary_attendance_id = $id;
            $newAttendance->beneficiary_id = $attendanceDetails['beneficiary_id'];
            $newAttendance->attendance = ($attendanceDetails['attendance'] == '1') ? 1 : 0;
            $newAttendance->save();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\BeneficiaryAttendance  $beneficiaryAttendance
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $beneficiaryAttendance = BeneficiaryAttendance::with(
            'project:id,project_name',
            'indicator:id,title',
            'activity:id,title',
            'group:id,title',
            'admin:id,name',
            'attendance.beneficiary',
        )
            ->withCount('attendance')
            ->withCount([
                'attendance as total_present' => function ($query) {
                    $query->where('attendance', 1); // Count present
                },
                'attendance as total_absent' => function ($query) {
                    $query->where('attendance', 0); // Count absent
                },
            ])
            ->find($id);
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        return $beneficiaryAttendance;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BeneficiaryAttendance  $beneficiaryAttendance
     * @return \Illuminate\Http\Response
     */
    public function edit(BeneficiaryAttendance $beneficiaryAttendance)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BeneficiaryAttendance  $beneficiaryAttendance
     * @return \Illuminate\Http\Response
     */

    public function update(Request $request, $id)
    {
        if ($this->validateCheck($request, $id)) {
            try {
                DB::beginTransaction();
                $beneficiaryAttendance = BeneficiaryAttendance::find($request->id);
                $data = $request->except('beneficiary_attendance_details');
                $beneficiary_attendance_details = $request->attendance;
                $data['admin_id'] = Auth::id();
                $data['attendance_date'] = vue_to_server_date($request->attendance_date);
                $beneficiaryAttendance->update($data);
                if (count($beneficiary_attendance_details) > 0) {
                    foreach ($beneficiary_attendance_details as $attendanceDetails) {
                        $existingAttendance = BeneficiaryAttendanceDetails::where('id', $attendanceDetails['id'])->first();
                        if ($existingAttendance) {
                            $existingAttendance->attendance = $attendanceDetails['attendance'] == '0' ? 0 : 1;
                            $existingAttendance->save();
                        } else {
                            $newAttendance = new BeneficiaryAttendanceDetails();
                            $newAttendance->beneficiary_attendance_id = $beneficiaryAttendance->id;
                            $newAttendance->beneficiary_id = $attendanceDetails['beneficiary_id'];
                            $newAttendance->attendance = $attendanceDetails['attendance'] == '0' ? 0 : 1;
                            $newAttendance->save();
                        }
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
     * @param  \App\Models\BeneficiaryAttendance  $beneficiaryAttendance
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            DB::beginTransaction();
            $beneficiaryAttendance = BeneficiaryAttendance::findOrFail($id);
            BeneficiaryAttendanceDetails::where('beneficiary_attendance_id', $id)->delete();
            $beneficiaryAttendance->delete();
            DB::commit();
            return response()->json(['message' => 'Deleted Successfully'], 200);
        } catch (Exception $ex) {
            DB::rollback();
            return response()->json(['exception' => $ex->getMessage()], 422);
        }
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
            ],
            [
            ]
        );
    }
}
