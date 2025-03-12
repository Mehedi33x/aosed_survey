<template>
    <create-form @onSubmit='submit'>
        <Input v-model='data.title' field='data.title' title='Title' :req='true' />
        <Select field="data.type" title="Select Disease Type" col="4" v-model="data.type" label="name"
            :reduce="(obj) => obj.value" :options="allDiseaseTypes" placeholder="--Select One--" :closeOnSelect="true"
            :req="true" />
        <editor v-model="data.description" title="Description" col="12" />
        <Textarea title="Remarks" field="data.remarks" v-model="data.remarks" :req="false" col="12"
            placeholder="How to control" />
        <Input title="Sorting" field="data.sorting" v-model="data.sorting" :req="true" col="2" type="number" />
        <Switch v-model='data.status' field='data.status' title='Status' on-label='Active' off-label='Deactive'
            :req='true'></Switch>
    </create-form>
</template>
<script>

const model = 'disease';
import Editor from '../../../components/Form/CKEditor';

export default {
    components: { Editor },
    data() {
        return {
            model: model,
            page_title: '',
            data: {
                sorting: 0,
                status: 'active',
                description: "",
                remarks: "",
            },
            allDiseaseTypes: [],
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

                var form = document.getElementById("form");
                var formData = new FormData(form);
                formData.append("title", this.data.title);
                formData.append("type", this.data.type);
                formData.append("description", this.data.description ? this.data.description : " ");
                formData.append("remarks", this.data.remarks ? this.data.remarks : "");

                if (res) {
                    if (this.data.id) {
                        this.update(this.model, formData, this.data.id, true);
                    } else {
                        this.store(this.model, formData);
                    }
                }
            });
        },
        getDiseaseTypes() {
            axios.get('/get-disease-type').then((res) => (
                this.allDiseaseTypes = res.data));

        }
    },
    created() {
        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + ' Edit';
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.page_title = this.headline(this.model) + ' Create';
        }
        this.get_sorting(this.ucfirst(this.model));
        this.getDiseaseTypes();
    },

    validators: {
        'data.title': function (value = null) {
            return Validator.value(value).required('Title is required');
        },
        'data.type': function (value = null) {
            return Validator.value(value).required('Type is required');
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
}

</script>
