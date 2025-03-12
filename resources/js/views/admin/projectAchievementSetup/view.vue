<template>
    <view-page :defaultTable="false">
        <div class="view_page">
            <div class="row custom_row">
                <div class="col-xl-6 col-lg-12">
                    <fieldset>
                        <span class="legend">Project Achievement Setup Details</span>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th>Project Name</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.project?.project_name ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Indicator Name</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.indicator?.title ?? "N/A" }}</td>

                                    </tr>
                                    <tr>
                                        <th>Total Mark</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.indicator?.total_mark ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Achivement Percentage</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.indicator?.achivement_percentage ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <th style="text-align: center;">:</th>
                                        <td>
                                            <span :class="[
                                                data?.status == 'active'
                                                    ? 'bg-success'
                                                    : 'bg-danger ',
                                                'badge mt-1',
                                                'text-white ',]">{{ ucfirst(data?.status) }}
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </div>
                <div class="col-xl-6 col-lg-12">
                    <fieldset>
                        <span class="legend">Activity Attendance Details</span>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th>Activity Point</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.activity_point ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Activity Attendance Less Than 30</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.activity_att_lt_30 ?? "N/A" }}</td>

                                    </tr>
                                    <tr>
                                        <th>Activity Attendance Less Than 50</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.activity_att_lt_50 ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Activity Attendance Less Than 80</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.activity_att_lt_80 ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Activity Attendance Less Than 100</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.activity_att_lt_100 ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Average Survey Point Less Than 30</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.survey_point_lt_30 ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Average Survey Point Less Than 50</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.survey_point_lt_50 ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Average Survey Point Less Than 80</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.survey_point_lt_80 ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Average Survey Point Less Than 100</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.survey_point_lt_100 ?? "N/A" }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </view-page>
</template>

<script>

const model = "projectAchievementSetup";

export default {
    data() {
        return {
            page_title: "",
            model: model,
            data: {

            },
            fileColumns: [],
        };
    },
    created() {
        this.page_title = `${this.headline(this.model)} View`;
        this.get_data(`${this.model}/${this.$route.params.id}`);
    },
};
</script>
