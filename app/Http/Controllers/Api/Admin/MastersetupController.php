<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Exam;
use App\Models\Asset;
use App\Models\Group;
use App\Models\State;
use App\Models\Wealth;
use App\Models\Disease;
use App\Models\Project;
use App\Models\Upazila;
use App\Models\District;
use App\Models\Relation;
use App\Models\Indicator;
use App\Models\Occupation;
use Illuminate\Http\Request;
use App\Models\ProjectActivity;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Admin\System\LibController;

class MastersetupController extends Controller
{
    public function getStates(Request $request)
    {
        if ($request->status == 'active') {
            $states = State::where('status', $request->status)
                ->select('id', 'country_id', 'name')
                ->get();
            if ($states->isNotEmpty()) {
                return response()->json([
                    'success' => 1,
                    'error' => 0,
                    'data' => $states,
                ], 201);
            } else {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'message' => 'No active states found.',
                ]);
            }
        } else {
            $states = State::select('id', 'country_id', 'name')->get();
            if ($states->isNotEmpty()) {
                return response()->json([
                    'success' => 1,
                    'error' => 0,
                    'data' => $states,
                ]);
            } else {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'message' => 'No states found.',
                ]);
            }
        }
    }

    public function getDistricts(Request $request)
    {
        $query = District::query();
        if ($request->state_id) {
            $query->where('state_id', $request->state_id);
        }
        if ($request->status == 'active') {
            $query->where('status', 'active');
        }
        $districts = $query->select('id', 'state_id', 'name')->get();
        if ($districts->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $districts,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No districts found.',
            ]);
        }
    }

    public function getUpazila(Request $request)
    {
        $query = Upazila::query();

        if ($request->state_id) {
            $query->where('state_id', $request->state_id);
        }
        if ($request->district_id) {
            $query->where('district_id', $request->district_id);
        }
        if ($request->status == 'active') {
            $query->where('status', 'active');
        }

        $upazilas = $query->select('id', 'state_id', 'district_id', 'name')->get();
        if ($upazilas->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $upazilas,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No upazilas found.',
            ]);
        }
    }

    public function getDiseases(Request $request)
    {
        $query = Disease::query();

        if ($request->status == 'active') {
            $query->where('status', $request->status);
        }
        $diseases = $query->select('id', 'title', 'type', 'status')->get();
        if ($diseases->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $diseases,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No diseases found.',
            ]);
        }
    }

    public function getExams(Request $request)
    {
        $query = Exam::query();

        if ($request->status == 'active') {
            $query->where('status', $request->status);
        }
        $exams = $query->select('id', 'title', 'level', 'status')->get();
        if ($exams->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $exams,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No exam found.',
            ]);
        }
    }

    public function getGroups(Request $request)
    {
        $query = Group::query();

        if ($request->status == 'active') {
            $query->where('status', $request->status);
        }
        $groups = $query->select('id', 'title', 'status')->get();
        if ($groups->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $groups,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No group found.',
            ]);
        }
    }
    public function getOccupations(Request $request)
    {
        $query = Occupation::query();

        if ($request->status == 'active') {
            $query->where('status', $request->status);
        }
        $occupations = $query->select('id', 'title', 'status')->get();
        if ($occupations->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $occupations,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No occupations found.',
            ]);
        }
    }
    public function getRelations(Request $request)
    {
        $query = Relation::query();

        if ($request->status == 'active') {
            $query->where('status', $request->status);
        }
        $relations = $query->select('id', 'title', 'status')->get();
        if ($relations->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $relations,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No relations found.',
            ]);
        }
    }
    public function getWealths(Request $request)
    {
        $query = Wealth::query();

        if ($request->status == 'active') {
            $query->where('status', $request->status);
        }
        $wealths = $query->select('id', 'title', 'status')->get();
        if ($wealths->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $wealths,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No wealths found.',
            ]);
        }
    }
    public function getAssets(Request $request)
    {
        $query = Asset::query();

        if ($request->status == 'active') {
            $query->where('status', $request->status);
        }
        $assets = $query->select('id', 'title', 'status')->get();
        if ($assets->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $assets,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No assets found.',
            ]);
        }
    }
    public function getLiability(Request $request)
    {
        $query = Asset::query();

        if ($request->status == 'active') {
            $query->where('status', $request->status);
        }
        $liability = $query->select('id', 'title', 'status')->get();
        if ($liability->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $liability,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No liability found.',
            ]);
        }
    }

    protected $libController;
    public function __construct(LibController $libController)
    {
        $this->libController = $libController;
    }
    public function getMaritalStatus()
    {
        $maritalStatus = $this->libController->maritalStatus();
        if (!empty($maritalStatus)) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $maritalStatus,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No Marital Status found.',
            ]);
        }
    }

    public function getGender()
    {
        $gender = $this->libController->gender();
        if (!empty($gender)) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $gender,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No gender found.',
            ]);
        }
    }
    public function getPhysicalCondition()
    {
        $physicalCondition = $this->libController->physicalCondition();
        if (!empty($physicalCondition)) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $physicalCondition,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No Physical Condition found.',
            ]);
        }
    }
    public function getAgeRanges()
    {
        $ageRanges = $this->libController->ages();
        if (!empty($ageRanges)) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $ageRanges,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No Age Range found.',
            ]);
        }
    }
    public function getOwnerships()
    {
        $ownerShips = $this->libController->sourceofOwnership();
        if (!empty($ownerShips)) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $ownerShips,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No Source of Ownership has found.',
            ]);
        }
    }








    public function getProjects()
    {
        $projects = Project::where('status', 'active')->select('id', 'project_name')->get();
        if ($projects->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $projects,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No projects found.',
            ]);
        }
    }

    public function getProjectIndicator(Request $request)
    {
        $query = Indicator::query();

        if ($request->project_id) {
            $query->where('project_id', $request->project_id)->where('status', 'active');
        }

        $indicators = $query->select('id', 'project_id', 'title', 'status')->get();
        if ($indicators->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $indicators,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No indicators found.',
            ]);
        }
    }

    public function getProjectActivities(Request $request)
    {
        $query = ProjectActivity::query();

        if ($request->project_id && $request->indicator_id) {
            $query->where('project_id', $request->project_id)
                ->where('indicator_id', $request->indicator_id)
                ->where('status', 'active');
        }

        $projectActivities = $query->select('id', 'project_id', 'indicator_id', 'title', 'status')->get();
        if ($projectActivities->isNotEmpty()) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $projectActivities,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No indicators found.',
            ]);
        }
    }
}
