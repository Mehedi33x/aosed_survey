<template>
    <view-page :defaultTable="false">
        <div class="view_page">

            <fieldset>
                <span class="legend">Project Activity Details</span>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <th>Project Name</th>
                                <th style="text-align: center;">:</th>
                                <td>{{ data?.title ?? "N/A" }}</td>
                            </tr>
                            <tr>
                                <th>Project Title</th>
                                <th style="text-align: center;">:</th>
                                <td>{{ data?.project?.project_name ?? "N/A" }}</td>
                            </tr>
                            <tr>
                                <th>Indicator Title</th>
                                <th style="text-align: center;">:</th>
                                <td>{{ data?.indicator?.title ?? "N/A" }}</td>
                            </tr>

                            <tr>
                                <th>Description</th>
                                <th style="text-align: center;">:</th>
                                <td>
                                    <div v-html="data?.description"></div>
                                </td>

                            </tr>
                            <tr>
                                <th>Is Surveyable</th>
                                <th style="text-align: center;">:</th>
                                <td>{{ data?.surveyable ?? "N/A" }}</td>
                            </tr>
                            <tr>
                                <th>Beneficiary Attendance</th>
                                <th style="text-align: center;">:</th>
                                <td>{{ data?.beneficiary ?? "N/A" }}</td>
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
    </view-page>
</template>

<script>

const model = "projectActivity";

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
