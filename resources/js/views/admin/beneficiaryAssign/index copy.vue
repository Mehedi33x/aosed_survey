<template>
    <index-page :show_status="false">
        <template v-slot:search-field>
            <Select title="Select Project" v-model="search_data.project_id" field="search_data.project_id"
                label="project_name" :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--"
                :closeOnSelect="true" :required="false" col="6"
                @update:modelValue="getActivityByProject(search_data.project_id)" />

            <Select title="Select Project Activity" v-model="search_data.activity_id" field="search_data.activity_id"
                label="title" :reduce="(obj) => obj.id" :options="allActivity" placeholder="--Select One--"
                :closeOnSelect="true" :required="false" col="6" />

            <!-- <Select title="Group" v-model="search_data.group_id" field="search_data.group_id" label="title"
                :reduce="(obj) => obj.id" :options="allGroups" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="6" /> -->
        </template>
    </index-page>
</template>

<script>

const model = "beneficiaryAssign";

const tableColumns = [
    { field: "project_id", title: "Project Name", subfield: "project.project_name" },
    { field: "activity_id", title: "Activity Name", subfield: "activity.title" },
    // { field: "group_id", title: "Group Name", subfield: "group.title" },
    { field: "beneficiary_count", title: "Total Beneficiaries", },
];

const json_fields = {
    "Project": "project.project_name",
    "Activity": "activity.title",
    "Group": "group.title",
    "Total Beneficiaries": "beneficiary_count",
};

export default {

    data() {
        return {
            model: model,
            page_title: "",
            json_fields: json_fields,
            fields_name: { default: "Select One", },
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
            table: {
                columns: tableColumns,
                routes: {
                    /* array: [
                        {
                            title: "View",
                            route: "beneficiaryAssign.show",
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
                                        class="icon icon-tabler icons-tabler-outline icon-tabler-eye"
                                    >
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path d="M10 12a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" />
                                        <path
                                            d="M21 12c-2.4 4 -5.4 6 -9 6c-3.6 0 -6.6 -2 -9 -6c2.4 -4 5.4 -6 9 -6c3.6 0 6.6 2 9 6"
                                        />
                                    </svg>`,
                            params: [
                                {
                                    name: "id",
                                    field: "activity_id",
                                },
                                {
                                    name: "group_id",
                                    field: "group_id",
                                },
                            ],
                        },
                        {
                            title: "Edit",
                            route: "beneficiaryAssign.edit",
                            content: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round"
                                class="icon icon-tabler icons-tabler-outline icon-tabler-pencil">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M4 20h4l10.5 -10.5a2.828 2.828 0 1 0 -4 -4l-10.5 10.5v4" />
                                <path d="M13.5 6.5l4 4" />
                            </svg>`,
                            params: [
                                {
                                    name: "id",
                                    field: "activity_id",
                                },
                                {
                                    name: "group_id",
                                    field: "group_id",
                                },
                            ],
                        },
                    ], */
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
            customDestroyData: this.deleteData,
        };
    },

    methods: {
        /* deleteData(item) {
            this.$root.tableSpinner = true;
            axios
                .delete(`${this.model}/${item.id}/${item.group_id}`)
                .then((res) => {
                    this.scrollTop(0, 0);
                    this.search();

                    if (res.status == 201) {
                        this.$toast(res.data.message, "success");
                        return true;
                    } else if (res.status == 202) {
                        this.$toast(res.data.message, "error");
                    }
                })
                .catch((error) => {
                    this.$toast(error.response?.data?.message ?? "Something went wrong to delete!", "error");
                })
                .finally(() =>
                    setTimeout(() => (this.$root.tableSpinner = false), 200)
                );
        }, */

        search() {
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

        getActivityByProject(id) {
            this.search_data.activity_id = null;
            this.allActivity = [];
            if (id !== null) {
                this.getActivity(id);
            }
        },

        getActivity(id) {
            axios.get("/get-projects-activities", { params: { project_id: id, status: "active" } })
                .then((res) => (this.allActivity = res.data))
                .catch(error => console.error('Error fetching activities:', error));
        },
        /* getGroups() {
            axios.get("/get-all-groups").then((res) => (this.allGroups = res.data));
        }, */

    },

    created() {
        this.getRouteName(this.model);
        this.page_title = `${this.headline(this.model)} List`;
        this.search();
        this.getProjects();
        // this.getGroups();
    },

    validators: {},
};
</script>
