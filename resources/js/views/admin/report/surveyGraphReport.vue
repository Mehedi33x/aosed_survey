<template>
    <div>
        <div class="component_loader" :class="{ 'z-top': $root.initialLoader }"
            v-if="$root.spinner && !$root.tableSpinner">
            <div class="loader"></div>
        </div>
        <Fieldset v-show="!$root.spinner || $root.tableSpinner">
            <template v-slot:name>Project Survey Graphical Report</template>
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
                                    <!-- <button class="p_btn" data-bs-toggle="tooltip" data-bs-placement="top"
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
                                    </button> -->
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
                            <div class="base_table_list">
                                <div id="printArea" class="table-responsive text-nowrap table-basic table_wrapper ">
                                    <div class="text-center mb-3">
                                        <h5 class="my-0 pb-2">Project Survey Graphical Report</h5>
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

                                    <!-- Line Chart Section -->
                                    <div class="mt-3 center-content">
                                        <!-- <h4>Graphical Report</h4> -->
                                        <!-- <LineChart :chartData="chartData" :chartOptions="chartOptions" /> -->
                                        <LineChart v-if="chartData && chartData.labels.length" :data="chartData"
                                            :options="chartOptions" />
                                        <div v-else class="d-flex justify-content-center align-items-center mt-3">
                                            <h2 class="text-danger fw-bold">No Data Found</h2>
                                        </div>
                                    </div>

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

import LineChart from "./../../../components/chart/Line.vue";


const model = "surveyGraph";
export default ({
    components: {
        LineChart,
    },
    data() {
        return {
            model: model,
            data: {
            },
            json_fields: {

            },
            report_date: moment().format('DD MMMM, YYYY'),
            reportData: [],
            pdfData: [],
            allProjects: [],
            allIndicators: [],
            allActivity: [],

            chartData: {
                labels: [],
                datasets: [],
            },
            chartOptions: {
                responsive: true,
                plugins: {
                    legend: { display: true },
                    title: { display: true, text: '' },
                },
            },

        }
    },
    provide() {
        return {
            validate: this.validation,
            model: this.model,
        };
    },
    methods: {
        prepareChartData() {
            const labels = this.reportData.map((item) => item.survey_number);
            const averages = this.reportData.map((item) => parseFloat(item.average));

            this.chartData = {
                labels: labels,
                datasets: [
                    {
                        label: "Average Mark",
                        data: averages,
                        fill: false,
                        borderColor: "#42A5F5",
                        tension: 0.4,
                    },
                ],
            };

            this.chartOptions = {
                responsive: true,
                plugins: {
                    legend: {
                        display: true,
                        position: "top",
                    },
                    title: {
                        display: true,
                        text: "Survey Average Marks",
                    },
                },
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: "Surveys",
                        },
                    },
                    y: {
                        title: {
                            display: true,
                            text: "Average Marks",
                        },
                        min: 0,
                        max: 100,
                    },
                },
            };
        },


        fetchReportData() {
            if (!this.data.project_id) {
                this.$toast("Please select Project", "warning");
                return;
            }
            const requestData = {
                project_id: this.data.project_id,
                indicator_id: this.data.indicator_id,
                activity_id: this.data.activity_id,
            };
            axios
                .get('/report/surveyGraph', { params: requestData })
                .then((response) => {
                    if (response.data && response.data.length > 0) {
                        this.$toast("Data found", "success");
                        this.reportData = response.data;
                        this.prepareChartData();
                    } else {
                        this.$toast("No data found", "error");
                        this.reportData = [];
                        this.chartData = { labels: [], datasets: [] };
                    }
                })
                .catch((error) => {
                    console.error('Error fetching report data:', error);
                    this.$toast('Failed to fetch report data. Please try again', 'error');
                    this.chartData = { labels: [], datasets: [] };
                })
                .finally(() => {
                    // this.loading = false;
                });
        },


        // print section
        generatePdf() {
            const element = document.getElementById('printArea');
            const options = {
                margin: 4,
                filename: 'Survey Graph Report.pdf',
                image: { type: 'jpeg', quality: 8 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' },
            };
            html2pdf()
                .from(element)
                .set(options)
                .save();
        },
        clearFilters() {
            this.data = {
                project_id: null,
                indicator_id: null,
                activity_id: null,
            };
            this.reportData = [];
            this.getProjects();
        },
        //    api section
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
            if (this.data.project_id !== id) return;
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
            if (this.data.indicator_id !== id) return;
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
.center-content {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100%;
    text-align: center;
}

.no-data-box {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
    background-color: #ffffff;
    border: 2px solid #000000;
    color: #000000;
    font-size: 1rem;
    border-radius: 1px;
    width: 80%;
    margin-top: 20px;
}
</style>
