<template>
    <create-form @onSubmit="submit">
        <Input v-model="data.name" field="data.name" title="Name" :req="true" />
        <Input title="Sorting" field="data.sorting" v-model="data.sorting" :req="true" col="2" type="number" />
        <Switch v-model="data.status" field="data.status" title="Status" on-label="Active" off-label="Deactive"
            :req="true"></Switch>
    </create-form>
</template>

<script>
const model = "state";

export default {
    data() {
        return {
            model: model,
            page_title: "",
            data: {},
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
                        "You need to fill " +
                        error +
                        " more empty mandatory fields",
                        "warning"
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
    },
    created() {
        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + " Edit";
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.page_title = this.headline(this.model) + " Create";
        }
        this.get_sorting(this.ucfirst(this.model));
    },

    validators: {
        "data.name": function (value = null) {
            return Validator.value(value).required("Name is required");
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
