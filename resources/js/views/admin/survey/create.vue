<template>
    <create-form @onSubmit='submit'>
        <div class="col-lg-12">
            <Fieldset>
                <template v-slot:name>Survey Form</template>
                <template v-slot:content>
                    <Select title="Project" v-model="data.project_id" field="data.project_id" label="project_name"
                        :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--"
                        :closeOnSelect="true" :required="true" col="4" :req="true"
                        @update:modelValue="getIndicatorsByProject(data.project_id)" />

                    <Select title="Project Indicator" v-model="data.indicator_id" field="data.indicator_id"
                        label="title" :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--"
                        :closeOnSelect="true" :required="true" col="4"
                        @update:modelValue="getActivityByIndicator(data.indicator_id)" />

                    <Select title="Project Activity" v-model="data.activity_id" field="data.activity_id" label="title"
                        :reduce="(obj) => obj.id" :options="allActivity" placeholder="--Select One--"
                        :closeOnSelect="true" :required="true" col="4"
                        @update:modelValue="getSurveyTitile(data.activity_id)" />

                    <Input v-model="data.title" field="data.title" title="Survey Title" type="text" col="8"
                        :req="true" />
                    <date-picker id="date1" field="data.survey_date" name="Survey Date" v-model="data.survey_date"
                        title="Survey Date" placeholder="dd/mm/yyyy" :req="true" col="4"
                        :disableFutureDates="true"></date-picker>

                    <Textarea title="Remarks" field="data.remarks" v-model="data.remarks" :rows="6" :req="false"
                        col="12" />
                </template>
            </Fieldset>
        </div>
    </create-form>
</template>

<script>


const model = 'survey';
import moment from 'moment';

export default {

    data() {
        return {
            model: model,
            page_title: '',
            data: {
                survey_date: moment().format('DD MMMM, YYYY'),
                title: '',
            },
            allProjects: [],
            allIndicators: [],
            allActivity: [],


        };
    },

    provide() {
        return {
            validate: this.validation,

        };
    },
    methods: {
        submit: function (e) {
            this.$validate().then((res) => {
                const error = this.validation.countErrors();

                if (error > 0) {
                    console.log(this.validation.allErrors());
                    this.$toast(
                        'You need to fill ' + error + ' more empty mandatory fields',
                        'warning'
                    );
                    return false;
                }
                if (res) {
                    if (this.data.id) {
                        this.update(this.model, this.data, this.data.id);
                    } else {
                        this.store(this.model, this.data);
                    }
                }
            });
        },

        // API section
        getProjects() {
            axios.get("/get-projects", { params: { status: "active" } }).then((res) => (this.allProjects = res.data));
        },
        getIndicatorsByProject(id) {

            this.data.indicator_id = null;
            this.allIndicators = [];
            if (id !== null) {

                this.getIndicators(id);
            }
        },
        getIndicators(id) {
            axios.get("/get-all-indicators", { params: { id: id, status: "active" } })
                .then((res) => (this.allIndicators = res.data))
                .catch(error => console.error('Error fetching indicators:', error));
        },
        getActivityByIndicator(id) {
            this.data.activity_id = null;
            this.allActivity = [];

            this.data.title = '';

            if (id !== null) {
                this.getActivity(id);
            }
        },
        getActivity(id) {
            axios.get("/get-activities", { params: { id: id, status: "active", is_surveyable: "1" } })
                .then((res) => (this.allActivity = res.data))
                .catch(error => console.error('Error fetching activities:', error));
        },
        async getSurveyTitile(activity_id) {
            if (!activity_id) {
                return;
            }
            axios.get("/get-survey-title", { params: { activity_id: activity_id } })
                .then((res) => {
                    const activity = this.allActivity.find(activity => activity.id === activity_id);
                    if (activity && res.data.length > 0) {

                        const title = activity.title;
                        const formattedDate = moment().format('MMMM YYYY');
                        console.log(title, formattedDate);
                        this.data.title = `Survey for ${title} - ${formattedDate}`;
                    } else {
                        this.$toast('No survey title found for the selected activity', 'warning');
                        this.data.title = '';
                    }
                })
                .catch(error => {
                    console.error('Error fetching survey title:', error);
                    this.$toast('Error fetching survey title', 'error');
                });
        }
    },
    created() {
        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + ' Edit';
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.page_title = this.headline(this.model) + ' Create';
        }

        this.getProjects();
    },

    validators: {
        'data.title': function (value = null) {
            if (this.data.activity_id) {
                return Validator.value(value).required('Title is required');
            }
        },
        "data.project_id": function (value = null) {
            return Validator.value(value).required("Project Name is required");
        },
        "data.indicator_id": function (value = null) {
            if (this.data.project_id) {
                return Validator.value(value).required("Indicator is required");
            }
        },
        "data.activity_id": function (value = null) {
            if (this.data.indicator_id) {
                return Validator.value(value).required("Project Activity is required");
            }
        },
        "data.survey_date": function (value = null) {
            return Validator.value(value).required("Survey Date is required");
        },
    },
}

</script>
