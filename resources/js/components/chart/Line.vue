<template>
    <Line id="my-chart-id" :options="chartOptions" :data="chartData" />
</template>

<script>
import { Line } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, LineElement, PointElement, CategoryScale, LinearScale } from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, LineElement, PointElement, CategoryScale, LinearScale)

export default {
    name: 'LineChart',
    components: { Line },
    props: {
        chartData: {
            type: Object,
            required: true,
        },
        chartOptions: {
            type: Object,
            required: true,
        },
    },
    data() {
        return {
            /* chartData: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                datasets: [
                    {
                        label: 'Sample Data',
                        data: [40, 20, 12, 14, 11, 41, 20, 52, 71, 21, 32, 52],
                        borderColor: 'rgba(75, 192, 192, 1)',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        fill: true,
                        tension: 0.4,
                    }
                ]
            },
            chartOptions: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                }
            } */
        }
    }
}
</script>
