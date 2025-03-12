<template>
    <div :class="getClass()" class="col-sm-4">
        <div class="mt-3 mt-lg-0">

            <label
                :for="id ?? `input-${uuid}`"
                class="form-label d-flex justify-content-between align-items-center gap-4"
            >
                <div class="lft">
                    <slot name="title"> {{ title }} </slot>
                    <sup v-if="req || required" class="text-danger ms-1">*</sup>
                    <!-- icon error -->
                    <span class="icon_error" v-if="has_error">
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="currentColor"
                            class="icon icon-tabler icons-tabler-filled icon-tabler-help-octagon"
                        >
                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                            <path
                                d="M14.897 1a4 4 0 0 1 2.664 1.016l.165 .156l4.1 4.1a4 4 0 0 1 1.168 2.605l.006 .227v5.794a4 4 0 0 1 -1.016 2.664l-.156 .165l-4.1 4.1a4 4 0 0 1 -2.603 1.168l-.227 .006h-5.795a3.999 3.999 0 0 1 -2.664 -1.017l-.165 -.156l-4.1 -4.1a4 4 0 0 1 -1.168 -2.604l-.006 -.227v-5.794a4 4 0 0 1 1.016 -2.664l.156 -.165l4.1 -4.1a4 4 0 0 1 2.605 -1.168l.227 -.006h5.793zm-2.897 14a1 1 0 0 0 -.993 .883l-.007 .117l.007 .127a1 1 0 0 0 1.986 0l.007 -.117l-.007 -.127a1 1 0 0 0 -.993 -.883zm1.368 -6.673a2.98 2.98 0 0 0 -3.631 .728a1 1 0 0 0 1.44 1.383l.171 -.18a.98 .98 0 0 1 1.11 -.15a1 1 0 0 1 -.34 1.886l-.232 .012a1 1 0 0 0 .111 1.994a3 3 0 0 0 1.371 -5.673z"
                            />
                        </svg>
                        <span class="error_info active_error_info">
                            {{ error_message }}
                        </span>
                    </span>
                </div>
            </label>
            <slot></slot>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        modelValue: {
            type: [String, Number],
        },
        title: {
            type: String,
        },
        field: {
            type: String,
        },
        type: {
            type: String,
            default: "text",
        },
        col: {
            type: [String, Number],
        },
        req: {
            type: Boolean,
            default: false,
        },
    },

    inject: ["validate"],
    computed: {
        fieldName() {
            return this.field.split(".").pop();
        },
    },
    methods: {
        getClass() {
            let col = this.col ? this.col : 3;
            let className = "col-lg-" + col + " ";
            return className;
        },

        getIcon() {
            let errorStatus = this.validate.hasError(this.field);
            console.log(errorStatus);

            if (errorStatus && this.req) {
                console.log('acji');

                $(".vs__dropdown-toggle").addClass("border-danger");
                return "position-absolute bg-danger text-white floating-tooltip text-center";
            } else if (this.field) {
                $(".vs__dropdown-toggle").removeClass("border-danger");
                $(".vs__dropdown-toggle").addClass("border-success");
                return "";
            }
        },
    },
};
</script>

<style>
.vs__dropdown-menu li {
    color: #555;
}
.vs__search:focus {
    color: #555 !important;
}
.vs__dropdown-option--highlight {
    color: #fff !important;
}
.vs__search,
.vs__search:focus {
    margin: 5px 0 0 !important;
}
.icon-color {
    color: rgb(119 126 221);
}
span.selection{
    width: 100%;
}
.select2-container--default .select2-selection--multiple{
    background-color: white !important;
    border: 1px solid #e1e3e1 !important;
    border-radius: 8px !important;
    cursor: text !important;
    min-height: 40px !important;
    display: flex !important;
    align-items: center !important;
}
.select2-container--default .select2-selection--multiple .select2-selection__choice{
    margin-top: 0 !important;
}
</style>
