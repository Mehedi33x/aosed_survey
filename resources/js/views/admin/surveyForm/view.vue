<template>
    <view-page :defaultTable="false">
        <div class="view_page">
            <div class="container p-3 p-sm-4 p-md-5">
                <div class="row">
                    <div class="col-12">
                        <h5 class="mb-2">Title: {{ data.title }}</h5>
                        <div class="project-details">
                            <p><span>Project:</span> {{ data?.project?.project_name ?? 'N/A' }}</p>
                            <p><span>Indicator:</span> {{ data?.indicator?.title ?? 'N/A' }}</p>
                            <p><span>Activity:</span> {{ data?.activity?.title ?? 'N/A' }}</p>
                            <p><span>Status:</span> <span :class="[
                                data?.status == 'active'
                                    ? 'bg-success'
                                    : 'bg-danger',
                                'badge mb-1',
                                'text-white'
                            ]">{{ ucfirst(data?.status) }}
                                </span></p>
                        </div>
                        <p class="questions-title">Questions</p>
                        <div class="question-block" v-for="(item, index) in data.questions" :key="index">
                            <div class="question-title">
                                <span class="question-mark">{{ index + 1 }}.</span>
                                <span style="flex: 1">{{ item?.question ?? 'N/A' }}</span>
                                <span class="question-mark">{{ item?.mark ?? 0 }} marks</span>
                            </div>
                            <span class="answers-title">Answer:</span>
                            <div class="answers" v-for="(answer, index) in item.answers" :key="index">
                                <p><span> {{ answer.answer }}</span> <span>{{ answer?.mark ?? 0 }} marks</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </view-page>
</template>


<script>

const model = "surveyForm";

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

<style scoped>
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}

.container {
    width: 90%;
    margin: 10px auto;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 2px;
}

h1 {
    font-size: 24px;
    margin-bottom: 20px;
}

.project-details {
    margin-bottom: 20px;
}

.project-details p {
    font-size: 16px;
    margin: 5px 0;
}

.project-details p span{
    font-weight: 500;
}

.questions-title {
    font-size: 20px;
    margin-bottom: 10px;
    font-weight: bold;
}

.answers-title {
    /* font-size: 18px; */
    /* margin-top: 10px; */
    /* display: block; */
    font-weight: 500;
}

.question-block {
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #ddd;
}

.question-title {
    font-weight: 500;
    margin-bottom: 10px;
    display: flex;
    justify-content: space-between;
}

.question-mark {
    min-width: 5px;
}

.answers {
    margin-left: 30px;
}

.answers p {
    margin: 5px 0;
    font-size: 15px;
    display: flex;
    justify-content: space-between;
}

.answers p span {
    color: #666;
}
</style>
