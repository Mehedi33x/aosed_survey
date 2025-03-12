<template>
    <index-page>
        <template v-slot:search-field>
            <Select title="State" v-model="search_data.state_id" field="search_data.state_id" label="name"
                :reduce="(obj) => obj.id" :options="allStates" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" @update:modelValue="getDistrictByState(search_data.state_id)" />
            <Select title="District" v-model="search_data.district_id" field="search_data.district_id" label="name"
                :reduce="(obj) => obj.id" :options="allDistricts" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" @update:modelValue="getUpazillaByDistrict(search_data.district_id)" />
            <Select title="Upazila" v-model="search_data.upazila_id" field="search_data.upazila_id" label="name"
                :reduce="(obj) => obj.id" :options="allUpazillas" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" />
            <date-picker id="date4" field="search_data.from_date" name="start_date" v-model="search_data.from_date"
                title="From Date" placeholder="dd/mm/yyyy" col="4" label="From Date" :tooltip="false"></date-picker>
            <date-picker id="date5" field="search_data.to_date" name="end_date" v-model="search_data.to_date"
                title="To Date" placeholder="dd/mm/yyyy" col="4" label="To Date" :disableToDates="search_data.from_date"
                :disableFutureDates="true"></date-picker>
        </template>
    </index-page>
</template>

<script>

const model = "project";

const tableColumns = [
    { field: "project_name", title: "Project Name" },
    { field: "start_date", title: "Start Date" },
    { field: "end_date", title: "End Date" },
    { field: "location", title: "Location" },
    { field: "status", title: "Status", align: "center" },
];

const json_fields = {
    "Project Name": "project_name",
    "Start Date": "start_date",
    "End Date": "end_date",
    "Objective": "objective",
    /* "State Id": "state_id",
    "District Id": "district_id",
    "Upazila Id": "upazila_id", */
};

export default {

    data() {
        return {
            model: model,
            page_title: "",
            json_fields: json_fields,
            fields_name: { default: "Select One", project_name: "Project Name" },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                page: this.$route.query.page ?? 1,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                from_date: this.$route.query.from_date ?? "",
                to_date: this.$route.query.to_date ?? "",
                status: this.$route.query.status ?? "",
                state_id: this.$route.query.state_id ?? "",
                district_id: this.$route.query.district_id ?? "",

            },
            table: {
                columns: tableColumns,
                routes: {},
                datas: [],
                meta: [],
                links: []
            },
            allStates: [],
            allDistricts: [],
            allUpazillas: [],
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

    methods: {
        search() {
            this.$router.push({ name: this.model + '.index', query: { ...this.search_data } });
            this.get_paginate(this.model, this.search_data);
        },

        resetSearchData() {
            this.search_data.pagination = 10;
            this.search_data.page = 1;
            this.search_data.field_name = "";
            this.search_data.value = "";
            this.search_data.status = "";

        },

        // api section
        getStates() {
            axios
                .get("/get-states", { params: { status: "active" } })
                .then((res) => (this.allStates = res.data));
        },
        getDistrictByState(id) {
            this.search_data.district_id = null;
            this.search_data.upazila_id = null;
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
            this.search_data.upazila_id = null;
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
    },
    created() {
        this.getRouteName(this.model);
        this.page_title = `${this.headline(this.model)} List`;
        this.search();
        this.getStates();
    },

    validators: {
        /* "search_data.from_date": function (value = null) {
            return Validator.value(value);
        },
        "search_data.to_date": function (value = null) {
            const that = this;
            return Validator.value(value).custom(function () {
                if (!Validator.isEmpty(value) && that.search_data.to_date) {
                    const end = new Date(value);
                    const start = new Date(that.search_data.from_date);

                    if (start > end) {
                        return "To date must after from date";
                    }
                }
            });
        }, */

        "search_data.status": function (value = null) {
            return Validator.value(value);
        },
    },
};
</script>
