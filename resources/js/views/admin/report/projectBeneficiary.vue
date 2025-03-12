<template>
    <div>
        <div class="component_loader" :class="{ 'z-top': $root.initialLoader }"
            v-if="$root.spinner && !$root.tableSpinner">
            <div class="loader"></div>
        </div>
        <Fieldset v-show="!$root.spinner || $root.tableSpinner">
            <template v-slot:name>Project Beneficiary Report</template>
            <template v-slot:content>
                <div class="col-12 pt-4">
                    <div class="search-field">
                        <div class="row g-3">
                            <Select title="Project" v-model="data.project_id" field="data.project_id"
                                label="project_name" :reduce="(obj) => obj.id" :options="allProjects"
                                placeholder="--Select One--" :closeOnSelect="true" :required="false" col="4"
                                @update:modelValue="getIndicatorsByProject(data.project_id)" />
                            <Select title="Project Indicator" v-model="data.indicator_id" field="data.indicator_id"
                                label="title" :reduce="(obj) => obj.id" :options="allIndicators"
                                placeholder="--Select One--" :closeOnSelect="true" :required="false" col="4"
                                @update:modelValue="getActivityByIndicator(data.indicator_id)" />
                            <Select title="Project Activity" v-model="data.activity_id" field="data.activity_id"
                                label="title" :reduce="(obj) => obj.id" :options="allActivity"
                                placeholder="--Select One--" :closeOnSelect="true" :required="false" col="4" />
                            <Select title="Group" v-model="data.group_id" field="data.group_id" label="title"
                                :reduce="(obj) => obj.id" :options="allGroups" placeholder="--Select One--"
                                :closeOnSelect="true" :required="false" col="4" />
                            <Select title="Select Occupation" v-model="data.occupation_id" field="data.occupation_id"
                                label="title" :reduce="(obj) => obj.id" :options="allOccupations"
                                placeholder="--Select One--" :closeOnSelect="true" col="4" />
                            <Select title="Gender" v-model="data.gender" field="data.gender" label="title"
                                :reduce="(obj) => obj.value" :options="global.gender" placeholder="--Select One--"
                                :closeOnSelect="true" col="4" />
                            <Select title="Select Marital Status" v-model="data.marital_status"
                                field="data.marital_status" label="title" :reduce="(obj) => obj.value"
                                :options="global.maritalStatus" placeholder="--Select One--" :closeOnSelect="true"
                                col="4" />

                            <div class="col-lg-4 d-flex gap-3 align-items-end">
                                <button type="button" class="btn btn-success" @click="searchReportData">
                                    Search
                                </button>
                                <button type="button" class="btn btn-danger" @click="clearFilters">
                                    Clear
                                </button>
                            </div>

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
                                    <!-- <button class="p_btn" data-bs-toggle="tooltip" data-bs-placement="top"
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
                                <div id="printArea" class="table-responsive text-nowrap table-basic table_wrapper">
                                    <div class="text-center mb-3">
                                        <h5 class="my-0 pb-2">Project Beneficiary Report</h5>
                                        <p style="margin-bottom: 5px">
                                            <small>{{ site.short_title }}</small>
                                        </p>
                                        <p style="margin-bottom: 5px">
                                            <small>{{ site.address }}</small>
                                        </p>
                                        <p style="margin-bottom: 5px">
                                            <small>Phone: {{ site.mobile1 ?? "N/A" }} &nbsp; | &nbsp; Email:
                                                {{ site.contact_email ?? "N/A" }}</small>
                                        </p>
                                    </div>

                                    <div style="
                      display: flex;
                      justify-content: space-between;
                      align-items: center;
                      font-size: 0.875em;
                    ">
                                        <div class="mx-2">
                                            <p style="margin-bottom: 5px">Project: {{ selectedProjectName }}</p>
                                            <p style="margin-bottom: 5px">
                                                Indicator: {{ selectedIndicatorName }}
                                            </p>
                                            <p style="margin-bottom: 5px">
                                                Activity: {{ selectedActivityName }}
                                            </p>
                                            <p>
                                                <strong>Total Beneficiaries: </strong>{{ allProjectBeneficiary.length }}
                                            </p>
                                        </div>
                                        <div>
                                            <p class="mx-2 mt-4">Report Date: {{ report_date }}</p>
                                        </div>
                                    </div>

                                    <table id="pdf-table" class="table">
                                        <thead>
                                            <tr>
                                                <th>Group</th>
                                                <th>Beneficiary ID</th>
                                                <th>Beneficiary Name</th>
                                                <th>Gender</th>
                                                <th>Mobile</th>
                                                <th>NID</th>
                                                <th>Marital Status</th>
                                                <th>Occupations</th>
                                                <th>Family Members</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-if="loading">
                                                <td colspan="9" class="text-center">
                                                    <div class="spinner-border text-primary" role="status">
                                                        <span class="visually-hidden">Loading...</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <template v-else-if="!loading && allProjectBeneficiary.length > 0">
                                                <tr v-for="(item, index) in allProjectBeneficiary" :key="index">
                                                    <td class="text-center">{{ item.group?.title ?? "N/A" }}</td>
                                                    <td class="text-center">
                                                        {{ item.beneficiary.beneficiary_no ?? "N/A" }}
                                                    </td>
                                                    <td class="text-center">
                                                        {{ item.beneficiary.full_name ?? "N/A" }}
                                                    </td>
                                                    <td class="text-center text-capitalize">
                                                        {{ item.beneficiary.gender ?? "N/A" }}
                                                    </td>
                                                    <td class="text-center">
                                                        {{ item.beneficiary.mobile_no ?? "N/A" }}
                                                    </td>
                                                    <td class="text-center">{{ item.beneficiary.nid ?? "N/A" }}</td>
                                                    <td class="text-center text-capitalize">
                                                        {{ item.beneficiary.marital_status ?? "N/A" }}
                                                    </td>
                                                    <td class="text-center text-capitalize">
                                                        {{
                                                            item.beneficiary.beneficiary_occupations &&
                                                                item.beneficiary.beneficiary_occupations.length > 0
                                                                ? item.beneficiary.beneficiary_occupations
                                                                    .map((occupation) => occupation.occupations?.title)
                                                                    .join(", ")
                                                                : "N/A"
                                                        }}
                                                    </td>
                                                    <td class="text-center">
                                                        {{ item.beneficiary.family_members_count ?? "N/A" }}
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
import JsonExcel from "vue-json-excel3";
import moment from "moment";
import html2pdf from "html2pdf.js";
import * as XLSX from "xlsx";

const model = "ActivityMonitoring";
export default {
    components: {
        "download-excel": JsonExcel,
    },
    data() {
        return {
            model: model,
            data: {
                gender: null,
            },
            report: [],
            json_fields: {},
            report_date: moment().format("DD MMMM, YYYY"),
            project_name: "",
            indicator_name: "",
            activity_name: "",
            loading: false,
            pdfData: [],
            allProjects: [],
            allIndicators: [],
            allActivity: [],
            allProjectBeneficiary: [],
            allGroups: [],
        };
    },
    provide() {
        return {
            validate: this.validation,
            model: this.model,
        };
    },
    computed: {
        selectedProjectName() {
            const project = this.allProjects.find((item) => item.id === this.data.project_id);
            return project ? project.project_name : "";
        },
        selectedIndicatorName() {
            const indicator = this.allIndicators.find(
                (item) => item.id === this.data.indicator_id
            );
            return indicator ? indicator.title : "";
        },
        selectedActivityName() {
            const activity = this.allActivity.find((item) => item.id === this.data.activity_id);
            return activity ? activity.title : "";
        },
    },
    methods: {
        //getRowSpan(subArray) {
        //  const length = Object.keys(subArray).length;
        //return length > 0 ? length : 1;
        //},
        generatePdf() {
            if (this.allProjectBeneficiary.length > 0) {
                axios
                    .get("/report/projectBeneficiary?download_pdf", {
                        responseType: "blob",
                        params: this.data,
                    })
                    .then((response) => {
                        const url = window.URL.createObjectURL(new Blob([response.data]));
                        const link = document.createElement("a");
                        link.href = url;
                        link.setAttribute("download", "project-beneficiary-report.pdf");
                        document.body.appendChild(link);
                        link.click();
                        document.body.removeChild(link);
                    })
                    .catch((error) => {
                        console.error("Error downloading the PDF:", error);
                    });
            }
        },
        generateExcel() {
            const element = document.getElementById("printArea");
            const ws = XLSX.utils.table_to_sheet(element);
            const wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, "Project Beneficiary Report");
            XLSX.writeFile(wb, "project_beneficiary_report.xlsx");
        },
        // api section
        searchReportData() {
            if (!this.data.project_id) {
                this.$toast("Please select Project", "warning");
                return;
            }
            const requestData = {
                project_id: this.data.project_id,
                indicator_id: this.data.indicator_id,
                activity_id: this.data.activity_id,
                gender: this.data.gender,
                marital_status: this.data.marital_status,
                occupation_id: this.data.occupation_id,
                group_id: this.data.group_id,
            };
            axios
                .get("/report/projectBeneficiary", { params: requestData })
                .then((response) => {
                    const responseDataArray = Object.values(response.data);
                    this.allProjectBeneficiary = responseDataArray;
                    if (responseDataArray.length > 0) {
                        this.$toast("Data found", "success");
                        this.report = responseDataArray;
                        this.project_name = responseDataArray[0].project.project_name;
                        this.indicator_name = responseDataArray[0].indicator?.title || "N/A";
                        this.activity_name = responseDataArray[0].activity?.title || "N/A";
                    } else {
                        this.$toast("No data found", "error");
                        this.report = [];
                    }
                });
        },
        clearFilters() {
            this.data = {
                project_id: null,
                indicator_id: null,
                activity_id: null,
                gender: null,
                marital_status: null,
                occupation_id: null,
            };
            this.allProjectBeneficiary = [];
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
        getGroups() {
            axios
                .get("/get-all-groups", { params: { status: "active" } })
                .then((res) => (this.allGroups = res.data));
        },
        getOccupations() {
            axios
                .get("/get-occupations")
                .then((res) => (this.allOccupations = res.data))
                .catch((error) => console.error("Error fetching occupations:", error));
        },
    },
    created() {
        this.getProjects();
        this.getGroups();
        this.getOccupations();
    },
    validators: {},
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
