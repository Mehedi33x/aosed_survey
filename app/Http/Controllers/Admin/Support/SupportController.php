<?php

namespace App\Http\Controllers\Admin\Support;

use App\Models\Exam;
use App\Models\Admin;
use App\Models\Asset;
use App\Models\Group;
use App\Models\State;
use App\Models\Thana;
use App\Models\Wealth;
use App\Models\Country;
use App\Models\Disease;
use App\Models\Project;
use App\Models\Upazila;
use App\Models\District;
use App\Models\Relation;
use App\Models\Indicator;
use App\Models\Liability;
use App\Models\Occupation;
use App\Models\SurveyForm;
use App\Models\Beneficiary;
use Illuminate\Http\Request;
use App\Models\ProjectActivity;
use App\Http\Resources\Resource;
use App\Models\BeneficiaryAssign;
use App\Models\SurveyBeneficiary;
use App\Http\Controllers\Controller;

use function GuzzleHttp\Promise\all;
use App\Models\SurveyBeneficiaryResult;

class SupportController extends Controller
{
    public function countries()
    {
        return Country::select('id', 'name')->get();
    }

    public function getStates(Request $request)
    {
        $states = State::when($request->has('status'), function ($query) use ($request) {
            return $query->where('status', $request->status);
        })
            ->select('id', 'name', 'status')
            ->get();

        return response()->json($states);
    }
    public function getDistricts(Request $request)
    {
        if ($request->id && $request->status) {
            $districts = District::where('state_id', $request->id)
                ->where('status', $request->status)->select('id', 'name', 'status')->get();
            return response()->json($districts);
        } elseif ($request->id) {
            $districts = District::where('state_id', $request->id)->select('id', 'name', 'status')->get();
            return response()->json($districts);
        }
        abort(404);
    }
    public function getIdWiseDistricts(Request $request)
    {
        $district = District::where('state_id', $request->id)->active()->get();
        return $district;
    }

    public function getExams()
    {
        return Exam::where('status', 'active')->get();
    }
    public function getRelations()
    {
        return Relation::where('status', 'active')->get();
    }
    public function getOccupations()
    {
        return Occupation::where('status', 'active')->get();
    }
    public function getDiseases()
    {
        return Disease::where('status', 'active')->get();
    }
    public function getWealths()
    {
        return Wealth::where('status', 'active')->get();
    }
    public function getAsset()
    {
        return Asset::where('status', 'active')->get();
    }
    public function getLiabilities()
    {
        return Liability::where('status', 'active')->get();
    }

    public function getUpazillas(Request $request)
    {
        if ($request->id && $request->status) {
            $upazillas = Upazila::where('district_id', $request->id)
                ->where('status', $request->status)->select('id', 'name', 'status')->get();
            return response()->json($upazillas);
        } elseif ($request->id) {
            $upazillas = Upazila::where('district_id', $request->id)->select('id', 'name', 'status')->get();
            return response()->json($upazillas);
        }
        abort(404);
    }

    public function getAllProjects(Request $request)
    {
        $status = $request->status;
        $projects = Project::when($status, function ($query) use ($status) {
            return $query->where('status', $status);
        })->select('id', 'project_name', 'status')->get();

        return response()->json($projects);
    }
    public function getIdWiseUpazilas(Request $request)
    {
        $upazila = Upazila::where('district_id', $request->id)->active()->get();
        return $upazila;
    }
    public function getThana(Request $request)
    {
        $thanas = Thana::where('upazila_id', $request->upazila_id)->active()->get();
        return $thanas;
    }
    public function getActiveProjects()
    {
        $projects = Project::where('status', 'active')->select('id', 'project_name')->get();
        return response()->json($projects);
    }

    public function getAllIndicators(Request $request)
    {
        if ($request->id && $request->status) {
            $indicators = Indicator::with(['projectActivities'])->where('project_id', $request->id)->where('status', $request->status)->get();
            return response()->json($indicators);
        } elseif ($request->id) {
            $indicators = Indicator::with(['projectActivities'])->where('project_id', $request->id)->get();
            return response()->json($indicators);
        }
        abort(404);
    }
    public function getIdWiseIndicators(Request $request)
    {
        $indicators = Indicator::where('project_id', $request->project_id)->select('id', 'title')->get();
        return response()->json($indicators);
    }

    public function getProjects()
    {
        $projects = Project::select('id', 'project_name', 'status')->get();
        return response()->json($projects);
    }

    public function getActivities(Request $request)
    {
    
        if ($request->is_surveyable == 1) {
            $projectActivity = ProjectActivity::when($request->has('id'), function ($query) use ($request) {
                return $query->where('indicator_id', $request->id);
            })
                ->when($request->has('status'), function ($query) use ($request) {
                    return $query->where('status', $request->status)->where('is_surveyable', 1);
                })
                ->select('id', 'title', 'status', 'is_surveyable', 'beneficiary_attendance')
                ->get();
            return response()->json($projectActivity);
        }
        if ($request->beneficiary_attendance == true) {
            $projectActivity = ProjectActivity::when($request->has('id'), function ($query) use ($request) {
                return $query->where('indicator_id', $request->id);
            })
                ->when($request->has('status'), function ($query) use ($request) {
                    return $query->where('status', $request->status)->where('beneficiary_attendance', 1);
                })
                ->select('id', 'title', 'status', 'is_surveyable', 'beneficiary_attendance')
                ->get();
            return response()->json($projectActivity);
        } else {
            $projectActivity = ProjectActivity::when($request->has('id'), function ($query) use ($request) {
                return $query->where('indicator_id', $request->id);
            })
                ->when($request->has('status'), function ($query) use ($request) {
                    return $query->where('status', $request->status);
                })
                ->select('id', 'title', 'status')
                ->get();
            return response()->json($projectActivity);
        }
    }
    // fetching project wise activity
    public function getProjectActivities(Request $request)
    {
    
        $projectActivities = ProjectActivity::where('project_id', $request->project_id)
            ->where('status', $request->status)
            ->select('id', 'title')->get();
        return response()->json($projectActivities);
    }

    public function getBeneficiary(Request $request)
    {
        if ($request->search_data) {
        
            $beneficiaries = Beneficiary::select('id', 'full_name', 'nid', 'mobile_no', 'status')
                ->where('beneficiary_no', $request->search_data)
                ->get();
            if ($beneficiaries->isEmpty()) {
                return response()->json([
                    'message' => 'No beneficiaries found for the provided search data.',
                ], 404);
            }
            $assignmentQuery = BeneficiaryAssign::where('beneficiary_id', $beneficiaries->first()->id)
                ->where('project_id', $request->project_id)
                ->where('indicator_id', $request->indicator_id)
                ->where('activity_id', $request->activity_id)
            ;
            if ($request->filled('group_id')) {
                $assignmentQuery->where('group_id', $request->group_id);
            }
            $existingAssignment = $assignmentQuery->exists();
            if ($existingAssignment) {
                return response()->json([
                    'message' => 'This beneficiary is already assigned with the same project, indicator, activity, and group.',
                ], 400);
            }
            return response()->json([
                'message' => 'Beneficiary found.',
                'data' => $beneficiaries,
            ], 200);

        }


        $activityid = $request->input('activity_id');
        $group = $request->input('group_id');

        $beneficiaries = Beneficiary::select('id', 'full_name', 'nid', 'mobile_no', 'status')
            ->whereIn('id', function ($query) use ($activityid, $group) {
                $query->select('beneficiary_id')
                    ->from('beneficiary_assigns')
                    ->where('activity_id', $activityid);
                if ($group) {
                    $query->where('group_id', $group);
                }
            })->get();

        return $beneficiaries;

    }

    public function searchBeneficiaries(Request $request)
    {
        if ($request->has('data') || $request->has('pagination') || $request->has('page')) {
            $data = $request->input('data');
            $assignedBeneficiaries = $data['assignedBeneficiaries'] ?? [];

            $beneficiaries = Beneficiary::with('beneficiaryOccupations.occupations');
            $minAge = $maxAge = null;
            if (isset($data['age']) && !empty($data['age'])) {
                $ageRange = json_decode($data['age'], true);
                $minAge = $ageRange['min'] ?? null;
                $maxAge = $ageRange['max'] ?? null;
            }
            $currentDate = time();

            if ($minAge && $maxAge) {
                $minDateOfBirth = date('Y-m-d', strtotime("-$maxAge years", $currentDate));
                $maxDateOfBirth = date('Y-m-d', strtotime("-$minAge years", $currentDate));
            }

            if (!empty($data['state_id'])) {
                $beneficiaries->where('pre_state_id', $data['state_id']);
            }

            if (!empty($data['district_id'])) {
                $beneficiaries->where('pre_district_id', $data['district_id']);
            }

            if (!empty($data['upazila_id'])) {
                $beneficiaries->where('pre_upazilla_id', $data['upazila_id']);
            }

            if (!empty($minDateOfBirth) && !empty($maxDateOfBirth)) {
                $beneficiaries->whereBetween('date_of_birth', [$minDateOfBirth, $maxDateOfBirth]);
            }

            if (!empty($data['gender'])) {
                $beneficiaries->where('gender', $data['gender']);
            }

            if (!empty($data['marital_status'])) {
                $beneficiaries->where('marital_status', $data['marital_status']);
            }

            if (!empty($data['occupation_id'])) {
                $beneficiaries->whereHas('beneficiaryOccupations', function ($query) use ($data) {
                    $query->where('occupation_id', $data['occupation_id']);
                });
            }

            if (!empty($data['exam_id'])) {
                $beneficiaries->whereHas('beneficiaryEducations', function ($query) use ($data) {
                    $query->where('exam_id', $data['exam_id']);
                });
            }

            if (!empty($data['project_id']) && !empty($data['indicator_id']) && !empty($data['activity_id'])) {
                $beneficiaries->whereDoesntHave('beneficiaryAssigns', function ($query) use ($data) {
                    $query->where('project_id', $data['project_id'])
                        ->where('indicator_id', $data['indicator_id'])
                        ->where('activity_id', $data['activity_id']);
                })->where(function ($query) use ($data) {
                    $project = Project::find($data['project_id']);
                    $query->where('pre_state_id', $project->state_id)
                        ->where('pre_district_id', $project->district_id)
                        ->where('pre_upazilla_id', $project->upazila_id);
                });

            }
            $result = $beneficiaries->paginate(10);
            return new Resource($result);
        } else {
            return response()->json(['exception' => 'No Beneficiary Found'], 422);
        }

    }

    public function getSurveyTitile(Request $request)
    {
        $data = ProjectActivity::where('status', "active")
            ->where('id', $request->activity_id)->select('title', 'status', 'created_at')->get();
        return response()->json($data);

    }

    public function getAdmins()
    {
        $admins = Admin::where('status', 'active')->select('status', 'name')->get();
        return response()->json($admins);
    }
    public function getSurveyQuestions(Request $request)
    {
        $surveyQuestions = SurveyForm::where('activity_id', $request->id)
            ->with(['questions.answers'])
            ->get();
        return response()->json($surveyQuestions);
    }
    public function getBeneficiaries(Request $request)
    {
        $query = BeneficiaryAssign::with('beneficiary')
            ->where('activity_id', $request->activity_id);
        if ($request->has('group_id') && !empty($request->group_id)) {
            $query->whereHas('beneficiary', function ($q) use ($request) {
                $q->where('group_id', $request->group_id);
            });
        }
        $beneficiaries = $query->get();

        return response()->json($beneficiaries);
    }
    public function getSurveyBeneficiaries(Request $request)
    {
        $beneficiaries = SurveyBeneficiary::select('survey_id', 'beneficiary_id')->where('survey_id', $request->survey_id)->get();
        return response()->json($beneficiaries);
    }

    public function getAllSurvey(Request $request)
    {
        if ($request->status == "all") {
            $survey = SurveyBeneficiaryResult::select('id', 'question_id')->with(['surveyQuestions:id,survey_form_id'])->get();
            return response()->json($survey);
        }
    }
    public function getAllGroups(Request $request)
    {
        $groups = Group::where('status', 'active')->select('id', 'title')->get();
        return response()->json($groups);
        /* if ($request->status == "active") {
            $groups = Group::where('status', $request->status)->select('id', 'title')->get();
            return response()->json($groups);
        } else {
            $groups = Group::select('id', 'title')->get();
            return response()->json($groups);
        } */
    }

}
