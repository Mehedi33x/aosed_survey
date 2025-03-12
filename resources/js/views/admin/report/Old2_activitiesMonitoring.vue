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

                            <div>
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
                                <!-- <h5 class="text-center mt-2 pb-3">Project Activities Monitoring Report</h5> -->
                            </div>
                            <div class="base_table_list">
                                <div id="printArea" class="table-responsive text-nowrap table-basic table_wrapper ">
                                    <div class="text-center mb-3">
                                        <h5 class="my-0 pb-2">Project Activities Monitoring</h5>
                                        <p style="margin-bottom: 5px;"><small>AOSED</small></p>
                                        <p style="margin-bottom: 5px;"><small>334, Sher-A-Bangla Road (1st floor),
                                                Khulna-9100,
                                                Bangladesh</small></p>
                                        <p style="margin-bottom: 5px;"><small>Phone: 0172 33 44 55 &nbsp; | &nbsp;
                                                Email:
                                                info@aosed.org.bd</small></p>
                                    </div>

                                    <div
                                        style="display: flex; justify-content: space-between; align-items: center;font-size: .875em;">
                                        <div class="mx-2">
                                            <p style="margin-bottom: 5px;">Project: {{ project_name }}</p>
                                            <p style="margin-bottom: 5px;">Indicator: {{ indicator_name }}</p>
                                            <p style="margin-bottom: 5px;">Activity: {{ activity_name }}</p>
                                            <!-- <p style="margin-bottom: 5px;">Achievement: test</p> -->
                                        </div>
                                        <div>
                                            <p class="mx-2 mt-4">Report Date: {{ report_date }}</p>
                                        </div>
                                    </div>

                                    <table id="pdf-table" class="table">
                                        <thead>
                                            <tr>
                                                <th rowspan="2">Group</th>
                                                <th rowspan="2">Execute Date</th>
                                                <th rowspan="2">Execute By</th>
                                                <th rowspan="2">Beneficiary</th>
                                                <th colspan="3" class="text-center">Survey Info (50)</th>
                                            </tr>
                                            <tr class="survey-info">
                                                <th>Survey Date</th>
                                                <th>Beneficiary Name</th>
                                                <th>Mark</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-if="loading">
                                                <td colspan="8" class="text-center">
                                                    <div class="spinner-border text-primary" role="status">
                                                        <span class="visually-hidden">Loading...</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <template v-else-if="report.length > 0">
                                                <template v-for="reportItem in report">
                                                    <tr>
                                                        
                                                        <td :rowspan="getRowSpan(reportItem.surveyBeneficiaries)">{{
                                                            reportItem.execute_date ?? 'N/A' }}</td>
                                                        <td :rowspan="getRowSpan(reportItem.surveyBeneficiaries)">{{
                                                            reportItem.admin.name ?? 'N/A' }}</td>
                                                        <td :rowspan="getRowSpan(reportItem.surveyBeneficiaries)">{{
                                                            reportItem.total_beneficiary ?? 0 }}</td>
                                                        <td
                                                            v-if="reportItem.surveyBeneficiaries && reportItem.surveyBeneficiaries.length > 0">
                                                            {{ reportItem.surveyBeneficiaries[0].survey_date ?? 'N/A' }}
                                                        </td>
                                                        <td
                                                            v-if="reportItem.surveyBeneficiaries && reportItem.surveyBeneficiaries.length > 0">
                                                            {{ reportItem.surveyBeneficiaries[0].beneficiary.full_name
                                                                ??
                                                                'N/A' }}
                                                        </td>
                                                        <td
                                                            v-if="reportItem.surveyBeneficiaries && reportItem.surveyBeneficiaries.length > 0">
                                                            {{ reportItem.surveyBeneficiaries[0].total_mark ?? 'N/A' }}
                                                        </td>
                                                        <td v-else colspan="3" class="text-center">
                                                            No Data Found
                                                        </td>
                                                    </tr>
                                                    <template v-if="reportItem.surveyBeneficiaries.length > 1">
                                                        <template
                                                            v-for="(beneficiary, beneficiaryIndex) in reportItem.surveyBeneficiaries">
                                                            <tr v-if="beneficiaryIndex !== 0">
                                                                <td>{{ beneficiary.survey_date ?? 'N/A'
                                                                    }}
                                                                </td>
                                                                <td>{{ beneficiary.beneficiary.full_name ??
                                                                    'N/A'
                                                                    }}
                                                                </td>
                                                                <td>{{ beneficiary.total_mark ?? 'N/A'
                                                                    }}
                                                                </td>
                                                            </tr>
                                                        </template>
                                                    </template>
                                                </template>
                                            </template>
                                            <tr v-else>
                                                <td colspan="8" style="text-align: center; background: #fff">
                                                    <p class="p-2 text-center text-red no-data">No data found.</p>
                                                </td>
                                            </tr>
                                        </tbody>

                                    </table>
                                </div>
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
            project_name: "",
            indicator_name: "",
            activity_name: "",
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
    computed: {},
    methods: {
        getRowSpan(subArray) {
            const length = Object.keys(subArray).length;
            return length > 0 ? length : 1;
        },
        generatePdf() {
            const element = document.getElementById('printArea');
            const options = {
                margin: 4,
                filename: 'activity_monitoring_report.pdf',
                image: { type: 'jpeg', quality: 5 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' },
            };
            html2pdf()
                .from(element)
                .set(options)
                .save();
        },
        generateExcel() {
            const element = document.getElementById('printArea');
            const ws = XLSX.utils.table_to_sheet(element);
            const wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, 'Activity Monitoring Report');
            XLSX.writeFile(wb, 'activity_monitoring_report.xlsx');
        },
        // api section
        fetchReportData() {
            if (!this.data.project_id || !this.data.indicator_id || !this.data.activity_id) {
                this.$toast("Please select Project Indicator and Activity", "warning");
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
                        this.project_name = response.data[0].project.project_name;
                        this.indicator_name = response.data[0].indicator.title;
                        this.activity_name = response.data[0].activity.title;

                    } else {
                        this.$toast("No data found", "error");
                        this.report = [];
                        // this.project_name = "";
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
