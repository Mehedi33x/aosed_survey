<template>
    <create-form @onSubmit='submit'>
        <div class="col-lg-12">
            <Fieldset>
                <template v-slot:name>Form</template>
                <template v-slot:content>
                    <Select title="Project" v-model="data.project_id" field="data.project_id" label="project_name"
                        :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--"
                        :closeOnSelect="true" :required="true" col="3" :req="true"
                        @update:modelValue="getIndicatorsByProject(data.project_id)" :disabled="!!routeId" />
                    <Select title="Indicator" v-model="data.indicator_id" field="data.indicator_id" label="title"
                        :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--"
                        :closeOnSelect="true" :required="true" col="3"
                        @update:modelValue="getActivityByIndicator(data.indicator_id)" :disabled="!!routeId" />
                    <Select title="Project Activity" v-model="data.activity_id" field="data.activity_id" label="title"
                        :reduce="(obj) => obj.id" :options="allActivity" placeholder="--Select One--"
                        :closeOnSelect="true" :required="true" col="3" :disabled="!!routeId" />
                    <Input v-model='data.title' field='data.title' title='Title' :req='true' col="3" />
                    <Switch v-model='data.status' field='data.status' title='Status' on-label='Active'
                        off-label='Deactive' :req='true'>
                    </Switch>
                    <h5 class=""><u>Questions:</u></h5>
                    <div class="q_box d-flex gap-2 gap-md-3 align-items-center w-100"
                        v-for="(question, questionIndex) in data.questions" :key="`question_${questionIndex}`">
                        <div class="q_item p-2 p-md-3 w-100">
                            <div class="col-sm-6 col-lg-3">
                                <Select title="Answer Type" v-model="question.question_type"
                                    field="data.questions[questionIndex].question_type" label="name"
                                    :reduce="(obj) => obj.value" :options="global.questionsType"
                                    placeholder="--Select One--" :closeOnSelect="true" :required="true" col="12"
                                    :req="true" />
                                <small v-if="question.typeError" class="text-danger">{{ question.typeError }}</small>
                            </div>

                            <label for="" class="form-label mt-3">{{ questionIndex + 1 }}.Question</label>

                            <div class="answer_box mb-3">
                                <div class="row flex-wrap flex-md-nowrap align-items-start">
                                    <div class="col-12 col-sm-9 col-md-10">
                                        <Input v-model="question.question" field="questions[questionIndex].question"
                                            :req="false" col="12" placeholder="Type question"
                                            @input="validateUniqueQuestions" />
                                        <small v-if="question.uniqueError" class="text-danger">{{ question.uniqueError
                                        }}</small>
                                    </div>
                                    <div class="col-12 col-sm-3 col-md-2">
                                        <!-- <label for="" class="form-label mt-2">Mark</label> -->
                                        <div class="mt-1 mt-sm-0 d-flex flex-column">
                                            <input type="text" v-model="question.mark" placeholder="Mark" class="col-12"
                                                @input="validateQuestionMarks(questionIndex)" />
                                            <small v-if="question.markError" class="text-danger">{{ question.markError
                                                }}</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div v-if="question.question_type === 'multiple' || question.question_type === 'single'">
                                <label for="" class="form-label mt-2">Answers</label>
                                <div class="answer_box mb-3" v-for="(answer, answerIndex) in question.answers"
                                    :key="`answer_${answerIndex}`">
                                    <div class="row flex-wrap flex-md-nowrap">
                                        <div class="col-md-8 col-xl-9">
                                            <Input v-model="answer.answer"
                                                field="questions[questionIndex].answers[answerIndex].answer"
                                                :req="false" col="12" placeholder="Type answer"
                                                @input="validateUniqueAnswers(questionIndex)" />
                                            <small v-if="answer.uniqueError" class="text-danger">{{ answer.uniqueError
                                            }}</small>
                                        </div>
                                        <div class="col-md-4 col-xl-3">
                                            <div class="d-flex gap-2 mt-1 mt-md-0">
                                                <div class="" style="width: 80px;">
                                                    <label for="" class="form-label mt-2">Mark</label>
                                                    <input type="text" v-model="answer.mark" placeholder="Mark"
                                                        class="col-12"
                                                        @input="validateAnswerMarks(questionIndex, answerIndex)" />
                                                </div>
                                                <div class="icon">
                                                    <div
                                                        class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                                                        <button v-if="question.answers.length > 1"
                                                            @click="deleteAnswer(questionIndex, answerIndex)"
                                                            type="button" class="btns delete_one"
                                                            data-bs-toggle="tooltip" data-bs-placement="top"
                                                            data-bs-title="Delete" v-x-tooltip>
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                height="24" viewBox="0 0 24 24" fill="none"
                                                                stroke="currentColor" stroke-width="2"
                                                                stroke-linecap="round" stroke-linejoin="round"
                                                                class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                                                                data-bs-toggle="tooltip" data-bs-placement="top"
                                                                data-bs-title="Delete" v-x-tooltip>
                                                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                                <path d="M4 7l16 0" />
                                                                <path d="M10 11l0 6" />
                                                                <path d="M14 11l0 6" />
                                                                <path
                                                                    d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                                                                <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                                                            </svg>
                                                        </button>
                                                        <button @click="addAnswerRow(questionIndex)" type="button"
                                                            class="btns add_more" data-bs-toggle="tooltip"
                                                            data-bs-placement="top" data-bs-title="Add" v-x-tooltip>
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                height="24" viewBox="0 0 24 24" fill="none"
                                                                stroke="currentColor" stroke-width="2"
                                                                stroke-linecap="round" stroke-linejoin="round"
                                                                class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                                                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                                <path d="M12 5l0 14" />
                                                                <path d="M5 12l14 0" />
                                                            </svg>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <small v-if="answer.markError" class="text-danger">{{ answer.markError
                                            }}</small>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="icon">
                            <div class="multiple_fields_actions_btn d-flex flex-column align-items-center gap-2">
                                <button v-if="data.questions.length > 1" @click="deleteQuestion(questionIndex)"
                                    type="button" class="btns delete_one" data-bs-toggle="tooltip"
                                    data-bs-placement="top" data-bs-title="Delete" v-x-tooltip>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                                        data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Delete"
                                        v-x-tooltip>
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path d="M4 7l16 0" />
                                        <path d="M10 11l0 6" />
                                        <path d="M14 11l0 6" />
                                        <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                                        <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                                    </svg>
                                </button>
                                <button @click="addQuestionsrow" type="button" class="btns add_more"
                                    data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add" v-x-tooltip>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path d="M12 5l0 14" />
                                        <path d="M5 12l14 0" />
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </template>
            </Fieldset>
        </div>
    </create-form>
</template>


<script>
const model = 'surveyForm';
export default {
    data() {
        return {
            model: model,
            page_title: '',
            data: {
                status: 'active',
                questions: [
                    {
                        question: "",
                        question_type: "",
                        mark: "",
                        markError: "",
                        answers: [
                            {
                                answer: "",
                                mark: "",
                                markError: "",
                            }
                        ]
                    },
                ],
            },
            allProjects: [],
            allIndicators: [],
            allActivity: [],
        };
    },

    provide() {
        return {
            validate: this.validation,
        };
    },
    methods: {
        async checkIfSurveyExists() {
            try {
                const response = await axios.get('/check-survey-exists', {
                    params: {
                        project_id: this.data.project_id,
                        indicator_id: this.data.indicator_id,
                        activity_id: this.data.activity_id
                    }
                });
                return response.data.exists;
            } catch (error) {
                console.error('Error checking if survey exists:', error);
                return false;
            }
        },

        submit: function (e) {
            this.$validate().then((res) => {
                let errorCount = this.validation.countErrors();

                this.data.questions.forEach((question, questionIndex) => {
                    if (!question.question_type) {
                        question.typeError = "Type is required";
                        errorCount++;
                    } else {
                        question.typeError = "";
                    }

                    if (!question.question.trim()) {
                        question.uniqueError = "Question is required";
                        errorCount++;
                    } else {
                        question.uniqueError = "";
                    }
                    if (!this.isPositiveNumber(question.mark)) {
                        errorCount++;
                    }
                    if (!question.mark) {
                        question.markError = `Question mark is required`;
                        errorCount++;
                    }
                    question.answers.forEach((answer, answerIndex) => {
                        if (question.question_type == 'single' || question.question_type == 'multiple') {

                            if (!answer.answer.trim()) {
                                answer.uniqueError = "Answer is required";
                                errorCount++;
                            } else {
                                answer.uniqueError = "";
                            }
                            if (!this.isPositiveNumber(answer.mark)) {
                                errorCount++;
                            }
                            if (!answer.mark) {
                                console.log('a m nai');
                                answer.markError = `Answer ${answerIndex + 1} mark is required`;
                                errorCount++;
                            }
                        }

                    });
                });
                if (errorCount > 0) {
                    console.log(this.validation.allErrors());
                    this.$toast('You need to fill ' + errorCount + ' more empty mandatory fields', 'warning');
                    return false;
                }
                if (res) {
                    if (this.data.id) {
                        this.update(this.model, this.data, this.data.id);
                    } else {
                        this.store(this.model, this.data);
                    }
                }
            });
        },
        addQuestionsrow() {
            this.data.questions.push({
                question: "",
                mark: "",
                error: "",
                answers: [{ answer: "", mark: "", error: "" }]
            });
        },
        deleteQuestion(index) {
            this.data.questions.splice(index, 1);
        },
        addAnswerRow(questionIndex) {
            this.data.questions[questionIndex].answers.push({
                answer: "",
                mark: "",
                error: ""
            });
        },
        deleteAnswer(questionIndex, answerIndex) {
            this.data.questions[questionIndex].answers.splice(answerIndex, 1);
        },
        validateUniqueQuestions() {
            const questionsSet = new Set();
            this.data.questions.forEach((question) => {
                if (questionsSet.has(question.question)) {
                    question.uniqueError = "This question is already added";
                } else {
                    questionsSet.add(question.question);
                    question.uniqueError = "";
                }
            });
        },
        validateUniqueAnswers(questionIndex) {
            const answersSet = new Set();
            this.data.questions[questionIndex].answers.forEach((answer) => {
                if (answersSet.has(answer.answer)) {
                    answer.uniqueError = "This answer is already added";
                } else {
                    answersSet.add(answer.answer);
                    answer.uniqueError = "";
                }
            });
        },
        validateQuestionMarks(questionIndex) {
            const question = this.data.questions[questionIndex];
            const questionMark = question.mark;

            if (!this.isPositiveNumber(questionMark)) {
                question.markError = "Must be a positive number";
            } else {
                question.markError = "";
            }
        },
        validateAnswerMarks(questionIndex, answerIndex) {
            const question = this.data.questions[questionIndex];
            const questionMark = Number(question.mark);
            const answerMark = Number(question.answers[answerIndex].mark);

            if (!this.isPositiveNumber(answerMark)) {
                question.answers[answerIndex].markError = "Must be a positive number";
            } else if (question.question_type === 'single') {
                //single answer
                if (answerMark > questionMark) {
                    question.answers[answerIndex].markError = "Can't exceed question mark";
                } else {
                    question.answers[answerIndex].markError = "";
                }
            } else if (question.question_type === 'multiple') {
                //multiple answer
                const totalMarks = question.answers.reduce((sum, answer) => sum + Number(answer.mark || 0), 0);
                if (totalMarks > questionMark) {
                    question.answers[answerIndex].markError = "Can't exceed question mark";
                } else {
                    question.answers[answerIndex].markError = "";
                }
            } else {
                question.answers[answerIndex].markError = "";
            }
        },
        isPositiveNumber(value) {
            const numValue = Number(value);
            const valueStr = String(value);
            if (value === undefined || value === null || isNaN(numValue)) {
                return false;
            } else if (numValue < 0) {
                return false;
            } else if (valueStr.startsWith('0') && valueStr.length > 1) {
                return false;
            } else {
                return true;
            }
        },
        // API section
        getProjects() {
            axios.get("/get-projects", { params: { status: "active" } }).then((res) => (this.allProjects = res.data));
        },
        getIndicatorsByProject(id) {
            this.data.indicator_id = null;
            this.allIndicators = [];
            if (id !== null) {
                this.getIndicators(id);
            }
        },
        getIndicators(id) {
            axios.get("/get-all-indicators", { params: { id: id, status: "active" } })
                .then((res) => (this.allIndicators = res.data))
                .catch(error => console.error('Error fetching indicators:', error));
        },
        getActivityByIndicator(id) {
            this.data.activity_id = null;
            this.allActivity = [];
            if (id !== null) {
                this.getActivity(id);
            }
        },
        getActivity(id) {
            axios.get("/get-activities", { params: { id: id, status: "active", is_surveyable: "1" } })
                .then((res) => (this.allActivity = res.data))
                .catch(error => console.error('Error fetching activities:', error));
        }
    },
    watch: {
        'data.questions': {
            deep: true,
            handler(newQuestions) {
                newQuestions.forEach((question, questionIndex) => {
                    this.$watch(
                        () => question.question_type,
                        (newType, oldType) => {
                            if (newType !== oldType) {
                                this.data.questions[questionIndex].question = "";
                                this.data.questions[questionIndex].mark = "";
                                this.data.questions[questionIndex].answers = [
                                    { answer: "", mark: "", markError: "" }
                                ];
                            }
                            if (!newType) {
                                this.data.questions[questionIndex].typeError = "Type is required";
                            } else {
                                this.data.questions[questionIndex].typeError = "";
                            }
                        }
                    );
                    this.validateQuestionMarks(questionIndex);
                    question.answers.forEach((_, answerIndex) => {
                        this.validateAnswerMarks(questionIndex, answerIndex);
                    });
                });
            }
        },

    },
    mounted() {
        this.routeId = this.$route.params.id;
    },
    created() {
        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + ' Edit';
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.page_title = this.headline(this.model) + ' Create';
        }
        this.getProjects();
    },

    validators: {
        'data.title': function (value = null) { return Validator.value(value).required('Title is required'); },

        "data.project_id": function (value = null) {
            return Validator.value(value).required("Project Name is required");
        },
        "data.indicator_id": function (value = null) {
            if (this.data.project_id) {
                return Validator.value(value).required("Indicator is required");
            }
        },
        "data.activity_id": function (value = null) {
            if (this.data.indicator_id) {
                return Validator.value(value).required("Project Activity is required");
            }
        },
        "data.status": function (value = null) {
            return Validator.value(value).required("Status is required");
        },
    },
}
</script>
