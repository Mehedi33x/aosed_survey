<template>
    <div>
        <!-- full page loading -->
        <div class="fullpage_loader" v-if="$root.initialLoader || recaptcha_spinner">
            <div class="loader"></div>
        </div>

        <main class="nsl_cms">
            <!-- login area start -->
            <section class="login_area">
                <div
                    class="container d-flex justify-content-center align-items-center"
                >
                    <div class="login_main">
                        <div class="row">
                            <div
                                class="col-lg-6 order-2 order-lg-1 align-self-center"
                            >
                                <div class="image">
                                    <img
                                        :src="`${$root.baseurl}/images/login-img.png`"
                                        alt="login-img"
                                        class="img-fluid w-100"
                                    />
                                </div>
                            </div>
                            <div
                                class="col-lg-6 order-1 order-lg-2 align-self-center"
                            >
                                <div class="login">
                                    <div class="logo text-center">
                                        <img
                                            :src="$root.site.logo_one"
                                            alt="logo"
                                            width="160"
                                        />
                                        <h4 class="name">
                                            {{ $root.site.title }}
                                        </h4>
                                    </div>

                                    <template v-if="reset.flag">
                                        <reset></reset>
                                    </template>

                                    <template v-else>
                                        <template v-if="forgetFlag">
                                            <forget></forget>
                                        </template>

                                        <form v-else @submit.prevent="submit">
                                            <div class="row g-3">
                                                <Input
                                                    id="email"
                                                    title="Email Address"
                                                    v-model="data.email"
                                                    field="data.email"
                                                    required
                                                    placeholder="Enter your Email Address"
                                                    col="12"
                                                    :disabled="$root.spinner"
                                                />
                                                <Input
                                                    id="password"
                                                    title="Password"
                                                    :type="
                                                        visibilityFlag
                                                            ? 'text'
                                                            : 'password'
                                                    "
                                                    v-model="data.password"
                                                    field="data.password"
                                                    required
                                                    placeholder="Enter your Password"
                                                    col="12"
                                                    :disabled="$root.spinner"
                                                >
                                                    <template
                                                        #append_in_input_group
                                                    >
                                                        <button
                                                            class="show_hide_password"
                                                        >
                                                            <svg
                                                                v-if="
                                                                    visibilityFlag ==
                                                                    false
                                                                "
                                                                @click.prevent="
                                                                    toggle(true)
                                                                "
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                width="24"
                                                                height="24"
                                                                viewBox="0 0 24 24"
                                                                fill="none"
                                                                stroke="currentColor"
                                                                stroke-width="2"
                                                                stroke-linecap="round"
                                                                stroke-linejoin="round"
                                                                class="icon icon-tabler icons-tabler-outline icon-tabler-eye"
                                                            >
                                                                <path
                                                                    stroke="none"
                                                                    d="M0 0h24v24H0z"
                                                                    fill="none"
                                                                />
                                                                <path
                                                                    d="M10 12a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"
                                                                />
                                                                <path
                                                                    d="M21 12c-2.4 4 -5.4 6 -9 6c-3.6 0 -6.6 -2 -9 -6c2.4 -4 5.4 -6 9 -6c3.6 0 6.6 2 9 6"
                                                                />
                                                            </svg>
                                                            <!-- close eye -->
                                                            <svg
                                                                v-else
                                                                @click.prevent="
                                                                    toggle(
                                                                        false
                                                                    )
                                                                "
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                width="24"
                                                                height="24"
                                                                viewBox="0 0 24 24"
                                                                fill="none"
                                                                stroke="currentColor"
                                                                stroke-width="2"
                                                                stroke-linecap="round"
                                                                stroke-linejoin="round"
                                                                class="icon icon-tabler icons-tabler-outline icon-tabler-eye-off"
                                                            >
                                                                <path
                                                                    stroke="none"
                                                                    d="M0 0h24v24H0z"
                                                                    fill="none"
                                                                />
                                                                <path
                                                                    d="M10.585 10.587a2 2 0 0 0 2.829 2.828"
                                                                />
                                                                <path
                                                                    d="M16.681 16.673a8.717 8.717 0 0 1 -4.681 1.327c-3.6 0 -6.6 -2 -9 -6c1.272 -2.12 2.712 -3.678 4.32 -4.674m2.86 -1.146a9.055 9.055 0 0 1 1.82 -.18c3.6 0 6.6 2 9 6c-.666 1.11 -1.379 2.067 -2.138 2.87"
                                                                />
                                                                <path
                                                                    d="M3 3l18 18"
                                                                />
                                                            </svg>
                                                        </button>
                                                    </template>
                                                </Input>

                                                <div class="col-12 mt-4">
                                                    <vue-recaptcha
                                                        sitekey="6Led4z8qAAAAABfoLldAmAsFIemmoNVqId3Hmkbb"
                                                        size="normal"
                                                        theme="light"
                                                        :loading-timeout="
                                                            loadingTimeout
                                                        "
                                                        @verify="
                                                            recaptchaVerified
                                                        "
                                                        @expire="
                                                            recaptchaExpired
                                                        "
                                                        @fail="recaptchaFailed"
                                                        @error="recaptchaError"
                                                        ref="vueRecaptcha"
                                                    >
                                                    </vue-recaptcha>
                                                </div>

                                                <div class="col-12 mt-2 text-danger small" style="min-height: 20px;">
                                                    <div>{{ captcha_verify_message }}</div>
                                                    <div>{{ login_error_message }}</div>
                                                </div>

                                                <div class="col-12">
                                                    <button
                                                        type="submit"
                                                        class="theme_btn rounded-2 w-100"
                                                        :disabled="
                                                            $root.spinner
                                                        "
                                                    >
                                                        <template
                                                            v-if="$root.spinner"
                                                        >
                                                            <i
                                                                class="fa fa-spinner fa-spin me-1"
                                                            ></i>
                                                            Processing...
                                                        </template>
                                                        <template v-else>
                                                            Login
                                                        </template>
                                                    </button>
                                                </div>
                                                <div class="col-12 text-center">
                                                    <a
                                                        href="javascript:void(0)"
                                                        @click.prevent="
                                                            toggleForgetFlag(
                                                                true
                                                            )
                                                        "
                                                        class="forgot text-center"
                                                        >Forget your
                                                        password?</a
                                                    >
                                                </div>
                                            </div>
                                        </form>
                                    </template>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- login area end -->
        </main>

        <ValidationMessage />
    </div>
</template>

<script>
import forget from "./components/forget.vue";
import reset from "./components/reset.vue";
import ValidationMessage from "./../../components/elements/ValidationMessage.vue";
import vueRecaptcha from "vue3-recaptcha2";

export default {
    props: {
        token: {
            type: [String, Number],
            default: false,
        },

        email: {
            type: [String],
            default: "",
        },
    },
    components: {
        forget,
        reset,
        ValidationMessage,
        vueRecaptcha,
    },
    data() {
        return {
            data: {
                email: "",
                password: "",
            },
            reset: {
                flag: false,
                token: this.token,
                email: this.email,
            },
            visibilityFlag: false,
            forgetFlag: false,
            loadingTimeout: 60000, // 60 seconds,
            is_captcha_verify: false,
            recaptcha_spinner: true,
            login_error_message: "",
            captcha_verify_message: "",
        };
    },
    provide() {
        return {
            validate: this.validation,
            token: this.reset.token,
            email: this.reset.email,
            resetToken: this.resetToken,
            toggleForgetFlag: this.toggleForgetFlag,
        };
    },
    methods: {
        recaptchaVerified(response) {
            // console.log('verified', response);
            this.is_captcha_verify = true;
            this.captcha_verify_message = "";
        },

        recaptchaExpired() {
            this.$refs.vueRecaptcha.reset();
        },
        recaptchaFailed() {
            // console.log('verify failed')
            this.is_captcha_verify = false;
        },

        recaptchaError(reason) {
            // console.log('captcha error', reason);
            this.is_captcha_verify = false;
        },

        submit() {
            this.captcha_verify_message = "";
            this.login_error_message = "";

            this.$validate().then((res) => {
                if (res) {
                    if (this.is_captcha_verify !== true) {
                        this.captcha_verify_message = "Please, verify captcha!";
                        this.$toast(this.captcha_verify_message, "error");
                        return false;
                    } else {
                        this.captcha_verify_message = "";
                    }

                    if (this.$root.spinner) {
                        return false;
                    }

                    this.$root.spinner = true;
                    axios
                        .post("/nsl-login", this.data)
                        .then((res) => {
                            if (
                                res.status == 200 &&
                                res.data.user instanceof Object
                            ) {
                                this.$store.dispatch(
                                    "auth/loginStore",
                                    res.data
                                );
                                window.location.href =
                                    this.$root.baseurl + "/admin/dashboard";
                            } else {
                                this.$root.spinner = false;
                                this.login_error_message = res.data.message;
                                this.$toast(this.login_error_message, "error");
                            }
                        })
                        .catch((error) => {
                            this.$root.spinner = false;
                            this.login_error_message = "Something went wrong, please try again";
                            this.$toast(this.login_error_message, "error");
                        });
                }
            });
        },
        toggle(value) {
            this.visibilityFlag = value;
        },
        toggleForgetFlag(value) {
            this.forgetFlag = value;
        },
        resetToken() {
            this.reset.token = false;
        },

        recaptchaInit() {
            const recaptchaWidget =
                this.$refs.vueRecaptcha.$el.querySelector("iframe");
            if (recaptchaWidget) {
                // reCAPTCHA is fully loaded (iframe is rendered)
                setTimeout(() => {
                    this.recaptcha_spinner = false;
                }, 300);
            } else {
                // reCAPTCHA is not yet loaded, check again
                setTimeout(this.recaptchaInit, 200); // Retry after a small delay
            }
        },
    },

    watch: {
        token(value) {
            this.reset.flag = true;
            this.reset.token = value;
        },
    },

    created() {
        if (this.token) {
            this.reset.flag = true;
        }
    },

    mounted() {
        this.recaptchaInit();
    },

    validators: {
        "data.email": function (value = null) {
            return Validator.value(value)
                .email()
                .maxLength(100)
                .required("Email is required");
        },
        "data.password": function (value = null) {
            return Validator.value(value)
                .required("Password is required")
                .minLength(6);
        },
    },
};
</script>
