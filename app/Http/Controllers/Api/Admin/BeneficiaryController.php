<?php

namespace App\Http\Controllers\Api\Admin;

use App\Rules\Base64Image;
use App\Models\Beneficiary;
use Illuminate\Http\Request;
use App\Models\BenificiaryAsset;
use App\Models\BeneficiaryHealth;
use App\Models\BeneficiaryWealth;
use App\Models\BeneficiaryDisease;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\BeneficiaryEducation;
use App\Models\BeneficiaryLiabilite;
use App\Models\BeneficiaryOccupation;
use App\Models\BeneficiaryFamilyMember;
use Illuminate\Support\Facades\Validator;

class BeneficiaryController extends Controller
{
    public function getBeneficiaries(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'limit' => 'nullable|integer|min:1',
            'search.query' => 'nullable|string',
            'search.gender' => 'nullable|string|in:male,female,other',
            'search.marital_status' => 'nullable|string|in:married,single,divorced,widowed',
            'search.occupation_id' => 'nullable|integer',
            'search.state_id' => 'nullable|integer|exists:states,id',
            'search.district_id' => 'nullable|integer|exists:districts,id',
            'search.upazilla_id' => 'nullable|integer|exists:upazilas,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'error_message' => $validator->errors()->all(),
            ], 422);
        } else {
            $limit = $request->input('limit');
            $search = $request->input('search', []);

            $query = Beneficiary::with([
                'beneficiaryOccupations:id,beneficiary_id,occupation_id',
                'beneficiaryOccupations.occupations:id,title',
            ]);
            if (!empty($search['query'])) {
                $query->where(function ($q) use ($search) {
                    $q->where('beneficiaries.beneficiary_no', 'like', '%' . $search['query'] . '%')
                        ->orWhere('beneficiaries.full_name', 'like', '%' . $search['query'] . '%');
                });
            }
            if (!empty($search['gender'])) {
                $query->where('gender', $search['gender']);
            }

            if (!empty($search['marital_status'])) {
                $query->where('marital_status', $search['marital_status']);
            }
            if (!empty($search['state_id'])) {
                $query->where('pre_state_id', $search['state_id']);
            }

            if (!empty($search['district_id'])) {
                $query->where('pre_district_id', $search['district_id']);
            }

            if (!empty($search['upazilla_id'])) {
                $query->where('pre_upazilla_id', $search['upazilla_id']);
            }
            if (!empty($search['occupation_id'])) {
                $query->whereHas('beneficiaryOccupations', function ($q) use ($search) {
                    $q->where('occupation_id', $search['occupation_id']);
                });
            }

            $limit = $request->input('limit', 10);
            $beneficiaries = $query->select('id', 'full_name', 'beneficiary_no', 'image', 'nid', 'mobile_no', 'date_of_birth')
                ->limit($limit)
                ->latest()
                ->get();
            if ($beneficiaries->isEmpty()) {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'message' => 'No beneficiaries found.',
                ], 404);
            }
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $beneficiaries,
            ]);
        }
    }

    public function beneficiaryAdd(Request $request)
    {
        $validator = $this->doValidation($request);
        if ($validator->fails()) {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'Validation failed',
                'errors' => $validator->errors(),
            ], 422);
        }
        DB::beginTransaction();
        try {
            $beneficiary = Beneficiary::create([
                'full_name' => $request->beneficiary_info['full_name'],
                'beneficiary_no' => Beneficiary::getNextBeneficiaryNo(),
                'name_bangla' => $request->beneficiary_info['name_bangla'],
                'date_of_birth' => convertToDatabaseDate($request->beneficiary_info['date_of_birth']),
                'nid' => $request->beneficiary_info['nid'],
                'birth_certificate_no' => $request->beneficiary_info['birth_certificate_no'],
                'mobile_no' => $request->beneficiary_info['mobile_no'],
                'email' => $request->beneficiary_info['email'],
                'image' => $request->beneficiary_info['image'],
                'gender' => $request->beneficiary_info['gender'],
                'marital_status' => $request->beneficiary_info['marital_status'],
                'birth_certificate' => $request->beneficiary_info['birth_certificate'],
                'nid_card' => $request->beneficiary_info['national_id'],
                'present_address' => $request->beneficiary_info['present_address'],
                'pre_state_id' => $request->beneficiary_info['pre_state_id'],
                'pre_district_id' => $request->beneficiary_info['pre_district_id'],
                'pre_upazilla_id' => $request->beneficiary_info['pre_upazilla_id'],
                'permanent_address' => $request->beneficiary_info['permanent_address'],
                'per_state_id' => $request->beneficiary_info['per_state_id'],
                'per_district_id' => $request->beneficiary_info['per_district_id'],
                'per_upazilla_id' => $request->beneficiary_info['per_upazilla_id'],
            ]);
            $this->createOrUpdateBeneficiaryEducation($request->beneficiary_education, $beneficiary);
            $this->createOrUpdateBeneficiaryFamilyMembers($request->beneficiary_family_members, $beneficiary);
            $this->createOrUpdateBeneficiaryHealths($request->beneficiary_healths, $beneficiary);
            $this->createOrUpdateBeneficiaryLiabilities($request->beneficiary_liabilities, $beneficiary);
            $this->createOrUpdateBeneficiaryOccupations($request->beneficiary_occupations, $beneficiary);
            $this->createOrUpdateBeneficiaryWealths($request->beneficiary_wealths, $beneficiary);
            $this->createOrUpdateBeneficiaryAssets($request->beneficiary_assets, $beneficiary);
            $this->createOrUpdateBeneficiaryDiseases($request->beneficiary_diseases, $beneficiary);

            DB::commit();
            return response()->json([
                'success' => 1,
                'error' => 0,
                'message' => 'Beneficiary created successfully!',
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'An error occurred: ' . $e->getMessage(),
            ], 500);
        }
    }

    private function createOrUpdateBeneficiaryEducation($educations, $beneficiary)
    {
        if (is_array($educations) && !empty($educations)) {
            $selectedIds = [];
            foreach ($educations as $education) {
                $educationData = [
                    'beneficiary_id' => $beneficiary->id,
                    'exam_id' => $education['exam_id'] ?? '',
                    'board' => $education['board'] ?? '',
                    'institute' => $education['institute'] ?? '',
                    'result' => $education['result'] ?? '',
                ];
                $existingEducation = BeneficiaryEducation::where('beneficiary_id', $beneficiary->id)
                    ->where('id', $education['id'] ?? null)
                    ->first();
                if ($existingEducation) {
                    $existingEducation->update($educationData);
                    $selectedIds[] = $existingEducation->id;
                } else {
                    $newEducation = BeneficiaryEducation::create($educationData);
                    $selectedIds[] = $newEducation->id;
                }
            }
            BeneficiaryEducation::where('beneficiary_id', $beneficiary->id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        }
    }

    private function createOrUpdateBeneficiaryFamilyMembers($familyMembers, $beneficiary)
    {
        if (is_array($familyMembers) && !empty($familyMembers)) {
            $selectedIds = [];

            foreach ($familyMembers as $familyMember) {
                $familyMemberData = [
                    'beneficiary_id' => $beneficiary->id,
                    'relation_id' => $familyMember['relation_id'] ?? '',
                    'name' => $familyMember['name'] ?? '',
                    'date_of_birth' => convertToDatabaseDate($familyMember['family_date_of_birth'] ?? ''),
                    'family_nid' => $familyMember['family_nid'] ?? '',
                    'gender' => $familyMember['gender'] ?? '',
                    'marital_status' => $familyMember['marital_status'] ?? '',
                    'last_education_info' => $familyMember['last_education_info'] ?? '',
                    'earn' => $familyMember['earn'] ?? '',
                    'occupation_id' => $familyMember['occupation_id'] ?? '',
                    'yearly_income' => $familyMember['yearly_income'] ?? '',
                    'is_student' => $familyMember['is_student'] ?? '',
                    'goes_to_school' => $familyMember['goes_to_school'] ?? '',
                    'remarks' => $familyMember['remarks'] ?? '',
                ];
                $existingFamilyMember = BeneficiaryFamilyMember::where('beneficiary_id', $beneficiary->id)
                    ->where('relation_id', $familyMember['relation_id'] ?? null)
                    ->first();

                if ($existingFamilyMember) {
                    $existingFamilyMember->update($familyMemberData);
                    $selectedIds[] = $existingFamilyMember->id;
                } else {
                    $newFamilyMember = BeneficiaryFamilyMember::create($familyMemberData);
                    $selectedIds[] = $newFamilyMember->id;
                }
            }
            BeneficiaryFamilyMember::where('beneficiary_id', $beneficiary->id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        }
    }

    private function createOrUpdateBeneficiaryHealths($healths, $beneficiary)
    {
        if (is_array($healths) && !empty($healths)) {
            $selectedIds = [];
            foreach ($healths as $health) {
                $healthData = [
                    'beneficiary_id' => $beneficiary->id,
                    'height' => $health['height'] ?? '',
                    'weight' => $health['weight'] ?? '',
                    'physical_condition' => $health['physical_condition'] ?? '',
                    // 'disease_id' => $health['disease_id'] ?? '',
                    'remarks' => $health['remarks'] ?? '',
                ];
                $existingHealth = BeneficiaryHealth::where('beneficiary_id', $beneficiary->id)
                    ->where('id', $health['id'] ?? null)
                    ->first();
                if ($existingHealth) {
                    $existingHealth->update($healthData);
                    $selectedIds[] = $existingHealth->id;
                } else {
                    $newHealth = BeneficiaryHealth::create($healthData);
                    $selectedIds[] = $newHealth->id;
                }
            }
            BeneficiaryHealth::where('beneficiary_id', $beneficiary->id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        }
    }
    private function createOrUpdateBeneficiaryDiseases($diseases, $beneficiary)
    {
        if (is_array($diseases) && !empty($diseases)) {
            $selectedIds = [];
            foreach ($diseases as $disease) {
                $diseaseData = [
                    'beneficiary_id' => $beneficiary->id,
                    'disease_id' => $disease['disease_id'] ?? '',
                    'affected_date' => isset($disease['affected_date']) ? convertToDatabaseDate($disease['affected_date']) : null,
                    'recovery_date' => isset($disease['recovery_date']) ? convertToDatabaseDate($disease['recovery_date']) : null,
                    'is_continue' => $disease['is_continue'] ?? false,
                    'is_infectious' => $disease['is_infectious'] ?? false,
                ];

                // Check if the disease entry already exists, and update it or create a new one
                $existingDisease = BeneficiaryDisease::where('beneficiary_id', $beneficiary->id)
                    ->where('id', $disease['id'] ?? null)
                    ->first();

                if ($existingDisease) {
                    // Update existing disease record
                    $existingDisease->update($diseaseData);
                    $selectedIds[] = $existingDisease->id;
                } else {
                    // Create new disease record
                    $newDisease = BeneficiaryDisease::create($diseaseData);
                    $selectedIds[] = $newDisease->id;
                }
            }
            // Delete any diseases that are no longer associated with the beneficiary
            BeneficiaryDisease::where('beneficiary_id', $beneficiary->id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        }
    }

    private function createOrUpdateBeneficiaryLiabilities($liabilities, $beneficiary)
    {
        if (is_array($liabilities) && !empty($liabilities)) {
            $selectedIds = [];
            foreach ($liabilities as $liability) {
                $liabilityData = [
                    'beneficiary_id' => $beneficiary->id,
                    'liability_id' => $liability['liability_id'] ?? '',
                    'loan_from' => $liability['loan_from'] ?? '',
                    'amount' => $liability['amount'] ?? '',
                    'mortgage_asset' => $liability['mortgage_asset'] ?? '',
                    'start_date' => convertToDatabaseDate($liability['start_date'] ?? ''),
                    'end_date' => convertToDatabaseDate($liability['end_date'] ?? ''),
                ];
                $existingLiability = BeneficiaryLiabilite::where('beneficiary_id', $beneficiary->id)
                    ->where('liability_id', $liability['liability_id'] ?? null)
                    ->first();
                if ($existingLiability) {
                    $existingLiability->update($liabilityData);
                    $selectedIds[] = $existingLiability->id;
                } else {
                    $newLiability = BeneficiaryLiabilite::create($liabilityData);
                    $selectedIds[] = $newLiability->id;
                }
            }
            BeneficiaryLiabilite::where('beneficiary_id', $beneficiary->id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        }
    }

    private function createOrUpdateBeneficiaryOccupations($occupations, $beneficiary)
    {
        if (is_array($occupations) && !empty($occupations)) {
            $selectedIds = [];
            foreach ($occupations as $occupation) {
                $occupationData = [
                    'beneficiary_id' => $beneficiary->id,
                    'occupation_id' => $occupation['occupation_id'] ?? '',
                    'is_primary' => $occupation['is_primary'] ?? '',
                    'working_hour' => $occupation['working_hour'] ?? '',
                    'occupation_risk' => $occupation['occupation_risk'] ?? '',
                    'work_location' => $occupation['work_location'] ?? '',
                    'monthly_income' => $occupation['monthly_income'] ?? '',
                    'past_year_income' => $occupation['past_year_income'] ?? '',
                ];
                $existingOccupation = BeneficiaryOccupation::where('beneficiary_id', $beneficiary->id)
                    ->where('occupation_id', $occupation['occupation_id'] ?? null)
                    ->first();
                if ($existingOccupation) {
                    $existingOccupation->update($occupationData);
                    $selectedIds[] = $existingOccupation->id;
                } else {
                    $newOccupation = BeneficiaryOccupation::create($occupationData);
                    $selectedIds[] = $newOccupation->id;
                }
            }
            BeneficiaryOccupation::where('beneficiary_id', $beneficiary->id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        }
    }

    private function createOrUpdateBeneficiaryWealths($wealths, $beneficiary)
    {
        if (is_array($wealths) && !empty($wealths)) {
            $selectedIds = [];
            foreach ($wealths as $wealth) {
                $wealthData = [
                    'beneficiary_id' => $beneficiary->id,
                    'wealth_id' => $wealth['wealth_id'] ?? '',
                    'sourch_of_ownership' => $wealth['sourch_of_ownership'] ?? '',
                    'qty' => $wealth['qty'] ?? '',
                    'description' => $wealth['description'] ?? '',
                    'ownership_year' => $wealth['ownership_year'] ?? '',
                    'present_value' => $wealth['present_value'] ?? '',
                ];
                $existingWealth = BeneficiaryWealth::where('beneficiary_id', $beneficiary->id)
                    ->where('wealth_id', $wealth['wealth_id'] ?? null)
                    ->first();
                if ($existingWealth) {
                    $existingWealth->update($wealthData);
                    $selectedIds[] = $existingWealth->id;
                } else {
                    $newWealth = BeneficiaryWealth::create($wealthData);
                    $selectedIds[] = $newWealth->id;
                }
            }
            BeneficiaryWealth::where('beneficiary_id', $beneficiary->id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        }
    }

    private function createOrUpdateBeneficiaryAssets($assets, $beneficiary)
    {
        if (is_array($assets) && !empty($assets)) {
            $selectedIds = [];
            foreach ($assets as $asset) {
                $assetData = [
                    'beneficiary_id' => $beneficiary->id,
                    'asset_id' => $asset['asset_id'] ?? '',
                    'sourch_of_ownership' => $asset['sourch_of_ownership'] ?? '',
                    'qty' => $asset['qty'] ?? '',
                    'description' => $asset['description'] ?? '',
                    'ownership_year' => $asset['ownership_year'] ?? '',
                    'present_value' => $asset['present_value'] ?? '',
                ];
                $existingAsset = BenificiaryAsset::where('beneficiary_id', $beneficiary->id)
                    ->where('asset_id', $asset['asset_id'] ?? null)
                    ->first();
                if ($existingAsset) {
                    $existingAsset->update($assetData);
                    $selectedIds[] = $existingAsset->id;
                } else {
                    $newAsset = BenificiaryAsset::create($assetData);
                    $selectedIds[] = $newAsset->id;
                }
            }
            BenificiaryAsset::where('beneficiary_id', $beneficiary->id)
                ->whereNotIn('id', $selectedIds)
                ->delete();
        }
    }

    public function beneficiaryUpdate(Request $request, $id)
    {
        $validator = $this->doValidation($request);
        if ($validator->fails()) {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'Validation failed',
                'errors' => $validator->errors(),
            ], 422);
        }
        dd($request->beneficiary_occupations);
        DB::beginTransaction();
        try {
            $beneficiary = Beneficiary::find($id);
            if (!$beneficiary) {
                return response()->json([
                    'success' => 0,
                    'error' => 1,
                    'error_message' => [['message' => 'Beneficiary not found']],
                ], 404);
            }
            $beneficiary->update([
                'full_name' => $request->beneficiary_info['full_name'],
                'name_bangla' => $request->beneficiary_info['name_bangla'],
                'date_of_birth' => convertToDatabaseDate($request->beneficiary_info['date_of_birth']),
                'nid' => $request->beneficiary_info['nid'],
                'birth_certificate_no' => $request->beneficiary_info['birth_certificate_no'],
                'mobile_no' => $request->beneficiary_info['mobile_no'],
                'email' => $request->beneficiary_info['email'],
                'image' => $request->beneficiary_info['image'],
                'gender' => $request->beneficiary_info['gender'],
                'marital_status' => $request->beneficiary_info['marital_status'],
                'birth_certificate' => $request->beneficiary_info['birth_certificate'],
                'present_address' => $request->beneficiary_info['present_address'],
                'pre_state_id' => $request->beneficiary_info['pre_state_id'],
                'pre_district_id' => $request->beneficiary_info['pre_district_id'],
                'pre_upazilla_id' => $request->beneficiary_info['pre_upazilla_id'],
                'permanent_address' => $request->beneficiary_info['permanent_address'],
                'per_state_id' => $request->beneficiary_info['per_state_id'],
                'per_district_id' => $request->beneficiary_info['per_district_id'],
                'per_upazilla_id' => $request->beneficiary_info['per_upazilla_id'],
            ]);

            $this->createOrUpdateBeneficiaryEducation($request->beneficiary_education, $beneficiary);
            $this->createOrUpdateBeneficiaryFamilyMembers($request->beneficiary_family_members, $beneficiary);
            $this->createOrUpdateBeneficiaryHealths($request->beneficiary_healths, $beneficiary);
            $this->createOrUpdateBeneficiaryLiabilities($request->beneficiary_liabilities, $beneficiary);
            $this->createOrUpdateBeneficiaryOccupations($request->beneficiary_occupations, $beneficiary);
            $this->createOrUpdateBeneficiaryWealths($request->beneficiary_wealths, $beneficiary);
            $this->createOrUpdateBeneficiaryAssets($request->beneficiary_assets, $beneficiary);

            DB::commit();
            return response()->json([
                'success' => 1,
                'error' => 0,
                'message' => 'Beneficiary updated successfully!',
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'An error occurred: ' . $e->getMessage(),
            ], 500);
        }
    }

    public function beneficiaryProfile($id)
    {
        $beneficiary = Beneficiary::with(
            'beneficiaryEducations',
            'beneficiaryFamilyMembers',
            'beneficiaryHealths',
            'beneficiaryLiabilites',
            'beneficiaryOccupations',
            'beneficiaryWealths',
            'benificiaryAssets',
            'beneficiaryDiseases'
        )
            ->find($id);
        if (empty($beneficiary)) {
            return response()->json([
                'success' => 0,
                'error' => 1,
                'message' => 'No Beneficiary found.',
            ], 404);
        } else {
            $response = [
                'beneficiary_info' => [
                    'id' => $beneficiary->id,
                    'full_name' => $beneficiary->full_name,
                    'name_bangla' => $beneficiary->name_bangla,
                    'date_of_birth' => $beneficiary->date_of_birth,
                    'nid' => $beneficiary->nid,
                    'birth_certificate_no' => $beneficiary->birth_certificate_no,
                    'mobile_no' => $beneficiary->mobile_no,
                    'email' => $beneficiary->email,
                    'image' => $beneficiary->image,
                    'gender' => $beneficiary->gender,
                    'marital_status' => $beneficiary->marital_status,
                    'birth_certificate' => $beneficiary->birth_certificate,
                    'present_address' => $beneficiary->present_address,
                    'pre_state_id' => $beneficiary->pre_state_id,
                    'pre_district_id' => $beneficiary->pre_district_id,
                    'pre_upazilla_id' => $beneficiary->pre_upazilla_id,
                    'permanent_address' => $beneficiary->permanent_address,
                    'per_state_id' => $beneficiary->per_state_id,
                    'per_district_id' => $beneficiary->per_district_id,
                    'per_upazilla_id' => $beneficiary->per_upazilla_id,
                ],
                'beneficiary_education' => $beneficiary->beneficiaryEducations->map(function ($education) {
                    return [
                        'beneficiary_id' => $education->beneficiary_id,
                        'exam_id' => $education->exam_id,
                        'board' => $education->board,
                        'institute' => $education->institute,
                        'result' => $education->result,
                        'sorting' => $education->sorting,
                    ];
                }),
                'beneficiary_family_members' => $beneficiary->beneficiaryFamilyMembers->map(function ($familyMember) {
                    return [
                        'beneficiary_id' => $familyMember->beneficiary_id,
                        'relation_id' => $familyMember->relation_id,
                        'name' => $familyMember->name,
                        'family_date_of_birth' => $familyMember->date_of_birth,
                        'family_nid' => $familyMember->family_nid,
                        'gender' => $familyMember->gender,
                        'marital_status' => $familyMember->marital_status,
                        'last_education_info' => $familyMember->last_education_info,
                        'earn' => $familyMember->earn,
                        'occupation_id' => $familyMember->occupation_id,
                        'yearly_income' => $familyMember->yearly_income,
                        'is_student' => $familyMember->is_student,
                        'goes_to_school' => $familyMember->goes_to_school,
                        'remarks' => $familyMember->remarks,
                        'status' => $familyMember->status,
                    ];
                }),
                'beneficiary_healths' => $beneficiary->beneficiaryHealths
                    ? [
                        'beneficiary_id' => $beneficiary->beneficiaryHealths->beneficiary_id,
                        'height' => $beneficiary->beneficiaryHealths->height,
                        'weight' => $beneficiary->beneficiaryHealths->weight,
                        'physical_condition' => $beneficiary->beneficiaryHealths->physical_condition,
                        'disease_id' => $beneficiary->beneficiaryHealths->disease_id,
                        'remarks' => $beneficiary->beneficiaryHealths->remarks,
                    ]
                    : null,
                'beneficiary_diseases' => $beneficiary->beneficiaryDiseases->map(function ($diseases) {
                    return [
                        'beneficiary_id' => $diseases->beneficiary_id,
                        'disease_id' => $diseases->disease_id,
                        'affected_date' => $diseases->affected_date,
                        'recovery_date' => $diseases->recovery_date,
                        'is_continue' => $diseases->is_continue,
                        'is_infectious' => $diseases->is_infectious,
                    ];
                }),
                'beneficiary_liabilites' => $beneficiary->beneficiaryLiabilites->map(function ($liabilites) {
                    return [
                        'beneficiary_id' => $liabilites->beneficiary_id,
                        'liability_id' => $liabilites->liability_id,
                        'loan_from' => $liabilites->loan_from,
                        'amount' => $liabilites->amount,
                        'mortgage_asset' => $liabilites->mortgage_asset,
                        'start_date' => $liabilites->start_date,
                        'end_date' => $liabilites->end_date,
                    ];
                }),
                'beneficiary_occupations' => $beneficiary->beneficiaryOccupations->map(function ($occupations) {
                    return [
                        'beneficiary_id' => $occupations->beneficiary_id,
                        'occupation_id' => $occupations->occupation_id,
                        'is_primary' => $occupations->is_primary,
                        'working_hour' => $occupations->working_hour,
                        'occupation_risk' => $occupations->occupation_risk,
                        'work_location' => $occupations->work_location,
                        'monthly_income' => $occupations->monthly_income,
                        'past_year_income ' => $occupations->past_year_income,
                    ];
                }),
                'beneficiary_wealths' => $beneficiary->beneficiaryWealths->map(function ($wealths) {
                    return [
                        'beneficiary_id' => $wealths->beneficiary_id,
                        'wealth_id' => $wealths->wealth_id,
                        'sourch_of_ownership' => $wealths->sourch_of_ownership,
                        'qty' => $wealths->qty,
                        'description' => $wealths->description,
                        'ownership_year' => $wealths->ownership_year,
                        'present_value' => $wealths->present_value,
                    ];
                }),
                'beneficiary_assets' => $beneficiary->benificiaryAssets->map(function ($assets) {
                    return [
                        'beneficiary_id' => $assets->beneficiary_id,
                        'asset_id' => $assets->asset_id,
                        'sourch_of_ownership' => $assets->sourch_of_ownership,
                        'qty' => $assets->qty,
                        'description' => $assets->description,
                        'ownership_year' => $assets->ownership_year,
                        'present_value' => $assets->present_value,
                    ];
                }),
            ];
            return response()->json([
                'success' => 1,
                'error' => 0,
                'data' => $response,
            ]);
        }
    }

    public function doValidation(Request $request)
    {
        return Validator::make($request->all(), [
            'beneficiary_info.full_name' => 'required|string|max:255',
            'beneficiary_info.name_bangla' => 'required|string|max:255',
            'beneficiary_info.date_of_birth' => 'required|date',
            'beneficiary_info.nid' => 'required|numeric',
            'beneficiary_info.birth_certificate_no' => 'nullable|string',
            // 'beneficiary_info.mobile_no' => [
            //     'required',
            //     'string',
            //     'regex:/^01[3-9]\d{8}$/',
            // ],
            'beneficiary_info.mobile_no' => [
                'required',
                'string',
            ],
            'beneficiary_info.email' => 'nullable|email|max:255',
            'beneficiary_info.image' => ['nullable', 'string', new Base64Image()],
            'beneficiary_info.gender' => 'nullable|in:male,female,other',
            'beneficiary_info.marital_status' => 'nullable|in:married,unmarried,divorced,widowed',
            'beneficiary_info.present_address' => 'nullable|string|max:255',
            'beneficiary_info.pre_state_id' => 'required|integer',
            'beneficiary_info.pre_district_id' => 'required|integer',
            'beneficiary_info.pre_upazilla_id' => 'required|integer',
            'beneficiary_info.permanent_address' => 'nullable|string|max:255',
            'beneficiary_info.per_state_id' => 'required|integer',
            'beneficiary_info.per_district_id' => 'required|integer',
            'beneficiary_info.per_upazilla_id' => 'required|integer',
            'beneficiary_education.*.exam_id' => 'nullable|integer',
            'beneficiary_education.*.board' => 'nullable|string|max:255',
            'beneficiary_education.*.institute' => 'nullable|string|max:255',
            'beneficiary_education.*.result' => 'nullable',
            'beneficiary_family_members.*.relation_id' => 'nullable|integer',
            'beneficiary_family_members.*.name' => 'nullable|string|max:255',
            'beneficiary_family_members.*.family_date_of_birth' => 'nullable|date',
            'beneficiary_family_members.*.family_nid' => 'nullable|numeric',
            'beneficiary_family_members.*.gender' => 'nullable|in:male,female,other',
            'beneficiary_family_members.*.marital_status' => 'nullable|in:married,unmarried,divorced,widowed',
            'beneficiary_healths.*.height' => 'nullable|numeric|min:1|max:10',
            'beneficiary_healths.*.weight' => 'nullable|numeric|min:1|max:500',
            'beneficiary_liabilities.*.loan_from' => 'nullable|string|max:255',
            'beneficiary_liabilities.*.amount' => 'nullable|numeric|min:0',
            'beneficiary_occupations.*.occupation_id' => 'nullable|integer',
            'beneficiary_occupations.*.monthly_income' => 'nullable|numeric|min:0',
            'beneficiary_wealths.*.present_value' => 'nullable|numeric|min:0',
            'beneficiary_assets.*.present_value' => 'nullable|numeric|min:0',

        ]);
    }
}
