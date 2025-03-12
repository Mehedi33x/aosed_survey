<template>
    <index-page>
        <template v-slot:search-field>
            <Select title="Project Name" v-model="search_data.project_id" field="search_data.project_id"
                label="project_name" :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--"
                :closeOnSelect="true" :required="false" col="6" :req="true"
                @update:modelValue="getIndicatorsByProject(search_data.project_id)" />
            <Select title="Indicator" v-model="search_data.indicator_id" field="search_data.indicator_id" label="title"
                :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="6" />
        </template>
    </index-page>
</template>

<script>

const model = "projectAchievementSetup";

const tableColumns = [
    { field: "project_id", title: "Project", subfield: "project.project_name" },
    { field: "indicator_id", title: "Indicator", subfield: "indicator.title" },
    { field: "total_mark", title: "Total Indicator Point", subfield: "indicator.total_mark" },
    { field: "achivement_percentage", title: "Achievement Percentage", subfield: "indicator.achivement_percentage" },
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    "Project": "project.project_name",
    "Indicator":"indicator.title",
    "Total Indicator Point":"indicator.total_mark",
    "Achievement Percentage":"indicator.achivement_percentage",
    "Status":"status",
};

export default {

    data() {
        return {
            model: model,
            page_title: "",
            json_fields: json_fields,
            fields_name: { default: "Select One"},
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                page: this.$route.query.page ?? 1,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                status: this.$route.query.status ?? "",
                project_id: this.$route.query.project_id ?? "",
                indicator_id: this.$route.query.indicator_id ?? "",
            },
            allProjects: [],
            allIndicators: [],
            table: {
                columns: tableColumns,
                routes: {},
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
            axios.get("/get-projects").then((res) => (this.allProjects = res.data));
        },
        getIndicatorsByProject(id) {
            this.search_data.indicator_id = null;
            this.allIndicators = [];
            if (id !== null) {
                this.getIndicators(id);
            }
        },
        getIndicators(id) {
            axios.get("/get-all-indicators", { params: { id: id } })
                .then((res) => (this.allIndicators = res.data))
                .catch(error => console.error('Error fetching indicators:', error));
        },
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
