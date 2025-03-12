<?php

namespace App\Http\Controllers\Admin;

use App\Models\Survey;
use App\Models\Project;
use App\Models\Indicator;
use App\Models\ActivityInfo;
use Illuminate\Http\Request;
use App\Models\ProjectActivity;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\BeneficiaryAssign;
use App\Models\System\SiteSetting;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;

class ReportController extends Controller
{
    public function projectBeneficiary(Request $request)
    {
        $projectId = $request->project_id ?? null;
        $searchData = [
            'selectedProjectName' => $projectId ? Project::find($projectId)->project_name ?? 'N/A' : 'All Projects',
            'selectedIndicator' => Indicator::find($request->indicator_id)->title ?? 'N/A',
            'selectedActivity' => ProjectActivity::find($request->activity_id)->title ?? 'N/A',
            'report_date' => date('d M Y'),
        ];
        $projectBeneficiary = BeneficiaryAssign::with([
            'activity:id,title',
            'project:id,project_name',
            'group:id,title',
            'beneficiary:id,gender,mobile_no,nid,marital_status,date_of_birth',
            'beneficiary.beneficiaryOccupations.occupations:id,title',
        ])
            ->with([
                'beneficiary' => function ($projectBeneficiary) {
                    $projectBeneficiary->withCount('familyMembers')
                        ->withSum('beneficiaryLiabilities', 'amount');
                }
            ])
            ->where(function ($query) use ($request) {
                if ($request->has('project_id')) {
                    $query->where('project_id', $request->project_id);
                }
                if ($request->has('indicator_id')) {
                    $query->where('indicator_id', $request->indicator_id);
                }
                if ($request->has('activity_id')) {
                    $query->where('activity_id', $request->activity_id);
                }
                if ($request->has('group_id')) {
                    $query->where('group_id', $request->group_id);
                }
                if ($request->has('gender')) {
                    $query->whereHas('beneficiary', function ($query) use ($request) {
                        $query->where('gender', $request->gender);
                    });
                }
                if ($request->has('marital_status')) {
                    $query->whereHas('beneficiary', function ($query) use ($request) {
                        $query->where('marital_status', $request->marital_status);
                    });
                }
                if ($request->has('occupation_id')) {
                    $query->whereHas('beneficiary.beneficiaryOccupations', function ($query) use ($request) {
                        $query->where('occupation_id', $request->occupation_id);
                    });
                }
            })
            ->get()
            ->unique('beneficiary_id');
        if ($request->has('download_pdf')) {
            $data = $projectBeneficiary;
            $siteSettings = SiteSetting::first();
            $pdfLoad = PDF::loadView('report.project_beneficiary_report', compact('data', 'searchData', 'siteSettings'))->setPaper('a4', 'landscape');
            return $pdfLoad->download("project-beneficiary-report.pdf");
        }
        return response()->json($projectBeneficiary);
    }
    /* public function download()
    {
        $projectReports = BeneficiaryAssign::with([
            'project:id,project_name',
            'activity:id,title',
            'beneficiary:id,date_of_birth',
            'beneficiary:id,gender,mobile_no,nid,marital_status',
            'beneficiary.beneficiaryOccupations.occupations:id,title',
        ])
            ->with([
                'beneficiary' => function ($query) {
                    $query->withCount('familyMembers')
                        ->withSum('beneficiaryLiabilities', 'amount');
                }
            ])
            ->get();
        if (empty($projectReports)) {
            return response()->json([
                'message' => "No data found",
            ], Http::ok());
        }
        $formType = $projectReports->first()->form_type;
        $data = [
            'projectReports' => $projectReports,

        ];
        $pdfLoad = PDF::loadView('report.project_beneficiary_report', $data)->setPaper('a4', 'portrait');
        return $pdfLoad->stream("report_$formType.pdf");
    } */
    public function activityReport(Request $request)
    {

        $validated = $request->validate([
            'project_id' => 'nullable',
            'indicator_id' => 'nullable',
            'activity_id' => 'nullable',
        ]);
        $activities = ActivityInfo::select(
            'id',
            'execute_by',
            'execute_date',
            'project_id',
            'indicator_id',
            'activity_id',
            DB::raw('(SELECT COUNT(DISTINCT beneficiary_id)
                      FROM beneficiary_assigns
                      WHERE beneficiary_assigns.project_id = activity_infos.project_id
                        AND beneficiary_assigns.activity_id = activity_infos.activity_id) AS total_assigned_beneficiaries')
        )
            ->with([
                'indicator' => function ($query) {
                    $query->select('id', 'title', 'project_id');
                },
                'activity' => function ($query) {
                    $query->select('id', 'title', 'project_id');
                },
                'admin' => function ($query) {
                    $query->select('id', 'name');
                },
                'beneficiaryAssigns' => function ($query) use ($validated) {
                    $query->where('project_id', $validated['project_id']);

                    if (!empty($validated['indicator_id'])) {
                        $query->where('indicator_id', $validated['indicator_id']);
                    }
                    if (!empty($validated['activity_id'])) {
                        $query->where('activity_id', $validated['activity_id']);
                    }
                    $query->select(
                        'project_id',
                        'activity_id',
                        DB::raw('COUNT(DISTINCT beneficiary_id) as total_beneficiary')
                    )->groupBy('project_id', 'activity_id');
                },
                'surveys:id,project_id,indicator_id,activity_id,survey_date,survey_number,title' => [
                    'surveyBeneficiaries' => function ($query) {
                        $query->select('survey_id')
                            ->groupBy('survey_id')
                            ->selectRaw('COUNT(beneficiary_id) as beneficiary_count')
                            ->selectRaw('AVG(total_mark) as average_marks');
                    }
                ],
                'beneficiaryAttendance' => function ($query) use ($validated) {
                    $query->select(
                        'activity_id',
                        DB::raw('COUNT(*) as active_attendance_count'),
                        DB::raw('SUM(
                                (SELECT COUNT(*)
                                FROM beneficiary_attendance_details
                                WHERE beneficiary_attendance_id = beneficiary_attendances.id
                                AND attendance = 1)
                            ) as total_attendance'),
                        DB::raw('AVG(
                                (SELECT COUNT(*)
                                FROM beneficiary_attendance_details
                                WHERE beneficiary_attendance_id = beneficiary_attendances.id
                                AND attendance = 1)
                            ) as average_attendance')
                    )
                        ->where('status', 'active')
                        ->groupBy('activity_id')
                        ->with('attendanceDetails:beneficiary_attendance_id,beneficiary_id,attendance,status');
                }
            ])
        ;
        if (!empty($validated['project_id'])) {

            $activities->where('project_id', $validated['project_id']);
        }
        if (!empty($validated['indicator_id'])) {
            $activities->where('indicator_id', $validated['indicator_id']);
        }
        if (!empty($validated['activity_id'])) {

            $activities->where('activity_id', $validated['activity_id']);
        }
        $activities = $activities->get();
        if ($request->has('download_pdf')) {
            if ($activities->isEmpty()) {
                return response()->json(['message' => "No data found"], 200);
            }
            $siteSettings = SiteSetting::first();
            $searchData = $activities;
            $pdfLoad = PDF::loadView('report.project_activity_report', compact('searchData', 'siteSettings'))
                ->setPaper('a4', 'portrait');
            return $pdfLoad->download("project_activity_report.pdf");
        }
        return response()->json($activities, 200);
    }
    public function projectReport(Request $request)
    {
        $fromDate = $request->from_date ? convertToDatabaseDate($request->from_date) : null;
        $toDate = $request->to_date ? convertToDatabaseDate($request->to_date) : null;
        $projectId = $request->project_id ?? null;
        $searchData = [
            'selectedProjectName' => $projectId ? Project::find($projectId)->project_name ?? 'N/A' : 'All Projects',
            'formattedFromDate' => $fromDate ? date('d M Y', strtotime($fromDate)) : 'N/A',
            'formattedToDate' => $toDate ? date('d M Y', strtotime($toDate)) : 'N/A',
            'report_date' => date('d M Y'),
        ];
        /* $query = Project::select('id', 'project_name', 'start_date')
            ->withCount([
                'indicators as total_indicators' => function ($query) {
                    $query->where('status', 'active');
                },
                'projectActivities as total_activities',
                'activityInfos as execute_activity',
            ])
            ->withSum('activityInfos', 'total_beneficiary')
            ->with('projectAchievementViews')
            ->addSelect([
                'target_achievement' => function ($query) {
                    $query->selectRaw('ROUND(COALESCE(SUM(achivement_percentage) / NULLIF(COUNT(*), 0), 0), 2)')
                        ->from('indicators')
                        ->whereColumn('indicators.project_id', 'projects.id')
                        ->where('status', 'active');
                },
            ]);
 */
        $query = Project::select('id', 'project_name', 'start_date')
            ->withCount([
                'indicators as total_indicators' => function ($query) {
                    $query->where('status', 'active');
                },
                'projectActivities as total_activities',
                'activityInfos as execute_activity',
            ])
            ->addSelect([
                'total_beneficiaries' => function ($query) {
                    $query->selectRaw('COUNT(DISTINCT beneficiary_id)')
                        ->from('beneficiary_assigns')
                        ->whereColumn('beneficiary_assigns.project_id', 'projects.id');
                },
                'target_achievement' => function ($query) {
                    $query->selectRaw('ROUND(COALESCE(SUM(achivement_percentage) / NULLIF(COUNT(*), 0), 0), 2)')
                        ->from('indicators')
                        ->whereColumn('indicators.project_id', 'projects.id')
                        ->where('status', 'active');
                },
            ])
            ->with('projectAchievementViews');
        if ($request->project_id) {
            $query->where('id', $request->project_id);
        }
        if ($fromDate && $toDate) {
            $query->whereBetween('start_date', [$fromDate, $toDate]);
        }
        $projectReports = $query->get();
        if ($request->has('download_pdf')) {
            if ($projectReports->isEmpty()) {
                return response()->json(['message' => "No data found"], 200);
            }
            $siteSettings = SiteSetting::first();
            $data = $projectReports;
            $pdfLoad = PDF::loadView('report.project_summary_report', compact('data', 'siteSettings', 'searchData'))
                ->setPaper('a4', 'landscape');
            return $pdfLoad->download("project_summary_report.pdf");
        }
        return response()->json($projectReports, 200);
    }
    public function indicatorGraph(Request $request)
    {
        if (!$request->indicator_id) {
            return response()->json([]);
        }
        $projectActivities = ProjectActivity::withCount(['beneficiaries', 'beneficiaryAttendances', 'surveys'])
            ->active()
            ->where('indicator_id', $request->indicator_id)->get()->append('progress');
        return response()->json($projectActivities);
    }
    public function surveyGraph(Request $request)
    {
        $query = Survey::with('surveyBeneficiaries:id,survey_id,total_mark')
            ->select('id', 'title', 'survey_number');
        if ($request->has('project_id')) {
            $query->where('project_id', $request->project_id);
        }
        if ($request->has('indicator_id')) {
            $query->where('indicator_id', $request->indicator_id);
        }
        if ($request->has('activity_id')) {
            $query->where('activity_id', $request->activity_id);
        }
        $surveys = $query->get();
        $totalSurveys = $surveys->count();
        $surveys->each(function ($survey) use ($totalSurveys) {
            $totalMarks = $survey->surveyBeneficiaries->sum('total_mark');
            $allBeneficiaries = $survey->surveyBeneficiaries->count('beneficiary_id');
            $average = $allBeneficiaries > 0 ? $totalMarks / $allBeneficiaries : 0;
            $survey->average = number_format($average, 2);
            ;
            $survey->total_beneficiary = $allBeneficiaries;
            $survey->total_survey = $totalSurveys;
        });
        return response()->json($surveys);
    }
}
