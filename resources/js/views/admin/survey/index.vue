<template>
    <index-page :show_status="false">
        <template v-slot:search-field>
            <Select title="Project" v-model="search_data.project_id" field="search_data.project_id" label="project_name"
                :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--" :closeOnSelect="true"
                col="6" @update:modelValue="getIndicatorsByProject(search_data.project_id)" />

            <Select title="Indicator" v-model="search_data.indicator_id" field="search_data.indicator_id" label="title"
                :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--" :closeOnSelect="true"
                col="6" @update:modelValue="getActivityByIndicator(search_data.indicator_id)" />

            <Select title="Project Activity" v-model="search_data.activity_id" field="search_data.activity_id"
                label="title" :reduce="(obj) => obj.id" :options="allActivity" placeholder="--Select One--"
                :closeOnSelect="true" col="6" />

            <date-picker id="date1" field="search_data.from_date" v-model="search_data.from_date" title="From Date"
                placeholder="dd/mm/yyyy" col="3" :disableFutureDates="true"></date-picker>

            <date-picker id="date2" field="search_data.to_date" v-model="search_data.to_date" title="To Date"
                placeholder="dd/mm/yyyy" col="3"></date-picker>

        </template>
    </index-page>
</template>

<script>

const model = "survey";

const tableColumns = [
    { field: "title", title: "Survey Title" },
    { field: "survey_number", title: "Survey Number" },
    { field: "survey_date", title: "Survey Date" },
    { field: "project_id", title: "Project", subfield: "project.project_name" },
    { field: "indicator_id", title: "Indicator", subfield: "indicator.title" },
    { field: "activity_id", title: "Activity", subfield: "activity.title" },
];

const json_fields = {
    "Project": "project.project_name",
    "Indicator": "indicator.title",
    "Activity": "activity.title",
    "Survey Date": "survey_date",
    "Survey Number": "survey_number",
    "Title": "title",
};

export default {

    data() {
        return {
            model: model,
            page_title: "",
            json_fields: json_fields,
            fields_name: { default: "Select One", survey_number: "Survey Number" },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                page: this.$route.query.page ?? 1,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                project_id: this.$route.query.project_id ?? "",
                indicator_id: this.$route.query.indicator_id ?? "",
                activity_id: this.$route.query.activity_id ?? "",
                from_date: this.$route.query.from_date ?? "",
                to_date: this.$route.query.to_date ?? "",

            },
            allProjects: [],
            allIndicators: [],
            allActivity: [],
            table: {
                columns: tableColumns,
                routes: {
                    array: [
                        {
                            title: "Survey",
                            route: "survey.surveyStart",
                            content: `<svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="24"
                                            height="24"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                            stroke="currentColor"
                                            stroke-width="2"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            class="icon icon-tabler icon-tabler-id-card"
                                        >
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <rect x="3" y="4" width="18" height="16" rx="3" />
                                            <circle cx="9" cy="10" r="2" />
                                            <line x1="15" y1="8" x2="17" y2="8" />
                                            <line x1="15" y1="12" x2="17" y2="12" />
                                            <line x1="7" y1="16" x2="17" y2="16" />
                                        </svg>`,
                            params: [
                                {
                                    name: "id",
                                    field: "id",
                                },
                            ],
                        },
                    ]
                },
                datas: [],
                meta: [],
                links: []
            }
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
            axios.get("/get-projects", { params: { status: "active" } }).then((res) => (this.allProjects = res.data));
        },
        getIndicatorsByProject(id) {
            this.search_data.indicator_id = null;
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
            this.search_data.activity_id = null;
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
        this.getRouteName(this.model);
        this.page_title = `${this.headline(this.model)} List`;
        this.search();
        this.getProjects();
    },

    validators: {
        "search_data.from_date": function (value = null) {
            return Validator.value(value);
        },
        "search_data.to_date": function (value = null) {
            const that = this;
            return Validator.value(value).custom(function () {
                if (!Validator.isEmpty(value) && that.search_data.to_date) {
                    const end = new Date(value);
                    const start = new Date(that.search_data.from_date);

                    if (start > end) {
                        return "To date must after from date";
                    }
                }
            });
        },
    },
};
</script>
