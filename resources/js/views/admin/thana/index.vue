<template>
    <index-page>
        <template v-slot:search-field>
            <Select title="State" v-model="search_data.state_id" field="search_data.state_id" label="name"
                :reduce="(obj) => obj.id" :options="allStates" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" @update:modelValue="getDistrictByState(search_data.state_id)" />
            <Select title="District" v-model="search_data.district_id" field="search_data.district_id" label="name"
                :reduce="(obj) => obj.id" :options="allDistricts" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" @update:modelValue="getUpazilaByDistrict(search_data.district_id)"/>
            <Select title="Upazila" v-model="search_data.upazila_id" field="search_data.upazila_id" label="name"
                :reduce="(obj) => obj.id" :options="allUpazilas" placeholder="--Select One--" :closeOnSelect="true"
                :required="false" col="4" />
        </template>
    </index-page>
</template>

<script>

const model = "thana";

const tableColumns = [
    { field: "state_id", title: "State Name", subfield: "state.name" },
    { field: "district_id", title: "District Name", subfield: "district.name" },
    { field: "upazila_id", title: "Upazila Name", subfield: "upazila.name" },
    { field: "name", title: "Name" },
    { field: "contact_no", title: "Contact" },];

const json_fields = {
    "Name": "name", "Contact": "contact",
};

export default {

    data() {
        return {
            model: model,
            page_title: "",
            json_fields: json_fields,
            fields_name: { default: "Select One", name: "Thana Name" },
            search_data: {
                pagination: this.$route.query.pagination ?? 10,
                page: this.$route.query.page ?? 1,
                field_name: this.$route.query.field_name ?? "",
                value: this.$route.query.value ?? "",
                status: this.$route.query.status ?? "",
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
            allUpazilas: [],

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
            this.search_data.district_id = null;
            this.allDistricts = [];
            if (id !== null) {
                this.getDistricts(id);
            }
        },
        getDistricts(id) {
            axios.get("/get-districts", { params: { id: id } }).then((res) => (this.allDistricts = res.data)).catch(error => console.error('Error fetching districts:', error));;
        },
        getUpazilaByDistrict(id) {
            this.search_data.upazila_id = null;
            this.allUpazilas = [];
            if (id != null) {
                this.getUpazilas(id);
            }
        },
        getUpazilas(id) {
            axios.get("/get-upazilas", { params: { id: id } }).then((res) => (this.allUpazilas = res.data)).catch(error => console.error('Error fetching upazilas:', error));;
        }
    },

    created() {
        this.getRouteName(this.model);
        this.page_title = `${this.headline(this.model)} List`;
        this.search();
        this.getStates();
    },

    validators: {},
};
</script>
