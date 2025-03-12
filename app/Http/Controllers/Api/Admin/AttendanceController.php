<?php

namespace App\Http\Controllers\Api\Admin;

use Exception;
use App\Models\Beneficiary;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\BeneficiaryAttendance;
use App\Models\BeneficiaryAttendanceDetails;

class AttendanceController extends Controller
{
    public function getAttendance()
    {
        $attendance = BeneficiaryAttendance::with([
            'project:id,project_name',
            'indicator:id,title',
            'activity:id,title',

        ])
            ->select('id', 'project_id', 'indicator_id', 'activity_id', 'attendance_date')
            ->latest()->get();
        if ($attendance) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $attendance,
            ], 201);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => 'No attendance found.',
            ], 200);
        }

    }
    public function beneficiariesAttendance(Request $request)
    {
        try {
            DB::beginTransaction();
            $existingAttendance = BeneficiaryAttendance::where('attendance_date', vue_to_server_date($request->attendance_date))
                ->first();
            if ($existingAttendance) {
                return response()->json(['exception' => 'Attendance for this date already exists.'], 422);
            }
            $beneficiary_attendance_details = $request->attendance;
            if (empty($beneficiary_attendance_details) || !is_array($beneficiary_attendance_details)) {
                return response()->json(['exception' => 'Attendance details are missing or invalid.'], 422);
            }
            foreach ($beneficiary_attendance_details as $attendance) {
                if (!isset($attendance['beneficiary_id']) || !isset($attendance['attendance'])) {
                    return response()->json([
                        'success' => 0,
                        'error' => 1,
                        'error_message' => 'Each attendance entry must contain a beneficiary_id and attendance value.',
                    ], 404);
                }
                if (!in_array($attendance['attendance'], ['0', '1'], true)) {
                    return response()->json([
                        'success' => 0,
                        'error' => 1,
                        'error_message' => 'Attendance value must be 0 or 1',
                    ], 404);
                }
            }
            $data = $request->except('attendance');
            $data['admin_id'] = Auth::id();
            $data['attendance_date'] = vue_to_server_date($request->attendance_date);

            $attendanceRecord = BeneficiaryAttendance::create($data);
            $this->storeAttendances($beneficiary_attendance_details, $attendanceRecord->id);
            DB::commit();
            return response()->json([
                'success' => 1,
                'error' => 0,
                'message' => 'Attendance successfully recorded.',
            ], 201);
        } catch (Exception $ex) {
            DB::rollback();
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => 'An error occurred: ' . $ex->getMessage(),
            ], 404);
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

    public function viewAttendance($id)
    {
        $beneficiaryAttendance = BeneficiaryAttendance::with(
            'project:id,project_name',
            'indicator:id,title',
            'activity:id,title',
            'admin:id,name',
            'attendance.beneficiary',
        )
            ->withCount('attendance')
            ->withCount([
                'attendance as total_present' => function ($query) {
                    $query->where('attendance', 1);
                },
                'attendance as total_absent' => function ($query) {
                    $query->where('attendance', 0);
                },
            ])
            ->find($id);
        if ($beneficiaryAttendance) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $beneficiaryAttendance,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => 'Attendance not found.',
            ], 404);
        }
    }
    public function updateAttendance(Request $request, $id)
    {
        try {
            DB::beginTransaction();
            $attendanceRecord = BeneficiaryAttendance::find($id);
            if (!$attendanceRecord) {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'error_message' => 'Attendance record not found.',
                ], 404);
            }
            $beneficiary_attendance_details = $request->attendance;
            if (empty($beneficiary_attendance_details) || !is_array($beneficiary_attendance_details)) {
                return response()->json(['exception' => 'Attendance details are missing or invalid.'], 422);
            }
            $filtered_attendance = array_map(function ($attendance) {
                return array_intersect_key($attendance, array_flip(['id', 'beneficiary_id', 'beneficiary_attendance_id', 'attendance']));
            }, $beneficiary_attendance_details);
            foreach ($filtered_attendance as $attendance) {
                if (!isset($attendance['beneficiary_id'], $attendance['attendance'])) {
                    return response()->json([
                        'success' => 0,
                        'error' => 1,
                        'error_message' => 'Each attendance entry must contain a beneficiary_id and attendance value.',
                    ], 422);
                }
            }

            foreach ($filtered_attendance as $attendance) {
                BeneficiaryAttendanceDetails::updateOrCreate(
                    [
                        'beneficiary_attendance_id' => $attendanceRecord->id,
                        'beneficiary_id' => $attendance['beneficiary_id'],
                    ],
                    ['attendance' => $attendance['attendance']]
                );
            }
            DB::commit();
            return response()->json([
                'success' => 1,
                'error' => 0,
                'message' => 'Attendance successfully updated.',
            ], 200);
        } catch (Exception $ex) {
            DB::rollback();
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => 'An error occurred: ' . $ex->getMessage(),
            ], 500);
        }
    }
    public function getAttendanceBeneficiaries(Request $request)
    {
        $data = $request->all();
        if ($data) {
            $activityid = $data['activity_id'];
            $beneficiaries = Beneficiary::select('id', 'full_name', 'nid', 'mobile_no', 'status')
                ->whereIn('id', function ($query) use ($activityid) {
                    $query->select('beneficiary_id')
                        ->from('beneficiary_assigns')
                        ->where('activity_id', $activityid);
                })->get();

        }
        if ($beneficiaries->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $beneficiaries->map(function ($beneficiary) {
                    return [
                        'id' => $beneficiary->id,
                        'full_name' => $beneficiary->full_name,
                        'mobile_no' => $beneficiary->mobile_no,
                        'nid' => $beneficiary->nid,
                    ];
                }),
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No Beneficiary Found',
            ]);
        }
    }

    public function deleteAttendance($id)
    {
        $attendance = BeneficiaryAttendance::find($id);
        if ($attendance) {
            $attendance->attendance()->delete();
            $attendance->delete();
            return response()->json([
                'success' => 1,
                'error' => 0,
                'message' => 'Attendance has been deleted successfully',
            ], 200);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'Attendance not found',
            ], 404);
        }
    }

}
