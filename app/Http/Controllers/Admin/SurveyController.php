<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\Survey;
use App\Models\SurveyBeneficiary;
use App\Models\SurveyBeneficiaryResult;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Storage;

class SurveyController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Survey::with('project', 'indicator', 'activity')->latest();
        $query->whereLike($request->field_name, $request->value);

        if ($request->project_id && $request->indicator_id && $request->activity_id) {
            $query->where('project_id', $request->project_id)
                ->where('indicator_id', $request->indicator_id)->where('activity_id', $request->activity_id);
        } elseif ($request->project_id && $request->indicator_id) {
            $query->where('project_id', $request->project_id)->where('indicator_id', $request->indicator_id);
        } elseif ($request->project_id) {
            $query->where('project_id', $request->project_id);
        }

        if ($request->from_date && $request->to_date) {
            $startDate = vue_to_server_date($request->from_date);
            $endDate = vue_to_server_date($request->to_date);

            $query->whereDate('survey_date', '>=', $startDate)
                ->whereDate('survey_date', '<=', $endDate);
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
                $data = $request->all();
                $data['survey_number'] = '111' . mt_rand(100000, 999999);
                $data['survey_date'] = convertToDatabaseDate($request->survey_date);
                $res = Survey::create($data);
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Survey  $survey
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Survey $survey)
    {
        $survey = Survey::with('project:id,project_name',
            'indicator:id,status,title',
            'activity:id,title',
            'surveyBeneficiaries',
            'surveyBeneficiaries.admin:id,name',
            'surveyBeneficiaries.group:id,title',
            'surveyBeneficiaries.beneficiary:id,full_name,date_of_birth,present_address,mobile_no,image,nid',
            'surveyBeneficiaries.beneficiary.beneficiaryOccupations.occupations:id,title',
            'surveyBeneficiaries.beneficiary.beneficiaryEducations.exam:id,title',
            'surveyBeneficiaryResults.surveyQuestions.answers'
        )->find($survey->id);
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        return $survey;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Survey  $survey
     * @return \Illuminate\Http\Response
     */
    public function edit(Survey $survey)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Survey  $survey
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Survey $survey)
    {
        if ($this->validateCheck($request, $survey->id)) {
            try {
                $data = $request->all();
                $data['survey_date'] = convertToDatabaseDate($request->survey_date);
                $survey->fill($data)->save();
                return $this->responseReturn("update", $survey);
            } catch (Exception $ex) {
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Survey  $survey
     * @return \Illuminate\Http\Response
     */
    public function destroy(Survey $survey)
    {
        // delete

        $res = $survey->delete();
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
            //ex: 'name' => "This surveyStart is required" (custom message)
        ]);
    }

    public function surveyStart($id)
    {
        $survey = Survey::with('project', 'indicator', 'activity')->select('project_id', 'activity_id', 'indicator_id')->find($id);
        return response()->json($survey);
    }

    public function storeDetails(Request $request)
    {
        DB::beginTransaction();
        try {
            $surveyBeneficiary = SurveyBeneficiary::create([
                'survey_id' => $request->input('survey_id'),
                'beneficiary_id' => $request->input('beneficiary_info.beneficiary_id'),
                'survey_date' => now(),
                'admin_id' => Auth::guard('admin')->id(),
                'group_id' => $request->group_id,
                'total_mark' => $request->input('total_marks'),
                'remarks' => $request->input('remarks'),
            ]);

            foreach ($request->input('questionAnswers', []) as $question) {
                $questionId = $question['question_id'];
                $questionMark = $question['question_mark'];
                $questionType = $question['question_type'];

                if ($questionType === 'single' || $questionType === 'multiple') {
                    $answers = collect($question['selectedAnswers'])->pluck('answer_id')->toJson();
                    $marks = collect($question['selectedAnswers'])->sum('mark');
                    SurveyBeneficiaryResult::create([
                        'survey_id' => $request->input('survey_id'),
                        'survey_beneficiary_id' => $surveyBeneficiary->id,
                        'question_id' => $questionId,
                        'answer' => $answers,
                        'mark' => $marks,
                    ]);
                } elseif ($questionType === 'text') {
                    $answerText = $question['selectedAnswers'][0]['text'];
                    SurveyBeneficiaryResult::create([
                        'survey_id' => $request->input('survey_id'),
                        'survey_beneficiary_id' => $surveyBeneficiary->id,
                        'question_id' => $questionId,
                        'answer_text' => $answerText,
                        'mark' => 10,
                    ]);
                }
            }

            DB::commit();
            return response()->json(['success' => true, 'message' => 'Survey details saved successfully.']);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['success' => false, 'message' => 'An error occurred: ' . $e->getMessage()]);
        }
    }

    public function surveyBeneficiariesDelete(Request $request)
    {
        $beneficiaryIds = $request->input('beneficiary_ids');
        if (empty($beneficiaryIds)) {
            return response()->json(['message' => 'No beneficiaries selected'], 400);
        }
        try {
            DB::beginTransaction();
            foreach ($beneficiaryIds as $beneficiaryId) {
                $surveyBeneficiaries = SurveyBeneficiary::where('beneficiary_id', $beneficiaryId)->pluck('id');
                if ($surveyBeneficiaries->isNotEmpty()) {
                    SurveyBeneficiaryResult::whereIn('survey_beneficiary_id', $surveyBeneficiaries)->delete();
                }
                SurveyBeneficiary::where('beneficiary_id', $beneficiaryId)->delete();
            }
            DB::commit();
            return response()->json(['message' => 'Beneficiaries deleted successfully'], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Error occurred while deleting beneficiaries',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

}
