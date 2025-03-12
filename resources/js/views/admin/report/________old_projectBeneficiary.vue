<template v-slot:search-field>

    <create-form @onSubmit='submit'>
        <Select title="Select Project" v-model="data.project_id" field="data.project_id" label=""
            :reduce="(obj) => obj.id" placeholder="--Select One--" :closeOnSelect="true" :required="true" col="3" />

        <Switch v-model='data.status' field='data.status' title='Status' on-label='Active' off-label='Deactive'
            :req='true' col="3"></Switch>
    </create-form>
</template>

<script>
const tableColumns = [
];

const json_fields = {
};

export default {
    data() {
        return {
            page_title: "Project Beneficiary Report",
            json_fields: json_fields,
            fields_name: {
                default: "Select One",
            },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                status: this.$route.query.status ?? "",
            },
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
            fields_name: this.fields_name,
            search_data: this.search_data,
            table: this.table,
            json_fields: this.json_fields,
            validate: this.validation,
            search: this.search,
            resetSearchData: this.resetSearchData,
            customDataUrl: "report/projectBeneficiary",
            customRouteName: "report.projectBeneficiary",
        };
    },
    methods: {
        search: function () {
            this.$router.push({
                name: "report.projectBeneficiary",
                query: { ...this.search_data },
            });

            this.get_paginate("/report/projectBeneficiary", this.search_data);
        },

        resetSearchData() {
            this.search_data.pagination = 10;
            this.search_data.role_id = '';
            this.search_data.field_name = "";
            this.search_data.value = "";
            this.search_data.status = "";
        },
    },

    created() {
        this.search();
    },

    validators: {},
};
</script>
how this page correction for vue
