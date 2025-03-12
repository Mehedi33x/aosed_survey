<template>
    <index-page>
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
        </template>
        <!-- modal -->
        <div class="modal fade" id="customDeleteModal" tabindex="-1" aria-labelledby="customDeleteLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-black" id="customDeleteLabel">
                            Are you sure you want to {{ is_delete ? "return back" : "delete" }} this?
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h6 class="mb-3 text-black">Please confirm your login password</h6>
                        <div class="d-flex justify-content-center mb-3">
                            <input v-model="delete_password" type="password" placeholder="********"
                                class="form-control form-control-sm text-center border" />
                        </div>
                        <div class="d-flex justify-content-center">
                            <button @click="customDeleteConfirm(item.id)" type="button"
                                class="theme_btn rounded-2 w-100">
                                <span v-if="$root.submit">
                                    <i class="fa fa-spinner fa-spin"></i>
                                    processing...
                                </span>
                                <template v-else>
                                    <span v-if="is_delete">Return Back</span>
                                    <span v-else>Confirm</span>
                                </template>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </index-page>
</template>

<script>
const model = "surveyForm";

const tableColumns = [
    { field: "project_id", title: "Project Name", subfield: "project.project_name" },
    { field: "indicator_id", title: "Indicator Title", subfield: "indicator.title" },
    { field: "activity_id", title: "Project Activity", subfield: "activity.title" },
    { field: "title", title: "Title" },
    { field: "NumberOfQuestions", title: "Questions", subfield: "NumberOfQuestions" },
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    Title: "title",
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
                project_id: this.$route.query.project_id ?? "",
                indicator_id: this.$route.query.indicator_id ?? "",
                activity_id: this.$route.query.activity_id ?? "",
            },
            allProjects: [],
            allIndicators: [],
            allActivity: [],
            allSurveyList: [],
            table: {
                columns: tableColumns,
                routes: {
                    array: [
                        {
                            title: "View",
                            route: "surveyForm.show",
                            content: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                    class="icon icon-tabler icons-tabler-outline icon-tabler-eye">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <path d="M10 12a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" />
                                    <path d="M21 12c-2.4 4 -5.4 6 -9 6c-3.6 0 -6.6 -2 -9 -6c2.4 -4 5.4 -6 9 -6c3.6 0 6.6 2 9 6" />
                                </svg>`,
                            params: [
                                {
                                    name: "id",
                                    field: "id",
                                },
                            ],
                        },
                        {
                            title: "Edit",
                            route: "surveyForm.edit",
                            content: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                    class="icon icon-tabler icons-tabler-outline icon-tabler-pencil">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <path d="M4 20h4l10.5 -10.5a2.828 2.828 0 1 0 -4 -4l-10.5 10.5v4" />
                                    <path d="M13.5 6.5l4 4" />
                                </svg>`,
                            params: [
                                {
                                    name: "id",
                                    field: "id",
                                },
                            ],
                            showWhen($this, item) {
                                return !item?.has_survey_result;
                            },
                        },
                        {
                            title: "Delete",
                            type: "destroy",
                            route: "surveyForm.destroy",
                            content: `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="icon icon-tabler icons-tabler-outline icon-tabler-trash">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                        <path d="M4 7l16 0" />
                        <path d="M10 11l0 6" />
                        <path d="M14 11l0 6" />
                        <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                        <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                    </svg>`,
                            params: [
                                {
                                    name: "id",
                                    field: "id",
                                },
                            ],
                            showWhen($this, item) {
                                return !item?.has_survey_result;
                            },
                        },
                    ],
                },
                datas: [],
                meta: [],
                links: [],
            },
            deleted_item: null,
            deleted_id: null,
            is_delete: false,
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
        // for delete
        openDeleteModal(item, is_delete) {
            console.log(1);
            this.deleted_item = item;
            this.deleted_id = item.id;
            this.is_delete = is_delete;
            $("#customDeleteModal").modal("show");
        },

        customDeleteConfirm() {
            this.$root.tableSpinner = true;
            const url = `/surveyForm/${this.delete_item.id}`;
            axios
                .delete(url)
                .then((res) => {
                    this.scrollTop(0, 0);
                    if (search_data) {
                        this.get_paginate(model_name, search_data);
                    }

                    if (res.status == 201) {
                        this.$toast(res.data.message, "success");
                        return true;
                    } else if (res.status == 202) {
                        this.$toast(res.data.message, "error");
                    }
                })
                .catch((error) => console.log(error))
                .then((alw) =>
                    setTimeout(() => (this.$root.tableSpinner = false), 200)
                );

        },
        // API section
        getProjects() {
            axios
                .get("/get-projects", { params: { status: "active" } })
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
                .get("/get-all-indicators", { params: { id: id, status: "active" } })
                .then((res) => (this.allIndicators = res.data))
                .catch((error) => console.error("Error fetching indicators:", error));
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
                .get("/get-activities", { params: { id: id, status: "active" } })
                .then((res) => (this.allActivity = res.data))
                .catch((error) => console.error("Error fetching activities:", error));
        },
        getSurveyList() {
            axios
                .get("/get-all-Survey", { params: { status: "all" } })
                .then((res) => (this.allSurveyList = res.data));
        },
    },
    created() {
        this.page_title = `${this.headline(this.model)} List`;
        this.search();
        this.getProjects();
    },
    validators: {},
};
</script>
