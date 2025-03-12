<template>
    <div>
        <div class="component_loader" :class="{ 'z-top': $root.initialLoader }"
            v-if="$root.spinner && !$root.tableSpinner">
            <div class="loader"></div>
        </div>
        <Fieldset v-show="!$root.spinner || $root.tableSpinner">
            <template v-slot:name>Activities Monitoring Report</template>
            <template v-slot:content>
                <div class="col-12 mt-5 pt-4">
                    <div class="search-field">
                        <div class="row mt-2">
                            <Select title="Project" v-model="data.project_id" field="data.project_id"
                                label="project_name" :reduce="(obj) => obj.id" :options="allProjects"
                                placeholder="--Select One--" :closeOnSelect="true" :required="true" col="4" :req="true"
                                @update:modelValue="getIndicatorsByProject(data.project_id)" />
                            <Select title="Project Indicator" v-model="data.indicator_id" field="data.indicator_id"
                                label="title" :reduce="(obj) => obj.id" :options="allIndicators"
                                placeholder="--Select One--" :closeOnSelect="true" :required="true" col="4"
                                @update:modelValue="getActivityByIndicator(data.indicator_id)" />
                            <Select title="Project Activity" v-model="data.activity_id" field="data.activity_id"
                                label="title" :reduce="(obj) => obj.id" :options="allActivity"
                                placeholder="--Select One--" :closeOnSelect="true" :required="true" col="4" />
                            <button type="button" class="col-1 mx-2 mt-3 btn btn-success" @click="fetchReportData">
                                Search
                            </button>
                            <button type="button" class="col-1 mx-2 mt-3 btn btn-danger" @click="clearFilters">
                                Clear
                            </button>
                            <div class="pagination_action">
                                <div class="print_action text-end">
                                    <button class="p_btn" data-bs-toggle="tooltip" data-bs-placement="top"
                                        data-bs-title="Print" v-x-tooltip @click="print('printArea', model)">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round"
                                            class="icon icon-tabler icons-tabler-outline icon-tabler-printer">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path
                                                d="M17 17h2a2 2 0 0 0 2 -2v-4a2 2 0 0 0 -2 -2h-14a2 2 0 0 0 -2 2v4a2 2 0 0 0 2 2h2" />
                                            <path d="M17 9v-4a2 2 0 0 0 -2 -2h-6a2 2 0 0 0 -2 2v4" />
                                            <path
                                                d="M7 13m0 2a2 2 0 0 1 2 -2h6a2 2 0 0 1 2 2v4a2 2 0 0 1 -2 2h-6a2 2 0 0 1 -2 -2z" />
                                        </svg>
                                    </button>

                                    <button @click="generateExcel" class="p_btn" data-bs-toggle="tooltip"
                                        data-bs-placement="top" data-bs-title="Excel" v-x-tooltip>
                                        <download-excel>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                class="icon icon-tabler icons-tabler-outline icon-tabler-file-excel">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                <path d="M14 3v4a1 1 0 0 0 1 1h4" />
                                                <path
                                                    d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2" />
                                                <path d="M10 12l4 5" />
                                                <path d="M10 17l4 -5" />
                                            </svg>
                                        </download-excel>
                                    </button>

                                    <button class="p_btn" data-bs-toggle="tooltip" data-bs-placement="top"
                                        data-bs-title="PDF" @click="generatePdf" v-x-tooltip>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                            stroke-linecap="round" stroke-linejoin="round"
                                            class="icon icon-tabler icons-tabler-outline icon-tabler-file-type-pdf">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <path d="M14 3v4a1 1 0 0 0 1 1h4" />
                                            <path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4" />
                                            <path d="M5 18h1.5a1.5 1.5 0 0 0 0 -3h-1.5v6" />
                                            <path d="M17 18h2" />
                                            <path d="M20 15h-3v6" />
                                            <path d="M11 15v6h1a2 2 0 0 0 2 -2v-2a2 2 0 0 0 -2 -2h-1z" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <div id="printArea">
                                <div class="text-center mb-3">
                                    <h5 class="my-0 pb-2">Activities Monitoring Report</h5>
                                    <p style="margin-bottom: 5px;"><small>{{ site.short_title }}</small></p>
                                    <p style="margin-bottom: 5px;"><small>{{ site.address }}</small></p>
                                    <p style="margin-bottom: 5px;"><small>Phone: {{ site.mobile1 ?? "N/A" }} &nbsp;
                                            |
                                            &nbsp;
                                            Email:
                                            {{ site.contact_email ?? "N/A" }}</small></p>
                                </div>
                                <div
                                    style="display: flex; justify-content: space-between; align-items: center;font-size: .875em;">
                                    <div class="mx-2">
                                        <p style="margin-bottom: 5px;">Project: {{ selectedProjectName }}</p>
                                        <p style="margin-bottom: 5px;">Indicator: {{ selectedIndicatorName }}</p>
                                        <p style="margin-bottom: 5px;">Activity: {{ selectedActivityName }}</p>
                                    </div>
                                    <div>
                                        <p class="mx-2 mt-4">Report Date: {{ report_date }}</p>
                                    </div>
                                </div>
                                <table id="pdf-table" class="table">
                                    <thead>
                                        <tr>
                                            <th rowspan="2">SL</th>
                                            <th rowspan="2">Indicator and Activity</th>
                                            <th rowspan="2">Execute Date</th>
                                            <th rowspan="2">Execute By</th>
                                            <th rowspan="2">Beneficiary</th>
                                            <th rowspan="2">Attendance</th>
                                            <th colspan="4" class="text-center">Survey Info</th>
                                        </tr>
                                        <tr class="survey-info">
                                            <th>Survey Date</th>
                                            <th>Survey Number</th>
                                            <th>Attendance</th>
                                            <th>Average Mark</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-if="loading">
                                            <td colspan="11" class="text-center">
                                                <div class="spinner-border text-primary" role="status">
                                                    <span class="visually-hidden">Loading...</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <template v-else-if="report.length > 0">
                                            <template v-for="(reportItem, index) in report" :key="index">
                                                <tr>
                                                    <td
                                                        :rowspan="reportItem.surveys?.length > 0 ? reportItem.surveys.length : 1">
                                                        {{ index + 1 }}
                                                    </td>
                                                    <td
                                                        :rowspan="reportItem.surveys?.length > 0 ? reportItem.surveys.length : 1">
                                                        Indicator: {{ reportItem.indicator?.title || 'N/A' }}<br>
                                                        Activity: {{ reportItem.activity?.title || 'N/A' }}
                                                    </td>
                                                    <td
                                                        :rowspan="reportItem.surveys?.length > 0 ? reportItem.surveys.length : 1">
                                                        {{ reportItem.execute_date || 'N/A' }}
                                                    </td>
                                                    <td
                                                        :rowspan="reportItem.surveys?.length > 0 ? reportItem.surveys.length : 1">
                                                        {{ reportItem.admin?.name || 'N/A' }}
                                                    </td>
                                                    <td
                                                        :rowspan="reportItem.surveys?.length > 0 ? reportItem.surveys.length : 1">
                                                        {{ reportItem.total_assigned_beneficiaries || 0 }}
                                                    </td>
                                                    <td
                                                        :rowspan="reportItem.surveys?.length > 0 ? reportItem.surveys.length : 1">
                                                        {{
                                                            reportItem.beneficiary_attendance?.find(attendance =>
                                                                attendance.group_id === reportItem.group_id)
                                                                ?.average_attendance || 0
                                                        }}
                                                    </td>
                                                    <td>{{ reportItem.surveys?.[0]?.survey_date || 'N/A' }}
                                                    </td>
                                                    <td>{{ reportItem.surveys?.[0]?.survey_number || 'N/A' }}</td>
                                                    <td>{{
                                                        reportItem.surveys?.[0]?.survey_beneficiaries?.[0]?.beneficiary_count
                                                        || 0 }}</td>
                                                    <td>{{
                                                        reportItem.surveys?.[0]?.survey_beneficiaries?.[0]?.average_marks
                                                        || 'N/A' }}</td>
                                                </tr>
                                                <template v-if="reportItem.surveys?.length > 1">
                                                    <template v-for="(survey, surveyIndex) in reportItem.surveys"
                                                        :key="surveyIndex">
                                                        <tr v-if="surveyIndex !== 0">
                                                            <td>{{ survey.survey_date || 'N/A' }}</td>
                                                            <td>{{ survey.survey_number || 'N/A' }}</td>
                                                            <td>{{ survey.survey_beneficiaries?.[0]?.beneficiary_count
                                                                || 0
                                                                }}</td>
                                                            <td>{{ survey.survey_beneficiaries?.[0]?.average_marks ||
                                                                'N/A'
                                                                }}</td>
                                                        </tr>
                                                    </template>
                                                </template>
                                            </template>
                                        </template>
                                        <tr v-else>
                                            <td colspan="11" class="text-center" style="background: #fff;">
                                                <p class="p-2 text-center text-red no-data">No data found.</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </template>
        </Fieldset>
    </div>
</template>

<script>
import JsonExcel from 'vue-json-excel3';
import moment from 'moment';
import html2pdf from 'html2pdf.js';
import * as XLSX from 'xlsx';

const model = "ActivityMonitoring";
export default ({
    components: {
        'download-excel': JsonExcel
    },
    data() {
        return {
            model: model,
            data: {
            },
            report: [],
            json_fields: {
            },
            report_date: moment().format('DD MMMM, YYYY'),
            loading: false,
            pdfData: [],
            allProjects: [],
            allIndicators: [],
            allActivity: [],
        }
    },
    provide() {
        return {
            validate: this.validation,
            model: this.model,
        };
    },
    methods: {
        getRowSpan(subArray) {
            const length = Object.keys(subArray).length;
            return length > 0 ? length : 1;
        },

        generatePdf() {
            console.log('achi');

            const element = document.getElementById('printArea');
            const options = {
                margin: 4,
                filename: 'activity_monitoring_report.pdf',
                image: { type: 'jpeg', quality: 5 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' },
            };
            html2pdf()
                .from(element)
                .set(options)
                .save();
        },
        /* generatePdf() {
            const project_id = this.data.project_id || null;
            const indicator_id = this.data.indicator_id || null;
            const activity_id = this.data.activity_id || null; axios
                .get(`report/activityReport?download_pdf=1&project_id=${project_id}&indicator_id=${indicator_id}&activity_id=${activity_id}`, {
                    responseType: "blob",
                })
                .then((response) => {
                    const blob = new Blob([response.data], { type: "application/pdf" });
                    const link = document.createElement("a");
                    link.href = window.URL.createObjectURL(blob);
                    link.download = "activity_report.pdf";
                    link.click();
                })
                .catch((error) => {
                    console.error("Error generating PDF:", error);
                    this.$toast("Failed to generate PDF", "error");
                });
        }, */
        generateExcel() {
            const element = document.getElementById('printArea');
            const ws = XLSX.utils.table_to_sheet(element);
            const wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, 'Activity Monitoring Report');
            XLSX.writeFile(wb, 'activity_monitoring_report.xlsx');
        },
        // api section
        fetchReportData() {
            if (!this.data.project_id) {
                this.$toast("Please select Project ", "warning");
                return;
            }
            const requestData = {
                project_id: this.data.project_id,
                indicator_id: this.data.indicator_id,
                activity_id: this.data.activity_id,
            };
            this.loading = true;
            axios
                .get('/report/activityReport', { params: requestData })
                .then((response) => {
                    if (response.data && response.data.length > 0) {
                        this.$toast("Data found", "success");
                        this.report = response.data;
                    } else {
                        this.$toast("No data found", "error");
                        this.report = [];
                    }
                })
                .catch((error) => {
                    console.error('Error fetching report data:', error);
                    this.$toast('Failed to fetch report data. Please try again', 'error');
                })
                .finally(() => {
                    this.loading = false;
                });
        },
        clearFilters() {
            this.data = {
                project_id: null,
                indicator_id: null,
                activity_id: null,
            };
            this.report = [];
            this.getProjects();
        },
        getProjects() {
            this.$root.spinner = true;
            axios
                .get("/get-projects", { params: { status: "active" } })
                .then((res) => (this.allProjects = res.data))
                .catch((error) => console.error("Error fetching projects:", error))
                .finally(() => {
                    setTimeout(() => {
                        this.$root.spinner = false;
                    }, 500);
                });;
        },
        getIndicatorsByProject(id) {
            this.data.indicator_id = null;
            this.allIndicators = [];
            if (id !== null) {
                this.getIndicators(id);
            }
        },
        getIndicators(id) {
            axios
                .get("/get-all-indicators", {
                    params: { id: id, status: "active" },
                })
                .then((res) => (this.allIndicators = res.data))
                .catch((error) => console.error("Error fetching indicators:", error));
        },
        getActivityByIndicator(id) {
            this.data.activity_id = null;
            this.allActivity = [];
            if (id !== null) {
                this.getActivity(id);
            }
        },
        getActivity(id) {
            axios
                .get("/get-activities", {
                    params: { id: id, status: "active" },
                })
                .then((res) => (this.allActivity = res.data))
                .catch((error) => console.error("Error fetching activities:", error));
        },
    },
    computed: {
        selectedProjectName() {
            const project = this.allProjects.find((item) => item.id === this.data.project_id);
            return project ? project.project_name : '';
        },
        selectedIndicatorName() {
            const indicator = this.allIndicators.find((item) => item.id === this.data.indicator_id);
            return indicator ? indicator.title : '';
        },
        selectedActivityName() {
            const activity = this.allActivity.find((item) => item.id === this.data.activity_id);
            return activity ? activity.title : '';
        },
    },
    created() {
        this.getProjects();
    },
    validators: {}
})
</script>

<style scoped>
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

th,
td {
    /* border: 1px solid #e7e7e7; */
    border: 1px solid rgb(12, 12, 12);
    padding: 8px;
    text-align: left;
}

.survey-info th {
    background-color: #f9f9f9;
    text-align: center;
    border-top: 1px solid black;
}
</style>
