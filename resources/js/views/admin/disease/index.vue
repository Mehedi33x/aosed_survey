<template>
    <index-page>
        <template v-slot:search-field>
            <Select field="search_data.type" title="Select Disease Type" col="4" v-model="search_data.type" label="name"
                :reduce="(obj) => obj.value" :options="allDiseaseTypes" placeholder="--Select One--"
                :closeOnSelect="true" />
        </template>
    </index-page>
</template>

<script>

const model = "disease";

const tableColumns = [
    { field: "title", title: "Title" },
    { field: "type", title: "Type" },
    {
        field: "sorting",
        title: "Sorting",
        sorting: true,
        namespace: "Disease",
        auto: "",
        align: "center",
    },
    // { field: "remarks", title: "Remarks"},
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    "Title": "title", "Description": "description", "Remarks": "remarks",
};

export default {

    data() {
        return {
            model: model,
            page_title: "",
            json_fields: json_fields,
            fields_name: { default: "Select One", title: "Title" },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                page: this.$route.query.page ?? 1,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                status: this.$route.query.status ?? "",
                type: this.$route.query.type ?? "",
            },
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
        getDiseaseTypes() {
            axios.get('/get-disease-type').then((res) => (
                this.allDiseaseTypes = res.data));

        }
    },

    created() {
        this.getRouteName(this.model);
        this.page_title = `${this.headline(this.model)} List`;
        this.search();
        this.getDiseaseTypes();
    },

    validators: {},
};
</script>
