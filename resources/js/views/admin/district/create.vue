<template>
    <create-form @onSubmit='submit'>
        <Select field="data.state_id" :req="true" title="Select State" col="4" v-model="data.state_id" label="name"
            :reduce="(obj) => obj.id" :options="allStates" placeholder="--Select One--" :closeOnSelect="true" />
        <Input v-model='data.name' field='data.name' title='Name' :req='true' col="4" />
        <Input title="Sorting" field="data.sorting" v-model="data.sorting" :req="true" col="2" type="number" />
        <Switch v-model='data.status' field='data.status' title='Status' on-label='Active' off-label='Deactive'
            :req='true'></Switch>

    </create-form>
</template>

<script>


const model = 'district';

export default {

    data() {
        return {
            model: model,
            page_title: '',
            data: {
                status: 'active',
                sorting: 0,
            },
            allStates: [],

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
        getStates() {
            axios
                .get("/get-states")
                .then((res) => (this.allStates = res.data));
        },


    },

    created() {
        this.getStates();

        this.get_sorting(this.ucfirst(this.model));
        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + ' Edit';
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.page_title = this.headline(this.model) + ' Create';
        }
    },

    validators: {
        'data.state_id': function (value = null) { return Validator.value(value).required('State is required'); },
        'data.name': function (value = null) { return Validator.value(value).required('Name is required'); },
        "data.sorting": function (value = null) {
            return Validator.value(value)
                .digit()
                .regex("^[0-9]*$")
                .required("Sorting is required");
        },

    },
}

</script>
