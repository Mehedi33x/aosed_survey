<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Admin\AdminController;
use App\Http\Controllers\Api\Admin\SurveyController;
use App\Http\Controllers\Api\Admin\AdminAuthController;
use App\Http\Controllers\Api\Admin\DashboardController;
use App\Http\Controllers\Api\Admin\AttendanceController;
use App\Http\Controllers\Api\Admin\BeneficiaryController;
use App\Http\Controllers\Api\Admin\MastersetupController;
use App\Http\Controllers\Api\Admin\ActivityInfoController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */

Route::prefix('admin')->name('admin.')->group(function () {
    Route::middleware('guest:sanctum')->group(function () {
        Route::post('login', [AdminAuthController::class, 'login'])->name('login');
    });

    Route::middleware('auth:sanctum')->group(function () {
        Route::get('user', [AdminAuthController::class, 'user'])->name('user');
        Route::delete('logout', [AdminAuthController::class, 'logout'])->name('logout');

        Route::get('profile', [AdminController::class, 'adminProfile'])->name('admin.profile');
        Route::post('profile-update', [AdminController::class, 'updateProfile'])->name('update.profile');
        Route::post('change-password', [AdminController::class, 'updatePassword'])->name('change.password');
        Route::post('forget-password', [AdminController::class, 'forgetPassword'])->name('forget.password');
        Route::post('verify-token', [AdminController::class, 'verifyToken'])->name('verify.token');
        Route::post('forget-change-password', [AdminController::class, 'changePassword']);

        // Beneficiary
        Route::post('get-beneficiaries', [BeneficiaryController::class, 'getBeneficiaries']);
        Route::post('beneficiary-add', [BeneficiaryController::class, 'beneficiaryAdd']);
        Route::post('beneficiary-update/{id}', [BeneficiaryController::class, 'beneficiaryUpdate']);
        Route::get('beneficiary-profile/{id}', [BeneficiaryController::class, 'beneficiaryProfile']);


        // activityinfo
        Route::get('activityinfos',[ActivityInfoController::class, 'getActivityInfo']);
        Route::post('activityinfo-add',[ActivityInfoController::class, 'activityinfoAdd']);
        Route::get('activityinfo-view/{id}',[ActivityInfoController::class, 'activityinfoView']);
        Route::post('activityinfo-edit/{id}',[ActivityInfoController::class, 'activityinfoEdit']);

        // survey
        Route::get('get-all-beneficiaries', [SurveyController::class, 'getSurveyBeneficiaries']);
        Route::get('get-surveys',[SurveyController::class, 'getSurvey']);
        Route::post('survey-add',[SurveyController::class, 'surveyAdd']);
        Route::get('survey-view/{id}',[SurveyController::class, 'surveyView']);
        Route::post('survey-activity/{id}',[SurveyController::class, 'surveyActivity']);
        Route::post('store-survey-activity',[SurveyController::class, 'storeSurveyActivity']);

        // others informations
        Route::get('get-states',[MastersetupController::class, 'getStates']);
        Route::get('get-districts',[MastersetupController::class, 'getDistricts']);
        Route::get('get-districts',[MastersetupController::class, 'getDistricts']);
        Route::get('get-upazilas',[MastersetupController::class, 'getUpazila']);

        Route::get('get-diseases',[MastersetupController::class, 'getDiseases']);
        Route::get('get-exams',[MastersetupController::class, 'getExams']);
        Route::get('get-groups',[MastersetupController::class, 'getGroups']);
        Route::get('get-occupations',[MastersetupController::class, 'getOccupations']);
        Route::get('get-relations',[MastersetupController::class, 'getRelations']);
        Route::get('get-wealths',[MastersetupController::class, 'getWealths']);
        Route::get('get-assets',[MastersetupController::class, 'getAssets']);
        Route::get('get-liabilities',[MastersetupController::class, 'getLiability']);
        Route::get('get-gender',[MastersetupController::class, 'getGender']);
        Route::get('get-marital-status',[MastersetupController::class, 'getMaritalStatus']);
        Route::get('get-physical-condition',[MastersetupController::class, 'getPhysicalCondition']);
        Route::get('get-age-ranges',[MastersetupController::class, 'getAgeRanges']);
        Route::get('get-ownerships',[MastersetupController::class, 'getOwnerships']);


        // master setup
        Route::get('get-projects',[MastersetupController::class, 'getProjects']);
        Route::get('get-project-indicator',[MastersetupController::class, 'getProjectIndicator']);
        Route::get('get-project-activities',[MastersetupController::class, 'getProjectActivities']);

        // Dashboard
        Route::get('dashboard',[DashboardController::class, 'dashboard']);

        // attendance
        Route::get('get-attendance',[AttendanceController::class,'getAttendance']);
        Route::post('store-beneficiaries-attendance',[AttendanceController::class,'beneficiariesAttendance']);
        Route::get('view-attendance/{id}',[AttendanceController::class,'viewAttendance']);
        Route::post('update-attendance/{id}',[AttendanceController::class,'updateAttendance']);
        Route::get('get-attendance-beneficiaries',[AttendanceController::class,'getAttendanceBeneficiaries']);
        Route::delete('delete-attendance/{id}', [AttendanceController::class, 'deleteAttendance']);


    });
});
