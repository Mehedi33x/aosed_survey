<template>
    <create-form @onSubmit="submit">
        <div class="row custom_row">
            <div class="col-lg-6">
                <fieldset>
                    <span class="legend">Media Images</span>
                    <div class="row g-3 pt-2">
                        <div class="col-xl-4 col-md-6">
                            <div class="form-group">
                                <File title="Logo" cropModalId="logo_crop_modal" field="data.original_logo" mime="img"
                                    fileClassName="file2" accept=".jpg, .jpeg, .png" :showCrop="true"
                                    :vHeight="$root.media_validators?.logo?.min_height ?? 100"
                                    :vWidth="$root.media_validators?.logo?.min_width ?? 300" :vSizeInKb="$root.media_validators?.logo?.max_size ?? 5000
                                        " col="12" />
                                <GlobalCrop id="logo_crop_modal" field="data.original_logo"
                                    v-on:update:modelValue="data.original_logo = $event" :image="image.original_logo"
                                    :aspectRatio="{
                                        aspectRatio:
                                            ($root.media_validators?.logo?.min_width ?? 300) /
                                            ($root.media_validators?.logo?.min_height ?? 100),
                                    }" :minWidth="$root.media_validators?.logo?.min_width ?? 300" :minHeight="$root.media_validators?.logo?.min_height ?? 100
                                        "></GlobalCrop>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="form-group">
                                <File title="Small Logo" cropModalId="logo_small_crop_modal"
                                    field="data.original_logo_small" mime="img" fileClassName="file2"
                                    accept=".jpg, .jpeg, .png" :showCrop="true"
                                    :vHeight="$root.media_validators?.logo_small?.min_height ?? 100"
                                    :vWidth="$root.media_validators?.logo_small?.min_width ?? 300" :vSizeInKb="$root.media_validators?.logo_small?.max_size ?? 5000
                                        " col="12" />
                                <GlobalCrop id="logo_small_crop_modal" field="data.original_logo_small"
                                    v-on:update:modelValue="data.original_logo_small = $event"
                                    :image="image.original_logo_small" :aspectRatio="{
                                        aspectRatio:
                                            ($root.media_validators?.logo_small?.min_width ?? 300) /
                                            ($root.media_validators?.logo_small?.min_height ?? 100),
                                    }" :minWidth="$root.media_validators?.logo_small?.min_width ?? 300" :minHeight="$root.media_validators?.logo_small?.min_height ?? 100
                                        "></GlobalCrop>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="form-group">
                                <File title="Favicon Logo" field="data.favicon" mime="img" fileClassName="file3"
                                    vHeight="200" vWidth="200" vSizeInKb="300" :deleteButton="false" col="12"
                                    :req="true" />
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="col-lg-6">
                <fieldset>
                    <span class="legend">Address</span>
                    <div class="row g-3 pt-2">
                        <div class="col-xl-12">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Textarea title="Address (Optional)" field="data.address" v-model="data.address"
                                        :req="false" col="12" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Textarea title="Map Link (Optional)" field="data.map" v-model="data.map"
                                        :req="false" col="12" rows="3" />
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="col-lg-6">
                <fieldset>
                    <span class="legend">Information</span>
                    <div class="row g-3 pt-2">
                        <div class="col-xl-6 col-md-6">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Input title="Title" field="data.title" v-model="data.title" :req="true" col="12" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Input title="Short Title" field="data.short_title" v-model="data.short_title"
                                        :req="true" col="12" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Input title="Contact Email (Optional)" field="data.contact_email"
                                        v-model="data.contact_email" type="email" :req="false" col="12" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Input title="Feedback Email (Optional)" field="data.feedback_email"
                                        v-model="data.feedback_email" type="email" :req="false" col="12" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Input title="Mobile One (Optional)" field="data.mobile1" v-model="data.mobile1"
                                        type="text" :req="false" col="12" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Input title="Mobile Two (Optional)" field="data.mobile2" v-model="data.mobile2"
                                        type="text" :req="false" col="12" />
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="col-lg-6">
                <fieldset>
                    <span class="legend">Important Links</span>
                    <div class="row g-3 pt-2">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Input title="Web (Optional)" field="data.web" v-model="data.web" type="url"
                                        :req="false" col="12" placeholder="https://abcd.xyz" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Input title="Facebook (Optional)" field="data.fb" v-model="data.fb" type="url"
                                        :req="false" col="12" placeholder="https://facebook.com" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Input title="Twitter (Optional)" field="data.tw" v-model="data.tw" type="url"
                                        :req="false" col="12" placeholder="https://twitter.com" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Input title="Linkedin (Optional)" field="data.ln" v-model="data.ln" type="url"
                                        :req="false" col="12" placeholder="https://linkedin.com" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <Input title="Youtube (Optional)" field="data.yt" v-model="data.yt" type="url"
                                        :req="false" col="12" placeholder="https://youtube.com" />
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="col-lg-6">
                <fieldset>
                    <span class="legend">Color</span>
                    <div class="row g-3 pt-2">
                        <div class="col-xl-6 col-md-6">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <ColorPicker title="Navbar (Optional)" field="data.navbar_color"
                                        v-model="data.navbar_color" col="12" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <ColorPicker title="Breadcrumb (Optional)" field="data.breadcrumb_color"
                                        v-model="data.breadcrumb_color" col="12" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <ColorPicker title="Sidebar (Optional)" field="data.sidebar_color"
                                        v-model="data.sidebar_color" col="12" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <ColorPicker title="Sidebar Footer (Optional)" field="data.sidebar_footer_color"
                                        v-model="data.sidebar_footer_color" col="12" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <div class="form-group">
                                <div class="input-group position-relative">
                                    <ColorPicker title="Sidebar Top (Optional)" field="data.sidebar_top_color"
                                        v-model="data.sidebar_top_color" col="12" />
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </create-form>
</template>

<style scoped>
.image_upload_box .upload_box .img {
    width: 100%;
    height: 100%;
    display: flex;
}
.image_upload_box .upload_box img {
    width: 100% !important;
    height: 100%;
    object-fit: cover;
    border-radius: 50%;
    margin: auto;
}
</style>

<script>
const model = "siteSetting";
import { mapMutations, mapState } from "vuex";

export default {
    computed: {
        ...mapState("setting", ["colors"]),
    },
    data() {
        return {
            page_title: "Site Settings Edit",
            model: model,
            data: {
                logo: "",
                logo_small: "",
                favicon: "",
                sidebar_footer_color: "",
                sidebar_top_color: "",
                sidebar_color: "",
                navbar_color: "",
                breadcrumb_color: "",
            },
            image: {},
        };
    },
    watch: {
        "data.sidebar_footer_color"(current, old) {
            if (current !== old) {
                this.setSidebarFooterColor(current);
            }
        },
        "data.sidebar_top_color"(current, old) {
            if (current !== old) {
                this.setSidebarTopColor(current);
            }
        },
        "data.sidebar_color"(current, old) {
            if (current !== old) {
                this.setSidebarColor(current);
            }
        },
        "data.navbar_color"(current, old) {
            if (current !== old) {
                this.setNavbarColor(current);
            }
        },
        "data.breadcrumb_color"(current, old) {
            if (current !== old) {
                this.setBreadcrumbColor(current);
            }
        },
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
                        "You need to fill " +
                        error +
                        " more empty mandatory fields",
                        "warning"
                    );
                    return false;
                }

                if (res) {
                    var form = document.getElementById("form");
                    var formData = new FormData(form);
                    formData.append("logo_base64", this.data.original_logo);
                    formData.append("logo_small_base64", this.data.original_logo_small);
                    formData.append(
                        "logo_resize_value",
                        this.$root.media_validators?.logo?.resize_value ?? ""
                    );
                    formData.append(
                        "logo_small_resize_value",
                        this.$root.media_validators?.logo_small?.resize_value ?? ""
                    );
                    this.store(this.model, formData);
                }
            });
        },

        getSiteSetting() {
            this.$root.submit = true;
            axios.get(`${this.model}`)
                .then((res) => {
                    this.data = res.data;
                    this.setSidebarFooterColor(res.data.sidebar_footer_color);
                    this.setSidebarTopColor(res.data.sidebar_top_color);
                    this.setSidebarColor(res.data.sidebar_color);
                    this.setNavbarColor(res.data.navbar_color);
                    this.setBreadcrumbColor(res.data.breadcrumb_color);
                }).catch(error => {
                    this.$toast(error.response.data.message ?? "Something went wrong!", "error");
                    console.log(error);
                }).finally(() => {
                    this.$root.submit = false;
                });
        },

        store(model, formData) {
            this.$root.submit = true;
            axios
                .post(`/${model}`, formData)
                .then((response) => {
                    this.$toast("Data updated successfully", "success");
                    this.$router.push({ name: "siteSetting.show" });
                })
                .catch((error) => {
                    this.$toast("Error updating data", "error");
                    console.log(error);
                })
                .finally(() => {
                    this.$root.submit = false;
                });
        },
        ...mapMutations("setting", ["setSidebarFooterColor"]),
        ...mapMutations("setting", ["setSidebarTopColor"]),
        ...mapMutations("setting", ["setFooterColor"]),
        ...mapMutations("setting", ["setNavbarColor"]),
        ...mapMutations("setting", ["setSidebarColor"]),
        ...mapMutations("setting", ["setBreadcrumbColor"]),
    },
    created() {
        this.getSiteSetting();
        this.getMediaValidators("SiteSetting");
    },
    validators: {
        "data.title": function (value = null) {
            return Validator.value(value)
                .maxLength(191)
                .required("Title is required");
        },
        "data.short_title": function (value = null) {
            return Validator.value(value)
                .maxLength(191)
                .required("Short Title is required");
        },
        /* "data.original_logo": function (value = null) {
            return Validator.value(value).required("Logo is required");
        }, */
        "data.favicon": function (value = null) {
            return Validator.value(value).required("Favicon is required");
        },
        "data.web": function (value = null) {
            return Validator.value(value).url();
        },
        "data.fb": function (value = null) {
            return Validator.value(value).url();
        },
        "data.tw": function (value = null) {
            return Validator.value(value).url();
        },
        "data.ln": function (value = null) {
            return Validator.value(value).url();
        },
        "data.yt": function (value = null) {
            return Validator.value(value).url();
        },
        "data.contact_email": function (value = null) {
            return Validator.value(value).email();
        },
        "data.feedback_email": function (value = null) {
            return Validator.value(value).email();
        },
        "data.mobile1": function (value = null) {
            return Validator.value(value).digit().maxLength(20);
        },
        "data.mobile2": function (value = null) {
            return Validator.value(value).digit().maxLength(20);
        },
    },
};
</script>
