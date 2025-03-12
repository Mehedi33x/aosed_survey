<template>
    <create-form @onSubmit="submit">
        <div class="col-lg-12">
            <Fieldset>
                <template #name>Project Information</template>
                <template #content>
                    <div class="col-md-6">
                        <Input v-model="data.project_name" field="data.project_name" title="Project Name" :req="true"
                            col="12" @input="checkProjectExist" />
                        <small v-if="projectNameExistError" class="text-danger">{{ projectNameExistError }}</small>
                    </div>
                    <div class="col-md-3">
                        <date-picker id="date1" v-model="data.start_date" field="data.start_date" title="Start Date"
                            placeholder="Start Date" col="12" :req="false"></date-picker>
                    </div>
                    <div class="col-md-3">
                        <date-picker id="date2" v-model="data.end_date" field="data.end_date" title="End Date"
                            placeholder="End Date" col="12" :req="false"></date-picker>
                    </div>
                    <Textarea v-model="data.objective" field="data.objective" title="Objective" col="12" />
                    <Select title="State" v-model="data.state_id" field="data.state_id" label="name"
                        :reduce="(obj) => obj.id" :options="allStates" placeholder="--Select One--"
                        :closeOnSelect="true" :required="false" col="3"
                        @update:modelValue="getDistrictByState(data.state_id)" />
                    <Select title="District" v-model="data.district_id" field="data.district_id" label="name"
                        :reduce="(obj) => obj.id" :options="allDistricts" placeholder="--Select One--"
                        :closeOnSelect="true" :required="false" col="3"
                        @update:modelValue="getUpazillaByDistrict(data.district_id)" />
                    <Select title="Upazila" v-model="data.upazila_id" field="data.upazila_id" label="name"
                        :reduce="(obj) => obj.id" :options="allUpazillas" placeholder="--Select One--"
                        :closeOnSelect="true" :required="false" col="3" />

                    <Switch v-model="data.status" field="data.status" title="Status" on-label="Active"
                        off-label="Deactive" :req="true" col="3"></Switch>
                </template>
            </Fieldset>
        </div>

        <div v-for="(indicator, indicatorIndex) in data.indicators" :key="`indicator_${indicatorIndex}`"
            class="col-lg-12">
            <div class="row g-3">
                <div class="col-md-10 col-lg-11">
                    <Fieldset>
                        <template #name>Project Indicator Information</template>
                        <template #content>
                            <div class="col-md-6">
                                <Input v-model="indicator.title" field="indicators[indicatorIndex].title" title="Title"
                                    :req="true" col="12" @input="titleRequre(indicatorIndex)" />
                                <small v-if="indicatorErrors[indicatorIndex]?.title" class="text-danger">{{
                                    indicatorErrors[indicatorIndex].title }}</small>
                            </div>

                            <div class="col-md-3">
                                <Input v-model="indicator.total_mark" field="indicators[indicatorIndex].total_mark"
                                    title="Total Mark" col="12" @input="titleRequre(indicatorIndex)" />
                                <small v-if="indicatorErrors[indicatorIndex]?.total_mark" class="text-danger">
                                    {{ indicatorErrors[indicatorIndex].total_mark }}
                                </small>
                            </div>
                            <div class="col-md-3">

                                <Input v-model="indicator.achivement_percentage"
                                    field="indicators[indicatorIndex].achivement_percentage"
                                    title="Achivement Percentage" col="12" @input="titleRequre(indicatorIndex)" />
                                <small v-if="indicatorErrors[indicatorIndex]?.achivement_percentage"
                                    class="text-danger">
                                    {{ indicatorErrors[indicatorIndex].achivement_percentage }}
                                </small>
                            </div>
                            <div class="col-md-6">
                                <Textarea v-model="indicator.description" field="indicators[indicatorIndex].description"
                                    title="Description" col="12" @input="titleRequre(indicatorIndex)" />
                            </div>

                            <Switch v-model="indicator.status" field="indicators[indicatorIndex].status" title="Status"
                                on-label="Active" off-label="Deactive" :req="true" col="3"></Switch>
                        </template>
                    </Fieldset>
                </div>

                <div class="col-md-2 col-lg-1 d-flex">
                    <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                        <button v-if="data.indicators.length > 1" @click="deleteIndicator(indicatorIndex)" type="button"
                            class="btns delete_one" data-bs-toggle="tooltip" data-bs-placement="top"
                            data-bs-title="Delete" v-x-tooltip>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-trash">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M4 7l16 0" />
                                <path d="M10 11l0 6" />
                                <path d="M14 11l0 6" />
                                <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                                <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                            </svg>
                        </button>

                        <button @click="addIndicator" type="button" class="btns add_more" data-bs-toggle="tooltip"
                            data-bs-placement="top" data-bs-title="Add" v-x-tooltip>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M12 5l0 14" />
                                <path d="M5 12l14 0" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </create-form>
</template>

<script>
const model = "project";

export default {
    data() {
        return {
            model: model,
            page_title: "",
            data: {
                status: "active",
                indicators: [
                    {
                        title: "",
                        total_mark: null,
                        achivement_percentage: null,
                        description: "",
                        status: "active",
                    },
                ],
            },

            allStates: [],
            allDistricts: [],
            allUpazillas: [],
            indicatorErrors: [],
            projectNameExistError: '',
        };
    },

    provide() {
        return {
            validate: this.validation,
        };
    },

    methods: {
        submit: function (e) {
            this.$validate().then((res) => {
                let errorCount = this.validation.countErrors();
                this.indicatorErrors.map(indicatorError => {
                    if (indicatorError.title?.length > 0) {
                        errorCount++;
                    }
                    if (indicatorError.total_mark?.length > 0) {
                        errorCount++;
                    }
                    if (indicatorError.achivement_percentage?.length > 0) {
                        errorCount++;
                    }

                });

                if (this.projectNameExistError) {
                    errorCount++;
                }

                if (errorCount > 0) {
                    console.log(this.validation.allErrors());
                    this.$toast(
                        "You need to fill " +
                        errorCount +
                        " more empty mandatory fields",
                        "warning"
                    );

                    return false;
                }

                if (res) {

                    if (this.data.id) {
                        this.update(this.model, this.data, this.data.id);
                    } else {
                        this.store(this.model, this.data);
                    }
                }
            });
        },

        addIndicator() {
            this.data.indicators.push({
                title: "",
                total_mark: "",
                achivement_percentage: "",
                description: "",
                status: "active",
            });
            this.indicatorErrors.push({});

        },

        deleteIndicator(index) {
            this.data.indicators.splice(index, 1);
        },

        titleRequre(index) {
            if (!this.indicatorErrors[index]) {
                this.indicatorErrors[index] = {};
            }
            const title = this.data.indicators[index].title;
            const total_mark = this.data.indicators[index].total_mark;
            const description = this.data.indicators[index].description;
            const achivement_percentage = this.data.indicators[index].achivement_percentage;

            if (total_mark || description || achivement_percentage) {
                if (!title) {
                    this.indicatorErrors[index].title = "Title is required";
                } else {
                    this.indicatorErrors[index].title = "";
                }
            } else {
                this.indicatorErrors[index].title = "";
            }
            if (total_mark && (!/^\d+$/.test(total_mark) || total_mark <= 0)) {
                this.indicatorErrors[index].total_mark = "Must be a positive number";
            } else {
                this.indicatorErrors[index].total_mark = "";
            }
            if (achivement_percentage && (!/^\d+(\.\d+)?$/.test(achivement_percentage) || achivement_percentage < 0 || achivement_percentage > 100)) {
                this.indicatorErrors[index].achivement_percentage = "Must be a positive number";
            } else {
                this.indicatorErrors[index].achivement_percentage = "";
            }
            // Check for uniqueness for indicator title
            const duplicateTitles = this.data.indicators.filter((indicator, i) => {
                return indicator.title === title && i !== index;
            });

            if (duplicateTitles.length > 0) {
                this.indicatorErrors[index].title = "Title must be unique";
            } else {
                this.indicatorErrors[index].title = "";
            }
        },

        checkProjectExist(event) {
            this.projectNameExistError = null;
            clearTimeout(this.debounce);

            this.debounce = setTimeout(() => {
                this.projectName = event.target.value.trim();

                axios.get("/get-projects")
                    .then((res) => {
                        const existingProjects = res.data;
                        const projectExists = existingProjects.some(project =>
                            project.project_name.toLowerCase() === this.projectName.toLowerCase()
                        );

                        if (projectExists) {
                            this.projectNameExistError = "Project already exists";
                        } else {
                            this.projectNameExistError = null;
                        }
                    })
                    .catch((error) => {
                        console.error("Error checking project name:", error);
                    });
            }, 600);
        },

        // api section
        getStates() {
            axios.get("/get-states").then((res) => (this.allStates = res.data));
        },
        getDistrictByState(id) {
            this.data.district_id = null;
            this.data.upazila_id = null;
            this.allDistricts = [];
            this.allUpazillas = [];

            if (id !== null) {
                this.getDistricts(id);
            }
        },

        getDistricts(id) {
            axios.get("/get-districts", { params: { id: id } }).then((res) => (this.allDistricts = res.data)).catch(error => console.error('Error fetching districts:', error));;
        },
        getUpazillaByDistrict(id) {
            this.data.upazila_id = null;
            this.allUpazillas = [];
            if (id !== null) {
                this.getUpazillas(id);
            }
        },
        getUpazillas(id) {
            axios.get("/get-upazillas", { params: { id: id } }).then((res) => (this.allUpazillas = res.data)).catch(error => console.error('Error fetching upazillas:', error));
        },
    },

    created() {
        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + " Edit";
            this.get_data(`${this.model}/${this.$route.params.id}`);

            this.page_title = this.headline(this.model) + " Create";
        }
        this.getStates();
    },

    validators: {
        "data.project_name": function (value = null) {
            return Validator.value(value)
                .required("Project Name is required")
                .maxLength(190);
        },
        "data.objective": function (value = null) {
            return Validator.value(value).maxLength(5000);
        },
        "data.status": function (value = null) {
            return Validator.value(value).required("Status is required");
        },
        "data.end_date": function (value = null) {
            const that = this;
            return Validator.value(value)
                .custom(function () {
                    if (!Validator.isEmpty(value) && that.data.start_date) {
                        const end = new Date(value);
                        const start = new Date(that.data.start_date);
                        if (start > end) {
                            return "End date must be later than the start date";
                        }
                    }
                });
        },
    },
};
</script>
