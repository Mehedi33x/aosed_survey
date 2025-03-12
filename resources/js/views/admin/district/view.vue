<template>
    <view-page> </view-page>
</template>

<script>

const model = "district";

export default {
    data() {
        return {
            page_title: "",
            model: model,
            data: {},
            fileColumns: [],
        };
    },

    methods: {
        getDistrict() {
            this.$root.spinner = true;
            axios
                .get(`${this.model}/${this.$route.params.id}`)
                .then((res) => {
                    this.data.state_name = res.data.state.name;
                    this.data.name = res.data.name;
                    this.data.status = res.data.status.toLowerCase()
                    .split(' ')
                    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
                    .join(' ');
                    this.data.created_at = res.data.created_at;
                    this.data.created_by = res.data.created_by;
                    this.data.created_ip = res.data.created_ip;
                    this.data.updated_at = res.data.updated_at;
                    this.data.updated_by = res.data.updated_by;
                    this.data.updated_ip = res.data.updated_ip;

                    setTimeout(() => (this.$root.spinner = false), 200);
                })
                .catch((error) => (this.$root.spinner = false));
        },
    },

    created() {
        this.page_title = `${this.headline(this.model)} View`;
        this.getDistrict();
    },
};
</script>
