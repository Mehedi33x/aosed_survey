<template>
    <index-page :show_status="false">
        <template v-slot:search-field>
        </template>
    </index-page>
</template>

<script>
const model = "beneficiaryAssign";

const tableColumns = [
    { field: "project_id", title: "Project Name", subfield: "project.project_name" },
    { field: "activity_id", title: "Activity Name", subfield: "activity.title" },
    { field: "beneficiary_count", title: "Total Beneficiaries", },
];

const json_fields = {
    "Project": "project.project_name",
    "Activity": "activity.title",
    "Total Beneficiaries": "beneficiary_count",
};

export default {
    data() {
        return {
            model: model,
            page_title: "Beneficiary Assign List",
            json_fields: json_fields,
            fields_name: { default: "Select One", },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                page: this.$route.query.page ?? 1,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                // status: this.$route.query.status ?? "",
            },
            allProjects: [],
            allIndicators: [],
            allActivity: [],

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
        resetSearchData() {
            this.search_data.pagination = 10;
            this.search_data.page = 1;
            this.search_data.field_name = "";
            this.search_data.value = "";
            this.search_data.status = "";
        },

        search() {
            this.$router.push({
                name: this.model + ".index",
                query: { ...this.search_data },
            });
            this.get_paginate(this.model, this.search_data);
        },
    },
    created() {
        this.getRouteName(this.model);
        // this.setBreadcrumbs(this.model, "index");
        this.search();
    },
    validators: {
        /* "search_data.status": function (value = null) {
            return Validator.value(value);
        }, */
    },
};
</script>
