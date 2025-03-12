<template>
    <create-form @onSubmit='submit'>
        <Select title="Select Project" v-model="data.project_id" field="data.project_id" label="project_name"
            :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--" :closeOnSelect="true"
            :required="true" col="3" @update:modelValue="getIndicatorsByProject(data.project_id)" />

        <Select title="Select Indicator" v-model="data.indicator_id" field="data.indicator_id" label="title"
            :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--" :closeOnSelect="true"
            :required="true" col="3" />

        <Input v-model='data.title' field='data.title' title='Title' :req='true' />

        <editor title="Description" v-model="data.description" field="data.description" col="12" />

        <Switch v-model='data.is_surveyable' field='data.is_surveyable' title='Is Surveyable' on-label='Yes'
            off-label='No' :onValue="true" :offValue="false" :req='true' col="3"></Switch>

        <Switch v-model='data.beneficiary_attendance' field='data.beneficiary_attendance' title='Beneficiary Attendance'
            on-label='Yes' off-label='No' :onValue="true" :offValue="false" :req='true' col="3"></Switch>


        <Switch v-model='data.status' field='data.status' title='Status' on-label='Active' off-label='Deactive'
            :req='true' col="3"></Switch>
    </create-form>
</template>

<script>


const model = 'projectActivity';
import Editor from "../../../components/Form/CKEditor.vue";
export default {
    components: { Editor },

    data() {
        return {
            model: model,
            page_title: '',
            data: {
                is_surveyable: false,
                beneficiary_attendance: false,
                status: 'active',
            },
            allProjects: [],
            allIndicators: [],

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

        // api section
        getProjects() {
            axios.get("/get-projects", { params: { status: "active" } }).then((res) => (this.allProjects = res.data));
        },

        getIndicatorsByProject(id) {
            this.allIndicators = [];
            this.data.indicator_id = null;
            if (id !== null) {
                axios.get("/get-all-indicators", { params: { id: id, status: "active" } })
                    .then((res) => {
                        this.allIndicators = res.data;
                    })
                    .catch((error) => {
                        console.error('Error fetching indicators:', error);
                    });
            }
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
        'data.title': function (value = null) { return Validator.value(value).required('Title is required'); },
        'data.project_id': function (value = null) { return Validator.value(value).required('Project is required'); },
        'data.indicator_id': function (value = null, data = {}) {
            if (this.data.project_id) {
                return Validator.value(value).required('Indicator is required when project is selected');
            }
        },
        "data.status": function (value = null) {
            return Validator.value(value).required("Status is required");
        },
    },
}

</script>
