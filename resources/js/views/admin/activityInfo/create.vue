<template>
    <create-form @onSubmit='submit'>
        <Select title="Project" v-model="data.project_id" field="data.project_id" label="project_name"
            :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--" :closeOnSelect="true"
            :required="true" col="4" :req="true" @update:modelValue="getIndicatorsByProject(data.project_id)" />

        <Select title="Project Indicator" v-model="data.indicator_id" field="data.indicator_id" label="title"
            :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--" :closeOnSelect="true"
            :required="true" col="4" @update:modelValue="getActivityByIndicator(data.indicator_id)" />

        <Select title="Project Activity" v-model="data.activity_id" field="data.activity_id" label="title"
            :reduce="(obj) => obj.id" :options="allActivity" placeholder="--Select One--" :closeOnSelect="true"
            :required="true" col="4" />
        <Select title="Group" v-model="data.group_id" field="data.group_id" label="title" :reduce="(obj) => obj.id"
            :options="allGroups" placeholder="--Select One--" :closeOnSelect="true" :required="false" col="4" />

        <date-picker id="date1" field="data.execute_date" name="Execute Date" v-model="data.execute_date"
            title="Execute Date" placeholder="dd/mm/yyyy" :req="true" col="4" :disableFutureDates="true"></date-picker>
        <Input v-model="data.total_beneficiary" field="data.total_beneficiary" title="Total Beneficiary" type="number"
            col="4" />
        <div class="row mt-3">
            <div class="col-xl-2 col-lg-4 col-md-6">
                <File title="File" field="data.file" mime=".pdf" fileClassName="data.file" :req="false" col="12"
                    vSizeInKb="10240" vType="pdf" />
            </div>
            <div class="col-xl-2 col-lg-4 col-md-6">
                <File title="Image" field="data.original_image" mime="img" fileClassName="file2" :showCrop="true"
                    :vHeight="$root.media_validators?.image?.min_height ?? 300"
                    :vWidth="$root.media_validators?.image?.min_width ?? 300"
                    :vSizeInKb="$root.media_validators?.image?.max_size ?? 800" col="12 col-12" />
                <GlobalCrop field="data.original_image" v-on:update:modelValue="data.original_image = $event"
                    :image="image.original_image" :aspectRatio="{
                        aspectRatio:
                            ($root.media_validators?.image?.min_width ?? 300) /
                            ($root.media_validators?.image?.min_height ?? 300),
                    }" :minWidth="$root.media_validators?.image?.min_width ?? 300"
                    :minHeight="$root.media_validators?.image?.min_height ?? 300">
                </GlobalCrop>
            </div>
            <div class="col-xl-8 col-lg-4 col-md-12">
                <Textarea title="Remarks" field="data.remarks" v-model="data.remarks" :rows="7" :req="false" col="12" />
            </div>
        </div>
    </create-form>
</template>

<script>
import axios from 'axios';
import moment from 'moment';
const model = 'activityInfo';

export default {

    data() {
        return {
            model: model,
            page_title: '',
            data: {
                file: null,
                // fileName: "",
                // fileUrl: null,
                status: 'active',
                execute_date: moment().format('DD MMMM, YYYY'),
                total_beneficiary: 0,
            },
            image: { original_image: "" },
            allProjects: [],
            allIndicators: [],
            allActivity: [],
            allGroups: [],

        };
    },

    provide() {
        return {
            validate: this.validation,
            data: () => this.data,
            image: this.image,
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
                    const formData = new FormData();
                    formData.append("project_id", this.data.project_id ?? "");
                    formData.append("indicator_id", this.data.indicator_id ?? "");
                    formData.append("activity_id", this.data.activity_id ?? "");
                    formData.append("group_id", this.data.group_id ?? "");
                    formData.append("execute_date", this.data.execute_date ?? "");
                    formData.append("total_beneficiary", this.data.total_beneficiary ?? "");
                    formData.append("remarks", this.data.remarks ?? "");
                    /* if (this.data.file instanceof File) {
                        formData.append("file", this.data.file);
                    } else {
                        formData.append("file", "");
                    } */
                    formData.append("file", this.data.file ? this.data.file : "");

                    if (this.data.original_image) {
                        formData.append("image_base64", this.data.original_image);
                    }
                    formData.append("image_resize_value", this.$root.media_validators?.image?.resize_value ?? "");
                    if (this.data.id) {
                        this.update(this.model, formData, this.data.id, true);
                    } else {
                        this.store(this.model, formData);
                    }
                }
            });
        },
        /*  onFileChange(event) {
             const file = event.target.files[0];
             if (file && file.type === "application/pdf") {
                 this.data.file = file;
                 this.data.fileName = file.name;
             } else {
                 this.$toast('Please select a PDF file only.', 'warning');
                 event.target.value = "";
             }
         }, */

        /* viewFile(file) {
            let fileUrl;
            if (file instanceof File) {
                fileUrl = URL.createObjectURL(file);
                window.open(fileUrl, "_blank");
            }
            else if (typeof file === "string") {
                fileUrl = `${this.$root.baseurl}/public/storage/${file}`;
                window.open(fileUrl, "_blank");
            }
            if (file instanceof File && fileUrl) {
                URL.revokeObjectURL(fileUrl);
            }
        }, */

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
            if (id !== null) {
                this.getActivity(id);
            }
        },
        getActivity(id) {
            axios.get("/get-activities", { params: { id: id, status: "active" } })
                .then((res) => (this.allActivity = res.data))
                .catch(error => console.error('Error fetching activities:', error));
        },
        getGroups() {
            axios.get("/get-all-groups", { params: { status: "active" } }).then((res) => (this.allGroups = res.data));
        },
    },

    beforeDestroy() {
        if (this.data.fileUrl) {
            URL.revokeObjectURL(this.data.fileUrl);
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
        this.getGroups();
    },

    validators: {
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
        "data.execute_date": function (value = null) {
            return Validator.value(value).required("Execute date is required");
        },
    },
}

</script>
