<template>
    <create-form @onSubmit='submit'>
        <Select title="State" v-model="data.state_id" field="data.state_id" label="name" :reduce="(obj) => obj.id"
            :options="allStates" placeholder="--Select One--" :closeOnSelect="true" :required="false" col="3"
            @update:modelValue="getDistrictByState(data.state_id)" />
        <Select title="District" v-model="data.district_id" field="data.district_id" label="name"
            :reduce="(obj) => obj.id" :options="allDistricts" placeholder="--Select One--" :closeOnSelect="true"
            :required="false" col="3" @update:modelValue="getUpazilaByDistrict(data.district_id)" />
        <Select title="Upazila" v-model="data.upazila_id" field="data.upazila_id" label="name" :reduce="(obj) => obj.id"
            :options="allUpazilas" placeholder="--Select One--" :closeOnSelect="true" :required="false" col="3" />

        <Input v-model='data.name' field='data.name' title='Name' :req='false' />
        <Input v-model='data.contact_no' field='data.contact_no' title='Contact' :req='false' />
        <Switch v-model='data.status' field='data.status' title='Status' on-label='Active' off-label='Deactive'
            :req='true'></Switch>
    </create-form>
</template>

<script>
const model = 'thana';
export default {
    data() {
        return {
            model: model,
            page_title: '',
            data: {},
            allStates: [],
            allDistricts: [],
            allUpazilas: [],

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
        getUpazilaByDistrict(id) {
            this.data.upazila_id = null;
            this.allUpazilas = [];
            if (id != null) {
                this.getUpazilas(id);
            }
        },
        getUpazilas(id) {
            axios.get("/get-upazilas", { params: { id: id } }).then((res) => (this.allUpazilas = res.data)).catch(error => console.error('Error fetching upazilas:', error));;
        }
    },
    created() {
        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + ' Edit';
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.page_title = this.headline(this.model) + ' Create';
        }
        this.getStates();
    },

    validators: {
        'data.name': function (value = null) {
            return Validator.value(value).required('Name is required');
        },
        'data.state_id': function (value = null) {
            return Validator.value(value).required('State is required');
        },
        'data.district_id': function (value = null) {
            return Validator.value(value).required('District is required');
        },
        'data.upazila_id': function (value = null) {
            return Validator.value(value).required('Upazila is required');
        },
        'data.name': function (value = null) {
            return Validator.value(value).required('Name is required');
        },
        "data.contact_no": function (value = null) {
            return Validator.value(value)
                .digit()
                .regex("01+[0-9+-]*$", "Must start with 01.")
                .minLength(11)
                .maxLength(11)
                .required("Contact is required");
        },
    },
}

</script>
