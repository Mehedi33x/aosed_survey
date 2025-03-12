<template>
    <view-page :defaultTable="false" :parentId="$route.params.id" :parentGroupName="data.group_name">
        <div class="view_page">
            <div class="row custom_row">
                <div class="col-xl-12 col-lg-12">
                    <fieldset>
                        <span class="legend">Primary Information</span>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th>Project Name</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.project_name ?? "N/A" }}</td>
                                    </tr>

                                    <tr>
                                        <th>Activity Name</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.activity_name ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Group Name</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.group_name ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Total Beneficiary</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data.assignedBeneficiaries ? data.assignedBeneficiaries.length : 0 }}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </div>

                <div class="col-xl-12 col-lg-12" v-if="groupedBeneficiaries">
                    <fieldset>
                        <span class="legend">Beneficiary Information</span>
                        <div v-for="(group, groupName) in groupedBeneficiaries" :key="groupName" class="mb-4">
                            <!-- <h6 class="group-title mt-2">Group - {{ data?.group_name }}</h6> -->
                            <div class="base_table_list">
                                <div class="table-responsive text-nowrap table-basic table_wrapper">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="sl" style="min-width: 70px">
                                                    <span class="heading">SL</span>
                                                </th>
                                                <th>
                                                    <div class="heading">Beneficiary Image</div>
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
                                                <th>
                                                    <div class="heading">NID</div>
                                                </th>
                                                <th>
                                                    <div class="heading">Phone No</div>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody v-if="group && group.length">
                                            <tr v-for="(assignedBeneficiary, index) in group" :key="index">
                                                <td>{{ index + 1 }}</td>
                                                <td class="text-capitalize">
                                                    <img :src="assignedBeneficiary?.beneficiary?.thumb_one ?? emptyImage50()"
                                                        alt="Beneficiary Image" class="beneficiary-image"
                                                        style="height: 30px;width:30px">
                                                </td>
                                                <td class="text-capitalize">{{ assignedBeneficiary?.full_name ??
                                                    assignedBeneficiary?.beneficiary?.full_name }}</td>
                                                <td class="text-capitalize">{{
                                                    assignedBeneficiary?.beneficiary?.age ?? "" }}</td>
                                                <td class="text-capitalize">{{
                                                    assignedBeneficiary?.beneficiary?.gender ?? "" }}</td>
                                                <td class="text-capitalize">{{
                                                    assignedBeneficiary?.beneficiary?.primary_occupation_name ?? "" }}
                                                </td>

                                                <td class="text-capitalize">{{ assignedBeneficiary?.beneficiary?.nid
                                                    ?? "" }}
                                                </td>
                                                <td class="text-capitalize">{{
                                                    assignedBeneficiary?.beneficiary?.mobile_no }}</td>
                                            </tr>
                                        </tbody>
                                        <tbody v-else>
                                            <tr>
                                                <td colspan="6" style="text-align: center; background: #fff">
                                                    <p class="p-2 text-center text-red no-data">No data found.</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </view-page>
</template>

<script>
const model = "beneficiaryAssign";

export default {
    data() {
        return {
            page_title: "",
            model: model,
            data: {},
            fileColumns: [],
        };
    },

    computed: {
        groupedBeneficiaries() {
            if (!this.data.assignedBeneficiaries) return {};

            return this.data.assignedBeneficiaries.reduce((groups, beneficiary) => {
                const groupName = beneficiary.group_name || 'Ungrouped';
                if (!groups[groupName]) groups[groupName] = [];
                groups[groupName].push(beneficiary);
                return groups;
            }, {});
        },
    },

    provide() {
        return {
            // xDeleteViewData: this.deleteData,
        };
    },

    methods: {
        /* deleteData() {
            this.$root.tableSpinner = true;
            axios
                .delete(`${this.model}/${this.data.activity_id}/${this.data.group_id}`)
                .then((res) => {
                    this.$toast(res.data.message, "success");
                    // Redirect to the module list page if available in history, otherwise to dashboard.
                    if (window.history.state.back) {
                        this.$router.back();
                    } else {
                        this.$router.push("/dashboard");
                    }
                })
                .catch((error) => {
                    this.$toast(error.response?.data?.message ?? "Something went wrong to delete!", "error");
                })
                .finally(() =>
                    setTimeout(() => (this.$root.tableSpinner = false), 200)
                );
        }, */
    },

    created() {
        this.page_title = `${this.headline(this.model)} View`;
        this.get_data(`${this.model}/${this.$route.params.id}`);
    },
};
</script>
