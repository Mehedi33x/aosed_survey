<template>
    <div class="row g-3">
        <div class="component_loader" :class="{ 'z-top': $root.initialLoader }"
            v-if="$root.spinner && !$root.tableSpinner">
            <div class="loader"></div>
        </div>
        <template v-else>
            <!-- counter section -->
            <div class="col-xl-3 col-lg-6 col-md-6" v-for="(menu, index) in data.dashboardMenus" :key="index">
                <div class="card top_short_info_card">
                    <div class="card-body">
                        <router-link :to="{ name: menu.route_name }" class="d-block w-100">
                            <div class="top_short_info d-flex justify-content-between gap-4 align-items-center">
                                <div class="text">
                                    <h4 class="label">{{ menu.menu_name }}</h4>
                                    <h3 class="title">
                                        {{ menu.total_data_count }}
                                    </h3>
                                </div>
                                <div v-html="menu.icon"
                                    class="icon rounded-pill d-flex justify-content-center align-items-center"
                                    data-bs-toggle="tooltip" data-bs-placement="top" :data-bs-title="menu.menu_name"
                                    v-x-tooltip></div>
                            </div>
                        </router-link>
                    </div>
                </div>
            </div>

            <!-- chart section -->
            <div class="col-xxl-9 col-xl-8 col-lg-7">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card_title text-start">Beneficiary Age Statistics</h4>
                        <div style="
                                height: 400px;
                                max-width: 800px;
                                margin: 0 auto;
                            ">
                            <BarChart :chartData="barChartData" :chartOptions="barChartOptions" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxl-3 col-xl-4 col-lg-5">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card_title text-start">Beneficiary Gender</h4>
                        <div style="max-width: 400px">
                            <PieChart :chartData="pieChartData" :chartOptions="pieChartOptions" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- table data section -->
            <!-- Survey -->
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card_title text-start">Recent Surveys</h4>
                        <div class="table-responsive text-nowrap rounded-3">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="sl" style="min-width: 70px">
                                            <span class="heading"> SL </span>
                                        </th>
                                        <th>
                                            <div class="heading">
                                                Survey Date
                                            </div>
                                        </th>
                                        <th>
                                            <div class="heading">Survey Number</div>
                                        </th>

                                        <th>
                                            <div class="heading">
                                                Titile
                                            </div>
                                        </th>
                                        <th class="action_th"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template v-if="
                                        Object.keys(data.surveys)
                                            .length > 0
                                    ">
                                        <tr v-for="(
                                            survey, index
                                            ) in data.surveys" :key="index">
                                            <td>{{ ++index }}</td>
                                            <td>
                                                {{
                                                    $filter.enFormat(
                                                        survey.survey_date
                                                    )
                                                }}
                                            </td>
                                            <td>{{ survey.survey_number }}</td>
                                            <td>{{ survey.title }}</td>
                                            <td class="action_td">
                                                <div class="actions position-relative">
                                                    <div class="action_btn" data-bs-toggle="tooltip"
                                                        data-bs-placement="top" data-bs-title="View" v-x-tooltip>
                                                        <router-link :to="`/survey/${survey.id}`">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                height="24" viewBox="0 0 24 24" fill="none"
                                                                stroke="currentColor" stroke-width="2"
                                                                stroke-linecap="round" stroke-linejoin="round"
                                                                class="icon icon-tabler icons-tabler-outline icon-tabler-eye">
                                                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                                <path d="M10 12a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" />
                                                                <path
                                                                    d="M21 12c-2.4 4 -5.4 6 -9 6c-3.6 0 -6.6 -2 -9 -6c2.4 -4 5.4 -6 9 -6c3.6 0 6.6 2 9 6" />
                                                            </svg>
                                                        </router-link>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </template>
                                    <tr v-else>
                                        <td colspan="5">
                                            <p class="text-center">
                                                No data available
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Login Information -->
            <!-- <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card_title text-start">Login Information</h4>
                        <div class="table-responsive text-nowrap rounded-3">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="sl" style="min-width: 70px">
                                            <span class="heading"> SL </span>
                                        </th>
                                        <th>
                                            <div class="heading">User Name</div>
                                        </th>

                                        <th>
                                            <div class="heading">Login At</div>
                                        </th>
                                        <th>
                                            <div class="heading">Login IP</div>
                                        </th>
                                        <th>
                                            <div class="heading">Browser</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template v-if="
                                        Object.keys(data.loginHistories)
                                            .length > 0
                                    ">
                                        <tr v-for="(
                                                history, index
                                            ) in data.loginHistories" :key="index">
                                            <td>{{ ++index }}</td>
                                            <td>{{ history.user?.name }}</td>
                                            <td>
                                                {{
                                                    $filter.enFormat(
                                                        history.login_at
                                                    )
                                                }}
                                            </td>
                                            <td>{{ history.login_ip }}</td>
                                            <td>
                                                {{
                                                    history.login_browser_client
                                                }}
                                            </td>
                                        </tr>
                                    </template>
                                    <tr v-else>
                                        <td colspan="5">
                                            <p class="text-center">
                                                No data available
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div> -->

            <!-- Recent Activity -->
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card_title text-start">Recent Activity</h4>
                        <div class="table-responsive text-nowrap rounded-3">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="sl" style="min-width: 70px">
                                            <span class="heading"> SL </span>
                                        </th>
                                        <th>
                                            <div class="heading">Log Name</div>
                                        </th>

                                        <th>
                                            <div class="heading">
                                                Event Name
                                            </div>
                                        </th>
                                        <th>
                                            <div class="heading">
                                                Description
                                            </div>
                                        </th>
                                        <th>
                                            <div class="heading">
                                                Created at
                                            </div>
                                        </th>
                                        <th class="action_th"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <template v-if="
                                        Object.keys(data.activities)
                                            .length > 0
                                    ">
                                        <tr v-for="(
                                                activity, index
                                            ) in data.activities" :key="index">
                                            <td>{{ ++index }}</td>
                                            <td>{{ activity.log_name }}</td>
                                            <td>{{ activity.event }}</td>
                                            <td>{{ activity.description }}</td>
                                            <td>
                                                {{
                                                    $filter.enFormat(
                                                        activity.created_at
                                                    )
                                                }}
                                            </td>
                                            <td class="action_td">
                                                <div class="actions position-relative">
                                                    <div class="action_btn" data-bs-toggle="tooltip"
                                                        data-bs-placement="top" data-bs-title="View" v-x-tooltip>
                                                        <router-link :to="`/activityLog/${activity.id}`">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                height="24" viewBox="0 0 24 24" fill="none"
                                                                stroke="currentColor" stroke-width="2"
                                                                stroke-linecap="round" stroke-linejoin="round"
                                                                class="icon icon-tabler icons-tabler-outline icon-tabler-eye">
                                                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                                <path d="M10 12a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" />
                                                                <path
                                                                    d="M21 12c-2.4 4 -5.4 6 -9 6c-3.6 0 -6.6 -2 -9 -6c2.4 -4 5.4 -6 9 -6c3.6 0 6.6 2 9 6" />
                                                            </svg>
                                                        </router-link>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </template>
                                    <tr v-else>
                                        <td colspan="5">
                                            <p class="text-center">
                                                No data available
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <pre>{{ data.statistics }}</pre> -->
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card_title text-start">Statistics</h4>
                        <div class="table-responsive text-nowrap rounded-3">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="sl" style="min-width: 70px">
                                            <span class="heading"> SL </span>
                                        </th>
                                        <th>
                                            <div class="heading">
                                                Title
                                            </div>
                                        </th>
                                        <th>
                                            <div class="heading">Total</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(value, key, index) in data.statistics" :key="key">

                                        <td>{{ index + 1 }}</td>
                                        <td>{{ formatTitle(key) }}</td>
                                        <td>{{ value }}</td>
                                    </tr>
                                    <tr v-if="Object.keys(data.statistics).length === 0">
                                        <td colspan="3">
                                            <p class="text-center">No data available</p>
                                        </td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </template>
    </div>
</template>

<script>
import BarChart from "../../components/chart/bar.vue";
import PieChart from "../../components/chart/pie.vue";

export default {
    components: { BarChart, PieChart },
    data() {
        return {
            data: {
                dashboardMenus: {},
                activities: {},
                loginHistories: {},
            },
            barChartData: {
                labels: [],
                datasets: [
                    {
                        backgroundColor: "#c5cae9",
                        data: [],
                    },
                ],
            },
            barChartOptions: {
                responsive: true,
                scales: {
                    x: {
                        beginAtZero: true,
                    },
                },
            },
            pieChartData: {
                labels: [],
                datasets: [
                    {
                        labels: "Beneficiary Gender Report",
                        backgroundColor: [],
                        data: [],
                    },
                ],
            },
            pieChartOptions: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                    },
                },
            },
        };
    },

    watch: {
        $route(toRoute, fromRoute) {
            if (
                toRoute.path === fromRoute.path &&
                Object.keys(toRoute.query).length === 0
            ) {
                this.getDashboardData();
            }
        },
    },

    methods: {
        formatTitle(key) {
            return key
                .replace(/_/g, ' ')
                .replace(/\b\w/g, char => char.toUpperCase());
        },
        getDashboardData() {
            this.$root.spinner = true;

            this.$router.push({ query: { page: 1 } });

            axios
                .get("/dashboard")
                .then((response) => {
                    this.data = response.data;
                    const data = response.data;

                    // Generate Pie Chart...
                    this.generatePieChart(data);

                    // Generate Bar Chart...
                    this.generateBarChart(data);
                })
                .catch((error) => { })
                .finally(() => {
                    this.$root.spinner = false;
                });
        },

        generateBarChart(data) {
            if (
                data &&
                data.barData &&
                data.barData.labels &&
                data.barData.data
            ) {
                const barLabels = [];
                const barData = [];

                data.barData.labels.forEach((element) => {
                    barLabels.push(element);
                });

                data.barData.data.forEach((element) => {
                    barData.push(element);
                });

                this.barChartData = {
                    labels: barLabels,
                    datasets: [
                        {
                            label: "Beneficiary Age Statistics",
                            backgroundColor: [
                                "#41B883",
                                "#E46651",
                                "#00D8FF",
                                "#DD1B16",
                            ],
                            data: barData,
                        },
                    ],
                };
            } else {
                console.error("Invalid data format for generating bar chart");
            }
        },
        generatePieChart(data) {
            if (
                data &&
                data.pieData &&
                data.pieData.labels &&
                data.pieData.data
            ) {
                const pieLabels = [];
                const pieData = [];

                data.pieData.labels.forEach((element) => {
                    pieLabels.push(element);
                });

                data.pieData.data.forEach((element) => {
                    pieData.push(element);
                });

                this.pieChartData = {
                    labels: pieLabels,
                    datasets: [
                        {
                            backgroundColor: [
                                "#41B883",
                                "#E46651",
                                "#00D8FF",
                                "#DD1B16",
                            ],
                            data: pieData,
                        },
                    ],
                };
            } else {
                console.error("Invalid data format for generating pie chart");
            }
        },
    },
    created() {
        this.getDashboardData();
        this.setBreadcrumbs(this.model, "index", "Dashboard");
    },
};
</script>
