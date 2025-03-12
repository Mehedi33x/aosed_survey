<template>
    <div>
        <div class="component_loader" :class="{ 'z-top': $root.initialLoader }"
            v-if="$root.spinner && !$root.tableSpinner">
            <div class="loader"></div>
        </div>
        <Fieldset v-show="!$root.spinner || $root.tableSpinner">
            <template v-slot:name>Project Summary Report</template>
            <template v-slot:content>
                <div class="col-12 mt-5 pt-4">
                    <div class="search-field">
                        <div class="row mt-2">
                            <Select title="Project" v-model="search_data.project_id" field="search_data.project_id"
                                label="project_name" :reduce="(obj) => obj.id" :options="allProjects"
                                placeholder="--Select One--" :closeOnSelect="true" :required="true" col="4"
                                :req="true" />

                            <date-picker id="date1" v-model="search_data.from_date" field="search_data.from_date"
                                title="From Date" placeholder="From Date" col="4" :req="true"></date-picker>

                            <date-picker id="date2" v-model="search_data.to_date" field="search_data.to_date"
                                title="To Date" placeholder="To Date" col="4" :req="true"></date-picker>

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
                            <div class="base_table_list">
                                <div id="printArea" class="table-responsive text-nowrap table-basic table_wrapper">
                                    <div class="text-center mb-3">
                                        <h5 class="my-0 pb-2">Project Summary Report</h5>
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
                                            <p style="margin-bottom: 5px;">From Date: {{ formattedFromDate }}</p>
                                            <p style="margin-bottom: 5px;">To Date: {{ formattedToDate }}</p>
                                        </div>
                                        <div>
                                            <p class="mx-2 mt-4">Report Date: {{ report_date }}</p>
                                        </div>
                                    </div>

                                    <table id="pdf-table" class="table">
                                        <thead>
                                            <tr>
                                                <th class="text-center">SL</th>
                                                <th class="text-center">Project Date</th>
                                                <th class="text-center">Project</th>
                                                <th class="text-center">Indicator</th>
                                                <th class="text-center">Activity</th>
                                                <th class="text-center">Execute Activity</th>
                                                <th class="text-center">Total Beneficiaries</th>
                                                <th class="text-center">Target Achievement</th>
                                                <th class="text-center">Earned Achievement</th>
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
                                            <template v-else-if="!loading && allProjectReports.length > 0">
                                                <tr v-for="(item, index) in allProjectReports" :key="index">
                                                    <td class="text-center">{{ index + 1 }}</td>
                                                    <td class="text-center">{{ item.start_date ?? 'N/A' }}</td>
                                                    <td class="text-justify">{{ item.project_name ?? 'N/A' }}</td>
                                                    <td class="text-center">{{ item.total_indicators ?? 0 }}</td>
                                                    <td class="text-center">{{ item.total_activities ?? 0 }}</td>
                                                    <td class="text-center">{{ item.execute_activity ?? 0 }}</td>
                                                    <td class="text-center">{{ item.total_beneficiaries
                                                        ??
                                                        0 }}
                                                    </td>
                                                    <td class="text-center">{{ item.target_achievement ?? 0 }}</td>
                                                    <td class="text-center">
                                                        {{ item.project_achievement_views.length > 0
                                                            ?
                                                            parseFloat(item.project_achievement_views[0].achievement).toFixed(2)
                                                            : "0.00" }}
                                                    </td>
                                                </tr>
                                            </template>
                                            <tr v-else>
                                                <td colspan="9" style="text-align: center; background: #fff">
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
import moment from 'moment';
import html2pdf from 'html2pdf.js';
import * as XLSX from 'xlsx';
export default {
    provide() {
        return {
            validate: this.validation,
        };
    },
    data() {
        return {
            allProjectReports: [],
            allProjects: [],
            report_date: moment().format('DD MMMM, YYYY'),
            search_data: {
                project_id: '',
                from_date: '',
                to_date: ''
            },
            loading: false,
        }
    },

    methods: {
        fetchReportData() {
            if (!this.search_data.project_id && (!this.search_data.from_date || !this.search_data.to_date)) {
                this.$toast("Please select a Project or provide both From Date and To Date", "warning");
                return;
            }

            if ((this.search_data.from_date && !this.search_data.to_date) || (!this.search_data.from_date && this.search_data.to_date)) {
                this.$toast("Please select both From Date and To Date to search by date range", "warning");
                return;
            }
            this.loading = true;
            axios
                .get("/report/projectReport", {
                    params: {
                        project_id: this.search_data.project_id,
                        from_date: this.search_data.from_date,
                        to_date: this.search_data.to_date
                    }
                })
                .then((res) => {
                    if (res.data && res.data.length > 0) {
                        this.$toast("Data found", "success");
                        this.allProjectReports = res.data;
                    } else {
                        this.$toast("No data found", "warning");
                        this.allProjectReports = [];
                    }
                })
                .catch((error) => console.error("Error fetching projects:", error))
                .finally(() => {
                    this.loading = false;
                });
        },
        clearFilters() {
            this.search_data = {
                project_id: '',
                from_date: '',
                to_date: '',
            };
            this.allProjectReports = [];
            this.getProjectReports();
        },
        /* generatePdf() {
            const element = document.getElementById('printArea');
            const options = {
                margin: 4,
                filename: 'project_summury_report.pdf',
                image: { type: 'jpeg', quality: 5 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'mm', format: 'a4', orientation: 'landscape' },
            };
            html2pdf()
                .from(element)
                .set(options)
                .save();
        }, */

        generatePdf() {
            const params = {
                project_id: this.search_data.project_id,
                from_date: this.search_data.from_date,
                to_date: this.search_data.to_date,
            };
            /* console.log('here to generate');
            return; */

            axios
                .get("/report/projectReport?download_pdf", {
                    params,
                    responseType: "blob",
                })
                .then((response) => {
                    const blob = new Blob([response.data], { type: "application/pdf" });
                    const link = document.createElement("a");
                    link.href = window.URL.createObjectURL(blob);
                    link.download = "project_summary_report.pdf";
                    link.click();
                })
                .catch((error) => {
                    console.error("Error generating PDF:", error);
                    this.$toast("Failed to generate PDF", "error");
                });
        },

        generateExcel() {
            const element = document.getElementById('printArea');
            const ws = XLSX.utils.table_to_sheet(element);
            const wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, 'Project Summury Report');
            XLSX.writeFile(wb, 'project_summury_report.xlsx');
        },
        // at initial state to get all data
        getProjectReports() {
            this.$root.spinner = true;
            axios
                .get("/report/projectReport", { params: { status: "active" } })
                .then((res) => {
                    this.allProjectReports = res.data;
                })
                .catch((error) => console.error("Error fetching projects:", error))
                .finally(() => {
                    setTimeout(() => {
                        this.$root.spinner = false;
                    }, 500);
                });;
        },

        getProjects() {
            axios.get("/get-projects").then((res) => (this.allProjects = res.data));
        },
    },
    computed: {
        selectedProjectName() {
            const project = this.allProjects.find((item) => item.id === this.search_data.project_id);
            return project ? project.project_name : 'N/A';
        },
        formattedFromDate() {
            return this.search_data.from_date
                ? moment(this.search_data.from_date).format('DD MMMM, YYYY')
                : 'N/A';
        },
        formattedToDate() {
            return this.search_data.to_date
                ? moment(this.search_data.to_date).format('DD MMMM, YYYY')
                : 'N/A';
        },

    },
    created() {
        this.getProjectReports();
        this.getProjects();
    },
    validators: {}
}

</script>

<style scoped>
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

th,
td {
    border: 1px solid rgb(12, 12, 12);
    padding: 8px;
    text-align: left;
}
</style>
