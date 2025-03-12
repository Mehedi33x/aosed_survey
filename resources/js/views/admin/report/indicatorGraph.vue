<template>
    <Fieldset>
        <template v-slot:name>Project Indicator Graph</template>
        <template v-slot:content>
            <div class="col-12 mt-5 pt-4">
                <div class="search-field">
                    <div class="row mt-2">
                        <Select title="Project" v-model="data.project_id" field="data.project_id" label="project_name"
                            :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--"
                            :closeOnSelect="true" :required="true" col="4" :req="true"
                            @update:modelValue="getIndicatorsByProject(data.project_id)" />
                        <Select title="Project Indicator" v-model="data.indicator_id" field="data.indicator_id"
                            label="title" :reduce="(obj) => obj.id" :options="allIndicators"
                            placeholder="--Select One--" :closeOnSelect="true" :required="true" col="4"
                            @update:modelValue="(value) => getActivityByIndicator(value)" />
                        <div class="col-lg-4 d-flex gap-3 align-items-end">
                            <button type="button" class="btn btn-danger" @click="clearFilters">
                                Clear
                            </button>
                        </div>
                        <div class="pagination_action">
                            <div class="print_action text-end">
                                <!-- <button class="p_btn" data-bs-toggle="tooltip" data-bs-placement="top"
                                    data-bs-title="Print" v-x-tooltip @click="print('printArea', model)">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round"
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
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round"
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
                            <div class="text-center my-4">
                                <h5 class="my-0 pb-2">Project Indicator Graphical Report</h5>
                                <p style="margin-bottom: 5px;"><small>{{ site.short_title }}</small></p>
                                <p style="margin-bottom: 5px;"><small>{{ site.address }}</small></p>
                                <p style="margin-bottom: 5px;"><small>Phone: {{ site.mobile1 ?? "N/A" }} &nbsp; | &nbsp;
                                        Email:
                                        {{ site.contact_email ?? "N/A" }}</small></p>
                            </div>
                            <div
                                style="display: flex; justify-content: space-between; align-items: center;font-size: .875em;">
                                <div class="mx-2">
                                    <p style="margin-bottom: 5px;">Project: {{ selectedProjectName }}</p>
                                    <p style="margin-bottom: 5px;">Indicator: {{ selectedIndicatorName }}</p>
                                </div>
                                <div>
                                    <p class="mx-2 mt-4">Report Date: {{ report_date }}</p>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div v-if="allActivity.length > 0" class="d-flex">
                                    <div class="base_table_list mt-0 col-3">
                                        <h5 class="mb-3">Project Activities</h5>
                                        <div v-for="activity in allActivity" :key="activity.id" class="activity mb-3">
                                            <label class="mb-2">{{ activity.title }}</label>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar"
                                                    :style="{ width: activity.progress + '%' }"
                                                    :aria-valuenow="activity.progress" aria-valuemin="0"
                                                    aria-valuemax="100">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-9 mt-0">
                                        <Bar v-if="allActivity.length > 0" :options="chartOptions" :data="chartData" />
                                    </div>
                                </div>
                                <div v-else class="d-flex justify-content-center align-items-center col-12">
                                    <h2 class="text-danger fw-bold">No Data Found</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </template>
    </Fieldset>
</template>

<script>
import html2pdf from 'html2pdf.js';
import moment from 'moment';

import { Bar } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

const model = "IndicatorGraphReport";
export default {
    components: { Bar },
    data() {
        return {
            model: model,
            data: {
                project_id: null,
                indicator_id: null,
            },
            report: {
            },
            json_fields: {
            },
            report_date: moment().format('DD MMMM, YYYY'),
            loading: false,
            pdfData: [],
            allProjects: [],
            allIndicators: [],
            allActivity: [],
            groupedBarChart: null,
            chartData: {
                labels: [],
                datasets: [
                    {
                        label: 'Total Beneficiary',
                        data: [],
                        backgroundColor: 'rgba(54, 162, 235, 0.7)',
                    },
                    {
                        label: 'Attendance',
                        data: [],
                        backgroundColor: 'rgba(255, 99, 132, 0.7)', // Pink color
                    },
                    {
                        label: 'Survey',
                        data: [], // Data for 'Survey'
                        backgroundColor: 'rgba(255, 159, 64, 0.7)', // Orange color
                    },
                ]
            },
            chartOptions: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Project Activities Comparison', // Title for the chart
                    },
                },
                scales: {
                    x: {
                        // Group bars together for each label
                        barPercentage: 0.6,  // Adjust bar width
                        categoryPercentage: 0.5, // Adjust spacing between bars
                    },
                    y: {
                        beginAtZero: true,
                    },
                }
            }
        }
    },
    provide() {
        return {
            validate: this.validation,
            model: this.model,
        };
    },
    methods: {
        getActivityByIndicator(indicatorId) {
            // console.log("API Call Initiated for Indicator:", indicatorId);
            this.data.activity_id = null;
            this.allActivity = [];
            if (indicatorId) {
                axios
                    .get("/report/indicatorGraph", {
                        params: { indicator_id: indicatorId, },
                    })
                    .then((res) => {
                        this.allActivity = res.data;
                        if (this.allActivity.length > 0) {
                            this.$toast("Data found", "success");
                            this.chartData.labels = [];
                            this.chartData.datasets[0].data = [];
                            this.chartData.datasets[1].data = [];
                            this.chartData.datasets[2].data = [];

                            this.allActivity.forEach(activity => {
                                this.chartData.labels.push(activity.title);
                                this.chartData.datasets[0].data.push(activity.beneficiaries_count);
                                this.chartData.datasets[1].data.push(activity.beneficiary_attendances_count);
                                this.chartData.datasets[2].data.push(activity.surveys_count);
                            });
                        } else {
                            this.$toast("No data found", "error");
                            return;
                        }

                    });
            }
        },
        createChart() {
            const ctx = document.getElementById("groupedBarChart").getContext("2d");
            this.groupedBarChart = new Chart(ctx, {
                type: "bar",
                data: {
                    labels: [], // Activity titles
                    datasets: [
                        {
                            label: "Total Beneficiary",
                            data: [], // Total beneficiary values
                            backgroundColor: "rgba(54, 162, 235, 0.7)", // Blue
                        },
                        {
                            label: "Attendance",
                            data: [], // Attendance values
                            backgroundColor: "rgba(75, 192, 192, 0.7)", // Green
                        },
                        {
                            label: "Survey",
                            data: [], // Survey values
                            backgroundColor: "rgba(255, 99, 132, 0.7)", // Red
                        },
                    ],
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: { position: "top" },
                        title: { display: true, text: "Activity Comparison Chart" },
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: { display: true, text: "Points" },
                        },
                    },
                },
            });
        },
        /* updateChart() {
            if (this.groupedBarChart) {
                this.groupedBarChart.data.labels = this.allActivity.map(
                    (activity) => activity.title
                );
                this.groupedBarChart.data.datasets[0].data = this.allActivity.map(
                    (activity) => activity.total
                );
                this.groupedBarChart.data.datasets[1].data = this.allActivity.map(
                    (activity) => activity.attendance
                );
                this.groupedBarChart.data.datasets[2].data = this.allActivity.map(
                    (activity) => activity.survey
                );
                this.groupedBarChart.update();
            }
        }, */
        async fetchActivitiesData() {
            try {
                const response = await axios.get('/get-activities', { params: { project_id: this.data.project_id, status: "active" } });
                const activities = response.data;
                this.chartData.labels = activities.map(activity => activity.activity_name);
                this.chartData.datasets.forEach((dataset, index) => {
                    dataset.data = activities.map(activity => activity[index === 0 ? 'total' : index === 1 ? 'attendance' : 'survey']);
                });
                this.allActivity = activities;
            } catch (error) {
                console.error('Error fetching indicator data:', error);
            }
        },
        // print section
        generatePdf() {
            const element = document.getElementById('printArea');
            const options = {
                margin: 4,
                filename: 'indicator_graph_report.pdf',
                image: { type: 'jpeg', quality: 8 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' },
            };
            html2pdf()
                .from(element)
                .set(options)
                .save();
        },
        /* generateExcel() {
            const element = document.getElementById('printArea');
            const ws = XLSX.utils.table_to_sheet(element);
            const wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, 'indicator_graph_report');
            XLSX.writeFile(wb, 'indicator_graph_report.xlsx');
        }, */
        clearFilters() {
            this.data = {
                project_id: null,
                indicator_id: null,
            };
            this.allProjectBeneficiary = [];
            this.getProjects();
        },
        // api section
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
                });
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

    },
    created() {
        this.getProjects();
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
    },
    validators: {}
};
</script>

<style scoped>
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

th,
td {
    border: 1px solid #e7e7e7;
    padding: 8px;
    text-align: left;
}

.survey-info th {
    background-color: #f9f9f9;
    text-align: center;
    border-top: 1px solid black;
}
</style>
