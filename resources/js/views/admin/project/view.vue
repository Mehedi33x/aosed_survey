<template>
    <view-page>
        <div class="row">
            <div class="col-lg-8">
                <fieldset>
                    <span class="legend">Information</span>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tbody>
                                <tr>
                                    <th>Project Name</th>
                                    <th style="text-align: center">:</th>
                                    <td>{{ data?.project_name ?? "N/A" }}</td>
                                </tr>
                                <tr>
                                    <th>Objective</th>
                                    <th style="text-align: center">:</th>
                                    <td>{{ data?.objective ?? "N/A" }}</td>
                                </tr>
                                <tr>
                                    <th>Start Date</th>
                                    <th style="text-align: center">:</th>
                                    <td>{{ formatDate(data?.start_date ?? "N/A") }}</td>
                                </tr>
                                <tr>
                                    <th>End Date</th>
                                    <th style="text-align: center">:</th>
                                    <td>{{ formatDate(data?.end_date ?? "N/A") }}</td>
                                </tr>
                                <tr>
                                    <th>Status</th>
                                    <th style="text-align: center">:</th>
                                    <td>
                                        <span :class="[
                                            data?.status == 'active'
                                                ? 'bg-success'
                                                : 'bg-danger ',
                                            'badge mt-1',
                                            'text-white ',
                                        ]">{{ ucfirst(data?.status) }}
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </fieldset>
            </div>
            <div class="col-lg-4">
                <fieldset class="mt-4 mt-lg-0">
                    <span class="legend">Count</span>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tbody>
                                <tr>
                                    <th>Acceptable Attendance</th>
                                    <th style="text-align: center">:</th>
                                    <td>{{ totalBeneficiary }}</td>
                                </tr>
                                <tr>
                                    <th>No. of Survey</th>
                                    <th style="text-align: center">:</th>
                                    <td>{{ totalSurveyable }}</td>
                                </tr>
                                <tr>
                                    <th>Project Duration</th>
                                    <th style="text-align: center">:</th>
                                    <td>{{ getDuration(data.start_date, data.end_date) }} {{
                                        getDuration(data.start_date, data.end_date) === 1 ? 'Day' : 'Days' }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-lg-12">
                <fieldset>
                    <span class="legend">Project Indicator</span>
                    <div class="accordion project_accordion mt-2" id="accordionExample">
                        <div class="accordion-item"
                            v-for="(item, index) in data.indicators.filter(indicator => indicator.status === 'active')"
                            :key="index">
                            <h2 class="accordion-header">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    :data-bs-target="'#collapse' + index" aria-expanded="true"
                                    :aria-controls="'collapse' + index">
                                    <div class="d-flex justify-content-between w-100">
                                        <p> <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                                stroke-width="1.5" stroke="currentColor" class="size-6">
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                    d="M9 12.75 11.25 15 15 9.75M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                                            </svg>
                                            {{ item?.title || 'N/A' }}</p>
                                        <p>Total Mark {{ item?.total_mark ?? 'N/A' }}</p>
                                        <p class="me-4">Achievement Percentage: {{ item?.achivement_percentage ?? 'N/A'
                                            }} %</p>
                                    </div>
                                </button>
                            </h2>
                            <div :id="'collapse' + index" class="accordion-collapse collapse"
                                :class="{ show: index === 0 }" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped"
                                            v-if="item.project_activities && item.project_activities.length">
                                            <thead>
                                                <tr>
                                                    <th>Project Activity Title</th>
                                                    <th>Is Surveyable</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(activity, index) in item.project_activities" :key="index">
                                                    <td>{{ activity.title ?? 'N/A' }}</td>
                                                    <td>{{ activity.surveyable ?? 'N/A' }}</td>
                                                    <td>
                                                        <span :class="[
                                                            activity?.status == 'active'
                                                                ? 'bg-success'
                                                                : 'bg-danger ',
                                                            'badge mt-1',
                                                            'text-white ',
                                                        ]">{{ ucfirst(activity?.status) }}
                                                        </span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <p v-else colspan="3" class="text-center">No Data Found</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </view-page>


</template>

<script>

const model = "project";
import moment from 'moment';

export default {

    data() {
        return {
            page_title: "",
            model: model,
            data: {
                indicators: [],
            },
            fileColumns: [],
        };
    },
    computed: {
        totalSurveyable() {
            return this.data.indicators?.reduce((total, indicator) => {
                return total + indicator.project_activities.filter(activity => activity.surveyable === "Yes").length;
            }, 0) || 0;
        },
        totalBeneficiary() {
            return this.data.indicators?.reduce((total, indicator) => {
                return total + indicator.project_activities.filter(activity => activity.beneficiary === "Yes").length;
            }, 0) || 0;
        }
    },
    methods: {
        formatDate(dateString) {
            const options = { day: 'numeric', month: 'short', year: 'numeric' };
            return new Date(dateString).toLocaleDateString('en-GB', options);
        },
        getDuration(start_date, end_date) {
            const startDate = moment(start_date, 'DD MMM, YYYY');
            const endDate = moment(end_date, 'DD MMM, YYYY');
            return endDate.diff(startDate, 'days');
        },

    },
    created() {
        this.page_title = `${this.headline(this.model)} View`;
        this.get_data(`${this.model}/${this.$route.params.id}`);

    },
};
</script>
