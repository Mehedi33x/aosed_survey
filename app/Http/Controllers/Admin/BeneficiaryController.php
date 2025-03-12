<?php

/**
 * @Nogor Solutions Ltd
 */

namespace App\Http\Controllers\Admin;

use Exception;
use App\Models\Beneficiary;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Http\Resources\Resource;
use App\Models\BenificiaryAsset;
use App\Models\BeneficiaryHealth;
use App\Models\BeneficiaryWealth;
use App\Models\BeneficiaryDisease;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Models\BeneficiaryEducation;
use App\Models\BeneficiaryLiabilite;
use Illuminate\Support\Facades\Http;
use App\Models\BeneficiaryOccupation;
use App\Models\BeneficiaryFamilyMember;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Base\BaseController;

class BeneficiaryController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Beneficiary::with('presentState', 'presentDistrict', 'presentUpazilla', 'beneficiaryHealths', 'beneficiaryOccupations', 'primaryOccupation.occupations')
            ->latest();
        $query->whereLike($request->field_name, $request->value);
        if ($request->status) {
            $query->where('status', $request->status);
        }
        if ($request->pre_state_id && $request->pre_district_id && $request->pre_upazilla_id) {
            $query->where('pre_state_id', $request->pre_state_id)
                ->where('pre_district_id', $request->pre_district_id)->where('pre_upazilla_id', $request->pre_upazilla_id);
        } elseif ($request->pre_state_id && $request->pre_district_id) {
            $query->where('pre_state_id', $request->pre_state_id)->where('pre_district_id', $request->pre_district_id);
        } elseif ($request->pre_state_id) {
            $query->where('pre_state_id', $request->pre_state_id);
        }
        if ($request->gender) {
            $query->where('gender', $request->gender);
        }

        if ($request->marital_status) {
            $query->where('marital_status', $request->marital_status);
        }
        if ($request->exam_id) {
            $query->whereHas('beneficiaryEducations', function ($q) use ($request) {
                $q->where('exam_id', $request->exam_id);
            });
        }
        if ($request->physical_condition) {
            $query->whereHas('beneficiaryHealths', function ($q) use ($request) {
                $q->where('physical_condition', $request->physical_condition);
            });
        }

        $minAge = $maxAge = null;
        if ($request->age) {
            $ageRange = json_decode($request->age, true);
            $minAge = $ageRange['min'] ?? null;
            $maxAge = $ageRange['max'] ?? null;
        }
        $currentDate = time();

        if ($minAge && $maxAge) {
            $minDateOfBirth = date('Y-m-d', strtotime("-$maxAge years", $currentDate));
            $maxDateOfBirth = date('Y-m-d', strtotime("-$minAge years", $currentDate));
        }

        if (!empty($minDateOfBirth) && !empty($maxDateOfBirth)) {
            $query->whereBetween('date_of_birth', [$minDateOfBirth, $maxDateOfBirth]);
        }
        if ($request->allData) {
            return $query->get();
        } else {
            $datas = $query->paginate($request->pagination);
            return new Resource($datas);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if ($this->validateCheck($request)) {
            try {
                $data = $request->all();

                DB::beginTransaction();
                $data = $request->except([
                    'beneficiary_education',
                    'beneficiary_occupations',
                    'beneficiary_family_members',
                    'beneficiary_diseases',
                    'beneficiary_wealths',
                    'benificiary_assets',
                    'beneficiary_liabilites',
                ]);
                // Set beneficiary_no using the custom auto-increment method
                $data['beneficiary_no'] = Beneficiary::getNextBeneficiaryNo();

                $beneficiary_educations = $request->beneficiary_educations;
                $beneficiary_occupations = $request->beneficiary_occupations;
                $beneficiary_diseases = $request->beneficiary_diseases;
                $beneficiary_family_members = $request->beneficiary_family_members;
                $beneficiary_wealths = $request->beneficiary_wealths;
                $benificiary_assets = $request->benificiary_assets;
                $beneficiary_liabilites = $request->beneficiary_liabilites;
                $image = $request->image_base64;

                if (!empty($request->file("birth_certificate"))) {
                    $data["birth_certificate"] = $this->upload($request->birth_certificate, "document");
                }
                if (!empty($request->file("nid_card"))) {
                    $data["nid_card"] = $this->upload($request->nid_card, "national_card");
                }

                if (!empty($image)) {
                    $data['image'] = cloudflare(file: $image, folder: 'beneficiary', resizeSize: '145x95', base64: true);
                }
                // $data['date_of_birth'] = vue_to_server_date($request->date_of_birth);
                if ($request->date_of_birth) {
                    $data['date_of_birth'] = vue_to_server_date($request->date_of_birth);
                } else {
                    $data['date_of_birth'] = null;
                }
                $res = Beneficiary::create($data);
                // Check if beneficiary was created and insert beneficiaryEducation data
                $this->storeEducations($beneficiary_educations, $res->id);
                $this->storeOccupations($beneficiary_occupations, $res->id);
                $this->storeDiseases($beneficiary_diseases, $res->id);
                $this->storeWealths($beneficiary_wealths, $res->id);
                $this->storeAssets($benificiary_assets, $res->id);
                $this->storeLiabilities($beneficiary_liabilites, $res->id);
                $this->storeFamilies($beneficiary_family_members, $res->id);
                if ($res) {
                    // Store BeneficiaryHealth data
                    // $beneficiaryHealth = [
                    //     'beneficiary_id' => $res->id,
                    //     'height' => $request->input('height'),
                    //     'weight' => $request->input('weight'),
                    //     'physical_condition' => $request->input('physical_condition'),
                    // ];
                    // BeneficiaryHealth::create($beneficiaryHealth);
                    BeneficiaryHealth::create([
                        'beneficiary_id' => $res->id, // Assume $res->id is set before this
                        'height' => $request->height,
                        'weight' => $request->weight,
                        'physical_condition' => $request->physical_condition,
                    ]);
                }

                DB::commit();
                return $this->responseReturn("create", $res);
            } catch (Exception $ex) {
                DB::rollback();
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    private function storeEducations($beneficiary_educations, $id)
    {

        if (is_array($beneficiary_educations) && !empty($beneficiary_educations)) {
            $selectedIds = [];
            foreach ($beneficiary_educations as $beneficiaryEducation) {
                $educationData = [
                    'beneficiary_id' => $id,
                    'exam_id' => $beneficiaryEducation['exam_id'] ?? '',
                    'board' => $beneficiaryEducation['board'] ?? '',
                    'institute' => $beneficiaryEducation['institute'] ?? '',
                    'result' => $beneficiaryEducation['result'] ?? '',
                ];

                $oldBeneficiaryEducation = BeneficiaryEducation::where('beneficiary_id', $id)
                    ->where('id', $beneficiaryEducation['id'] ?? null)
                    ->first();

                if ($oldBeneficiaryEducation) {
                    $oldBeneficiaryEducation->update($educationData);
                    $selectedIds[] = $oldBeneficiaryEducation->id;
                } else {
                    $newEducation = BeneficiaryEducation::create($educationData);
                    $selectedIds[] = $newEducation->id;
                }
            }
            // delete beneficiary educations which are diselected/delete from the create/edit page
            BeneficiaryEducation::where('beneficiary_id', $id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        } else {
            Log::info("No beneficiary education data found or the data is not in the correct format.");
        }
    }
    private function storeOccupations($beneficiary_occupations, $id)
    {
        if (is_array($beneficiary_occupations) && !empty($beneficiary_occupations)) {
            $selectedIds = [];
            foreach ($beneficiary_occupations as $BeneficiaryOccupation) {
                $ocupationData = [
                    'beneficiary_id' => $id,
                    'occupation_id' => $BeneficiaryOccupation['occupation_id'] ?? '',
                    'is_primary' => $BeneficiaryOccupation['is_primary'] ?? 0,
                    'working_hour' => $BeneficiaryOccupation['working_hour'] ?? '',
                    'occupation_risk' => $BeneficiaryOccupation['occupation_risk'] ?? '',
                    'work_location' => $BeneficiaryOccupation['work_location'] ?? '',
                    'monthly_income' => $BeneficiaryOccupation['monthly_income'] ?? '',
                    'past_year_income' => $BeneficiaryOccupation['past_year_income'] ?? '',
                ];
                $oldBeneficiaryOccupation = BeneficiaryOccupation::where('beneficiary_id', $id)
                    ->where('id', $BeneficiaryOccupation['id'] ?? null)
                    ->first();

                if ($oldBeneficiaryOccupation) {
                    $oldBeneficiaryOccupation->update($ocupationData);
                    $selectedIds[] = $oldBeneficiaryOccupation->id;
                } else {
                    $newOcupation = BeneficiaryOccupation::create($ocupationData);
                    $selectedIds[] = $newOcupation->id;
                }
            }

            // delete beneficiary educations which are diselected/delete from the create/edit page
            BeneficiaryOccupation::where('beneficiary_id', $id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        } else {
            Log::info("No beneficiary education data found or the data is not in the correct format.");
        }
    }

    private function storeDiseases($beneficiary_diseases, $id)
    {
        if (is_array($beneficiary_diseases) && !empty($beneficiary_diseases)) {
            $selectedIds = [];
            foreach ($beneficiary_diseases as $beneficiaryDisease) {
                $diseaseData = [
                    'beneficiary_id' => $id,
                    'disease_id' => $beneficiaryDisease['disease_id'] ?? '',
                    'affected_date' => $beneficiaryDisease['affected_date'] ?? '',
                    'recovery_date' => $beneficiaryDisease['recovery_date'] ?? '',
                    'is_continue' => $beneficiaryDisease['is_continue'] ?? '',
                    'is_infectious' => $beneficiaryDisease['is_infectious'] ?? '',
                ];
                $oldBeneficiaryDisease = BeneficiaryDisease::where('beneficiary_id', $id)
                    ->where('id', $beneficiaryDisease['id'] ?? null)
                    ->first();
                if ($oldBeneficiaryDisease) {
                    $oldBeneficiaryDisease->update($diseaseData);
                    $selectedIds[] = $oldBeneficiaryDisease->id;
                } else {
                    $newDisease = BeneficiaryDisease::create($diseaseData);
                    $selectedIds[] = $newDisease->id;
                }
            }
            // delete beneficiary disease which are diselected/delete from the create /edit page
            BeneficiaryDisease::where('beneficiary_id', $id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        } else {
            Log::info("No beneficiary disease data found or the data is not in the correct format.");
        }
    }
    private function storeWealths($beneficiary_wealths, $id)
    {
        if (is_array($beneficiary_wealths) && !empty($beneficiary_wealths)) {
            $selectedIds = [];
            foreach ($beneficiary_wealths as $beneficiaryWealth) {
                $wealthData = [
                    'beneficiary_id' => $id,
                    'wealth_id' => $beneficiaryWealth['wealth_id'] ?? '',
                    'sourch_of_ownership' => $beneficiaryWealth['sourch_of_ownership'] ?? '',
                    'qty' => $beneficiaryWealth['qty'] ?? '',
                    'description' => $beneficiaryWealth['description'] ?? '',
                    // 'ownership_year' => $beneficiaryWealth['ownership_year'] ?? '',
                    'ownership_year' => isset($beneficiaryWealth['ownership_year']) ? (int) $beneficiaryWealth['ownership_year'] : 0,
                    // 'present_value' => $beneficiaryWealth['present_value'] ?? '',
                    'present_value' => isset($beneficiaryWealth['present_value']) ? (int) $beneficiaryWealth['present_value'] : 0,
                ];
                $oldBeneficiaryWealth = BeneficiaryWealth::where('beneficiary_id', $id)
                    ->where('id', $beneficiaryWealth['id'] ?? null)
                    ->first();
                if ($oldBeneficiaryWealth) {
                    $oldBeneficiaryWealth->update($wealthData);
                    $selectedIds[] = $oldBeneficiaryWealth->id;
                } else {
                    $newWealth = BeneficiaryWealth::create($wealthData);
                    $selectedIds[] = $newWealth->id;
                }
            }
            // delete beneficiary wealth which are diselected/delete from the create /edit page
            BeneficiaryWealth::where('beneficiary_id', $id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        } else {
            Log::info("No beneficiary disease data found or the data is not in the correct format.");
        }
    }

    private function storeAssets($benificiary_assets, $id)
    {
        if (is_array($benificiary_assets) && !empty($benificiary_assets)) {
            $selectedIds = [];
            foreach ($benificiary_assets as $benificiaryAsset) {
                $assetData = [
                    'beneficiary_id' => $id,
                    'asset_id' => $benificiaryAsset['asset_id'] ?? '',
                    'sourch_of_ownership' => $benificiaryAsset['sourch_of_ownership'] ?? '',
                    'qty' => $benificiaryAsset['qty'] ?? '',
                    'description' => $benificiaryAsset['description'] ?? '',
                    // 'ownership_year' => $benificiaryAsset['ownership_year'] ?? '',
                    // 'ownership_year' => !empty($benificiaryAsset['ownership_year']) ? $benificiaryAsset['ownership_year'] : null,
                    'ownership_year' => isset($benificiaryAsset['ownership_year']) ? (int) $benificiaryAsset['ownership_year'] : 0,
                    // 'present_value' => $benificiaryAsset['present_value'] ?? '',
                    'present_value' => isset($benificiaryAsset['present_value']) ? (int) $benificiaryAsset['present_value'] : 0,
                ];
                $oldBeneficiaryAsset = BenificiaryAsset::where('beneficiary_id', $id)
                    ->where('id', $benificiaryAsset['id'] ?? null)
                    ->first();
                if ($oldBeneficiaryAsset) {
                    $oldBeneficiaryAsset->update($assetData);
                    $selectedIds[] = $oldBeneficiaryAsset->id;
                } else {
                    $newAsset = BenificiaryAsset::create($assetData);
                    $selectedIds[] = $newAsset->id;
                }
            }
            // delete beneficiary asset which are diselected/delete from the create /edit page
            BenificiaryAsset::where('beneficiary_id', $id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        } else {
            Log::info("No beneficiary disease data found or the data is not in the correct format.");
        }
    }
    private function storeLiabilities($beneficiary_liabilites, $id)
    {
        if (is_array($beneficiary_liabilites) && !empty($beneficiary_liabilites)) {
            $selectedIds = [];
            foreach ($beneficiary_liabilites as $beneficiaryLiabilite) {
                $liabiliteData = [
                    'beneficiary_id' => $id,
                    'liability_id' => $beneficiaryLiabilite['liability_id'] ?? '',
                    'loan_from' => $beneficiaryLiabilite['loan_from'] ?? '',
                    'amount' => $beneficiaryLiabilite['amount'] ?? '',
                    'mortgage_asset' => $beneficiaryLiabilite['mortgage_asset'] ?? '',
                    'start_date' => $beneficiaryLiabilite['start_date'] ?? '',
                    'end_date' => $beneficiaryLiabilite['end_date'] ?? '',
                ];
                $oldBeneficiaryLiabilite = BeneficiaryLiabilite::where('beneficiary_id', $id)
                    ->where('id', $beneficiaryLiabilite['id'] ?? null)
                    ->first();
                if ($oldBeneficiaryLiabilite) {
                    $oldBeneficiaryLiabilite->update($liabiliteData);
                    $selectedIds[] = $oldBeneficiaryLiabilite->id;
                } else {
                    $newLiabilite = BeneficiaryLiabilite::create($liabiliteData);
                    $selectedIds[] = $newLiabilite->id;
                }
            }
            // delete beneficiary liability which are diselected/delete from the create /edit page
            BeneficiaryLiabilite::where('beneficiary_id', $id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        } else {
            Log::info("No beneficiary disease data found or the data is not in the correct format.");
        }
    }

    private function storeFamilies($beneficiary_family_members, $id)
    {
        if (is_array($beneficiary_family_members) && !empty($beneficiary_family_members)) {
            $selectedIds = [];

            foreach ($beneficiary_family_members as $beneficiaryFamily) {

                $familyData = [
                    'beneficiary_id' => $id,
                    'relation_id' => $beneficiaryFamily['relation_id'] ?? '',
                    'name' => $beneficiaryFamily['name'] ?? '',
                    'family_date_of_birth' => !empty($beneficiaryFamily['family_date_of_birth'])
                        ? vue_to_server_date($beneficiaryFamily['family_date_of_birth'])
                        : null,

                    'gender' => $beneficiaryFamily['gender'] ?? '',
                    'family_nid' => isset($beneficiaryFamily['family_nid']) ? (int) $beneficiaryFamily['family_nid'] : 0,
                    'occupation_id' => isset($beneficiaryFamily['occupation_id']) ? (int) $beneficiaryFamily['occupation_id'] : 0,
                    'earn' => isset($beneficiaryFamily['earn']) ? (int) $beneficiaryFamily['earn'] : 0,
                    'marital_status' => $beneficiaryFamily['marital_status'] ?? '',
                    'yearly_income' => isset($beneficiaryFamily['yearly_income']) ? (int) $beneficiaryFamily['yearly_income'] : 0,
                    'goes_to_school' => isset($beneficiaryFamily['goes_to_school']) ? (int) $beneficiaryFamily['goes_to_school'] : 0,
                    'last_education_info' => $beneficiaryFamily['last_education_info'] ?? '',
                    'remarks' => $beneficiaryFamily['remarks'] ?? '',
                ];
                $oldBeneficiaryFamily = BeneficiaryFamilyMember::where('beneficiary_id', $id)
                    ->where('id', $beneficiaryFamily['id'] ?? null)
                    ->first();
                if ($oldBeneficiaryFamily) {
                    $oldBeneficiaryFamily->update($familyData);
                    $selectedIds[] = $oldBeneficiaryFamily->id;
                } else {
                    $newFamily = BeneficiaryFamilyMember::create($familyData);
                    $selectedIds[] = $newFamily->id;
                }
            }
            BeneficiaryFamilyMember::where('beneficiary_id', $id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        } else {
            Log::info("No beneficiary disease data found or the data is not in the correct format.");
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Beneficiary  $beneficiary
     * @return \Illuminate\Http\Response
     */

    public function show(Request $request, $id)
    {

        $beneficiary = Beneficiary::with([
            'beneficiaryEducations',
            'beneficiaryEducations.exam',
            'presentState',
            'presentDistrict',
            'presentUpazilla',
            'presentThana',
            'permanentState',
            'permanentDistrict',
            'permanentUpazilla',
            'permanentThana',
            'beneficiaryOccupations',
            'beneficiaryOccupations.occupations',
            'beneficiaryFamilyMembers',
            'beneficiaryFamilyMembers.relation',
            'beneficiaryFamilyMembers.occupations',
            'beneficiaryWealths',
            'beneficiaryWealths.wealth',
            'benificiaryAssets',
            'benificiaryAssets.asset',
            'beneficiaryLiabilites',
            'beneficiaryLiabilites.liability',
            'beneficiaryHealths',
            'beneficiaryDiseases',
            'beneficiaryDiseases.disease',
            'beneficiaryAssigns.project',
            // 'surveyBeneficiaries.survey.project',
            // 'surveyBeneficiaries.survey.activity',
            'surveyBeneficiaries.survey' => function ($query) {
                $query->with(['project', 'activity']);
            },
        ])->find($id);
        if ($request->format() == 'html') {
            return view('admin.layouts.admin_app');
        }



        return $beneficiary;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Beneficiary  $beneficiary
     * @return \Illuminate\Http\Response
     */
    public function edit(Beneficiary $beneficiary)
    {
        return view('admin.layouts.admin_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Beneficiary  $beneficiary
     * @return \Illuminate\Http\Response
     */

    public function update(Request $request, $id)
    {
        $beneficiary = Beneficiary::findOrFail($id);

        if ($this->validateCheck($request)) {
            try {
                DB::beginTransaction();
                $data = $request->except([
                    'beneficiary_education',
                    'beneficiary_occupations',
                    'beneficiary_diseases',
                    'beneficiary_family_members',
                    'beneficiary_wealths',
                    'benificiary_assets',
                    'beneficiary_liabilites',
                ]);
                $beneficiary_educations = $request->beneficiary_educations;
                $beneficiary_occupations = $request->beneficiary_occupations;
                $beneficiary_diseases = $request->beneficiary_diseases;
                $beneficiary_wealths = $request->beneficiary_wealths;
                $benificiary_assets = $request->benificiary_assets;
                $beneficiary_liabilites = $request->beneficiary_liabilites;
                $beneficiary_family_members = $request->beneficiary_family_members;
                // Handle image update if provided
                $image = $request->image_base64;
                if (!empty($request->file("birth_certificate"))) {
                    $data["birth_certificate"] = $this->upload($request->birth_certificate, "document");
                }
                if (!empty($image)) {
                    $data['image'] = cloudflare(file: $image, folder: 'beneficiary', resizeSize: '145x95', base64: true);
                }
                if (!empty($request->file("nid_card"))) {
                    $data["nid_card"] = $this->upload($request->nid_card, "national_card");
                }
                // Update the basic beneficiary information
                if ($request->date_of_birth) {
                    $data['date_of_birth'] = convertToDatabaseDate($request->date_of_birth);
                } else {
                    $data['date_of_birth'] = null;
                }

                $beneficiary->update($data);

                // Update BeneficiaryEducation data
                $this->storeEducations($beneficiary_educations, $id, );
                $this->storeOccupations($beneficiary_occupations, $id);
                $this->storeDiseases($beneficiary_diseases, $id);
                $this->storeWealths($beneficiary_wealths, $id);
                $this->storeAssets($benificiary_assets, $id);
                $this->storeLiabilities($beneficiary_liabilites, $id);
                $this->storeFamilies($beneficiary_family_members, $id);

                // Update BeneficiaryHealth data
                $beneficiaryHealthData = [
                    'height' => $request->height,
                    'weight' => $request->weight,
                    'physical_condition' => $request->physical_condition,
                    // 'height' => $request->input('height'),
                    // 'weight' => $request->input('weight'),
                    // 'physical_condition' => $request->input('physical_condition'),
                ];
                BeneficiaryHealth::updateOrCreate(
                    ['beneficiary_id' => $id],
                    $beneficiaryHealthData,
                );

                DB::commit();
                return $this->responseReturn("update", $beneficiary);
            } catch (Exception $ex) {
                DB::rollback();
                return response()->json(['exception' => $ex->errorInfo ?? $ex->getMessage()], 422);
            }
        }
    }

    public function idCard(Request $request, $id)
    {
        $beneficiary = Beneficiary::find($id);
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $beneficiary;
    }

    public function download($id)
    {
        $beneficiary = Beneficiary::find($id);
        if (empty($beneficiary)) {
            return response()->json([
                'message' => "No data found",
            ], Http::ok());
        }
        $data = [
            'full_name' => $beneficiary->full_name,
            'name_bangla' => $beneficiary->name_bangla,
            'email' => $beneficiary->email,
            'mobile_no' => $beneficiary->mobile_no,
            'present_address' => $beneficiary->present_address,
            'permanent_address' => $beneficiary->permanent_address,
            'beneficiary_no' => $beneficiary->beneficiary_no,
            'date_of_birth' => $beneficiary->date_of_birth,
            'nid' => $beneficiary->nid,
            'birth_certificate_no' => $beneficiary->birth_certificate_no,
            'remarks' => $beneficiary->remarks,
            'presentState' => $beneficiary->presentState->name,
            'presentDistrict' => $beneficiary->presentDistrict->name,
            'presentUpazilla' => $beneficiary->presentUpazilla->name,
            'permanentState' => $beneficiary->permanentState->name,
            'permanentDistrict' => $beneficiary->permanentDistrict->name,
            'permanentUpazilla' => $beneficiary->permanentUpazilla->name,
            'image' => $beneficiary->image ?? '',
            'beneficiary' => $beneficiary,
        ];
        $pdfLoad = PDF::loadView('pdf.profile', $data)->setPaper('a4', 'portrait');
        return $pdfLoad->stream("profile $beneficiary->form_type.pdf");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Beneficiary  $beneficiary
     * @return \Illuminate\Http\Response
     */

    public function destroy($id)
    {

        try {
            $beneficiary = Beneficiary::findOrFail($id);

            DB::beginTransaction();
            // Delete related records using relationships
            $beneficiary->beneficiaryEducations()->delete();
            $beneficiary->beneficiaryOccupations()->delete();
            $beneficiary->beneficiaryDiseases()->delete();
            $beneficiary->beneficiaryFamilyMembers()->delete();
            $beneficiary->beneficiaryWealths()->delete();
            $beneficiary->benificiaryAssets()->delete();
            $beneficiary->beneficiaryLiabilites()->delete();

            // If health record exists, delete it
            if ($beneficiary->beneficiaryHealths) {
                $beneficiary->beneficiaryHealths()->delete();
            }
            // Delete the main beneficiary record
            $beneficiary->delete();
            DB::commit();
            return response()->json(['message' => 'Beneficiary and related data deleted successfully.'], 200);
        } catch (Exception $ex) {
            // Rollback transaction if there’s an error
            DB::rollBack();
            return response()->json(['exception' => $ex->getMessage()], 422);
        }
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request, $id = null)
    {
        return true;
        return $request->validate([
            //  'name' => 'required|email|nullable|date|string|min:0|max:191',
        ], [
            //  'exam_id.required' => "This Exm is required",
        ]);
    }

    public function beneficiaryProfile($id)
    {

        $beneficiary = Beneficiary::with([
            'beneficiaryEducations',
            'beneficiaryOccupations',
            'beneficiaryDiseases',
            'beneficiaryFamilyMembers',
            'beneficiaryWealths',
            'benificiaryAssets',
            'beneficiaryLiabilites',
            'beneficiaryHealths',
            'presentState',
            'presentDistrict',
            'presentUpazilla',
            'presentThana',
            'permanentState',
            'permanentDistrict',
            'permanentUpazilla',
            'permanentThana',

        ])->findOrFail($id);

        return view('pdf.shortProfile' ,compact('beneficiary'));
    }
}
