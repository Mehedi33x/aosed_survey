<template>
    <div :class="`col-md-${col} align-self-center`">
        <div class="form-group">
            <label :for="id ?? `input-${uuid}`"
                class="form-label d-flex justify-content-between align-items-center gap-4">
                <div class="lft">
                    <slot name="title"> {{ title }} </slot>
                    <sup v-if="req || required" class="text-danger ms-1">*</sup>
                    <!-- icon error -->
                    <span class="icon_error" v-if="has_error">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            fill="currentColor" class="icon icon-tabler icons-tabler-filled icon-tabler-help-octagon">
                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                            <path
                                d="M14.897 1a4 4 0 0 1 2.664 1.016l.165 .156l4.1 4.1a4 4 0 0 1 1.168 2.605l.006 .227v5.794a4 4 0 0 1 -1.016 2.664l-.156 .165l-4.1 4.1a4 4 0 0 1 -2.603 1.168l-.227 .006h-5.795a3.999 3.999 0 0 1 -2.664 -1.017l-.165 -.156l-4.1 -4.1a4 4 0 0 1 -1.168 -2.604l-.006 -.227v-5.794a4 4 0 0 1 1.016 -2.664l.156 -.165l4.1 -4.1a4 4 0 0 1 2.605 -1.168l.227 -.006h5.793zm-2.897 14a1 1 0 0 0 -.993 .883l-.007 .117l.007 .127a1 1 0 0 0 1.986 0l.007 -.117l-.007 -.127a1 1 0 0 0 -.993 -.883zm1.368 -6.673a2.98 2.98 0 0 0 -3.631 .728a1 1 0 0 0 1.44 1.383l.171 -.18a.98 .98 0 0 1 1.11 -.15a1 1 0 0 1 -.34 1.886l-.232 .012a1 1 0 0 0 .111 1.994a3 3 0 0 0 1.371 -5.673z" />
                        </svg>
                        <span class="error_info active_error_info">
                            {{ error_message }}
                        </span>
                    </span>
                </div>
            </label>

            <div :id="id ?? `input-${uuid}`" class="radio_box" :class="{ 'border-red': has_error }">
                <div class="form-check" v-for="(item, key) in list" :key="key">
                    <input class="form-check-input shadow-none" type="radio"
                        :id="id ? `${id}-${key}` : `input-${uuid}-${key}`"
                        @input="$emit('update:modelValue', $event.target.value)" :value="item.value" :name="fieldName"
                        :checked="isCheckedOrNot(item.value)" />
                    <label class="form-check-label" :for="id ? `${id}-${key}` : `input-${uuid}-${key}`">
                        {{ item.title }}
                    </label>
                </div>
                <a v-if="showResetButton" href="javascript:void(0)" @click="resetRadio" class="form-check ps-0"
                    style="color: #141314;">
                    <i class="fa fa-refresh reset-icon" aria-hidden="true" style="font-size: 13px;"></i>
                    <label class="form-check-label ps-1">
                     Reset
                    </label>
                </a>

            </div>
        </div>
    </div>
</template>

<script>
import { v4 as uuidv4 } from "uuid";

export default {
    data() {
        return {
            has_error: false,
            error_message: "",
            uuid: uuidv4(),
        };
    },

    props: {
        id: {
            type: String,
            default: null,
        },

        modelValue: {
            type: [String, Number],
        },
        title: {
            type: String,
        },
        list: {
            type: [Array, Object],
        },
        field: {
            type: String,
        },
        col: {
            type: String,
            default: "6",
        },
        req: {
            type: Boolean,
            default: false,
        },
        required: {
            type: Boolean,
            default: false,
        },

        isChecked: {
            type: Boolean,
            default: false,
        },
        showResetButton: {
            type: Boolean,
            default: false
        }
    },

    inject: ["validate"],

    computed: {
        fieldName() {
            return this.field.split(".").pop();
        },
    },

    methods: {
        getClass() {
            let col = this.col ? this.col : 2;
            let className = "col-lg-" + col + " ";
            return className;
        },
        isCheckedOrNot(item) {
            if (item == "active") {
                if (this.isChecked) {
                    return true;
                }
            }

            if (this.modelValue == item) {
                return true;
            }
        },
        // Reset the radio selection
        resetRadio() {
            this.$emit('update:modelValue', null); // or use the default value if needed
        },
    },

    watch: {
        "validate.errors": {
            immediate: true,
            handler() {
                if (this.validate.errors.length > 0) {
                    for (let i = 0; i < this.validate.errors.length; i++) {
                        if (this.field === this.validate.errors[i].field) {
                            this.has_error = true;
                            this.error_message =
                                this.validate.errors[i].message;
                            break;
                        } else {
                            this.has_error = false;
                            this.error_message = "";
                        }
                    }
                } else {
                    this.has_error = false;
                    this.error_message = "";
                }
            },
        },
    },
};
</script>
