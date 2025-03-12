<template>
    <view-page :defaultTable="false">
        <div class="view_page">
            <div class="row custom_row">
                <div class="col-xl-6 col-lg-12">
                    <fieldset>
                        <span class="legend">Activity Info Details</span>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th>Project Name</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.project?.project_name ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Indicator Title</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.indicator?.title ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Activity Title</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.activity?.title ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Group</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.group?.title ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Execute By</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.admin?.name ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Total Beneficiary</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.total_beneficiary ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Attachment</th>
                                        <th style="text-align: center;">:</th>
                                        <td>
                                            <template v-if="data.file">
                                                <a target="_blank"
                                                    :href="$root.baseurl + '/public/storage/' + data.file"
                                                    v-if="data.file">
                                                    <i class="fa-solid fa-file-pdf fa-2x"></i>
                                                </a>
                                            </template>
                                            <span v-else>
                                                <i class="fa-solid fa-file-pdf"></i>
                                                (No Attachment)
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Execute Date</th>
                                        <th style="text-align: center;">:</th>
                                        <td>{{ data?.admin?.name ?? "N/A" }}</td>
                                    </tr>
                                    <!-- <tr>
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
                                    </tr> -->
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </div>
                <div class="col-xl-6 col-lg-12">
                    <fieldset>
                        <span class="legend">Media</span>
                        <div class="view_file">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="text-center" style="width: 100%; height: 100%;">
                                        <div class="img" style="width: 100%; height: 100%;">
                                            <img :src="data?.image_one == 'no_server_image' ? emptyServerImage() : (data?.image_one || emptyImage())"
                                                alt="img-cover" style="width: 100%; height: 100%; object-fit: cover" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
        <div class="view_page mt-4">
            <div class="row custom_row">
                <div class="col-xl-12 col-lg-12">
                    <fieldset>
                        <span class="legend">Remarks</span>
                        <div class="table-responsive">
                            <p v-if="data.remarks" class="mt-2">{{ data?.remarks }}</p>
                            <p v-else class="mt-4" style="text-align: center;">
                                <strong>No remarks found</strong>
                            </p>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </view-page>
</template>

<script>

const model = "activityInfo";

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
