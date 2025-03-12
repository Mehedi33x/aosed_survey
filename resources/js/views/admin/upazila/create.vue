<template>
    <create-form @onSubmit='submit'>
        <Select title="State" v-model="data.state_id" field="data.state_id" label="name" :reduce="(obj) => obj.id"
            :options="allStates" placeholder="--Select One--" :closeOnSelect="true" :required="false" col="3"
            @update:modelValue="getDistrictByState(data.state_id)" />
        <Select title="District" v-model="data.district_id" field="data.district_id" label="name"
            :reduce="(obj) => obj.id" :options="allDistricts" placeholder="--Select One--" :closeOnSelect="true"
            :required="false" col="3" />
        <Input v-model='data.name' field='data.name' title='Name' :req='true' col="4" />
        <Input title="Sorting" field="data.sorting" v-model="data.sorting" :req="true" col="2" type="number" />
        <Switch v-model='data.status' field='data.status' title='Status' on-label='Active' off-label='Deactive'
            :req='true' />
    </create-form>
</template>

<script>
const model = 'upazila';

export default {
    data() {
        return {
            model: model,
            page_title: '',
            data: {},
            allStates: [],
            allDistricts: [],
            filteredDistricts: [],
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
            axios.get("/get-states").then((res) => (this.allStates = res.data));
        },
        getDistrictByState(id) {
            this.data.district_id = null;
            this.allDistricts = [];

            if (id !== null) {
                this.getDistricts(id);
            }
        },

        getDistricts(id) {
            axios.get("/get-districts", { params: { id: id } }).then((res) => (this.allDistricts = res.data)).catch(error => console.error('Error fetching districts:', error));;
        },
    },

    created() {


        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + ' Edit';
            axios.get(`${this.model}/${this.$route.params.id}`).then((res) => {
                const allData = res.data;
                this.data = allData;
                this.getDistricts(allData.state_id);
            });
        } else {
            this.page_title = this.headline(this.model) + ' Create';
        }
        this.get_sorting(this.ucfirst(this.model));
        this.getStates();
    },
    validators: {
        'data.name': function (value = null) {
            return Validator.value(value).required('Name is required');
        },
        "data.sorting": function (value = null) {
            return Validator.value(value)
                .digit()
                .regex("^[0-9]*$")
                .required("Sorting is required");
        },
        "data.status": function (value = null) {
            return Validator.value(value).required("Status is required");
        },
    },
};
</script>
