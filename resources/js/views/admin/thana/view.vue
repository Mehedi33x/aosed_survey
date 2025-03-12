<template>
    <view-page :defaultTable="false">
        <div class="view_page">
            <div class="row custom_row">
                <div class="col-xl-12 col-lg-12">
                    <fieldset>
                        <span class="legend">Thana Details</span>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th>Thana Name</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data.name ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>State Name</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.state?.name ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>District Name</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.district?.name ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Upazila Name</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.upazila?.name ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Contact No</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.contact_no ?? "N/A" }}</td>
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
            </div>
        </div>
    </view-page>
</template>

<script>

const model = "thana";

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
