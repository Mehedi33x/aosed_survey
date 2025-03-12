<template>
    <create-form @onSubmit='submit'>
        <div class="col-lg-12">
            <Fieldset>
                <template #name>Project Achievement Setup</template>
                <template #content>
                    <Select title="Select Project" v-model="data.project_id" field="data.project_id"
                        label="project_name" :reduce="(obj) => obj.id" :options="allProjects"
                        placeholder="--Select One--" :closeOnSelect="true" :required="false" col="4" :req="true"
                        @update:modelValue="getIndicatorsByProject(data.project_id)" />

                    <Select title="Select Indicator" v-model="data.indicator_id" field="data.indicator_id" label="title"
                        :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--"
                        :closeOnSelect="true" :required="false" col="4" />
                    <!-- <small v-if="duplicateError" class="text-danger">{{ duplicateError }}</small> -->


                    <Input v-if="data.indicator_id" v-model="selectedIndicator.total_mark"
                        field="selectedIndicator.total_mark" title="Total Mark" col="3" type="number" disabled
                        @input="validatePositive(selectedIndicator.total_mark, 'total_mark')" />

                    <Input v-if="data.indicator_id" v-model="selectedIndicator.achivement_percentage"
                        field="selectedIndicator.achivement_percentage" title="Achivement Percentage" type="number"
                        col="3" disabled />
                    <div class="col-lg-3" v-if="data.indicator_id">
                        <div class="d-flex align-items-center h-100">
                            <p class="custome_weight">Total Acceptable Attendance: {{ attendanceCount }}</p>
                        </div>
                    </div>
                    <div class="col-lg-3" v-if="data.indicator_id">
                        <div class="d-flex align-items-center h-100">
                            <p class="custome_weight">Total Surveyable Activities: {{ surveyableCount }}</p>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <Input v-model="data.activity_point" field="data.activity_point" title="Activity Point"
                            type="number" col="12" @input="validatePositive(data.activity_point, 'activity_point')" />
                        <small v-if="validationErrors.activity_point" class="text-danger">
                            {{ validationErrors.activity_point }}
                        </small>
                        <small v-if="validationErrors.current_mark" class="text-danger">
                            {{ validationErrors.current_mark }}
                        </small>
                    </div>
                    <Switch v-model="data.status" field="data.status" title="Status" on-label="Active"
                        off-label="Deactive" :req="true" col="3"></Switch>
                </template>
            </Fieldset>
        </div>

        <div class="row g-3">
            <div class="col-lg-6">
                <Fieldset>
                    <template #name>Activity Attendance</template>
                    <template #content>
                        <div class="col-md-6">
                            <Input v-model="data.activity_att_lt_30" field="data.activity_att_lt_30"
                                title="Less Than 30" col="10" type="number"
                                @input="validatePositive(data.activity_att_lt_30, 'activity_att_lt_30')" />
                            <small v-if="validationErrors.activity_att_lt_30" class="text-danger">{{
                                validationErrors.activity_att_lt_30 }}</small>
                        </div>
                        <div class="col-md-6">
                            <Input v-model="data.activity_att_lt_50" field="data.activity_att_lt_50"
                                title="Less Than 50" col="10" type="number"
                                @input="validatePositive(data.activity_att_lt_50, 'activity_att_lt_50')" />
                            <small v-if="validationErrors.activity_att_lt_50" class="text-danger">{{
                                validationErrors.activity_att_lt_50 }}</small>
                        </div>
                        <div class="col-md-6">
                            <Input v-model="data.activity_att_lt_80" field="data.activity_att_lt_80"
                                title="Less Than 80" col="10" type="number"
                                @input="validatePositive(data.activity_att_lt_80, 'activity_att_lt_80')" />
                            <small v-if="validationErrors.activity_att_lt_80" class="text-danger">{{
                                validationErrors.activity_att_lt_80 }}</small>
                        </div>
                        <div class="col-md-6">
                            <Input v-model="data.activity_att_lt_100" field="data.activity_att_lt_100"
                                title="Less Than 100" col="10" type="number"
                                @input="validatePositive(data.activity_att_lt_100, 'activity_att_lt_100')" />
                            <small v-if="validationErrors.activity_att_lt_100" class="text-danger">{{
                                validationErrors.activity_att_lt_100 }}</small>
                        </div>
                    </template>
                </Fieldset>
            </div>

            <div class="col-lg-6">
                <Fieldset>
                    <template #name>Average Survey Point</template>
                    <template #content>
                        <div class="col-md-6">
                            <Input v-model="data.survey_point_lt_30" field="data.survey_point_lt_30"
                                title="Less Than 30" col="10" type="number"
                                @input="validatePositive(data.survey_point_lt_30, 'survey_point_lt_30')" />
                            <small v-if="validationErrors.survey_point_lt_30" class="text-danger">{{
                                validationErrors.survey_point_lt_30 }}</small>
                        </div>
                        <div class="col-md-6">
                            <Input v-model="data.survey_point_lt_50" field="data.survey_point_lt_50"
                                title="Less Than 50" col="10" type="number"
                                @input="validatePositive(data.survey_point_lt_50, 'survey_point_lt_50')" />
                            <small v-if="validationErrors.survey_point_lt_50" class="text-danger">{{
                                validationErrors.survey_point_lt_50 }}</small>
                        </div>
                        <div class="col-md-6">
                            <Input v-model="data.survey_point_lt_80" field="data.survey_point_lt_80"
                                title="Less Than 80" col="10" type="number"
                                @input="validatePositive(data.survey_point_lt_80, 'survey_point_lt_80')" />
                            <small v-if="validationErrors.survey_point_lt_80" class="text-danger">{{
                                validationErrors.survey_point_lt_80 }}</small>
                        </div>
                        <div class="col-md-6">
                            <Input v-model="data.survey_point_lt_100" field="data.survey_point_lt_100"
                                title="Less Than 100" col="10" type="number"
                                @input="validatePositive(data.survey_point_lt_100, 'survey_point_lt_100')" />
                            <small v-if="validationErrors.survey_point_lt_100" class="text-danger">{{
                                validationErrors.survey_point_lt_100 }}</small>
                        </div>
                    </template>
                </Fieldset>
            </div>
        </div>
    </create-form>
</template>


<script>
const model = 'projectAchievementSetup';

export default {
    data() {
        return {
            model: model,
            page_title: '',
            data: {
                project_id: null,
                indicator_id: null,
            },
            allProjects: [],
            allIndicators: [],
            validationErrors: {},
        };
    },
    computed: {
        selectedIndicator() {
            return this.allIndicators.find(indicator => indicator.id === this.data.indicator_id) || {};
        },
        attendanceCount() {
            if (this.selectedIndicator.project_activities) {
                return this.selectedIndicator.project_activities.filter(activity => activity.beneficiary_attendance === 1).length;
            }
            return 0;
        },
        surveyableCount() {
            if (this.selectedIndicator.project_activities) {
                return this.selectedIndicator.project_activities.filter(activity => activity.is_surveyable === 1).length;
            }
            return 0;
        },
        maxActivityAttendance() {
            return Math.max(this.data.activity_att_lt_30 || 0, this.data.activity_att_lt_50 || 0, this.data.activity_att_lt_80 || 0, this.data.activity_att_lt_100 || 0);
        },
        maxSurveyPoint() {
            return Math.max(this.data.survey_point_lt_30 || 0, this.data.survey_point_lt_50 || 0, this.data.survey_point_lt_80 || 0, this.data.survey_point_lt_100 || 0);
        },
        currentMark() {
            const maxActivityAttendance = Number(this.maxActivityAttendance) || 0;
            const maxSurveyPoint = Number(this.maxSurveyPoint) || 0;
            const activityPoint = Number(this.data.activity_point) || 0;

            return maxActivityAttendance + maxSurveyPoint + activityPoint;
        },
        remainMark() {
            const maxSurveyPoint = Number(this.maxSurveyPoint) || 0;
            const maxActivityAttendance = Number(this.maxActivityAttendance) || 0;
            return (this.selectedIndicator.total_mark || 0) - (maxSurveyPoint + maxActivityAttendance);
        }
    },
    watch: {
        currentMark(newVal) {
            console.log('val', newVal);
            if (newVal > this.selectedIndicator.total_mark) {
                this.validationErrors.current_mark = 'Value cant be more than total mark';
                // this.validationErrors.current_mark = 'Value cant be more than ' + Math.abs(this.remainMark);
            } else {
                this.validationErrors.current_mark = '';
            }
        },
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

                this.validationErrors = {};
                if (this.attendanceCount > 0) {
                    if (!this.data.activity_att_lt_30) {
                        this.validationErrors.activity_att_lt_30 = 'This field is required';
                    }
                    if (!this.data.activity_att_lt_50) {
                        this.validationErrors.activity_att_lt_50 = 'This field is required';
                    }
                    if (!this.data.activity_att_lt_80) {
                        this.validationErrors.activity_att_lt_80 = 'This field is required';
                    }
                    if (!this.data.activity_att_lt_100) {
                        this.validationErrors.activity_att_lt_100 = 'This field is required';
                    }
                }

                if (this.surveyableCount > 0) {
                    if (!this.data.survey_point_lt_30) {
                        this.validationErrors.survey_point_lt_30 = 'This field is required';
                    }
                    if (!this.data.survey_point_lt_50) {
                        this.validationErrors.survey_point_lt_50 = 'This field is required';
                    }
                    if (!this.data.survey_point_lt_80) {
                        this.validationErrors.survey_point_lt_80 = 'This field is required';
                    }
                    if (!this.data.survey_point_lt_100) {
                        this.validationErrors.survey_point_lt_100 = 'This field is required';
                    }
                }
                if (this.currentMark > this.selectedIndicator.total_mark) {
                    this.validationErrors.current_mark = 'Current mark exceeds the total mark';
                }
                const totalErrors = Object.keys(this.validationErrors).length + error;

                if (totalErrors > 0) {
                    this.$toast('You need to fill ' + totalErrors + ' more empty mandatory fields', 'warning');
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

        validatePositive(value, fieldName) {
            const numValue = Number(value);
            const valueStr = String(value);

            if (value === undefined || value === null || isNaN(numValue)) {
                this.validationErrors[fieldName] = 'Must be a valid number';
            } else if (numValue < 0) {
                this.validationErrors[fieldName] = 'Value must be greater than 0';
            } else if (valueStr.startsWith('0') && valueStr.length > 1) {
                this.validationErrors[fieldName] = 'Value cannot start with 0';
            } else {
                this.validationErrors[fieldName] = '';
            }
        },
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
    },
    created() {
        if (this.$route.params.id) {
            this.page_title = this.headline(this.model) + ' Edit';
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.page_title = this.headline(this.model) + ' Create';
        }

        this.getProjects();
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
        "data.activity_point": function (value = null) {
            return Validator.value(value).required("Activity Point is required");
        },
        "data.status": function (value = null) {
            return Validator.value(value).required("Status is required");
        },
    },
}
</script>
<style scoped>
.custome_weight {
    font-weight: 500;
}
</style>
