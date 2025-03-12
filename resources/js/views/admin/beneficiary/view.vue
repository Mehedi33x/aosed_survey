<template>
    <view-page>
        <fieldset>
            <span class="legend">Personal Information</span>
            <fieldset class="mt-2">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="custom_box d-flex flex-column flex-xl-row mt-2 gap-5">
                            <div class="d-flex flex-column w-100">
                                <div class="image mx-auto">
                                    <!-- <img src="https://img.freepik.com/free-photo/closeup-portrait-baseball-player_23-2150885237.jpg?semt=ais_hybrid-rr-similar"
                                        alt="not found"> -->
                                    <img :src="data?.original_image ? data?.original_image : emptyImage()"
                                        alt="img-cover" style="width: 100%; height: 100%; object-fit: cover;">
                                </div>
                                <div class="highlight text-center mt-4 w-100">
                                    <h6>{{ data?.full_name ?? "N/A" }}</h6>
                                </div>
                            </div>
                            <div class="d-flex flex-column gap-2">
                                <div class="info_list d-flex gap-3 align-items-center">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                                            class="size-6">
                                            <path fill-rule="evenodd"
                                                d="M1.5 4.5a3 3 0 0 1 3-3h1.372c.86 0 1.61.586 1.819 1.42l1.105 4.423a1.875 1.875 0 0 1-.694 1.955l-1.293.97c-.135.101-.164.249-.126.352a11.285 11.285 0 0 0 6.697 6.697c.103.038.25.009.352-.126l.97-1.293a1.875 1.875 0 0 1 1.955-.694l4.423 1.105c.834.209 1.42.959 1.42 1.82V19.5a3 3 0 0 1-3 3h-2.25C8.552 22.5 1.5 15.448 1.5 6.75V4.5Z"
                                                clip-rule="evenodd" />
                                        </svg>
                                    </div>
                                    <p>{{ data?.mobile_no ?? "N/A" }}</p>
                                </div>
                                <div class="info_list d-flex gap-3 align-items-center">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                                            class="size-6">
                                            <path
                                                d="M1.5 8.67v8.58a3 3 0 0 0 3 3h15a3 3 0 0 0 3-3V8.67l-8.928 5.493a3 3 0 0 1-3.144 0L1.5 8.67Z" />
                                            <path
                                                d="M22.5 6.908V6.75a3 3 0 0 0-3-3h-15a3 3 0 0 0-3 3v.158l9.714 5.978a1.5 1.5 0 0 0 1.572 0L22.5 6.908Z" />
                                        </svg>
                                    </div>
                                    <p>{{ data?.email ?? "N/A" }}</p>
                                </div>
                                <div class="info_list d-flex gap-3 align-items-center">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                                            class="size-6">
                                            <path fill-rule="evenodd"
                                                d="m11.54 22.351.07.04.028.016a.76.76 0 0 0 .723 0l.028-.015.071-.041a16.975 16.975 0 0 0 1.144-.742 19.58 19.58 0 0 0 2.683-2.282c1.944-1.99 3.963-4.98 3.963-8.827a8.25 8.25 0 0 0-16.5 0c0 3.846 2.02 6.837 3.963 8.827a19.58 19.58 0 0 0 2.682 2.282 16.975 16.975 0 0 0 1.145.742ZM12 13.5a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"
                                                clip-rule="evenodd" />
                                        </svg>
                                    </div>
                                    <p>{{ data?.present_address ?? "N/A" }}</p>
                                </div>
                                <div class="highlight mt-2 d-flex align-items-center gap-2">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                        class="icon icon-tabler icon-tabler-file-type-pdf" width="44" height="30"
                                        viewBox="0 0 24 24" stroke-width="1.5" stroke="#ffffff" fill="none"
                                        stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path d="M14 3v4a1 1 0 0 0 1 1h4" />
                                        <path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4" />
                                        <path d="M5 18h1.5a1.5 1.5 0 0 0 0 -3h-1.5v6" />
                                        <path d="M17 18h2" />
                                        <path d="M20 15h-3v6" />
                                        <path d="M11 15v6h1a2 2 0 0 0 2 -2v-2a2 2 0 0 0 -2 -2h-1z" />
                                    </svg>
                                    <h6>
                                        <a :href="`${$root.baseurl}/admin/beneficiary/${data.id}/download`"
                                            target="_blank">Download Short profile</a>

                                    </h6>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="table-responsive mt-3 mt-lg-0">
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <th>Full Name</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ data?.full_name ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Bangla Name</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ data?.name_bangla ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Beneficiary No</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ data?.beneficiary_no ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Date of Birth</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ enFormat(data?.date_of_birth ?? "N/A") }}</td>
                                    </tr>
                                    <tr>
                                        <th>NID</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ data?.nid }}</td>
                                    </tr>
                                    <tr>
                                        <th>Birth Certification No</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ data?.birth_certificate_no ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Remarks</th>
                                        <th style="text-align: center">:</th>
                                        <td>{{ data?.remarks ?? "N/A" }}</td>
                                    </tr>
                                    <tr>
                                        <th>Birth Certificate</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            <template v-if="data.birth_certificate">
                                                <a :href="data.birth_certificate" download target="_blank">
                                                    <svg xmlns="http://www.w3.org/2000/svg"
                                                        class="icon icon-tabler icon-tabler-file-type-pdf" width="44"
                                                        height="30" viewBox="0 0 24 24" stroke-width="1.5"
                                                        stroke="#000000" fill="none" stroke-linecap="round"
                                                        stroke-linejoin="round">
                                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                        <path d="M14 3v4a1 1 0 0 0 1 1h4" />
                                                        <path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4" />
                                                        <path d="M5 18h1.5a1.5 1.5 0 0 0 0 -3h-1.5v6" />
                                                        <path d="M17 18h2" />
                                                        <path d="M20 15h-3v6" />
                                                        <path d="M11 15v6h1a2 2 0 0 0 2 -2v-2a2 2 0 0 0 -2 -2h-1z" />
                                                    </svg>
                                                    Download Birth Certificate
                                                </a>
                                            </template>
                                            <span v-else>
                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                    class="icon icon-tabler icon-tabler-file-type-pdf" width="44"
                                                    height="30" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000"
                                                    fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                    <path d="M14 3v4a1 1 0 0 0 1 1h4" />
                                                    <path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4" />
                                                    <path d="M5 18h1.5a1.5 1.5 0 0 0 0 -3h-1.5v6" />
                                                    <path d="M17 18h2" />
                                                    <path d="M20 15h-3v6" />
                                                    <path d="M11 15v6h1a2 2 0 0 0 2 -2v-2a2 2 0 0 0 -2 -2h-1z" />
                                                </svg>
                                                (No Birth Certificate)
                                            </span>
                                        </td>

                                    </tr>
                                    <tr>
                                        <th>National ID Card</th>
                                        <th style="text-align: center">:</th>
                                        <td>
                                            <template v-if="data.nid_card">
                                                <a :href="data.nid_card" download target="_blank">
                                                    <svg xmlns="http://www.w3.org/2000/svg"
                                                        class="icon icon-tabler icon-tabler-file-type-pdf" width="44"
                                                        height="30" viewBox="0 0 24 24" stroke-width="1.5"
                                                        stroke="#000000" fill="none" stroke-linecap="round"
                                                        stroke-linejoin="round">
                                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                        <path d="M14 3v4a1 1 0 0 0 1 1h4" />
                                                        <path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4" />
                                                        <path d="M5 18h1.5a1.5 1.5 0 0 0 0 -3h-1.5v6" />
                                                        <path d="M17 18h2" />
                                                        <path d="M20 15h-3v6" />
                                                        <path d="M11 15v6h1a2 2 0 0 0 2 -2v-2a2 2 0 0 0 -2 -2h-1z" />
                                                    </svg>
                                                    Download Birth Certificate
                                                </a>
                                            </template>
                                            <span v-else>
                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                    class="icon icon-tabler icon-tabler-file-type-pdf" width="44"
                                                    height="30" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000"
                                                    fill="none" stroke-linecap="round" stroke-linejoin="round">
                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                                    <path d="M14 3v4a1 1 0 0 0 1 1h4" />
                                                    <path d="M5 12v-7a2 2 0 0 1 2 -2h7l5 5v4" />
                                                    <path d="M5 18h1.5a1.5 1.5 0 0 0 0 -3h-1.5v6" />
                                                    <path d="M17 18h2" />
                                                    <path d="M20 15h-3v6" />
                                                    <path d="M11 15v6h1a2 2 0 0 0 2 -2v-2a2 2 0 0 0 -2 -2h-1z" />
                                                </svg>
                                                (No Birth Certificate)
                                            </span>
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </fieldset>
            <div class="d-flex flex-column gap-4 mt-4">
                <div class="row">
                    <div class="col-lg-6">
                        <fieldset>
                            <span class="legend">Present Address</span>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Address</th>
                                            <th style="text-align: center">:</th>
                                            <td>{{ data?.present_address ?? "N/A" }}</td>
                                        </tr>
                                        <tr>
                                            <th>State</th>
                                            <th style="text-align: center">:</th>
                                            <td>{{ data?.present_state?.name ?? "N/A" }}</td>
                                        </tr>
                                        <tr>
                                            <th>District</th>
                                            <th style="text-align: center">:</th>
                                            <td>{{ data?.present_district
                                                ?.name ?? "N/A" }}</td>
                                        </tr>
                                        <tr>
                                            <th>Upazila</th>
                                            <th style="text-align: center">:</th>
                                            <td>{{ data?.present_upazilla?.name ?? "N/A" }}</td>
                                        </tr>
                                        <tr>
                                            <th>Thana</th>
                                            <th style="text-align: center">:</th>
                                            <td>{{ data?.present_thana?.name ?? "N/A" }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                    <div class="col-lg-6">
                        <fieldset class="mt-4 mt-lg-0">
                            <span class="legend">Permanent Address</span>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>Address</th>
                                            <th style="text-align: center">:</th>
                                            <td>{{ data?.permanent_address ?? "N/A" }}</td>
                                        </tr>
                                        <tr>
                                            <th>State</th>
                                            <th style="text-align: center">:</th>
                                            <td>{{ data?.permanent_state?.name ?? "N/A" }}</td>
                                        </tr>
                                        <tr>
                                            <th>District</th>
                                            <th style="text-align: center">:</th>
                                            <td>{{ data?.permanent_district?.name ?? "N/A" }}</td>
                                        </tr>
                                        <tr>
                                            <th>Upazila</th>
                                            <th style="text-align: center">:</th>
                                            <td>{{ data?.permanent_upazilla?.name ?? "N/A" }}</td>
                                        </tr>
                                        <tr>
                                            <th>Thana</th>
                                            <th style="text-align: center">:</th>
                                            <td>{{ data?.permanent_thana?.name ?? "N/A" }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <fieldset class="mt-4 mt-lg-0">
                            <span class="legend">Beneficiary Education</span>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Exam</th>
                                            <th>Level</th>
                                            <th>Board</th>
                                            <th>Institute</th>
                                            <th>Result</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(education, index) in data.beneficiary_educations" :key="index">
                                            <td>{{ education?.exam?.title }}</td>
                                            <td>
                                                <span :class="[
                                                    education?.exam?.level == 'Certified'
                                                        ? 'bg-success'
                                                        : 'bg-danger ',
                                                    'badge mt-1',
                                                    'text-white ',
                                                ]">{{ ucfirst(education?.exam?.level) }}
                                                </span>
                                            </td>
                                            <td>{{ education.board }}</td>
                                            <td>{{ education.institute }}</td>
                                            <td>{{ education.result }}</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <fieldset class="mt-4 mt-lg-0">
                            <span class="legend">Beneficiary Occupation</span>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th style="min-width: 200px;">Title</th>
                                            <th style="min-width: 120px;">Working Hours</th>
                                            <th style="min-width: 150px;">Occupation Risk</th>
                                            <th style="min-width: 200px;">Work Location</th>
                                            <th style="min-width: 120px;">Monthly Income</th>
                                            <th style="min-width: 120px;">Past Year Income</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(ocupation, index) in data.beneficiary_occupations" :key="index">
                                            <td>{{ ocupation?.occupations?.title }}</td>
                                            <td>
                                                {{ ocupation?.working_hour ?? "N/A" }}
                                            </td>
                                            <td>{{ ocupation?.occupation_risk ?? "N/A" }}</td>
                                            <td>{{ ocupation?.work_location ?? "N/A" }}</td>
                                            <td>{{ ocupation?.monthly_income ?? "N/A" }}</td>
                                            <td>{{ ocupation?.past_year_income ?? "N/A" }}</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <fieldset class="mt-4 mt-lg-0">
                            <span class="legend">Family Information</span>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th style="min-width: 100px;">Relation</th>
                                            <th style="min-width: 200px;">Name</th>
                                            <th style="min-width: 150px;">Date of Birth</th>
                                            <th style="min-width: 150px;">NID</th>
                                            <th style="min-width: 100px;">Gender</th>
                                            <th style="min-width: 100px;">Marital Status</th>
                                            <th style="min-width: 150px;">Occupation</th>
                                            <th style="min-width: 150px;">Last Edu Info</th>
                                            <th style="min-width: 100px;">Earning</th>
                                            <th style="min-width: 120px;">Last Year Income</th>
                                            <!-- <th>Is Student</th> -->
                                            <th style="min-width: 120px;">Goes to School</th>
                                            <th style="min-width: 200px;">Remarks</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(family, index) in data.beneficiary_family_members" :key="index">
                                            <td>{{ family?.relation?.title }}</td>
                                            <td>
                                                {{ family?.name ?? "N/A" }}
                                            </td>
                                            <td> {{ enFormat(family?.family_date_of_birth ?? "N/A") }}
                                            </td>
                                            <td>{{ family?.family_nid ?? "N/A" }}</td>
                                            <td>{{ family?.gender ?? "N/A" }}</td>
                                            <td>{{ family?.marital_status ?? "N/A" }}</td>
                                            <td>{{ family?.occupations?.title ?? "N/A" }}</td>
                                            <td>{{ family?.last_education_info ?? "N/A" }}</td>
                                            <td>{{ family?.earn ?? "N/A" }}</td>
                                            <td>{{ family?.yearly_income ?? "N/A" }}</td>
                                            <td>{{ family?.goes_to_school ?? "N/A" }}</td>
                                            <td>{{ family?.remarks ?? "N/A" }}</td>
                                            <!-- <td>---</td> -->
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-12">
                        <fieldset>
                            <span class="legend">Beneficiary Health</span>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Disease Name</th>
                                            <th>Effected Date</th>
                                            <th>Recovery Date</th>
                                            <th>Continuing</th>
                                            <th>Infectious Diseases</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(diseases, index) in data.beneficiary_diseases" :key="index">
                                            <td>{{ diseases?.disease?.title }}</td>
                                            <td>
                                                {{ diseases?.affected_date ?? "N/A" }}
                                            </td>
                                            <td>{{ diseases?.recovery_date ?? "N/A" }}</td>
                                            <td>{{ diseases?.is_continue ?? "N/A" }}</td>
                                            <td>{{ diseases?.is_infectious ?? "N/A" }}</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>



                <div class="row">
                    <div class="col-lg-12">
                        <fieldset>
                            <span class="legend">Beneficiary Wealth</span>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Wealth</th>
                                            <th>Source of ownership</th>
                                            <th>Quantity</th>
                                            <th>Description</th>
                                            <th>Ownership Year</th>
                                            <th>Present value</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(wealths, index) in data.beneficiary_wealths" :key="index">
                                            <td>{{ wealths?.wealth?.title }}</td>
                                            <td>
                                                {{ wealths?.sourch_of_ownership ?? "N/A" }}
                                            </td>
                                            <td>{{ wealths?.qty ?? "N/A" }}</td>
                                            <td>{{ wealths?.description ?? "N/A" }}</td>
                                            <td>{{ wealths?.ownership_year ?? "N/A" }}</td>
                                            <td>{{ wealths?.present_value ?? "N/A" }}</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <fieldset>
                            <span class="legend">Beneficiary Asset</span>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Asset</th>
                                            <th>Source of ownership</th>
                                            <th>Quantity</th>
                                            <th>Description</th>
                                            <th>Ownership Year</th>
                                            <th>Present value</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(assets, index) in data.benificiary_assets" :key="index">
                                            <td>{{ assets?.asset?.title }}</td>
                                            <td>
                                                {{ assets?.sourch_of_ownership ?? "N/A" }}
                                            </td>
                                            <td>{{ assets?.qty ?? "N/A" }}</td>
                                            <td>{{ assets?.description ?? "N/A" }}</td>
                                            <td>{{ assets?.ownership_year ?? "N/A" }}</td>
                                            <td>{{ assets?.present_value ?? "N/A" }}</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <fieldset>
                            <span class="legend">Beneficiary Liability</span>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Liability</th>
                                            <th>Loan From</th>
                                            <th>Amount</th>
                                            <th>Mortgage Asset</th>
                                            <th>Start date</th>
                                            <th>Finish Date</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(liabilites, index) in data.beneficiary_liabilites" :key="index">
                                            <td>{{ liabilites?.liability?.title }}</td>
                                            <td>
                                                {{ liabilites?.loan_from ?? "N/A" }}
                                            </td>
                                            <td>{{ liabilites?.amount ?? "N/A" }}</td>
                                            <td>{{ liabilites?.mortgage_asset ?? "N/A" }}</td>
                                            <td>{{ liabilites?.start_date ?? "N/A" }}</td>
                                            <td>{{ liabilites?.end_date ?? "N/A" }}</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <fieldset class="mt-4 mt-lg-0">
                            <span class="legend">Project Information</span>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th style="min-width: 200px;">Project Name</th>
                                            <th style="min-width: 120px;">Start Date</th>
                                            <th style="min-width: 120px;">End Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(projects, index) in data.beneficiary_assigns" :key="index">
                                            <td>{{ projects?.project?.project_name ?? 'N/A' }}</td>
                                            <td>{{ projects?.project?.start_date ?? 'N/A' }}</td>
                                            <td>{{ projects?.project?.end_date ?? 'N/A' }}</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <fieldset class="mt-4 mt-lg-0">
                            <span class="legend">Survey Report</span>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th style="min-width: 200px;">Project Name</th>
                                            <th style="min-width: 200px;">Project Activity</th>
                                            <th style="min-width: 120px;">Survey Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(item, index) in data.survey_beneficiaries" :key="index">
                                            <td>{{ item.survey.project.project_name }}</td>
                                            <td>{{ item.survey.activity.title }}</td>
                                            <td>{{ item.survey_date }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </fieldset>
    </view-page>
</template>

<script>

const model = "beneficiary";

export default {
    data() {
        return {
            page_title: "Beneficiary View",
            model: model,
            data: {
            },
            fileColumns: [{ field: "original_image", title: "Image" }, { field: "birth_certificate", title: "Birth Certificate" },],
        };
    },
    created() {
        this.page_title = `${this.headline(this.model)} View`;
        this.get_data(`${this.model}/${this.$route.params.id}`);
    },
};

</script>

<style scoped>
table thead th,
table tbody td {
    padding: 8px !important;
}
</style>
