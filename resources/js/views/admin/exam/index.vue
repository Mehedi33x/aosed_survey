<template>
    <index-page>
        <template v-slot:search-field>
            <Select field="search_data.level" :req="true" title="Select Level" col="4" v-model="search_data.level" label="name"
            :reduce="(obj) => obj.value" :options="allLevels" placeholder="--Select One--" :closeOnSelect="true" />
        </template>
    </index-page>
</template>

<script>

const model = "exam";

const tableColumns = [
    { field: "title", title: "Title" },
    { field: "level", title: "Level" },
    {
        field: "sorting",
        title: "Sorting",
        sorting: true,
        namespace: "Exam",
        auto: "",
        align: "center",
    },
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    "Title": "title",
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
                level: this.$route.query.level ?? "",
            },

            table: {
                columns: tableColumns,
                routes: {},
                datas: [],
                meta: [],
                links: []
            },
            allLevels: [
                { value: 'certified', name: 'Certified' },
                { value: 'noncertified', name: 'Non-certified' }
            ],
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
    },

    created() {
        this.getRouteName(this.model);
        this.page_title = `${this.headline(this.model)} List`;
        this.search();
    },

    validators: {},
};
</script>
