import { createRouter, createWebHistory } from "vue-router";

// Define Route...
const routes = [
    {
        path: "",
        component: () => import("../views/admin/layout.vue"),
        beforeEnter: checkAuth,
        children: [
            // ------------------ADMIN PORTION------------------
            {
                path: "/dashboard",
                name: "dashboard.index",
                component: () => import("./../views/admin/dashboard.vue"),
            },
            {
                path: "/admin",
                name: "admin.index",
                component: () => import("./../views/admin/admin/index"),
            },
            {
                path: "/admin/create",
                name: "admin.create",
                component: () => import("./../views/admin/admin/create"),
            },
            {
                path: "/admin/:id",
                name: "admin.show",
                component: () => import("./../views/admin/admin/view"),
            },
            {
                path: "/admin/:id/edit",
                name: "admin.edit",
                component: () => import("./../views/admin/admin/create"),
            },

            // ------------------User Profile------------------
            {
                path: "/profile-details/:id",
                name: "profile.profileDetails",
                component: () =>
                    import("./../views/admin/admin/profile_details"),
            },

            // ------------------ROLE PORTION------------------
            {
                path: "/role",
                name: "role.index",
                component: () => import("./../views/admin/system/role/index"),
            },
            {
                path: "/role/create",
                name: "role.create",
                component: () => import("./../views/admin/system/role/create"),
            },
            {
                path: "/role/:id",
                name: "role.show",
                component: () => import("./../views/admin/system/role/view"),
            },
            {
                path: "/role/:id/edit",
                name: "role.edit",
                component: () => import("./../views/admin/system/role/create"),
            },
            // ------------------MENU PORTION------------------
            {
                path: "/menu",
                name: "menu.index",
                component: () => import("./../views/admin/system/menu/index"),
            },
            {
                path: "/menu/create",
                name: "menu.create",
                component: () => import("./../views/admin/system/menu/create"),
            },
            {
                path: "/menu/:id",
                name: "menu.show",
                component: () => import("./../views/admin/system/menu/view"),
            },
            {
                path: "/menu/:id/edit",
                name: "menu.edit",
                component: () => import("./../views/admin/system/menu/create"),
            },
            // ------------------SITE SETTING PORTION------------------
            {
                path: "/siteSetting",
                name: "siteSetting.show",
                component: () =>
                    import("./../views/admin/system/siteSettings/view"),
            },
            {
                path: "/siteSetting/create",
                name: "siteSetting.create",
                component: () =>
                    import("./../views/admin/system/siteSettings/create"),
            },

            {
                path: "/siteSetting/edit",
                name: "siteSetting.edit",
                component: () =>
                    import("./../views/admin/system/siteSettings/create"),
            },
            // ------------------MODULE PORTION------------------
            {
                path: "/module",
                name: "module.index",
                component: () => import("./../views/admin/system/module/index"),
            },
            {
                path: "/module/create",
                name: "module.create",
                component: () =>
                    import("./../views/admin/system/module/create"),
            },
            // ------------------ACTIVITY LOG PORTION------------------
            {
                path: "/activityLog",
                name: "activityLog.index",
                component: () =>
                    import("./../views/admin/system/activityLog/index"),
            },
            {
                path: "/activityLog/:id",
                name: "activityLog.show",
                component: () =>
                    import("./../views/admin/system/activityLog/view"),
            },

            // ------------------CATEGORY PORTION------------------
            {
                path: "/category",
                name: "category.index",
                component: () => import("./../views/admin/category/index"),
            },
            {
                path: "/category/create",
                name: "category.create",
                component: () => import("./../views/admin/category/create"),
            },
            {
                path: "/category/:id",
                name: "category.show",
                component: () => import("./../views/admin/category/view"),
            },
            {
                path: "/category/:id/edit",
                name: "category.edit",
                component: () => import("./../views/admin/category/create"),
            },

            // ------------------PROFILE PORTION------------------
            {
                path: "/profile",
                name: "profile.index",
                component: () => import("./../views/admin/profile/index"),
            },
            {
                path: "/profile/create",
                name: "profile.create",
                component: () => import("./../views/admin/profile/create"),
            },
            {
                path: "/profile/:id",
                name: "profile.show",
                component: () => import("./../views/admin/profile/view"),
            },
            {
                path: "/profile/:id/edit",
                name: "profile.edit",
                component: () => import("./../views/admin/profile/create"),
            },

            // ------------------mediaValidator PORTION------------------
            {
                path: "/mediaValidator",
                name: "mediaValidator.index",
                component: () =>
                    import("./../views/admin/mediaValidator/index"),
            },
            {
                path: "/mediaValidator/create",
                name: "mediaValidator.create",
                component: () =>
                    import("./../views/admin/mediaValidator/create"),
            },
            {
                path: "/mediaValidator/:id",
                name: "mediaValidator.show",
                component: () => import("./../views/admin/mediaValidator/view"),
            },
            {
                path: "/mediaValidator/:id/edit",
                name: "mediaValidator.edit",
                component: () =>
                    import("./../views/admin/mediaValidator/create"),
            },
            // ------------------HelpInfo PORTION------------------
            {
                path: "/helpInfo",
                name: "helpInfo.index",
                component: () => import("./../views/admin/helpInfo/index"),
            },
            {
                path: "/helpInfo/create",
                name: "helpInfo.create",
                component: () => import("./../views/admin/helpInfo/create"),
            },
            {
                path: "/helpInfo/:id",
                name: "helpInfo.show",
                component: () => import("./../views/admin/helpInfo/view"),
            },
            {
                path: "/helpInfo/:id/edit",
                name: "helpInfo.edit",
                component: () => import("./../views/admin/helpInfo/create"),
            },

            // ------------------State PORTION------------------
            {
                path: "/state",
                name: "state.index",
                component: () => import("./../views/admin/state/index"),
            },
            {
                path: "/state/create",
                name: "state.create",
                component: () => import("./../views/admin/state/create"),
            },
            {
                path: "/state/:id",
                name: "state.show",
                component: () => import("./../views/admin/state/view"),
            },
            {
                path: "/state/:id/edit",
                name: "state.edit",
                component: () => import("./../views/admin/state/create"),
            },

            // ------------------District PORTION------------------
            {
                path: "/district",
                name: "district.index",
                component: () => import("./../views/admin/district/index"),
            },
            {
                path: "/district/create",
                name: "district.create",
                component: () => import("./../views/admin/district/create"),
            },
            {
                path: "/district/:id",
                name: "district.show",
                component: () => import("./../views/admin/district/view"),
            },
            {
                path: "/district/:id/edit",
                name: "district.edit",
                component: () => import("./../views/admin/district/create"),
            },

            // ------------------Upazila PORTION------------------
            {
                path: "/upazila",
                name: "upazila.index",
                component: () => import("./../views/admin/upazila/index"),
            },
            {
                path: "/upazila/create",
                name: "upazila.create",
                component: () => import("./../views/admin/upazila/create"),
            },
            {
                path: "/upazila/:id",
                name: "upazila.show",
                component: () => import("./../views/admin/upazila/view"),
            },
            {
                path: "/upazila/:id/edit",
                name: "upazila.edit",
                component: () => import("./../views/admin/upazila/create"),
            },

            // ------------------Beneficiary PORTION------------------
            {
                path: "/beneficiary",
                name: "beneficiary.index",
                component: () => import("./../views/admin/beneficiary/index"),
            },
            {
                path: "/beneficiary/create",
                name: "beneficiary.create",
                component: () => import("./../views/admin/beneficiary/create"),
            },
            {
                path: "/beneficiary/:id",
                name: "beneficiary.show",
                component: () => import("./../views/admin/beneficiary/view"),
            },
            {
                path: "/beneficiary/:id/edit",
                name: "beneficiary.edit",
                component: () => import("./../views/admin/beneficiary/create"),
            },
            {
                path: "/beneficiary/:id/idCard",
                name: "beneficiary.idCard",
                component: () => import("./../views/admin/beneficiary/idCard"),
            },

            // ------------------Project PORTION------------------
            {
                path: "/project",
                name: "project.index",
                component: () => import("./../views/admin/project/index"),
            },
            {
                path: "/project/create",
                name: "project.create",
                component: () => import("./../views/admin/project/create"),
            },
            {
                path: "/project/:id",
                name: "project.show",
                component: () => import("./../views/admin/project/view"),
            },
            {
                path: "/project/:id/edit",
                name: "project.edit",
                component: () => import("./../views/admin/project/create"),
            },
            // ------------------ProjectActivity PORTION------------------
            {
                path: "/projectActivity",
                name: "projectActivity.index",
                component: () =>
                    import("./../views/admin/projectActivity/index"),
            },
            {
                path: "/projectActivity/create",
                name: "projectActivity.create",
                component: () =>
                    import("./../views/admin/projectActivity/create"),
            },
            {
                path: "/projectActivity/:id",
                name: "projectActivity.show",
                component: () =>
                    import("./../views/admin/projectActivity/view"),
            },
            {
                path: "/projectActivity/:id/edit",
                name: "projectActivity.edit",
                component: () =>
                    import("./../views/admin/projectActivity/create"),
            },
            // ------------------SurveyForm PORTION------------------
            {
                path: "/surveyForm",
                name: "surveyForm.index",
                component: () => import("./../views/admin/surveyForm/index"),
            },
            {
                path: "/surveyForm/create",
                name: "surveyForm.create",
                component: () => import("./../views/admin/surveyForm/create"),
            },
            {
                path: "/surveyForm/:id",
                name: "surveyForm.show",
                component: () => import("./../views/admin/surveyForm/view"),
            },
            {
                path: "/surveyForm/:id/edit",
                name: "surveyForm.edit",
                component: () => import("./../views/admin/surveyForm/create"),
            },
            // ------------------Occupation PORTION------------------
            {
                path: "/occupation",
                name: "occupation.index",
                component: () => import("./../views/admin/occupation/index"),
            },
            {
                path: "/occupation/create",
                name: "occupation.create",
                component: () => import("./../views/admin/occupation/create"),
            },
            {
                path: "/occupation/:id",
                name: "occupation.show",
                component: () => import("./../views/admin/occupation/view"),
            },
            {
                path: "/occupation/:id/edit",
                name: "occupation.edit",
                component: () => import("./../views/admin/occupation/create"),
            },

            // ------------------Exam PORTION------------------
            {
                path: "/exam",
                name: "exam.index",
                component: () => import("./../views/admin/exam/index"),
            },
            {
                path: "/exam/create",
                name: "exam.create",
                component: () => import("./../views/admin/exam/create"),
            },
            {
                path: "/exam/:id",
                name: "exam.show",
                component: () => import("./../views/admin/exam/view"),
            },
            {
                path: "/exam/:id/edit",
                name: "exam.edit",
                component: () => import("./../views/admin/exam/create"),
            },
            // ------------------Relation PORTION------------------
            {
                path: "/relation",
                name: "relation.index",
                component: () => import("./../views/admin/relation/index"),
            },
            {
                path: "/relation/create",
                name: "relation.create",
                component: () => import("./../views/admin/relation/create"),
            },
            {
                path: "/relation/:id",
                name: "relation.show",
                component: () => import("./../views/admin/relation/view"),
            },
            {
                path: "/relation/:id/edit",
                name: "relation.edit",
                component: () => import("./../views/admin/relation/create"),
            },

            // ------------------Disease PORTION------------------
            {
                path: "/disease",
                name: "disease.index",
                component: () => import("./../views/admin/disease/index"),
            },
            {
                path: "/disease/create",
                name: "disease.create",
                component: () => import("./../views/admin/disease/create"),
            },
            {
                path: "/disease/:id",
                name: "disease.show",
                component: () => import("./../views/admin/disease/view"),
            },
            {
                path: "/disease/:id/edit",
                name: "disease.edit",
                component: () => import("./../views/admin/disease/create"),
            },
            // ------------------Survey PORTION------------------
            {
                path: "/survey",
                name: "survey.index",
                component: () => import("./../views/admin/survey/index"),
            },
            {
                path: "/survey/create",
                name: "survey.create",
                component: () => import("./../views/admin/survey/create"),
            },
            {
                path: "/survey/:id",
                name: "survey.show",
                component: () => import("./../views/admin/survey/view"),
            },
            {
                path: "/survey/:id/edit",
                name: "survey.edit",
                component: () => import("./../views/admin/survey/create"),
            },
            {
                path: "/survey/:id/surveyStart",
                name: "survey.surveyStart",
                component: () =>
                    import("./../views/admin/survey/survey_create"),
            },

            // ------------------ProjectAchievementSetup PORTION------------------
            {
                path: "/projectAchievementSetup",
                name: "projectAchievementSetup.index",
                component: () =>
                    import("./../views/admin/projectAchievementSetup/index"),
            },
            {
                path: "/projectAchievementSetup/create",
                name: "projectAchievementSetup.create",
                component: () =>
                    import("./../views/admin/projectAchievementSetup/create"),
            },
            {
                path: "/projectAchievementSetup/:id",
                name: "projectAchievementSetup.show",
                component: () =>
                    import("./../views/admin/projectAchievementSetup/view"),
            },
            {
                path: "/projectAchievementSetup/:id/edit",
                name: "projectAchievementSetup.edit",
                component: () =>
                    import("./../views/admin/projectAchievementSetup/create"),
            },
            // ------------------ActivityInfo PORTION------------------
            {
                path: "/activityInfo",
                name: "activityInfo.index",
                component: () => import("./../views/admin/activityInfo/index"),
            },
            {
                path: "/activityInfo/create",
                name: "activityInfo.create",
                component: () => import("./../views/admin/activityInfo/create"),
            },
            {
                path: "/activityInfo/:id",
                name: "activityInfo.show",
                component: () => import("./../views/admin/activityInfo/view"),
            },
            {
                path: "/activityInfo/:id/edit",
                name: "activityInfo.edit",
                component: () => import("./../views/admin/activityInfo/create"),
            },
            // ------------------Wealth PORTION------------------
            {
                path: "/wealth",
                name: "wealth.index",
                component: () => import("./../views/admin/wealth/index"),
            },
            {
                path: "/wealth/create",
                name: "wealth.create",
                component: () => import("./../views/admin/wealth/create"),
            },
            {
                path: "/wealth/:id",
                name: "wealth.show",
                component: () => import("./../views/admin/wealth/view"),
            },
            {
                path: "/wealth/:id/edit",
                name: "wealth.edit",
                component: () => import("./../views/admin/wealth/create"),
            },
            // ------------------Asset PORTION------------------
            {
                path: "/asset",
                name: "asset.index",
                component: () => import("./../views/admin/asset/index"),
            },
            {
                path: "/asset/create",
                name: "asset.create",
                component: () => import("./../views/admin/asset/create"),
            },
            {
                path: "/asset/:id",
                name: "asset.show",
                component: () => import("./../views/admin/asset/view"),
            },
            {
                path: "/asset/:id/edit",
                name: "asset.edit",
                component: () => import("./../views/admin/asset/create"),
            },
            // ------------------Liability PORTION------------------
            {
                path: "/liability",
                name: "liability.index",
                component: () => import("./../views/admin/liability/index"),
            },
            {
                path: "/liability/create",
                name: "liability.create",
                component: () => import("./../views/admin/liability/create"),
            },
            {
                path: "/liability/:id",
                name: "liability.show",
                component: () => import("./../views/admin/liability/view"),
            },
            {
                path: "/liability/:id/edit",
                name: "liability.edit",
                component: () => import("./../views/admin/liability/create"),
            },
            // ------------------BeneficiaryAttendance PORTION------------------
            {
                path: "/beneficiaryAttendance",
                name: "beneficiaryAttendance.index",
                component: () =>
                    import("./../views/admin/beneficiaryAttendance/index"),
            },
            {
                path: "/beneficiaryAttendance/create",
                name: "beneficiaryAttendance.create",
                component: () =>
                    import("./../views/admin/beneficiaryAttendance/create"),
            },
            {
                path: "/beneficiaryAttendance/:id",
                name: "beneficiaryAttendance.show",
                component: () =>
                    import("./../views/admin/beneficiaryAttendance/view"),
            },
            {
                path: "/beneficiaryAttendance/:id/edit",
                name: "beneficiaryAttendance.edit",
                component: () =>
                    import("./../views/admin/beneficiaryAttendance/create"),
            },
            // ------------------BeneficiaryAssign PORTION------------------
            {
                path: "/beneficiaryAssign",
                name: "beneficiaryAssign.index",
                component: () =>
                    import("./../views/admin/beneficiaryAssign/index"),
            },
            {
                path: "/beneficiaryAssign/create",
                name: "beneficiaryAssign.create",
                component: () =>
                    import("./../views/admin/beneficiaryAssign/create"),
            },
            {
                path: "/beneficiaryAssign/:id",
                name: "beneficiaryAssign.show",
                component: () =>
                    import("./../views/admin/beneficiaryAssign/view"),
            },
            {
                path: "/beneficiaryAssign/:id/edit",
                name: "beneficiaryAssign.edit",
                component: () =>
                    import("./../views/admin/beneficiaryAssign/create"),
            },

            // ------------------Group PORTION------------------
            {
                path: "/group",
                name: "group.index",
                component: () => import("./../views/admin/group/index"),
            },
            {
                path: "/group/create",
                name: "group.create",
                component: () => import("./../views/admin/group/create"),
            },
            {
                path: "/group/:id",
                name: "group.show",
                component: () => import("./../views/admin/group/view"),
            },
            {
                path: "/group/:id/edit",
                name: "group.edit",
                component: () => import("./../views/admin/group/create"),
            },

            // Report routes
            {
                path: "/report/projectBeneficiary",
                name: "report.projectBeneficiary",
                component: () =>
                    import("./../views/admin/report/projectBeneficiary"),
            },

            {
                path: "/report/indicatorGraph",
                name: "report.indicatorGraph",
                component: () =>
                    import("./../views/admin/report/indicatorGraph"),
            },
            {
                path: "/report",
                children: [
                    {
                        path: "activityReport",
                        name: "report.activityReport",
                        component: () =>
                            import(
                                "./../views/admin/report/activitiesMonitoring"
                            ),
                    },
                    {
                        path: "projectReport",
                        name: "report.projectReport",
                        component: () =>
                            import(
                                "./../views/admin/report/projectSummaryReport"
                            ),
                    },
                    {
                        path: "surveyGraph",
                        name: "report.surveyGraph",
                        component: () =>
                            import("./../views/admin/report/surveyGraphReport"),
                    },
                ],
            },
            // ------------------Thana PORTION------------------
            {
                path: "/thana",
                name: "thana.index",
                component: () => import("./../views/admin/thana/index"),
            },
            {
                path: "/thana/create",
                name: "thana.create",
                component: () => import("./../views/admin/thana/create"),
            },
            {
                path: "/thana/:id",
                name: "thana.show",
                component: () => import("./../views/admin/thana/view"),
            },
            {
                path: "/thana/:id/edit",
                name: "thana.edit",
                component: () => import("./../views/admin/thana/create"),
            },
        ],
    },
];

// Check Authentication...
function checkAuth(to, from, next) {
    let role = localStorage.getItem("role");
    let user = localStorage.getItem("user");
    if (role && user) {
        next();
    } else {
        window.location.href = "/";
    }
}

// Initialize Router..
const router = createRouter({
    history: createWebHistory(process.env.MIX_VUE_ROUTER_BASE + "/admin/"),
    // scrollBehavior() {
    //     document.getElementById("app").scrollIntoView({
    //         behavior: "smooth",
    //     });
    // },

    linkExactActiveClass: "active",
    routes,
});

export default router;
