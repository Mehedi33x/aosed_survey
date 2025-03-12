<template>
    <create-form @onSubmit="submit">
        <Fieldset>
            <template #name>Primary Information</template>
            <template #content>
                <Select title="Project" v-model="data.project_id" field="data.project_id" label="project_name"
                    :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--" :closeOnSelect="true"
                    :required="true" col="6 col-xl-4" :req="true"
                    @update:modelValue="getIndicatorsByProject(data.project_id)" />
                <Select title="Project Indicator" v-model="data.indicator_id" field="data.indicator_id" label="title"
                    :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--"
                    :closeOnSelect="true" :required="true" col="6 col-xl-4" @update:modelValue="
                        getActivityByIndicator(data.indicator_id)
                        " />
                <Select title="Project Activity" v-model="data.activity_id" field="data.activity_id" label="title"
                    :reduce="(obj) => obj.id" :options="allActivity" placeholder="--Select One--" :closeOnSelect="true"
                    :required="true" col="6 col-xl-4" @@update:modelValue="getBeneficiaries(data.activity_id)" />
                <Select title="Group" v-model="data.group_id" field="data.group_id" label="title"
                    :reduce="(obj) => obj.id" :options="allGroups" placeholder="--Select One--" :closeOnSelect="true"
                    :required="false" col="6 col-xl-4" @update:modelValue="getBeneficiaries(data.group_id)" />

                <date-picker id="date1" field="data.attendance_date" name="Execute Date" v-model="data.attendance_date"
                    title="Attendance Date" :req="true" col="6 col-xl-4">
                </date-picker>
                <Switch v-model="data.status" field="data.status" title="Status" on-label="Active" off-label="Deactive"
                    :req="true"></Switch>
            </template>
        </Fieldset>
        <div class="view_divider"></div>
        <h6 class="mt-3">Beneficiary List</h6>
        <div class="base_table_list">
            <div class="table-responsive text-nowrap table-basic table_wrapper">
                <table class="table">
                    <thead>
                        <tr>
                            <th class="sl" style="min-width: 70px">
                                <span class="heading">SL</span>
                            </th>
                            <th>
                                <div class="heading">Beneficiary Name</div>
                            </th>
                            <th>
                                <div class="heading">NID</div>
                            </th>
                            <th>
                                <div class="heading">Mobile Number</div>
                            </th>
                            <th>
                                <div class="heading">Attendance</div>
                            </th>
                        </tr>
                    </thead>

                    <tbody v-if="allBeneficiaries.length > 0">
                        <tr v-for="(item, index) in allBeneficiaries" :key="index">
                            <td>{{ index + 1 }}</td>
                            <td class="text-capitalize">
                                {{ item.full_name }}
                            </td>
                            <td class="text-capitalize">
                                {{ item.nid }}
                            </td>
                            <td class="text-capitalize">
                                {{ item.mobile_no }}
                            </td>

                            <td class="text-capitalize" v-if="data.attendance[index]">
                                <label>
                                    <input type="radio" :name="'attendance' + index" v-model="data.attendance[index].attendance
                                        " value="1" />
                                    Present
                                </label>
                                <label class="mx-4">
                                    <input type="radio" :name="'attendance' + index" v-model="data.attendance[index].attendance
                                        " value="0" />
                                    Absent
                                </label>
                            </td>
                        </tr>
                    </tbody>
                    <tbody v-else>
                        <tr>
                            <td colspan="8" style="text-align: center; background: #fff">
                                <p class="p-2 text-center text-red no-data">
                                    No data found.
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </create-form>
</template>

<script>
const model = "beneficiaryAttendance";

export default {
    data() {
        return {
            model: model,
            page_title: "",
            data: {
                attendance_date: this.getTodayDate(),
                status: "active",
                attendance: [],
            },
            allProjects: [],
            allIndicators: [],
            allActivity: [],
            allBeneficiaries: [],
            allGroups: [],
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
                const error = this.validation.countErrors();

                if (error > 0) {
                    console.log(this.validation.allErrors());
                    this.$toast(
                        "You need to fill " +
                        error +
                        " more empty mandatory fields",
                        "warning"
                    );
                    return false;
                }

                if (res) {
                    if (this.data.id) {
                        this.update(
                            this.model,
                            this.data,
                            this.data.activity_id
                        );
                    } else {
                        this.store(this.model, this.data);
                    }
                }
            });
        },

        checkAttendance() {
            this.$watch("allBeneficiaries", (newBeneficiaries) => {
                if (!this.$route.params.id) {
                    this.data.attendance = newBeneficiaries.map(
                        (beneficiary) => ({
                            beneficiary_id: beneficiary.id,
                            attendance: beneficiary.attendance || "1",
                        })
                    );
                }
            });
        },
        getTodayDate() {
            const today = new Date();
            const day = today.getDate();
            const month = today.toLocaleString("default", { month: "long" }); // Get full month name
            const year = today.getFullYear();
            return `${day} ${month}, ${year}`;
        },
        // API section
        getProjects() {
            axios
                .get("/get-projects", { params: { status: "active" } })
                .then((res) => (this.allProjects = res.data));
        },
        getIndicatorsByProject(id) {
            this.data.indicator_id = null;
            this.allIndicators = [];
            if (id !== null) {
                this.getIndicators(id);
            }
        },
        getIndicators(id) {
            axios
                .get("/get-all-indicators", {
                    params: { id: id, status: "active" },
                })
                .then((res) => (this.allIndicators = res.data))
                .catch((error) =>
                    console.error("Error fetching indicators:", error)
                );
        },
        getActivityByIndicator(id) {
            this.data.activity_id = null;
            this.allActivity = [];
            if (id !== null) {
                this.getActivity(id);
            }
        },
        getActivity(id) {
            axios
                .get("/get-activities", {
                    params: { id: id, status: "active", beneficiary_attendance: true },
                })
                .then((res) => (this.allActivity = res.data))
                .catch((error) =>
                    console.error("Error fetching activities:", error)
                );
        },

        /* getBeneficiaries(activity_id) {
            axios
                .get("/get-all-beneficiaries", {
                    params: { activity_id: activity_id },
                })
                .then((res) => {
                    this.allBeneficiaries = res.data;
                    this.checkAttendance();
                })
                .catch((error) =>
                    console.error("Error fetching beneficiaries:", error)
                );
        }, */
        getBeneficiaries() {
            const params = {};

            if (this.data.activity_id) {
                params.activity_id = this.data.activity_id;
            }

            if (this.data.group_id) {
                params.group_id = this.data.group_id;
            }
            axios
                .get("/get-all-beneficiaries", { params })
                .then((res) => {
                    this.allBeneficiaries = res.data;
                    this.checkAttendance();
                })
                .catch((error) =>
                    console.error("Error fetching beneficiaries:", error)
                );
        },
        getGroups() {
            axios.get("/get-all-groups", { params: { status: "active" } }).then((res) => (this.allGroups = res.data));
        },

    },
    watch: {
        "data.activity_id"(newVal) {
            if (newVal) {
                this.getBeneficiaries(newVal);
            }
        }
    },

    created() {
        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + " Edit";
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.page_title = this.headline(this.model) + " Create";
        }
        this.getProjects();
        this.checkAttendance();
        this.getGroups();
    },
    validators: {
        "data.project_id": function (value = null) {
            return Validator.value(value).required("Project  is required");
        },
        "data.indicator_id": function (value = null) {
            return Validator.value(value).required("Indicator  is required");
        },
        "data.activity_id": function (value = null) {
            return Validator.value(value).required("Activity  is required");
        },
    },
};
</script>
