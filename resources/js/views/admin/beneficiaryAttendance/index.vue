<template>
    <index-page>
        <template v-slot:search-field>
            <Select title="Select Project" v-model="search_data.project_id" field="search_data.project_id"
                label="project_name" :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--"
                :closeOnSelect="true" :required="false" col="4" @update:modelValue="
                    getIndicatorsByProject(search_data.project_id)
                    " />
            <Select title="Select Indicator" v-model="search_data.indicator_id" field="search_data.indicator_id"
                label="title" :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--"
                :closeOnSelect="true" :required="false" col="4" @update:modelValue="
                    getActivityByIndicator(search_data.indicator_id)
                    " />
            <Select title="Select Activity" v-model="search_data.activity_id" field="search_data.activity_id"
                label="title" :reduce="(obj) => obj.id" :options="allActivity" placeholder="--Select One--"
                :closeOnSelect="true" :required="false" col="4" />
            <date-picker id="date4" field="search_data.from_date" name="attendance_date" v-model="search_data.from_date"
                title="From Date" placeholder="dd/mm/yyyy" col="4" label="From Date" :tooltip="false"></date-picker>
            <date-picker id="date5" field="search_data.to_date" name="attendance_date" v-model="search_data.to_date"
                title="To Date" placeholder="dd/mm/yyyy" col="4" label="To Date" :disableToDates="search_data.from_date"
                :disableFutureDates="true"></date-picker>
        </template>
    </index-page>
</template>

<script>
const model = "beneficiaryAttendance";

const tableColumns = [
    {
        field: "attendance_date",
        title: "Attendance Date",
    },
    {
        field: "project_id",
        title: "Project Name",
        subfield: "project.project_name",
    },
    {
        field: "indicator_id",
        title: "Indicator Name",
        subfield: "indicator.title",
    },
    {
        field: "activity_id",
        title: "Activity Name",
        subfield: "activity.title",
    },
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    "Attendance Date": "attendance_date",
    Project: "project.project_name",
    Indicator: "indicator.title",
    Activity: "activity.title",
};

export default {
    data() {
        return {
            model: model,
            page_title: "",
            json_fields: json_fields,
            fields_name: {
                default: "Select One",
                project_name: "Project Name",
            },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                page: this.$route.query.page ?? 1,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                status: this.$route.query.status ?? "",
            },
            allProjects: [],
            allIndicators: [],
            allActivity: [],
            // allGroups: [],
            table: {
                columns: tableColumns,
                routes: {},
                datas: [],
                meta: [],
                links: [],
            },
        };
    },

    provide() {
        return {
            validate: this.validation,
            model: this.model,
            fields_name: this.fields_name,
            search_data: this.search_data,
            table: this.table,
            json_fields: this.json_fields,
            search: this.search,
            resetSearchData: this.resetSearchData,
        };
    },

    methods: {
        search() {
            this.$router.push({
                name: this.model + ".index",
                query: { ...this.search_data },
            });
            this.get_paginate(this.model, this.search_data);
        },

        resetSearchData() {
            this.search_data.pagination = 10;
            this.search_data.page = 1;
            this.search_data.field_name = "";
            this.search_data.value = "";
            this.search_data.status = "";
        },

        // API section
        getProjects() {
            axios
                .get("/get-projects")
                .then((res) => (this.allProjects = res.data));
        },
        getIndicatorsByProject(id) {
            this.search_data.indicator_id = null;
            this.allIndicators = [];
            if (id !== null) {
                this.getIndicators(id);
            }
        },

        getIndicators(id) {
            axios
                .get("/get-all-indicators", { params: { id: id } })
                .then((res) => (this.allIndicators = res.data))
                .catch((error) =>
                    console.error("Error fetching indicators:", error)
                );
        },

        getActivityByIndicator(id) {
            this.search_data.activity_id = null;
            this.allActivity = [];
            if (id !== null) {
                this.getActivity(id);
            }
        },
        getActivity(id) {
            axios
                .get("/get-activities", { params: { id: id } })
                .then((res) => (this.allActivity = res.data))
                .catch((error) =>
                    console.error("Error fetching activities:", error)
                );
        },
        getBeneficiaries(id) {
            let activityid = this.search_data.activity_id;
            // let group = this.search_data.group;
            axios
                .get("/get-all-beneficiaries", {
                    params: { activity_id: activityid },
                })
                .then((res) => {
                    this.allBeneficiaries = res.search_data;
                    this.checkAttendance();
                })
                .catch((error) =>
                    console.error("Error fetching beneficiaries:", error)
                );
        },
    },

    created() {
        this.getRouteName(this.model);
        this.page_title = `${this.headline(this.model)} List`;
        this.search();
        this.getProjects();
    },

    validators: {},
};
</script>
