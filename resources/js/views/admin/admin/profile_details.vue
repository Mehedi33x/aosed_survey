<template>
    <div class="content_main">
        <div class="component_loader" v-if="$root.spinner && !$root.tableSpinner">
            <div class="loader"></div>
        </div>
        
        <div class="base_tabs">
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation"><button class="nav-link active" id="pills-profile-tab"
                        data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab"
                        aria-controls="pills-profile" aria-selected="true">
                        <div class="icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round"
                                class="svg_icon icon icon-tabler icons-tabler-outline icon-tabler-user-scan">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M10 9a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" />
                                <path d="M4 8v-2a2 2 0 0 1 2 -2h2" />
                                <path d="M4 16v2a2 2 0 0 0 2 2h2" />
                                <path d="M16 4h2a2 2 0 0 1 2 2v2" />
                                <path d="M16 20h2a2 2 0 0 0 2 -2v-2" />
                                <path d="M8 16a2 2 0 0 1 2 -2h4a2 2 0 0 1 2 2" />
                            </svg>
                        </div>
                        <div class="text">
                            <h4 class="title">Profile Information</h4>
                        </div>
                    </button></li>
                <li class="nav-item" role="presentation"><button class="nav-link" id="pills-contact-tab"
                        data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab"
                        aria-controls="pills-contact" aria-selected="false">
                        <div class="icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round"
                                class="svg_icon icon icon-tabler icons-tabler-outline icon-tabler-brand-samsungpass">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path
                                    d="M4 10m0 2a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v7a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2z" />
                                <path d="M7 10v-1.862c0 -2.838 2.239 -5.138 5 -5.138s5 2.3 5 5.138v1.862" />
                                <path
                                    d="M10.485 17.577c.337 .29 .7 .423 1.515 .423h.413c.323 0 .633 -.133 .862 -.368a1.27 1.27 0 0 0 .356 -.886c0 -.332 -.128 -.65 -.356 -.886a1.203 1.203 0 0 0 -.862 -.368h-.826a1.2 1.2 0 0 1 -.861 -.367a1.27 1.27 0 0 1 -.356 -.886c0 -.332 .128 -.651 .356 -.886a1.2 1.2 0 0 1 .861 -.368h.413c.816 0 1.178 .133 1.515 .423" />
                            </svg>
                        </div>
                        <div class="text">
                            <h4 class="title">Change Password</h4>
                        </div>
                    </button></li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade active show" id="pills-profile" role="tabpanel"
                    aria-labelledby="pills-profile-tab" tabindex="0">
                    <div class="profile_page">
                        <div class="row g-3">
                            <div class="col-xxl-9 col-xl-8">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card_title">Personal Information</h4>
                                        <form id="updateInfoForm" @submit.prevent="updateInformation">
                                            <div class="row g-2">
                                                <Input v-model="data.name" field="data.name" title="Name"
                                                    col="4 col-xl-4" />
                                                <v-select-container title="Gender">
                                                    <v-select v-model="data.gender" label="name"
                                                        :reduce="(obj) => obj.value" :options="types"
                                                        placeholder="--Select Gender--" col="4 col-xl-4"
                                                        :closeOnSelect="true"></v-select></v-select-container>
                                                <Input v-model="data.mobile" field="data.mobile" title="Mobile"
                                                    col="4 col-xl-4" />
                                                <Input v-model="data.email" field="data.email" title="Email"
                                                    col="4 col-xl-4" type="email" :disabled="isEmailDisabled" />

                                                <Input v-model="data.birth_date" field="data.birth_date"
                                                    title="Birthdate" col="4 col-xl-4" type="date" />
                                                <div class="col-xl-12 col-md-12">
                                                    <div class="form-group">
                                                        <label
                                                            class="form-label d-flex justify-content-between align-items-center gap-4">
                                                            <div class="lft">
                                                                Description
                                                            </div>
                                                        </label>
                                                        <div class="input-group position-relative">
                                                            <textarea v-model="data.description"
                                                                field="data.description" title="Description" rows="6"
                                                                class="textarea-control h-auto"
                                                                placeholder="Write your description"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- <textarea v-model="data.description" field="data.description"
                                                    title="Description" :req="true" col="12 col-xl-12" rows="6"
                                                    placeholder="Write your description" /> -->

                                                <div class="col-lg-12">
                                                    <h4 class="card_title mt-3 mb-0">Address Information</h4>
                                                </div>
                                                <Input v-model="data.address" field="data.address" title="Address"
                                                    col="8 col-xl-6" placeholder="Enter your address" />
                                                <Input v-model="data.city" field="data.city" title="City"
                                                    col="4 col-xl-6" placeholder="Enter your city" />
                                                <Input v-model="data.state" field="data.state" title="State"
                                                    col="8 col-xl-6" placeholder="Enter your state" />
                                                <Input v-model="data.zip_code" field="data.zip_code" title="Zip Code"
                                                    col="4 col-xl-6" placeholder="Enter your zip code" />

                                                <div class="col-12">
                                                    <button type="submit" class="theme_btn" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Save Profile" v-x-tooltip>Save Profile</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xxl-3 col-xl-4">
                                <div class="profile_info">
                                    <div class="row g-3">
                                        <div class="col-md-6 col-xl-12">
                                            <div class="card overflow-hidden custom_profile_image_upload">
                                                <div class="bg">
                                                </div>
                                                <div class="card-body p-0">
                                                    <div class="profile_image">
                                                        <div class="image position-relative">
                                                            <File field="data.profile" mime="img" fileClassName="file2"
                                                                :showCrop="true" col="12" vHeight="600" vWidth="600"
                                                                vSizeInKb="500" />
                                                            <GlobalCrop field="data.profile"
                                                                v-on:update:modelValue="data.profile = $event"
                                                                :image="image.profile"
                                                                :aspectRatio="{ aspectRatio: 600 / 600 }"
                                                                :minWidth="600" :minHeight="600">
                                                            </GlobalCrop>

                                                        </div>
                                                    </div>
                                                    <div class="profile_text text-center">
                                                        <h3 class="name">{{ data?.name ?? "" }}</h3>
                                                        <p class="designation">{{ data?.role?.name ?? "" }}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xl-12">
                                            <div class="card overflow-hidden">
                                                <div class="card-body">
                                                    <div class="profile_description">
                                                        <h4 class="card_title mb-2">About Me</h4>
                                                        <p class="p_1">{{ data?.description ?? "" }}</p>
                                                        <h4 class="card_title my-3">Personal Information</h4>
                                                        <div class="info_item d-flex align-items-center gap-3">
                                                            <div class="icon">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                    height="24" viewBox="0 0 24 24" fill="none"
                                                                    stroke="currentColor" stroke-width="2"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="icon icon-tabler icons-tabler-outline icon-tabler-mail"
                                                                    data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Email Address" v-x-tooltip
                                                                    >
                                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                                    <path
                                                                        d="M3 7a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v10a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2v-10z" />
                                                                    <path d="M3 7l9 6l9 -6" />
                                                                </svg>
                                                            </div>
                                                            <div class="info">
                                                                <h5 class="title">Email Address</h5>
                                                                <p>{{ data?.email ?? "" }}</p>
                                                            </div>
                                                        </div>
                                                        <div class="info_item d-flex align-items-center gap-3">
                                                            <div class="icon">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                    height="24" viewBox="0 0 24 24" fill="none"
                                                                    stroke="currentColor" stroke-width="2"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="icon icon-tabler icons-tabler-outline icon-tabler-phone"
                                                                    data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Phone" v-x-tooltip
                                                                    >
                                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                                    <path
                                                                        d="M5 4h4l2 5l-2.5 1.5a11 11 0 0 0 5 5l1.5 -2.5l5 2v4a2 2 0 0 1 -2 2a16 16 0 0 1 -15 -15a2 2 0 0 1 2 -2" />
                                                                </svg>
                                                            </div>
                                                            <div class="info">
                                                                <h5 class="title">Phone Number</h5>
                                                                <p>{{ data?.mobile ?? "" }}</p>
                                                            </div>
                                                        </div>
                                                        <div class="info_item d-flex align-items-center gap-3">
                                                            <div class="icon">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                    height="24" viewBox="0 0 24 24" fill="none"
                                                                    stroke="currentColor" stroke-width="2"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    class="icon icon-tabler icons-tabler-outline icon-tabler-map-pin"
                                                                    data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Location" v-x-tooltip
                                                                    >
                                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                                    <path d="M9 11a3 3 0 1 0 6 0a3 3 0 0 0 -6 0" />
                                                                    <path
                                                                        d="M17.657 16.657l-4.243 4.243a2 2 0 0 1 -2.827 0l-4.244 -4.243a8 8 0 1 1 11.314 0z" />
                                                                </svg>
                                                            </div>
                                                            <div class="info">
                                                                <h5 class="title">Location</h5>
                                                                <p>{{ data?.address ?? "" }}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab"
                    tabindex="0">
                    <div class="card">
                        <div class="card-body">
                            <form id="changePassword" @submit.prevent="changePassword">
                                <div class="row g-3 align-items-center">
                                    <Input v-model="change_pass.old_password" field="change_pass.old_password"
                                        title="Old password" col="6" :req="true" type="password" />

                                    <Input v-model="change_pass.confirm_password" field="change_pass.confirm_password"
                                        title="New password" col="6" :req="true" type="password" />

                                    <Input v-model="change_pass.new_password" field="change_pass.new_password"
                                        title="Confirm password" col="6" :req="true" type="password" />

                                    <div class="col-12">
                                        <Button title="Update" process="" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
const model = "admin";


export default {
    data() {
        return {
            model: model,
            image: { image: "" },
            data: { profile: "" },
            password_option: false,
            isEmailDisabled: true,
            data: {
                email: '',
            },
            pass_verify: false,
            change_pass: {},
            types: [
                { name: "Male", value: "Male" },
                { name: "Female", value: "Female" },
                { name: "Other", value: "Other" },

            ],

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

        updateInformation() {
            const error = this.validation.countErrors();
            this.$validate().then((res) => {
                if (res) {
                    this.$root.submit = true;
                    this.$root.spinner = true;
                    var form = document.getElementById("updateInfoForm");
                    var formData = new FormData(form);
                    formData.append("gender", this.data.gender);
                    formData.append("birth_date", this.data.birth_date);
                    formData.append("description", this.data.description);
                    formData.append("profile_base64", this.data.profile);
                    formData.append("address", this.data.address ? this.data.address : "");
                    formData.append("zip_code", this.data.zip_code);
                    formData.append("road_number", this.data.road_number);
                    formData.append("_method", "put");

                    axios
                        .post("/admin/" + this.$route.params.id, formData)
                        .then((res) => {
                            this.$toast(res.data.message, "success");
                            this.get_data(this.model, this.$route.params.id, "data");

                            axios
                                .get("/initialize-systems")
                                .then((res) => {

                                    this.$store.dispatch("global/setGlobal", res.data);
                                    this.$store.dispatch("auth/loginStore", res.data);
                                })
                                .catch((e) => {
                                    console.log(e);
                                });
                        })
                        .catch((error) => {
                            if (error.response && error.response.status === 422) {
                                this.$toast(error.response.data.message, "warning");
                            } else {
                                this.$toast("Something went wrong!", "error");
                            }
                        })
                        .finally(() => {
                            setTimeout(() => {
                                this.$root.submit = false;
                                this.$root.spinner = false;
                            }, 100);
                        });
                }
            });
        },
        handleFileUpload(event) {
            const type = event.target.files[0].type;
            if (
                type !== "image/jpeg" &&
                type !== "image/jpeg" &&
                type !== "image/png"
            ) {
                this.$toast("File must be of type image (.jpg/png)", "error");
                return;
            }
            this.image.profile = event.target.files[0];
            this.data.profile = URL.createObjectURL(this.image.profile);
            this.image.profile = this.data.profile;
            $("#showCropModal").modal("show");
        },
        onFileChange(e, model, fileClass, pdf = null) {
            this.showImage(e, model, model, fileClass, pdf);
        },
        passwordOption(type) {
            this.password_option = type;
        },
        changePassword() {
            this.$validate().then((res) => {
                const error = this.validation.countErrors();
                if (error > 0) {
                    this.$toast(
                        "You need to fill " + error + " more empty mandatory fields",
                        "warning"
                    );
                }

                if (res) {
                    this.$root.submit = true;
                    axios
                        .post("/change-password", this.change_pass)
                        .then((res) => {
                            this.$toast(res.data.message, "success");
                            this.logout();
                        })
                        .catch((error) => {
                            console.log(error);
                            if (error.response && error.response.status === 422) {
                                this.$toast(error.response.data.message, "warning");
                            } else {
                                this.$toast("Something went wrong!", "error");
                            }
                            setTimeout(() => (this.$root.submit = false), 200);
                        })
                        .then((alw) => setTimeout(() => (this.$root.submit = false), 200));
                }
            });
        },
        async logout() {
            const res = await this.callApi("post", "logout");
            if (res.status == 200) {
                this.$store.dispatch("auth/logout");
                this.$toast(res.data.message, "success");
                window.location.href = this.$root.baseurl + "/nsl-admin";
            }
        },
    },
    created() {
        this.$root.spinner = true;
        // console.log('ok', this.$root.spinner);

        this.change_pass.id = this.$route.params.id;
        this.get_data(`${this.model}/${this.$route.params.id}`); // get data
        this.setBreadcrumbs(this.model, "view"); // Set Breadcrumbs
    },

    // ================== validation rule for form ==================
    validators: {
        "data.name": function (value = null) {
            if (!this.password_option) {
                return Validator.value(value).required("Name is required");
            }
        },
        "data.mobile": function (value = null) {
            if (!this.password_option) {
                return Validator.value(value)
                    .digit()
                    .regex("01+[0-9+-]*$", "Must start with 01.")
                    .minLength(11)
                    .maxLength(15);
            }
        },
        "change_pass.old_password": function (value = null) {
            var app = this;
            if (this.password_option) {
                return Validator.value(value)
                    .required("Old password is required")
                    .minLength(6)
                    .custom(function () { });
            }
        },
        "change_pass.new_password": function (value = null) {
            if (this.password_option && this.pass_verify) {
                return Validator.value(value)
                    .required("New password is required")
                    .minLength(6);
            }
        },
        "change_pass.confirm_password, change_pass.new_password": function (
            confirm_password = null,
            new_password = null
        ) {
            if (this.password_option && this.pass_verify) {
                return Validator.value(confirm_password)
                    .required("Password confirmation is required")
                    .match(new_password);
            }
        },
    },
};
</script>
