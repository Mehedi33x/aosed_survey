<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Base\BaseController;
use App\Http\Resources\Resource;
use App\Models\SurveyForm;
use App\Models\SurveyQuestion;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Storage;

class SurveyFormController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = SurveyForm::with(['project:id,status,project_name', 'indicator:id,status,title', 'activity:id,status,title', 'questions:id,survey_form_id,question'])->latest();
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
                DB::beginTransaction();
                $existsSurveyForm = SurveyForm::where('project_id', $request->project_id)
                    ->where('indicator_id', $request->indicator_id)
                    ->where('activity_id', $request->activity_id)
                    ->exists();
                if ($existsSurveyForm) {
                    return response()->json(['exception' => 'Survey form already exists.'], 422);
                }

                $data = $request->except('questions');
                $questions = $request->questions;

                $res = SurveyForm::create($data);

                if ($questions != null) {
                    if (count($questions) > 0) {
                        $this->updateOrStoreQuestions($questions, $res);
                    }
                }
                DB::commit();
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                DB::rollback();
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SurveyForm  $surveyForm
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, SurveyForm $surveyForm)
    {

        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }
        return $surveyForm->load(
            'project:id,status,project_name',
            'indicator:id,status,title',
            'activity:id,status,title',
            'questions.answers');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\SurveyForm  $surveyForm
     * @return \Illuminate\Http\Response
     */
    public function edit(SurveyForm $surveyForm)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\SurveyForm  $surveyForm
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SurveyForm $surveyForm)
    {
        if ($this->validateCheck($request, $surveyForm->id)) {
            try {
                DB::beginTransaction();
                $data = $request->except('questions');
                $surveyForm->update($data);

                if (isset($request->questions)) {
                    $this->updateOrStoreQuestions($request->questions, $surveyForm);
                }
                DB::commit();
                return $this->responseReturn("create", $surveyForm);
            } catch (Exception $ex) {
                DB::rollback();
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SurveyForm  $surveyForm
     * @return \Illuminate\Http\Response
     */
    public function destroy(SurveyForm $surveyForm)
    {
        $res = $surveyForm->delete();
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
            'project_id' => 'required',
            'indicator_id' => 'required',
            'activity_id' => 'required',
            'title' => 'required',
        ], [
            //ex: 'name' => "This name is required" (custom message)
        ]);
    }

    public function updateOrStoreQuestions(array $questions, SurveyForm $surveyForm)
    {
        $extraUpdate = false;
        $questionIds = [];
        foreach ($questions as $questionData) {
            if (isset($questionData['id'])) {
                $oldQuestion = $surveyForm->questions()->where('id', $questionData['id'] ?? null)->first();
                if ($oldQuestion) {
                    $oldQuestion->update([
                        'question' => $questionData['question'],
                        'question_type' => $questionData['question_type'],
                        'mark' => $questionData['mark'],
                    ]);

                    if (isset($questionData['answers'])) {
                        $this->updateOrStoreAnswers($questionData['answers'], $oldQuestion);
                    }

                    $questionIds[] = $oldQuestion->id;
                    $extraUpdate = true;
                }
            } else {
                $question = $surveyForm->questions()->create([
                    'question' => $questionData['question'],
                    'question_type' => $questionData['question_type'],
                    'mark' => $questionData['mark'],
                ]);

                $questionIds[] = $question->id;
                $extraUpdate = true;

                if (isset($questionData['answers'])) {
                    $this->updateOrStoreAnswers($questionData['answers'], $question);
                }
            }
        }

        // delete old questions and answers
        $deleteableQuestions = $surveyForm->questions()->whereNotIn('id', $questionIds)->get();
        foreach ($deleteableQuestions as $deleteableQuestion) {
            // delete old answers
            $deleteableQuestion->answers()->delete();
            // delete old question
            $deleteableQuestion->delete();
        }

        return $extraUpdate;
    }

    public function updateOrStoreAnswers(array $answers, SurveyQuestion $question)
    {
        $answerIds = [];
        foreach ($answers as $answer) {
            if (isset($answer['id'])) {
                $oldAnswer = $question->answers()->where('id', $answer['id'])->first();
                if ($oldAnswer) {
                    $oldAnswer->update([
                        'answer' => $answer['answer'],
                        'mark' => $answer['mark'],
                    ]);

                    $answerIds[] = $oldAnswer->id;
                }
            } else {
                $answer = $question->answers()->create([
                    'answer' => $answer['answer'],
                    'mark' => $answer['mark'],
                ]);

                $answerIds[] = $answer->id;
            }
        }

        // delete old question answers
        $question->answers()->whereNotIn('id', $answerIds)->delete();
    }

}
