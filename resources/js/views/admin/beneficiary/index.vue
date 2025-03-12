<template>
    <index-page>
        <template v-slot:search-field>
            <Select title="State" v-model="search_data.pre_state_id" field="search_data.pre_state_id" label="name"
                :reduce="(obj) => obj.id" :options="allStates" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" @update:modelValue="getDistrictByState(search_data.pre_state_id)" />
            <Select title="District" v-model="search_data.pre_district_id" field="search_data.pre_district_id"
                label="name" :reduce="(obj) => obj.id" :options="allDistricts" placeholder="--Select One--"
                :closeOnSelect="true" :required="false" col="4"
                @update:modelValue="getUpazillaByDistrict(search_data.pre_district_id)" />
            <Select title="Upazila" v-model="search_data.pre_upazila_id" field="search_data.pre_upazila_id" label="name"
                :reduce="(obj) => obj.id" :options="allUpazillas" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" />
            <Select title="Gender" v-model="search_data.gender" field="search_data.gender" label="title"
                :reduce="(obj) => obj.value" :options="global.gender" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" />

            <Select title="Marital Status" v-model="search_data.marital_status" field="search_data.marital_status"
                label="title" :reduce="(obj) => obj.value" :options="global.maritalStatus" placeholder="--Select One--"
                :closeOnSelect="true" :required="false" col="4" />

            <Select title="Physical Condition" v-model="search_data.physical_condition" field="search_data.physical_condition"
                label="name" :reduce="(obj) => obj.value" :options="global.physicalCondition" placeholder="--Select One--"
                :closeOnSelect="true" :required="false" col="4" />

            <!-- <Select title="Physical Condition" v-model="search_data.physical_condition" :options="[
                { id: 'Fit', name: 'Fit' },
                { id: 'Unfit', name: 'Unfit' },
            ]" placeholder="--Select Physical Condition--" :closeOnSelect="true" :required="false" col="4" /> -->

            <Select title="Age" v-model="search_data.age" field="search_data.age" label="name"
                :reduce="(obj) => obj.value" :options="global.ages" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" />

            <Select title="Education" v-model="search_data.exam_id" field="search_data.exam_id" label="title"
                :reduce="(obj) => obj.id" :options="allEducations" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" />
        </template>
    </index-page>
</template>

<script>
const model = "beneficiary";

const tableColumns = [
    { field: "full_name", title: "Full Name" },
    { field: "name_bangla", title: "bangla Name" },
    { field: "nid", title: "NID" },
    { field: "beneficiary_no", title: "Beneficiary No" },
    { field: "mobile_no", title: "Mobile No" },
    { field: "email", title: "Email" },
    { field: "gender", title: "Gender" },
    { field: "marital_status", title: "Marital Status" },
    { field: "primary_occupation_name", title: "Primary Occupation" },
    // { field: "occupation_id", title: "Beneficiary occupation", subfield: "beneficiary_occupations.title" },
    { field: "age", title: "Age" },
    { field: "pre_state_id", title: "Present State Name", subfield: "present_state.name" },
    {
        field: "pre_district_id",
        title: "Present District Name",
        subfield: "present_district.name",
    },
    {
        field: "pre_upazilla_id",
        title: "Present Upazilla Name",
        subfield: "present_upazilla.name",
    },
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    "Full Name": "full_name",
    "Bangla Name": "name_bangla",
    NID: "nid",
    "Mobile No": "mobile_no",
    "Beneficiary No": "beneficiary_no",
    "Marital Status": "marital_status",
    Gender: "gender",
    Age: "age",
    "Present State Name": "present_state.name",
    "Present District Name": "present_district.name",
    "Present Upazila Name": "present_upazilla.name",
};

export default {
    data() {
        return {
            model: model,
            page_title: "",
            json_fields: json_fields,
            fields_name: {
                default: "Select One",
                full_name: "Full Name",
                name_bangla: "Bangla Name",
                nid: "NID",
                beneficiary_no: "Beneficiary No",
                mobile_no: "Mobile Number",
                email: "Email",
                birth_certificate_no: "Birth Certificate No",
            },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                page: this.$route.query.page ?? 1,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                status: this.$route.query.status ?? "",
                pre_state_id: this.$route.query.pre_state_id ?? "",
                pre_district_id: this.$route.query.pre_district_id ?? "",
                pre_upazila_id: this.$route.query.pre_upazila_id ?? "",
                gender: this.$route.query.gender ?? "",
                exam: this.$route.query.exam ?? "",
            },
            allStates: [],
            allDistricts: [],
            allUpazillas: [],
            allEducations: [],
            table: {
                columns: tableColumns,
                routes: {
                    array: [
                        {
                            title: "ID Card",
                            route: "beneficiary.idCard",
                            content: `<svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="24"
                                            height="24"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                            stroke="currentColor"
                                            stroke-width="2"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            class="icon icon-tabler icon-tabler-id-card"
                                        >
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                            <rect x="3" y="4" width="18" height="16" rx="3" />
                                            <circle cx="9" cy="10" r="2" />
                                            <line x1="15" y1="8" x2="17" y2="8" />
                                            <line x1="15" y1="12" x2="17" y2="12" />
                                            <line x1="7" y1="16" x2="17" y2="16" />
                                        </svg>`,
                            params: [
                                {
                                    name: "id",
                                    field: "id",
                                },
                            ],
                        },
                    ],
                },
                datas: [],
                meta: [],
                links: [],
            },
        };
    },

    provide() {
        return {
            validate: this.validation,
            model: this.model,
            fields_name: this.fields_name,
            search_data: this.search_data,
            table: this.table,
            json_fields: this.json_fields,
            search: this.search,
            resetSearchData: this.resetSearchData,
        };
    },

    watch: {
        "table.datas"() {
            this.table.routes["idCard"] = "beneficiary.idCard";
        },
    },

    methods: {
        search() {
            this.get_paginate(this.model, this.search_data);
        },

        resetSearchData() {
            this.search_data.pagination = 10;
            this.search_data.page = 1;
            this.search_data.field_name = "";
            this.search_data.value = "";
            this.search_data.status = "";
        },
        getStates() {
            axios.get("/get-states").then((res) => (this.allStates = res.data));
        },
        getDistrictByState(id) {
            this.search_data.pre_district_id = null;
            this.search_data.pre_district_id = null;
            this.allDistricts = [];
            this.allUpazillas = [];
            if (id !== null) {
                this.getDistricts(id);
            }
        },
        getDistricts(id) {
            axios
                .get("/get-districts", { params: { id: id, status: "active" } })
                .then((res) => (this.allDistricts = res.data))
                .catch((error) => console.error("Error fetching districts:", error));
        },
        getUpazillaByDistrict(id) {
            this.search_data.pre_upazila_id = null;
            this.allUpazillas = [];
            if (id !== null) {
                this.getUpazillas(id);
            }
        },
        getUpazillas(id) {
            axios
                .get("/get-upazillas", { params: { id: id, status: "active" } })
                .then((res) => (this.allUpazillas = res.data))
                .catch((error) => console.error("Error fetching upazillas:", error));
        },
        getEducations() {
            axios.get("/get-exams").then((res) => (this.allEducations = res.data));
        },
    },

    created() {
        this.getRouteName(this.model);
        this.page_title = `${this.headline(this.model)} List`;
        this.search();
        this.getStates();
        this.getDistricts();
        this.getEducations();
    },

    validators: {},
};
</script>
