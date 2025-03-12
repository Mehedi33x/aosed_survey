<template>
    <index-page>
        <template v-slot:search-field>
            <Select title="Select Project" v-model="search_data.project_id" field="search_data.project_id" label="project_name"
                :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" @update:modelValue="getIndicatorsByProject(search_data.project_id)" />

            <Select title="Select Indicator" v-model="search_data.indicator_id" field="search_data.indicator_id" label="title"
                :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" />
        </template>
    </index-page>
</template>

<script>

const model = 'projectActivity';

const tableColumns = [
    { field: "title", title: "Title" },
    { field: "project_id", title: "Project Title", subfield: "project.project_name" },
    { field: "indicator_id", title: "Indicator Title", subfield: "indicator.title" },
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    "Title": "title",
    "Project Title": "project.project_name",
    "Indicator Title": "indicator.title",
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
                project_id: this.$route.query.project_id?? "",
                indicator_id: this.$route.query.indicator_id?? "",
            },
            table: {
                columns: tableColumns,
                routes: {},
                datas: [],
                meta: [],
                links: []
            },
            allProjects: [],
            allIndicators: [],
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

        getActiveProjects() {
            axios.get('/get-projects').then(response => {
                this.allProjects = response.data;
            }).catch((error) => {
                console.error('Error fetching active projects:', error);
            });
        },

        getIndicatorsByProject(id) {
            this.search_data.indicators = [];
            this.search_data.indicator_id = null;
            if (id !== null) {
                axios.get('/get-all-indicators', { params: { id: id } })
                    .then((res) => {
                        this.allIndicators = res.data;
                    })
                    .catch((error) => {
                        console.error('Error fetching indicators:', error);
                    });
            }
        }
    },

    created() {
        this.getRouteName(this.model);
        this.page_title = `${this.headline(this.model)} List`;
        this.search();
        this.getActiveProjects();
    },

    validators: {},
};
</script>
