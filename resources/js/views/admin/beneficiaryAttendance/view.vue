<template>
    <view-page :defaultTable="false">
        <div class="view_page">
            <div class="row custom_row">
                <div class="col-xl-12 col-lg-12">
                    <fieldset>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th>Project Name</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            {{
                                                data?.project?.project_name ??
                                                "N/A"
                                            }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Indicator Name</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            {{
                                                data?.indicator?.title ?? "N/A"
                                            }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Activity Name</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            {{ data?.activity?.title ?? "N/A" }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Group Name</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            {{ data?.group?.title ?? "N/A" }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Attendance Date</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            {{ data?.attendance_date ?? "N/A" }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Attendance By</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            {{ data?.admin?.name ?? "N/A" }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Total Beneficiary</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            {{
                                                data?.attendance_count ?? "N/A"
                                            }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Total Present</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            {{ data?.total_present ?? "N/A" }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Total Absent</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            {{ data?.total_absent ?? "N/A" }}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </div>

                <div class="col-xl-12 col-lg-12">
                    <fieldset>
                        <span class="legend"
                            >Beneficiary Attendance Information</span
                        >
                        <div class="mb-4">
                            <div class="base_table_list">
                                <div
                                    class="table-responsive text-nowrap table-basic table_wrapper"
                                >
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th
                                                    class="sl"
                                                    style="min-width: 70px"
                                                >
                                                    <span class="heading"
                                                        >SL</span
                                                    >
                                                </th>

                                                <th>
                                                    <div class="heading">
                                                        Beneficiary Name
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="heading">
                                                        NID
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="heading">
                                                        Gender
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="heading">
                                                        Attendance
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr
                                                v-for="(
                                                    attendances, index
                                                ) in data.attendance"
                                                :key="attendances.id"
                                            >
                                                <td>{{ index + 1 }}</td>
                                                <td class="text-capitalize">
                                                    {{
                                                        attendances.beneficiary
                                                            ?.full_name || "N/A"
                                                    }}
                                                </td>
                                                <td class="text-capitalize">
                                                    {{
                                                        attendances.beneficiary
                                                            ?.nid || "N/A"
                                                    }}
                                                </td>
                                                <td class="text-capitalize">
                                                    {{
                                                        attendances.beneficiary
                                                            ?.gender || "N/A"
                                                    }}
                                                </td>
                                                <td class="text-capitalize">
                                                    {{
                                                        attendances.attendance ===
                                                        1
                                                            ? "Present"
                                                            : "Absent"
                                                    }}
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
const model = "beneficiaryAttendance";

export default {
    data() {
        return {
            page_title: "",
            model: model,
            data: {},
            fileColumns: [],
            attendance: [],
        };
    },
    created() {
        this.page_title = `${this.headline(this.model)} View`;
        this.get_data(`${this.model}/${this.$route.params.id}`);
    },
};
</script>
