<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Survey;
use App\Models\SurveyForm;
use App\Models\Beneficiary;
use Illuminate\Http\Request;
use App\Models\SurveyBeneficiary;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\SurveyBeneficiaryResult;
use Illuminate\Support\Facades\Validator;

class SurveyController extends Controller
{
    public function getSurvey(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'limit' => 'nullable|integer|min:1',
                'search.query' => 'nullable|string',
                'search.project_id' => 'nullable|integer',
                'search.indicator_id' => 'nullable|integer',
                'search.activity_id' => 'nullable|integer',
                'search.survey_date' => 'nullable|date',
            ],
            [
                'search.project_id.integer' => 'The project is not valid.',
                'search.indicator_id.integer' => 'The indicator is not valid.',
                'search.activity_id.integer' => 'The activity is not valid.',
            ]
        );
        if ($validator->fails()) {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => $validator->errors()->all(),
            ], 422);
        } else {
            $limit = $request->input('limit');
            $search = $request->input('search', []);

            $query = Survey::with('project:id,project_name', 'indicator:id,title', 'activity:id,title')
                ->select('id', 'project_id', 'indicator_id', 'activity_id', 'title', 'survey_date')
            ;

            if (!empty($search['query'])) {
                $query->where('surveys.title', 'LIKE', "%{$search['query']}%")
                    ->orWhere('surveys.survey_number', 'like', '%' . $search['query'] . '%');
            }
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
                $query->whereDate('survey_date', '>=', $startDate)
                    ->whereDate('survey_date', '<=', $endDate);
            }

            $limit = $request->input('limit', 10);
            $surveys = $query->limit($limit)
                ->latest()
                ->get();

            if ($surveys->isEmpty()) {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'message' => 'No Survey is found',
                ], 422);
            }
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $surveys,
            ]);
        }
    }

    public function surveyAdd(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'project_id' => 'required|integer',
                'indicator_id' => 'required|integer',
                'activity_id' => 'required|integer',
                'title' => 'required|string',
                'survey_date' => 'required|date',
                'remarks' => 'nullable|string',
            ],
            [
                'project_id.integer' => 'The project is not valid.',
                'indicator_id.integer' => 'The indicator is not valid.',
                'activity_id.integer' => 'The activity is not valid.',
            ]
        );
        if ($validator->fails()) {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => $validator->errors()->all(),
            ], 422);
        } else {
            $survey = Survey::create([
                'project_id' => $request->project_id,
                'indicator_id' => $request->indicator_id,
                'activity_id' => $request->activity_id,
                'title' => $request->title,
                'survey_number' => '111' . mt_rand(100000, 999999),
                'survey_date' => convertToDatabaseDate($request->survey_date),
                'remarks' => $request->remarks,
            ]);
            if ($survey) {
                return response()->json([
                    'success' => 1,
                    'error' => 0,
                    'data' => $survey,
                ]);
            } else {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'error_message' => 'Failed to create Survey',
                ], 500);
            }

        }

    }

    public function surveyView($id)
    {
        $survey = Survey::with('project:id,project_name', 'indicator:id,title', 'activity:id,title')
            ->select('id', 'project_id', 'indicator_id', 'activity_id', 'title', 'survey_date', 'remarks')
            ->find($id);
        if ($survey) {
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $survey,
            ]);
        } else {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => 'Survey not found',
            ], 404);
        }
    }

    public function surveyActivity(Request $request, $id)
    {
        $survey = Survey::with('project:id,project_name', 'indicator:id,title', 'activity:id,title')
            ->select('project_id', 'activity_id', 'indicator_id')
            ->find($id);
        if (!$survey) {
            return response()->json(['error' => 'Survey not found'], 404);
        }
        $activity_id = $survey->activity_id;
        $surveyQuestions = $this->getSurveyQuestions($activity_id);
        return response()->json([
            'survey' => $survey,
            'survey_questions' => $surveyQuestions,
        ]);
    }

    public function storeSurveyActivity(Request $request)
    {
        DB::beginTransaction();
        try {
            $surveyBeneficiary = SurveyBeneficiary::create([
                'survey_id' => $request->input('survey_id'),
                'beneficiary_id' => $request->beneficiary_info['beneficiary_id'],
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
            return response()->json([
                'success' => 1,
                'error' => 0,
                'message' => 'Survey details saved successfully.',
            ], 201);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => 'An error occurred: ' . $e->getMessage(),
            ], 404);
        }
    }

    public function getSurveyBeneficiaries(Request $request)
    {
        $beneficiaries = Beneficiary::where('beneficiary_no', $request->beneficiary_no)->
            select('id', 'full_name', 'date_of_birth', 'mobile_no', 'gender')
            ->get();
        return response()->json($beneficiaries);
    }
    public function getSurveyQuestions($activity_id)
    {
        $surveyQuestions = SurveyForm::where('activity_id', $activity_id)
            ->with(['questions.answers'])
            ->get();
        return $surveyQuestions;
    }
}
