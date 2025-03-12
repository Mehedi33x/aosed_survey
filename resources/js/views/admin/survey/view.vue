<template>
    <view-page :defaultTable="false">
        <div class="view_page">
            <fieldset>
                <span class="legend">Survey Details</span>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <th>Survey Title</th>
                                <th style="text-align: center;">:</th>
                                <td>{{ data?.title ?? "N/A" }}</td>
                            </tr>
                            <tr>
                                <th>Survey Number</th>
                                <th style="text-align: center;">:</th>
                                <td>{{ data?.survey_number ?? "N/A" }}</td>
                            </tr>
                            <tr>
                                <th>Project Title</th>
                                <th style="text-align: center;">:</th>
                                <td>{{ data?.project?.project_name ?? "N/A" }}</td>
                            </tr>
                            <tr>
                                <th>Indicator Title</th>
                                <th style="text-align: center;">:</th>
                                <td>{{ data?.indicator?.title ?? "N/A" }}</td>
                            </tr>
                            <tr>
                                <th>Activity Title</th>
                                <th style="text-align: center;">:</th>
                                <td>{{ data?.activity?.title ?? "N/A" }}</td>
                            </tr>
                            <tr>
                                <th>Survey Date</th>
                                <th style="text-align: center;">:</th>
                                <td>{{ data?.survey_date ?? "N/A" }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </fieldset>
        </div>
        <div class="col-lg-12 mt-5">
            <Fieldset>
                <template #name>Beneficiary Survey</template>
                <template #content>
                    <date-picker id="date1" v-model="search_data.from_date" field="search_data.from_date"
                        name="From Date" title="From Date" placeholder="dd/mm/yyyy" :req="false" col="4"
                        :disableFutureDates="true"></date-picker>
                    <date-picker id="date2" v-model="search_data.to_date" field="search_data.to_date" name="To Date"
                        title="To Date" placeholder="dd/mm/yyyy" :req="false" col="4"
                        :disableFutureDates="true"></date-picker>
                    <div>
                        <button type="button" class="btn btn-success" @click="filterSurveyBeneficiaries">Search</button>
                        <button v-if="isFiltered && filteredSurveyBeneficiaries.length > 0" type="button"
                            class="btn btn-secondary mx-2" @click="clearFilter">
                            Clear
                        </button>
                    </div>
                    <h5 class="text-center">Survey Beneficiary</h5>
                    <div style="text-align: right;">
                        <button @click="deleteSelectedBeneficiaries" class="btn btn-danger"
                            style="font-size: 14px; padding: 5px 12px;">Delete</button>
                    </div>
                    <div class="base_table_list">
                        <div class="table-responsive text-nowrap table-basic table_wrapper">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="sl">
                                            <input type="checkbox" v-model="selectAllBeneficiaries"
                                                @change="toggleAllBeneficiaries" />
                                            <span class="heading mx-2"> All</span>
                                        </th>
                                        <th>
                                            <div class="heading">SL</div>
                                        </th>
                                        <th>
                                            <div class="heading">Survey By</div>
                                        </th>
                                        <th>
                                            <div class="heading">Survey Date</div>
                                        </th>
                                        <th>
                                            <div class="heading">Beneficiary Info</div>
                                        </th>
                                        <th>
                                            <div class="heading">Mark</div>
                                        </th>
                                        <th>
                                            <div class="heading">Result sheet</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody v-if="isLoading">
                                    <tr>
                                        <td colspan="8" style="text-align: center; background: #fff">
                                            <!-- <div class="p-2 text-center">
                                                <span class="spinner-border text-primary" role="status"
                                                    aria-hidden="true"></span>
                                                <span class="ms-2">Loading...</span>
                                            </div> -->
                                            <div class="spinner-overlay">
                                                <div class="spinner-border text-primary" role="status">
                                                    <span class="sr-only">Loading...</span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody v-else-if="!isFiltered && data.survey_beneficiaries?.length > 0">
                                    <tr v-for="(survey_beneficiary, index) in data.survey_beneficiaries" :key="index">
                                        <td>
                                            <input type="checkbox" :value="survey_beneficiary"
                                                v-model="selectedBeneficiaries" />
                                        </td>
                                        <td class="text-capitalize">
                                            {{ index + 1 }}</td>
                                        <td class="text-capitalize">
                                            {{ survey_beneficiary?.admin?.name ??"N/A" }}</td>
                                        <td class="text-capitalize">
                                            {{ enFormat(survey_beneficiary.survey_date)  }} </td>
                                        <td class="text-capitalize">
                                            <div>
                                                <strong>Name:</strong> {{ survey_beneficiary?.beneficiary?.full_name ?? "N/A"}}
                                            </div>
                                            <div>
                                                <strong>Address:</strong> {{
                                                    survey_beneficiary?.beneficiary?.present_address ?? "N/A"}}
                                            </div>
                                            <div>
                                                <strong>Mobile:</strong> {{ survey_beneficiary?.beneficiary?.mobile_no ??"N/A" }}
                                            </div>
                                            <div>
                                                <strong>NID:</strong> {{ survey_beneficiary.beneficiary.nid }}
                                            </div>
                                        </td>
                                        <td class="text-capitalize">
                                            {{ survey_beneficiary.total_mark }} </td>
                                        <td @click="openModal(survey_beneficiary)">
                                            <button class="btn btn-primary btn-sm">
                                                View
                                            </button>
                                        </td>

                                    </tr>
                                </tbody>
                                <tbody v-else-if="isFiltered && filteredSurveyBeneficiaries?.length > 0">
                                    <tr v-for="(survey_beneficiary, index) in filteredSurveyBeneficiaries" :key="index">
                                        <td>
                                            <input type="checkbox" :value="survey_beneficiary"
                                                v-model="selectedBeneficiaries" />
                                        </td>
                                        <td class="text-capitalize">
                                            {{ index + 1 }}</td>
                                        <td class="text-capitalize">{{ survey_beneficiary.admin.name }}</td>
                                        <td class="text-capitalize">{{ enFormat(survey_beneficiary.survey_date) }}</td>
                                        <td class="text-capitalize">{{
                                            survey_beneficiary?.group?.title ?? "N/A" }}</td>
                                        <td class="text-capitalize">
                                            <div>
                                                <strong>Name:</strong> {{ survey_beneficiary.beneficiary.full_name }}
                                            </div>
                                            <div>
                                                <strong>Address:</strong> {{
                                                    survey_beneficiary.beneficiary.present_address }}
                                            </div>
                                            <div>
                                                <strong>Mobile:</strong> {{ survey_beneficiary.beneficiary.mobile_no }}
                                            </div>
                                            <div>
                                                <strong>NID:</strong> {{ survey_beneficiary.beneficiary.nid }}
                                            </div>
                                        </td>
                                        <td class="text-capitalize">{{ survey_beneficiary.total_mark }}</td>
                                        <td @click="openModal(survey_beneficiary)">
                                            <button class="btn btn-primary btn-sm">View</button>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody v-else>
                                    <tr>
                                        <td colspan="8" style="text-align: center; background: #fff">
                                            <p class="p-2 text-center text-red no-data">
                                                There are no beneficiaries found for this survey
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </template>
            </Fieldset>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle"
            aria-hidden="true">
            <div class="modal-dialog" id="survey_result_details_modal" role="document" style="max-width: 65%;">
                <div class="modal-content survey_result_details_modal">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitle">Survey Result Details</h5>
                        <button type="button" class="btn btn-outline-secondary btn-sm mx-2"
                            @click="print('survey_result_details_modal', model)">
                            <i class="fas fa-print"></i> Print
                        </button>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-8 col-print-8">
                                <div class="mb-3">
                                    <div class="mb-3 d-flex flex-column gap-2">
                                        <h5><u>Beneficiary Feedback Survey:</u></h5>
                                    </div>
                                    <p><strong>Survey By:</strong> {{ selectedSurvey?.admin.name }}</p>
                                    <p><strong>Survey Date:</strong> {{ enFormat(selectedSurvey?.survey_date) }}</p>
                                </div>
                                <div class="mb-3 d-flex flex-column gap-2">
                                    <h5><u>Questions:</u></h5>

                                </div>
                                <div class="d-flex flex-column gap-3 mt-0 w-100">
                                    <template v-if="selectedSurvey?.questions?.length">
                                        <div v-for="(questionData, index) in selectedSurvey.questions" :key="index"
                                            class="sq_box p-3">
                                            <div class="question mb-3">
                                                <p>
                                                    <span>{{ index + 1 }}. </span> {{ questionData.question }}
                                                </p>
                                            </div>
                                            <div class="answer_box gap-2 d-flex flex-column mx-3">
                                                <div v-if="questionData.question_type === 'multiple'"
                                                    class="form-group">
                                                    <ul>
                                                        <li v-for="(answer, answerIndex) in questionData.answers"
                                                            :key="answerIndex">
                                                            {{ answer }}
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div v-else class="form-group">
                                                    <p>
                                                        <span class="fw-bold">Ans: </span><small class="ms-1">{{
                                                            questionData.answers[0] }}</small>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </template>
                                    <p v-else class="text-center">No questions or answers available.</p>
                                </div>

                            </div>
                            <div class="col-lg-4 col-print-4">
                                <div class="d-flex flex-wrap justify-content-between gap-3">
                                    <div class="custom_box points text-center w-100">
                                        <small>Total Answered</small>
                                        <h4 class="pt-2">{{ selectedSurvey?.questions?.length || 0 }} Questions</h4>
                                    </div>
                                    <div class="custom_box points text-center w-100">
                                        <small>Total Points</small>
                                        <h4 class="pt-2">{{ selectedSurvey?.total_mark }}</h4>
                                    </div>
                                </div>
                                <div class="custom_box d-flex flex-column align-items-center gap-2 w-100 mt-3">
                                    <div class="d-flex image mx-auto">
                                        <img :src="selectedSurvey?.beneficiary.thumb_one
                                            ? selectedSurvey?.beneficiary.thumb_one
                                            : emptyImage50()
                                            " alt="Beneficiary Image" class="beneficiary-image" />
                                    </div>
                                    <div class="highlight mt-2 mb-4">
                                        <h6>{{ selectedSurvey?.beneficiary.full_name }}</h6>
                                    </div>
                                    <table class="table w-100">
                                        <tbody>
                                            <tr>
                                                <th style="width: 30%;">Address</th>
                                                <td style="width: 5%;">:</td>
                                                <td>{{ selectedSurvey?.beneficiary.present_address }}</td>
                                            </tr>
                                            <tr>
                                                <th>Phone No</th>
                                                <td>:</td>
                                                <td>{{ selectedSurvey?.beneficiary.mobile_no }}</td>
                                            </tr>
                                            <tr>
                                                <th>Age</th>
                                                <td>:</td>
                                                <td>{{ calculateAge(selectedSurvey?.beneficiary.date_of_birth) }}</td>
                                            </tr>
                                            <tr>
                                                <th>Occupation</th>
                                                <td>:</td>
                                                <td>
                                                    <!-- {{
                                                        selectedSurvey?.beneficiary.beneficiary_occupations.map(occupation
                                                            =>
                                                            occupation.occupations?.title).join(',')
                                                    }} -->
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Education</th>
                                                <td>:</td>
                                                <td>
                                                    {{
                                                        selectedSurvey?.beneficiary.beneficiary_educations.map(education =>
                                                            education.exam?.title).join(',')
                                                    }}
                                                </td>

                                            </tr>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </view-page>
</template>



<script>
import Swal from "sweetalert2";

const model = "survey";

export default {
    provide() {
        return {
            validate: this.validation,
        };
    },
    data() {
        return {
            page_title: "",
            model: model,
            data: {
                survey_beneficiaries: []
            },
            isLoading: false,
            selectAllBeneficiaries: false,
            selectedBeneficiaries: [],
            beneficiaryIdsToDelete: {},
            search_data: {
                from_date: "",
                to_date: "",
            },
            fileColumns: [],
            selectedSurvey: null,
            filteredSurveyBeneficiaries: [],
            isFiltered: false,
        };
    },

    methods: {
        openModal(survey_beneficiary) {
            this.selectedSurvey = survey_beneficiary;

            const filteredResults = this.data.survey_beneficiary_results.filter(
                (result) => result.survey_beneficiary_id === survey_beneficiary.id
            );
            this.selectedSurvey.questions = filteredResults.map((result) => {
                const question = result.survey_questions;
                let selectedAnswers = [];
                let answerText = '';

                if (question.question_type === 'multiple' || question.question_type === 'single') {
                    try {
                        selectedAnswers = result.answer ? JSON.parse(result.answer) : [];
                    } catch (e) {
                        console.error("Error parsing answer:", e);
                    }
                } else if (question.question_type === 'text') {
                    answerText = result.answer_text || '';
                }
                let answers = [];
                if (question.question_type === 'multiple' || question.question_type === 'single') {
                    answers = question.answers.filter((answer) =>
                        selectedAnswers.includes(answer.id)
                    );
                }
                return {
                    question: question.question,
                    answers: question.question_type === 'text' ? [answerText] : answers.map((answer) => answer.answer),
                    marks: answers.map((answer) => answer.mark),
                    question_type: question.question_type,
                };
            });

            $('#resultModal').modal('show');
        },
        toggleAllBeneficiaries() {
            const currentList = this.isFiltered
                ? this.filteredSurveyBeneficiaries
                : this.data.survey_beneficiaries;
            if (this.selectAllBeneficiaries) {
                this.selectedBeneficiaries = [...currentList];
            } else {
                this.selectedBeneficiaries = [];
            }
        },
        filterSurveyBeneficiaries() {
            const from_date = this.search_data.from_date;
            const to_date = this.search_data.to_date;
            if (!from_date || !to_date) {
                this.$toast("Please select both From Date and To Date", "warning");
                return;
            }
            const fromDate = new Date(from_date);
            fromDate.setHours(0, 0, 0, 0);
            const toDate = new Date(to_date)
            toDate.setHours(23, 59, 59, 999);

            this.filteredSurveyBeneficiaries = this.data.survey_beneficiaries.filter(beneficiary => {
                const surveyDate = new Date(beneficiary.survey_date);
                return surveyDate >= fromDate && surveyDate <= toDate;
            });

            this.isFiltered = true;
            if (this.filteredSurveyBeneficiaries.length === 0) {
                this.$toast("No survey beneficiaries found within the selected date range", "warning");
            } else {
                this.$toast("Survey beneficiaries found", "success");
            }
        },
        async deleteSelectedBeneficiaries() {
            if (Object.keys(this.beneficiaryIdsToDelete).length === 0) {
                this.$toast("No beneficiaries selected for deletion", "warning");
                return;
            }
            const confirmation = await Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#d33",
                cancelButtonColor: "#3085d6",
                confirmButtonText: "Yes, delete it!",
                cancelButtonText: "Cancel",
            });
            if (!confirmation.isConfirmed) {
                return;
            }
            this.isLoading = true;
            try {
                const response = await axios.post("survey/beneficiaries/delete", {
                    beneficiary_ids: Object.values(this.beneficiaryIdsToDelete),
                });
                Swal.fire("Deleted!", response.data.message, "success");
                const deletedIds = Object.values(this.beneficiaryIdsToDelete);
                this.data.survey_beneficiaries = this.data.survey_beneficiaries.filter(
                    (beneficiary) => !deletedIds.includes(beneficiary.id)
                );
                this.selectedBeneficiaries = [];
                this.beneficiaryIdsToDelete = {};
            } catch (error) {
                Swal.fire("Error!", "Failed to delete beneficiaries.", "error");
                console.error(error);
            } finally {
                this.isLoading = false;
            }
        },
        clearFilter() {
            this.search_data = { from_date: "", to_date: "" };
            this.filteredSurveyBeneficiaries = [];
            this.isFiltered = false;
            this.$toast("Search fields have been cleared. Showing all results", "warning");
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
        printModal() {
            const modalContent = document.querySelector('#resultModal .modal-content');
            if (!modalContent) {
                console.error("Modal content not found");
                return;
            }
            const printWindow = window.open('', '_blank', 'width=800,height=600');
            printWindow.document.open();
            printWindow.document.write(`
        <html>
        <head>
            <title>Print Survey Result</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 20px;
                }
                .modal-content {
                    border: none;
                    box-shadow: none;
                }
                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 10px;
                }
                th, td {
                    border: 1px solid #ccc;
                    padding: 8px;
                    text-align: left;
                }
                th {
                    background-color: #f4f4f4;
                }
            </style>
        </head>
        <body>
            ${modalContent.outerHTML} <!-- Include modal content -->
        </body>
        </html>
    `);
            printWindow.document.close();
            setTimeout(() => {
                printWindow.focus();
                printWindow.print();
                printWindow.close();
            }, 250);
        },
    },
    watch: {
        selectedBeneficiaries: {
            handler(selected) {
                this.beneficiaryIdsToDelete = selected.reduce((acc, beneficiary) => {
                    acc[beneficiary.beneficiary_id] = beneficiary.beneficiary_id;
                    return acc;
                }, {});
            },
            deep: true,
        },
    },
    computed: {
        allBeneficiariesSelected() {
            const currentList = this.isFiltered
                ? this.filteredSurveyBeneficiaries
                : this.data.survey_beneficiaries;
            return (
                currentList.length > 0 &&
                currentList.every((beneficiary) =>
                    this.selectedBeneficiaries.includes(beneficiary)
                )
            );
        },
    },
    created() {
        this.page_title = `${this.headline(this.model)} View`;
        axios.get(`${this.model}/${this.$route.params.id}`).then((res) => {
            this.data = res.data;

        });
    },
    validators: {

    }
};
</script>

<style scoped>
.modal {
    backdrop-filter: brightness(0.5) !important;
}
</style>
