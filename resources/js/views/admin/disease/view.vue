<template>
  <view-page :colSize="'col-12'"> </view-page>
</template>

<script>

const model = "disease";

export default {
  data() {
    return {
        page_title: "",
        model: model,
        data: {

        },
        fileColumns :[],
    };
  },
  created() {
    this.page_title = `${this.headline(this.model)} View`;
    this.get_data(`${this.model}/${this.$route.params.id}`);
  },
};
</script>
