<template>
    <create-form @onSubmit='submit'>
        <div class="col-lg-12">
            <Fieldset>
                <template v-slot:name>Form</template>
                <template v-slot:content>
                    <Select title="Project" v-model="data.project_id" field="data.project_id" label="project_name"
                        :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--"
                        :closeOnSelect="true" :required="true" col="3" :req="true"
                        @update:modelValue="getIndicatorsByProject(data.project_id)" />

                    <Select title="Indicator" v-model="data.indicator_id" field="data.indicator_id" label="title"
                        :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--"
                        :closeOnSelect="true" :required="true" col="3"
                        @update:modelValue="getActivityByIndicator(data.indicator_id)" />

                    <Select title="Project Activity" v-model="data.activity_id" field="data.activity_id" label="title"
                        :reduce="(obj) => obj.id" :options="allActivity" placeholder="--Select One--"
                        :closeOnSelect="true" :required="true" col="3" />

                    <Input v-model='data.title' field='data.title' title='Title' :req='true' col="3" />

                    <Switch v-model='data.status' field='data.status' title='Status' on-label='Active'
                        off-label='Deactive' :req='true'>
                    </Switch>

                    <h5 class="mb-3"><u>Questions:</u></h5>
                    <div class="q_box d-flex gap-3 align-items-center w-100"
                        v-for="(question, questionIndex) in data.questions" :key="`question_${questionIndex}`">
                        <div class="q_item p-3 w-100">
                            <label for="" class="form-label mt-2">Question</label>
                            <div class="answer_box gap-3 d-flex align-items-center mb-3">
                                <Input v-model="question.question" field="questions[questionIndex].question"
                                    :req="false" col="10 col-xl-9" placeholder="Type question" />
                                <input type="text" v-model="question.mark" placeholder="Mark" class="col-2" />
                            </div>
                            <label for="" class="form-label mt-2">Answers</label>
                            <div class="answer_box gap-3 d-flex align-items-center mb-3"
                                v-for="(answer, answerIndex) in question.answers" :key="`answer_${answerIndex}`">
                                <Input v-model="answer.answer"
                                    field="questions[questionIndex].answers[answerIndex].answer" :req="false"
                                    col="8 col-xl-9" placeholder="Type answer" />
                                <input type="text" v-model="answer.mark" placeholder="Mark" class="col-2" />
                                <div class="icon">
                                    <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                                        <button v-if="question.answers.length > 1" @click="deleteAnswer(questionIndex, answerIndex)" type="button"
                                            class="btns delete_one" data-bs-toggle="tooltip" data-bs-placement="top"
                                            data-bs-title="Delete" v-x-tooltip>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round"
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
                                        <button @click="addAnswerRow(questionIndex)" type="button" class="btns add_more"
                                            data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add"
                                            v-x-tooltip>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
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
                        mark: 0,
                        answers: [
                            {
                                answer: "",
                                mark: 0
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
        submit: function (e) {
            this.$validate().then((res) => {
                const error = this.validation.countErrors();

                if (error > 0) {
                    console.log(this.validation.allErrors());
                    this.$toast(
                        'You need to fill ' + error + ' more empty mandatory fields',
                        'warning'
                    );
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

        // methods section
        addQuestionsrow() {
            this.data.questions.push({
                question: "",
                mark: 0,
                answers: [{ answer: "", mark: 0 }]
            });
        },
        deleteQuestion(index) {
            console.log("dlt", index);

            this.data.questions.splice(index, 1);
        },
        addAnswerRow(questionIndex) {
            this.data.questions[questionIndex].answers.push({
                answer: "",
                mark: 0
            });
        },
        deleteAnswer(questionIndex, answerIndex) {
            this.data.questions[questionIndex].answers.splice(answerIndex, 1);
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
            axios.get("/get-activities", { params: { id: id, status: "active" } })
                .then((res) => (this.allActivity = res.data))
                .catch(error => console.error('Error fetching activities:', error));
        }
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

    },
}

</script>
