<template>
    <index-page>
        <template v-slot:search-field>
            <Select title="Select Project" v-model="search_data.project_id" field="search_data.project_id"
                label="project_name" :reduce="(obj) => obj.id" :options="allProjects" placeholder="--Select One--"
                :closeOnSelect="true" col="4" :req="true" @update:modelValue="
                    getIndicatorsByProject(search_data.project_id)
                    " />
            <Select title="Select Indicator" v-model="search_data.indicator_id" field="search_data.indicator_id"
                label="title" :reduce="(obj) => obj.id" :options="allIndicators" placeholder="--Select One--"
                :closeOnSelect="true" col="4" @update:modelValue="
                    getActivityByIndicator(search_data.indicator_id)
                    " />
            <Select title="Select Project Activity" v-model="search_data.activity_id" field="search_data.activity_id"
                label="title" :reduce="(obj) => obj.id" :options="allActivity" placeholder="--Select One--"
                :closeOnSelect="true" col="4" />

            <Select title="Select Occupation" v-model="search_data.occupation_id" field="search_data.occupation_id"
                label="title" :reduce="(obj) => obj.id" :options="allOccupations" placeholder="--Select One--"
                :closeOnSelect="true" col="4" />
            <Select title="Select Age" v-model="search_data.age" field="search_data.age" label="title"
                :reduce="(obj) => obj.id" :options="ages" placeholder="--Select One--" :closeOnSelect="true" col="4" />

            <Select title="Gender" v-model="search_data.gender" field="search_data.gender" label="name"
                :reduce="(obj) => obj.value" :options="genders" placeholder="--Select One--" :closeOnSelect="true"
                col="4" @update:modelValue="getBeneficiaries(search_data.gender)" />
            <Select title="Select Marital Status" v-model="search_data.marital_status"
                field="search_data.marital_status" label="name" :reduce="(obj) => obj.value" :options="maritalStatus"
                placeholder="--Select One--" :closeOnSelect="true" col="4"
                @update:modelValue="getBeneficiaries(search_data.marital_status)" />


        </template>
    </index-page>
</template>

<script>

const tableColumns = [
    { field: "group_name", title: "Group Name" },
    {
        field: "activity_id",
        title: "Activity",
        subfield: "activity.title",
    },

    {
        field: "project_id",
        title: "Name",
        subfield: "project.project_name",
    },
    {
        field: "gender",
        title: "Gender",
        subfield: "beneficiary.gender",
    },

    {
        field: "mobile_no",
        title: "Mobile",
        subfield: "beneficiary.mobile_no",
    },
    {
        field: "nid",
        title: "NID",
        subfield: "beneficiary.nid",

    },
    {
        field: "marital_status",
        title: "Marital Status",
        subfield: "beneficiary.marital_status",

    },
    {
        field: "beneficiary.beneficiaryOccupations",
        title: "Occupations",
        subfield: "beneficiary.beneficiaryOccupations.occupations.title",
        // subfield: "occupations.title",
    },
    {
        field: "family_members_count",
        title: "Family Members",
        subfield: "beneficiary.family_members_count", // Field to access the family member count
    },
    {
        field: "beneficiary_liabilities_sum_amount",
        title: "Loan", // Column title
        subfield: "beneficiary.beneficiary_liabilities_sum_amount", // Field to liabilities amount sum  for per beneficiary
    },

];

const json_fields = {
    "Group": "group_name",
    Activity: "activity.title",
    Project: "project.project_name",
    Gender: "beneficiary.gender",
    Gender: "beneficiary.mobile_no",
    NID: "beneficiary.nid",
    "Marital Status": "beneficiary.marital_status",
    Occupations: "beneficiary.beneficiaryOccupations.occupation.title",
    "Family Members": "beneficiary.family_members_count",
    "Loan": "beneficiary.beneficiary_liabilities_sum_amount",
};

export default {
    data() {
        return {
            page_title: "",
            json_fields: json_fields,
            fields_name: {
                default: "Select One",
                project_name: "Project Name",
            },
            data: {
                gender: null,
            },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                page: this.$route.query.page ?? 1,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                status: this.$route.query.status ?? "",
                project_id: this.$route.query.project_id ?? "",
                indicator_id: this.$route.query.indicator_id ?? "",
                activity_id: this.$route.query.activity_id ?? "",
                occupation_id: this.$route.query.occupation_id ?? "",
                gender: this.$route.query.gender ?? "",
                marital_status: this.$route.query.marital_status ?? "",
                age: this.$route.query.age ?? "",
            },
            allProjects: [],
            allIndicators: [],
            allActivity: [],
            genders: [
                {
                    name: "male",
                    value: "Male",
                },
                {
                    name: "female",
                    value: "Female",
                },
            ],
            maritalStatus: [
                {
                    name: "married",
                    value: "Married",
                },
                {
                    name: "unmarried",
                    value: "Unmarried",
                },
            ],
            ages: [
                {
                    name: "18 to 30",
                    value: JSON.stringify({ min: 18, max: 30 }),
                },
                {
                    name: "31 to 50",
                    value: JSON.stringify({ min: 31, max: 50 }),
                },
            ],
            table: {
                columns: tableColumns,
                routes: {},
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
            customDataUrl: "report/projectBeneficiary",
            customRouteName: "report.projectBeneficiary",
            customPdfUrl: `${this.$root.baseurl}/admin/report/download`,
        };
    },

    methods: {
        search() {
            // this.$router.push({
            //     name: "report.projectBeneficiary",
            //     query: { ...this.search_data },
            // });
            this.get_paginate("/report/projectBeneficiary", this.search_data);
            const search = this.search_data;
            // console.log(search);
            axios
                .get("/report/projectBeneficiary", {
                    params: search,
                })
                .then((response) => {
                    console.log(response.data);
                })
                .catch((error) => {
                    console.error("Error searching", error);
                });
        },

        // resetSearchData() {
        //     this.search_data.pagination = 10;
        //     this.search_data.page = 1;
        //     this.search_data.field_name = "";
        //     this.search_data.value = "";
        //     this.search_data.status = "";
        // },
        resetSearchData() {
            this.search_data = {
                pagination: 10,
                page: 1,
                field_name: "",
                value: "",
                status: "",
                project_id: "",
                indicator_id: "",
                activity_id: "",
                occupation_id: "",
                gender: "",
                marital_status: "",
                age: "",
            };

            this.$router.push({
                name: this.$route.name,
                query: { ...this.search_data },
            });

            this.search();
        },

        // API section
        getProjects() {
            axios
                .get("/get-projects")
                .then((res) => (this.allProjects = res.data));
        },
        getIndicatorsByProject(id) {
            this.search_data.indicator_id = null;
            this.allIndicators = [];
            if (id !== null) {
                this.getIndicators(id);
            }
        },

        getIndicators(id) {
            axios
                .get("/get-all-indicators", { params: { id: id } })
                .then((res) => (this.allIndicators = res.data))
                .catch((error) =>
                    console.error("Error fetching indicators:", error)
                );
        },

        getActivityByIndicator(id) {
            this.search_data.activity_id = null;
            this.allActivity = [];
            if (id !== null) {
                this.getActivity(id);
            }
        },
        getActivity(id) {
            axios.get("/get-activities", { params: { id: id } })
                .then((res) => (this.allActivity = res.data))
                .catch(error => console.error('Error fetching activities:', error));
        },
        getOccupations() {
            axios.get("/get-occupations")
            .then((res) => (this.allOccupations = res.data))
            .catch((error) => console.error("Error fetching occupations:", error));
        },



    },

    created() {
        this.getRouteName(this.model);
        this.page_title = `Project Beneficiary Report`;
        this.search();
        this.getProjects();
        this.getOccupations();
    },

    validators: {},
};
</script>
