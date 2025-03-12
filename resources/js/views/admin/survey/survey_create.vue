<template>
    <create-form @onSubmit='submit'>
        <div class="col-lg-12">
            <Fieldset>
                <template v-slot:name>Project Information</template>
                <template v-slot:content>
                    <div class="d-flex flex-column flex-md-row gap-3 pr_info">
                        <div class="d-flex flex-column gap-2 border-end">
                            <h6>Project Name</h6>
                            <p>{{ data?.project?.project_name ?? "N/A" }}</p>
                        </div>
                        <div class="d-flex flex-column gap-2 border-end">
                            <h6>Indicator Name</h6>
                            <p>{{ data?.indicator?.title ?? "N/A" }}</p>
                        </div>
                        <div class="d-flex flex-column gap-2">
                            <h6>Activity Name</h6>
                            <p>{{ data?.activity?.title ?? "N/A" }}</p>
                        </div>
                    </div>
                </template>
            </Fieldset>
        </div>
        <div class="col-lg-12">
            <Fieldset>
                <template v-slot:name>Search Beneficiary</template>
                <template v-slot:content>
                    <Select title="Group" v-model="data.group_id" field="data.group_id" label="title"
                        :reduce="(obj) => obj.id" :options="allGroups" placeholder="--Select One--"
                        :closeOnSelect="true" :required="true" col="4 col-md-6" />

                    <Select title="Select Beneficiary" v-model="data.beneficiary_id" field="data.beneficiary_id"
                        label="name" :reduce="(obj) => obj.value" :options="beneficiaries" placeholder="--Select One--"
                        :closeOnSelect="true" :required="true" col="4 col-md-6"
                        @change="setBeneficiaryDetails(data.beneficiary_id)" />
                    <Textarea title="Remarks" field="data.remarks" v-model="data.remarks" :rows="3" :req="false"
                        col="12" />
                </template>
            </Fieldset>
        </div>

        <div class="col-lg-12">
            <Fieldset>
                <template v-slot:name>Survey Questions</template>
                <template v-slot:content>
                    <div class="col-xl-9 col-md-8">
                        <div v-if="calculateTotalQuestions() > 0">
                            <div class="mb-3 text-center">
                                <div class="d-flex flex-column">
                                    <h5 class="pb-2">Sample Questions</h5>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <div class="text-start">
                                        <div>Please answer all the questions below.</div>
                                        <div class="text-danger">* required</div>
                                    </div>
                                    <div class="text-end">
                                        <div>Total Questions: <strong>{{ calculateTotalQuestions() }}</strong></div>
                                        <div>Total Marks: <strong>{{ calculateTotalMarks() }}</strong></div>
                                    </div>
                                </div>

                            </div>

                            <div class="d-flex flex-column gap-3 mt-0 w-100">
                                <div v-for="(surveyForm, formIndex) in allQuestions" :key="formIndex"
                                    class="survey-form">
                                    <div class="sq_box p-3 my-2" v-for="(item, index) in surveyForm.questions"
                                        :key="index">
                                        <div class="question mb-3">
                                            <p>
                                                {{ index + 1 }}.{{ item.question }}
                                                <span class="marks">{{ item.mark }} Marks</span>
                                            </p>
                                        </div>
                                        <template v-if="item.question_type == 'single'">
                                            <div class="answer_box gap-2 d-flex flex-column">
                                                <div class="form-group" v-for="(answer, answerIndex) in item.answers"
                                                    :key="answerIndex">
                                                    <div class="check_box">
                                                        <div class="form-check">
                                                            <input :name="'question_' + item.id"
                                                                @change="questionAnswer(item.id, item.question_type, item.mark, answer.id, answer.mark)"
                                                                class="form-check-input shadow-none" type="radio"
                                                                :value="answerIndex" />
                                                            <label class="form-check-label">
                                                                {{ answer.answer }}
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </template>

                                        <template v-if="item.question_type == 'multiple'">
                                            <div class="answer_box gap-2 d-flex flex-column">
                                                <div class="form-group" v-for="(answer, answerIndex) in item.answers"
                                                    :key="answerIndex">
                                                    <div class="check_box">
                                                        <div class="form-check">
                                                            <input class="form-check-input shadow-none" type="checkbox"
                                                                :value="answer.id"
                                                                @change="questionAnswer(item.id, item.question_type, item.mark, answer.id, answer.mark)" />
                                                            <label class="form-check-label">
                                                                {{ answer.answer }}
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </template>

                                        <template v-if="item.question_type == 'text'">
                                            <div class="answer_box gap-2 d-flex flex-column">
                                                <div class="form-group" v-for="(answer, answerIndex) in item.answers"
                                                    :key="answerIndex">
                                                    <div class="row">
                                                        <div class="col-12 col-sm-9 col-xxl-10">
                                                            <textarea class="form-control shadow-none" rows="6"
                                                                placeholder="Your answer here"
                                                                @keyup="updateAnswer($event, item.id, item.question_type, answer.id, item.mark, answer.mark)"></textarea>
                                                        </div>
                                                        <div class="col-6 col-sm-3 col-xxl-2 pt-1 pt-sm-0"
                                                            v-if="hasTextForAnswer(item.id, answer.id)">
                                                            <input v-model="marks[item.id]"
                                                                @keyup="validateMark(item.id, $event.target.value, item.mark)"
                                                                type="number" class="form-control shadow-none" min="0"
                                                                placeholder="Enter mark" />
                                                            <small v-if="errors[item.id]" class="text-danger">{{
                                                                errors[item.id] }}</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </template>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div v-else class="text-center py-5">
                            <h5>No questions found in this survey</h5>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-4">
                        <div class="custom_box d-flex flex-column align-items-center gap-2 w-100">
                            <div class="d-flex image mx-auto">
                                <img :src="beneficiaryDetails.image
                                    ? beneficiaryDetails.image
                                    : emptyImage50()" alt="Beneficiary Image" class="beneficiary-image" />
                            </div>
                            <div class="highlight mt-2 mb-4">
                                <h6>{{ beneficiaryDetails.name ?? "No user selected" }}</h6>
                            </div>
                            <table class="table w-100">
                                <tbody>
                                    <tr>
                                        <th style="width: 30%;">Address</th>
                                        <td style="width: 5%;">:</td>
                                        <td>{{ beneficiaryDetails.address ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Phone No</th>
                                        <td>:</td>
                                        <td>{{ beneficiaryDetails.phone ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Age</th>
                                        <td>:</td>
                                        <td>{{ beneficiaryDetails.age ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Occupation</th>
                                        <td>:</td>
                                        <td>{{ beneficiaryDetails.occupation ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Education</th>
                                        <td>:</td>
                                        <td>{{ beneficiaryDetails.education ?? "N/A" }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="d-flex flex-wrap justify-content-between gap-3 mt-3">
                            <div class="custom_box points text-center w-100">
                                <small>Total Answered</small>
                                <h4 class="pt-2">{{ totalAnsweredQuestions }} Questions</h4>
                            </div>
                            <div class="custom_box points text-center w-100">
                                <small>Total Points</small>
                                <h4 class="pt-2">{{ totalPoints }}</h4>
                            </div>
                        </div>
                    </div>
                </template>
            </Fieldset>
        </div>

        <template #form_footer>
            <div class="col-md-12">
                <button type="submit" class="theme_btn">
                    Submit
                </button>
            </div>
        </template>
    </create-form>
</template>

<script>

const model = 'survey';

export default {

    data() {
        return {
            model: model,
            page_title: '',
            data: {
                group_id: null,
                questions: [],
            },
            allQuestions: [],
            allGroups: [],
            beneficiaries: [],
            beneficiaryDetails: {},
            errors: {},
            marks: {},
        };
    },

    provide() {
        return {
            validate: this.validation,
        };
    },

    methods: {

        async submit() {
            if (!this.data.beneficiary_id) {
                this.$toast('Please select a beneficiary', 'error');
                return;
            }
            if (
                !Array.isArray(this.data.questions) ||
                this.data.questions.length === 0 ||
                this.data.questions.every(
                    (question) => !question.selectedAnswers || question.selectedAnswers.length === 0
                )
            ) {
                this.$toast('Please answer the questions', 'error');
                return;
            }

            if (Object.keys(this.errors).length > 0) {
                this.$toast('Please fix the errors before submitting', 'error');
                return;
            }

            const surveyData = {
                project_info: {
                    project_id: this.data.project?.id || "N/A",
                    indicator_id: this.data.indicator?.id || "N/A",
                    activity_id: this.data.activity?.id || "N/A",
                },
                beneficiary_info: {
                    beneficiary_id: this.beneficiaryDetails.id || "N/A",
                    name: this.beneficiaryDetails.name || "N/A",
                    address: this.beneficiaryDetails.address || "N/A",
                    phone: this.beneficiaryDetails.phone || "N/A",
                    age: this.beneficiaryDetails.age || "N/A",
                    occupation: this.beneficiaryDetails.occupation || "N/A",
                    education: this.beneficiaryDetails.education || "N/A",
                },
                total_marks: this.totalPoints,
                remarks: this.data.remarks || "N/A",
                survey_id: this.$route.params.id || "N/A",
                questionAnswers: (this.data.questions || []).map(question => {
                    if (question.question_type === 'text') {
                        return {
                            question_id: question.question_id,
                            question_mark: question.question_mark,
                            question_type: question.question_type,
                            selectedAnswers: question.selectedAnswers.map(answer => ({
                                answer_id: answer.answer_id,
                                text: answer.text,
                            })),
                        };
                    } else {
                        return {
                            question_id: question.question_id,
                            question_mark: question.question_mark,
                            question_type: question.question_type,
                            selectedAnswers: question.selectedAnswers,
                        };
                    }
                }),
            };
            try {
                const response = await axios.post('/survey/storeDetails', surveyData);
                if (response.status === 200) {
                    this.$toast('Survey data stored successfully', 'success');
                    this.$router.push({ name: 'survey.index' });
                }
            } catch (error) {
                console.error('Error storing survey data:', error);
                this.$toast('Failed to store survey data', 'error');
            }
        },
        questionAnswer(question_id, question_type, question_mark, answer_id, answer_mark) {
            if (!Array.isArray(this.data.questions)) {
                this.data.questions = [];
            }
            let question = this.data.questions.find(q => q.question_id === question_id);
            if (!question) {
                this.addQuestion(question_id, question_mark, question_type);
                question = this.data.questions.find(q => q.question_id === question_id);
            }
            if (question) {
                if (question_type === 'single') {
                    if (!question.selectedAnswers) {
                        question.selectedAnswers = [];
                    }
                    const answerIndex = question.selectedAnswers.findIndex(a => a.answer_id === answer_id);
                    if (answerIndex === -1) {
                        question.selectedAnswers = [{
                            answer_id: answer_id,
                            mark: answer_mark
                        }];
                    } else {
                        question.selectedAnswers.splice(answerIndex, 1);
                    }
                }
                else if (question_type === 'multiple') {
                    if (!question.selectedAnswers) {
                        question.selectedAnswers = [];
                    }
                    const answerIndex = question.selectedAnswers.findIndex(a => a.answer_id === answer_id);
                    if (answerIndex === -1) {
                        question.selectedAnswers.push({
                            answer_id: answer_id,
                            mark: answer_mark
                        });
                    } else {
                        question.selectedAnswers.splice(answerIndex, 1);
                    }
                }
            }
        },
        updateAnswer(event, questionId, questionType, answerId, questionMark, answerMark) {
            const textarea = event.target;
            const value = textarea.value.trim();
            if (!Array.isArray(this.data.questions)) {
                this.data.questions = [];
            }
            let question = this.data.questions.find(q => q.question_id === questionId);
            if (!question) {
                question = {
                    question_id: questionId,
                    question_mark: questionMark,
                    question_type: questionType,
                    selectedAnswers: [],
                };
                this.data.questions.push(question);
            }
            if (questionType === 'text') {
                const existingAnswerIndex = question.selectedAnswers.findIndex(ans => ans.answer_id === answerId);
                if (existingAnswerIndex === -1) {
                    question.selectedAnswers.push({
                        question_mark: questionMark,
                        answer_id: answerId,
                        text: value,
                    });
                } else {
                    question.selectedAnswers[existingAnswerIndex].text = value;
                }
            }

            const existingAnswerIndex = question.selectedAnswers.findIndex(ans => ans.answer_id === answerId);
            if (value) {
                if (existingAnswerIndex === -1) {
                    question.selectedAnswers.push({
                        question_mark: questionMark,
                        answer_id: answerId,
                        text: value,
                        hasText: !!value.trim(),
                    });
                } else {
                    question.selectedAnswers[existingAnswerIndex].text = value;
                    question.selectedAnswers[existingAnswerIndex].hasText = !!value.trim();
                }
            } else if (existingAnswerIndex !== -1) {
                question.selectedAnswers.splice(existingAnswerIndex, 1);
            }
        },
        validateMark(question_id, enteredMark, question_mark) {
            const maxMark = question_mark;
            const answer_mark = enteredMark ? parseFloat(enteredMark).toFixed(2) : 0;

            if (answer_mark > maxMark) {
                this.errors[question_id] = `Mark cannot exceed ${maxMark}`;
            } else if (answer_mark < 0) {
                this.errors[question_id] = 'Mark cannot be less than 0';
            } else {
                delete this.errors[question_id];
            }
        },
        hasTextForAnswer(questionId, answerId) {
            if (!Array.isArray(this.data.questions)) return false;
            const question = this.data.questions.find(q => q.question_id === questionId);
            if (!question || !Array.isArray(question.selectedAnswers)) return false;
            const answer = question.selectedAnswers.find(a => a.answer_id === answerId);
            return answer?.hasText || false;
        },
        addQuestion(question_id, question_mark, question_type) {
            const newQuestion = {
                question_id: question_id,
                question_mark: question_mark,
                question_type: question_type,
                selectedAnswer: null,
                selectedAnswers: [],
            };
            if (Array.isArray(this.data.questions)) {
                this.data.questions.push(newQuestion);
            } else {
                this.data.questions = [newQuestion];
            }
        },
        calculateTotalQuestions() {
            return this.allQuestions.reduce((total, surveyForm) => {
                return total + (surveyForm.questions ? surveyForm.questions.length : 0);
            }, 0);
        },
        calculateTotalMarks() {
            return this.allQuestions.reduce((total, form) => {
                return total + (form.questions ? form.questions.reduce((subTotal, question) => subTotal + (question.mark || 0), 0) : 0);
            }, 0);
        },
        calculateAge(dateOfBirth) {
            const birthDate = new Date(dateOfBirth);
            const today = new Date();
            const age = today.getFullYear() - birthDate.getFullYear();
            const monthDifference = today.getMonth() - birthDate.getMonth();
            if (
                monthDifference < 0 ||
                (monthDifference === 0 && today.getDate() < birthDate.getDate())
            ) {
                return age - 1;
            }
            return age;
        },
        setBeneficiaryDetails(beneficiary_id) {
            const alreadyExists = this.allSurveyBeneficiaries.some(
                (surveyBeneficiary) => surveyBeneficiary.beneficiary_id === beneficiary_id
            );

            if (alreadyExists) {
                this.beneficiaryDetails = {};
                this.$toast('This beneficiary is already assigned to this survey.', 'error');
                this.preventWatcher = true;
                this.$nextTick(() => {
                    this.data.beneficiary_id = null;
                    this.preventWatcher = false;
                });
                return;
            }

            const selectedBeneficiary = this.beneficiaries.find(b => b.value === beneficiary_id);
            if (selectedBeneficiary) {
                this.beneficiaryDetails = {
                    id: selectedBeneficiary.details.id || 'N/A',
                    name: selectedBeneficiary.details.full_name || 'N/A',
                    address: selectedBeneficiary.details.present_address || 'N/A',
                    phone: selectedBeneficiary.details.mobile_no || 'N/A',
                    age: this.calculateAge(selectedBeneficiary.details.date_of_birth) || 'N/A',
                    occupation: selectedBeneficiary.details.occupation || 'N/A',
                    education: selectedBeneficiary.details.education || 'N/A',
                    image: selectedBeneficiary.details.thumb_one,
                };
            }
        },
        // API section
        getSurveyQuestions() {
            axios.get("/get-seruvey-questions", { params: { id: this.data.activity_id, status: "active" } }).then((res) => (this.allQuestions = res.data));
        },
        getBeneficiariesByActivity() {
            this.data.beneficiary_id = null;
            this.beneficiaryDetails = {
                name: 'No user selected',
                address: 'N/A',
                phone: 'N/A',
                age: 'N/A',
                occupation: 'N/A',
                education: 'N/A',
                image: null,
            };
            this.getBeneficiaries();
        },
        getBeneficiaries() {
            axios.get("/get-assigned-beneficiaries", { params: { group_id: this.data.group_id, activity_id: this.data.activity_id, survey_id: this.$route.params.id } })
                .then((res) => {
                    this.beneficiaries = res.data.map(beneficiaryData => ({
                        value: beneficiaryData.beneficiary_id,
                        name: `${beneficiaryData.beneficiary.full_name || 'N/A'} -
                            ${beneficiaryData.beneficiary.beneficiary_no || 'N/A'}`,
                        details: beneficiaryData.beneficiary,
                    }));
                })
                .catch(error => {
                    console.error('Error fetching beneficiaries:', error);
                });
        },
        getSurveyBeneficiaries() {
            axios.get("/get-survey-beneficiaries", { params: { survey_id: this.$route.params.id } }).then((res) => (this.allSurveyBeneficiaries = res.data));
        },
        getGroups() {
            axios.get("/get-all-groups", { params: { status: "active" } }).then((res) => (this.allGroups = res.data));
        },

    },

    created() {
        this.page_title = `${this.headline(this.model)} Create`;
        this.get_data(`${this.model}/${this.$route.params.id}/surveyStart`);
        this.getSurveyBeneficiaries();
        this.getGroups();
    },

    watch: {
        'data.activity_id'(newVal) {
            if (newVal) {
                this.getSurveyQuestions();
            }
        },
        'data.beneficiary_id'(newVal, oldVal) {
            if (this.preventWatcher) {
                return;
            }
            if (newVal && newVal !== oldVal) {
                this.setBeneficiaryDetails(newVal);
            }
        },
        'data.group_id'(newVal) {
            if (newVal) {
                this.getBeneficiariesByActivity();
            }
        }
    },

    mounted() {
        if (this.data.activity_id) {
            this.getSurveyQuestions();
        }
        this.calculateTotalQuestions();
        setTimeout(() => {
            console.log('activity_id after delay:', this.data.activity_id);
            this.getBeneficiariesByActivity();
        }, 1000);
    },

    computed: {
        totalAnsweredQuestions() {
            if (Array.isArray(this.data.questions)) {
                return this.data.questions.filter(question =>
                    question.selectedAnswers && question.selectedAnswers.length > 0
                ).length;
            }
            return 0;
        },
        totalPoints() {
            if (Array.isArray(this.data.questions)) {
                return this.data.questions.reduce((total, question) => {
                    if (question.selectedAnswers && question.selectedAnswers.length > 0) {
                        if (question.question_type === 'single') {
                            total += question.selectedAnswers[0].mark || 0;
                        } else if (question.question_type === 'multiple') {
                            total += question.selectedAnswers.reduce((sum, answer) => sum + (answer.mark || 0), 0);
                        }
                    }
                    if (this.marks[question.question_id]) {
                        total += parseFloat(this.marks[question.question_id] || 0);
                    }
                    return total;
                }, 0);
            }
            return 0;
        }

    },

    validators: {
    },
}

</script>

<style scoped>
.question p {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.marks {
    margin-left: auto;
}

.pr_info>div {
    width: 33% !important;
}

@media(max-width: 767px) {
    .pr_info>div {
        width: 100% !important;
    }
}

.answer_box .check_box .form-check .form-check-label {
    font-weight: 400 !important;
}
</style>
