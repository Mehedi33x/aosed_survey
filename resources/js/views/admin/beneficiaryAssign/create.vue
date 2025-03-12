<template>
    <create-form @onSubmit="submit">
        <Fieldset class="mb-3">
            <template #name>Primary Information</template>
            <template #content>
                <div class="row mt-4">
                    <div class="col-6">
                        <Select title="Project" v-model="data.project_id" field="data.project_id" label="project_name"
                            :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--"
                            :closeOnSelect="true" :required="true" col="12" :req="true"
                            @update:modelValue="getActivitiesByProject(data.project_id)" />
                        <Select title="Group" v-model="data.group_id" field="data.group_id" label="title"
                            :reduce="(obj) => obj.id" :options="allGroups" placeholder="--Select One--"
                            :closeOnSelect="true" :required="false" col="12" />
                    </div>
                    <div class="col-6">
                        <Select v-if="this.$route.params.id" title="Select Project Activity" v-model="data.activity_id"
                            field="data.activity_id" label="title" :reduce="(obj) => obj.id" :options="allActivity"
                            placeholder="--Select One--" :closeOnSelect="true" :required="false" col="12" />
                        <MultipleSelectContainer v-if="!this.$route.params.id" field="data.activity_id" :req="true"
                            title="Activity" col="12">
                            <MultipleSelect style="color: brown" v-model="data.activity_id" :options="allActivity"
                                :settings="{
                                    settingOption: id,
                                    settingOption: title,
                                    multiple: true,
                                }" @change="" @select="" />
                        </MultipleSelectContainer>
                    </div>
                </div>
            </template>
        </Fieldset>
        <div class="col-lg-12">
            <Fieldset>
                <template #name>Beneficiary Search</template>
                <template #content>
                    <Select title="State" v-model="data.state_id" field="data.state_id" label="name"
                        :reduce="(obj) => obj.id" :options="allStates" placeholder="--Select One--"
                        :closeOnSelect="true" :required="false" col="4"
                        @update:modelValue="getDistrictByState(data.state_id)" />
                    <Select title="District" v-model="data.district_id" field="data.district_id" label="name"
                        :reduce="(obj) => obj.id" :options="allDistricts" placeholder="--Select One--"
                        :closeOnSelect="true" :required="false" col="4"
                        @update:modelValue="getUpazillaByDistrict(data.district_id)" />
                    <Select title="Upazila" v-model="data.upazila_id" field="data.upazila_id" label="name"
                        :reduce="(obj) => obj.id" :options="allUpazillas" placeholder="--Select One--"
                        :closeOnSelect="true" :required="false" col="4" />
                    <Select title="Age" v-model="data.age" field="data.age" label="name" :reduce="(obj) => obj.value"
                        :options="global.ages" placeholder="--Select One--" :closeOnSelect="true" :required="false"
                        col="4" />
                    <Select title="Occupation" v-model="data.occupation_id" field="data.occupation_id" label="title"
                        :reduce="(obj) => obj.id" :options="allOccupations" placeholder="--Select One--"
                        :closeOnSelect="true" :required="false" col="4" />
                    <Select title="Education" v-model="data.exam_id" field="data.exam_id" label="title"
                        :reduce="(obj) => obj.id" :options="allEducations" placeholder="--Select One--"
                        :closeOnSelect="true" :required="false" col="4" />
                    <Radio title="Select Gender" v-model="data.gender" field="data.gender" :list="global.gender" col="4"
                        :showResetButton="true" />
                    <Radio title="Select Marital Status" v-model="data.marital_status" field="data.marital_status"
                        :list="global.maritalStatus" :req="true" col="8 col-12 col-lg-6" :showResetButton="true" />
                    <button type="button" class="col-4 col-md-2 col-xl-1 btn btn-success" @click="searchBeneficiaries({
                        project_id: data.project_id,
                        indicator_id: data.indicator_id,
                        activity_id: data.activity_id
                    })">
                        Search
                    </button>
                </template>
            </Fieldset>
        </div>
        <div class="col-lg-6">
            <Fieldset>
                <template #name>Beneficiary List</template>
                <template #content>
                    <p></p>
                    <div class="base_table_list mt-1">
                        <div class="table-responsive text-nowrap table-basic table_wrapper">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="sl" v-if="beneficiaryList.datas?.length > 0">
                                            <input type="checkbox" v-model="selectAllBeneficiaries"
                                                @change="toggleAllBeneficiaries" />
                                            <span class="heading mx-2"> All</span>
                                        </th>

                                        <th>
                                            <div class="heading">Image</div>
                                        </th>
                                        <th>
                                            <div class="heading">Beneficiary Name</div>
                                        </th>
                                        <th>
                                            <div class="heading">Age</div>
                                        </th>
                                        <th>
                                            <div class="heading">Gender</div>
                                        </th>
                                        <th>
                                            <div class="heading">Occupation</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody v-if="isLoading">
                                    <tr>
                                        <td colspan="8" style="text-align: center; background: #fff">
                                            <div class="p-2 text-center">
                                                <span class="spinner-border text-primary" role="status"
                                                    aria-hidden="true"></span>
                                                <span class="ms-2">Loading...</span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody v-else-if="beneficiaryList.datas?.length > 0">
                                    <tr v-for="(beneficiary, index) in beneficiaryList.datas" :key="index">
                                        <td>
                                            <input type="checkbox" class="me-2" style="width: 15px" :value="beneficiary"
                                                :checked="data.assignedBeneficiaries.some(
                                                    (b) => b?.beneficiary_id === beneficiary?.id
                                                )
                                                    " @change="toggleBeneficiarySelection(beneficiary)" />
                                        </td>
                                        <td>
                                            <img :src="beneficiary?.thumb_one
                                                ? beneficiary.thumb_one
                                                : emptyImage50()
                                                " alt="Beneficiary Image" class="beneficiary-image"
                                                style="height: 30px; width: 30px" />
                                        </td>
                                        <td class="text-capitalize">
                                            {{ beneficiary?.full_name ?? "N/A" }}
                                        </td>
                                        <td class="text-capitalize">
                                            {{ calculateAge(beneficiary?.date_of_birth) ?? "N/A" }}
                                        </td>


                                        <td class="text-capitalize">
                                            {{ beneficiary?.gender ?? "N/A" }}
                                        </td>
                                        <td class="text-capitalize">
                                            {{ beneficiary?.primary_occupation_name ?? "N/A" }}
                                        </td>
                                        <!-- <td v-for="(
                          occupation, occIndex
                        ) in beneficiary.beneficiary_occupations" :key="occupation.id">
                                            <p>
                                                {{ occupation.occupations?.title ?? "N/A" }}
                                            </p>
                                        </td> -->
                                    </tr>
                                </tbody>
                                <tbody v-else>
                                    <tr>
                                        <td colspan="8" style="text-align: center; background: #fff">
                                            <p class="p-2 text-center text-red no-data">
                                                There are no beneficiaries found for this project location
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <Pagination />
                </template>
            </Fieldset>
        </div>
        <div class="col-lg-6">
            <Fieldset>
                <template #name>Assign List</template>
                <template #content>
                    <div class="header_base_search d-none d-md-flex gap-3 align-items-center">
                        <div class="search_box position-relative">
                            <input type="text" placeholder="Search..." class="search_input" v-model="searchQuery"
                                @keydown.enter.prevent="searchBeneficiary({
                                    query: searchQuery,

                                })" />
                            <button type="button"
                                class="search_btn position-absolute top-50 translate-middle-y bg-transparent border-0"
                                @click="searchBeneficiary({
                                    query: searchQuery,

                                })">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round"
                                    stroke-linejoin="round" class="icon icon-tabler icon-tabler-search">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                    <path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
                                    <path d="M21 21l-6 -6" />
                                </svg>
                            </button>
                        </div>

                    </div>
                    <div class="base_table_list">
                        <div class="table-responsive text-nowrap table-basic table_wrapper">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="sl" style="min-width: 70px">
                                            <span class="heading">SL</span>
                                        </th>
                                        <th>
                                            <div class="heading">Image</div>
                                        </th>
                                        <th>
                                            <div class="heading">Beneficiary Name</div>
                                        </th>
                                        <th>
                                            <div class="heading">Action</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody v-if="data.assignedBeneficiaries.length > 0">
                                    <tr v-for="(assignedBeneficiary, index) in data.assignedBeneficiaries" :key="index">
                                        <td>{{ index + 1 }}</td>
                                        <td>
                                            <img :src="assignedBeneficiary?.thumb_one
                                                ? assignedBeneficiary.thumb_one
                                                : (assignedBeneficiary?.beneficiary?.thumb_one || emptyImage50())"
                                                alt="Beneficiary Image" class="beneficiary-image"
                                                style="height: 30px; width: 30px" />
                                        </td>
                                        <td class="text-capitalize">
                                            {{
                                                assignedBeneficiary?.full_name ??
                                                assignedBeneficiary?.beneficiary?.full_name
                                            }}
                                        </td>
                                        <td>
                                            <a href="#" @click.prevent="removeAssignedBeneficiary(assignedBeneficiary)"
                                                data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Delete"
                                                v-x-tooltip>
                                                <i class="fa fa-trash-o fa-fw"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody v-else>
                                    <tr>
                                        <td colspan="8" style="text-align: center; background: #fff">
                                            <p class="p-2 text-center text-red no-data">No data found.</p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </template>
            </Fieldset>
        </div>
    </create-form>
</template>
<script>
const model = "beneficiaryAssign";
import Swal from "sweetalert2";
export default {
    data() {
        return {
            model: model,
            page_title: "",
            data: {
                assignedBeneficiaries: [],
            },
            selectAllBeneficiaries: false,
            isLoading: false,
            allProjects: [],
            allIndicators: [],
            allActivity: [],
            allStates: [],
            allDistricts: [],
            allUpazillas: [],
            allOccupations: [],
            allEducations: [],
            allGroups: [],
            beneficiaryList: {},
            searchQuery: "",
            debounceTimeout: null,

            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                page: this.$route.query.page ?? 1,
            },
            table: {
                columns: this.beneficiaryList,
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
            table: this.beneficiaryList,
            customRouteName: "beneficiaryAssign.create",
            customDataUrl: "search-beneficiaries",
            search_data: this.search_data,
            model: this.model,

        };
    },
    watch: {
        "data.activity_id"(newActivityId) {
            if (newActivityId) {
                this.searchBeneficiaries({
                    project_id: this.data.project_id,
                    indicator_id: this.data.indicator_id,
                    activity_id: newActivityId,
                });
            }
        },

    },

    methods: {
        searchBeneficiaries({ project_id, indicator_id, activity_id }) {

            this.isLoading = true;
            const filters = [
                this.data.project_id,
                this.data.indicator_id,
                this.data.activity_id,
                // this.data.group_id,
                this.data.state_id,
                this.data.district_id,
                this.data.upazila_id,
                this.data.age,
                this.data.occupation_id,
                this.data.exam_id,
                this.data.gender,
                this.data.marital_status,
            ];
            const payload = {
                project_id: this.data.project_id,
                indicator_id: this.data.indicator_id,
                activity_id: this.data.activity_id,
                // group_id: this.data.group_id,
                state_id: this.data.state_id,
                district_id: this.data.district_id,
                upazila_id: this.data.upazila_id,
                age: this.data.age,
                occupation_id: this.data.occupation_id,
                exam_id: this.data.exam_id,
                gender: this.data.gender,
                marital_status: this.data.marital_status,
            };
            axios
                .post("/search-beneficiaries", { data: payload })
                .then((response) => {
                    const data = response.data.data;
                    if (data && data.length > 0) {
                        this.beneficiaryList.datas = data;
                        this.beneficiaryList.meta = response.data.meta;
                        this.beneficiaryList.links = response.data.links;
                        // this.$toast("Beneficiaries found successfully!", "success");
                    } else {
                        this.$toast("No beneficiaries found for the selected criteria.", "error");
                    }
                })
                .catch((error) => {
                    console.error("Error searching beneficiaries:", error);
                    this.$toast("An error occurred while searching beneficiaries. Please try again.", "error");
                })
                .finally(() => {
                    this.isLoading = false;
                });
        },
        submit: function (e) {
            this.$validate().then((res) => {
                const error = this.validation.countErrors();

                if (this.data.assignedBeneficiaries.length === 0) {
                    this.$toast("You need to select at least one beneficiary.", "warning");
                    return false;
                }
                if (error > 0) {
                    console.log(this.validation.allErrors());
                    this.$toast(
                        "You need to fill " + error + " more empty mandatory fields",
                        "warning"
                    );
                    return false;
                }
                if (res) {
                    if (this.data.id) {
                        this.update(this.model, this.data, this.data.activity_id);
                    } else {
                        this.store(this.model, this.data);
                    }
                }
            });
        },

        async searchBeneficiary({ query }) {
            /* if (!project_id || !indicator_id || !activity_id) {
                this.$toast("Please select Project, Indicator, Activity and Group to search beneficiaries", "warning");
                return;
            } */
            if (!query) {
                this.$toast("Please enter a search query.", "warning");
                return;
            }
            try {
                const params = {
                    search_data: query,
                    // project_id: project_id,
                    // indicator_id: indicator_id,
                    // activity_id: activity_id,
                };
                const response = await axios.get(`get-all-beneficiaries`, { params });
                response.data.data.forEach(beneficiary => {
                    this.toggleBeneficiarySelection(beneficiary);
                });
                this.searchQuery = "";
            } catch (error) {
                this.assignedBeneficiaries = [];
                console.error("Error fetching data:", error);
                if (error.response && error.response.data && error.response.data.message) {
                    this.$toast(error.response.data.message, "error");
                }/*  else {
                    this.$toast("Failed to fetch beneficiaries.", "error");
                } */
            }
        },

        toggleAllBeneficiaries() {
            if (this.selectAllBeneficiaries) {
                this.data.assignedBeneficiaries = this.beneficiaryList.datas.map((beneficiary) => ({
                    beneficiary_id: beneficiary.id,
                    full_name: beneficiary.full_name,
                    thumb_one: beneficiary.thumb_one,
                }));
            } else {
                this.data.assignedBeneficiaries = [];
            }
        },
        toggleBeneficiarySelection(beneficiary) {
            const index = this.data.assignedBeneficiaries.findIndex(
                (b) => b?.beneficiary_id === beneficiary.id
            );
            if (index === -1) {
                this.data.assignedBeneficiaries.push({
                    beneficiary_id: beneficiary.id,
                    full_name: beneficiary.full_name,
                    thumb_one: beneficiary.thumb_one,
                });
                console.log('benefic', this.data.assignedBeneficiaries);

            } else {
                this.data.assignedBeneficiaries.splice(index, 1);
            }
            this.selectAllBeneficiaries =
                this.data.assignedBeneficiaries.length === this.beneficiaryList.datas.length;
        },

        async removeAssignedBeneficiary(beneficiary) {
            const index = this.data.assignedBeneficiaries.findIndex(
                (b) => b.beneficiary_id === beneficiary.beneficiary_id
            );
            const hasActivity = this.data.assignedBeneficiaries.some(
                (b) =>
                    b.beneficiary_id === beneficiary.beneficiary_id &&
                    b.activity_id === this.data.activity_id &&
                    b.project_id === this.data.project_id &&
                    b.indicator_id === this.data.indicator_id
            );
            if (this.$route.params.id) {
                if (hasActivity) {
                    if (index !== -1) {
                        const assignedBeneficiary = this.data.assignedBeneficiaries[index];
                        try {
                            const result = await Swal.fire({
                                title: "Are you sure?",
                                text: "Do you want to delete this beneficiary from the assign list?",
                                icon: "warning",
                                showCancelButton: true,
                                confirmButtonColor: "#3085D6",
                                cancelButtonColor: "#d33",
                                confirmButtonText: "Yes, delete it!",
                            });
                            if (result.isConfirmed) {
                                await axios.get(`/beneficiary-delete`, {
                                    params: { id: assignedBeneficiary.id },
                                });
                                // await axios.post(`/beneficiaryAssign/${beneficiary.beneficiary_id}/beneficiaryDelete`);
                                this.data.assignedBeneficiaries.splice(index, 1);
                                const checkboxRef = this.$refs[`checkbox_${beneficiary.beneficiary_id}`];
                                if (checkboxRef) {
                                    checkboxRef.checked = false;
                                }
                                Swal.fire(
                                    "Deleted!",
                                    "The beneficiary has been deleted successfully.",
                                    "success"
                                );
                            }
                        } catch (error) {
                            console.error("Error deleting beneficiary:", error);
                            Swal.fire(
                                "Error!",
                                "There was an issue deleting the beneficiary.",
                                "error"
                            );
                        }
                    }
                } else {
                    if (index !== -1) {
                        this.data.assignedBeneficiaries.splice(index, 1);
                        const checkboxRef = this.$refs[`checkbox_${beneficiary.beneficiary_id}`];
                        if (checkboxRef) {
                            checkboxRef.checked = false;
                        }
                    }
                }
            } else {
                if (index !== -1) {
                    this.data.assignedBeneficiaries.splice(index, 1);
                    const checkboxRef = this.$refs[`checkbox_${beneficiary.beneficiary_id}`];
                    if (checkboxRef) {
                        checkboxRef.checked = false;
                    }
                }
            }
        },
        calculateAge(dateOfBirth) {
            const birthDate = new Date(dateOfBirth);
            const today = new Date();
            const age = today.getFullYear() - birthDate.getFullYear();
            const monthDifference = today.getMonth() - birthDate.getMonth();
            if (
                monthDifference < 0 ||
                (monthDifference === 0 && today.getDate() < birthDate.getDate())
            ) {
                return age - 1;
            }
            return age;
        },
        // API section
        getProjects() {
            axios
                .get("/get-projects", { params: { status: "active" } })
                .then((res) => (this.allProjects = res.data));
        },
        getActivitiesByProject(id) {
            this.data.activity_id = null;
            this.allActivity = [];
            if (id !== null) {
                this.getActivity(id);
            }
        },
        /* getActivity(id) {
            axios
                .get("/get-projects-activities", {
                    params: { project_id: id, status: "active" },
                })
                .then((res) => (this.allActivity = res.data))
                .catch((error) => console.error("Error fetching activities:", error));
        }, */
        getActivity(id) {
            if (this.$route.params.id) {
                axios
                    .get("/get-projects-activities", {
                        params: { project_id: id, status: "active" },
                    })
                    .then((res) => (this.allActivity = res.data))
                    .catch((error) => console.error("Error fetching activities:", error));
            } else {
                axios
                    .get("/get-projects-activities", {
                        params: { project_id: id, status: "active" },
                    })
                    .then((res) => {
                        var activities = res.data.map((e) => {
                            return {
                                text: e.title,
                                id: e.id,
                            };
                        });
                        this.allActivity = JSON.parse(JSON.stringify(activities));
                    })
                    .catch((error) => console.error("Error fetching activities:", error));
            }

        },
        getStates() {
            axios
                .get("/get-states", { params: { status: "active" } })
                .then((res) => (this.allStates = res.data));
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
            axios
                .get("/get-districts", { params: { id: id, status: "active" } })
                .then((res) => (this.allDistricts = res.data))
                .catch((error) => console.error("Error fetching districts:", error));
        },
        getUpazillaByDistrict(id) {
            this.data.upazila_id = null;
            this.allUpazillas = [];
            if (id !== null) {
                this.getUpazillas(id);
            }
        },
        getUpazillas(id) {
            axios
                .get("/get-upazillas", { params: { id: id, status: "active" } })
                .then((res) => (this.allUpazillas = res.data))
                .catch((error) => console.error("Error fetching upazillas:", error));
        },
        getOccupations() {
            axios.get("/get-occupations").then((res) => (this.allOccupations = res.data));
        },
        getEducations() {
            axios.get("/get-exams").then((res) => (this.allEducations = res.data));
        },
        getGroups() {
            axios.get("/get-all-groups", { params: { status: "active" } }).then((res) => (this.allGroups = res.data));
        },
    },
    created() {
        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + " Edit";
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.page_title = this.headline(this.model) + " Create";
        }
        this.getStates();
        this.getProjects();
        this.getEducations();
        this.getOccupations();
        this.getGroups();
    },
    validators: {
        "data.project_id": function (value = null) {
            return Validator.value(value).required("Project Name is required");
        },
        /* "data.indicator_id": function (value = null) {
            if (this.data.project_id) {
                return Validator.value(value).required("Indicator is required");
            }
        }, */
        "data.activity_id": function (value = null) {
            if (this.data.indicator_id) {
                return Validator.value(value).required("Project Activity is required");
            }
        },
        /*  "data.group_id": function (value = null) {
             return Validator.value(value).required("Group Name is required");
         }, */
    },
};
</script>
