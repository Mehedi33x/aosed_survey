<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\ReportController;
use App\Http\Controllers\Admin\SurveyController;
use App\Http\Controllers\Admin\DiseaseController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\Admin\BeneficiaryController;
use App\Http\Controllers\Admin\System\ModuleController;
use App\Http\Controllers\Admin\Support\SupportController;
use App\Http\Controllers\Admin\ProjectAchievementSetupController;

// Backend Route...
Route::group(['prefix' => 'backend', 'as' => 'backend.'], function () {

    // Auth Route...
    Route::post('forget', [App\Http\Controllers\Auth\AdminLoginController::class, 'forget'])->name('forget');
    Route::any('password-reset', [App\Http\Controllers\Auth\AdminLoginController::class, 'reset'])->name('reset');
    Route::get('beneficiary-profile/{id}', [BeneficiaryController::class, 'beneficiaryProfile'])->name('beneficiary.profile');
});
/* Route::get('/beneficiary-profile/{id}', [App\Http\Controllers\Admin\BeneficiaryController::class, , 'beneficiaryProfile'])->name('beneficiary.profile'); */
// Authorized Route...
Route::group(['middleware' => 'auth:admin'], function () {
    // Support Route...
    Route::get('support/countries', [SupportController::class, 'countries']);
    Route::get('get-states', [SupportController::class, 'getStates']);
    Route::get('get-districts', [SupportController::class, 'getDistricts']);
    Route::get('get-upazillas', [SupportController::class, 'getUpazillas']);
    Route::get('get-projects', [SupportController::class, 'getAllProjects']);
    Route::get('get-all-indicators', [SupportController::class, 'getAllIndicators']);
    Route::get('get-upazilas', [SupportController::class, 'getIdWiseUpazilas']);
    Route::get('get-thana', [SupportController::class, 'getThana']);
    Route::get('get-survey-title', [SupportController::class, 'getSurveyTitile']);
    Route::get('get-all-Survey', [SupportController::class, 'getAllSurvey']);
    Route::get('get-all-groups', [SupportController::class, 'getAllGroups']);

    Route::get('get-project-indicators', [SupportController::class, 'getIdWiseIndicators']);
    Route::get('get-modules', [ModuleController::class, 'getModules']);
    Route::get('get-disease-type', [DiseaseController::class, 'getDiseaseType']);

    Route::get('get-seruvey-questions', [SupportController::class, 'getSurveyQuestions']);
    Route::get('get-assigned-beneficiaries', [SupportController::class, 'getBeneficiaries']);
    Route::get('get-survey-beneficiaries', [SupportController::class, 'getSurveyBeneficiaries']);
    Route::get('/beneficiary-delete', [App\Http\Controllers\Admin\BeneficiaryAssignController::class, 'beneficiaryDelete'])->name('beneficiaryAssign.deleteBeneficiary');

    Route::get('/check-duplicate-project-achievement', [ProjectAchievementSetupController::class, 'checkDuplicate']);

    Route::get('get-all-beneficiaries', [SupportController::class, 'getBeneficiary']);

    // Route::get('get-upazilas', [SupportController::class, 'getUpazilas']);
    Route::get('get-upazilas', [SupportController::class, 'getIdWiseUpazilas']);

    Route::get('get-activities', [SupportController::class, 'getActivities']);
    Route::get('get-projects-activities', [SupportController::class, 'getProjectActivities']);
    Route::get('get-modules', [ModuleController::class, 'getModules']);
    Route::get('get-disease-type', [DiseaseController::class, 'getDiseaseType']);
    Route::get('get-admins', [SupportController::class, 'getAdmins']);
    Route::get('get-exams', [SupportController::class, 'getExams']);
    Route::get('get-relations', [SupportController::class, 'getRelations']);
    Route::get('get-occupations', [SupportController::class, 'getOccupations']);
    Route::get('get-diseases', [SupportController::class, "getDiseases"]);
    Route::get('get-wealths', [SupportController::class, 'getWealths']);
    Route::get("get-assets", [SupportController::class, 'getAsset']);
    Route::get("get-liabilities", [SupportController::class, 'getLiabilities']);
    Route::get('get-educations', [SupportController::class, 'getEducations']);
    Route::match(['get', 'post'], 'search-beneficiaries', [SupportController::class, 'searchBeneficiaries']);

    // Custom Pagination Example Route...
    Route::get('custom/pagination', [ProfileController::class, 'news']);

    // Auth Route...
    Route::post('logout', [App\Http\Controllers\Auth\AdminLoginController::class, 'logout'])->name('logout');

    // Systems Route...
    Route::get('systems-update', [App\Http\Controllers\Admin\System\RoleController::class, 'systemsRoleUpdate']);
    Route::get('get-permissions', [App\Http\Controllers\Admin\System\RoleController::class, 'getPermissions']);
    Route::get('get-menus/{any?}', [App\Http\Controllers\Admin\System\MenuController::class, 'menus']);
    Route::get('initialize-systems', [App\Http\Controllers\Admin\System\LibController::class, 'systems']);

    // Category Route...
    Route::get('get-category/{type}', [App\Http\Controllers\Admin\CategoryController::class, 'getCategory']);

    // Admin Route...
    Route::post('check-old-password', [App\Http\Controllers\Admin\AdminController::class, 'checkOldPassword']);
    Route::post('change-password', [App\Http\Controllers\Admin\AdminController::class, 'passwordChange']);
    Route::get('get-dashboard-menus', [App\Http\Controllers\Admin\System\MenuController::class, 'dashboardMenu']);

    // Module Route...
    Route::view('module', 'admin.layouts.admin_app')->name('module.index');
    Route::get('module/check-model', [App\Http\Controllers\Admin\System\ModuleController::class, 'checkModel']);

    // Table Route...
    Route::get('table-sorting', [App\Http\Controllers\Base\SortingController::class, 'sorting']);
    Route::get('get-last-sorting', [App\Http\Controllers\Base\SortingController::class, 'lastSorting']);

    // Menu Route...
    Route::get('module-delete', [App\Http\Controllers\Admin\System\ModuleController::class, 'moduleDelete'])->name('module.delete');

    // User Permission Based Routing...
    Route::middleware('auth.access')->group(function () {

        // Dashboard Route...
        Route::get('dashboard', [App\Http\Controllers\Admin\DashboardController::class, 'index'])->name('dashboard.index');

        // Profile route
        Route::get('/profile-details/{id}', [AdminController::class, 'profileDetails'])->name('profile.profileDetails');

        Route::resource('category', App\Http\Controllers\Admin\CategoryController::class);

        // Module Route...
        Route::match(['get', 'post'], 'module/create', [App\Http\Controllers\Admin\System\ModuleController::class, 'create'])->name('module.create');

        // Activity Log Route...
        Route::get('activityLog', [App\Http\Controllers\Admin\System\ActivityLogController::class, 'index'])->name('activityLog.index');
        Route::get('activityLog/{id}', [App\Http\Controllers\Admin\System\ActivityLogController::class, 'show'])->name('activityLog.show');
        Route::get('allRead', [App\Http\Controllers\Admin\System\ActivityLogController::class, 'allRead'])->name('activityLog.allRead');
        Route::delete('activityLog/{id}', [App\Http\Controllers\Admin\System\ActivityLogController::class, 'destroy'])->name('activityLog.destroy');
        Route::post('activityLog/{activity}/restore', [App\Http\Controllers\Admin\System\ActivityLogController::class, 'restore'])->name('activityLog.restore');

        // Admin Route...
        Route::resource('role', App\Http\Controllers\Admin\System\RoleController::class);
        Route::resource('menu', App\Http\Controllers\Admin\System\MenuController::class);

        Route::get('siteSetting', [App\Http\Controllers\Admin\System\SiteSettingController::class, 'show'])->name('siteSetting.show');
        Route::post('siteSetting', [App\Http\Controllers\Admin\System\SiteSettingController::class, 'store'])->name('siteSetting.store');
        Route::get('siteSetting/edit', [App\Http\Controllers\Admin\System\SiteSettingController::class, 'edit'])->name('siteSetting.store');

        Route::resource('admin', App\Http\Controllers\Admin\AdminController::class);

        Route::resource('mediaValidator', App\Http\Controllers\Admin\MediaValidatorController::class);
        Route::resource('helpInfo', App\Http\Controllers\Admin\HelpInfoController::class);

        Route::resource('state', App\Http\Controllers\Admin\StateController::class);
        Route::resource('district', App\Http\Controllers\Admin\DistrictController::class);
        Route::resource('upazila', App\Http\Controllers\Admin\UpazilaController::class);
        Route::resource('beneficiary', App\Http\Controllers\Admin\BeneficiaryController::class);

        Route::get('beneficiary/{id}/idCard', [App\Http\Controllers\Admin\BeneficiaryController::class, 'idCard'])->name('beneficiary.idCard');
        Route::resource('project', App\Http\Controllers\Admin\ProjectController::class);
        Route::resource('surveyForm', App\Http\Controllers\Admin\SurveyFormController::class);
        Route::resource('occupation', App\Http\Controllers\Admin\OccupationController::class);
        Route::resource('exam', App\Http\Controllers\Admin\ExamController::class);
        Route::resource('relation', App\Http\Controllers\Admin\RelationController::class);
        Route::resource('disease', App\Http\Controllers\Admin\DiseaseController::class);
        Route::resource('survey', App\Http\Controllers\Admin\SurveyController::class);

        Route::get('survey/{id}/surveyStart', [App\Http\Controllers\Admin\SurveyController::class, 'surveyStart'])->name('survey.surveyStart');
        Route::post('survey/beneficiaries/delete', [App\Http\Controllers\Admin\SurveyController::class, 'surveyBeneficiariesDelete'])->name('survey.surveyBeneficiariesDelete');

        Route::resource('projectActivity', App\Http\Controllers\Admin\ProjectActivityController::class);
        Route::resource('projectAchievementSetup', App\Http\Controllers\Admin\ProjectAchievementSetupController::class);
        Route::resource('activityInfo', App\Http\Controllers\Admin\ActivityInfoController::class);
        Route::resource('wealth', App\Http\Controllers\Admin\WealthController::class);
        Route::resource('asset', App\Http\Controllers\Admin\AssetController::class);
        Route::resource('liability', App\Http\Controllers\Admin\LiabilityController::class);
        Route::resource('beneficiaryAttendance', App\Http\Controllers\Admin\BeneficiaryAttendanceController::class);
        Route::resource('beneficiaryAssign', App\Http\Controllers\Admin\BeneficiaryAssignController::class);
        /* Route::resource('beneficiaryAssign', App\Http\Controllers\Admin\BeneficiaryAssignController::class)->except('show', 'edit', 'destroy');
        Route::get('beneficiaryAssign/{id}', [App\Http\Controllers\Admin\BeneficiaryAssignController::class, 'show'])->name('beneficiaryAssign.show');
        Route::get('beneficiaryAssign/{id}/edit', [App\Http\Controllers\Admin\BeneficiaryAssignController::class, 'edit'])->name('beneficiaryAssign.edit');
        Route::delete('beneficiaryAssign/{id}', [App\Http\Controllers\Admin\BeneficiaryAssignController::class, 'destroy'])->name('beneficiaryAssign.destroy'); */

        Route::post('survey/storeDetails', [SurveyController::class, 'storeDetails'])->name('survey.storeDetails');

        Route::get('report/projectBeneficiary', [App\Http\Controllers\Admin\ReportController::class, 'projectBeneficiary'])->name('report.projectBeneficiary');
        Route::get('report/indicatorGraph', [ReportController::class, 'indicatorGraph'])->name('report.indicatorGraph');

        Route::get('report/activityReport', [ReportController::class, 'activityReport'])->name('report.activityReport');

        Route::get('report/projectReport', [ReportController::class, 'projectReport'])->name('report.projectReport');
        Route::get('report/surveyGraph', [ReportController::class, 'surveyGraph'])->name('report.surveyGraph');
        Route::resource('group', App\Http\Controllers\Admin\GroupController::class);
        Route::resource('thana', App\Http\Controllers\Admin\ThanaController::class);

    });

    Route::get('mediaValidator/{modelName}/getFields', [App\Http\Controllers\Admin\MediaValidatorController::class, 'getFields'])->name('mediaValidator.getFields');
    Route::get('helpInfo/{modelName}/{pageType}/', [App\Http\Controllers\Admin\HelpInfoController::class, 'getHelpInfo'])->name('get.HelpInfo');

    Route::get('/beneficiary/{id}/download', [App\Http\Controllers\Admin\BeneficiaryController::class, 'download'])->name('beneficiary.download');
    // Route::get('/beneficiary/{id}/employee', [App\Http\Controllers\Admin\BeneficiaryController::class, 'getEmployeeData'])->name('beneficiary.employee');
    Route::get('report/download', [ReportController::class, 'download'])->name('projectBeneficiary.download');
});
