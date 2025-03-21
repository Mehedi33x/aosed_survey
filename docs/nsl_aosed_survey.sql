-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 12, 2025 at 02:56 PM
-- Server version: 5.7.44
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nsl_aosed_survey`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_attendance_summary_views`
--
CREATE TABLE IF NOT EXISTS `activity_attendance_summary_views` (
`project_id` bigint(20) unsigned
,`indicator_id` bigint(20) unsigned
,`activity_id` bigint(20) unsigned
,`beneficiary_assign_count` bigint(21)
,`beneficiary_present_count` bigint(21)
,`present_percentage` decimal(27,4)
);

-- --------------------------------------------------------

--
-- Table structure for table `activity_infos`
--

CREATE TABLE IF NOT EXISTS `activity_infos` (
  `id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `indicator_id` bigint(20) unsigned NOT NULL,
  `activity_id` bigint(20) unsigned NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `execute_by` bigint(20) unsigned NOT NULL,
  `execute_date` date DEFAULT NULL,
  `total_beneficiary` int(11) NOT NULL DEFAULT '0',
  `image` text COLLATE utf8mb4_unicode_ci,
  `file` text COLLATE utf8mb4_unicode_ci,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_infos`
--

INSERT INTO `activity_infos` (`id`, `project_id`, `indicator_id`, `activity_id`, `group_id`, `execute_by`, `execute_date`, `total_beneficiary`, `image`, `file`, `remarks`, `created_at`, `updated_at`) VALUES
(59, 67, 237, 114, 7, 1, '2025-02-22', 20, NULL, NULL, NULL, '2025-02-22 09:54:58', '2025-02-22 09:54:58'),
(60, 67, 239, 119, NULL, 1, '2025-02-25', 220, NULL, NULL, NULL, '2025-02-25 11:50:00', '2025-02-25 11:50:00'),
(61, 67, 239, 118, NULL, 1, '2025-02-18', 20, NULL, NULL, NULL, '2025-02-25 12:29:59', '2025-02-25 12:29:59'),
(62, 68, 241, 120, NULL, 1, '2025-03-02', 10, NULL, NULL, NULL, '2025-03-02 06:48:33', '2025-03-02 06:48:33'),
(63, 68, 241, 121, NULL, 1, '2025-03-02', 15, NULL, NULL, NULL, '2025-03-02 06:48:44', '2025-03-02 06:48:44'),
(64, 70, 242, 122, NULL, 1, '2025-03-02', 8, NULL, NULL, 'null', '2025-03-02 06:48:57', '2025-03-04 11:13:24'),
(65, 67, 243, 123, NULL, 1, '2025-03-02', 10, NULL, NULL, 'null', '2025-03-02 06:49:09', '2025-03-04 11:17:20'),
(68, 70, 238, 126, 6, 1, '2025-03-04', 5, NULL, NULL, 'null', '2025-03-04 04:07:01', '2025-03-04 11:10:20'),
(69, 67, 240, 120, NULL, 1, '2025-03-19', 23, NULL, 'upload/activityInfo/20250304101623file-example_PDF_500_kB.pdf', 'Rty', '2025-03-04 16:23:16', '2025-03-04 16:23:16'),
(70, 67, 240, 119, NULL, 1, '2025-03-19', 23, NULL, 'upload/activityInfo/20250304102125file-example_PDF_500_kB.pdf', 'Rty', '2025-03-04 16:25:21', '2025-03-04 16:25:21'),
(71, 69, 245, 125, NULL, 1, '2025-03-26', 25, NULL, NULL, 'Xx', '2025-03-11 15:45:53', '2025-03-11 15:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint(20) unsigned NOT NULL,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `event` varchar(191) DEFAULT NULL,
  `batch_uuid` varchar(191) DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('r','ur','restored') NOT NULL DEFAULT 'ur' COMMENT 'r=read, ur=unread'
) ENGINE=InnoDB AUTO_INCREMENT=852 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `batch_uuid`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`, `status`) VALUES
(501, 'Exam', 'Nogor Solutions - created this', 'App\\Models\\Exam', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 2, "level": "noncertified", "title": "Sunt accusamus conse", "status": "active", "sorting": 20, "created_at": "2024-10-10T10:26:11.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:26:11.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:26:11', '2024-10-10 04:26:11', 'ur'),
(502, 'Exam', 'Nogor Solutions - created this', 'App\\Models\\Exam', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 3, "level": "certified", "title": "Molestiae minim libe", "status": "deactive", "sorting": 44, "created_at": "2024-10-10T10:28:38.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:28:38.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:28:38', '2024-10-10 04:28:38', 'ur'),
(503, 'Exam', 'Nogor Solutions - created this', 'App\\Models\\Exam', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 4, "level": "Certified", "title": "1", "status": "active", "sorting": 4, "created_at": "2024-10-10T10:36:42.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:36:42.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:36:42', '2024-10-10 04:36:42', 'ur'),
(504, 'Exam', 'Nogor Solutions - updated this', 'App\\Models\\Exam', 4, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"title": 1, "updated_at": "2024-10-10T10:36:42.000000Z"}, "attributes": {"title": 2, "updated_at": "2024-10-10T10:37:06.000000Z"}}', '2024-10-10 04:37:06', '2024-10-10 04:37:06', 'ur'),
(505, 'Exam', 'Nogor Solutions - updated this', 'App\\Models\\Exam', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"title": "Dolorem similique et", "status": "active", "sorting": 49, "updated_at": "2024-10-10T10:23:45.000000Z"}, "attributes": {"title": "Dolorem similique", "status": "deactive", "sorting": 5, "updated_at": "2024-10-10T10:46:15.000000Z"}}', '2024-10-10 04:46:15', '2024-10-10 04:46:15', 'ur'),
(506, 'Exam', 'Nogor Solutions - created this', 'App\\Models\\Exam', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 5, "level": "Noncertified", "title": "Laboriosam voluptat", "status": "active", "sorting": 89, "created_at": "2024-10-10T10:50:23.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:50:23.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:50:23', '2024-10-10 04:50:23', 'ur'),
(507, 'Exam', 'Nogor Solutions - created this', 'App\\Models\\Exam', 6, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 6, "level": "Noncertified", "title": "Amet enim repellend", "status": "deactive", "sorting": 79, "created_at": "2024-10-10T10:50:32.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:50:32.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:50:32', '2024-10-10 04:50:32', 'ur'),
(508, 'Exam', 'Nogor Solutions - created this', 'App\\Models\\Exam', 7, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 7, "level": "Noncertified", "title": "Aut id adipisicing", "status": "deactive", "sorting": 47, "created_at": "2024-10-10T10:50:39.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:50:39.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:50:39', '2024-10-10 04:50:39', 'ur'),
(509, 'Exam', 'Nogor Solutions - updated this', 'App\\Models\\Exam', 7, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"level": "Noncertified", "updated_at": "2024-10-10T10:50:39.000000Z"}, "attributes": {"level": "Certified", "updated_at": "2024-10-10T10:50:51.000000Z"}}', '2024-10-10 04:50:51', '2024-10-10 04:50:51', 'ur'),
(510, 'Exam', 'Nogor Solutions - updated this', 'App\\Models\\Exam', 3, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"level": "Certified", "updated_at": "2024-10-10T10:28:38.000000Z"}, "attributes": {"level": "Noncertified", "updated_at": "2024-10-10T10:50:58.000000Z"}}', '2024-10-10 04:50:58', '2024-10-10 04:50:58', 'ur'),
(511, 'Exam', 'Nogor Solutions - updated this', 'App\\Models\\Exam', 6, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"title": "Amet enim repellend", "updated_at": "2024-10-10T10:50:32.000000Z"}, "attributes": {"title": "Amet enim repellendo", "updated_at": "2024-10-10T10:52:30.000000Z"}}', '2024-10-10 04:52:30', '2024-10-10 04:52:30', 'ur'),
(512, 'Exam', 'Nogor Solutions - deleted this', 'App\\Models\\Exam', 6, 'deleted', NULL, 'App\\Models\\Admin', 1, '{"old": {"id": 6, "level": "Noncertified", "title": "Amet enim repellendo", "status": "deactive", "sorting": 79, "created_at": "2024-10-10T10:50:32.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:52:30.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:53:16', '2024-10-10 04:53:16', 'ur'),
(513, 'Menu', 'Nogor Solutions - created this', 'App\\Models\\System\\Menu', 46, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 46, "icon": "<i class=''fa fa-circle-o text-aqua''></i>", "params": null, "sorting": 0, "menu_name": "Relation", "parent_id": null, "created_at": "2024-10-10T10:55:53.000000Z", "route_name": "relation.index", "updated_at": "2024-10-10T10:55:53.000000Z", "show_profile": 0, "show_dasboard": 0}}', '2024-10-10 04:55:53', '2024-10-10 04:55:53', 'ur'),
(514, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 289, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 289, "name": "RelationController", "route": null, "parent_id": null}}', '2024-10-10 04:56:44', '2024-10-10 04:56:44', 'ur'),
(515, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 290, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 290, "name": "index", "route": "relation.index", "parent_id": 289}}', '2024-10-10 04:56:44', '2024-10-10 04:56:44', 'ur'),
(516, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 291, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 291, "name": "create", "route": "relation.create", "parent_id": 289}}', '2024-10-10 04:56:44', '2024-10-10 04:56:44', 'ur'),
(517, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 292, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 292, "name": "store", "route": "relation.store", "parent_id": 289}}', '2024-10-10 04:56:44', '2024-10-10 04:56:44', 'ur'),
(518, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 293, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 293, "name": "show", "route": "relation.show", "parent_id": 289}}', '2024-10-10 04:56:44', '2024-10-10 04:56:44', 'ur'),
(519, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 294, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 294, "name": "edit", "route": "relation.edit", "parent_id": 289}}', '2024-10-10 04:56:44', '2024-10-10 04:56:44', 'ur'),
(520, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 295, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 295, "name": "update", "route": "relation.update", "parent_id": 289}}', '2024-10-10 04:56:44', '2024-10-10 04:56:44', 'ur'),
(521, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 296, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 296, "name": "destroy", "route": "relation.destroy", "parent_id": 289}}', '2024-10-10 04:56:44', '2024-10-10 04:56:44', 'ur'),
(522, 'Relation', 'Nogor Solutions - created this', 'App\\Models\\Relation', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 1, "title": "Incidunt est fuga", "status": "deactive", "created_at": "2024-10-10T10:58:53.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:58:53.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:58:53', '2024-10-10 04:58:53', 'ur'),
(523, 'Relation', 'Nogor Solutions - created this', 'App\\Models\\Relation', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 2, "title": "In velit et odio sed", "status": "deactive", "created_at": "2024-10-10T10:58:57.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:58:57.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:58:57', '2024-10-10 04:58:57', 'ur'),
(524, 'Relation', 'Nogor Solutions - created this', 'App\\Models\\Relation', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 3, "title": "Voluptatem Porro ve", "status": "deactive", "created_at": "2024-10-10T10:59:01.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:59:01.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:59:01', '2024-10-10 04:59:01', 'ur'),
(525, 'Relation', 'Nogor Solutions - created this', 'App\\Models\\Relation', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 4, "title": "Est in non sunt sit", "status": "active", "created_at": "2024-10-10T10:59:05.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:59:05.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:59:05', '2024-10-10 04:59:05', 'ur'),
(526, 'Relation', 'Nogor Solutions - created this', 'App\\Models\\Relation', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 5, "title": "Perspiciatis fugit", "status": "active", "created_at": "2024-10-10T10:59:10.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:59:10.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:59:10', '2024-10-10 04:59:10', 'ur'),
(527, 'Relation', 'Nogor Solutions - created this', 'App\\Models\\Relation', 6, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 6, "title": "Nulla in quaerat nis", "status": "active", "created_at": "2024-10-10T10:59:14.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T10:59:14.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 04:59:14', '2024-10-10 04:59:14', 'ur'),
(528, 'Relation', 'Nogor Solutions - created this', 'App\\Models\\Relation', 7, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 7, "title": "Non ex quia accusamu", "status": "active", "sorting": 22, "created_at": "2024-10-10T11:03:47.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T11:03:47.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 05:03:47', '2024-10-10 05:03:47', 'ur'),
(529, 'Relation', 'Nogor Solutions - updated this', 'App\\Models\\Relation', 7, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"sorting": 22, "updated_at": "2024-10-10T11:03:47.000000Z"}, "attributes": {"sorting": 23, "updated_at": "2024-10-10T11:03:51.000000Z"}}', '2024-10-10 05:03:51', '2024-10-10 05:03:51', 'ur'),
(530, 'Relation', 'Nogor Solutions - created this', 'App\\Models\\Relation', 8, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 8, "title": "Voluptates vel tenet", "status": "active", "sorting": 40, "created_at": "2024-10-10T11:03:59.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T11:03:59.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 05:03:59', '2024-10-10 05:03:59', 'ur'),
(531, 'Relation', 'Nogor Solutions - created this', 'App\\Models\\Relation', 9, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 9, "title": "Est enim quis ducimu", "status": "active", "sorting": 45, "created_at": "2024-10-10T11:04:23.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T11:04:23.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 05:04:23', '2024-10-10 05:04:23', 'ur'),
(532, 'Relation', 'Nogor Solutions - created this', 'App\\Models\\Relation', 10, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 10, "title": "Dolor repellendus S", "status": "active", "sorting": 71, "created_at": "2024-10-10T11:04:38.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-10T11:04:38.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-10 05:04:38', '2024-10-10 05:04:38', 'ur'),
(533, 'Relation', 'Nogor Solutions - updated this', 'App\\Models\\Relation', 9, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"status": "active", "updated_at": "2024-10-10T11:04:23.000000Z"}, "attributes": {"status": "deactive", "updated_at": "2024-10-10T11:04:41.000000Z"}}', '2024-10-10 05:04:41', '2024-10-10 05:04:41', 'ur'),
(534, 'Relation', 'Nogor Solutions - updated this', 'App\\Models\\Relation', 8, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"status": "active", "updated_at": "2024-10-10T11:03:59.000000Z"}, "attributes": {"status": "deactive", "updated_at": "2024-10-10T11:04:45.000000Z"}}', '2024-10-10 05:04:45', '2024-10-10 05:04:45', 'ur'),
(535, 'UserLoginHistory', 'Nogor Solutions - created this', 'App\\Models\\UserLoginHistory', 127, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 127, "status": "active", "sorting": 0, "user_id": 1, "login_at": "2024-10-13 03:26:38", "login_ip": "::1", "created_at": "2024-10-13T03:26:38.000000Z", "updated_at": "2024-10-13T03:26:38.000000Z", "user_guard": "admin", "login_browser_client": "Google Chrome"}}', '2024-10-12 21:26:38', '2024-10-12 21:26:38', 'ur'),
(536, 'Upazila', 'Nogor Solutions - created this', 'App\\Models\\Upazila', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 4, "name": "Nogor Solutions Limited", "status": "active", "sorting": 4, "state_id": 1, "created_at": "2024-10-13T04:16:18.000000Z", "deleted_at": null, "updated_at": "2024-10-13T04:16:18.000000Z", "district_id": 8}}', '2024-10-12 22:16:18', '2024-10-12 22:16:18', 'ur'),
(537, 'Upazila', 'Nogor Solutions - updated this', 'App\\Models\\Upazila', 2, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"state_id": 1, "updated_at": "2024-10-10T06:29:10.000000Z", "district_id": 1}, "attributes": {"state_id": 3, "updated_at": "2024-10-13T04:20:35.000000Z", "district_id": 4}}', '2024-10-12 22:20:35', '2024-10-12 22:20:35', 'ur'),
(538, 'Menu', 'Nogor Solutions - created this', 'App\\Models\\System\\Menu', 47, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 47, "icon": "<i class=''fa fa-circle-o text-aqua''></i>", "params": null, "sorting": 0, "menu_name": "Disease", "parent_id": null, "created_at": "2024-10-13T05:01:14.000000Z", "route_name": "disease.index", "updated_at": "2024-10-13T05:01:14.000000Z", "show_profile": 0, "show_dasboard": 0}}', '2024-10-12 23:01:14', '2024-10-12 23:01:14', 'ur'),
(539, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 297, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 297, "name": "DiseaseController", "route": null, "parent_id": null}}', '2024-10-12 23:02:34', '2024-10-12 23:02:34', 'ur'),
(540, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 298, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 298, "name": "index", "route": "disease.index", "parent_id": 297}}', '2024-10-12 23:02:34', '2024-10-12 23:02:34', 'ur'),
(541, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 299, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 299, "name": "create", "route": "disease.create", "parent_id": 297}}', '2024-10-12 23:02:34', '2024-10-12 23:02:34', 'ur'),
(542, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 300, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 300, "name": "store", "route": "disease.store", "parent_id": 297}}', '2024-10-12 23:02:34', '2024-10-12 23:02:34', 'ur'),
(543, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 301, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 301, "name": "show", "route": "disease.show", "parent_id": 297}}', '2024-10-12 23:02:34', '2024-10-12 23:02:34', 'ur'),
(544, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 302, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 302, "name": "edit", "route": "disease.edit", "parent_id": 297}}', '2024-10-12 23:02:34', '2024-10-12 23:02:34', 'ur'),
(545, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 303, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 303, "name": "update", "route": "disease.update", "parent_id": 297}}', '2024-10-12 23:02:34', '2024-10-12 23:02:34', 'ur'),
(546, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 304, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 304, "name": "destroy", "route": "disease.destroy", "parent_id": 297}}', '2024-10-12 23:02:34', '2024-10-12 23:02:34', 'ur'),
(547, 'Disease', 'Nogor Solutions - created this', 'App\\Models\\Disease', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 1, "type": null, "title": "a", "status": "deactive", "remarks": "a", "sorting": 1, "created_at": "2024-10-13T06:33:23.000000Z", "updated_at": "2024-10-13T06:33:23.000000Z", "description": "<p>a</p>"}}', '2024-10-13 00:33:23', '2024-10-13 00:33:23', 'ur'),
(548, 'Disease', 'Nogor Solutions - created this', 'App\\Models\\Disease', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 2, "type": "infectious", "title": "a", "status": "active", "remarks": "a", "sorting": 2, "created_at": "2024-10-13T06:33:55.000000Z", "updated_at": "2024-10-13T06:33:55.000000Z", "description": "<p>a</p>"}}', '2024-10-13 00:33:55', '2024-10-13 00:33:55', 'ur'),
(549, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 2, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"sorting": 2, "updated_at": "2024-10-13T06:33:55.000000Z", "description": "<p>a</p>"}, "attributes": {"sorting": 3, "updated_at": "2024-10-13T06:42:53.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\n\\n<p>```<br />\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\n\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\n\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\n\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\n```</p>\\n\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\n&nbsp;</p>"}}', '2024-10-13 00:42:53', '2024-10-13 00:42:53', 'ur'),
(550, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"type": null, "sorting": 1, "updated_at": "2024-10-13T06:33:23.000000Z", "description": "<p>a</p>"}, "attributes": {"type": "Deficiency", "sorting": 3, "updated_at": "2024-10-13T06:43:34.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\n\\n<p>```<br />\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\n\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\n\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\n\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\n```</p>\\n\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\n&nbsp;</p>"}}', '2024-10-13 00:43:34', '2024-10-13 00:43:34', 'ur'),
(551, 'Disease', 'Nogor Solutions - created this', 'App\\Models\\Disease', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 3, "type": "Infectious", "title": "asdasd", "status": "active", "remarks": null, "sorting": 3, "created_at": "2024-10-13T06:43:52.000000Z", "updated_at": "2024-10-13T06:43:52.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\n\\n<p>```<br />\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\n\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\n\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\n\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\n```</p>\\n\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\n&nbsp;</p>\\n\\n<p>asd</p>"}}', '2024-10-13 00:43:52', '2024-10-13 00:43:52', 'ur'),
(552, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 3, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"sorting": 3, "updated_at": "2024-10-13T06:43:52.000000Z"}, "attributes": {"sorting": 2, "updated_at": "2024-10-13T06:57:12.000000Z"}}', '2024-10-13 00:57:12', '2024-10-13 00:57:12', 'ur'),
(553, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 3, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"sorting": 2, "updated_at": "2024-10-13T06:57:12.000000Z"}, "attributes": {"sorting": 1, "updated_at": "2024-10-13T06:57:13.000000Z"}}', '2024-10-13 00:57:13', '2024-10-13 00:57:13', 'ur'),
(554, 'Disease', 'Nogor Solutions - created this', 'App\\Models\\Disease', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 4, "type": "Physiological", "title": "Laborum Dolorem et", "status": "deactive", "remarks": "Aut amet consectetu", "sorting": 9, "created_at": "2024-10-13T07:03:13.000000Z", "updated_at": "2024-10-13T07:03:13.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\n\\n<p>```<br />\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\n\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\n\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\n\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\n```</p>\\n\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\n&nbsp;</p>"}}', '2024-10-13 01:03:13', '2024-10-13 01:03:13', 'ur'),
(555, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 4, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"status": "deactive", "sorting": 9, "updated_at": "2024-10-13T07:03:13.000000Z"}, "attributes": {"status": "active", "sorting": 5, "updated_at": "2024-10-13T07:03:21.000000Z"}}', '2024-10-13 01:03:21', '2024-10-13 01:03:21', 'ur'),
(556, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 4, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"status": "active", "updated_at": "2024-10-13T07:03:21.000000Z"}, "attributes": {"status": "deactive", "updated_at": "2024-10-13T07:03:26.000000Z"}}', '2024-10-13 01:03:26', '2024-10-13 01:03:26', 'ur'),
(557, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"title": "a", "remarks": "a", "sorting": 3, "updated_at": "2024-10-13T06:43:34.000000Z"}, "attributes": {"title": "Ipsa perspiciatis", "remarks": "Ab aut sit rem libe", "sorting": 47, "updated_at": "2024-10-13T07:03:40.000000Z"}}', '2024-10-13 01:03:40', '2024-10-13 01:03:40', 'ur'),
(558, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 4, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"title": "Laborum Dolorem et", "updated_at": "2024-10-13T07:03:26.000000Z"}, "attributes": {"title": "Laborum Dolorem etlp", "updated_at": "2024-10-13T07:05:41.000000Z"}}', '2024-10-13 01:05:41', '2024-10-13 01:05:41', 'ur'),
(559, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 4, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"remarks": "Aut amet consectetu", "updated_at": "2024-10-13T07:05:41.000000Z"}, "attributes": {"remarks": "Aut amet consectetua", "updated_at": "2024-10-13T07:05:56.000000Z"}}', '2024-10-13 01:05:56', '2024-10-13 01:05:56', 'ur'),
(560, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 3, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"title": "asdasd", "remarks": null, "sorting": 1, "updated_at": "2024-10-13T06:57:13.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\n\\n<p>```<br />\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\n\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\n\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\n\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\n```</p>\\n\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\n&nbsp;</p>\\n\\n<p>asd</p>"}, "attributes": {"title": "Odit quod ut sunt n", "remarks": "Nemo minim in iusto", "sorting": 85, "updated_at": "2024-10-13T07:07:34.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\n\\n<p>```<br />\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\n\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\n\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\n\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\n```</p>\\n\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\n&nbsp;</p>"}}', '2024-10-13 01:07:34', '2024-10-13 01:07:34', 'ur'),
(561, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 2, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"title": "a", "remarks": "a", "sorting": 3, "updated_at": "2024-10-13T06:42:53.000000Z"}, "attributes": {"title": "Iusto asperiores in", "remarks": "Sint ea deserunt ali", "sorting": 89, "updated_at": "2024-10-13T07:07:45.000000Z"}}', '2024-10-13 01:07:45', '2024-10-13 01:07:45', 'ur'),
(562, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 4, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"status": "deactive", "updated_at": "2024-10-13T07:05:56.000000Z"}, "attributes": {"status": "active", "updated_at": "2024-10-13T07:07:57.000000Z"}}', '2024-10-13 01:07:57', '2024-10-13 01:07:57', 'ur'),
(563, 'Disease', 'Nogor Solutions - created this', 'App\\Models\\Disease', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 5, "type": "Deficiency", "title": "Dicta magni qui et f", "status": "active", "remarks": "Id distinctio Ea du", "sorting": 96, "created_at": "2024-10-13T07:11:13.000000Z", "updated_at": "2024-10-13T07:11:13.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\n\\n<p>```<br />\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\n\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\n\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\n\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\n\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\n\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\n```</p>\\n\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\n&nbsp;</p>"}}', '2024-10-13 01:11:13', '2024-10-13 01:11:13', 'ur'),
(564, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"status": "active", "updated_at": "2024-10-13T07:11:13.000000Z"}, "attributes": {"status": "deactive", "updated_at": "2024-10-13T07:11:39.000000Z"}}', '2024-10-13 01:11:39', '2024-10-13 01:11:39', 'ur'),
(565, 'Disease', 'Nogor Solutions - created this', 'App\\Models\\Disease', 6, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 6, "type": "Deficiency", "title": "Sed maxime et except", "status": "active", "remarks": "Eligendi fuga Ut co", "sorting": 14, "created_at": "2024-10-13T08:51:29.000000Z", "updated_at": "2024-10-13T08:51:29.000000Z", "description": null}}', '2024-10-13 02:51:29', '2024-10-13 02:51:29', 'ur'),
(566, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 6, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"updated_at": "2024-10-13T08:51:29.000000Z"}, "attributes": {"updated_at": "2024-10-13T08:55:59.000000Z"}}', '2024-10-13 02:55:59', '2024-10-13 02:55:59', 'ur');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `batch_uuid`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`, `status`) VALUES
(567, 'Disease', 'Nogor Solutions - updated this', 'App\\Models\\Disease', 6, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"updated_at": "2024-10-13T08:55:59.000000Z", "description": null}, "attributes": {"updated_at": "2024-10-13T08:56:18.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\r\\n\\r\\n<p>```<br />\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\r\\n\\r\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\r\\n\\r\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\r\\n\\r\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\r\\n```</p>\\r\\n\\r\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\r\\n&nbsp;</p>"}}', '2024-10-13 02:56:18', '2024-10-13 02:56:18', 'ur'),
(568, 'Disease', 'Nogor Solutions - created this', 'App\\Models\\Disease', 7, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 7, "type": "Hereditary", "title": "Dolore minima qui im", "status": "active", "remarks": "Sed nobis ipsam solu", "sorting": 21, "created_at": "2024-10-13T08:56:52.000000Z", "updated_at": "2024-10-13T08:56:52.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\r\\n\\r\\n<p>```<br />\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\r\\n\\r\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\r\\n\\r\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\r\\n\\r\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\r\\n```</p>\\r\\n\\r\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\r\\n&nbsp;</p>"}}', '2024-10-13 02:56:52', '2024-10-13 02:56:52', 'ur'),
(569, 'Disease', 'Nogor Solutions - created this', 'App\\Models\\Disease', 8, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 8, "type": "Deficiency", "title": "Inventore laboriosam", "status": "active", "remarks": "Quas quo praesentium", "sorting": 78, "created_at": "2024-10-13T08:57:21.000000Z", "updated_at": "2024-10-13T08:57:21.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\r\\n\\r\\n<p>```<br />\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\r\\n\\r\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\r\\n\\r\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\r\\n\\r\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\r\\n```</p>\\r\\n\\r\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\r\\n&nbsp;</p>"}}', '2024-10-13 02:57:21', '2024-10-13 02:57:21', 'ur'),
(570, 'Disease', 'Nogor Solutions - created this', 'App\\Models\\Disease', 9, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 9, "type": "Physiological", "title": "Repudiandae in eum a", "status": "active", "remarks": "Omnis incidunt moll Claro, aquí tienes un texto \\"Lorem Ipsum\\" de 50 líneas:\\r\\n\\r\\n```\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\r\\n\\r\\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\\r\\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\r\\nAt ero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.\\r\\nNam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\\r\\n\\r\\nQuis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.\\r\\nBlanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.\\r\\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\\r\\nEspero que te sea útil. Si necesitas algo diferente, ¡hazmelo saber!", "sorting": 50, "created_at": "2024-10-13T08:58:40.000000Z", "updated_at": "2024-10-13T08:58:40.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\r\\n\\r\\n<p>```<br />\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\r\\n\\r\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\r\\n\\r\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\r\\n\\r\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\r\\n```</p>\\r\\n\\r\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\r\\n&nbsp;</p>"}}', '2024-10-13 02:58:40', '2024-10-13 02:58:40', 'ur'),
(571, 'Disease', 'Nogor Solutions - created this', 'App\\Models\\Disease', 10, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 10, "type": "Hereditary", "title": "Odit nostrum ullamco", "status": "active", "remarks": "Claro, aquí tienes un texto \\"Lorem Ipsum\\" de 50 líneas:\\r\\n\\r\\n```\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\r\\n\\r\\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\\r\\n\\r\\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\r\\n\\r\\nAt vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.\\r\\n\\r\\nNam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\\r\\n\\r\\nQuis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.\\r\\n\\r\\nBlanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.\\r\\n\\r\\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\\r\\n```\\r\\n\\r\\nEspero que te sea útil. Si necesitas algo diferente, ¡hazmelo saber!", "sorting": 73, "created_at": "2024-10-13T08:58:51.000000Z", "updated_at": "2024-10-13T08:58:51.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\r\\n\\r\\n<p>```<br />\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\r\\n\\r\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\r\\n\\r\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\r\\n\\r\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\r\\n```</p>\\r\\n\\r\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\r\\n&nbsp;</p>"}}', '2024-10-13 02:58:51', '2024-10-13 02:58:51', 'ur'),
(572, 'Disease', 'Nogor Solutions - created this', 'App\\Models\\Disease', 11, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 11, "type": "Physiological", "title": "Do et impedit ratio", "status": "active", "remarks": "Laudantium eius con", "sorting": 22, "created_at": "2024-10-13T08:59:00.000000Z", "updated_at": "2024-10-13T08:59:00.000000Z", "description": "<p>Claro, aqu&iacute; tienes un texto &quot;Lorem Ipsum&quot; de 50 l&iacute;neas:</p>\\r\\n\\r\\n<p>```<br />\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\\r\\n\\r\\n<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>\\r\\n\\r\\n<p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>\\r\\n\\r\\n<p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.</p>\\r\\n\\r\\n<p>Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>\\r\\n\\r\\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.<br />\\r\\n```</p>\\r\\n\\r\\n<p>Espero que te sea &uacute;til. Si necesitas algo diferente, &iexcl;hazmelo saber!<br />\\r\\n&nbsp;</p>"}}', '2024-10-13 02:59:00', '2024-10-13 02:59:00', 'ur'),
(573, 'UserLoginHistory', 'Nogor Solutions - created this', 'App\\Models\\UserLoginHistory', 128, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 128, "status": "active", "sorting": 0, "user_id": 1, "login_at": "2024-10-13 09:03:33", "login_ip": "::1", "created_at": "2024-10-13T09:03:33.000000Z", "updated_at": "2024-10-13T09:03:33.000000Z", "user_guard": "admin", "login_browser_client": "Google Chrome"}}', '2024-10-13 03:03:33', '2024-10-13 03:03:33', 'ur'),
(574, 'UserLoginHistory', 'Nogor Solutions - created this', 'App\\Models\\UserLoginHistory', 129, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 129, "status": "active", "sorting": 0, "user_id": 1, "login_at": "2024-10-15 06:31:58", "login_ip": "::1", "created_at": "2024-10-15T06:31:58.000000Z", "updated_at": "2024-10-15T06:31:58.000000Z", "user_guard": "admin", "login_browser_client": "Google Chrome"}}', '2024-10-15 00:31:58', '2024-10-15 00:31:58', 'ur'),
(575, 'Menu', 'Nogor Solutions - created this', 'App\\Models\\System\\Menu', 48, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 48, "icon": "<i class=''fas fa-project-diagram''></i>", "params": null, "sorting": 23, "menu_name": "Project", "parent_id": null, "created_at": "2024-10-15T07:03:21.000000Z", "route_name": "project.index", "updated_at": "2024-10-15T07:03:21.000000Z", "show_profile": 0, "show_dasboard": 0}}', '2024-10-15 01:03:21', '2024-10-15 01:03:21', 'ur'),
(576, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 1, "status": "deactive", "sorting": 0, "end_date": "2024-10-03", "state_id": 1, "objective": "Corrupti omnis ad v", "created_at": "2024-10-15T11:13:24.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 3, "updated_at": "2024-10-15T11:13:24.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Fatima Fischer"}}', '2024-10-15 05:13:24', '2024-10-15 05:13:24', 'ur'),
(577, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 2, "status": "deactive", "sorting": 0, "end_date": "2024-10-03", "state_id": 1, "objective": "Corrupti omnis ad v", "created_at": "2024-10-15T11:13:30.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 3, "updated_at": "2024-10-15T11:13:30.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Fatima Fischer"}}', '2024-10-15 05:13:30', '2024-10-15 05:13:30', 'ur'),
(578, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 3, "status": "deactive", "sorting": 0, "end_date": "2024-10-03", "state_id": 1, "objective": "Corrupti omnis ad v", "created_at": "2024-10-15T11:17:44.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 3, "updated_at": "2024-10-15T11:17:44.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Fatima Fischer"}}', '2024-10-15 05:17:44', '2024-10-15 05:17:44', 'ur'),
(579, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 1, "title": "", "status": "deactive", "sorting": 0, "created_at": "2024-10-15T11:17:44.000000Z", "created_by": null, "created_ip": null, "project_id": 3, "total_mark": 0, "updated_at": "2024-10-15T11:17:44.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-15 05:17:44', '2024-10-15 05:17:44', 'ur'),
(580, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 4, "status": "active", "sorting": 0, "end_date": "2024-10-02", "state_id": 1, "objective": "Laboriosam quia off", "created_at": "2024-10-15T11:22:24.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 3, "updated_at": "2024-10-15T11:22:24.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Tucker Lane"}}', '2024-10-15 05:22:24', '2024-10-15 05:22:24', 'ur'),
(581, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 2, "title": "", "status": "deactive", "sorting": 0, "created_at": "2024-10-15T11:22:24.000000Z", "created_by": null, "created_ip": null, "project_id": 4, "total_mark": 0, "updated_at": "2024-10-15T11:22:24.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-15 05:22:24', '2024-10-15 05:22:24', 'ur'),
(582, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 5, "status": "active", "sorting": 0, "end_date": "2024-10-09", "state_id": 3, "objective": "Aliquip quidem adipi", "created_at": "2024-10-15T11:23:40.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 2, "updated_at": "2024-10-15T11:23:40.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Sacha Wilcox"}}', '2024-10-15 05:23:40', '2024-10-15 05:23:40', 'ur'),
(583, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 6, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 6, "status": "active", "sorting": 0, "end_date": "2024-10-09", "state_id": 3, "objective": "Aliquip quidem adipi", "created_at": "2024-10-15T11:27:10.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 2, "updated_at": "2024-10-15T11:27:10.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Sacha Wilcox"}}', '2024-10-15 05:27:10', '2024-10-15 05:27:10', 'ur'),
(584, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 7, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 7, "status": "active", "sorting": 0, "end_date": "2024-10-09", "state_id": 3, "objective": "Aliquip quidem adipi", "created_at": "2024-10-15T11:27:35.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 2, "updated_at": "2024-10-15T11:27:35.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Sacha Wilcox"}}', '2024-10-15 05:27:35', '2024-10-15 05:27:35', 'ur'),
(585, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 8, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 8, "status": "active", "sorting": 0, "end_date": "2024-10-09", "state_id": 3, "objective": "Aliquip quidem adipi", "created_at": "2024-10-15T11:27:45.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 2, "updated_at": "2024-10-15T11:27:45.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Sacha Wilcox"}}', '2024-10-15 05:27:45', '2024-10-15 05:27:45', 'ur'),
(586, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 9, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 9, "status": "active", "sorting": 0, "end_date": "2024-10-09", "state_id": 3, "objective": "Aliquip quidem adipi", "created_at": "2024-10-15T11:29:01.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 2, "updated_at": "2024-10-15T11:29:01.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Sacha Wilcox"}}', '2024-10-15 05:29:01', '2024-10-15 05:29:01', 'ur'),
(587, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 10, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 10, "status": "active", "sorting": 0, "end_date": "2024-10-09", "state_id": 3, "objective": "Aliquip quidem adipi", "created_at": "2024-10-15T11:29:47.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 2, "updated_at": "2024-10-15T11:29:47.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Sacha Wilcox"}}', '2024-10-15 05:29:47', '2024-10-15 05:29:47', 'ur'),
(588, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 11, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 11, "status": "active", "sorting": 0, "end_date": "2024-10-09", "state_id": 3, "objective": "Aliquip quidem adipi", "created_at": "2024-10-15T11:30:02.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 2, "updated_at": "2024-10-15T11:30:02.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Sacha Wilcox"}}', '2024-10-15 05:30:02', '2024-10-15 05:30:02', 'ur'),
(589, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 3, "title": "", "status": "deactive", "sorting": 0, "created_at": "2024-10-15T11:30:02.000000Z", "created_by": null, "created_ip": null, "project_id": 11, "total_mark": 0, "updated_at": "2024-10-15T11:30:02.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-15 05:30:02', '2024-10-15 05:30:02', 'ur'),
(590, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 12, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 12, "status": "deactive", "sorting": 0, "end_date": "2024-10-08", "state_id": null, "objective": "Quia error voluptate", "created_at": "2024-10-15T11:31:10.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": null, "updated_at": "2024-10-15T11:31:10.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Hayden Haley"}}', '2024-10-15 05:31:10', '2024-10-15 05:31:10', 'ur'),
(591, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 13, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 13, "status": "active", "sorting": 0, "end_date": "2024-10-02", "state_id": 1, "objective": "Laboriosam aut exer", "created_at": "2024-10-15T11:38:38.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 3, "updated_at": "2024-10-15T11:38:38.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Bree Stuart"}}', '2024-10-15 05:38:38', '2024-10-15 05:38:38', 'ur'),
(592, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 14, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 14, "status": "active", "sorting": 0, "end_date": "2024-10-02", "state_id": 1, "objective": "Laboriosam aut exer", "created_at": "2024-10-15T11:42:18.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 3, "updated_at": "2024-10-15T11:42:18.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Bree Stuart"}}', '2024-10-15 05:42:18', '2024-10-15 05:42:18', 'ur'),
(593, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 15, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 15, "status": "active", "sorting": 0, "end_date": "2024-10-02", "state_id": 1, "objective": "Laboriosam aut exer", "created_at": "2024-10-15T11:44:20.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 3, "updated_at": "2024-10-15T11:44:20.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Bree Stuart"}}', '2024-10-15 05:44:20', '2024-10-15 05:44:20', 'ur'),
(594, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 16, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 16, "status": "active", "sorting": 0, "end_date": "2024-10-02", "state_id": 1, "objective": "Laboriosam aut exer", "created_at": "2024-10-15T11:45:45.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 3, "updated_at": "2024-10-15T11:45:45.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Bree Stuart"}}', '2024-10-15 05:45:45', '2024-10-15 05:45:45', 'ur'),
(595, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 4, "title": "Assumenda voluptate ", "status": "active", "sorting": 0, "created_at": "2024-10-15T11:45:45.000000Z", "created_by": null, "created_ip": null, "project_id": 16, "total_mark": 10, "updated_at": "2024-10-15T11:45:45.000000Z", "updated_by": null, "updated_ip": null, "description": "Anim magnam sint nos", "achivement_percentage": 10}}', '2024-10-15 05:45:45', '2024-10-15 05:45:45', 'ur'),
(596, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 17, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 17, "status": "active", "sorting": 0, "end_date": "2024-10-23", "state_id": 1, "objective": "asdasd", "created_at": "2024-10-15T12:13:58.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-02", "upazila_id": 3, "updated_at": "2024-10-15T12:13:58.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "asdasd"}}', '2024-10-15 06:13:58', '2024-10-15 06:13:58', 'ur'),
(597, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 18, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 18, "status": "active", "sorting": 0, "end_date": "2024-10-23", "state_id": 1, "objective": "asdasd", "created_at": "2024-10-15T12:24:07.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-02", "upazila_id": 3, "updated_at": "2024-10-15T12:24:07.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "asdasd"}}', '2024-10-15 06:24:07', '2024-10-15 06:24:07', 'ur'),
(598, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 19, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 19, "status": "active", "sorting": 0, "end_date": "2024-10-23", "state_id": 1, "objective": "asdasd", "created_at": "2024-10-15T12:24:52.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-02", "upazila_id": 3, "updated_at": "2024-10-15T12:24:52.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "asdasd"}}', '2024-10-15 06:24:52', '2024-10-15 06:24:52', 'ur'),
(599, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 5, "title": "dasdasd", "status": "active", "sorting": 0, "created_at": "2024-10-15T12:24:52.000000Z", "created_by": null, "created_ip": null, "project_id": 19, "total_mark": 1, "updated_at": "2024-10-15T12:24:52.000000Z", "updated_by": null, "updated_ip": null, "description": "asdasda", "achivement_percentage": 1}}', '2024-10-15 06:24:52', '2024-10-15 06:24:52', 'ur'),
(600, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 20, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 20, "status": "active", "sorting": 0, "end_date": "2024-10-04", "state_id": 1, "objective": "asad", "created_at": "2024-10-15T12:25:44.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-02", "upazila_id": 3, "updated_at": "2024-10-15T12:25:44.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "asdasda"}}', '2024-10-15 06:25:44', '2024-10-15 06:25:44', 'ur'),
(601, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 6, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 6, "title": "aa", "status": "active", "sorting": 0, "created_at": "2024-10-15T12:25:44.000000Z", "created_by": null, "created_ip": null, "project_id": 20, "total_mark": 10, "updated_at": "2024-10-15T12:25:44.000000Z", "updated_by": null, "updated_ip": null, "description": "asda", "achivement_percentage": 1}}', '2024-10-15 06:25:44', '2024-10-15 06:25:44', 'ur'),
(602, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 21, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 21, "status": "deactive", "sorting": 0, "end_date": "2024-10-09", "state_id": 1, "objective": "Mollitia lorem et cu", "created_at": "2024-10-15T12:37:16.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-02", "upazila_id": 3, "updated_at": "2024-10-15T12:37:16.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Idona Lott"}}', '2024-10-15 06:37:16', '2024-10-15 06:37:16', 'ur'),
(603, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 22, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 22, "status": "active", "sorting": 0, "end_date": "2024-10-03", "state_id": 3, "objective": "Est ullamco animi c", "created_at": "2024-10-15T12:39:52.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 1, "updated_at": "2024-10-15T12:39:52.000000Z", "updated_by": null, "updated_ip": null, "district_id": 3, "project_name": "Rhoda Burke"}}', '2024-10-15 06:39:52', '2024-10-15 06:39:52', 'ur'),
(604, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 23, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 23, "status": "active", "sorting": 0, "end_date": "2024-10-03", "state_id": 3, "objective": "Est ullamco animi c", "created_at": "2024-10-15T12:40:03.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 1, "updated_at": "2024-10-15T12:40:03.000000Z", "updated_by": null, "updated_ip": null, "district_id": 3, "project_name": "Rhoda Burke"}}', '2024-10-15 06:40:03', '2024-10-15 06:40:03', 'ur'),
(605, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 24, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 24, "status": "active", "sorting": 0, "end_date": "2024-10-03", "state_id": 3, "objective": "Est ullamco animi c", "created_at": "2024-10-15T12:40:06.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 1, "updated_at": "2024-10-15T12:40:06.000000Z", "updated_by": null, "updated_ip": null, "district_id": 3, "project_name": "Rhoda Burke"}}', '2024-10-15 06:40:06', '2024-10-15 06:40:06', 'ur'),
(606, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 25, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 25, "status": "active", "sorting": 0, "end_date": "2024-10-03", "state_id": 3, "objective": "asdasd", "created_at": "2024-10-15T12:45:38.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 2, "updated_at": "2024-10-15T12:45:38.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "asdasdasdasd"}}', '2024-10-15 06:45:38', '2024-10-15 06:45:38', 'ur');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `batch_uuid`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`, `status`) VALUES
(607, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 7, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 7, "title": "asdasdad", "status": "active", "sorting": 0, "created_at": "2024-10-15T12:45:38.000000Z", "created_by": null, "created_ip": null, "project_id": 25, "total_mark": 1, "updated_at": "2024-10-15T12:45:38.000000Z", "updated_by": null, "updated_ip": null, "description": "asdasd", "achivement_percentage": 1}}', '2024-10-15 06:45:38', '2024-10-15 06:45:38', 'ur'),
(608, 'UserLoginHistory', 'Nogor Solutions - created this', 'App\\Models\\UserLoginHistory', 130, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 130, "status": "active", "sorting": 0, "user_id": 1, "login_at": "2024-10-16 03:31:51", "login_ip": "::1", "created_at": "2024-10-16T03:31:51.000000Z", "updated_at": "2024-10-16T03:31:51.000000Z", "user_guard": "admin", "login_browser_client": "Google Chrome"}}', '2024-10-15 21:31:51', '2024-10-15 21:31:51', 'ur'),
(609, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 1, "status": "active", "sorting": 0, "end_date": "2024-10-03", "state_id": 3, "objective": "Aut quidem enim volu", "created_at": "2024-10-16T03:45:24.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 2, "updated_at": "2024-10-16T03:45:24.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Bruno Barron"}}', '2024-10-15 21:45:24', '2024-10-15 21:45:24', 'ur'),
(610, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 1, "title": "Excepturi quod iste ", "status": "active", "sorting": 0, "created_at": "2024-10-16T03:45:24.000000Z", "created_by": null, "created_ip": null, "project_id": 1, "total_mark": 80, "updated_at": "2024-10-16T03:45:24.000000Z", "updated_by": null, "updated_ip": null, "description": "Veniam esse sint e", "achivement_percentage": 50}}', '2024-10-15 21:45:24', '2024-10-15 21:45:24', 'ur'),
(611, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 2, "title": "Vel exercitationem q", "status": "deactive", "sorting": 0, "created_at": "2024-10-16T03:45:24.000000Z", "created_by": null, "created_ip": null, "project_id": 1, "total_mark": 80, "updated_at": "2024-10-16T03:45:24.000000Z", "updated_by": null, "updated_ip": null, "description": "Officiis quod enim e", "achivement_percentage": 30}}', '2024-10-15 21:45:24', '2024-10-15 21:45:24', 'ur'),
(612, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 3, "title": "Qui sed dolores opti", "status": "deactive", "sorting": 0, "created_at": "2024-10-16T03:45:24.000000Z", "created_by": null, "created_ip": null, "project_id": 1, "total_mark": 60, "updated_at": "2024-10-16T03:45:24.000000Z", "updated_by": null, "updated_ip": null, "description": "Nihil beatae vel sin", "achivement_percentage": 30}}', '2024-10-15 21:45:24', '2024-10-15 21:45:24', 'ur'),
(613, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 4, "title": "Do quia quasi illum", "status": "active", "sorting": 0, "created_at": "2024-10-16T03:45:24.000000Z", "created_by": null, "created_ip": null, "project_id": 1, "total_mark": 70, "updated_at": "2024-10-16T03:45:24.000000Z", "updated_by": null, "updated_ip": null, "description": "Ullam illum accusam", "achivement_percentage": 25}}', '2024-10-15 21:45:24', '2024-10-15 21:45:24', 'ur'),
(614, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 2, "status": "active", "sorting": 0, "end_date": "2024-10-04", "state_id": 3, "objective": "Ut dolor aliquip vol", "created_at": "2024-10-16T03:50:53.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-02", "upazila_id": 1, "updated_at": "2024-10-16T03:50:53.000000Z", "updated_by": null, "updated_ip": null, "district_id": 3, "project_name": "Nolan Britt"}}', '2024-10-15 21:50:53', '2024-10-15 21:50:53', 'ur'),
(615, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 5, "title": "Adipisicing eaque co", "status": "active", "sorting": 0, "created_at": "2024-10-16T03:50:53.000000Z", "created_by": null, "created_ip": null, "project_id": 2, "total_mark": 70, "updated_at": "2024-10-16T03:50:53.000000Z", "updated_by": null, "updated_ip": null, "description": "Rerum esse sit rati", "achivement_percentage": 20}}', '2024-10-15 21:50:53', '2024-10-15 21:50:53', 'ur'),
(616, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 3, "status": "deactive", "sorting": 0, "end_date": "2024-10-03", "state_id": 3, "objective": "Et aliqua In sit i", "created_at": "2024-10-16T04:28:29.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-02", "upazila_id": 2, "updated_at": "2024-10-16T04:28:29.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Philip Simon"}}', '2024-10-15 22:28:29', '2024-10-15 22:28:29', 'ur'),
(617, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 4, "status": "deactive", "sorting": 0, "end_date": "2024-10-03", "state_id": 3, "objective": "Et aliqua In sit i", "created_at": "2024-10-16T04:28:43.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-02", "upazila_id": 2, "updated_at": "2024-10-16T04:28:43.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Philip Simon"}}', '2024-10-15 22:28:43', '2024-10-15 22:28:43', 'ur'),
(618, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 5, "status": "deactive", "sorting": 0, "end_date": "2024-10-03", "state_id": 3, "objective": "Et aliqua In sit i", "created_at": "2024-10-16T04:28:58.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-02", "upazila_id": 2, "updated_at": "2024-10-16T04:28:58.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Philip Simon"}}', '2024-10-15 22:28:58', '2024-10-15 22:28:58', 'ur'),
(619, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 6, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 6, "title": "Nulla expedita repre", "status": "active", "sorting": 0, "created_at": "2024-10-16T04:28:58.000000Z", "created_by": null, "created_ip": null, "project_id": 5, "total_mark": 0, "updated_at": "2024-10-16T04:28:58.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-15 22:28:58', '2024-10-15 22:28:58', 'ur'),
(620, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 6, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 6, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-16T05:18:26.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-16T05:18:26.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Asdasd"}}', '2024-10-15 23:18:26', '2024-10-15 23:18:26', 'ur'),
(621, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 7, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 7, "status": "active", "sorting": 0, "end_date": "2024-10-02", "state_id": 3, "objective": "Adipisicing quasi de", "created_at": "2024-10-16T05:28:31.000000Z", "created_by": null, "created_ip": null, "start_date": "2024-10-01", "upazila_id": 2, "updated_at": "2024-10-16T05:28:31.000000Z", "updated_by": null, "updated_ip": null, "district_id": 4, "project_name": "Murphy Barnes"}}', '2024-10-15 23:28:31', '2024-10-15 23:28:31', 'ur'),
(622, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 7, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 7, "title": "Culpa dolore dolorum", "status": "active", "sorting": 0, "created_at": "2024-10-16T05:28:31.000000Z", "created_by": null, "created_ip": null, "project_id": 7, "total_mark": 77, "updated_at": "2024-10-16T05:28:31.000000Z", "updated_by": null, "updated_ip": null, "description": "Veniam eveniet quo", "achivement_percentage": 77}}', '2024-10-15 23:28:31', '2024-10-15 23:28:31', 'ur'),
(623, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 7, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"end_date": "02 Oct, 2024", "objective": "Adipisicing quasi de", "start_date": "01 Oct, 2024", "updated_at": "2024-10-16T05:28:31.000000Z", "project_name": "Murphy Barnes"}, "attributes": {"end_date": "16 Oct, 2024", "objective": "Non nulla qui ration", "start_date": "02 Oct, 2024", "updated_at": "2024-10-16T06:48:58.000000Z", "project_name": "Sylvia Rosales"}}', '2024-10-16 00:48:58', '2024-10-16 00:48:58', 'ur'),
(624, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 7, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"objective": "Non nulla qui ration", "updated_at": "2024-10-16T06:48:58.000000Z", "project_name": "Sylvia Rosales"}, "attributes": {"objective": "Sit do laborum laud", "updated_at": "2024-10-16T06:49:24.000000Z", "project_name": "Xander Lawrence"}}', '2024-10-16 00:49:24', '2024-10-16 00:49:24', 'ur'),
(625, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 8, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 8, "title": "Nulla expedita", "status": "active", "sorting": 0, "created_at": "2024-10-16T07:06:51.000000Z", "created_by": null, "created_ip": null, "project_id": 5, "total_mark": 0, "updated_at": "2024-10-16T07:06:51.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 01:06:51', '2024-10-16 01:06:51', 'ur'),
(626, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 9, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 9, "title": "Nulla expedita", "status": "active", "sorting": 0, "created_at": "2024-10-16T07:07:36.000000Z", "created_by": null, "created_ip": null, "project_id": 5, "total_mark": 0, "updated_at": "2024-10-16T07:07:36.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 01:07:36', '2024-10-16 01:07:36', 'ur'),
(627, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 10, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 10, "title": "Culpa dolore", "status": "active", "sorting": 0, "created_at": "2024-10-16T07:07:54.000000Z", "created_by": null, "created_ip": null, "project_id": 7, "total_mark": 77, "updated_at": "2024-10-16T07:07:54.000000Z", "updated_by": null, "updated_ip": null, "description": "Veniam eveniet quo", "achivement_percentage": 77}}', '2024-10-16 01:07:54', '2024-10-16 01:07:54', 'ur'),
(628, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 11, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 11, "title": "Culpa dolore", "status": "active", "sorting": 0, "created_at": "2024-10-16T07:10:16.000000Z", "created_by": null, "created_ip": null, "project_id": 7, "total_mark": 77, "updated_at": "2024-10-16T07:10:16.000000Z", "updated_by": null, "updated_ip": null, "description": "Veniam eveniet quo", "achivement_percentage": 77}}', '2024-10-16 01:10:16', '2024-10-16 01:10:16', 'ur'),
(629, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 12, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 12, "title": "Culpa dolore", "status": "active", "sorting": 0, "created_at": "2024-10-16T07:11:13.000000Z", "created_by": null, "created_ip": null, "project_id": 7, "total_mark": 77, "updated_at": "2024-10-16T07:11:13.000000Z", "updated_by": null, "updated_ip": null, "description": "Veniam eveniet quo", "achivement_percentage": 77}}', '2024-10-16 01:11:13', '2024-10-16 01:11:13', 'ur'),
(630, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 13, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 13, "title": "Culpa dolore", "status": "active", "sorting": 0, "created_at": "2024-10-16T07:11:21.000000Z", "created_by": null, "created_ip": null, "project_id": 7, "total_mark": 77, "updated_at": "2024-10-16T07:11:21.000000Z", "updated_by": null, "updated_ip": null, "description": "Veniam eveniet quo", "achivement_percentage": 77}}', '2024-10-16 01:11:21', '2024-10-16 01:11:21', 'ur'),
(631, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 14, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 14, "title": "Culpa dolore", "status": "active", "sorting": 0, "created_at": "2024-10-16T07:11:31.000000Z", "created_by": null, "created_ip": null, "project_id": 7, "total_mark": 77, "updated_at": "2024-10-16T07:11:31.000000Z", "updated_by": null, "updated_ip": null, "description": "Veniam eveniet quo", "achivement_percentage": 77}}', '2024-10-16 01:11:31', '2024-10-16 01:11:31', 'ur'),
(632, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 15, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 15, "title": "Culpa dolore ", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:36:05.000000Z", "created_by": null, "created_ip": null, "project_id": 7, "total_mark": 0, "updated_at": "2024-10-16T08:36:05.000000Z", "updated_by": null, "updated_ip": null, "description": "Veniam eveniet quo", "achivement_percentage": 0}}', '2024-10-16 02:36:05', '2024-10-16 02:36:05', 'ur'),
(633, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 8, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 8, "status": "active", "sorting": 0, "end_date": "03 Oct, 2024", "state_id": 3, "objective": "Excepturi aliquam re", "created_at": "2024-10-16T08:37:45.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Oct, 2024", "upazila_id": 1, "updated_at": "2024-10-16T08:37:45.000000Z", "updated_by": null, "updated_ip": null, "district_id": 3, "project_name": "Berk Doyle"}}', '2024-10-16 02:37:45', '2024-10-16 02:37:45', 'ur'),
(634, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 9, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 9, "status": "active", "sorting": 0, "end_date": "03 Oct, 2024", "state_id": 3, "objective": "Excepturi aliquam re", "created_at": "2024-10-16T08:38:13.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Oct, 2024", "upazila_id": 1, "updated_at": "2024-10-16T08:38:13.000000Z", "updated_by": null, "updated_ip": null, "district_id": 3, "project_name": "Berk Doyle"}}', '2024-10-16 02:38:13', '2024-10-16 02:38:13', 'ur'),
(635, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 16, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 16, "title": "Rerum eum voluptas e", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:38:13.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T08:38:13.000000Z", "updated_by": null, "updated_ip": null, "description": "Omnis aspernatur eni", "achivement_percentage": 0}}', '2024-10-16 02:38:13', '2024-10-16 02:38:13', 'ur'),
(636, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 17, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 17, "title": "Ducimus nostrum in ", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:38:13.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T08:38:13.000000Z", "updated_by": null, "updated_ip": null, "description": "Esse tenetur corpor", "achivement_percentage": 0}}', '2024-10-16 02:38:13', '2024-10-16 02:38:13', 'ur'),
(637, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 18, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 18, "title": "Iusto rerum molestia", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:38:13.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T08:38:13.000000Z", "updated_by": null, "updated_ip": null, "description": "Ut nisi mollit numqu", "achivement_percentage": 0}}', '2024-10-16 02:38:13', '2024-10-16 02:38:13', 'ur'),
(638, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 19, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 19, "title": "Voluptas dolorem est", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:38:13.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T08:38:13.000000Z", "updated_by": null, "updated_ip": null, "description": "Incidunt qui veniam", "achivement_percentage": 0}}', '2024-10-16 02:38:13', '2024-10-16 02:38:13', 'ur'),
(639, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 20, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 20, "title": "Rerum eum voluptas e", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:38:30.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 10, "updated_at": "2024-10-16T08:38:30.000000Z", "updated_by": null, "updated_ip": null, "description": "Omnis aspernatur eni", "achivement_percentage": 0}}', '2024-10-16 02:38:30', '2024-10-16 02:38:30', 'ur'),
(640, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 21, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 21, "title": "Ducimus nostrum in ", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:38:30.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T08:38:30.000000Z", "updated_by": null, "updated_ip": null, "description": "Esse tenetur corpor", "achivement_percentage": 0}}', '2024-10-16 02:38:30', '2024-10-16 02:38:30', 'ur'),
(641, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 22, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 22, "title": "Iusto rerum molestia", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:38:30.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T08:38:30.000000Z", "updated_by": null, "updated_ip": null, "description": "Ut nisi mollit numqu", "achivement_percentage": 0}}', '2024-10-16 02:38:30', '2024-10-16 02:38:30', 'ur'),
(642, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 23, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 23, "title": "Voluptas dolorem est", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:38:30.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T08:38:30.000000Z", "updated_by": null, "updated_ip": null, "description": "Incidunt qui veniam", "achivement_percentage": 0}}', '2024-10-16 02:38:30', '2024-10-16 02:38:30', 'ur'),
(643, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 24, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 24, "title": "Rerum eum voluptas e", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:38:50.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 10, "updated_at": "2024-10-16T08:38:50.000000Z", "updated_by": null, "updated_ip": null, "description": "Omnis aspernatur eni", "achivement_percentage": 0}}', '2024-10-16 02:38:50', '2024-10-16 02:38:50', 'ur'),
(644, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 25, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 25, "title": "Rerum eum voluptas e", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:39:03.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 10, "updated_at": "2024-10-16T08:39:03.000000Z", "updated_by": null, "updated_ip": null, "description": "Omnis aspernatur eni", "achivement_percentage": 21}}', '2024-10-16 02:39:03', '2024-10-16 02:39:03', 'ur'),
(645, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 26, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 26, "title": "Rerum eum voluptas e", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:39:12.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 10, "updated_at": "2024-10-16T08:39:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Omnis aspernatur eni", "achivement_percentage": 21}}', '2024-10-16 02:39:12', '2024-10-16 02:39:12', 'ur'),
(646, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 27, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 27, "title": "Ducimus nostrum in ", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:39:12.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T08:39:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Esse tenetur corpor", "achivement_percentage": 11}}', '2024-10-16 02:39:12', '2024-10-16 02:39:12', 'ur'),
(647, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 28, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 28, "title": "Iusto rerum molestia", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:39:12.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T08:39:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Ut nisi mollit numqu", "achivement_percentage": 0}}', '2024-10-16 02:39:12', '2024-10-16 02:39:12', 'ur'),
(648, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 29, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 29, "title": "Voluptas dolorem est", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:39:12.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T08:39:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Incidunt qui veniam", "achivement_percentage": 0}}', '2024-10-16 02:39:12', '2024-10-16 02:39:12', 'ur'),
(649, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 10, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 10, "status": "active", "sorting": 0, "end_date": "09 Oct, 2024", "state_id": 1, "objective": "Facilis perspiciatis", "created_at": "2024-10-16T08:43:42.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Oct, 2024", "upazila_id": 3, "updated_at": "2024-10-16T08:43:42.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Stewart George"}}', '2024-10-16 02:43:42', '2024-10-16 02:43:42', 'ur'),
(650, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 30, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 30, "title": "Fuga Duis repellend", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:43:42.000000Z", "created_by": null, "created_ip": null, "project_id": 10, "total_mark": 57, "updated_at": "2024-10-16T08:43:42.000000Z", "updated_by": null, "updated_ip": null, "description": "Enim sed molestiae m", "achivement_percentage": 12}}', '2024-10-16 02:43:42', '2024-10-16 02:43:42', 'ur'),
(651, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 11, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 11, "status": "active", "sorting": 0, "end_date": "11 Oct, 2024", "state_id": 1, "objective": "Facere consequat Ma", "created_at": "2024-10-16T08:44:25.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Oct, 2024", "upazila_id": 4, "updated_at": "2024-10-16T08:44:25.000000Z", "updated_by": null, "updated_ip": null, "district_id": 8, "project_name": "Vielka Parrish"}}', '2024-10-16 02:44:25', '2024-10-16 02:44:25', 'ur'),
(652, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 31, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 31, "title": "Ea in asperiores cum", "status": "active", "sorting": 0, "created_at": "2024-10-16T08:44:25.000000Z", "created_by": null, "created_ip": null, "project_id": 11, "total_mark": 87, "updated_at": "2024-10-16T08:44:25.000000Z", "updated_by": null, "updated_ip": null, "description": "Et laborum Cumque n", "achivement_percentage": 11}}', '2024-10-16 02:44:25', '2024-10-16 02:44:25', 'ur'),
(653, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 32, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 32, "title": "Autem molestiae dolo", "status": "deactive", "sorting": 0, "created_at": "2024-10-16T08:44:25.000000Z", "created_by": null, "created_ip": null, "project_id": 11, "total_mark": 88, "updated_at": "2024-10-16T08:44:25.000000Z", "updated_by": null, "updated_ip": null, "description": "Ut perspiciatis est", "achivement_percentage": 14}}', '2024-10-16 02:44:25', '2024-10-16 02:44:25', 'ur'),
(654, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 9, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"status": "active", "updated_at": "2024-10-16T08:38:13.000000Z"}, "attributes": {"status": "deactive", "updated_at": "2024-10-16T09:02:12.000000Z"}}', '2024-10-16 03:02:12', '2024-10-16 03:02:12', 'ur'),
(655, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 33, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 33, "title": "Rerum eum voluptas e", "status": "active", "sorting": 0, "created_at": "2024-10-16T09:02:12.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 10, "updated_at": "2024-10-16T09:02:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Omnis aspernatur eni", "achivement_percentage": 21}}', '2024-10-16 03:02:12', '2024-10-16 03:02:12', 'ur'),
(656, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 34, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 34, "title": "Ducimus nostrum in ", "status": "active", "sorting": 0, "created_at": "2024-10-16T09:02:12.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T09:02:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Esse tenetur corpor", "achivement_percentage": 11}}', '2024-10-16 03:02:12', '2024-10-16 03:02:12', 'ur'),
(657, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 35, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 35, "title": "Iusto rerum molestia", "status": "active", "sorting": 0, "created_at": "2024-10-16T09:02:12.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T09:02:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Ut nisi mollit numqu", "achivement_percentage": 0}}', '2024-10-16 03:02:12', '2024-10-16 03:02:12', 'ur'),
(658, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 36, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 36, "title": "Voluptas dolorem est", "status": "active", "sorting": 0, "created_at": "2024-10-16T09:02:12.000000Z", "created_by": null, "created_ip": null, "project_id": 9, "total_mark": 0, "updated_at": "2024-10-16T09:02:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Incidunt qui veniam", "achivement_percentage": 0}}', '2024-10-16 03:02:12', '2024-10-16 03:02:12', 'ur'),
(659, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 37, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 37, "title": "Ea in asperiores cum", "status": "active", "sorting": 0, "created_at": "2024-10-16T09:05:05.000000Z", "created_by": null, "created_ip": null, "project_id": 11, "total_mark": 87, "updated_at": "2024-10-16T09:05:05.000000Z", "updated_by": null, "updated_ip": null, "description": "Et laborum Cumque n", "achivement_percentage": 11}}', '2024-10-16 03:05:05', '2024-10-16 03:05:05', 'ur'),
(660, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 38, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 38, "title": "Autem molestiae dolo", "status": "active", "sorting": 0, "created_at": "2024-10-16T09:05:05.000000Z", "created_by": null, "created_ip": null, "project_id": 11, "total_mark": 88, "updated_at": "2024-10-16T09:05:05.000000Z", "updated_by": null, "updated_ip": null, "description": "Ut perspiciatis est", "achivement_percentage": 14}}', '2024-10-16 03:05:05', '2024-10-16 03:05:05', 'ur'),
(661, 'Project', 'Nogor Solutions - deleted this', 'App\\Models\\Project', 11, 'deleted', NULL, 'App\\Models\\Admin', 1, '{"old": {"id": 11, "status": "active", "sorting": 0, "end_date": "11 Oct, 2024", "state_id": 1, "objective": "Facere consequat Ma", "created_at": "2024-10-16T08:44:25.000000Z", "created_by": null, "created_ip": null, "start_date": "10 Oct, 2024", "upazila_id": 4, "updated_at": "2024-10-16T08:44:25.000000Z", "updated_by": null, "updated_ip": null, "district_id": 8, "project_name": "Vielka Parrish"}}', '2024-10-16 03:23:55', '2024-10-16 03:23:55', 'ur'),
(662, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 12, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 12, "status": "active", "sorting": 0, "end_date": "31 Oct, 2024", "state_id": 1, "objective": "N/A", "created_at": "2024-10-16T09:37:12.000000Z", "created_by": null, "created_ip": null, "start_date": "16 Oct, 2024", "upazila_id": 3, "updated_at": "2024-10-16T09:37:12.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Mehedi"}}', '2024-10-16 03:37:12', '2024-10-16 03:37:12', 'ur'),
(663, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 39, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 39, "title": "Mehedi 1", "status": "active", "sorting": 0, "created_at": "2024-10-16T09:37:12.000000Z", "created_by": null, "created_ip": null, "project_id": 12, "total_mark": 100, "updated_at": "2024-10-16T09:37:12.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 80}}', '2024-10-16 03:37:12', '2024-10-16 03:37:12', 'ur'),
(664, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 40, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 40, "title": "Mehedi 1", "status": "active", "sorting": 0, "created_at": "2024-10-16T09:37:12.000000Z", "created_by": null, "created_ip": null, "project_id": 12, "total_mark": 100, "updated_at": "2024-10-16T09:37:12.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 80}}', '2024-10-16 03:37:12', '2024-10-16 03:37:12', 'ur'),
(665, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 13, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 13, "status": "active", "sorting": 0, "end_date": "31 Oct, 2024", "state_id": 1, "objective": null, "created_at": "2024-10-16T09:38:42.000000Z", "created_by": null, "created_ip": null, "start_date": "16 Oct, 2024", "upazila_id": null, "updated_at": "2024-10-16T09:38:42.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Mehedi 2"}}', '2024-10-16 03:38:42', '2024-10-16 03:38:42', 'ur'),
(666, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 41, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 41, "title": "MMM", "status": "active", "sorting": 0, "created_at": "2024-10-16T09:38:42.000000Z", "created_by": null, "created_ip": null, "project_id": 13, "total_mark": 100, "updated_at": "2024-10-16T09:38:42.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 80}}', '2024-10-16 03:38:42', '2024-10-16 03:38:42', 'ur'),
(667, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 42, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 42, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-16T09:38:42.000000Z", "created_by": null, "created_ip": null, "project_id": 13, "total_mark": 100, "updated_at": "2024-10-16T09:38:42.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 70}}', '2024-10-16 03:38:42', '2024-10-16 03:38:42', 'ur'),
(668, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 14, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 14, "status": "active", "sorting": 0, "end_date": "10 Oct, 2024", "state_id": 1, "objective": "asdasd", "created_at": "2024-10-16T09:57:05.000000Z", "created_by": null, "created_ip": null, "start_date": "09 Oct, 2024", "upazila_id": 3, "updated_at": "2024-10-16T09:57:05.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Xander Lawrence"}}', '2024-10-16 03:57:05', '2024-10-16 03:57:05', 'ur'),
(669, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 15, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 15, "status": "active", "sorting": 0, "end_date": "10 Oct, 2024", "state_id": null, "objective": "asas", "created_at": "2024-10-16T10:05:04.000000Z", "created_by": null, "created_ip": null, "start_date": "08 Oct, 2024", "upazila_id": null, "updated_at": "2024-10-16T10:05:04.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Xander Lawrence"}}', '2024-10-16 04:05:04', '2024-10-16 04:05:04', 'ur'),
(670, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 43, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 43, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-16T10:05:04.000000Z", "created_by": null, "created_ip": null, "project_id": 15, "total_mark": 0, "updated_at": "2024-10-16T10:05:04.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 04:05:04', '2024-10-16 04:05:04', 'ur'),
(671, 'UserLoginHistory', 'Nogor Solutions - created this', 'App\\Models\\UserLoginHistory', 131, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 131, "status": "active", "sorting": 0, "user_id": 1, "login_at": "2024-10-17 03:20:12", "login_ip": "::1", "created_at": "2024-10-17T03:20:12.000000Z", "updated_at": "2024-10-17T03:20:12.000000Z", "user_guard": "admin", "login_browser_client": "Google Chrome"}}', '2024-10-16 21:20:12', '2024-10-16 21:20:12', 'ur'),
(672, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 16, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 16, "status": "active", "sorting": 0, "end_date": "01 Jan, 1970", "state_id": null, "objective": null, "created_at": "2024-10-17T03:22:39.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Jan, 1970", "upazila_id": null, "updated_at": "2024-10-17T03:22:39.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Asda"}}', '2024-10-16 21:22:39', '2024-10-16 21:22:39', 'ur'),
(673, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 44, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 44, "title": "Asdfasd", "status": "active", "sorting": 0, "created_at": "2024-10-17T03:22:39.000000Z", "created_by": null, "created_ip": null, "project_id": 16, "total_mark": 10, "updated_at": "2024-10-17T03:22:39.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 21:22:39', '2024-10-16 21:22:39', 'ur'),
(674, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 17, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 17, "status": "active", "sorting": 0, "end_date": "01 Jan, 1970", "state_id": null, "objective": null, "created_at": "2024-10-17T03:22:47.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Jan, 1970", "upazila_id": null, "updated_at": "2024-10-17T03:22:47.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Asda"}}', '2024-10-16 21:22:47', '2024-10-16 21:22:47', 'ur'),
(675, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 45, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 45, "title": "Asdfasd", "status": "active", "sorting": 0, "created_at": "2024-10-17T03:22:47.000000Z", "created_by": null, "created_ip": null, "project_id": 17, "total_mark": 10, "updated_at": "2024-10-17T03:22:47.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 21:22:47', '2024-10-16 21:22:47', 'ur'),
(676, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 18, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 18, "status": "active", "sorting": 0, "end_date": "01 Jan, 1970", "state_id": null, "objective": null, "created_at": "2024-10-17T03:23:37.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Jan, 1970", "upazila_id": null, "updated_at": "2024-10-17T03:23:37.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Asda"}}', '2024-10-16 21:23:37', '2024-10-16 21:23:37', 'ur'),
(677, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 19, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 19, "status": "active", "sorting": 0, "end_date": "01 Jan, 1970", "state_id": null, "objective": null, "created_at": "2024-10-17T03:25:42.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Jan, 1970", "upazila_id": null, "updated_at": "2024-10-17T03:25:42.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Asda"}}', '2024-10-16 21:25:42', '2024-10-16 21:25:42', 'ur'),
(678, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 20, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 20, "status": "active", "sorting": 0, "end_date": "01 Jan, 1970", "state_id": null, "objective": null, "created_at": "2024-10-17T03:25:50.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Jan, 1970", "upazila_id": null, "updated_at": "2024-10-17T03:25:50.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Asda"}}', '2024-10-16 21:25:50', '2024-10-16 21:25:50', 'ur'),
(679, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 21, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 21, "status": "active", "sorting": 0, "end_date": "01 Jan, 1970", "state_id": null, "objective": null, "created_at": "2024-10-17T03:26:38.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Jan, 1970", "upazila_id": null, "updated_at": "2024-10-17T03:26:38.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Asda"}}', '2024-10-16 21:26:38', '2024-10-16 21:26:38', 'ur'),
(680, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 22, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 22, "status": "active", "sorting": 0, "end_date": "01 Jan, 1970", "state_id": null, "objective": null, "created_at": "2024-10-17T03:26:48.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Jan, 1970", "upazila_id": null, "updated_at": "2024-10-17T03:26:48.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Asda"}}', '2024-10-16 21:26:48', '2024-10-16 21:26:48', 'ur'),
(681, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 46, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 46, "title": "Asdfasd", "status": "active", "sorting": 0, "created_at": "2024-10-17T03:26:48.000000Z", "created_by": null, "created_ip": null, "project_id": 22, "total_mark": 10, "updated_at": "2024-10-17T03:26:48.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 21:26:48', '2024-10-16 21:26:48', 'ur'),
(682, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 23, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 23, "status": "active", "sorting": 0, "end_date": "01 Jan, 1970", "state_id": null, "objective": null, "created_at": "2024-10-17T03:27:08.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Jan, 1970", "upazila_id": null, "updated_at": "2024-10-17T03:27:08.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Asda"}}', '2024-10-16 21:27:08', '2024-10-16 21:27:08', 'ur'),
(683, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 47, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 47, "title": "Asdfasd", "status": "active", "sorting": 0, "created_at": "2024-10-17T03:27:08.000000Z", "created_by": null, "created_ip": null, "project_id": 23, "total_mark": 10, "updated_at": "2024-10-17T03:27:08.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 21:27:08', '2024-10-16 21:27:08', 'ur'),
(684, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 48, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 48, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T03:27:08.000000Z", "created_by": null, "created_ip": null, "project_id": 23, "total_mark": 0, "updated_at": "2024-10-17T03:27:08.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 21:27:08', '2024-10-16 21:27:08', 'ur'),
(685, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 24, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 24, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T03:50:59.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T03:50:59.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Bruno Barron"}}', '2024-10-16 21:50:59', '2024-10-16 21:50:59', 'ur'),
(686, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 25, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 25, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T03:51:46.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T03:51:46.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Xander Lawrence"}}', '2024-10-16 21:51:46', '2024-10-16 21:51:46', 'ur'),
(687, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 26, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 26, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T03:54:45.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T03:54:45.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Philip Simon"}}', '2024-10-16 21:54:45', '2024-10-16 21:54:45', 'ur'),
(688, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 27, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 27, "status": "active", "sorting": 0, "end_date": "10 Oct, 2024", "state_id": 1, "objective": "I can''t modify images directly. However, you can use image editing software or apps like Photoshop, GIMP, or even mobile apps to change the color of the flower to yellow. Look for tools that allow you to select the flower and adjust its hue or color balance. If you need guidance on how to do that, feel free to ask! I can''t modify images directly. However, you can use image editing software or apps like Photoshop, GIMP, or even mobile apps to change the color of the flower to yellow. Look for tools that allow you to select the flower and adjust its hue or color balance. If you need guidance on how to do that, feel free to ask!\\n\\nI can''t modify images directly. However, you can use image editing software or apps like Photoshop, GIMP, or even mobile apps to change the color of the flower to yellow. Look for tools that allow you to select the flower and adjust its hue or color balance. If you need guidance on how to do that, feel free to ask!\\n\\nI can''t modify images directly. However, you can use image editing software or apps like Photoshop, GIMP, or even mobile apps to change the color of the flower to yellow. Look for tools that allow you to select the flower and adjust its hue or color balance. If you need guidance on how to do that, feel free to ask!\\n\\nText from your selection\\nI can''t modify images directly. However, you can use image editing software or apps like Photoshop, GIMP, or even mobile apps to change the color of the flower to yellow. Look for tools that allow you to select the flower and adjust its hue or color balance. If you need guidance on how to do that, feel free to ask!\\nExplain this\\nTranslate\\nSummarize\\nI can''t modify images directly. However, you can use image editing software or apps like Photoshop, GIMP, or even mobile apps to change the color of the flower to yellow. Look for tools that allow you to select the flower and adjust its hue or color balance. If you need guidance on how to do that, feel free to ask!\\nI can''t modify images directly. However, you can use image editing software or apps like Photoshop, GIMP, or even mobile apps to change the color of the flower to yellow. Look for tools that allow you to select the flower and adjust its hue or color balance. If you need guidance on how to do that, feel free to ask!", "created_at": "2024-10-17T03:56:40.000000Z", "created_by": null, "created_ip": null, "start_date": "02 Oct, 2024", "upazila_id": 3, "updated_at": "2024-10-17T03:56:40.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Xander Lawrence"}}', '2024-10-16 21:56:40', '2024-10-16 21:56:40', 'ur'),
(689, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 28, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 28, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T03:58:24.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Oct, 2024", "upazila_id": null, "updated_at": "2024-10-17T03:58:24.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Bruno Barron"}}', '2024-10-16 21:58:24', '2024-10-16 21:58:24', 'ur'),
(690, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 29, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 29, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T03:59:08.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Oct, 2024", "upazila_id": null, "updated_at": "2024-10-17T03:59:08.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Bruno Barron"}}', '2024-10-16 21:59:08', '2024-10-16 21:59:08', 'ur'),
(691, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 30, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 30, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T04:01:30.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Oct, 2024", "upazila_id": null, "updated_at": "2024-10-17T04:01:30.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Bruno Barron"}}', '2024-10-16 22:01:30', '2024-10-16 22:01:30', 'ur'),
(692, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 49, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 49, "title": "Asdasdas", "status": "active", "sorting": 0, "created_at": "2024-10-17T04:01:30.000000Z", "created_by": null, "created_ip": null, "project_id": 30, "total_mark": 10, "updated_at": "2024-10-17T04:01:30.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 22:01:30', '2024-10-16 22:01:30', 'ur'),
(693, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 31, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 31, "status": "deactive", "sorting": 0, "end_date": "09 Oct, 2024", "state_id": 1, "objective": "I can''t modify images directly. However, you can use image editing software or apps like Photoshop, GIMP, or even mobile apps to change the color of the flower to yellow. Look for tools that allow you to select the flower and adjust its hue or color balance. If you need guidance on how to do that, feel free to ask!", "created_at": "2024-10-17T04:04:35.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Oct, 2024", "upazila_id": 3, "updated_at": "2024-10-17T04:04:35.000000Z", "updated_by": null, "updated_ip": null, "district_id": 1, "project_name": "Xander Lawrence"}}', '2024-10-16 22:04:35', '2024-10-16 22:04:35', 'ur');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `batch_uuid`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`, `status`) VALUES
(694, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 50, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 50, "title": "Test", "status": "deactive", "sorting": 0, "created_at": "2024-10-17T04:04:35.000000Z", "created_by": null, "created_ip": null, "project_id": 31, "total_mark": 10, "updated_at": "2024-10-17T04:04:35.000000Z", "updated_by": null, "updated_ip": null, "description": "aa", "achivement_percentage": 5}}', '2024-10-16 22:04:35', '2024-10-16 22:04:35', 'ur'),
(695, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 51, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 51, "title": "Test", "status": "deactive", "sorting": 0, "created_at": "2024-10-17T04:09:15.000000Z", "created_by": null, "created_ip": null, "project_id": 31, "total_mark": 10, "updated_at": "2024-10-17T04:09:15.000000Z", "updated_by": null, "updated_ip": null, "description": "aaaaas", "achivement_percentage": 5}}', '2024-10-16 22:09:15', '2024-10-16 22:09:15', 'ur'),
(696, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 32, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 32, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T05:20:42.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:20:42.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Asdasd"}}', '2024-10-16 23:20:42', '2024-10-16 23:20:42', 'ur'),
(697, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 52, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 52, "title": "Asdasd", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:20:42.000000Z", "created_by": null, "created_ip": null, "project_id": 32, "total_mark": 0, "updated_at": "2024-10-17T05:20:42.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:20:42', '2024-10-16 23:20:42', 'ur'),
(698, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 33, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 33, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T05:21:31.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:21:31.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "U"}}', '2024-10-16 23:21:31', '2024-10-16 23:21:31', 'ur'),
(699, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 53, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 53, "title": "Asdasdad", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:21:31.000000Z", "created_by": null, "created_ip": null, "project_id": 33, "total_mark": 0, "updated_at": "2024-10-17T05:21:31.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:21:31', '2024-10-16 23:21:31', 'ur'),
(700, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 34, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 34, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T05:25:01.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:25:01.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Bruno Barron"}}', '2024-10-16 23:25:01', '2024-10-16 23:25:01', 'ur'),
(701, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 54, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 54, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:25:01.000000Z", "created_by": null, "created_ip": null, "project_id": 34, "total_mark": 0, "updated_at": "2024-10-17T05:25:01.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:25:01', '2024-10-16 23:25:01', 'ur'),
(702, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 35, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 35, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T05:25:13.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:25:13.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Berk Doyle"}}', '2024-10-16 23:25:13', '2024-10-16 23:25:13', 'ur'),
(703, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 55, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 55, "title": "Aaa", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:25:13.000000Z", "created_by": null, "created_ip": null, "project_id": 35, "total_mark": 0, "updated_at": "2024-10-17T05:25:13.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:25:13', '2024-10-16 23:25:13', 'ur'),
(704, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 36, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 36, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T05:29:27.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:29:27.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Murphy Barnes"}}', '2024-10-16 23:29:27', '2024-10-16 23:29:27', 'ur'),
(705, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 56, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 56, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:29:27.000000Z", "created_by": null, "created_ip": null, "project_id": 36, "total_mark": 0, "updated_at": "2024-10-17T05:29:27.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:29:27', '2024-10-16 23:29:27', 'ur'),
(706, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 37, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 37, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": "asasd", "created_at": "2024-10-17T05:33:49.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:33:49.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Philip Simon"}}', '2024-10-16 23:33:49', '2024-10-16 23:33:49', 'ur'),
(707, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 57, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 57, "title": "Asdasdasd", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:33:49.000000Z", "created_by": null, "created_ip": null, "project_id": 37, "total_mark": 77, "updated_at": "2024-10-17T05:33:49.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:33:49', '2024-10-16 23:33:49', 'ur'),
(708, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 37, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"end_date": null, "state_id": null, "objective": "asasd", "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:33:49.000000Z", "district_id": null, "project_name": "Philip Simon"}, "attributes": {"end_date": "09 Oct, 2024", "state_id": 3, "objective": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi veneLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.natis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.", "start_date": "02 Oct, 2024", "upazila_id": 2, "updated_at": "2024-10-17T05:36:21.000000Z", "district_id": 4, "project_name": "Xander Lawrencea"}}', '2024-10-16 23:36:21', '2024-10-16 23:36:21', 'ur'),
(709, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 37, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"end_date": null, "state_id": null, "objective": "asasd", "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:33:49.000000Z", "district_id": null, "project_name": "Philip Simon"}, "attributes": {"end_date": "09 Oct, 2024", "state_id": 3, "objective": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi veneLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "start_date": "02 Oct, 2024", "upazila_id": 2, "updated_at": "2024-10-17T05:36:56.000000Z", "district_id": 4, "project_name": "Xander Lawrencea"}}', '2024-10-16 23:36:56', '2024-10-16 23:36:56', 'ur'),
(710, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 37, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"end_date": null, "state_id": null, "objective": "asasd", "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:33:49.000000Z", "district_id": null, "project_name": "Philip Simon"}, "attributes": {"end_date": "09 Oct, 2024", "state_id": 3, "objective": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "start_date": "02 Oct, 2024", "upazila_id": 2, "updated_at": "2024-10-17T05:37:05.000000Z", "district_id": 4, "project_name": "Xander Lawrencea"}}', '2024-10-16 23:37:05', '2024-10-16 23:37:05', 'ur'),
(711, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 37, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"end_date": null, "state_id": null, "objective": "asasd", "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:33:49.000000Z", "district_id": null, "project_name": "Philip Simon"}, "attributes": {"end_date": "09 Oct, 2024", "state_id": 3, "objective": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa", "start_date": "02 Oct, 2024", "upazila_id": 2, "updated_at": "2024-10-17T05:37:14.000000Z", "district_id": 4, "project_name": "Xander Lawrencea"}}', '2024-10-16 23:37:14', '2024-10-16 23:37:14', 'ur'),
(712, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 37, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"end_date": null, "state_id": null, "objective": "asasd", "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:33:49.000000Z", "district_id": null, "project_name": "Philip Simon"}, "attributes": {"end_date": "09 Oct, 2024", "state_id": 3, "objective": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpaLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.", "start_date": "02 Oct, 2024", "upazila_id": 2, "updated_at": "2024-10-17T05:38:51.000000Z", "district_id": 4, "project_name": "Xander Lawrencea"}}', '2024-10-16 23:38:51', '2024-10-16 23:38:51', 'ur'),
(713, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 58, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 58, "title": "Lorem ipsum dolor sit amet, consectetur adipiscing elit", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:38:51.000000Z", "created_by": null, "created_ip": null, "project_id": 37, "total_mark": 77, "updated_at": "2024-10-17T05:38:51.000000Z", "updated_by": null, "updated_ip": null, "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt", "achivement_percentage": 10}}', '2024-10-16 23:38:51', '2024-10-16 23:38:51', 'ur'),
(714, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 37, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"state_id": 3, "upazila_id": 2, "updated_at": "2024-10-17T05:38:51.000000Z", "district_id": 4}, "attributes": {"state_id": 1, "upazila_id": 4, "updated_at": "2024-10-17T05:39:50.000000Z", "district_id": 8}}', '2024-10-16 23:39:50', '2024-10-16 23:39:50', 'ur'),
(715, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 59, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 59, "title": "Lorem ipsum dolor sit amet, consectetur adipiscing elit", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:39:50.000000Z", "created_by": null, "created_ip": null, "project_id": 37, "total_mark": 12, "updated_at": "2024-10-17T05:39:50.000000Z", "updated_by": null, "updated_ip": null, "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt", "achivement_percentage": 3}}', '2024-10-16 23:39:50', '2024-10-16 23:39:50', 'ur'),
(716, 'Project', 'Nogor Solutions - deleted this', 'App\\Models\\Project', 35, 'deleted', NULL, 'App\\Models\\Admin', 1, '{"old": {"id": 35, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T05:25:13.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:25:13.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Berk Doyle"}}', '2024-10-16 23:40:09', '2024-10-16 23:40:09', 'ur'),
(717, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 38, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 38, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T05:40:38.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T05:40:38.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Berk Doyle"}}', '2024-10-16 23:40:38', '2024-10-16 23:40:38', 'ur'),
(718, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 60, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 60, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:40:38.000000Z", "created_by": null, "created_ip": null, "project_id": 38, "total_mark": 0, "updated_at": "2024-10-17T05:40:38.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:40:38', '2024-10-16 23:40:38', 'ur'),
(719, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 61, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 61, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:40:53.000000Z", "created_by": null, "created_ip": null, "project_id": 38, "total_mark": 0, "updated_at": "2024-10-17T05:40:53.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:40:53', '2024-10-16 23:40:53', 'ur'),
(720, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 62, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 62, "title": "Asas", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:41:07.000000Z", "created_by": null, "created_ip": null, "project_id": 38, "total_mark": 0, "updated_at": "2024-10-17T05:41:07.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:41:07', '2024-10-16 23:41:07', 'ur'),
(721, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 63, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 63, "title": "Asas sadasd", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:41:15.000000Z", "created_by": null, "created_ip": null, "project_id": 38, "total_mark": 0, "updated_at": "2024-10-17T05:41:15.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:41:15', '2024-10-16 23:41:15', 'ur'),
(722, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 38, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"status": "active", "updated_at": "2024-10-17T05:40:38.000000Z"}, "attributes": {"status": "deactive", "updated_at": "2024-10-17T05:41:20.000000Z"}}', '2024-10-16 23:41:20', '2024-10-16 23:41:20', 'ur'),
(723, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 64, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 64, "title": "Asas sadasd", "status": "active", "sorting": 0, "created_at": "2024-10-17T05:41:20.000000Z", "created_by": null, "created_ip": null, "project_id": 38, "total_mark": 0, "updated_at": "2024-10-17T05:41:20.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:41:20', '2024-10-16 23:41:20', 'ur'),
(724, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 65, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 65, "title": "Asas sadasd", "status": "deactive", "sorting": 0, "created_at": "2024-10-17T05:41:24.000000Z", "created_by": null, "created_ip": null, "project_id": 38, "total_mark": 0, "updated_at": "2024-10-17T05:41:24.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-16 23:41:24', '2024-10-16 23:41:24', 'ur'),
(725, 'State', 'Nogor Solutions - created this', 'App\\Models\\State', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 4, "name": "Dhaka", "status": "active", "sorting": 4, "country_id": 18, "created_at": "2024-10-17T05:58:13.000000Z", "deleted_at": null, "updated_at": "2024-10-17T05:58:13.000000Z"}}', '2024-10-16 23:58:13', '2024-10-16 23:58:13', 'ur'),
(726, 'District', 'Nogor Solutions - created this', 'App\\Models\\District', 12, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 12, "name": "Dhaka Shadar", "status": "active", "sorting": 10, "state_id": 4, "created_at": "2024-10-17T05:58:30.000000Z", "created_by": 1, "created_ip": 1, "deleted_at": null, "updated_at": "2024-10-17T05:58:30.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-16 23:58:30', '2024-10-16 23:58:30', 'ur'),
(727, 'Upazila', 'Nogor Solutions - created this', 'App\\Models\\Upazila', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 5, "name": "Niketon", "status": "active", "sorting": 5, "state_id": 4, "created_at": "2024-10-17T05:58:59.000000Z", "deleted_at": null, "updated_at": "2024-10-17T05:58:59.000000Z", "district_id": 12}}', '2024-10-16 23:58:59', '2024-10-16 23:58:59', 'ur'),
(728, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 39, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 39, "status": "active", "sorting": 0, "end_date": null, "state_id": 4, "objective": "This project aims to provide essential benefits and services to underserved and needy individuals within the community.", "created_at": "2024-10-17T06:01:11.000000Z", "created_by": null, "created_ip": null, "start_date": "17 Oct, 2024", "upazila_id": 5, "updated_at": "2024-10-17T06:01:11.000000Z", "updated_by": null, "updated_ip": null, "district_id": 12, "project_name": "Filter System"}}', '2024-10-17 00:01:11', '2024-10-17 00:01:11', 'ur'),
(729, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 66, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 66, "title": "Number of water wells or filtration systems installed.", "status": "deactive", "sorting": 0, "created_at": "2024-10-17T06:01:11.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 80, "updated_at": "2024-10-17T06:01:11.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 80}}', '2024-10-17 00:01:11', '2024-10-17 00:01:11', 'ur'),
(730, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 67, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 67, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:01:11.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 77, "updated_at": "2024-10-17T06:01:11.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 77}}', '2024-10-17 00:01:11', '2024-10-17 00:01:11', 'ur'),
(731, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 40, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 40, "status": "active", "sorting": 0, "end_date": null, "state_id": 4, "objective": null, "created_at": "2024-10-17T06:03:53.000000Z", "created_by": null, "created_ip": null, "start_date": "17 Oct, 2024", "upazila_id": 5, "updated_at": "2024-10-17T06:03:53.000000Z", "updated_by": null, "updated_ip": null, "district_id": 12, "project_name": "Household System"}}', '2024-10-17 00:03:53', '2024-10-17 00:03:53', 'ur'),
(732, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 68, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 68, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:03:53.000000Z", "created_by": null, "created_ip": null, "project_id": 40, "total_mark": 0, "updated_at": "2024-10-17T06:03:53.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-17 00:03:53', '2024-10-17 00:03:53', 'ur'),
(733, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 41, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 41, "status": "active", "sorting": 0, "end_date": null, "state_id": 4, "objective": null, "created_at": "2024-10-17T06:06:30.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T06:06:30.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Hous"}}', '2024-10-17 00:06:30', '2024-10-17 00:06:30', 'ur'),
(734, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 69, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 69, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:06:30.000000Z", "created_by": null, "created_ip": null, "project_id": 41, "total_mark": 0, "updated_at": "2024-10-17T06:06:30.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-17 00:06:30', '2024-10-17 00:06:30', 'ur'),
(735, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 70, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 70, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:10:53.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 77, "updated_at": "2024-10-17T06:10:53.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 77}}', '2024-10-17 00:10:53', '2024-10-17 00:10:53', 'ur'),
(736, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 71, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 71, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:11:25.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 80, "updated_at": "2024-10-17T06:11:25.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 77}}', '2024-10-17 00:11:25', '2024-10-17 00:11:25', 'ur'),
(737, 'Project', 'Nogor Solutions - deleted this', 'App\\Models\\Project', 41, 'deleted', NULL, 'App\\Models\\Admin', 1, '{"old": {"id": 41, "status": "active", "sorting": 0, "end_date": null, "state_id": 4, "objective": null, "created_at": "2024-10-17T06:06:30.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T06:06:30.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Hous"}}', '2024-10-17 00:16:39', '2024-10-17 00:16:39', 'ur'),
(738, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 39, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"end_date": null, "updated_at": "2024-10-17T06:01:11.000000Z"}, "attributes": {"end_date": "02 Oct, 2024", "updated_at": "2024-10-17T06:19:56.000000Z"}}', '2024-10-17 00:19:56', '2024-10-17 00:19:56', 'ur'),
(739, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 72, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 72, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:19:56.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 80, "updated_at": "2024-10-17T06:19:56.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 77}}', '2024-10-17 00:19:56', '2024-10-17 00:19:56', 'ur'),
(740, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 73, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 73, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:19:56.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 80, "updated_at": "2024-10-17T06:19:56.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 80}}', '2024-10-17 00:19:56', '2024-10-17 00:19:56', 'ur'),
(741, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 74, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 74, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:19:56.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 77, "updated_at": "2024-10-17T06:19:56.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 77}}', '2024-10-17 00:19:56', '2024-10-17 00:19:56', 'ur'),
(742, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 75, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 75, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:19:56.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 10, "updated_at": "2024-10-17T06:19:56.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 0}}', '2024-10-17 00:19:56', '2024-10-17 00:19:56', 'ur'),
(743, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 76, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 76, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:19:56.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 77, "updated_at": "2024-10-17T06:19:56.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 5}}', '2024-10-17 00:19:56', '2024-10-17 00:19:56', 'ur'),
(744, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 77, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 77, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:19:56.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 80, "updated_at": "2024-10-17T06:19:56.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 77}}', '2024-10-17 00:19:56', '2024-10-17 00:19:56', 'ur'),
(745, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 78, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 78, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:19:56.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 77, "updated_at": "2024-10-17T06:19:56.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 0}}', '2024-10-17 00:19:56', '2024-10-17 00:19:56', 'ur'),
(746, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 79, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 79, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:19:56.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 0, "updated_at": "2024-10-17T06:19:56.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 0}}', '2024-10-17 00:19:56', '2024-10-17 00:19:56', 'ur'),
(747, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 39, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"status": "active", "updated_at": "2024-10-17T06:19:56.000000Z"}, "attributes": {"status": "deactive", "updated_at": "2024-10-17T06:21:55.000000Z"}}', '2024-10-17 00:21:55', '2024-10-17 00:21:55', 'ur'),
(748, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 80, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 80, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:21:55.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 80, "updated_at": "2024-10-17T06:21:55.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 77}}', '2024-10-17 00:21:55', '2024-10-17 00:21:55', 'ur'),
(749, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 81, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 81, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:21:55.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 80, "updated_at": "2024-10-17T06:21:55.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 80}}', '2024-10-17 00:21:55', '2024-10-17 00:21:55', 'ur'),
(750, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 82, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 82, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:21:55.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 77, "updated_at": "2024-10-17T06:21:55.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 77}}', '2024-10-17 00:21:55', '2024-10-17 00:21:55', 'ur'),
(751, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 83, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 83, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:21:55.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 10, "updated_at": "2024-10-17T06:21:55.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 0}}', '2024-10-17 00:21:55', '2024-10-17 00:21:55', 'ur'),
(752, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 84, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 84, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:21:55.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 77, "updated_at": "2024-10-17T06:21:55.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 5}}', '2024-10-17 00:21:55', '2024-10-17 00:21:55', 'ur'),
(753, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 85, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 85, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:21:55.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 80, "updated_at": "2024-10-17T06:21:55.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 77}}', '2024-10-17 00:21:55', '2024-10-17 00:21:55', 'ur'),
(754, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 86, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 86, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:21:55.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 77, "updated_at": "2024-10-17T06:21:55.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 0}}', '2024-10-17 00:21:55', '2024-10-17 00:21:55', 'ur'),
(755, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 87, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 87, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:21:55.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 0, "updated_at": "2024-10-17T06:21:55.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 0}}', '2024-10-17 00:21:55', '2024-10-17 00:21:55', 'ur'),
(756, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 88, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 88, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:22:18.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 80, "updated_at": "2024-10-17T06:22:18.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 77}}', '2024-10-17 00:22:18', '2024-10-17 00:22:18', 'ur'),
(757, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 89, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 89, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:22:18.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 80, "updated_at": "2024-10-17T06:22:18.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 80}}', '2024-10-17 00:22:18', '2024-10-17 00:22:18', 'ur'),
(758, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 90, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 90, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:22:18.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 77, "updated_at": "2024-10-17T06:22:18.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 77}}', '2024-10-17 00:22:18', '2024-10-17 00:22:18', 'ur'),
(759, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 91, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 91, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:22:18.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 10, "updated_at": "2024-10-17T06:22:18.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 0}}', '2024-10-17 00:22:18', '2024-10-17 00:22:18', 'ur'),
(760, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 92, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 92, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:22:18.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 77, "updated_at": "2024-10-17T06:22:18.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 5}}', '2024-10-17 00:22:18', '2024-10-17 00:22:18', 'ur'),
(761, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 93, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 93, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:22:18.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 80, "updated_at": "2024-10-17T06:22:18.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 77}}', '2024-10-17 00:22:18', '2024-10-17 00:22:18', 'ur'),
(762, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 94, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 94, "title": "Percentage of households in the village that have access to clean water.", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:22:18.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 77, "updated_at": "2024-10-17T06:22:18.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 0}}', '2024-10-17 00:22:18', '2024-10-17 00:22:18', 'ur'),
(763, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 95, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 95, "title": "Percentage of households in the village that have access to clean water.", "status": "deactive", "sorting": 0, "created_at": "2024-10-17T06:22:18.000000Z", "created_by": null, "created_ip": null, "project_id": 39, "total_mark": 0, "updated_at": "2024-10-17T06:22:18.000000Z", "updated_by": null, "updated_ip": null, "description": "Percentage of households in the village that have access to clean water.", "achivement_percentage": 0}}', '2024-10-17 00:22:18', '2024-10-17 00:22:18', 'ur'),
(764, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 42, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 42, "status": "active", "sorting": 0, "end_date": "10 Oct, 2024", "state_id": 1, "objective": "asa", "created_at": "2024-10-17T06:34:49.000000Z", "created_by": null, "created_ip": null, "start_date": "01 Oct, 2024", "upazila_id": 4, "updated_at": "2024-10-17T06:34:49.000000Z", "updated_by": null, "updated_ip": null, "district_id": 8, "project_name": "Xander Lawrenceasas"}}', '2024-10-17 00:34:49', '2024-10-17 00:34:49', 'ur'),
(765, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 96, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 96, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:34:49.000000Z", "created_by": null, "created_ip": null, "project_id": 42, "total_mark": 0, "updated_at": "2024-10-17T06:34:49.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-17 00:34:49', '2024-10-17 00:34:49', 'ur'),
(766, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 42, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"state_id": 1, "upazila_id": 4, "updated_at": "2024-10-17T06:34:49.000000Z", "district_id": 8}, "attributes": {"state_id": 4, "upazila_id": 5, "updated_at": "2024-10-17T06:35:27.000000Z", "district_id": 12}}', '2024-10-17 00:35:27', '2024-10-17 00:35:27', 'ur'),
(767, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 97, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 97, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:35:27.000000Z", "created_by": null, "created_ip": null, "project_id": 42, "total_mark": 0, "updated_at": "2024-10-17T06:35:27.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-17 00:35:27', '2024-10-17 00:35:27', 'ur'),
(768, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 42, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"state_id": 4, "upazila_id": 5, "updated_at": "2024-10-17T06:35:27.000000Z", "district_id": 12}, "attributes": {"state_id": 3, "upazila_id": 1, "updated_at": "2024-10-17T06:35:36.000000Z", "district_id": 3}}', '2024-10-17 00:35:36', '2024-10-17 00:35:36', 'ur'),
(769, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 98, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 98, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:35:36.000000Z", "created_by": null, "created_ip": null, "project_id": 42, "total_mark": 0, "updated_at": "2024-10-17T06:35:36.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-17 00:35:36', '2024-10-17 00:35:36', 'ur'),
(770, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 42, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"upazila_id": 1, "updated_at": "2024-10-17T06:35:36.000000Z", "district_id": 3}, "attributes": {"upazila_id": 2, "updated_at": "2024-10-17T06:35:50.000000Z", "district_id": 4}}', '2024-10-17 00:35:50', '2024-10-17 00:35:50', 'ur'),
(771, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 99, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 99, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:35:50.000000Z", "created_by": null, "created_ip": null, "project_id": 42, "total_mark": 0, "updated_at": "2024-10-17T06:35:50.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-17 00:35:50', '2024-10-17 00:35:50', 'ur');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `batch_uuid`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`, `status`) VALUES
(772, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 42, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"state_id": 3, "upazila_id": 2, "updated_at": "2024-10-17T06:35:50.000000Z", "district_id": 4}, "attributes": {"state_id": null, "upazila_id": null, "updated_at": "2024-10-17T06:36:04.000000Z", "district_id": null}}', '2024-10-17 00:36:04', '2024-10-17 00:36:04', 'ur'),
(773, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 100, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 100, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:36:05.000000Z", "created_by": null, "created_ip": null, "project_id": 42, "total_mark": 0, "updated_at": "2024-10-17T06:36:05.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-17 00:36:05', '2024-10-17 00:36:05', 'ur'),
(774, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 42, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"state_id": null, "updated_at": "2024-10-17T06:36:04.000000Z"}, "attributes": {"state_id": 1, "updated_at": "2024-10-17T06:37:46.000000Z"}}', '2024-10-17 00:37:46', '2024-10-17 00:37:46', 'ur'),
(775, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 101, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 101, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:37:46.000000Z", "created_by": null, "created_ip": null, "project_id": 42, "total_mark": 0, "updated_at": "2024-10-17T06:37:46.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-17 00:37:46', '2024-10-17 00:37:46', 'ur'),
(776, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 42, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"updated_at": "2024-10-17T06:37:46.000000Z", "district_id": null}, "attributes": {"updated_at": "2024-10-17T06:38:02.000000Z", "district_id": 1}}', '2024-10-17 00:38:02', '2024-10-17 00:38:02', 'ur'),
(777, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 102, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 102, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T06:38:02.000000Z", "created_by": null, "created_ip": null, "project_id": 42, "total_mark": 0, "updated_at": "2024-10-17T06:38:02.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-17 00:38:02', '2024-10-17 00:38:02', 'ur'),
(778, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 43, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 43, "status": "active", "sorting": 0, "end_date": null, "state_id": null, "objective": null, "created_at": "2024-10-17T07:00:34.000000Z", "created_by": null, "created_ip": null, "start_date": null, "upazila_id": null, "updated_at": "2024-10-17T07:00:34.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Mehedi"}}', '2024-10-17 01:00:34', '2024-10-17 01:00:34', 'ur'),
(779, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 103, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 103, "title": "", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:00:34.000000Z", "created_by": null, "created_ip": null, "project_id": 43, "total_mark": 0, "updated_at": "2024-10-17T07:00:34.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 0}}', '2024-10-17 01:00:34', '2024-10-17 01:00:34', 'ur'),
(780, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 104, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 104, "title": "Indicator one", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:08:18.000000Z", "created_by": null, "created_ip": null, "project_id": 43, "total_mark": 100, "updated_at": "2024-10-17T07:08:18.000000Z", "updated_by": null, "updated_ip": null, "description": "Test", "achivement_percentage": 80}}', '2024-10-17 01:08:18', '2024-10-17 01:08:18', 'ur'),
(781, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 105, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 105, "title": "Indicator one", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:08:46.000000Z", "created_by": null, "created_ip": null, "project_id": 43, "total_mark": 100, "updated_at": "2024-10-17T07:08:46.000000Z", "updated_by": null, "updated_ip": null, "description": "Test", "achivement_percentage": 80}}', '2024-10-17 01:08:46', '2024-10-17 01:08:46', 'ur'),
(782, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 106, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 106, "title": "Indicator One", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:08:46.000000Z", "created_by": null, "created_ip": null, "project_id": 43, "total_mark": 100, "updated_at": "2024-10-17T07:08:46.000000Z", "updated_by": null, "updated_ip": null, "description": "", "achivement_percentage": 80}}', '2024-10-17 01:08:46', '2024-10-17 01:08:46', 'ur'),
(783, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 44, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 44, "status": "active", "sorting": 0, "end_date": "04 Oct, 2024", "state_id": 1, "objective": "Illum tempor volupt Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.", "created_at": "2024-10-17T07:42:24.000000Z", "created_by": null, "created_ip": null, "start_date": "02 Oct, 2024", "upazila_id": 4, "updated_at": "2024-10-17T07:42:24.000000Z", "updated_by": null, "updated_ip": null, "district_id": 8, "project_name": "Rogan Terry"}}', '2024-10-17 01:42:24', '2024-10-17 01:42:24', 'ur'),
(784, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 107, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 107, "title": "Error velit iure occ", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:42:24.000000Z", "created_by": null, "created_ip": null, "project_id": 44, "total_mark": 96, "updated_at": "2024-10-17T07:42:24.000000Z", "updated_by": null, "updated_ip": null, "description": "Eiusmod rerum nulla Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.", "achivement_percentage": 10}}', '2024-10-17 01:42:24', '2024-10-17 01:42:24', 'ur'),
(785, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 45, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 45, "status": "active", "sorting": 0, "end_date": "15 Oct, 2024", "state_id": null, "objective": "Omnis incidunt accu\\nlorem 100 words\\nGPT-4o mini\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.", "created_at": "2024-10-17T07:49:12.000000Z", "created_by": null, "created_ip": null, "start_date": "10 Oct, 2024", "upazila_id": null, "updated_at": "2024-10-17T07:49:12.000000Z", "updated_by": null, "updated_ip": null, "district_id": null, "project_name": "Todd Sharpe"}}', '2024-10-17 01:49:12', '2024-10-17 01:49:12', 'ur'),
(786, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 108, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 108, "title": "Doloribus sed aut cu", "status": "deactive", "sorting": 0, "created_at": "2024-10-17T07:49:12.000000Z", "created_by": null, "created_ip": null, "project_id": 45, "total_mark": 78, "updated_at": "2024-10-17T07:49:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Est hic sequi id pr", "achivement_percentage": 11}}', '2024-10-17 01:49:12', '2024-10-17 01:49:12', 'ur'),
(787, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 109, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 109, "title": "Ducimus esse conse", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:49:12.000000Z", "created_by": null, "created_ip": null, "project_id": 45, "total_mark": 90, "updated_at": "2024-10-17T07:49:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Vitae totam est est", "achivement_percentage": 12}}', '2024-10-17 01:49:12', '2024-10-17 01:49:12', 'ur'),
(788, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 110, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 110, "title": "Maxime consectetur e", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:49:12.000000Z", "created_by": null, "created_ip": null, "project_id": 45, "total_mark": 80, "updated_at": "2024-10-17T07:49:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Aut quia at commodi", "achivement_percentage": 13}}', '2024-10-17 01:49:12', '2024-10-17 01:49:12', 'ur'),
(789, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 111, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 111, "title": "Molestiae omnis dolo", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:49:12.000000Z", "created_by": null, "created_ip": null, "project_id": 45, "total_mark": 85, "updated_at": "2024-10-17T07:49:12.000000Z", "updated_by": null, "updated_ip": null, "description": "Natus duis at consec", "achivement_percentage": 15}}', '2024-10-17 01:49:12', '2024-10-17 01:49:12', 'ur'),
(790, 'Project', 'Nogor Solutions - updated this', 'App\\Models\\Project', 45, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"state_id": null, "upazila_id": null, "updated_at": "2024-10-17T07:49:12.000000Z", "district_id": null}, "attributes": {"state_id": 3, "upazila_id": 1, "updated_at": "2024-10-17T07:49:23.000000Z", "district_id": 3}}', '2024-10-17 01:49:23', '2024-10-17 01:49:23', 'ur'),
(791, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 112, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 112, "title": "Doloribus sed aut cu", "status": "deactive", "sorting": 0, "created_at": "2024-10-17T07:49:23.000000Z", "created_by": null, "created_ip": null, "project_id": 45, "total_mark": 78, "updated_at": "2024-10-17T07:49:23.000000Z", "updated_by": null, "updated_ip": null, "description": "Est hic sequi id pr", "achivement_percentage": 11}}', '2024-10-17 01:49:23', '2024-10-17 01:49:23', 'ur'),
(792, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 113, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 113, "title": "Ducimus esse conse", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:49:23.000000Z", "created_by": null, "created_ip": null, "project_id": 45, "total_mark": 90, "updated_at": "2024-10-17T07:49:23.000000Z", "updated_by": null, "updated_ip": null, "description": "Vitae totam est est", "achivement_percentage": 12}}', '2024-10-17 01:49:23', '2024-10-17 01:49:23', 'ur'),
(793, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 114, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 114, "title": "Maxime consectetur e", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:49:23.000000Z", "created_by": null, "created_ip": null, "project_id": 45, "total_mark": 80, "updated_at": "2024-10-17T07:49:23.000000Z", "updated_by": null, "updated_ip": null, "description": "Aut quia at commodi", "achivement_percentage": 13}}', '2024-10-17 01:49:23', '2024-10-17 01:49:23', 'ur'),
(794, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 115, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 115, "title": "Molestiae omnis dolo", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:49:23.000000Z", "created_by": null, "created_ip": null, "project_id": 45, "total_mark": 85, "updated_at": "2024-10-17T07:49:23.000000Z", "updated_by": null, "updated_ip": null, "description": "Natus duis at consec", "achivement_percentage": 15}}', '2024-10-17 01:49:23', '2024-10-17 01:49:23', 'ur'),
(795, 'Project', 'Nogor Solutions - created this', 'App\\Models\\Project', 46, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 46, "status": "active", "sorting": 0, "end_date": "17 Oct, 2024", "state_id": 4, "objective": "Dolore nisi rerum la", "created_at": "2024-10-17T07:50:17.000000Z", "created_by": null, "created_ip": null, "start_date": "15 Oct, 2024", "upazila_id": 5, "updated_at": "2024-10-17T07:50:17.000000Z", "updated_by": null, "updated_ip": null, "district_id": 12, "project_name": "Cruz Leach"}}', '2024-10-17 01:50:17', '2024-10-17 01:50:17', 'ur'),
(796, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 116, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 116, "title": "Ut ea omnis illum e", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:50:17.000000Z", "created_by": null, "created_ip": null, "project_id": 46, "total_mark": 88, "updated_at": "2024-10-17T07:50:17.000000Z", "updated_by": null, "updated_ip": null, "description": "Inventore irure cons", "achivement_percentage": 11}}', '2024-10-17 01:50:17', '2024-10-17 01:50:17', 'ur'),
(797, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 117, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 117, "title": "Magna odit non conse", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:50:17.000000Z", "created_by": null, "created_ip": null, "project_id": 46, "total_mark": 88, "updated_at": "2024-10-17T07:50:17.000000Z", "updated_by": null, "updated_ip": null, "description": "Rerum harum qui quia", "achivement_percentage": 22}}', '2024-10-17 01:50:17', '2024-10-17 01:50:17', 'ur'),
(798, 'Indicator', 'Nogor Solutions - created this', 'App\\Models\\Indicator', 118, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 118, "title": "Hic aute quasi exped", "status": "active", "sorting": 0, "created_at": "2024-10-17T07:50:17.000000Z", "created_by": null, "created_ip": null, "project_id": 46, "total_mark": 77, "updated_at": "2024-10-17T07:50:17.000000Z", "updated_by": null, "updated_ip": null, "description": "Quod delectus omnis", "achivement_percentage": 14}}', '2024-10-17 01:50:17', '2024-10-17 01:50:17', 'ur'),
(799, 'Menu', 'Nogor Solutions - created this', 'App\\Models\\System\\Menu', 49, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 49, "icon": "<i class=''fa fa-circle-o text-aqua''></i>", "params": null, "sorting": 0, "menu_name": "ProjectActivity", "parent_id": null, "created_at": "2024-10-17T08:40:07.000000Z", "route_name": "projectActivity.index", "updated_at": "2024-10-17T08:40:07.000000Z", "show_profile": 0, "show_dasboard": 0}}', '2024-10-17 02:40:07', '2024-10-17 02:40:07', 'ur'),
(800, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 305, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 305, "name": "SurveyFormController", "route": null, "parent_id": null}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(801, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 306, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 306, "name": "index", "route": "surveyForm.index", "parent_id": 305}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(802, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 307, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 307, "name": "create", "route": "surveyForm.create", "parent_id": 305}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(803, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 308, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 308, "name": "store", "route": "surveyForm.store", "parent_id": 305}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(804, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 309, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 309, "name": "show", "route": "surveyForm.show", "parent_id": 305}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(805, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 310, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 310, "name": "edit", "route": "surveyForm.edit", "parent_id": 305}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(806, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 311, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 311, "name": "update", "route": "surveyForm.update", "parent_id": 305}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(807, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 312, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 312, "name": "destroy", "route": "surveyForm.destroy", "parent_id": 305}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(808, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 313, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 313, "name": "SurveyController", "route": null, "parent_id": null}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(809, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 314, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 314, "name": "index", "route": "survey.index", "parent_id": 313}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(810, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 315, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 315, "name": "create", "route": "survey.create", "parent_id": 313}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(811, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 316, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 316, "name": "store", "route": "survey.store", "parent_id": 313}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(812, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 317, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 317, "name": "show", "route": "survey.show", "parent_id": 313}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(813, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 318, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 318, "name": "edit", "route": "survey.edit", "parent_id": 313}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(814, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 319, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 319, "name": "update", "route": "survey.update", "parent_id": 313}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(815, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 320, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 320, "name": "destroy", "route": "survey.destroy", "parent_id": 313}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(816, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 321, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 321, "name": "ProjectActivityController", "route": null, "parent_id": null}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(817, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 322, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 322, "name": "index", "route": "projectActivity.index", "parent_id": 321}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(818, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 323, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 323, "name": "create", "route": "projectActivity.create", "parent_id": 321}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(819, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 324, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 324, "name": "store", "route": "projectActivity.store", "parent_id": 321}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(820, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 325, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 325, "name": "show", "route": "projectActivity.show", "parent_id": 321}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(821, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 326, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 326, "name": "edit", "route": "projectActivity.edit", "parent_id": 321}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(822, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 327, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 327, "name": "update", "route": "projectActivity.update", "parent_id": 321}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(823, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 328, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 328, "name": "destroy", "route": "projectActivity.destroy", "parent_id": 321}}', '2024-10-17 02:41:13', '2024-10-17 02:41:13', 'ur'),
(824, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 1, "title": "Dolore enim exercita", "status": "deactive", "created_at": "2024-10-17T11:15:51.000000Z", "created_by": 1, "created_ip": 1, "updated_at": "2024-10-17T11:15:51.000000Z", "updated_by": 1, "updated_ip": 1}}', '2024-10-17 05:15:51', '2024-10-17 05:15:51', 'ur'),
(825, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 1, "title": "Voluptates aspernatu", "status": "active", "sorting": 0, "created_at": "2024-10-17T11:23:44.000000Z", "project_id": 46, "updated_at": "2024-10-17T11:23:44.000000Z", "description": "<p>asdasd</p>", "indicator_id": 116, "is_surveyable": 0, "beneficiary_attendance": 0}}', '2024-10-17 05:23:44', '2024-10-17 05:23:44', 'ur'),
(826, 'ProjectActivity', 'Nogor Solutions - updated this', 'App\\Models\\ProjectActivity', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"updated_at": "2024-10-17T11:23:44.000000Z", "beneficiary_attendance": 0}, "attributes": {"updated_at": "2024-10-17T11:23:57.000000Z", "beneficiary_attendance": 1}}', '2024-10-17 05:23:57', '2024-10-17 05:23:57', 'ur'),
(827, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 2, "title": "asdasd", "status": "active", "sorting": 0, "created_at": "2024-10-17T11:27:06.000000Z", "project_id": 45, "updated_at": "2024-10-17T11:27:06.000000Z", "description": null, "indicator_id": null, "is_surveyable": 1, "beneficiary_attendance": 1}}', '2024-10-17 05:27:06', '2024-10-17 05:27:06', 'ur'),
(828, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 3, "title": "asasd", "status": "deactive", "sorting": 0, "created_at": "2024-10-17T11:28:48.000000Z", "project_id": 46, "updated_at": "2024-10-17T11:28:48.000000Z", "description": "<p>asdasdasd</p>", "indicator_id": 117, "is_surveyable": 0, "beneficiary_attendance": 0}}', '2024-10-17 05:28:48', '2024-10-17 05:28:48', 'ur'),
(829, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 4, "title": "Id sequi tenetur si", "status": "active", "sorting": 0, "created_at": "2024-10-17T12:19:06.000000Z", "project_id": 45, "updated_at": "2024-10-17T12:19:06.000000Z", "description": "<p>dasdasda</p>", "indicator_id": 113, "is_surveyable": 0, "beneficiary_attendance": 0}}', '2024-10-17 06:19:06', '2024-10-17 06:19:06', 'ur'),
(830, 'ProjectActivity', 'Nogor Solutions - updated this', 'App\\Models\\ProjectActivity', 4, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"title": "Id sequi tenetur si", "updated_at": "2024-10-17T12:19:06.000000Z"}, "attributes": {"title": "Id sequi tenetur sias", "updated_at": "2024-10-17T12:19:16.000000Z"}}', '2024-10-17 06:19:16', '2024-10-17 06:19:16', 'ur'),
(831, 'ProjectActivity', 'Nogor Solutions - updated this', 'App\\Models\\ProjectActivity', 2, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"updated_at": "2024-10-17T11:27:06.000000Z", "indicator_id": null}, "attributes": {"updated_at": "2024-10-17T12:48:18.000000Z", "indicator_id": 113}}', '2024-10-17 06:48:18', '2024-10-17 06:48:18', 'ur'),
(832, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 5, "title": "Consequat Dolor nis", "status": "active", "sorting": 0, "created_at": "2024-10-17T12:49:51.000000Z", "project_id": 44, "updated_at": "2024-10-17T12:49:51.000000Z", "description": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.</p>\\n\\n<p>Get smarter answer from GPT-4o</p>", "indicator_id": 107, "is_surveyable": 0, "beneficiary_attendance": 1}}', '2024-10-17 06:49:51', '2024-10-17 06:49:51', 'ur'),
(833, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 6, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 6, "title": "Dicta voluptatem dol", "status": "deactive", "sorting": 0, "created_at": "2024-10-17T12:50:07.000000Z", "project_id": 45, "updated_at": "2024-10-17T12:50:07.000000Z", "description": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.</p>\\n\\n<p>Get smarter answer from GPT-4o</p>", "indicator_id": 114, "is_surveyable": 1, "beneficiary_attendance": 0}}', '2024-10-17 06:50:07', '2024-10-17 06:50:07', 'ur'),
(834, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 7, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 7, "title": "Accusantium et eaque", "status": "active", "sorting": 0, "created_at": "2024-10-17T12:50:24.000000Z", "project_id": 46, "updated_at": "2024-10-17T12:50:24.000000Z", "description": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.</p>\\n\\n<p>Get smarter answer from GPT-4o</p>", "indicator_id": 118, "is_surveyable": 0, "beneficiary_attendance": 0}}', '2024-10-17 06:50:24', '2024-10-17 06:50:24', 'ur'),
(835, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 8, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 8, "title": "Aut dolor sunt mole", "status": "active", "sorting": 0, "created_at": "2024-10-17T13:16:34.000000Z", "project_id": 45, "updated_at": "2024-10-17T13:16:34.000000Z", "description": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.</p>\\n\\n<p>Get smarter answer from GPT-4o</p>", "indicator_id": 113, "is_surveyable": 0, "beneficiary_attendance": 0}}', '2024-10-17 07:16:34', '2024-10-17 07:16:34', 'ur'),
(836, 'ProjectActivity', 'Nogor Solutions - updated this', 'App\\Models\\ProjectActivity', 8, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"status": "active", "updated_at": "2024-10-17T13:16:34.000000Z"}, "attributes": {"status": "deactive", "updated_at": "2024-10-17T13:16:39.000000Z"}}', '2024-10-17 07:16:39', '2024-10-17 07:16:39', 'ur'),
(837, 'UserLoginHistory', 'Nogor Solutions - created this', 'App\\Models\\UserLoginHistory', 132, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 132, "status": "active", "sorting": 0, "user_id": 1, "login_at": "2024-10-20 03:36:39", "login_ip": "::1", "created_at": "2024-10-20T03:36:39.000000Z", "updated_at": "2024-10-20T03:36:39.000000Z", "user_guard": "admin", "login_browser_client": "Google Chrome"}}', '2024-10-19 21:36:39', '2024-10-19 21:36:39', 'ur'),
(838, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 9, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 9, "title": "Quis sunt maiores vo", "status": "active", "sorting": 0, "created_at": "2024-10-20T03:39:43.000000Z", "project_id": 46, "updated_at": "2024-10-20T03:39:43.000000Z", "description": "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.</p>\\n\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.</p>\\n\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus, ut tincidunt erat fermentum in. Vivamus gravida felis in nisi venenatis, ac imperdiet risus hendrerit. Nulla facilisi. Mauris vel nisi quis erat semper facilisis.</p>\\n\\n<p>&nbsp;</p>", "indicator_id": 117, "is_surveyable": 0, "beneficiary_attendance": 0}}', '2024-10-19 21:39:43', '2024-10-19 21:39:43', 'ur'),
(839, 'ProjectActivity', 'Nogor Solutions - updated this', 'App\\Models\\ProjectActivity', 9, 'updated', NULL, 'App\\Models\\Admin', 1, '{"old": {"updated_at": "2024-10-20T03:39:43.000000Z", "beneficiary_attendance": 0}, "attributes": {"updated_at": "2024-10-20T03:42:52.000000Z", "beneficiary_attendance": 1}}', '2024-10-19 21:42:52', '2024-10-19 21:42:52', 'ur'),
(840, 'Upazila', 'Nogor Solutions - created this', 'App\\Models\\Upazila', 6, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 6, "name": "NSL", "status": "active", "sorting": 6, "state_id": 4, "created_at": "2024-10-20T04:16:10.000000Z", "deleted_at": null, "updated_at": "2024-10-20T04:16:10.000000Z", "district_id": 12}}', '2024-10-19 22:16:10', '2024-10-19 22:16:10', 'ur'),
(841, 'Menu', 'Nogor Solutions - created this', 'App\\Models\\System\\Menu', 50, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 50, "icon": "<i class=''fa fa-circle-o text-aqua''></i>", "params": null, "sorting": 0, "menu_name": "ProjectAchievementSetup", "parent_id": null, "created_at": "2024-10-20T05:09:49.000000Z", "route_name": "projectAchievementSetup.index", "updated_at": "2024-10-20T05:09:49.000000Z", "show_profile": 0, "show_dasboard": 0}}', '2024-10-19 23:09:49', '2024-10-19 23:09:49', 'ur'),
(842, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 329, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 329, "name": "ProjectAchievementSetupController", "route": null, "parent_id": null}}', '2024-10-19 23:10:58', '2024-10-19 23:10:58', 'ur'),
(843, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 330, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 330, "name": "index", "route": "projectAchievementSetup.index", "parent_id": 329}}', '2024-10-19 23:10:58', '2024-10-19 23:10:58', 'ur'),
(844, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 331, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 331, "name": "create", "route": "projectAchievementSetup.create", "parent_id": 329}}', '2024-10-19 23:10:58', '2024-10-19 23:10:58', 'ur'),
(845, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 332, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 332, "name": "store", "route": "projectAchievementSetup.store", "parent_id": 329}}', '2024-10-19 23:10:58', '2024-10-19 23:10:58', 'ur'),
(846, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 333, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 333, "name": "show", "route": "projectAchievementSetup.show", "parent_id": 329}}', '2024-10-19 23:10:58', '2024-10-19 23:10:58', 'ur'),
(847, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 334, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 334, "name": "edit", "route": "projectAchievementSetup.edit", "parent_id": 329}}', '2024-10-19 23:10:59', '2024-10-19 23:10:59', 'ur'),
(848, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 335, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 335, "name": "update", "route": "projectAchievementSetup.update", "parent_id": 329}}', '2024-10-19 23:10:59', '2024-10-19 23:10:59', 'ur'),
(849, 'Permission', 'Nogor Solutions - created this', 'App\\Models\\System\\Permission', 336, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 336, "name": "destroy", "route": "projectAchievementSetup.destroy", "parent_id": 329}}', '2024-10-19 23:10:59', '2024-10-19 23:10:59', 'ur'),
(850, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 10, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 10, "title": "Activities 1", "status": "active", "sorting": 0, "created_at": "2024-10-20T07:16:26.000000Z", "project_id": 44, "updated_at": "2024-10-20T07:16:26.000000Z", "description": null, "indicator_id": 107, "is_surveyable": 0, "beneficiary_attendance": 1}}', '2024-10-20 01:16:26', '2024-10-20 01:16:26', 'ur'),
(851, 'ProjectActivity', 'Nogor Solutions - created this', 'App\\Models\\ProjectActivity', 11, 'created', NULL, 'App\\Models\\Admin', 1, '{"attributes": {"id": 11, "title": "Activity 2", "status": "active", "sorting": 0, "created_at": "2024-10-20T07:16:45.000000Z", "project_id": 44, "updated_at": "2024-10-20T07:16:45.000000Z", "description": null, "indicator_id": 107, "is_surveyable": 1, "beneficiary_attendance": 0}}', '2024-10-20 01:16:45', '2024-10-20 01:16:45', 'ur');

-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_survey_report_views`
--
CREATE TABLE IF NOT EXISTS `activity_survey_report_views` (
`project_id` bigint(20) unsigned
,`indicator_id` bigint(20) unsigned
,`activity_id` bigint(20) unsigned
,`average_activity_survey_mark` decimal(65,12)
);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint(20) unsigned NOT NULL,
  `role_id` tinyint(4) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `block` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Active, 1=Deactive',
  `status` enum('active','deactive','trash') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `username`, `email`, `password`, `mobile`, `profile`, `address`, `block`, `status`, `remember_token`, `created_by`, `created_ip`, `updated_by`, `updated_ip`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nogor Solutions Limited', 'NSL', 'nsl@gmail.com', '$2y$10$zv71u0SIByYKMTPTp10IDetWIhf8yQbia05Y/uhdbf9mg6q50hL/2', '01700000001', '{"600x600":"upload\\/profile\\/600x600\\/cfa4430f-b1e8-44b4-ac71-6166c55e4ae6.avif","300x300":"upload\\/profile\\/300x300\\/45a14bfa-c326-4691-9ff5-7ec14f76ae67.avif","50x50":"upload\\/profile\\/50x50\\/3bf721e7-cfc4-402e-89dc-23797d7db48d.avif","original":"upload\\/profile\\/original\\/09282e57-2e0d-4704-a1e9-168ebe742d38.avif"}', 'Niketon', 0, 'active', '6xXmqRvBatvWy25mFWozhed36KsOqccLUX9hfncCeS2dKpNsNfkaTQIPVg7s', NULL, NULL, NULL, NULL, NULL, '2024-06-02 06:52:42', '2025-03-06 02:45:12'),
(2, 2, 'Nogor', 'nogor', 'nogor@gmail.com', '$2y$10$VwYx2tEI60GVILioOVUzle1rPqN6wVVpDrhVRD1tS0sSn3fsXetHS', '01700000001', NULL, NULL, 0, 'active', 'ygDxptVw98', NULL, NULL, NULL, NULL, NULL, '2024-06-02 06:52:42', '2024-06-02 06:52:42'),
(3, 1, 'Sayma', 'Topadar', 'nogorltd.tihany@gmail.com', '$2y$10$bV120Js.v5ZF6YvtJhy3EebcHVwq.LqMZt3LV/KECPiU6l1suwYn.', '01719964727', NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-06 02:49:42', '2025-03-06 02:49:42'),
(4, 1, 'Mehedi', 'Mehedi', 'mehedihasan33x@gmail.com', '$2y$10$9dKbKvmT8GGxPW9hRwkEluHaLcqlMX1D4outIfXfNyNMo1.ncTxC.', NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `apip_views`
--
CREATE TABLE IF NOT EXISTS `apip_views` (
`project_id` bigint(20) unsigned
,`total_pap` decimal(56,4)
,`ti` bigint(21)
,`apip` decimal(60,8)
);

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE IF NOT EXISTS `assets` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `title`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Boat', 1, 'active', '2025-02-22 08:43:32', '2025-02-22 08:43:32');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaries`
--

CREATE TABLE IF NOT EXISTS `beneficiaries` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bangla` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beneficiary_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_certificate_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergencey_contact` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','others') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_certificate` text COLLATE utf8mb4_unicode_ci,
  `present_address` longtext COLLATE utf8mb4_unicode_ci,
  `pre_state_id` bigint(20) unsigned DEFAULT NULL,
  `pre_district_id` bigint(20) unsigned DEFAULT NULL,
  `pre_upazilla_id` bigint(20) unsigned DEFAULT NULL,
  `pre_thana_id` int(11) DEFAULT NULL,
  `permanent_address` longtext COLLATE utf8mb4_unicode_ci,
  `per_state_id` bigint(20) unsigned DEFAULT NULL,
  `per_district_id` bigint(20) unsigned DEFAULT NULL,
  `per_upazilla_id` bigint(20) unsigned DEFAULT NULL,
  `per_thana_id` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiaries`
--

INSERT INTO `beneficiaries` (`id`, `title`, `full_name`, `name_bangla`, `beneficiary_no`, `date_of_birth`, `nid`, `birth_certificate_no`, `mobile_no`, `emergencey_contact`, `email`, `image`, `gender`, `marital_status`, `birth_certificate`, `present_address`, `pre_state_id`, `pre_district_id`, `pre_upazilla_id`, `pre_thana_id`, `permanent_address`, `per_state_id`, `per_district_id`, `per_upazilla_id`, `per_thana_id`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(109, NULL, 'Sayma', 'সায়মা', '1111', NULL, '8221823191', NULL, '01719964727', '', NULL, 'null', 'female', NULL, NULL, NULL, 7, 14, 11, 0, NULL, 7, 14, 11, 0, 0, 'active', '2025-02-23 06:34:24', '2025-02-23 06:34:24'),
(110, NULL, 'Tihany', 'তিহানি', '1112', NULL, '1121823191', NULL, '01819964727', NULL, NULL, 'null', 'female', NULL, 'null', NULL, 7, 15, 13, 0, NULL, 7, 15, 13, 0, 0, 'active', '2025-02-23 08:58:55', '2025-03-06 06:19:08'),
(111, NULL, 'Test', 'সোফিয়া', '1113', '1987-02-03', '2354234234', '21342234', '01719964721', '01536569598', 'hmehedi3227@gmail.com', '{"145x95":"upload\\/beneficiary\\/145x95\\/f07a6406-8189-4117-abdc-2bb87eed6d24.avif","original":"upload\\/beneficiary\\/original\\/91b54bba-d737-439b-9199-f52c88d8845f.avif"}', 'female', 'unmarried', NULL, 'sofipur,kaliakair', 7, 15, 13, 4, 'sofipur,kaliakair', 7, 15, 13, 4, 0, 'active', '2025-02-25 09:44:55', '2025-02-25 09:44:55'),
(112, NULL, 'Mr. Boyd Smitham DDS', 'Treva Ryan', '89209', '2011-12-02', '742742552', '524278924', '801-708-7390', NULL, 'golden.parker@example.com', 'https://via.placeholder.com/640x480.png/0077ff?text=ut', 'male', 'married', 'Quos cumque id sit ex modi soluta nisi. Rerum enim aliquam vel labore aut dolores natus.', '215 Beer Tunnel Apt. 523\nNorth Waylonchester, WV 62904', 1, 2, 3, NULL, '98012 Zulauf Dam\nNew Eleanore, SD 20452', 2, 1, 3, NULL, 7, 'deactive', '2025-03-02 05:00:50', '2025-03-02 05:00:50'),
(113, NULL, 'Amalia Conn', 'Shaniya Rolfson', '80807', '1991-02-15', '598246790', '989171621', '+13617702390', NULL, 'jrohan@example.com', 'https://via.placeholder.com/640x480.png/0011cc?text=fugit', 'male', 'married', 'Eligendi voluptatem a aspernatur. Porro harum eligendi quam enim saepe sunt velit non.', '790 Elfrieda Grove\nWehnerbury, OK 47849', 2, 3, 1, NULL, '397 Kovacek Loop Suite 893\nNorth Waynemouth, CA 79490', 2, 1, 3, NULL, 2, 'active', '2025-03-02 05:00:50', '2025-03-02 05:00:50'),
(114, NULL, 'Lorena Runolfsdottir', 'Jerrell Bogan', '42182', '2022-02-01', '573670604', '778885592', '+1.812.418.6822', NULL, 'torp.margarett@example.org', 'https://via.placeholder.com/640x480.png/00ee77?text=consequatur', 'male', 'married', 'Et dignissimos quisquam magni accusamus. Voluptatem assumenda cum sed et quo.', '15751 Lavinia Viaduct Suite 532\nRitchieshire, MN 75051-1509', 1, 3, 3, NULL, '58841 Kristin Crescent\nFredview, NV 93263', 1, 1, 3, NULL, 5, 'active', '2025-03-02 05:00:50', '2025-03-02 05:00:50'),
(115, NULL, 'Camryn Johnston', 'Aubrey McKenzie PhD', '39299', '2002-07-16', '202956943', '841264665', '+1.341.525.2102', NULL, 'lenny.block@example.net', 'https://via.placeholder.com/640x480.png/00bbff?text=quos', 'male', 'married', 'Facilis quod eos voluptatem eligendi dolore assumenda. Rerum ipsam sint ut non nisi.', '224 Camylle Flats Suite 336\nLake Isom, SC 64804-1213', 2, 2, 3, NULL, '137 Monique Branch\nPort Daisy, ID 06520-6954', 1, 3, 3, NULL, 8, 'active', '2025-03-02 05:00:50', '2025-03-02 05:00:50'),
(116, NULL, 'Ben Bergstrom', 'Shaniya Kuhic', '15979', '1992-06-06', '643146625', '606785815', '+1.206.843.7520', NULL, 'xfritsch@example.net', 'https://via.placeholder.com/640x480.png/004422?text=non', 'male', 'married', 'Ut dolor molestiae est aliquid exercitationem quod non. Molestias totam minus distinctio.', '50905 Dakota Ports\nFriesenmouth, WI 98468-9184', 2, 3, 1, NULL, '89373 Payton Route\nCrawfordberg, OH 63223', 3, 3, 1, NULL, 4, 'deactive', '2025-03-02 05:00:50', '2025-03-02 05:00:50'),
(117, NULL, 'Darian Blick', 'Reed Dicki II', '47369', '1981-05-05', '916511976', '447689374', '+1-346-992-9942', NULL, 'veichmann@example.org', 'https://via.placeholder.com/640x480.png/009988?text=quasi', 'male', 'married', 'Molestias nihil rerum rerum. Et incidunt eos hic et. Et quia fuga vitae enim.', '99223 Marisa Square\nPagacbury, WY 63996-2115', 3, 1, 3, NULL, '927 Cali Parks\nMaryjanebury, VT 66218', 3, 1, 2, NULL, 8, 'active', '2025-03-02 05:00:50', '2025-03-02 05:00:50'),
(118, NULL, 'Shawna Rippin PhD', 'Prof. Clifton Corkery DDS', '90553', '2023-01-07', '483694335', '558799398', '+1 (240) 554-1752', NULL, 'sbosco@example.com', 'https://via.placeholder.com/640x480.png/000066?text=at', 'male', 'married', 'Et et non amet eaque illo. Totam error quia dolores.', '4977 Marlene Mission\nAndyton, RI 47426-0086', 3, 1, 3, NULL, '163 Olga Cove\nZulaufmouth, WI 66104', 3, 2, 1, NULL, 4, 'active', '2025-03-02 05:00:50', '2025-03-02 05:00:50'),
(119, NULL, 'Colin Bergstrom', 'Stephanie Lehner', '26184', '2009-07-05', '493764968', '781617830', '938-908-0558', NULL, 'batz.isaiah@example.com', 'https://via.placeholder.com/640x480.png/002255?text=illum', 'male', 'married', 'Ratione ut nemo nulla porro aut et quia eos. Quo quas dolorum impedit qui omnis quas.', '127 Waters Viaduct Apt. 300\nWeberland, DC 10235-5872', 2, 1, 2, NULL, '9589 Goodwin Mountain Apt. 313\nNew Tevinton, OH 80548', 1, 2, 2, NULL, 2, 'deactive', '2025-03-02 05:00:50', '2025-03-02 05:00:50'),
(120, NULL, 'Wade Marks', 'Jacinto Metz', '50178', '1972-09-24', '507190658', '580028988', '281-926-5746', NULL, 'murphy.maiya@example.net', 'https://via.placeholder.com/640x480.png/0044bb?text=fugit', 'male', 'married', 'Sunt vitae sed ipsa voluptates minus quasi. Recusandae atque assumenda quo necessitatibus commodi.', '5441 Kutch Skyway Apt. 829\nPort Mario, AZ 39945-8193', 2, 1, 3, NULL, '333 Javonte Keys Suite 411\nPort Randyhaven, IL 92839', 2, 2, 1, NULL, 7, 'active', '2025-03-02 05:00:50', '2025-03-02 05:00:50'),
(121, NULL, 'Ms. Bonita Davis II', 'Dr. Marcelle Bauch PhD', '39285', '2014-08-29', '889145723', '856826867', '+1-341-589-9402', NULL, 'abbott.shawna@example.org', 'https://via.placeholder.com/640x480.png/00dd11?text=assumenda', 'male', 'married', 'Debitis accusamus ipsam ut. Minima nostrum hic nihil eos sint autem illo.', '6618 Demond Keys Suite 412\nLake Marleyport, WA 50490-7465', 3, 2, 2, NULL, '130 Reichert Locks Suite 272\nPort Lowellton, NM 26781', 2, 3, 3, NULL, 1, 'deactive', '2025-03-02 05:00:50', '2025-03-02 05:00:50'),
(122, NULL, 'Lafayette Mohr', 'Idella O''Connell', '39379', '1985-11-15', '959475548', '813972165', '224.389.7251', NULL, 'randy87@example.net', 'https://via.placeholder.com/640x480.png/004477?text=omnis', 'male', 'married', 'Quia quo illo minima enim earum. Quam est harum sed. Illo illum et sint in qui.', '6062 Fleta Walk\nCasperville, IN 01592', 2, 2, 2, NULL, '520 Hagenes Corner Apt. 212\nWest Vidal, MO 41570', 1, 3, 1, NULL, 10, 'deactive', '2025-03-02 05:01:41', '2025-03-02 05:01:41'),
(123, NULL, 'Jerald Hill', 'Holly Kertzmann', '78746', '1998-09-01', '441564957', '161871376', '1-661-589-1017', NULL, 'jaydon.mertz@example.com', 'https://via.placeholder.com/640x480.png/00ff11?text=vitae', 'male', 'married', 'Dolorem repellendus labore eum et dicta esse. Officiis tempore corrupti exercitationem aut porro.', '65596 Audreanne Stream\nTevinstad, PA 90261', 2, 2, 3, NULL, '81588 Lera Station\nOkunevashire, NV 30006', 2, 1, 2, NULL, 7, 'deactive', '2025-03-02 05:01:41', '2025-03-02 05:01:41'),
(124, NULL, 'Americo Welch', 'Sydney Stehr II', '79278', '2007-04-10', '229114445', '315073774', '+17476635310', NULL, 'amya65@example.org', 'https://via.placeholder.com/640x480.png/00bbdd?text=possimus', 'male', 'married', 'Nam dolor sed veritatis recusandae. Tenetur ut et asperiores. Enim illum aliquid aut dolor.', '505 Harris Road\nColbymouth, VA 11519', 1, 2, 1, NULL, '483 Turner Expressway\nHerzogshire, WV 94685-0462', 3, 1, 1, NULL, 2, 'active', '2025-03-02 05:01:41', '2025-03-02 05:01:41'),
(125, NULL, 'Lavinia Goodwin', 'Prof. Melvina Schuster', '14304', '1992-10-22', '747594789', '136495735', '+14795956592', NULL, 'giles94@example.net', 'https://via.placeholder.com/640x480.png/003399?text=porro', 'male', 'married', 'Dolorem distinctio excepturi et soluta veritatis corrupti. Occaecati molestiae unde vitae et eius.', '9437 Raina Lodge\nNorth Lee, HI 00587', 3, 1, 1, NULL, '978 Earnestine Inlet Apt. 371\nHughside, NE 43660-9568', 3, 1, 3, NULL, 7, 'deactive', '2025-03-02 05:01:41', '2025-03-02 05:01:41'),
(126, NULL, 'Meggie Feest', 'Miss Halie Herman I', '32858', '1991-09-25', '752722310', '669610138', '+1-631-234-5632', NULL, 'lacy55@example.net', 'https://via.placeholder.com/640x480.png/00ff55?text=mollitia', 'male', 'married', 'Ullam dicta ut labore nisi. Voluptatem doloremque voluptatem aliquam. Id adipisci aut iure error.', '745 Marks Forest Apt. 628\nNorth Jaycee, OH 83746', 2, 3, 2, NULL, '670 Lakin Creek\nNorth Gerson, WY 33713', 1, 1, 2, NULL, 6, 'active', '2025-03-02 05:01:41', '2025-03-02 05:01:41'),
(127, NULL, 'Hattie Quitzon', 'Edison Sanford', '57996', '2010-12-27', '168452881', '251434951', '785-595-0314', NULL, 'rebeka.walker@example.com', 'https://via.placeholder.com/640x480.png/008844?text=perspiciatis', 'male', 'married', 'Enim aliquid eos consectetur ea nobis sunt beatae. Ut temporibus sequi in magnam ea autem aut.', '8292 Shaniya Causeway Suite 534\nMaeganchester, VT 18545', 3, 2, 1, NULL, '17924 Nikita Ridges Apt. 614\nWest Camryntown, NJ 20219-3799', 3, 3, 1, NULL, 4, 'deactive', '2025-03-02 05:01:41', '2025-03-02 05:01:41'),
(128, NULL, 'Lisette Hills', 'Maxwell Cruickshank', '56360', '1980-03-13', '112188929', '843715412', '1-714-519-7044', NULL, 'zrempel@example.com', 'https://via.placeholder.com/640x480.png/005566?text=labore', 'male', 'married', 'Omnis eum dicta inventore ut nisi. A amet et quaerat. Commodi possimus modi non expedita numquam.', '70951 Deonte Fall\nNorth Cornell, MT 40144-9921', 1, 3, 3, NULL, '9521 Mills Isle\nLuisville, ID 66065-8101', 1, 3, 2, NULL, 5, 'active', '2025-03-02 05:01:41', '2025-03-02 05:01:41'),
(129, NULL, 'Mrs. Alia Sanford II', 'Angelica Muller', '45004', '2023-01-05', '807499009', '549535589', '(501) 233-9865', NULL, 'mante.jordan@example.com', 'https://via.placeholder.com/640x480.png/00ee88?text=voluptates', 'male', 'married', 'Recusandae eum libero rerum quas. Quae aut numquam atque aliquam sit ut. Commodi iste quos ipsum.', '9950 Marty Forest Suite 098\nOllieport, NH 56945', 2, 3, 1, NULL, '6413 Eda Mount Apt. 565\nDangelofort, CO 03181-7922', 1, 1, 2, NULL, 2, 'active', '2025-03-02 05:01:41', '2025-03-02 05:01:41'),
(130, NULL, 'Axel Corwin', 'Davonte Klein', '54514', '2018-12-09', '872037957', '925731540', '+1 (980) 644-7330', NULL, 'hprosacco@example.com', 'https://via.placeholder.com/640x480.png/00ccff?text=cupiditate', 'male', 'married', 'Debitis non ut totam dolor perspiciatis qui id. Aperiam optio veniam omnis dolore vero.', '624 Rico Terrace\nLake Monteview, FL 40289-1011', 2, 1, 3, NULL, '595 Wisozk Ports Suite 993\nCummingsburgh, TX 40314', 1, 3, 2, NULL, 9, 'deactive', '2025-03-02 05:01:41', '2025-03-02 05:01:41'),
(131, NULL, 'Barry Cassin', 'Candida Hane Sr.', '19544', '1980-06-16', '817487225', '826237686', '(352) 697-5371', NULL, 'yfranecki@example.net', 'https://via.placeholder.com/640x480.png/00aa77?text=voluptatem', 'male', 'married', 'Quis eos error deleniti. Aperiam sint aut totam ut recusandae optio beatae.', '41927 Dach Corner Suite 351\nMoentown, MI 83908-9212', 3, 2, 3, NULL, '42216 Valentine Port\nPort Lilly, MA 03690', 3, 2, 1, NULL, 1, 'active', '2025-03-02 05:01:41', '2025-03-02 05:01:41'),
(134, NULL, 'isDisable', 'সালাম', '90554', '2025-03-20', '5588', '5552', '01515644470', NULL, 'sadj@ffg.hh', 'https://i.ibb.co.com/WpMKXcr/download.png', 'female', 'married', '5552', 'Welcome to Gboard clipboard, any text you copy will be saved here.', 7, 14, 11, NULL, 'Welcome to Gboard clipboard, any text you copy will be saved here.', 7, 14, 11, NULL, 0, 'active', '2025-03-05 19:59:33', '2025-03-05 19:59:33'),
(135, NULL, 'Ght', 'সালাম', '90555', '2025-03-06', '888', '01515644470', '01515644470', NULL, 're@ff.tt', 'https://i.ibb.co.com/WpMKXcr/download.png', 'male', 'married', '01515644470', 'Fedf', 8, 18, 20, NULL, 'Fedf', 8, 18, 20, NULL, 0, 'active', '2025-03-05 20:02:38', '2025-03-05 20:02:38'),
(136, NULL, 'instance.addPostFrameCallback((_)', 'সালাম', '90556', '2025-03-19', '123134', '123451345', '01515644470', NULL, 'sasa@ffa.cc', 'https://i.ibb.co.com/WpMKXcr/download.png', 'male', 'married', '123451345', 'sdvasdvcjg', 8, 18, 20, NULL, 'sdvasdvc', 8, 18, 20, NULL, 0, 'active', '2025-03-05 20:06:20', '2025-03-06 00:03:36'),
(137, NULL, 'AS', 'হস', '90557', '2025-03-05', '1133131331', '3131313131', '01767525252', NULL, 'a@gnail.com', 'https://i.ibb.co.com/WpMKXcr/download.png', 'male', 'married', '3131313131', 'Dd', 7, 15, 16, NULL, 'Dd', 7, 15, 16, NULL, 0, 'active', '2025-03-06 05:21:38', '2025-03-06 05:21:38'),
(138, NULL, 'Fhc', 'বাংলা', '90558', '2025-03-18', '5888', '56', '01515644470', NULL, 'sad@rf.hh', 'https://i.ibb.co.com/WpMKXcr/download.png', 'male', 'married', '56', 'Gfd', 7, 15, 16, NULL, 'Gfd', 7, 15, 16, NULL, 0, 'active', '2025-03-08 16:23:49', '2025-03-08 16:23:49'),
(139, NULL, 'Gf Do f Go', 'সাদিক', '90559', '2025-03-19', '34563456', '345634563456', '01515644470', NULL, 'sadik5397@gasg.sdfsdf', 'https://i.ibb.co.com/WpMKXcr/download.png', 'female', 'unmarried', '345634563456', 'asas', 7, 14, 11, NULL, 'asas', 7, 14, 11, NULL, 0, 'active', '2025-03-08 17:05:48', '2025-03-11 19:55:41');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_assigns`
--

CREATE TABLE IF NOT EXISTS `beneficiary_assigns` (
  `id` bigint(20) unsigned NOT NULL,
  `beneficiary_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `indicator_id` bigint(20) unsigned NOT NULL,
  `activity_id` bigint(20) unsigned NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiary_assigns`
--

INSERT INTO `beneficiary_assigns` (`id`, `beneficiary_id`, `project_id`, `indicator_id`, `activity_id`, `group_id`, `status`, `created_at`, `updated_at`) VALUES
(510, 109, 68, 241, 120, NULL, 'active', NULL, NULL),
(511, 110, 68, 241, 120, NULL, 'active', NULL, NULL),
(512, 111, 68, 241, 120, NULL, 'active', NULL, NULL),
(513, 112, 68, 241, 120, NULL, 'active', NULL, NULL),
(514, 113, 68, 241, 120, NULL, 'active', NULL, NULL),
(515, 114, 68, 241, 120, NULL, 'active', NULL, NULL),
(516, 115, 68, 241, 120, NULL, 'active', NULL, NULL),
(517, 116, 68, 241, 120, NULL, 'active', NULL, NULL),
(518, 117, 68, 241, 120, NULL, 'active', NULL, NULL),
(519, 118, 68, 241, 120, NULL, 'active', NULL, NULL),
(520, 109, 68, 241, 121, NULL, 'active', NULL, NULL),
(521, 110, 68, 241, 121, NULL, 'active', NULL, NULL),
(522, 111, 68, 241, 121, NULL, 'active', NULL, NULL),
(523, 112, 68, 241, 121, NULL, 'active', NULL, NULL),
(524, 113, 68, 241, 121, NULL, 'active', NULL, NULL),
(525, 114, 68, 241, 121, NULL, 'active', NULL, NULL),
(526, 115, 68, 241, 121, NULL, 'active', NULL, NULL),
(527, 116, 68, 241, 121, NULL, 'active', NULL, NULL),
(528, 117, 68, 241, 121, NULL, 'active', NULL, NULL),
(529, 118, 68, 241, 121, NULL, 'active', NULL, NULL),
(530, 119, 68, 242, 122, NULL, 'active', NULL, NULL),
(531, 120, 68, 242, 122, NULL, 'active', NULL, NULL),
(532, 121, 68, 242, 122, NULL, 'active', NULL, NULL),
(533, 122, 68, 242, 122, NULL, 'active', NULL, NULL),
(534, 123, 68, 242, 122, NULL, 'active', NULL, NULL),
(535, 124, 68, 242, 122, NULL, 'active', NULL, NULL),
(536, 125, 68, 242, 122, NULL, 'active', NULL, NULL),
(537, 126, 68, 242, 122, NULL, 'active', NULL, NULL),
(538, 127, 68, 242, 122, NULL, 'active', NULL, NULL),
(539, 128, 68, 242, 122, NULL, 'active', NULL, NULL),
(540, 119, 68, 243, 124, NULL, 'active', NULL, NULL),
(541, 120, 68, 243, 124, NULL, 'active', NULL, NULL),
(542, 121, 68, 243, 124, NULL, 'active', NULL, NULL),
(543, 122, 68, 243, 124, NULL, 'active', NULL, NULL),
(544, 123, 68, 243, 124, NULL, 'active', NULL, NULL),
(545, 124, 68, 243, 124, NULL, 'active', NULL, NULL),
(546, 125, 68, 243, 124, NULL, 'active', NULL, NULL),
(547, 126, 68, 243, 124, NULL, 'active', NULL, NULL),
(548, 127, 68, 243, 124, NULL, 'active', NULL, NULL),
(549, 128, 68, 243, 124, NULL, 'active', NULL, NULL),
(550, 119, 68, 241, 120, NULL, 'active', '2025-03-02 09:00:40', '2025-03-02 09:00:40'),
(551, 120, 68, 241, 120, NULL, 'active', '2025-03-02 09:00:40', '2025-03-02 09:00:40'),
(552, 122, 68, 241, 120, NULL, 'active', '2025-03-02 09:00:40', '2025-03-02 09:00:40'),
(553, 123, 68, 241, 120, NULL, 'active', '2025-03-02 09:00:40', '2025-03-02 09:00:40'),
(554, 124, 68, 241, 120, NULL, 'active', '2025-03-02 09:00:40', '2025-03-02 09:00:40'),
(555, 125, 68, 241, 120, NULL, 'active', '2025-03-02 09:00:40', '2025-03-02 09:00:40'),
(556, 128, 68, 241, 120, NULL, 'active', '2025-03-02 09:00:40', '2025-03-02 09:00:40'),
(557, 109, 70, 247, 126, 6, 'active', NULL, NULL),
(558, 110, 70, 247, 126, 6, 'active', NULL, NULL),
(559, 111, 70, 247, 126, 6, 'active', NULL, NULL),
(560, 112, 70, 247, 126, 6, 'active', NULL, NULL),
(561, 113, 70, 247, 126, 6, 'active', NULL, NULL),
(562, 114, 70, 247, 126, 6, 'active', NULL, NULL),
(563, 115, 70, 247, 126, 6, 'active', NULL, NULL),
(564, 116, 70, 247, 126, 6, 'active', NULL, NULL),
(565, 117, 70, 247, 126, 6, 'active', NULL, NULL),
(566, 118, 70, 247, 126, 6, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_attendances`
--

CREATE TABLE IF NOT EXISTS `beneficiary_attendances` (
  `id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `indicator_id` bigint(20) unsigned NOT NULL,
  `activity_id` bigint(20) unsigned NOT NULL,
  `admin_id` bigint(20) unsigned NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `longitude` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiary_attendances`
--

INSERT INTO `beneficiary_attendances` (`id`, `project_id`, `indicator_id`, `activity_id`, `admin_id`, `group_id`, `attendance_date`, `longitude`, `latitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 68, 241, 120, 1, NULL, '2025-02-25', NULL, NULL, 'active', '2025-03-02 08:33:45', '2025-03-02 08:33:45'),
(2, 68, 241, 120, 1, NULL, '2025-02-27', NULL, NULL, 'active', '2025-03-02 08:34:12', '2025-03-02 08:34:12'),
(3, 68, 241, 120, 1, NULL, '2025-03-01', NULL, NULL, 'active', '2025-03-02 08:34:31', '2025-03-02 08:34:31'),
(4, 68, 241, 120, 1, NULL, '2025-03-02', NULL, NULL, 'active', '2025-03-02 08:35:13', '2025-03-02 08:35:13'),
(5, 70, 247, 126, 1, 6, '2025-03-04', NULL, NULL, 'active', '2025-03-04 04:05:29', '2025-03-04 04:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_attendance_details`
--

CREATE TABLE IF NOT EXISTS `beneficiary_attendance_details` (
  `id` bigint(20) unsigned NOT NULL,
  `beneficiary_id` bigint(20) unsigned NOT NULL,
  `attendance` tinyint(4) DEFAULT '1',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `beneficiary_attendance_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiary_attendance_details`
--

INSERT INTO `beneficiary_attendance_details` (`id`, `beneficiary_id`, `attendance`, `sorting`, `status`, `created_at`, `updated_at`, `beneficiary_attendance_id`) VALUES
(1, 109, 0, 0, 'active', '2025-03-02 08:33:45', '2025-03-02 08:33:45', 1),
(2, 110, 0, 0, 'active', '2025-03-02 08:33:45', '2025-03-02 08:33:45', 1),
(3, 111, 0, 0, 'active', '2025-03-02 08:33:45', '2025-03-02 08:33:45', 1),
(4, 112, 1, 0, 'active', '2025-03-02 08:33:45', '2025-03-02 08:33:45', 1),
(5, 113, 1, 0, 'active', '2025-03-02 08:33:45', '2025-03-02 08:33:45', 1),
(6, 114, 1, 0, 'active', '2025-03-02 08:33:45', '2025-03-02 08:33:45', 1),
(7, 115, 1, 0, 'active', '2025-03-02 08:33:45', '2025-03-02 08:33:45', 1),
(8, 116, 1, 0, 'active', '2025-03-02 08:33:45', '2025-03-02 08:33:45', 1),
(9, 117, 1, 0, 'active', '2025-03-02 08:33:45', '2025-03-02 08:33:45', 1),
(10, 118, 1, 0, 'active', '2025-03-02 08:33:45', '2025-03-02 08:33:45', 1),
(11, 109, 0, 0, 'active', '2025-03-02 08:34:12', '2025-03-02 08:34:12', 2),
(12, 110, 0, 0, 'active', '2025-03-02 08:34:12', '2025-03-02 08:34:12', 2),
(13, 111, 1, 0, 'active', '2025-03-02 08:34:12', '2025-03-02 08:34:12', 2),
(14, 112, 1, 0, 'active', '2025-03-02 08:34:12', '2025-03-02 08:34:12', 2),
(15, 113, 1, 0, 'active', '2025-03-02 08:34:12', '2025-03-02 08:34:12', 2),
(16, 114, 1, 0, 'active', '2025-03-02 08:34:12', '2025-03-02 08:34:12', 2),
(17, 115, 1, 0, 'active', '2025-03-02 08:34:12', '2025-03-02 08:34:12', 2),
(18, 116, 0, 0, 'active', '2025-03-02 08:34:12', '2025-03-02 08:34:12', 2),
(19, 117, 0, 0, 'active', '2025-03-02 08:34:12', '2025-03-02 08:34:12', 2),
(20, 118, 0, 0, 'active', '2025-03-02 08:34:12', '2025-03-02 08:34:12', 2),
(21, 109, 1, 0, 'active', '2025-03-02 08:34:31', '2025-03-04 21:21:15', 3),
(22, 110, 0, 0, 'active', '2025-03-02 08:34:31', '2025-03-04 21:21:20', 3),
(23, 111, 1, 0, 'active', '2025-03-02 08:34:31', '2025-03-02 08:34:31', 3),
(24, 112, 1, 0, 'active', '2025-03-02 08:34:31', '2025-03-02 08:34:31', 3),
(25, 113, 1, 0, 'active', '2025-03-02 08:34:31', '2025-03-02 08:34:31', 3),
(26, 114, 1, 0, 'active', '2025-03-02 08:34:31', '2025-03-02 08:34:31', 3),
(27, 115, 0, 0, 'active', '2025-03-02 08:34:31', '2025-03-04 21:19:39', 3),
(28, 116, 1, 0, 'active', '2025-03-02 08:34:31', '2025-03-02 08:34:31', 3),
(29, 117, 1, 0, 'active', '2025-03-02 08:34:31', '2025-03-02 08:34:31', 3),
(30, 118, 1, 0, 'active', '2025-03-02 08:34:31', '2025-03-02 08:34:31', 3),
(31, 109, 1, 0, 'active', '2025-03-02 08:35:13', '2025-03-02 08:35:13', 4),
(32, 110, 0, 0, 'active', '2025-03-02 08:35:13', '2025-03-11 19:58:26', 4),
(33, 111, 1, 0, 'active', '2025-03-02 08:35:13', '2025-03-02 08:35:13', 4),
(34, 112, 0, 0, 'active', '2025-03-02 08:35:13', '2025-03-11 19:58:26', 4),
(35, 113, 0, 0, 'active', '2025-03-02 08:35:13', '2025-03-12 14:14:34', 4),
(36, 114, 1, 0, 'active', '2025-03-02 08:35:13', '2025-03-02 08:35:13', 4),
(37, 115, 0, 0, 'active', '2025-03-02 08:35:13', '2025-03-12 14:14:34', 4),
(38, 116, 0, 0, 'active', '2025-03-02 08:35:13', '2025-03-12 14:14:34', 4),
(39, 117, 1, 0, 'active', '2025-03-02 08:35:13', '2025-03-02 08:35:13', 4),
(40, 118, 1, 0, 'active', '2025-03-02 08:35:13', '2025-03-02 08:35:13', 4),
(41, 109, 1, 0, 'active', '2025-03-04 04:05:29', '2025-03-04 04:05:29', 5),
(42, 110, 1, 0, 'active', '2025-03-04 04:05:29', '2025-03-11 16:46:39', 5),
(43, 111, 1, 0, 'active', '2025-03-04 04:05:29', '2025-03-11 16:46:48', 5),
(44, 112, 1, 0, 'active', '2025-03-04 04:05:29', '2025-03-11 16:46:48', 5),
(45, 113, 1, 0, 'active', '2025-03-04 04:05:29', '2025-03-11 16:46:39', 5),
(46, 114, 1, 0, 'active', '2025-03-04 04:05:29', '2025-03-04 04:05:29', 5),
(47, 115, 1, 0, 'active', '2025-03-04 04:05:29', '2025-03-04 04:05:29', 5),
(48, 116, 1, 0, 'active', '2025-03-04 04:05:29', '2025-03-04 21:40:02', 5),
(49, 117, 1, 0, 'active', '2025-03-04 04:05:29', '2025-03-04 04:05:29', 5),
(50, 118, 1, 0, 'active', '2025-03-04 04:05:29', '2025-03-04 21:40:02', 5);

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_diseases`
--

CREATE TABLE IF NOT EXISTS `beneficiary_diseases` (
  `id` bigint(20) unsigned NOT NULL,
  `beneficiary_id` bigint(20) unsigned DEFAULT NULL,
  `disease_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affected_date` text COLLATE utf8mb4_unicode_ci,
  `recovery_date` text COLLATE utf8mb4_unicode_ci,
  `is_continue` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_infectious` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `how_to_affected` text COLLATE utf8mb4_unicode_ci,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_education`
--

CREATE TABLE IF NOT EXISTS `beneficiary_education` (
  `id` bigint(20) unsigned NOT NULL,
  `beneficiary_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_id` bigint(20) unsigned DEFAULT NULL,
  `board` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institute` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiary_education`
--

INSERT INTO `beneficiary_education` (`id`, `beneficiary_id`, `title`, `level`, `exam_id`, `board`, `institute`, `result`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(3, 136, NULL, NULL, 4, 'Gj', 'Gg', 'Fi', 0, 'active', '2025-03-06 00:03:55', '2025-03-06 00:03:55'),
(4, 136, NULL, NULL, 4, 'Df', '', '', 0, 'active', '2025-03-06 00:03:55', '2025-03-06 00:03:55'),
(5, 137, NULL, NULL, 4, 'Hsc', 'Uhhh', 'ggg', 0, 'active', '2025-03-06 06:04:39', '2025-03-06 06:04:39'),
(6, 137, NULL, NULL, 4, 'tygg', 'thg', 'ghy', 0, 'active', '2025-03-06 06:04:39', '2025-03-06 06:04:39'),
(9, 139, NULL, NULL, 4, '', '', '', 0, 'active', '2025-03-11 14:00:29', '2025-03-11 14:00:29'),
(10, 138, NULL, NULL, 4, 'Tyg', 'Try gh', 'Tt', 0, 'active', '2025-03-11 15:12:17', '2025-03-11 15:12:17');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_family_members`
--

CREATE TABLE IF NOT EXISTS `beneficiary_family_members` (
  `id` bigint(20) unsigned NOT NULL,
  `beneficiary_id` bigint(20) unsigned NOT NULL,
  `relation_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `family_date_of_birth` date DEFAULT NULL,
  `family_nid` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','others') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_education_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `earn` bigint(20) DEFAULT NULL,
  `ocupation_id` bigint(20) unsigned DEFAULT NULL,
  `yearly_income` decimal(12,2) NOT NULL,
  `is_student` int(11) DEFAULT NULL,
  `goes_to_school` int(11) DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiary_family_members`
--

INSERT INTO `beneficiary_family_members` (`id`, `beneficiary_id`, `relation_id`, `title`, `name`, `family_date_of_birth`, `family_nid`, `gender`, `marital_status`, `last_education_info`, `earn`, `ocupation_id`, `yearly_income`, `is_student`, `goes_to_school`, `remarks`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 136, 3, NULL, 'Ff D', NULL, '55', 'male', 'married', 'Ch', 68, NULL, '56.00', 1, 1, 'Xv', 0, 'active', '2025-03-06 00:04:38', '2025-03-06 00:04:38'),
(2, 138, 2, NULL, 'Rrgb', NULL, '655', 'female', 'married', 'Fgg', 2555, NULL, '566.00', 0, 0, 'Dsdf', 0, 'active', '2025-03-11 15:17:28', '2025-03-11 15:22:33');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_healths`
--

CREATE TABLE IF NOT EXISTS `beneficiary_healths` (
  `id` bigint(20) unsigned NOT NULL,
  `beneficiary_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `physical_condition` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disease_id` int(11) DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiary_healths`
--

INSERT INTO `beneficiary_healths` (`id`, `beneficiary_id`, `title`, `height`, `weight`, `physical_condition`, `disease_id`, `remarks`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(179, 109, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', '2025-02-23 06:34:24', '2025-02-23 06:34:24'),
(180, 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', '2025-02-23 08:58:55', '2025-02-23 08:58:55'),
(181, 111, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'active', '2025-02-25 09:44:55', '2025-02-25 09:44:55'),
(182, 137, NULL, 5, 58, 'g', 18, '', 0, 'active', '2025-03-06 06:33:03', '2025-03-06 06:33:03'),
(184, 138, NULL, 9, 499, 'fit', 18, '', 0, 'active', '2025-03-11 15:06:07', '2025-03-11 15:06:07'),
(185, 139, NULL, 10, 80, 'unfit', 18, 'Fgg', 0, 'active', '2025-03-11 19:55:13', '2025-03-11 19:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_liabilites`
--

CREATE TABLE IF NOT EXISTS `beneficiary_liabilites` (
  `id` bigint(20) unsigned NOT NULL,
  `beneficiary_id` bigint(20) unsigned DEFAULT NULL,
  `liability_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mortgage_asset` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `loan_from` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` text COLLATE utf8mb4_unicode_ci,
  `end_date` text COLLATE utf8mb4_unicode_ci,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiary_liabilites`
--

INSERT INTO `beneficiary_liabilites` (`id`, `beneficiary_id`, `liability_id`, `title`, `source`, `mortgage_asset`, `amount`, `loan_from`, `start_date`, `end_date`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 137, 4, NULL, NULL, 'fhg', 58, 'fhg', '2025-03-06', '2025-03-06', 0, 'active', '2025-03-06 06:37:10', '2025-03-06 07:38:29'),
(2, 138, 4, NULL, NULL, 'Good CB', 55, 'Vjg', '2025-03-01', '2025-03-31', 0, 'active', '2025-03-11 15:29:42', '2025-03-11 15:30:58');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_occupations`
--

CREATE TABLE IF NOT EXISTS `beneficiary_occupations` (
  `id` bigint(20) unsigned NOT NULL,
  `beneficiary_id` bigint(20) unsigned NOT NULL,
  `occupation_id` bigint(20) unsigned NOT NULL,
  `is_primary` tinyint(3) NOT NULL,
  `working_hour` int(11) DEFAULT NULL,
  `occupation_risk` text COLLATE utf8mb4_unicode_ci,
  `work_location` text COLLATE utf8mb4_unicode_ci,
  `monthly_income` decimal(12,2) NOT NULL,
  `past_year_income` decimal(12,2) NOT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiary_occupations`
--

INSERT INTO `beneficiary_occupations` (`id`, `beneficiary_id`, `occupation_id`, `is_primary`, `working_hour`, `occupation_risk`, `work_location`, `monthly_income`, `past_year_income`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 136, 6, 1, 55, 'tabs', 'Ff', '55.00', '65.00', 0, 'active', '2025-03-05 22:30:52', '2025-03-05 22:30:52'),
(3, 138, 7, 1, 58, 'Fg', 'Fv', '55.00', '3366.00', 0, 'active', '2025-03-12 14:13:43', '2025-03-12 14:13:43');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_wealths`
--

CREATE TABLE IF NOT EXISTS `beneficiary_wealths` (
  `id` bigint(20) unsigned NOT NULL,
  `beneficiary_id` bigint(20) unsigned DEFAULT NULL,
  `wealth_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sourch_of_ownership` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `ownership_year` int(11) DEFAULT NULL,
  `present_value` decimal(12,2) NOT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiary_wealths`
--

INSERT INTO `beneficiary_wealths` (`id`, `beneficiary_id`, `wealth_id`, `title`, `condition`, `sourch_of_ownership`, `qty`, `description`, `ownership_year`, `present_value`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 138, 2, NULL, NULL, '1', 558, 'Fg', 55, '88.00', 0, 'active', '2025-03-11 15:27:42', '2025-03-11 15:27:42');

-- --------------------------------------------------------

--
-- Table structure for table `benificiary_assets`
--

CREATE TABLE IF NOT EXISTS `benificiary_assets` (
  `id` bigint(20) unsigned NOT NULL,
  `beneficiary_id` bigint(20) unsigned DEFAULT NULL,
  `asset_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sourch_of_ownership` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `ownership_year` int(11) DEFAULT NULL,
  `present_value` decimal(12,2) DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `benificiary_assets`
--

INSERT INTO `benificiary_assets` (`id`, `beneficiary_id`, `asset_id`, `title`, `condition`, `sourch_of_ownership`, `qty`, `description`, `ownership_year`, `present_value`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 137, 4, NULL, NULL, '1', 55, 'fgh', 556, '5688.00', 0, 'active', '2025-03-06 06:37:44', '2025-03-06 06:37:44'),
(2, 138, 4, NULL, NULL, '1', 56, 'So go', 5632, '588.00', 0, 'active', '2025-03-11 15:11:40', '2025-03-11 15:11:40');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `module_name`, `title`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Events', 'Event', 14, 'active', NULL, '2024-10-10 03:36:12'),
(2, 'News', 'News', 2, 'active', NULL, '2024-08-21 06:41:08'),
(3, 'Notice', 'Notice', 39, 'active', NULL, '2024-10-10 03:38:27'),
(4, 'Notice', 'new updated', 4, 'active', '2024-08-18 04:30:56', '2024-08-18 04:31:09'),
(5, 'News', 'ttt ed2', 5, 'deactive', '2024-08-18 04:33:29', '2024-10-10 03:43:09'),
(6, 'Notice', 'fdfd', 5, 'active', '2024-08-18 04:34:38', '2024-08-21 06:40:56'),
(9, 'Events', 'tttt', 8, 'active', '2024-08-21 00:42:12', '2024-08-25 04:46:54'),
(10, 'Events', 'dfdfd', 8, 'active', '2024-08-25 22:02:38', '2024-08-25 22:02:38'),
(11, 'News', 'dfd fdfd', 9, 'active', '2024-08-25 22:02:44', '2024-08-25 22:02:54'),
(12, 'Notice', 'dffdfdfd', 10, 'active', '2024-08-25 22:26:18', '2024-08-25 22:26:18'),
(13, 'Notice', 'my title', 11, 'active', '2024-08-25 22:27:35', '2024-08-26 23:05:26'),
(14, 'Notice', 'dfdfdfdf', 13, 'active', '2024-09-15 04:42:30', '2024-10-10 03:36:44');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint(20) unsigned NOT NULL,
  `iso` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(11) NOT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `name`, `iso3`, `numcode`, `phonecode`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 'AFG', 4, 93, 0, 'active', NULL, NULL),
(2, 'AL', 'Albania', 'ALB', 8, 355, 0, 'active', NULL, NULL),
(3, 'DZ', 'Algeria', 'DZA', 12, 213, 0, 'active', NULL, NULL),
(4, 'AS', 'American Samoa', 'ASM', 16, 1684, 0, 'active', NULL, NULL),
(5, 'AD', 'Andorra', 'AND', 20, 376, 0, 'active', NULL, NULL),
(6, 'AO', 'Angola', 'AGO', 24, 244, 0, 'active', NULL, NULL),
(7, 'AI', 'Anguilla', 'AIA', 660, 1264, 0, 'active', NULL, NULL),
(8, 'AQ', 'Antarctica', NULL, NULL, 0, 0, 'active', NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', 'ATG', 28, 1268, 0, 'active', NULL, NULL),
(10, 'AR', 'Argentina', 'ARG', 32, 54, 0, 'active', NULL, NULL),
(11, 'AM', 'Armenia', 'ARM', 51, 374, 0, 'active', NULL, NULL),
(12, 'AW', 'Aruba', 'ABW', 533, 297, 0, 'active', NULL, NULL),
(13, 'AU', 'Australia', 'AUS', 36, 61, 0, 'active', NULL, NULL),
(14, 'AT', 'Austria', 'AUT', 40, 43, 0, 'active', NULL, NULL),
(15, 'AZ', 'Azerbaijan', 'AZE', 31, 994, 0, 'active', NULL, NULL),
(16, 'BS', 'Bahamas', 'BHS', 44, 1242, 0, 'active', NULL, NULL),
(17, 'BH', 'Bahrain', 'BHR', 48, 973, 0, 'active', NULL, NULL),
(18, 'BD', 'Bangladesh', 'BGD', 50, 880, 0, 'active', NULL, NULL),
(19, 'BB', 'Barbados', 'BRB', 52, 1246, 0, 'active', NULL, NULL),
(20, 'BY', 'Belarus', 'BLR', 112, 375, 0, 'active', NULL, NULL),
(21, 'BE', 'Belgium', 'BEL', 56, 32, 0, 'active', NULL, NULL),
(22, 'BZ', 'Belize', 'BLZ', 84, 501, 0, 'active', NULL, NULL),
(23, 'BJ', 'Benin', 'BEN', 204, 229, 0, 'active', NULL, NULL),
(24, 'BM', 'Bermuda', 'BMU', 60, 1441, 0, 'active', NULL, NULL),
(25, 'BT', 'Bhutan', 'BTN', 64, 975, 0, 'active', NULL, NULL),
(26, 'BO', 'Bolivia', 'BOL', 68, 591, 0, 'active', NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', 'BIH', 70, 387, 0, 'active', NULL, NULL),
(28, 'BW', 'Botswana', 'BWA', 72, 267, 0, 'active', NULL, NULL),
(29, 'BV', 'Bouvet Island', NULL, NULL, 0, 0, 'active', NULL, NULL),
(30, 'BR', 'Brazil', 'BRA', 76, 55, 0, 'active', NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', NULL, NULL, 246, 0, 'active', NULL, NULL),
(32, 'BN', 'Brunei Darussalam', 'BRN', 96, 673, 0, 'active', NULL, NULL),
(33, 'BG', 'Bulgaria', 'BGR', 100, 359, 0, 'active', NULL, NULL),
(34, 'BF', 'Burkina Faso', 'BFA', 854, 226, 0, 'active', NULL, NULL),
(35, 'BI', 'Burundi', 'BDI', 108, 257, 0, 'active', NULL, NULL),
(36, 'KH', 'Cambodia', 'KHM', 116, 855, 0, 'active', NULL, NULL),
(37, 'CM', 'Cameroon', 'CMR', 120, 237, 0, 'active', NULL, NULL),
(38, 'CA', 'Canada', 'CAN', 124, 1, 0, 'active', NULL, NULL),
(39, 'CV', 'Cape Verde', 'CPV', 132, 238, 0, 'active', NULL, NULL),
(40, 'KY', 'Cayman Islands', 'CYM', 136, 1345, 0, 'active', NULL, NULL),
(41, 'CF', 'Central African Republic', 'CAF', 140, 236, 0, 'active', NULL, NULL),
(42, 'TD', 'Chad', 'TCD', 148, 235, 0, 'active', NULL, NULL),
(43, 'CL', 'Chile', 'CHL', 152, 56, 0, 'active', NULL, NULL),
(44, 'CN', 'China', 'CHN', 156, 86, 0, 'active', NULL, NULL),
(45, 'CX', 'Christmas Island', NULL, NULL, 61, 0, 'active', NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', NULL, NULL, 672, 0, 'active', NULL, NULL),
(47, 'CO', 'Colombia', 'COL', 170, 57, 0, 'active', NULL, NULL),
(48, 'KM', 'Comoros', 'COM', 174, 269, 0, 'active', NULL, NULL),
(49, 'CG', 'Congo', 'COG', 178, 242, 0, 'active', NULL, NULL),
(50, 'CD', 'Congo, the Democratic Republic of the', 'COD', 180, 242, 0, 'active', NULL, NULL),
(51, 'CK', 'Cook Islands', 'COK', 184, 682, 0, 'active', NULL, NULL),
(52, 'CR', 'Costa Rica', 'CRI', 188, 506, 0, 'active', NULL, NULL),
(53, 'CI', 'Cote D''Ivoire', 'CIV', 384, 225, 0, 'active', NULL, NULL),
(54, 'HR', 'Croatia', 'HRV', 191, 385, 0, 'active', NULL, NULL),
(55, 'CU', 'Cuba', 'CUB', 192, 53, 0, 'active', NULL, NULL),
(56, 'CY', 'Cyprus', 'CYP', 196, 357, 0, 'active', NULL, NULL),
(57, 'CZ', 'Czech Republic', 'CZE', 203, 420, 0, 'active', NULL, NULL),
(58, 'DK', 'Denmark', 'DNK', 208, 45, 0, 'active', NULL, NULL),
(59, 'DJ', 'Djibouti', 'DJI', 262, 253, 0, 'active', NULL, NULL),
(60, 'DM', 'Dominica', 'DMA', 212, 1767, 0, 'active', NULL, NULL),
(61, 'DO', 'Dominican Republic', 'DOM', 214, 1809, 0, 'active', NULL, NULL),
(62, 'EC', 'Ecuador', 'ECU', 218, 593, 0, 'active', NULL, NULL),
(63, 'EG', 'Egypt', 'EGY', 818, 20, 0, 'active', NULL, NULL),
(64, 'SV', 'El Salvador', 'SLV', 222, 503, 0, 'active', NULL, NULL),
(65, 'GQ', 'Equatorial Guinea', 'GNQ', 226, 240, 0, 'active', NULL, NULL),
(66, 'ER', 'Eritrea', 'ERI', 232, 291, 0, 'active', NULL, NULL),
(67, 'EE', 'Estonia', 'EST', 233, 372, 0, 'active', NULL, NULL),
(68, 'ET', 'Ethiopia', 'ETH', 231, 251, 0, 'active', NULL, NULL),
(69, 'FK', 'Falkland Islands (Malvinas)', 'FLK', 238, 500, 0, 'active', NULL, NULL),
(70, 'FO', 'Faroe Islands', 'FRO', 234, 298, 0, 'active', NULL, NULL),
(71, 'FJ', 'Fiji', 'FJI', 242, 679, 0, 'active', NULL, NULL),
(72, 'FI', 'Finland', 'FIN', 246, 358, 0, 'active', NULL, NULL),
(73, 'FR', 'France', 'FRA', 250, 33, 0, 'active', NULL, NULL),
(74, 'GF', 'French Guiana', 'GUF', 254, 594, 0, 'active', NULL, NULL),
(75, 'PF', 'French Polynesia', 'PYF', 258, 689, 0, 'active', NULL, NULL),
(76, 'TF', 'French Southern Territories', NULL, NULL, 0, 0, 'active', NULL, NULL),
(77, 'GA', 'Gabon', 'GAB', 266, 241, 0, 'active', NULL, NULL),
(78, 'GM', 'Gambia', 'GMB', 270, 220, 0, 'active', NULL, NULL),
(79, 'GE', 'Georgia', 'GEO', 268, 995, 0, 'active', NULL, NULL),
(80, 'DE', 'Germany', 'DEU', 276, 49, 0, 'active', NULL, NULL),
(81, 'GH', 'Ghana', 'GHA', 288, 233, 0, 'active', NULL, NULL),
(82, 'GI', 'Gibraltar', 'GIB', 292, 350, 0, 'active', NULL, NULL),
(83, 'GR', 'Greece', 'GRC', 300, 30, 0, 'active', NULL, NULL),
(84, 'GL', 'Greenland', 'GRL', 304, 299, 0, 'active', NULL, NULL),
(85, 'GD', 'Grenada', 'GRD', 308, 1473, 0, 'active', NULL, NULL),
(86, 'GP', 'Guadeloupe', 'GLP', 312, 590, 0, 'active', NULL, NULL),
(87, 'GU', 'Guam', 'GUM', 316, 1671, 0, 'active', NULL, NULL),
(88, 'GT', 'Guatemala', 'GTM', 320, 502, 0, 'active', NULL, NULL),
(89, 'GN', 'Guinea', 'GIN', 324, 224, 0, 'active', NULL, NULL),
(90, 'GW', 'Guinea-Bissau', 'GNB', 624, 245, 0, 'active', NULL, NULL),
(91, 'GY', 'Guyana', 'GUY', 328, 592, 0, 'active', NULL, NULL),
(92, 'HT', 'Haiti', 'HTI', 332, 509, 0, 'active', NULL, NULL),
(93, 'HM', 'Heard Island and Mcdonald Islands', NULL, NULL, 0, 0, 'active', NULL, NULL),
(94, 'VA', 'Holy See (Vatican City State)', 'VAT', 336, 39, 0, 'active', NULL, NULL),
(95, 'HN', 'Honduras', 'HND', 340, 504, 0, 'active', NULL, NULL),
(96, 'HK', 'Hong Kong', 'HKG', 344, 852, 0, 'active', NULL, NULL),
(97, 'HU', 'Hungary', 'HUN', 348, 36, 0, 'active', NULL, NULL),
(98, 'IS', 'Iceland', 'ISL', 352, 354, 0, 'active', NULL, NULL),
(99, 'IN', 'India', 'IND', 356, 91, 0, 'active', NULL, NULL),
(100, 'ID', 'Indonesia', 'IDN', 360, 62, 0, 'active', NULL, NULL),
(101, 'IR', 'Iran, Islamic Republic of', 'IRN', 364, 98, 0, 'active', NULL, NULL),
(102, 'IQ', 'Iraq', 'IRQ', 368, 964, 0, 'active', NULL, NULL),
(103, 'IE', 'Ireland', 'IRL', 372, 353, 0, 'active', NULL, NULL),
(104, 'IL', 'Israel', 'ISR', 376, 972, 0, 'active', NULL, NULL),
(105, 'IT', 'Italy', 'ITA', 380, 39, 0, 'active', NULL, NULL),
(106, 'JM', 'Jamaica', 'JAM', 388, 1876, 0, 'active', NULL, NULL),
(107, 'JP', 'Japan', 'JPN', 392, 81, 0, 'active', NULL, NULL),
(108, 'JO', 'Jordan', 'JOR', 400, 962, 0, 'active', NULL, NULL),
(109, 'KZ', 'Kazakhstan', 'KAZ', 398, 7, 0, 'active', NULL, NULL),
(110, 'KE', 'Kenya', 'KEN', 404, 254, 0, 'active', NULL, NULL),
(111, 'KI', 'Kiribati', 'KIR', 296, 686, 0, 'active', NULL, NULL),
(112, 'KP', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850, 0, 'active', NULL, NULL),
(113, 'KR', 'Korea, Republic of', 'KOR', 410, 82, 0, 'active', NULL, NULL),
(114, 'KW', 'Kuwait', 'KWT', 414, 965, 0, 'active', NULL, NULL),
(115, 'KG', 'Kyrgyzstan', 'KGZ', 417, 996, 0, 'active', NULL, NULL),
(116, 'LA', 'Lao People''s Democratic Republic', 'LAO', 418, 856, 0, 'active', NULL, NULL),
(117, 'LV', 'Latvia', 'LVA', 428, 371, 0, 'active', NULL, NULL),
(118, 'LB', 'Lebanon', 'LBN', 422, 961, 0, 'active', NULL, NULL),
(119, 'LS', 'Lesotho', 'LSO', 426, 266, 0, 'active', NULL, NULL),
(120, 'LR', 'Liberia', 'LBR', 430, 231, 0, 'active', NULL, NULL),
(121, 'LY', 'Libyan Arab Jamahiriya', 'LBY', 434, 218, 0, 'active', NULL, NULL),
(122, 'LI', 'Liechtenstein', 'LIE', 438, 423, 0, 'active', NULL, NULL),
(123, 'LT', 'Lithuania', 'LTU', 440, 370, 0, 'active', NULL, NULL),
(124, 'LU', 'Luxembourg', 'LUX', 442, 352, 0, 'active', NULL, NULL),
(125, 'MO', 'Macao', 'MAC', 446, 853, 0, 'active', NULL, NULL),
(126, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389, 0, 'active', NULL, NULL),
(127, 'MG', 'Madagascar', 'MDG', 450, 261, 0, 'active', NULL, NULL),
(128, 'MW', 'Malawi', 'MWI', 454, 265, 0, 'active', NULL, NULL),
(129, 'MY', 'Malaysia', 'MYS', 458, 60, 0, 'active', NULL, NULL),
(130, 'MV', 'Maldives', 'MDV', 462, 960, 0, 'active', NULL, NULL),
(131, 'ML', 'Mali', 'MLI', 466, 223, 0, 'active', NULL, NULL),
(132, 'MT', 'Malta', 'MLT', 470, 356, 0, 'active', NULL, NULL),
(133, 'MH', 'Marshall Islands', 'MHL', 584, 692, 0, 'active', NULL, NULL),
(134, 'MQ', 'Martinique', 'MTQ', 474, 596, 0, 'active', NULL, NULL),
(135, 'MR', 'Mauritania', 'MRT', 478, 222, 0, 'active', NULL, NULL),
(136, 'MU', 'Mauritius', 'MUS', 480, 230, 0, 'active', NULL, NULL),
(137, 'YT', 'Mayotte', NULL, NULL, 269, 0, 'active', NULL, NULL),
(138, 'MX', 'Mexico', 'MEX', 484, 52, 0, 'active', NULL, NULL),
(139, 'FM', 'Micronesia, Federated States of', 'FSM', 583, 691, 0, 'active', NULL, NULL),
(140, 'MD', 'Moldova, Republic of', 'MDA', 498, 373, 0, 'active', NULL, NULL),
(141, 'MC', 'Monaco', 'MCO', 492, 377, 0, 'active', NULL, NULL),
(142, 'MN', 'Mongolia', 'MNG', 496, 976, 0, 'active', NULL, NULL),
(143, 'MS', 'Montserrat', 'MSR', 500, 1664, 0, 'active', NULL, NULL),
(144, 'MA', 'Morocco', 'MAR', 504, 212, 0, 'active', NULL, NULL),
(145, 'MZ', 'Mozambique', 'MOZ', 508, 258, 0, 'active', NULL, NULL),
(146, 'MM', 'Myanmar', 'MMR', 104, 95, 0, 'active', NULL, NULL),
(147, 'NA', 'Namibia', 'NAM', 516, 264, 0, 'active', NULL, NULL),
(148, 'NR', 'Nauru', 'NRU', 520, 674, 0, 'active', NULL, NULL),
(149, 'NP', 'Nepal', 'NPL', 524, 977, 0, 'active', NULL, NULL),
(150, 'NL', 'Netherlands', 'NLD', 528, 31, 0, 'active', NULL, NULL),
(151, 'AN', 'Netherlands Antilles', 'ANT', 530, 599, 0, 'active', NULL, NULL),
(152, 'NC', 'New Caledonia', 'NCL', 540, 687, 0, 'active', NULL, NULL),
(153, 'NZ', 'New Zealand', 'NZL', 554, 64, 0, 'active', NULL, NULL),
(154, 'NI', 'Nicaragua', 'NIC', 558, 505, 0, 'active', NULL, NULL),
(155, 'NE', 'Niger', 'NER', 562, 227, 0, 'active', NULL, NULL),
(156, 'NG', 'Nigeria', 'NGA', 566, 234, 0, 'active', NULL, NULL),
(157, 'NU', 'Niue', 'NIU', 570, 683, 0, 'active', NULL, NULL),
(158, 'NF', 'Norfolk Island', 'NFK', 574, 672, 0, 'active', NULL, NULL),
(159, 'MP', 'Northern Mariana Islands', 'MNP', 580, 1670, 0, 'active', NULL, NULL),
(160, 'NO', 'Norway', 'NOR', 578, 47, 0, 'active', NULL, NULL),
(161, 'OM', 'Oman', 'OMN', 512, 968, 0, 'active', NULL, NULL),
(162, 'PK', 'Pakistan', 'PAK', 586, 92, 0, 'active', NULL, NULL),
(163, 'PW', 'Palau', 'PLW', 585, 680, 0, 'active', NULL, NULL),
(164, 'PS', 'Palestinian Territory, Occupied', NULL, NULL, 970, 0, 'active', NULL, NULL),
(165, 'PA', 'Panama', 'PAN', 591, 507, 0, 'active', NULL, NULL),
(166, 'PG', 'Papua New Guinea', 'PNG', 598, 675, 0, 'active', NULL, NULL),
(167, 'PY', 'Paraguay', 'PRY', 600, 595, 0, 'active', NULL, NULL),
(168, 'PE', 'Peru', 'PER', 604, 51, 0, 'active', NULL, NULL),
(169, 'PH', 'Philippines', 'PHL', 608, 63, 0, 'active', NULL, NULL),
(170, 'PN', 'Pitcairn', 'PCN', 612, 0, 0, 'active', NULL, NULL),
(171, 'PL', 'Poland', 'POL', 616, 48, 0, 'active', NULL, NULL),
(172, 'PT', 'Portugal', 'PRT', 620, 351, 0, 'active', NULL, NULL),
(173, 'PR', 'Puerto Rico', 'PRI', 630, 1787, 0, 'active', NULL, NULL),
(174, 'QA', 'Qatar', 'QAT', 634, 974, 0, 'active', NULL, NULL),
(175, 'RE', 'Reunion', 'REU', 638, 262, 0, 'active', NULL, NULL),
(176, 'RO', 'Romania', 'ROM', 642, 40, 0, 'active', NULL, NULL),
(177, 'RU', 'Russian Federation', 'RUS', 643, 70, 0, 'active', NULL, NULL),
(178, 'RW', 'Rwanda', 'RWA', 646, 250, 0, 'active', NULL, NULL),
(179, 'SH', 'Saint Helena', 'SHN', 654, 290, 0, 'active', NULL, NULL),
(180, 'KN', 'Saint Kitts and Nevis', 'KNA', 659, 1869, 0, 'active', NULL, NULL),
(181, 'LC', 'Saint Lucia', 'LCA', 662, 1758, 0, 'active', NULL, NULL),
(182, 'PM', 'Saint Pierre and Miquelon', 'SPM', 666, 508, 0, 'active', NULL, NULL),
(183, 'VC', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784, 0, 'active', NULL, NULL),
(184, 'WS', 'Samoa', 'WSM', 882, 684, 0, 'active', NULL, NULL),
(185, 'SM', 'San Marino', 'SMR', 674, 378, 0, 'active', NULL, NULL),
(186, 'ST', 'Sao Tome and Principe', 'STP', 678, 239, 0, 'active', NULL, NULL),
(187, 'SA', 'Saudi Arabia', 'SAU', 682, 966, 0, 'active', NULL, NULL),
(188, 'SN', 'Senegal', 'SEN', 686, 221, 0, 'active', NULL, NULL),
(189, 'CS', 'Serbia and Montenegro', NULL, NULL, 381, 0, 'active', NULL, NULL),
(190, 'SC', 'Seychelles', 'SYC', 690, 248, 0, 'active', NULL, NULL),
(191, 'SL', 'Sierra Leone', 'SLE', 694, 232, 0, 'active', NULL, NULL),
(192, 'SG', 'Singapore', 'SGP', 702, 65, 0, 'active', NULL, NULL),
(193, 'SK', 'Slovakia', 'SVK', 703, 421, 0, 'active', NULL, NULL),
(194, 'SI', 'Slovenia', 'SVN', 705, 386, 0, 'active', NULL, NULL),
(195, 'SB', 'Solomon Islands', 'SLB', 90, 677, 0, 'active', NULL, NULL),
(196, 'SO', 'Somalia', 'SOM', 706, 252, 0, 'active', NULL, NULL),
(197, 'ZA', 'South Africa', 'ZAF', 710, 27, 0, 'active', NULL, NULL),
(198, 'GS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0, 0, 'active', NULL, NULL),
(199, 'ES', 'Spain', 'ESP', 724, 34, 0, 'active', NULL, NULL),
(200, 'LK', 'Sri Lanka', 'LKA', 144, 94, 0, 'active', NULL, NULL),
(201, 'SD', 'Sudan', 'SDN', 736, 249, 0, 'active', NULL, NULL),
(202, 'SR', 'Suriname', 'SUR', 740, 597, 0, 'active', NULL, NULL),
(203, 'SJ', 'Svalbard and Jan Mayen', 'SJM', 744, 47, 0, 'active', NULL, NULL),
(204, 'SZ', 'Swaziland', 'SWZ', 748, 268, 0, 'active', NULL, NULL),
(205, 'SE', 'Sweden', 'SWE', 752, 46, 0, 'active', NULL, NULL),
(206, 'CH', 'Switzerland', 'CHE', 756, 41, 0, 'active', NULL, NULL),
(207, 'SY', 'Syrian Arab Republic', 'SYR', 760, 963, 0, 'active', NULL, NULL),
(208, 'TW', 'Taiwan, Province of China', 'TWN', 158, 886, 0, 'active', NULL, NULL),
(209, 'TJ', 'Tajikistan', 'TJK', 762, 992, 0, 'active', NULL, NULL),
(210, 'TZ', 'Tanzania, United Republic of', 'TZA', 834, 255, 0, 'active', NULL, NULL),
(211, 'TH', 'Thailand', 'THA', 764, 66, 0, 'active', NULL, NULL),
(212, 'TL', 'Timor-Leste', NULL, NULL, 670, 0, 'active', NULL, NULL),
(213, 'TG', 'Togo', 'TGO', 768, 228, 0, 'active', NULL, NULL),
(214, 'TK', 'Tokelau', 'TKL', 772, 690, 0, 'active', NULL, NULL),
(215, 'TO', 'Tonga', 'TON', 776, 676, 0, 'active', NULL, NULL),
(216, 'TT', 'Trinidad and Tobago', 'TTO', 780, 1868, 0, 'active', NULL, NULL),
(217, 'TN', 'Tunisia', 'TUN', 788, 216, 0, 'active', NULL, NULL),
(218, 'TR', 'Turkey', 'TUR', 792, 90, 0, 'active', NULL, NULL),
(219, 'TM', 'Turkmenistan', 'TKM', 795, 7370, 0, 'active', NULL, NULL),
(220, 'TC', 'Turks and Caicos Islands', 'TCA', 796, 1649, 0, 'active', NULL, NULL),
(221, 'TV', 'Tuvalu', 'TUV', 798, 688, 0, 'active', NULL, NULL),
(222, 'UG', 'Uganda', 'UGA', 800, 256, 0, 'active', NULL, NULL),
(223, 'UA', 'Ukraine', 'UKR', 804, 380, 0, 'active', NULL, NULL),
(224, 'AE', 'United Arab Emirates', 'ARE', 784, 971, 0, 'active', NULL, NULL),
(225, 'GB', 'United Kingdom', 'GBR', 826, 44, 0, 'active', NULL, NULL),
(226, 'US', 'United States', 'USA', 840, 1, 0, 'active', NULL, NULL),
(227, 'UM', 'United States Minor Outlying Islands', NULL, NULL, 1, 0, 'active', NULL, NULL),
(228, 'UY', 'Uruguay', 'URY', 858, 598, 0, 'active', NULL, NULL),
(229, 'UZ', 'Uzbekistan', 'UZB', 860, 998, 0, 'active', NULL, NULL),
(230, 'VU', 'Vanuatu', 'VUT', 548, 678, 0, 'active', NULL, NULL),
(231, 'VE', 'Venezuela', 'VEN', 862, 58, 0, 'active', NULL, NULL),
(232, 'VN', 'Viet Nam', 'VNM', 704, 84, 0, 'active', NULL, NULL),
(233, 'VG', 'Virgin Islands, British', 'VGB', 92, 1284, 0, 'active', NULL, NULL),
(234, 'VI', 'Virgin Islands, U.S.', 'VIR', 850, 1340, 0, 'active', NULL, NULL),
(235, 'WF', 'Wallis and Futuna', 'WLF', 876, 681, 0, 'active', NULL, NULL),
(236, 'EH', 'Western Sahara', 'ESH', 732, 212, 0, 'active', NULL, NULL),
(237, 'YE', 'Yemen', 'YEM', 887, 967, 0, 'active', NULL, NULL),
(238, 'ZM', 'Zambia', 'ZMB', 894, 260, 0, 'active', NULL, NULL),
(239, 'ZW', 'Zimbabwe', 'ZWE', 716, 263, 0, 'active', NULL, NULL),
(240, 'RS', 'Serbia', 'SRB', 688, 381, 0, 'active', NULL, NULL),
(241, 'AP', 'Asia / Pacific Region', '0', 0, 0, 0, 'active', NULL, NULL),
(242, 'ME', 'Montenegro', 'MNE', 499, 382, 0, 'active', NULL, NULL),
(243, 'AX', 'Aland Islands', 'ALA', 248, 358, 0, 'active', NULL, NULL),
(244, 'BQ', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599, 0, 'active', NULL, NULL),
(245, 'CW', 'Curacao', 'CUW', 531, 599, 0, 'active', NULL, NULL),
(246, 'GG', 'Guernsey', 'GGY', 831, 44, 0, 'active', NULL, NULL),
(247, 'IM', 'Isle of Man', 'IMN', 833, 44, 0, 'active', NULL, NULL),
(248, 'JE', 'Jersey', 'JEY', 832, 44, 0, 'active', NULL, NULL),
(249, 'XK', 'Kosovo', '---', 0, 381, 0, 'active', NULL, NULL),
(250, 'BL', 'Saint Barthelemy', 'BLM', 652, 590, 0, 'active', NULL, NULL),
(251, 'MF', 'Saint Martin', 'MAF', 663, 590, 0, 'active', NULL, NULL),
(252, 'SX', 'Sint Maarten', 'SXM', 534, 1, 0, 'active', NULL, NULL),
(253, 'SS', 'South Sudan', 'SSD', 728, 211, 0, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE IF NOT EXISTS `diseases` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `title`, `type`, `description`, `remarks`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(18, 'Fever', 'infectious', NULL, NULL, 1, 'active', '2025-02-22 08:43:05', '2025-02-22 08:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE IF NOT EXISTS `districts` (
  `id` bigint(20) unsigned NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `name` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `sorting` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '1',
  `updated_by` int(11) NOT NULL DEFAULT '1',
  `created_ip` int(11) NOT NULL DEFAULT '1',
  `updated_ip` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `state_id`, `name`, `created_at`, `updated_at`, `status`, `sorting`, `deleted_at`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(14, 7, 'Kustia', '2025-02-22 08:35:23', '2025-02-22 08:35:23', 'active', 1, NULL, 1, 1, 1, 1),
(15, 7, 'Khulna', '2025-02-22 08:35:58', '2025-02-22 08:35:58', 'active', 2, NULL, 1, 1, 1, 1),
(16, 7, 'Jhenaidah', '2025-02-22 08:36:12', '2025-02-22 08:36:12', 'active', 3, NULL, 1, 1, 1, 1),
(17, 7, 'Magura', '2025-02-22 08:36:21', '2025-02-22 08:36:21', 'active', 4, NULL, 1, 1, 1, 1),
(18, 8, 'Dhaka Sadar', '2025-02-25 09:31:40', '2025-02-25 09:31:40', 'active', 5, NULL, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE IF NOT EXISTS `exams` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `title`, `level`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(4, 'SSC', 'certified', 1, 'active', '2025-02-22 08:42:41', '2025-02-22 08:42:41');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `sorting` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '1',
  `updated_by` int(11) NOT NULL DEFAULT '1',
  `created_ip` int(11) NOT NULL DEFAULT '1',
  `updated_ip` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `title`, `created_at`, `updated_at`, `status`, `sorting`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(6, 'Male Fisher Group', '2025-02-22 08:44:44', '2025-02-22 08:44:44', 'active', 1, 1, 1, 1, 1),
(7, 'Fisher Group', '2025-02-22 08:44:55', '2025-02-22 08:44:55', 'active', 2, 1, 1, 1, 1),
(8, 'NEw', '2025-03-03 04:17:39', '2025-03-03 04:17:39', 'active', 3, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `help_infos`
--

CREATE TABLE IF NOT EXISTS `help_infos` (
  `id` bigint(20) unsigned NOT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicators`
--

CREATE TABLE IF NOT EXISTS `indicators` (
  `id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `total_mark` smallint(5) unsigned DEFAULT NULL,
  `achivement_percentage` tinyint(3) unsigned DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `indicators`
--

INSERT INTO `indicators` (`id`, `project_id`, `title`, `description`, `total_mark`, `achivement_percentage`, `sorting`, `status`, `created_by`, `created_ip`, `updated_by`, `updated_ip`, `created_at`, `updated_at`) VALUES
(237, 67, '80% of the targeted seagoing fishers are using safety and security materials', 'safety and security materials like as lifejacket, lifebuoys while fishing in the sea', 100, 80, 0, 'active', NULL, NULL, NULL, NULL, '2025-02-22 09:23:56', '2025-02-22 09:23:56'),
(238, 67, 'At least 60% of the targeted seagoing fishers reduced financial loss comparing to previous fishing season', '', 100, 60, 0, 'active', NULL, NULL, NULL, NULL, '2025-02-22 09:23:56', '2025-02-22 09:23:56'),
(239, 67, 'At least 60% of the targeted farmer are cultivating one new crop/vegetable/fruit variety', '', 100, 60, 0, 'active', NULL, NULL, NULL, NULL, '2025-02-22 09:23:56', '2025-02-22 09:23:56'),
(240, 67, 'Local government and administration is reacting in minimum 07 cases to the demands and enquiries submitted by the established climate action community and civil society groups.', '', 100, 80, 0, 'active', NULL, NULL, NULL, NULL, '2025-02-22 09:23:56', '2025-02-22 09:23:56'),
(241, 68, 'Project 1 Indicator 1', 'On the other hand, if you find the G7 at a lower price point and are satisfied with previous generations but still need solid performance, the HP EliteBook G7 remains a very capable option. Your choice may depend on your specific needs, budget, and whether you prefer the latest features in the G8', 20, 80, 0, 'active', NULL, NULL, NULL, NULL, '2025-03-02 04:02:57', '2025-03-02 04:02:57'),
(242, 68, 'Project 1 Indicator 2', 'The G8 features the Ryzen 7 Pro 5850U, which has better performance and efficiency compared to the Ryzen 7 Pro 4750U in the G7. The G8''s processor generally offers better single-core and multi-core performance due to architectural improvements', 20, 75, 0, 'active', NULL, NULL, NULL, NULL, '2025-03-02 04:02:57', '2025-03-02 04:02:57'),
(243, 68, 'Project 1 Indicator 3', 'While both models have great battery life, the G7 typically boasts slightly longer battery life (up to 20 hours vs. G8''s 18 hours). This could vary depending on usage and configuration', 25, 100, 0, 'active', NULL, NULL, NULL, NULL, '2025-03-02 04:02:57', '2025-03-02 04:02:57'),
(244, 68, 'Project 1 Indicator 4', 'The G8 supports faster RAM (up to 3200 MHz) compared to the G7 (up to 2666 MHz), which can lead to improved performance in memory-intensive tasks', 20, 70, 0, 'active', NULL, NULL, NULL, NULL, '2025-03-02 04:02:57', '2025-03-02 04:02:57'),
(245, 69, 'Project 2 Indicator 1', 'The G8 features the Ryzen 7 Pro 5850U, which has better performance and efficiency compared to the Ryzen 7 Pro 4750U in the G7. The G8''s processor generally offers better single-core and multi-core performance due to architectural improvements', 20, 80, 0, 'active', NULL, NULL, NULL, NULL, '2025-03-02 04:04:31', '2025-03-02 04:04:31'),
(246, 69, 'Project 2 Indicator 2', 'The G8 supports faster RAM (up to 3200 MHz) compared to the G7 (up to 2666 MHz), which can lead to improved performance in memory-intensive tasks', 25, 75, 0, 'active', NULL, NULL, NULL, NULL, '2025-03-02 04:04:31', '2025-03-02 04:04:31'),
(247, 70, 'Project 3 Indicator 1', 'On the other hand, if you find the G7 at a lower price point and are satisfied with previous generations but still need solid performance, the HP EliteBook G7 remains a very capable option. Your choice may depend on your specific needs, budget, and whether you prefer the latest features in the G8.', 20, 70, 0, 'active', NULL, NULL, NULL, NULL, '2025-03-02 04:06:09', '2025-03-02 04:06:09');

-- --------------------------------------------------------

--
-- Stand-in structure for view `indicator_attendance_point_summary_views`
--
CREATE TABLE IF NOT EXISTS `indicator_attendance_point_summary_views` (
`project_id` bigint(20) unsigned
,`indicator_id` bigint(20) unsigned
,`indicator_attendance_point` bigint(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `indicator_attendance_summary_views`
--
CREATE TABLE IF NOT EXISTS `indicator_attendance_summary_views` (
`project_id` bigint(20) unsigned
,`indicator_id` bigint(20) unsigned
,`present_percentage_count` decimal(49,4)
,`activity_count` bigint(21)
,`present_percentage_by_indicator` decimal(53,8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `indicator_survey_point_report_views`
--
CREATE TABLE IF NOT EXISTS `indicator_survey_point_report_views` (
`project_id` bigint(20) unsigned
,`indicator_id` bigint(20) unsigned
,`indicator_survey_point` bigint(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `indicator_survey_report_views`
--
CREATE TABLE IF NOT EXISTS `indicator_survey_report_views` (
`project_id` bigint(20) unsigned
,`indicator_id` bigint(20) unsigned
,`average_indicator_survey_mark` decimal(65,16)
);

-- --------------------------------------------------------

--
-- Table structure for table `liabilities`
--

CREATE TABLE IF NOT EXISTS `liabilities` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorting` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` int(11) NOT NULL DEFAULT '1',
  `updated_by` int(11) NOT NULL DEFAULT '1',
  `created_ip` int(11) NOT NULL DEFAULT '1',
  `updated_ip` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `liabilities`
--

INSERT INTO `liabilities` (`id`, `title`, `sorting`, `created_at`, `updated_at`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`) VALUES
(3, 'Loan', 1, '2025-02-22 08:43:14', '2025-02-22 08:43:14', 'active', 1, 1, 1, 1),
(4, 'New', 2, '2025-03-06 07:31:53', '2025-03-06 07:31:53', 'active', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `media_validators`
--

CREATE TABLE IF NOT EXISTS `media_validators` (
  `id` bigint(20) unsigned NOT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_size` int(11) NOT NULL,
  `min_width` int(11) DEFAULT NULL,
  `min_height` int(11) DEFAULT NULL,
  `resize_value` text COLLATE utf8mb4_unicode_ci,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_validators`
--

INSERT INTO `media_validators` (`id`, `model_name`, `field_name`, `field_type`, `max_size`, `min_width`, `min_height`, `resize_value`, `sorting`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`, `created_at`, `updated_at`) VALUES
(2, 'Admin', 'profile', 'image', 5000, 600, 600, '["600x600","300x300","50x50"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-10 00:36:15', '2024-09-11 00:50:34'),
(5, 'Album', 'image', 'image', 5120, 600, 600, '["600x600","340x340","242x242","50x50"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-10 03:46:00', '2024-09-10 23:29:38'),
(18, 'Content', 'image', 'image', 5000, 600, 600, '["600x600","200x200","50x50"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-11 22:41:03', '2024-09-14 23:28:08'),
(21, 'SiteSetting', 'logo', 'image', 5000, 300, 80, '["600x300","300x80","100x30"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-10-02 00:03:57', '2024-10-02 00:03:57'),
(22, 'SiteSetting', 'logo_small', 'image', 5000, 300, 80, '["600x300","300x80","100x40"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-10-02 00:04:27', '2024-10-02 00:04:27');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint(20) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `show_dasboard` tinyint(4) NOT NULL DEFAULT '0',
  `show_profile` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `menu_name`, `module_name`, `icon`, `route_name`, `params`, `sorting`, `show_dasboard`, `show_profile`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Dashboard', NULL, '<i class=''fas fa-cog spin''></i>', 'dashboard.index', NULL, 0, 0, 0, NULL, '2024-08-26 02:38:45'),
(2, NULL, 'Admin', NULL, '<i class=''fa fa-user''></i>', 'admin.index', NULL, 1, 0, 0, NULL, '2024-08-26 02:38:53'),
(3, NULL, 'Master Setup', NULL, '<i class=''fab fa-mastodon''></i>', NULL, NULL, 14, 0, 0, NULL, '2024-10-20 21:38:08'),
(4, 3, 'Category', NULL, '<i class=''fa fa-list text-aqua''></i>', 'category.index', NULL, 0, 0, 0, NULL, NULL),
(13, NULL, 'Profile', NULL, '<i class=''fa fa-user-o''></i>', 'profile.index', NULL, 5, 0, 0, NULL, NULL),
(19, NULL, 'System Settings', NULL, '<i class=''fa fa-windows''></i>', NULL, NULL, 15, 0, 0, NULL, '2024-10-20 21:38:16'),
(20, 19, 'User Role', NULL, '<i class=''fa fa-list text-aqua''></i>', 'role.index', NULL, 0, 0, 0, NULL, '2025-02-22 04:12:28'),
(21, 19, 'Backend Menu List', NULL, '<i class=''fa fa-list text-aqua''></i>', 'menu.index', NULL, 1, 0, 0, NULL, '2024-08-25 22:00:11'),
(23, 19, 'Site Settings', NULL, '<i class=''fa fa-cog text-aqua''></i>', 'siteSetting.show', NULL, 3, 0, 1, NULL, '2024-08-25 20:39:11'),
(24, 19, 'Activity Log', NULL, '<i class=''fa fa-history''></i>', 'activityLog.index', NULL, 4, 0, 0, NULL, NULL),
(25, 19, 'Module Create', NULL, '<i class=''fa fa-folder text-aqua''></i>', 'module.create', NULL, 5, 0, 0, NULL, NULL),
(34, 3, 'Media Validator', NULL, '<i class=''fas fa-image''></i>', 'mediaValidator.index', NULL, 3, 0, 0, '2024-09-09 22:50:02', '2024-10-20 22:24:33'),
(37, 3, 'Help Info', NULL, '<i class=''fas fa-question-circle''></i>', 'helpInfo.index', NULL, 2, 0, 0, '2024-09-29 00:03:18', '2024-10-20 22:24:22'),
(38, 3, 'State', NULL, '<i class=''fas fa-atom''></i>', 'state.index', NULL, 4, 0, 0, '2024-10-08 04:40:19', '2024-10-20 22:21:44'),
(39, NULL, 'Division', NULL, '<i class=''fas fa-atom''></i>', 'division.index', NULL, 0, 0, 0, '2024-10-08 04:53:26', '2024-10-08 04:53:26'),
(40, 3, 'District', NULL, '<i class=''fas fa-atom''></i>', 'district.index', NULL, 5, 0, 0, '2024-10-08 04:57:15', '2024-10-20 22:22:01'),
(41, 3, 'Upazila', NULL, '<i class=''fas fa-atom''></i>', 'upazila.index', NULL, 6, 0, 0, '2024-10-08 05:41:54', '2024-10-20 23:28:26'),
(44, 3, 'Occupation', NULL, '<i class=''fas fa-atom''></i>', 'occupation.index', NULL, 7, 0, 0, '2024-10-10 03:30:03', '2024-10-20 22:22:53'),
(45, 3, 'Exam', NULL, '<i class=''fas fa-atom''></i>', 'exam.index', NULL, 8, 0, 0, '2024-10-10 04:09:59', '2024-10-20 22:23:10'),
(46, 3, 'Relation', NULL, '<i class=''fas fa-atom''></i>', 'relation.index', NULL, 9, 0, 0, '2024-10-10 04:55:53', '2024-10-20 22:23:32'),
(47, 3, 'Disease', NULL, '<i class=''fas fa-atom''></i>', 'disease.index', NULL, 10, 0, 0, '2024-10-12 23:01:14', '2024-10-20 22:23:49'),
(48, 51, 'Project', '\\App\\Models\\Project', '<i class=''fas fa-project-diagram''></i>', 'project.index', NULL, 10, 1, 0, '2024-10-15 01:03:21', '2024-12-18 03:31:46'),
(49, 51, 'Project Activity', NULL, '<i class=''fas fa-chess-board''></i>', 'projectActivity.index', NULL, 11, 0, 0, '2024-10-17 02:40:07', '2024-10-27 04:44:46'),
(50, 51, 'Project Achievement Setup', NULL, '<i class=''fas fa-bomb''></i>', 'projectAchievementSetup.index', NULL, 12, 0, 0, '2024-10-19 23:09:49', '2024-10-27 04:44:36'),
(51, NULL, 'Project Section', NULL, '<i class=''fas fa-bahai''></i>', NULL, NULL, 26, 0, 0, '2024-10-27 04:44:20', '2024-10-27 04:44:20'),
(53, 63, 'Survey Form', NULL, '<i class=''fab fa-servicestack''></i>', 'surveyForm.index', NULL, 28, 0, 0, '2024-10-28 23:01:05', '2024-11-20 21:45:01'),
(54, 51, 'Activity Info Execution', NULL, '<i class=''fas fa-holly-berry''></i>', 'activityInfo.index', NULL, 29, 0, 0, '2024-10-28 17:09:54', '2024-10-28 17:10:44'),
(56, NULL, 'Beneficiary Section', NULL, '<i class=''fas fa-suitcase''></i>', NULL, NULL, 31, 0, 0, '2024-10-30 23:26:40', '2024-10-30 23:26:40'),
(57, 56, 'Beneficiary', '\\App\\Models\\Beneficiary', '<i class=''fas fa-bahai''></i>', 'beneficiary.index', NULL, 31, 1, 0, '2024-10-30 23:28:39', '2024-12-18 03:30:59'),
(58, 56, 'Beneficiary Attendance', NULL, '<i class=''fas fa-allergies''></i>', 'beneficiaryAttendance.index', NULL, 32, 0, 0, '2024-10-30 23:29:41', '2024-10-30 23:29:41'),
(59, 56, 'Beneficiary Assign', NULL, '<i class=''fas fa-asterisk''></i>', 'beneficiaryAssign.index', NULL, 33, 0, 0, '2024-10-30 23:30:49', '2024-10-30 23:30:49'),
(60, 3, 'Wealth', NULL, '<i class=''fab fa-canadian-maple-leaf''></i>', 'wealth.index', NULL, 34, 0, 0, '2024-11-03 22:22:57', '2024-11-03 22:22:57'),
(61, 3, 'Liability', NULL, '<i class=''fas fa-adjust''></i>', 'liability.index', NULL, 35, 0, 0, '2024-11-03 22:52:00', '2024-11-03 22:52:00'),
(62, 3, 'Assets', NULL, '<i class=''fas fa-align-center''></i>', 'asset.index', NULL, 36, 0, 0, '2024-11-03 22:52:54', '2024-11-03 22:52:54'),
(63, NULL, 'Survey Section', NULL, '<i class=''fas fa-envelope-open-text''></i>', NULL, NULL, 37, 0, 0, '2024-11-20 21:43:41', '2024-11-20 21:43:41'),
(64, 63, 'Survey', NULL, '<i class=''fab fa-stack-exchange''></i>', 'survey.index', NULL, 38, 0, 0, '2024-11-20 21:54:18', '2024-11-20 21:54:18'),
(65, NULL, 'Report Section', NULL, '<i class=''fas fa-file-export''></i>', NULL, NULL, 39, 0, 0, '2024-11-21 02:35:07', '2024-11-21 02:35:07'),
(66, 65, 'Activities Monitoring Report', NULL, '<i class=''fas fa-book-open''></i>', 'report.activitiesMonitoring', NULL, 40, 0, 0, '2024-11-27 02:45:55', '2024-11-27 02:45:55'),
(67, 65, 'Project Beneficiary', NULL, '<i class=''fas fa-box''></i>', 'report.projectBeneficiary', NULL, 41, 0, 0, '2024-11-28 06:37:27', '2024-11-28 06:37:27'),
(68, 65, 'Project Indicator Graph', NULL, '<i class=''fas fa-align-center''></i>', 'report.indicatorGraph', NULL, 42, 0, 0, '2024-11-28 06:48:45', '2024-11-28 06:48:45'),
(69, 65, 'Project Activity Report', NULL, '<i class=''fas fa-allergies''></i>', 'report.activityReport', NULL, 43, 0, 0, '2024-11-28 06:52:03', '2024-11-28 06:53:59'),
(70, 65, 'Project Summary Report', NULL, '<i class=''fas fa-ambulance''></i>', 'report.projectReport', NULL, 44, 0, 0, '2024-11-28 06:54:45', '2024-11-28 06:54:45'),
(71, 65, 'Survey Graph Report', NULL, '<i class=''fas fa-receipt''></i>', 'report.surveyGraph', NULL, 45, 0, 0, '2024-12-11 00:35:25', '2024-12-11 00:35:25'),
(72, 51, 'Group', NULL, '<i class=''fas fa-align-justify''></i>', 'group.index', NULL, 45, 0, 0, '2025-01-13 23:04:49', '2025-01-13 23:04:49'),
(73, 3, 'Thana', NULL, '<i class=''fas fa-fire-extinguisher''></i>', 'thana.index', NULL, 45, 0, 0, '2025-02-25 09:39:04', '2025-02-25 09:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_05_26_071839_create_roles_table', 1),
(6, '2020_06_01_101148_create_site_settings_table', 1),
(7, '2020_06_01_102821_create_contents_table', 1),
(8, '2020_06_02_044523_create_content_files_table', 1),
(9, '2020_06_08_140638_create_sliders_table', 1),
(10, '2020_06_09_051430_create_albums_table', 1),
(11, '2020_06_09_053929_create_photos_table', 1),
(12, '2020_06_09_072128_create_videos_table', 1),
(13, '2020_06_10_120859_create_front_menus_table', 1),
(14, '2021_02_22_050702_create_permissions_table', 1),
(15, '2021_02_22_050735_create_role_permissions_table', 1),
(16, '2021_02_22_062756_create_menus_table', 1),
(17, '2021_02_26_100135_create_news_table', 1),
(18, '2022_06_23_053641_create_admins_table', 1),
(20, '2022_12_11_104109_create_plugins_table', 1),
(21, '2022_12_21_083741_create_event_schedules_table', 1),
(22, '2023_02_08_033828_create_profiles_table', 1),
(23, '2023_05_04_112200_create_slider_details_table', 1),
(24, '2023_05_11_110836_create_user_login_infos_table', 1),
(25, '2023_06_01_055529_create_notices_table', 1),
(26, '2023_06_05_105945_create_categories_table', 1),
(27, '2023_06_05_111140_create_events_table', 1),
(28, '2023_06_06_122755_create_contacts_table', 1),
(29, '2023_06_07_041032_create_faqs_table', 1),
(30, '2023_06_14_045514_create_countries_table', 1),
(31, '2024_01_01_102809_create_employees_table', 1),
(32, '2024_01_01_103237_create_employees_table', 1),
(33, '2024_09_09_052831_create_media_validators_table', 2),
(34, '2022_07_16_095130_create_activity_log_table', 3),
(35, '2024_07_16_061642_create_page_seos_table', 4),
(36, '2024_07_16_054115_create_pages_table', 5),
(37, '2024_08_14_061111_create_page_sections_table', 6),
(38, '2024_09_18_113232_create_help_infos_table', 7),
(39, '2024_10_08_104019_create_states_table', 8),
(40, '2024_10_08_114154_create_upazilas_table', 9),
(41, '2024_10_13_050114_create_diseases_table', 10),
(42, '2024_10_09_060951_create_indicators_table', 11),
(43, '2024_10_09_054858_create_projects_table', 12),
(45, '2024_10_17_084006_create_project_activities_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `occupations`
--

CREATE TABLE IF NOT EXISTS `occupations` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `occupations`
--

INSERT INTO `occupations` (`id`, `title`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Farmer', 1, 'active', '2025-02-22 08:42:49', '2025-02-22 08:42:49'),
(7, 'Fisher', 2, 'active', '2025-03-06 06:20:14', '2025-03-06 06:20:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` bigint(20) unsigned NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(1, 'nsl@gmail.com', '$2y$10$TPwVTU2Q3EscGtm2tzP0h.CGOPWpRWRdvvm9xvnjHR/21sjeot7Ra', '2024-09-12 05:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `route`, `parent_id`) VALUES
(1, 'ActivityLogController', NULL, NULL),
(3, 'index', 'activityLog.index', 1),
(4, 'show', 'activityLog.show', 1),
(5, 'allRead', 'activityLog.allRead', 1),
(6, 'destroy', 'activityLog.destroy', 1),
(8, 'DashboardController', NULL, NULL),
(9, 'index', 'dashboard.index', 8),
(75, 'CategoryController', NULL, NULL),
(76, 'index', 'category.index', 75),
(77, 'create', 'category.create', 75),
(78, 'store', 'category.store', 75),
(79, 'show', 'category.show', 75),
(80, 'edit', 'category.edit', 75),
(81, 'update', 'category.update', 75),
(82, 'destroy', 'category.destroy', 75),
(115, 'ModuleController', NULL, NULL),
(116, 'create', 'module.create', 115),
(117, 'RoleController', NULL, NULL),
(118, 'index', 'role.index', 117),
(119, 'create', 'role.create', 117),
(120, 'store', 'role.store', 117),
(121, 'show', 'role.show', 117),
(122, 'edit', 'role.edit', 117),
(123, 'update', 'role.update', 117),
(124, 'destroy', 'role.destroy', 117),
(125, 'MenuController', NULL, NULL),
(126, 'index', 'menu.index', 125),
(127, 'create', 'menu.create', 125),
(128, 'store', 'menu.store', 125),
(129, 'show', 'menu.show', 125),
(130, 'edit', 'menu.edit', 125),
(131, 'update', 'menu.update', 125),
(132, 'destroy', 'menu.destroy', 125),
(133, 'SiteSettingController', NULL, NULL),
(134, 'index', 'siteSetting.index', 133),
(135, 'create', 'siteSetting.create', 133),
(136, 'store', 'siteSetting.store', 133),
(137, 'show', 'siteSetting.show', 133),
(138, 'edit', 'siteSetting.edit', 133),
(139, 'update', 'siteSetting.update', 133),
(140, 'destroy', 'siteSetting.destroy', 133),
(141, 'AdminController', NULL, NULL),
(142, 'index', 'admin.index', 141),
(143, 'create', 'admin.create', 141),
(144, 'store', 'admin.store', 141),
(145, 'show', 'admin.show', 141),
(146, 'edit', 'admin.edit', 141),
(147, 'update', 'admin.update', 141),
(148, 'destroy', 'admin.destroy', 141),
(149, 'profileDetails', 'profile.profileDetails', 141),
(198, 'RobotController', NULL, NULL),
(202, 'XmlController', NULL, NULL),
(207, 'MediaValidatorController', NULL, NULL),
(208, 'index', 'mediaValidator.index', 207),
(209, 'create', 'mediaValidator.create', 207),
(210, 'store', 'mediaValidator.store', 207),
(211, 'show', 'mediaValidator.show', 207),
(212, 'edit', 'mediaValidator.edit', 207),
(213, 'update', 'mediaValidator.update', 207),
(214, 'destroy', 'mediaValidator.destroy', 207),
(215, 'getFields', 'mediaValidator.getFields', 207),
(224, 'restore', 'activityLog.restore', 1),
(225, 'HelpInfoController', NULL, NULL),
(226, 'index', 'helpInfo.index', 225),
(227, 'create', 'helpInfo.create', 225),
(228, 'store', 'helpInfo.store', 225),
(229, 'show', 'helpInfo.show', 225),
(230, 'edit', 'helpInfo.edit', 225),
(231, 'update', 'helpInfo.update', 225),
(232, 'destroy', 'helpInfo.destroy', 225),
(233, 'StateController', NULL, NULL),
(234, 'index', 'state.index', 233),
(235, 'create', 'state.create', 233),
(236, 'store', 'state.store', 233),
(237, 'show', 'state.show', 233),
(238, 'edit', 'state.edit', 233),
(239, 'update', 'state.update', 233),
(240, 'destroy', 'state.destroy', 233),
(241, 'DistrictController', NULL, NULL),
(242, 'index', 'district.index', 241),
(243, 'create', 'district.create', 241),
(244, 'store', 'district.store', 241),
(245, 'show', 'district.show', 241),
(246, 'edit', 'district.edit', 241),
(247, 'update', 'district.update', 241),
(248, 'destroy', 'district.destroy', 241),
(249, 'UpazilaController', NULL, NULL),
(250, 'index', 'upazila.index', 249),
(251, 'create', 'upazila.create', 249),
(252, 'store', 'upazila.store', 249),
(253, 'show', 'upazila.show', 249),
(254, 'edit', 'upazila.edit', 249),
(255, 'update', 'upazila.update', 249),
(256, 'destroy', 'upazila.destroy', 249),
(257, 'BeneficiaryController', NULL, NULL),
(258, 'index', 'beneficiary.index', 257),
(259, 'create', 'beneficiary.create', 257),
(260, 'store', 'beneficiary.store', 257),
(261, 'show', 'beneficiary.show', 257),
(262, 'edit', 'beneficiary.edit', 257),
(263, 'update', 'beneficiary.update', 257),
(264, 'destroy', 'beneficiary.destroy', 257),
(265, 'ProjectController', NULL, NULL),
(266, 'index', 'project.index', 265),
(267, 'create', 'project.create', 265),
(268, 'store', 'project.store', 265),
(269, 'show', 'project.show', 265),
(270, 'edit', 'project.edit', 265),
(271, 'update', 'project.update', 265),
(272, 'destroy', 'project.destroy', 265),
(273, 'OccupationController', NULL, NULL),
(274, 'index', 'occupation.index', 273),
(275, 'create', 'occupation.create', 273),
(276, 'store', 'occupation.store', 273),
(277, 'show', 'occupation.show', 273),
(278, 'edit', 'occupation.edit', 273),
(279, 'update', 'occupation.update', 273),
(280, 'destroy', 'occupation.destroy', 273),
(281, 'ExamController', NULL, NULL),
(282, 'index', 'exam.index', 281),
(283, 'create', 'exam.create', 281),
(284, 'store', 'exam.store', 281),
(285, 'show', 'exam.show', 281),
(286, 'edit', 'exam.edit', 281),
(287, 'update', 'exam.update', 281),
(288, 'destroy', 'exam.destroy', 281),
(289, 'RelationController', NULL, NULL),
(290, 'index', 'relation.index', 289),
(291, 'create', 'relation.create', 289),
(292, 'store', 'relation.store', 289),
(293, 'show', 'relation.show', 289),
(294, 'edit', 'relation.edit', 289),
(295, 'update', 'relation.update', 289),
(296, 'destroy', 'relation.destroy', 289),
(297, 'DiseaseController', NULL, NULL),
(298, 'index', 'disease.index', 297),
(299, 'create', 'disease.create', 297),
(300, 'store', 'disease.store', 297),
(301, 'show', 'disease.show', 297),
(302, 'edit', 'disease.edit', 297),
(303, 'update', 'disease.update', 297),
(304, 'destroy', 'disease.destroy', 297),
(305, 'SurveyFormController', NULL, NULL),
(306, 'index', 'surveyForm.index', 305),
(307, 'create', 'surveyForm.create', 305),
(308, 'store', 'surveyForm.store', 305),
(309, 'show', 'surveyForm.show', 305),
(310, 'edit', 'surveyForm.edit', 305),
(311, 'update', 'surveyForm.update', 305),
(312, 'destroy', 'surveyForm.destroy', 305),
(313, 'SurveyController', NULL, NULL),
(314, 'index', 'survey.index', 313),
(315, 'create', 'survey.create', 313),
(316, 'store', 'survey.store', 313),
(317, 'show', 'survey.show', 313),
(318, 'edit', 'survey.edit', 313),
(319, 'update', 'survey.update', 313),
(320, 'destroy', 'survey.destroy', 313),
(321, 'ProjectActivityController', NULL, NULL),
(322, 'index', 'projectActivity.index', 321),
(323, 'create', 'projectActivity.create', 321),
(324, 'store', 'projectActivity.store', 321),
(325, 'show', 'projectActivity.show', 321),
(326, 'edit', 'projectActivity.edit', 321),
(327, 'update', 'projectActivity.update', 321),
(328, 'destroy', 'projectActivity.destroy', 321),
(329, 'ProjectAchievementSetupController', NULL, NULL),
(330, 'index', 'projectAchievementSetup.index', 329),
(331, 'create', 'projectAchievementSetup.create', 329),
(332, 'store', 'projectAchievementSetup.store', 329),
(333, 'show', 'projectAchievementSetup.show', 329),
(334, 'edit', 'projectAchievementSetup.edit', 329),
(335, 'update', 'projectAchievementSetup.update', 329),
(336, 'destroy', 'projectAchievementSetup.destroy', 329),
(337, 'idCard', 'beneficiary.idCard', 257),
(338, 'ActivityInfoController', NULL, NULL),
(339, 'index', 'activityInfo.index', 338),
(340, 'create', 'activityInfo.create', 338),
(341, 'store', 'activityInfo.store', 338),
(342, 'show', 'activityInfo.show', 338),
(343, 'edit', 'activityInfo.edit', 338),
(344, 'update', 'activityInfo.update', 338),
(345, 'destroy', 'activityInfo.destroy', 338),
(346, 'WealthController', NULL, NULL),
(347, 'index', 'wealth.index', 346),
(348, 'create', 'wealth.create', 346),
(349, 'store', 'wealth.store', 346),
(350, 'show', 'wealth.show', 346),
(351, 'edit', 'wealth.edit', 346),
(352, 'update', 'wealth.update', 346),
(353, 'destroy', 'wealth.destroy', 346),
(354, 'AssetController', NULL, NULL),
(355, 'index', 'asset.index', 354),
(356, 'create', 'asset.create', 354),
(357, 'store', 'asset.store', 354),
(358, 'show', 'asset.show', 354),
(359, 'edit', 'asset.edit', 354),
(360, 'update', 'asset.update', 354),
(361, 'destroy', 'asset.destroy', 354),
(362, 'LiabilityController', NULL, NULL),
(363, 'index', 'liability.index', 362),
(364, 'create', 'liability.create', 362),
(365, 'store', 'liability.store', 362),
(366, 'show', 'liability.show', 362),
(367, 'edit', 'liability.edit', 362),
(368, 'update', 'liability.update', 362),
(369, 'destroy', 'liability.destroy', 362),
(370, 'BeneficiaryAttendanceController', NULL, NULL),
(371, 'index', 'beneficiaryAttendance.index', 370),
(372, 'create', 'beneficiaryAttendance.create', 370),
(373, 'store', 'beneficiaryAttendance.store', 370),
(374, 'show', 'beneficiaryAttendance.show', 370),
(375, 'edit', 'beneficiaryAttendance.edit', 370),
(376, 'update', 'beneficiaryAttendance.update', 370),
(377, 'destroy', 'beneficiaryAttendance.destroy', 370),
(378, 'BeneficiaryAssignController', NULL, NULL),
(379, 'index', 'beneficiaryAssign.index', 378),
(380, 'create', 'beneficiaryAssign.create', 378),
(381, 'store', 'beneficiaryAssign.store', 378),
(382, 'show', 'beneficiaryAssign.show', 378),
(383, 'edit', 'beneficiaryAssign.edit', 378),
(384, 'update', 'beneficiaryAssign.update', 378),
(385, 'destroy', 'beneficiaryAssign.destroy', 378),
(386, 'beneficiaryDelete', 'beneficiaryAssign.beneficiaryDelete', 378),
(387, 'surveyStart', 'survey.surveyStart', 313),
(388, 'storeDetails', 'survey.storeDetails', 313),
(389, 'ReporController', NULL, NULL),
(390, 'projectBeneficiary', 'report.projectBeneficiary', 389),
(391, 'ReportController', NULL, NULL),
(392, 'projectBeneficiary', 'report.projectBeneficiary', 391),
(393, 'indicatorGraph', 'report.indicatorGraph', 391),
(394, 'activitiesMonitoring', 'report.activitiesMonitoring', 391),
(395, 'activityReport', 'report.activityReport', 391),
(396, 'projectReport', 'report.projectReport', 391),
(397, 'surveyBeneficiariesDelete', 'survey.surveyBeneficiariesDelete', 313),
(398, 'surveyGraph', 'report.surveyGraph', 391),
(399, 'GroupController', NULL, NULL),
(400, 'index', 'group.index', 399),
(401, 'create', 'group.create', 399),
(402, 'store', 'group.store', 399),
(403, 'show', 'group.show', 399),
(404, 'edit', 'group.edit', 399),
(405, 'update', 'group.update', 399),
(406, 'destroy', 'group.destroy', 399),
(407, 'ThanaController', NULL, NULL),
(408, 'index', 'thana.index', 407),
(409, 'create', 'thana.create', 407),
(410, 'store', 'thana.store', 407),
(411, 'show', 'thana.show', 407),
(412, 'edit', 'thana.edit', 407),
(413, 'update', 'thana.update', 407),
(414, 'destroy', 'thana.destroy', 407);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(52, 'App\\Models\\Admin', 3, 'api', '392e2717c3f954f9347fda6e5b23c51de3316765dcbc45faef2fdca78415a39b', '["*"]', '2025-03-06 05:15:45', '2025-03-06 02:57:31', '2025-03-06 05:15:45'),
(53, 'App\\Models\\Admin', 3, 'api', '07c4bf220864bb7fea2fc040a7f05f0b4e652e9e3e449d23be4e823adab315c7', '["*"]', '2025-03-12 07:40:40', '2025-03-06 05:16:58', '2025-03-12 07:40:40'),
(57, 'App\\Models\\Admin', 3, 'api', 'a3a7b6b64245356ce131cd23eace8f89f6a5562b19b42e53b5704acac8fc7780', '["*"]', '2025-03-08 15:55:37', '2025-03-08 15:54:31', '2025-03-08 15:55:37'),
(60, 'App\\Models\\Admin', 4, 'api', '9195258ced49108b7b8ab976f7cfd0b9e065c857a96210b486726dee729e04a7', '["*"]', '2025-03-12 08:21:01', '2025-03-09 03:43:41', '2025-03-12 08:21:01'),
(61, 'App\\Models\\Admin', 1, 'api', '85d9cd3fb5b25b1fa04d3050d6a2f58b452375232eb032cf904de53d213727ad', '["*"]', '2025-03-11 13:35:42', '2025-03-11 13:35:41', '2025-03-11 13:35:42'),
(62, 'App\\Models\\Admin', 1, 'api', '63f90470729e0caea7b8b64f562dfe3b8009912d251a4718a89112d83c03f72e', '["*"]', '2025-03-11 13:35:46', '2025-03-11 13:35:45', '2025-03-11 13:35:46'),
(63, 'App\\Models\\Admin', 1, 'api', '283a360f09e3e7c6c31e5e3027d5357b8a685a5fc1445c8aa5d9d7b5f42d15e5', '["*"]', '2025-03-12 14:39:57', '2025-03-11 13:35:59', '2025-03-12 14:39:57'),
(64, 'App\\Models\\Admin', 3, 'api', 'a465b37f18fc984ea217baf0ec8ff4a681948e6c16a38d458615f12852724828', '["*"]', '2025-03-12 14:53:19', '2025-03-11 13:41:32', '2025-03-12 14:53:19'),
(65, 'App\\Models\\Admin', 1, 'api', '5cb10ea62ef2d486fe608eaa6700f9c731d8405e8ed0acb6d69aef1c2868b8e5', '["*"]', '2025-03-12 08:09:08', '2025-03-11 15:43:52', '2025-03-12 08:09:08'),
(66, 'App\\Models\\Admin', 3, 'api', '2d8901d3cb564b6ffcc2f05bd18b982cd5207bca7acae13bd17b2c82858ff2f1', '["*"]', '2025-03-11 19:58:55', '2025-03-11 19:53:52', '2025-03-11 19:58:55'),
(67, 'App\\Models\\Admin', 1, 'api', '39ead9ce92fc49b3e66e1cbcaaa97aff9027539d8dc1a344cf57418c1fa000c4', '["*"]', '2025-03-12 08:15:48', '2025-03-12 08:15:25', '2025-03-12 08:15:48'),
(68, 'App\\Models\\Admin', 3, 'api', 'b80e41a3452b375b061459608f2ca59232456193aebe331dbc1dfecb2094a7ec', '["*"]', '2025-03-12 14:15:16', '2025-03-12 14:12:05', '2025-03-12 14:15:16'),
(69, 'App\\Models\\Admin', 1, 'api', '4cd8a2ca61b508327acfad302aba6769619a8642627f246a9ef26facb36e1389', '["*"]', '2025-03-12 14:55:36', '2025-03-12 14:42:52', '2025-03-12 14:55:36'),
(70, 'App\\Models\\Admin', 4, 'api', '15bfed6879425db631a1a206630183ad05589b16d4bee133a2a9952be6a0d48c', '["*"]', NULL, '2025-03-12 14:53:05', '2025-03-12 14:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `select` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint(20) unsigned NOT NULL,
  `project_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `objective` text COLLATE utf8mb4_unicode_ci,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `district_id` bigint(20) unsigned DEFAULT NULL,
  `upazila_id` bigint(20) unsigned DEFAULT NULL,
  `sorting` int(11) DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project_name`, `start_date`, `end_date`, `objective`, `state_id`, `district_id`, `upazila_id`, `sorting`, `status`, `created_by`, `created_ip`, `updated_by`, `updated_ip`, `created_at`, `updated_at`) VALUES
(67, 'Adaptive Livelihood Towards Establishing Resilient communities (ALTER), Phase-II', '2025-02-01', NULL, NULL, 7, 15, 18, 0, 'active', NULL, NULL, NULL, NULL, '2025-02-22 08:45:36', '2025-02-22 09:20:10'),
(68, 'Project1', '2025-03-01', '2025-03-31', 'Both laptops are excellent for business use, offering solid performance with the Ryzen 7 Pro processor, great battery life, and strong security features. However, if you are looking for the latest technology with improved performance and potentially faster RAM, the HP EliteBook G8 would be the better choice.\nOn the other hand, if you find the G7 at a lower price point and are satisfied with previous generations but still need solid performance, the HP EliteBook G7 remains a very capable option. Your choice may depend on your specific needs, budget, and whether you prefer the latest features in the G8.', 7, 14, 11, 0, 'active', NULL, NULL, NULL, NULL, '2025-03-02 04:02:57', '2025-03-02 04:02:57'),
(69, 'Project 2', '2025-03-02', '2025-03-25', 'The G8 features the Ryzen 7 Pro 5850U, which has better performance and efficiency compared to the Ryzen 7 Pro 4750U in the G7. The G8''s processor generally offers better single-core and multi-core performance due to architectural improvements', 7, 14, 11, 0, 'active', NULL, NULL, NULL, NULL, '2025-03-02 04:04:31', '2025-03-02 04:04:31'),
(70, 'Project 3', '2025-03-05', '2025-03-18', 'Both laptops are excellent for business use, offering solid performance with the Ryzen 7 Pro processor, great battery life, and strong security features. However, if you are looking for the latest technology with improved performance and potentially faster RAM, the HP EliteBook G8 would be the better choice', 7, 14, 11, 0, 'active', NULL, NULL, NULL, NULL, '2025-03-02 04:06:09', '2025-03-02 04:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `project_achievement_setups`
--

CREATE TABLE IF NOT EXISTS `project_achievement_setups` (
  `id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `indicator_id` bigint(20) unsigned NOT NULL,
  `activity_point` int(11) DEFAULT NULL,
  `activity_att_lt_30` int(11) DEFAULT NULL,
  `activity_att_lt_50` int(11) DEFAULT NULL,
  `activity_att_lt_80` int(11) DEFAULT NULL,
  `activity_att_lt_100` int(11) DEFAULT NULL,
  `survey_point_lt_30` int(11) DEFAULT NULL,
  `survey_point_lt_50` int(11) DEFAULT NULL,
  `survey_point_lt_80` int(11) DEFAULT NULL,
  `survey_point_lt_100` int(11) DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_achievement_setups`
--

INSERT INTO `project_achievement_setups` (`id`, `project_id`, `indicator_id`, `activity_point`, `activity_att_lt_30`, `activity_att_lt_50`, `activity_att_lt_80`, `activity_att_lt_100`, `survey_point_lt_30`, `survey_point_lt_50`, `survey_point_lt_80`, `survey_point_lt_100`, `status`, `created_at`, `updated_at`) VALUES
(33, 67, 237, 50, 5, 10, 15, 20, 10, 15, 25, 30, 'active', '2025-02-22 09:47:27', '2025-02-22 09:47:27'),
(34, 68, 241, 10, 2, 3, 4, 5, 2, 3, 4, 5, 'active', '2025-03-02 04:32:10', '2025-03-02 04:32:10'),
(35, 68, 242, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2025-03-02 04:36:30', '2025-03-02 04:36:30'),
(36, 68, 243, 20, NULL, NULL, NULL, NULL, 2, 3, 4, 5, 'active', '2025-03-02 04:36:57', '2025-03-02 04:36:57'),
(37, 69, 245, 10, 2, 3, 4, 5, 2, 3, 4, 5, 'active', '2025-03-02 04:50:54', '2025-03-02 04:50:54'),
(38, 70, 247, 10, 2, 3, 4, 5, 2, 3, 4, 5, 'active', '2025-03-04 04:10:57', '2025-03-04 04:10:57');

-- --------------------------------------------------------

--
-- Stand-in structure for view `project_achievement_views`
--
CREATE TABLE IF NOT EXISTS `project_achievement_views` (
`project_id` bigint(20) unsigned
,`achievement` decimal(65,8)
);

-- --------------------------------------------------------

--
-- Table structure for table `project_activities`
--

CREATE TABLE IF NOT EXISTS `project_activities` (
  `id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `indicator_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_surveyable` tinyint(1) NOT NULL DEFAULT '0',
  `beneficiary_attendance` tinyint(1) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_activities`
--

INSERT INTO `project_activities` (`id`, `project_id`, `indicator_id`, `title`, `description`, `is_surveyable`, `beneficiary_attendance`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(114, 67, 237, 'Baseline survey', '<p><span lang="EN-GB" style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;">As the proposed project will be a continuation of the previous phase, baseline survey will be conducted in both the existing project area and in extended areas as well. In the proposed phase, 04 new villages namely </span></span></span><span style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;">Debduar</span></span></span><span style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"> under Chadkali union, </span></span></span><span lang="PT" style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;">Katipara</span></span></span><span style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;">, </span></span></span><span lang="PT" style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;">Raruli Purbopara</span></span></span><span style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;">, and </span></span></span><span lang="PT" style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;">Rarulibag under Raruli union</span></span></span><span lang="EN-GB" style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"> in Paikgacha Upazila have been selected based on the number of seagoing traditional fishers to work in a holistic approach with this community. It is to be noted that, in the newly selected working areas, AOSED will be exclusively engaged with seagoing traditional fishing communities. In order to conduct baseline survey, a structured questionnaire will be used in order to assess current knowledge and practice of the beneficiaries on disaster preparedness, their level of vulnerabilities, livelihood status, and overall risk factors in professional as well as family life. The survey will be conducted by external consultant/consultancy farm which will be completed within 1<sup>st</sup> quarter of the project period.</span></span></span></p>', 0, 0, 0, 'active', '2025-02-22 08:46:26', '2025-02-22 09:27:47'),
(115, 67, 237, 'Distribution of ID Card for Seagoing Fishers', '<p><span style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;">Newly selected seagoing fisher beneficiaries will be provided identity card from the project. This ID card will be serving two purposes (1) prove their identity as the project beneficiary and (2) can be useful in emergency situations e.g. getting washed away by cyclones and rescued. This is to be noted that, in the previous phase of the project, total 400 beneficiary fishermen were provided this ID card. During this phase of the project, 1000 new seagoing fishermen will be provided this card. Printing and distribution of ID cards will be completed by the end of 2<sup>nd</sup> quarter of the project.</span></span></span></p>', 0, 0, 0, 'active', '2025-02-22 09:28:31', '2025-02-22 09:28:31'),
(116, 67, 237, 'Developing software for beneficiary’s database', '<p><span style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;">A comprehensive database on the selected beneficiary households will be developed where information on the livelihood status, family details, risk factors (both climatic and economical), will be stored. This database will be updated in every six months to monitor the changes made through the interventions of the project. The database will be one of the monitoring tools for decision making process and evaluate whether the project is on the right track or not. In order to ensure the security of the database, standard measure like firewall, encryption, proper credentials for accessing the database will be ensured. The trial version of database software will be developed by hired software farm within 3<sup>rd</sup> quarter of the project and data entry will be commenced from 5<sup>th</sup> quarter after fixing the errors.</span></span></span></p>', 0, 0, 0, 'active', '2025-02-22 09:29:40', '2025-02-22 09:29:40'),
(117, 67, 237, 'Formation of Male Fisher Group', '<p>In the current phase of the project, there are <b>33 </b>groups consisting male seagoing fishers. For the proposed project, <b>28</b> new male fisher groups will be formed in the newly selected unions. These groups will be formed within 2<sup>nd</sup> quarter of the project. In total there will be 61 groups consisting of male fishers during the proposed project period. Composition of the new groups are as follows:<!--</p--></p>\n\n<p style="margin-bottom:11px; margin-left:12px; text-align:justify">&nbsp;</p>\n\n<table class="MsoTableGrid" style="border-collapse:collapse;border:none;width:100.0%;" width="100%">\n	<tbody>\n		<tr>\n			<td colspan="2" style="border-bottom:1px solid black; width:52%; padding:0in 7px 0in 7px; height:44px; border-top:1px solid black; border-right:1px solid black; border-left:1px solid black">\n			<p align="center" style="text-align:center"><span style="font-size:10pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"><b><span lang="EN-GB" style="line-height:115%">Description of groups</span></b></span></span></span></p>\n			</td>\n			<td style="border-bottom:1px solid black; width:23%; padding:0in 7px 0in 7px; height:44px; border-top:1px solid black; border-right:1px solid black; border-left:none">\n			<p align="center" style="text-align:center"><span style="font-size:10pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"><b><span lang="EN-GB" style="line-height:115%">Group members</span></b></span></span></span></p>\n			</td>\n			<td style="border-bottom:1px solid black; width:23%; padding:0in 7px 0in 7px; height:44px; border-top:1px solid black; border-right:1px solid black; border-left:none">\n			<p align="center" style="text-align:center"><span style="font-size:10pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"><b><span lang="EN-GB" style="line-height:115%">Average number of members in each group</span></b></span></span></span></p>\n			</td>\n		</tr>\n		<tr>\n			<td style="border-bottom:1px solid black; width:15%; padding:0in 7px 0in 7px; height:44px; border-top:none; border-right:1px solid black; border-left:1px solid black">\n			<p><span style="font-size:10pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"><b><span lang="EN-GB" style="line-height:115%">New group</span></b></span></span></span></p>\n			</td>\n			<td style="border-bottom:1px solid black; width:37%; padding:0in 7px 0in 7px; height:44px; border-top:none; border-right:1px solid black; border-left:none">\n			<p align="center" style="text-align:center"><span style="font-size:10pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"><span lang="EN-GB" style="line-height:115%">28</span></span></span></span></p>\n			</td>\n			<td style="border-bottom:1px solid black; width:23%; padding:0in 7px 0in 7px; height:44px; border-top:none; border-right:1px solid black; border-left:none" valign="bottom">\n			<p align="center" style="text-align:center"><span style="font-size:10pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"><span lang="EN-GB" style="line-height:115%">524</span></span></span></span></p>\n			</td>\n			<td rowspan="2" style="border-bottom:1px solid black; width:23%; padding:0in 7px 0in 7px; height:44px; border-top:none; border-right:1px solid black; border-left:none">\n			<p align="center" style="text-align:center"><span style="font-size:10pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"><span lang="EN-GB" style="line-height:115%">21-25</span></span></span></span></p>\n			</td>\n		</tr>\n		<tr>\n			<td style="border-bottom:1px solid black; width:15%; padding:0in 7px 0in 7px; height:22px; border-top:none; border-right:1px solid black; border-left:1px solid black">\n			<p align="center" style="text-align:center"><span style="font-size:10pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"><b><span lang="EN-GB" style="line-height:115%">Old groups</span></b></span></span></span></p>\n			</td>\n			<td style="border-bottom:1px solid black; width:37%; padding:0in 7px 0in 7px; height:22px; border-top:none; border-right:1px solid black; border-left:none" valign="bottom">\n			<p align="center" style="text-align:center"><span style="font-size:10pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"><span lang="EN-GB" style="line-height:115%">33</span></span></span></span></p>\n			</td>\n			<td style="border-bottom:1px solid black; width:23%; padding:0in 7px 0in 7px; height:22px; border-top:none; border-right:1px solid black; border-left:none" valign="bottom">\n			<p align="center" style="text-align:center"><span style="font-size:10pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"><span lang="EN-GB" style="line-height:115%">726</span></span></span></span></p>\n			</td>\n		</tr>\n	</tbody>\n</table>', 0, 0, 0, 'active', '2025-02-22 09:32:45', '2025-02-22 09:42:14'),
(118, 67, 237, 'Workshop on to identifying issues and make strategy for popularize needs and demands of the community', '<p style="list-style-type:none"><span style="font-size:10pt"><span style="line-height:107%"><span style="tab-stops:.5in"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;"><span style="line-height:107%">To prioritizing the issues and make strategy for popularize needs and demands of the community due to adverse impact of climate change, climate injustice, climate financing in local level etc. A daylong workshop will be conducted with the UCJF and DCJF members on following topics to identifying and make strategy for popularize needs and demands of the community. AOSED Senior staff (Program officer) will conducting orientation sessions on selected topic. The workshop will be conducted 4th Quarter of the Project (30 participants). There will be 1 workshop and it will be held in Khulna.</span></span></span></span></span></p>', 1, 1, 0, 'active', '2025-02-22 09:35:08', '2025-02-22 09:35:25'),
(119, 67, 239, 'Seed and fertilizer support to male farmers', '<p><span style="font-size:10.0pt"><span style="line-height:115%"><span style="font-family:&quot;Georgia&quot;,&quot;serif&quot;">Saline tolerant high yielding variety of rice seeds in &lsquo;Boro&rsquo; season (October-November). In Total 220) will receive this support during the 3rd, 7<sup>th</sup>, and 11<sup>th</sup> quarter of the project period.</span></span></span></p>', 1, 1, 0, 'active', '2025-02-22 10:11:05', '2025-02-22 10:11:05'),
(120, 68, 241, 'Project 1 Indicator 1 Activity 1', NULL, 1, 1, 0, 'active', '2025-03-02 04:12:51', '2025-03-02 04:12:51'),
(121, 68, 241, 'Project 1 Indicator 1 Activity 2', NULL, 0, 1, 0, 'active', '2025-03-02 04:13:03', '2025-03-02 04:13:03'),
(122, 68, 242, 'Project 1 Indicator 2 Activity 1', NULL, 0, 0, 0, 'active', '2025-03-02 04:13:26', '2025-03-02 04:13:26'),
(123, 68, 243, 'Project 1 Indicator 3 Activity 1', NULL, 1, 0, 0, 'active', '2025-03-02 04:13:49', '2025-03-02 04:13:49'),
(124, 68, 243, 'Project 1 Indicator 3 Activity 2', NULL, 1, 1, 0, 'active', '2025-03-02 04:49:21', '2025-03-02 04:49:21'),
(125, 69, 245, 'Project 2 Indicator 1 Activity 1', NULL, 1, 1, 0, 'active', '2025-03-02 04:50:27', '2025-03-02 04:50:27'),
(126, 70, 247, 'Project 3 Indicator 1 Activity 1', NULL, 1, 1, 0, 'active', '2025-03-04 04:03:33', '2025-03-04 04:03:33');

-- --------------------------------------------------------

--
-- Stand-in structure for view `project_attendance_views`
--
CREATE TABLE IF NOT EXISTS `project_attendance_views` (
`project_id` bigint(20) unsigned
,`average_attendance` decimal(45,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `project_survey_point_report_views`
--
CREATE TABLE IF NOT EXISTS `project_survey_point_report_views` (
`project_id` bigint(20) unsigned
,`average_survey` decimal(45,4)
);

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE IF NOT EXISTS `relations` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `title`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Father', 1, 'deactive', '2024-10-14 00:25:05', '2024-12-25 11:04:57'),
(2, 'Sister', 2, 'active', '2024-10-19 22:16:04', '2024-10-19 22:16:04'),
(3, 'Mother', 3, 'active', '2024-10-19 22:16:11', '2024-10-19 22:16:11'),
(4, 'Brother', 4, 'active', '2024-12-25 11:04:19', '2024-12-25 11:04:19');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'active', '2024-06-02 06:52:42', '2024-06-02 06:52:42'),
(2, 'Nogor', 'active', '2024-06-02 06:52:42', '2024-06-02 06:52:42'),
(3, 'Nogor Solutions Limited', 'active', '2024-09-18 03:35:06', '2024-09-18 03:35:06'),
(4, 'Ultra Admin', 'active', '2025-02-26 08:55:33', '2025-02-26 08:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE IF NOT EXISTS `role_permissions` (
  `role_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(2, 1),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(1, 8),
(2, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(1, 75),
(2, 75),
(1, 76),
(2, 76),
(3, 76),
(4, 76),
(1, 77),
(2, 77),
(3, 77),
(4, 77),
(1, 78),
(2, 78),
(3, 78),
(4, 78),
(1, 79),
(2, 79),
(3, 79),
(4, 79),
(1, 80),
(2, 80),
(3, 80),
(4, 80),
(1, 81),
(2, 81),
(3, 81),
(4, 81),
(1, 82),
(2, 82),
(3, 82),
(4, 82),
(1, 115),
(2, 115),
(1, 116),
(2, 116),
(3, 116),
(4, 116),
(1, 117),
(2, 117),
(1, 118),
(2, 118),
(3, 118),
(4, 118),
(1, 119),
(2, 119),
(3, 119),
(4, 119),
(1, 120),
(2, 120),
(3, 120),
(4, 120),
(1, 121),
(2, 121),
(3, 121),
(4, 121),
(1, 122),
(2, 122),
(3, 122),
(4, 122),
(1, 123),
(2, 123),
(3, 123),
(4, 123),
(1, 124),
(2, 124),
(3, 124),
(4, 124),
(1, 125),
(2, 125),
(1, 126),
(2, 126),
(3, 126),
(4, 126),
(1, 127),
(2, 127),
(3, 127),
(4, 127),
(1, 128),
(2, 128),
(3, 128),
(4, 128),
(1, 129),
(2, 129),
(3, 129),
(4, 129),
(1, 130),
(2, 130),
(3, 130),
(4, 130),
(1, 131),
(2, 131),
(3, 131),
(4, 131),
(1, 132),
(2, 132),
(3, 132),
(4, 132),
(1, 133),
(2, 133),
(1, 134),
(2, 134),
(3, 134),
(4, 134),
(1, 135),
(2, 135),
(3, 135),
(4, 135),
(1, 136),
(2, 136),
(3, 136),
(4, 136),
(1, 137),
(2, 137),
(3, 137),
(4, 137),
(1, 138),
(2, 138),
(3, 138),
(4, 138),
(1, 139),
(2, 139),
(3, 139),
(4, 139),
(1, 140),
(2, 140),
(3, 140),
(4, 140),
(1, 141),
(2, 141),
(1, 142),
(2, 142),
(3, 142),
(4, 142),
(1, 143),
(2, 143),
(3, 143),
(4, 143),
(1, 144),
(2, 144),
(3, 144),
(4, 144),
(1, 145),
(2, 145),
(3, 145),
(4, 145),
(1, 146),
(2, 146),
(3, 146),
(4, 146),
(1, 147),
(2, 147),
(3, 147),
(4, 147),
(1, 148),
(2, 148),
(3, 148),
(4, 148),
(1, 149),
(2, 149),
(3, 149),
(4, 149),
(1, 198),
(2, 198),
(1, 202),
(2, 202),
(1, 207),
(2, 207),
(1, 208),
(2, 208),
(3, 208),
(4, 208),
(1, 209),
(2, 209),
(3, 209),
(4, 209),
(1, 210),
(2, 210),
(3, 210),
(4, 210),
(1, 211),
(2, 211),
(3, 211),
(4, 211),
(1, 212),
(2, 212),
(3, 212),
(4, 212),
(1, 213),
(2, 213),
(3, 213),
(4, 213),
(1, 214),
(2, 214),
(3, 214),
(4, 214),
(1, 215),
(2, 215),
(3, 215),
(4, 215),
(1, 224),
(2, 224),
(3, 224),
(4, 224),
(1, 225),
(2, 225),
(1, 226),
(2, 226),
(4, 226),
(1, 227),
(2, 227),
(4, 227),
(1, 228),
(2, 228),
(4, 228),
(1, 229),
(2, 229),
(4, 229),
(1, 230),
(2, 230),
(4, 230),
(1, 231),
(2, 231),
(4, 231),
(1, 232),
(2, 232),
(4, 232),
(1, 233),
(2, 233),
(1, 234),
(2, 234),
(4, 234),
(1, 235),
(2, 235),
(4, 235),
(1, 236),
(2, 236),
(4, 236),
(1, 237),
(2, 237),
(4, 237),
(1, 238),
(2, 238),
(4, 238),
(1, 239),
(2, 239),
(4, 239),
(1, 240),
(2, 240),
(4, 240),
(1, 241),
(2, 241),
(1, 242),
(2, 242),
(4, 242),
(1, 243),
(2, 243),
(4, 243),
(1, 244),
(2, 244),
(4, 244),
(1, 245),
(2, 245),
(4, 245),
(1, 246),
(2, 246),
(4, 246),
(1, 247),
(2, 247),
(4, 247),
(1, 248),
(2, 248),
(4, 248),
(1, 249),
(2, 249),
(1, 250),
(2, 250),
(4, 250),
(1, 251),
(2, 251),
(4, 251),
(1, 252),
(2, 252),
(4, 252),
(1, 253),
(2, 253),
(4, 253),
(1, 254),
(2, 254),
(4, 254),
(1, 255),
(2, 255),
(4, 255),
(1, 256),
(2, 256),
(4, 256),
(1, 257),
(2, 257),
(1, 258),
(2, 258),
(4, 258),
(1, 259),
(2, 259),
(4, 259),
(1, 260),
(2, 260),
(4, 260),
(1, 261),
(2, 261),
(4, 261),
(1, 262),
(2, 262),
(4, 262),
(1, 263),
(2, 263),
(4, 263),
(1, 264),
(2, 264),
(4, 264),
(1, 265),
(2, 265),
(1, 266),
(2, 266),
(4, 266),
(1, 267),
(2, 267),
(4, 267),
(1, 268),
(2, 268),
(4, 268),
(1, 269),
(2, 269),
(4, 269),
(1, 270),
(2, 270),
(4, 270),
(1, 271),
(2, 271),
(4, 271),
(1, 272),
(2, 272),
(4, 272),
(1, 273),
(2, 273),
(1, 274),
(2, 274),
(4, 274),
(1, 275),
(2, 275),
(4, 275),
(1, 276),
(2, 276),
(4, 276),
(1, 277),
(2, 277),
(4, 277),
(1, 278),
(2, 278),
(4, 278),
(1, 279),
(2, 279),
(4, 279),
(1, 280),
(2, 280),
(4, 280),
(1, 281),
(2, 281),
(1, 282),
(2, 282),
(4, 282),
(1, 283),
(2, 283),
(4, 283),
(1, 284),
(2, 284),
(4, 284),
(1, 285),
(2, 285),
(4, 285),
(1, 286),
(2, 286),
(4, 286),
(1, 287),
(2, 287),
(4, 287),
(1, 288),
(2, 288),
(4, 288),
(1, 289),
(2, 289),
(1, 290),
(2, 290),
(4, 290),
(1, 291),
(2, 291),
(4, 291),
(1, 292),
(2, 292),
(4, 292),
(1, 293),
(2, 293),
(4, 293),
(1, 294),
(2, 294),
(4, 294),
(1, 295),
(2, 295),
(4, 295),
(1, 296),
(2, 296),
(4, 296),
(1, 297),
(2, 297),
(1, 298),
(2, 298),
(4, 298),
(1, 299),
(2, 299),
(4, 299),
(1, 300),
(2, 300),
(4, 300),
(1, 301),
(2, 301),
(4, 301),
(1, 302),
(2, 302),
(4, 302),
(1, 303),
(2, 303),
(4, 303),
(1, 304),
(2, 304),
(4, 304),
(1, 305),
(2, 305),
(1, 306),
(2, 306),
(4, 306),
(1, 307),
(2, 307),
(4, 307),
(1, 308),
(2, 308),
(4, 308),
(1, 309),
(2, 309),
(4, 309),
(1, 310),
(2, 310),
(4, 310),
(1, 311),
(2, 311),
(4, 311),
(1, 312),
(2, 312),
(4, 312),
(1, 313),
(2, 313),
(1, 314),
(2, 314),
(4, 314),
(1, 315),
(2, 315),
(4, 315),
(1, 316),
(2, 316),
(4, 316),
(1, 317),
(2, 317),
(4, 317),
(1, 318),
(2, 318),
(4, 318),
(1, 319),
(2, 319),
(4, 319),
(1, 320),
(2, 320),
(4, 320),
(1, 321),
(2, 321),
(1, 322),
(2, 322),
(4, 322),
(1, 323),
(2, 323),
(4, 323),
(1, 324),
(2, 324),
(4, 324),
(1, 325),
(2, 325),
(4, 325),
(1, 326),
(2, 326),
(4, 326),
(1, 327),
(2, 327),
(4, 327),
(1, 328),
(2, 328),
(4, 328),
(1, 329),
(2, 329),
(1, 330),
(2, 330),
(4, 330),
(1, 331),
(2, 331),
(4, 331),
(1, 332),
(2, 332),
(4, 332),
(1, 333),
(2, 333),
(4, 333),
(1, 334),
(2, 334),
(4, 334),
(1, 335),
(2, 335),
(4, 335),
(1, 336),
(2, 336),
(4, 336),
(1, 337),
(2, 337),
(4, 337),
(1, 338),
(2, 338),
(1, 339),
(2, 339),
(4, 339),
(1, 340),
(2, 340),
(4, 340),
(1, 341),
(2, 341),
(4, 341),
(1, 342),
(2, 342),
(4, 342),
(1, 343),
(2, 343),
(4, 343),
(1, 344),
(2, 344),
(4, 344),
(1, 345),
(2, 345),
(4, 345),
(1, 346),
(2, 346),
(1, 347),
(2, 347),
(4, 347),
(1, 348),
(2, 348),
(4, 348),
(1, 349),
(2, 349),
(4, 349),
(1, 350),
(2, 350),
(4, 350),
(1, 351),
(2, 351),
(4, 351),
(1, 352),
(2, 352),
(4, 352),
(1, 353),
(2, 353),
(4, 353),
(1, 354),
(2, 354),
(1, 355),
(2, 355),
(4, 355),
(1, 356),
(2, 356),
(4, 356),
(1, 357),
(2, 357),
(4, 357),
(1, 358),
(2, 358),
(4, 358),
(1, 359),
(2, 359),
(4, 359),
(1, 360),
(2, 360),
(4, 360),
(1, 361),
(2, 361),
(4, 361),
(1, 362),
(2, 362),
(1, 363),
(2, 363),
(4, 363),
(1, 364),
(2, 364),
(4, 364),
(1, 365),
(2, 365),
(4, 365),
(1, 366),
(2, 366),
(4, 366),
(1, 367),
(2, 367),
(4, 367),
(1, 368),
(2, 368),
(4, 368),
(1, 369),
(2, 369),
(4, 369),
(1, 370),
(2, 370),
(1, 371),
(2, 371),
(4, 371),
(1, 372),
(2, 372),
(4, 372),
(1, 373),
(2, 373),
(4, 373),
(1, 374),
(2, 374),
(4, 374),
(1, 375),
(2, 375),
(4, 375),
(1, 376),
(2, 376),
(4, 376),
(1, 377),
(2, 377),
(4, 377),
(1, 378),
(2, 378),
(1, 379),
(2, 379),
(4, 379),
(1, 380),
(2, 380),
(4, 380),
(1, 381),
(2, 381),
(4, 381),
(1, 382),
(2, 382),
(4, 382),
(1, 383),
(2, 383),
(4, 383),
(1, 384),
(2, 384),
(4, 384),
(1, 385),
(2, 385),
(4, 385),
(1, 386),
(2, 386),
(4, 386),
(1, 387),
(2, 387),
(4, 387),
(1, 388),
(2, 388),
(4, 388),
(1, 389),
(2, 389),
(1, 390),
(2, 390),
(4, 390),
(1, 391),
(2, 391),
(1, 392),
(2, 392),
(4, 392),
(1, 393),
(2, 393),
(4, 393),
(1, 394),
(2, 394),
(4, 394),
(1, 395),
(2, 395),
(4, 395),
(1, 396),
(2, 396),
(4, 396),
(1, 397),
(2, 397),
(4, 397),
(1, 398),
(2, 398),
(4, 398),
(1, 399),
(2, 399),
(1, 400),
(2, 400),
(4, 400),
(1, 401),
(2, 401),
(4, 401),
(1, 402),
(2, 402),
(4, 402),
(1, 403),
(2, 403),
(4, 403),
(1, 404),
(2, 404),
(4, 404),
(1, 405),
(2, 405),
(4, 405),
(1, 406),
(2, 406),
(4, 406),
(1, 407),
(2, 407),
(1, 408),
(2, 408),
(4, 408),
(1, 409),
(2, 409),
(4, 409),
(1, 410),
(2, 410),
(4, 410),
(1, 411),
(2, 411),
(4, 411),
(1, 412),
(2, 412),
(4, 412),
(1, 413),
(2, 413),
(4, 413),
(1, 414),
(2, 414),
(4, 414);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE IF NOT EXISTS `site_settings` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile1` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci,
  `logo_small` text COLLATE utf8mb4_unicode_ci,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `developed_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `developed_by_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` text COLLATE utf8mb4_unicode_ci,
  `tw` text COLLATE utf8mb4_unicode_ci,
  `ln` text COLLATE utf8mb4_unicode_ci,
  `yt` text COLLATE utf8mb4_unicode_ci,
  `map` text COLLATE utf8mb4_unicode_ci,
  `is_meta` tinyint(4) NOT NULL DEFAULT '0',
  `meta` longtext COLLATE utf8mb4_unicode_ci,
  `sidebar_footer_color` text COLLATE utf8mb4_unicode_ci,
  `sidebar_top_color` text COLLATE utf8mb4_unicode_ci,
  `sidebar_color` text COLLATE utf8mb4_unicode_ci,
  `navbar_color` text COLLATE utf8mb4_unicode_ci,
  `breadcrumb_color` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `title`, `short_title`, `contact_email`, `feedback_email`, `mobile1`, `mobile2`, `logo`, `logo_small`, `favicon`, `address`, `developed_by`, `developed_by_url`, `web`, `fb`, `tw`, `ln`, `yt`, `map`, `is_meta`, `meta`, `sidebar_footer_color`, `sidebar_top_color`, `sidebar_color`, `navbar_color`, `breadcrumb_color`, `created_at`, `updated_at`) VALUES
(1, 'An Organization for Socio-Economic Development', 'AOSED', 'info@aosed.org', 'nsl@gmail.com', '01713255111', '01700000000', '{"600x300":"upload\\/logo\\/600x300\\/8485bca6-690c-4e5d-afce-121b870cb6f6.avif","300x80":"upload\\/logo\\/300x80\\/8803c0fc-b3fb-440d-9fc5-c50c42dcb3c2.avif","100x30":"upload\\/logo\\/100x30\\/f0ab44b8-908f-4e57-84da-0e893efc4dd8.avif","original":"upload\\/logo\\/original\\/801f5c3b-e64d-4bfc-8d1e-43658122145a.avif"}', '{"600x300":"upload\\/logo_small\\/600x300\\/0944a97c-0abe-46c4-8a66-9072085d3b9c.avif","300x80":"upload\\/logo_small\\/300x80\\/0e676564-9736-4d5c-bdfe-8f71cf48bdf9.avif","100x40":"upload\\/logo_small\\/100x40\\/352573fe-3525-4176-ace5-a16f33711aa3.avif","original":"upload\\/logo_small\\/original\\/3a736991-2b7d-49af-ac4a-6f814bf3c7b1.avif"}', 'upload/conf/241218122951-8559agriculture.png', '334, Sher-A-Bangla Road (1st floor),Khulna-9100, Bangladesh', 'Nogor Solutions', 'https://nogorsolutions.com/', 'https://aosed.org/', 'https://www.facebook.com/AOSED.BD', 'https://www.instagram.com/aosed_khulna/', 'https://www.linkedin.com/company/aosed/', 'https://www.youtube.com/@aosed', NULL, 0, NULL, '#000000', '#000000', '#2f3a4e', '#61daff', '#ffffff', '2024-06-02 06:52:42', '2025-02-19 10:32:32');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `id` bigint(20) unsigned NOT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`, `sorting`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(7, 18, 'Khulna', 1, 'active', NULL, '2025-02-22 08:33:08', '2025-02-22 08:33:08'),
(8, 18, 'Dhaka', 2, 'active', NULL, '2025-02-25 09:31:12', '2025-02-25 09:31:12'),
(9, 18, 'Rajshahi', 3, 'active', NULL, '2025-03-12 06:29:22', '2025-03-12 06:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE IF NOT EXISTS `surveys` (
  `id` bigint(20) unsigned NOT NULL,
  `survey_number` bigint(20) NOT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `indicator_id` bigint(20) unsigned DEFAULT NULL,
  `activity_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `survey_date` datetime DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `surveys`
--

INSERT INTO `surveys` (`id`, `survey_number`, `project_id`, `indicator_id`, `activity_id`, `title`, `survey_date`, `remarks`, `created_at`, `updated_at`) VALUES
(58, 111154936, 67, 239, 119, 'Use of output  - February 2025', '2025-02-22 00:00:00', NULL, '2025-02-22 10:29:58', '2025-02-22 10:29:58'),
(65, 111845329, 68, 241, 120, 'Survey for Project 1 Indicator 1 Activity 1 - March 2025', '2025-03-02 00:00:00', NULL, '2025-03-02 04:25:54', '2025-03-02 04:25:54'),
(66, 111681765, 68, 241, 120, 'Survey for Project 1 Indicator 1 Activity 1 - March 2025', '2025-03-02 00:00:00', NULL, '2025-03-02 08:35:37', '2025-03-02 08:35:37'),
(67, 111584800, 68, 241, 120, 'Survey for Project 1 Indicator 1 Activity 1 - March 2025', '2025-03-02 00:00:00', NULL, '2025-03-02 09:27:49', '2025-03-02 09:27:49'),
(68, 111584698, 67, 237, 115, 'Nee', '2025-03-03 00:00:00', 'TV TV rg er ege', '2025-03-03 03:59:20', '2025-03-03 03:59:20'),
(69, 111304882, 68, 241, 120, 'Survey for Project 1 Indicator 1 Activity 1 - March 2025', '2025-03-03 00:00:00', 'ZDC', '2025-03-03 04:14:19', '2025-03-03 04:14:19'),
(70, 111293957, 70, 247, 126, 'Survey for Project 3 Indicator 1 Activity 1 - March 2025', '2025-03-04 00:00:00', NULL, '2025-03-04 04:11:44', '2025-03-04 04:11:44'),
(71, 111738395, 67, 239, 117, 'Ttff', '2025-03-11 00:00:00', 'Rty', '2025-03-04 16:21:29', '2025-03-04 16:21:29'),
(72, 111850117, 67, 239, 117, 'Ttff', '2025-03-11 00:00:00', 'Rty', '2025-03-04 16:21:31', '2025-03-04 16:21:31'),
(73, 111127396, 67, 239, 117, 'Ttff', '2025-03-11 00:00:00', 'Rty', '2025-03-04 16:21:47', '2025-03-04 16:21:47'),
(74, 111830581, 67, 240, 119, 'Rhg', '2025-03-17 00:00:00', 'Dfgh', '2025-03-04 16:52:13', '2025-03-04 16:52:13'),
(75, 111761843, 68, 239, 117, 'Gghhjj', '2025-03-06 00:00:00', 'Hhh', '2025-03-06 05:23:50', '2025-03-06 05:23:50'),
(76, 111676100, 67, 237, 114, 'dgf', '2025-03-06 00:00:00', 'hhg', '2025-03-06 08:19:49', '2025-03-06 08:19:49');

-- --------------------------------------------------------

--
-- Table structure for table `survey_answers`
--

CREATE TABLE IF NOT EXISTS `survey_answers` (
  `id` bigint(20) unsigned NOT NULL,
  `survey_question_id` bigint(20) unsigned DEFAULT NULL,
  `answer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_answers`
--

INSERT INTO `survey_answers` (`id`, `survey_question_id`, `answer`, `mark`, `created_at`, `updated_at`) VALUES
(177, 59, 'Yes', 5, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(178, 59, 'No', 0, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(179, 60, NULL, NULL, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(180, 61, NULL, NULL, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(181, 62, 'BR 69', 5, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(182, 62, 'BR 28', 5, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(183, 62, 'BR 91', 5, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(184, 62, 'Local Varity', 5, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(185, 62, 'BR 48', 5, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(186, 63, 'Very Satisfied', 5, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(187, 63, 'Satisfied', 5, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(188, 63, 'Dissatisfied', 5, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(189, 63, 'Very Dissatisfied', 5, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(190, 64, 'Budget Constraints', 1, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(191, 64, 'Resource Availability', 1, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(192, 64, 'Communication Issues', 1, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(193, 64, 'Customer Support', 1, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(194, 64, 'Quality of Water', 1, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(195, 65, NULL, NULL, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(196, 66, 'Daily', 5, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(197, 66, 'Weekly', 5, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(198, 66, 'Monthly', 5, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(199, 66, 'Rarely', 5, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(200, 67, 'Project Management Software', 1, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(201, 67, 'Emails', 1, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(202, 67, 'Meetings', 1, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(203, 67, 'Reports', 1, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(204, 67, 'Networking Opportunities', 1, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(205, 68, NULL, NULL, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(206, 69, 'Project Manager', 5, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(207, 69, 'Team Member', 5, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(208, 69, 'Stakeholder', 5, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(209, 69, 'Dept. Manager', 5, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(210, 70, 'Communication', 1, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(211, 70, 'Timeline', 1, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(212, 70, 'Budget', 1, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(213, 70, 'Quality', 1, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(214, 70, 'Quantity', 1, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(215, 71, NULL, NULL, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(216, 72, 'Email', 1, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(217, 72, 'Team Meetings', 1, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(218, 72, 'Project Management Tool', 1, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(219, 72, 'Project Report', 1, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(220, 72, 'Project Board', 1, '2025-03-04 04:19:52', '2025-03-04 04:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `survey_beneficiaries`
--

CREATE TABLE IF NOT EXISTS `survey_beneficiaries` (
  `id` bigint(20) unsigned NOT NULL,
  `survey_id` bigint(20) unsigned NOT NULL,
  `beneficiary_id` bigint(20) unsigned NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `survey_date` date NOT NULL,
  `total_mark` int(11) DEFAULT NULL,
  `admin_id` bigint(20) unsigned NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_beneficiaries`
--

INSERT INTO `survey_beneficiaries` (`id`, `survey_id`, `beneficiary_id`, `group_id`, `survey_date`, `total_mark`, `admin_id`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 65, 109, NULL, '2025-03-02', 11, 1, NULL, '2025-03-02 05:48:27', '2025-03-02 05:48:27'),
(2, 65, 110, NULL, '2025-03-02', 9, 1, NULL, '2025-03-02 05:49:13', '2025-03-02 05:49:13'),
(3, 65, 111, NULL, '2025-03-02', 5, 1, NULL, '2025-03-02 05:50:22', '2025-03-02 05:50:22'),
(4, 65, 112, NULL, '2025-03-02', 15, 1, NULL, '2025-03-02 05:50:50', '2025-03-02 05:50:50'),
(5, 65, 113, NULL, '2025-03-02', 17, 1, NULL, '2025-03-02 05:51:37', '2025-03-02 05:51:37'),
(6, 66, 109, NULL, '2025-03-02', 13, 1, NULL, '2025-03-02 08:36:18', '2025-03-02 08:36:18'),
(7, 66, 110, NULL, '2025-03-02', 7, 1, NULL, '2025-03-02 08:36:39', '2025-03-02 08:36:39'),
(8, 66, 111, NULL, '2025-03-02', 17, 1, NULL, '2025-03-02 08:37:04', '2025-03-02 08:37:04'),
(9, 66, 112, NULL, '2025-03-02', 19, 1, NULL, '2025-03-02 09:28:34', '2025-03-02 09:28:34'),
(10, 66, 113, NULL, '2025-03-02', 13, 1, NULL, '2025-03-02 09:30:57', '2025-03-02 09:30:57'),
(11, 67, 109, NULL, '2025-03-02', 19, 1, NULL, '2025-03-02 09:31:27', '2025-03-02 09:31:27'),
(12, 67, 110, NULL, '2025-03-02', 18, 1, NULL, '2025-03-02 09:31:47', '2025-03-02 09:31:47'),
(13, 67, 111, NULL, '2025-03-02', 16, 1, NULL, '2025-03-02 09:32:34', '2025-03-02 09:32:34'),
(14, 70, 109, NULL, '2025-03-04', 20, 1, NULL, '2025-03-04 04:20:52', '2025-03-04 04:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `survey_beneficiary_results`
--

CREATE TABLE IF NOT EXISTS `survey_beneficiary_results` (
  `id` bigint(20) unsigned NOT NULL,
  `survey_id` bigint(20) unsigned NOT NULL,
  `survey_beneficiary_id` bigint(20) unsigned NOT NULL,
  `question_id` bigint(20) unsigned NOT NULL,
  `answer` json DEFAULT NULL,
  `answer_text` text COLLATE utf8mb4_unicode_ci,
  `mark` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_beneficiary_results`
--

INSERT INTO `survey_beneficiary_results` (`id`, `survey_id`, `survey_beneficiary_id`, `question_id`, `answer`, `answer_text`, `mark`, `created_at`, `updated_at`) VALUES
(1, 65, 1, 63, '[186]', NULL, 5, '2025-03-02 05:48:27', '2025-03-02 05:48:27'),
(2, 65, 1, 64, '[190]', NULL, 1, '2025-03-02 05:48:27', '2025-03-02 05:48:27'),
(3, 65, 1, 65, NULL, 'On the other hand, if you find the G7 at a lower price point and are satisfied with previous generations but still need solid performance, the HP EliteBook G7 remains a very capable option. Your choice may depend on your specific needs, budget, and whether you prefer the latest features in the G8', 10, '2025-03-02 05:48:27', '2025-03-02 05:48:27'),
(4, 65, 2, 63, '[186]', NULL, 5, '2025-03-02 05:49:13', '2025-03-02 05:49:13'),
(5, 65, 2, 64, '[]', NULL, 0, '2025-03-02 05:49:13', '2025-03-02 05:49:13'),
(6, 65, 2, 65, NULL, 'On the other hand, if you find the G7 at a lower price point and are satisfied with previous generations but still need solid performance, the HP EliteBook G7 remains a very capable option. Your choice may depend on your specific needs, budget, and whether you prefer the latest features in the G8', 10, '2025-03-02 05:49:13', '2025-03-02 05:49:13'),
(7, 65, 3, 64, '[190]', NULL, 1, '2025-03-02 05:50:22', '2025-03-02 05:50:22'),
(8, 65, 3, 65, NULL, 'Both laptops are excellent for business use, offering solid performance with the Ryzen 7 Pro processor, great battery life, and strong security features. However, if you are looking for the latest technology with improved performance and potentially faster RAM, the HP EliteBook G8 would be the better choice', 10, '2025-03-02 05:50:22', '2025-03-02 05:50:22'),
(9, 65, 4, 63, '[186]', NULL, 5, '2025-03-02 05:50:50', '2025-03-02 05:50:50'),
(10, 65, 4, 64, '[190, 192, 193, 194]', NULL, 4, '2025-03-02 05:50:50', '2025-03-02 05:50:50'),
(11, 65, 4, 65, NULL, 'The G8 comes with Windows 11 Pro out of the box, while the G7 usually ships with Windows 10 Pro, which can be upgraded later but may require additional setup', 10, '2025-03-02 05:50:50', '2025-03-02 05:50:50'),
(12, 65, 5, 63, '[186]', NULL, 5, '2025-03-02 05:51:37', '2025-03-02 05:51:37'),
(13, 65, 5, 64, '[190, 192, 193, 194]', NULL, 4, '2025-03-02 05:51:37', '2025-03-02 05:51:37'),
(14, 65, 5, 65, NULL, 'The G8 comes with Windows 11 Pro out of the box, while the G7 usually ships with Windows 10 Pro, which can be upgraded later but may require additional setup', 10, '2025-03-02 05:51:37', '2025-03-02 05:51:37'),
(15, 66, 6, 63, '[187]', NULL, 5, '2025-03-02 08:36:18', '2025-03-02 08:36:18'),
(16, 66, 6, 64, '[190, 191, 194]', NULL, 3, '2025-03-02 08:36:18', '2025-03-02 08:36:18'),
(17, 66, 6, 65, NULL, 'Battery Life: The G7 generally has a slightly better battery life', 10, '2025-03-02 08:36:18', '2025-03-02 08:36:18'),
(18, 66, 7, 63, '[186]', NULL, 5, '2025-03-02 08:36:39', '2025-03-02 08:36:39'),
(19, 66, 7, 64, '[190, 191]', NULL, 2, '2025-03-02 08:36:39', '2025-03-02 08:36:39'),
(20, 66, 8, 63, '[186]', NULL, 5, '2025-03-02 08:37:04', '2025-03-02 08:37:04'),
(21, 66, 8, 64, '[193, 192, 191, 194]', NULL, 4, '2025-03-02 08:37:04', '2025-03-02 08:37:04'),
(22, 66, 8, 65, NULL, 'Battery Life: The G7 generally has a slightly better battery life', 10, '2025-03-02 08:37:04', '2025-03-02 08:37:04'),
(23, 66, 9, 64, '[191, 190, 193, 192]', NULL, 4, '2025-03-02 09:28:34', '2025-03-02 09:28:34'),
(24, 66, 9, 63, '[188]', NULL, 5, '2025-03-02 09:28:34', '2025-03-02 09:28:34'),
(25, 66, 9, 65, NULL, 'Generally, the G8 could be priced slightly higher due to newer technology and feature', 10, '2025-03-02 09:28:34', '2025-03-02 09:28:34'),
(26, 66, 10, 63, '[186]', NULL, 5, '2025-03-02 09:30:57', '2025-03-02 09:30:57'),
(27, 66, 10, 64, '[190, 191, 192]', NULL, 3, '2025-03-02 09:30:57', '2025-03-02 09:30:57'),
(28, 66, 10, 65, NULL, 'Generally, the G8 could be priced slightly higher due to newer technology and feature', 10, '2025-03-02 09:30:57', '2025-03-02 09:30:57'),
(29, 67, 11, 63, '[186]', NULL, 5, '2025-03-02 09:31:27', '2025-03-02 09:31:27'),
(30, 67, 11, 64, '[190, 191, 192, 193]', NULL, 4, '2025-03-02 09:31:27', '2025-03-02 09:31:27'),
(31, 67, 11, 65, NULL, 'Generally, the G8 could be priced slightly higher due to newer technology and feature', 10, '2025-03-02 09:31:27', '2025-03-02 09:31:27'),
(32, 67, 12, 63, '[186]', NULL, 5, '2025-03-02 09:31:47', '2025-03-02 09:31:47'),
(33, 67, 12, 64, '[190, 191, 192, 193, 194]', NULL, 5, '2025-03-02 09:31:47', '2025-03-02 09:31:47'),
(34, 67, 12, 65, NULL, 'Generally, the G8 could be priced slightly higher due to newer technology and feature', 10, '2025-03-02 09:31:47', '2025-03-02 09:31:47'),
(35, 67, 13, 63, '[186]', NULL, 5, '2025-03-02 09:32:34', '2025-03-02 09:32:34'),
(36, 67, 13, 64, '[190, 191, 192, 193]', NULL, 4, '2025-03-02 09:32:34', '2025-03-02 09:32:34'),
(37, 67, 13, 65, NULL, 'Generally, the G8 could be priced slightly higher due to newer technology and feature', 10, '2025-03-02 09:32:34', '2025-03-02 09:32:34'),
(38, 70, 14, 69, '[207]', NULL, 5, '2025-03-04 04:20:52', '2025-03-04 04:20:52'),
(39, 70, 14, 70, '[210, 211, 212, 213, 214]', NULL, 5, '2025-03-04 04:20:52', '2025-03-04 04:20:52'),
(40, 70, 14, 71, NULL, 'a', 10, '2025-03-04 04:20:52', '2025-03-04 04:20:52'),
(41, 70, 14, 72, '[216, 217, 218, 219, 220]', NULL, 5, '2025-03-04 04:20:52', '2025-03-04 04:20:52');

-- --------------------------------------------------------

--
-- Stand-in structure for view `survey_beneficiary_views`
--
CREATE TABLE IF NOT EXISTS `survey_beneficiary_views` (
`project_id` bigint(20) unsigned
,`indicator_id` bigint(20) unsigned
,`activity_id` bigint(20) unsigned
,`survey_id` bigint(20) unsigned
,`survey_beneficiary_id` bigint(20) unsigned
,`beneficiary_mark_percentage` decimal(17,4)
);

-- --------------------------------------------------------

--
-- Table structure for table `survey_forms`
--

CREATE TABLE IF NOT EXISTS `survey_forms` (
  `id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `indicator_id` bigint(20) unsigned DEFAULT NULL,
  `activity_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_forms`
--

INSERT INTO `survey_forms` (`id`, `project_id`, `indicator_id`, `activity_id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(64, 67, 239, 119, 'Distribution of Seed & Fartilizer', 'active', '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(65, 68, 241, 120, 'Survey Project 1 Indicator 1 Activity 1', 'active', '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(66, 68, 243, 123, 'Survey Project 1 Indicator 3 Activity 1', 'active', '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(67, 70, 247, 126, 'Survey Question for "Project 3 Indicator 1 Activity 1"', 'active', '2025-03-04 04:19:52', '2025-03-04 04:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `survey_questions`
--

CREATE TABLE IF NOT EXISTS `survey_questions` (
  `id` bigint(20) unsigned NOT NULL,
  `survey_form_id` bigint(20) unsigned DEFAULT NULL,
  `question_type` enum('single','multiple','text') COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey_questions`
--

INSERT INTO `survey_questions` (`id`, `survey_form_id`, `question_type`, `question`, `mark`, `created_at`, `updated_at`) VALUES
(59, 64, 'single', 'Do you receive any oriantation', 5, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(60, 64, 'text', 'How many you have cultivity land? (decimal)', 5, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(61, 64, 'text', 'How much seed  you need?', 5, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(62, 64, 'single', 'What kind of spesis of seed you need', 5, '2025-02-22 10:28:05', '2025-02-22 10:28:05'),
(63, 65, 'single', 'How satisfied are you with Project 1?', 5, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(64, 65, 'multiple', 'What challenges have you faced while implementing Project 1? (Select all that apply)', 5, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(65, 65, 'text', 'Please describe any suggestions you have for improving Project 1', 10, '2025-03-02 05:39:45', '2025-03-02 05:39:45'),
(66, 66, 'single', 'How frequently do you engage with Project 1?', 5, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(67, 66, 'multiple', 'Which of the following tools do you use in relation to Project 1?', 5, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(68, 66, 'text', 'What new features would you like to see in future iterations of Project 1?', 10, '2025-03-02 05:45:37', '2025-03-02 05:45:37'),
(69, 67, 'single', 'What is your primary role in the project?', 5, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(70, 67, 'multiple', 'Which aspects of the project do you feel need improvement?', 5, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(71, 67, 'text', 'What additional resources would be helpful for project completion?', 5, '2025-03-04 04:19:52', '2025-03-04 04:19:52'),
(72, 67, 'multiple', 'How do you prefer to receive updates about the project?', 5, '2025-03-04 04:19:52', '2025-03-04 04:19:52');

-- --------------------------------------------------------

--
-- Stand-in structure for view `survey_question_mark_views`
--
CREATE TABLE IF NOT EXISTS `survey_question_mark_views` (
`project_id` bigint(20) unsigned
,`indicator_id` bigint(20) unsigned
,`activity_id` bigint(20) unsigned
,`total_question_marks` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `survey_report_views`
--
CREATE TABLE IF NOT EXISTS `survey_report_views` (
`project_id` bigint(20) unsigned
,`indicator_id` bigint(20) unsigned
,`activity_id` bigint(20) unsigned
,`survey_id` bigint(20) unsigned
,`average_survey_mark` decimal(43,8)
);

-- --------------------------------------------------------

--
-- Table structure for table `thanas`
--

CREATE TABLE IF NOT EXISTS `thanas` (
  `id` bigint(20) unsigned NOT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `district_id` bigint(20) unsigned DEFAULT NULL,
  `upazila_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thanas`
--

INSERT INTO `thanas` (`id`, `state_id`, `district_id`, `upazila_id`, `name`, `contact_no`, `status`, `created_at`, `updated_at`) VALUES
(4, 7, 15, 13, 'Khalishpur', '01236494740', 'active', '2025-02-25 09:43:40', '2025-02-25 09:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `upazilas`
--

CREATE TABLE IF NOT EXISTS `upazilas` (
  `id` bigint(20) unsigned NOT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `district_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `upazilas`
--

INSERT INTO `upazilas` (`id`, `state_id`, `district_id`, `name`, `sorting`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(11, 7, 14, 'Rupsa', 1, 'active', NULL, '2025-02-22 08:38:37', '2025-02-22 08:38:37'),
(12, 7, 15, 'Batiaghata', 2, 'active', NULL, '2025-02-22 08:38:54', '2025-02-22 08:38:54'),
(13, 7, 15, 'Phultala', 3, 'active', NULL, '2025-02-22 08:39:06', '2025-02-22 08:39:06'),
(14, 7, 15, 'Paikgachha', 4, 'active', NULL, '2025-02-22 08:39:25', '2025-02-22 08:39:25'),
(15, 7, 15, 'Dighalia', 5, 'active', NULL, '2025-02-22 08:39:40', '2025-02-22 08:39:40'),
(16, 7, 15, 'Dacope', 6, 'active', NULL, '2025-02-22 08:39:54', '2025-02-22 08:39:54'),
(17, 7, 15, 'Terokhada', 7, 'active', NULL, '2025-02-22 08:40:24', '2025-02-22 08:40:24'),
(18, 7, 15, 'Dumuria', 8, 'active', NULL, '2025-02-22 08:40:52', '2025-02-22 08:40:52'),
(19, 7, 15, 'Koyra', 9, 'active', NULL, '2025-02-22 08:41:02', '2025-02-22 08:41:02'),
(20, 8, 18, 'Rampura', 10, 'active', NULL, '2025-02-25 09:32:00', '2025-02-25 09:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_login_histories`
--

CREATE TABLE IF NOT EXISTS `user_login_histories` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_guard` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_browser_client` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_login_histories`
--

INSERT INTO `user_login_histories` (`id`, `user_id`, `user_guard`, `login_at`, `login_ip`, `login_browser_client`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', '2024-06-02 12:53:22', '::1', 'Google Chrome', 0, 'active', '2024-06-02 06:53:22', '2024-06-02 06:53:22'),
(2, 1, 'admin', '2024-06-03 06:36:32', '::1', 'Google Chrome', 0, 'active', '2024-06-03 00:36:32', '2024-06-03 00:36:32'),
(3, 1, 'admin', '2024-08-11 04:14:44', '::1', 'Google Chrome', 0, 'active', '2024-08-10 22:14:44', '2024-08-10 22:14:44'),
(4, 1, 'admin', '2024-08-11 05:34:27', '::1', 'Google Chrome', 0, 'active', '2024-08-10 23:34:27', '2024-08-10 23:34:27'),
(5, 1, 'admin', '2024-08-11 06:05:44', '::1', 'Google Chrome', 0, 'active', '2024-08-11 00:05:44', '2024-08-11 00:05:44'),
(6, 1, 'admin', '2024-08-12 05:27:29', '::1', 'Google Chrome', 0, 'active', '2024-08-11 23:27:29', '2024-08-11 23:27:29'),
(7, 1, 'admin', '2024-08-12 05:54:25', '::1', 'Google Chrome', 0, 'active', '2024-08-11 23:54:25', '2024-08-11 23:54:25'),
(8, 1, 'admin', '2024-08-12 06:03:34', '::1', 'Google Chrome', 0, 'active', '2024-08-12 00:03:34', '2024-08-12 00:03:34'),
(9, 1, 'admin', '2024-08-13 05:34:57', '::1', 'Google Chrome', 0, 'active', '2024-08-12 23:34:57', '2024-08-12 23:34:57'),
(10, 1, 'admin', '2024-08-13 05:59:58', '::1', 'Google Chrome', 0, 'active', '2024-08-12 23:59:58', '2024-08-12 23:59:58'),
(11, 1, 'admin', '2024-08-13 06:13:28', '::1', 'Google Chrome', 0, 'active', '2024-08-13 00:13:28', '2024-08-13 00:13:28'),
(12, 1, 'admin', '2024-08-13 06:55:45', '::1', 'Google Chrome', 0, 'active', '2024-08-13 00:55:45', '2024-08-13 00:55:45'),
(13, 1, 'admin', '2024-08-13 10:19:37', '::1', 'Google Chrome', 0, 'active', '2024-08-13 04:19:37', '2024-08-13 04:19:37'),
(14, 1, 'admin', '2024-08-13 10:54:33', '::1', 'Google Chrome', 0, 'active', '2024-08-13 04:54:33', '2024-08-13 04:54:33'),
(15, 1, 'admin', '2024-08-13 10:57:08', '::1', 'Google Chrome', 0, 'active', '2024-08-13 04:57:08', '2024-08-13 04:57:08'),
(16, 1, 'admin', '2024-08-13 10:58:12', '::1', 'Google Chrome', 0, 'active', '2024-08-13 04:58:12', '2024-08-13 04:58:12'),
(17, 1, 'admin', '2024-08-13 10:58:19', '::1', 'Google Chrome', 0, 'active', '2024-08-13 04:58:19', '2024-08-13 04:58:19'),
(18, 1, 'admin', '2024-08-14 04:23:12', '::1', 'Google Chrome', 0, 'active', '2024-08-13 22:23:12', '2024-08-13 22:23:12'),
(19, 1, 'admin', '2024-08-14 04:42:40', '::1', 'Google Chrome', 0, 'active', '2024-08-13 22:42:40', '2024-08-13 22:42:40'),
(20, 1, 'admin', '2024-08-14 11:34:17', '::1', 'Google Chrome', 0, 'active', '2024-08-14 05:34:17', '2024-08-14 05:34:17'),
(21, 1, 'admin', '2024-08-15 04:30:50', '::1', 'Google Chrome', 0, 'active', '2024-08-14 22:30:50', '2024-08-14 22:30:50'),
(22, 1, 'admin', '2024-08-15 04:49:34', '::1', 'Google Chrome', 0, 'active', '2024-08-14 22:49:34', '2024-08-14 22:49:34'),
(23, 1, 'admin', '2024-08-18 04:08:12', '::1', 'Google Chrome', 0, 'active', '2024-08-17 22:08:12', '2024-08-17 22:08:12'),
(24, 1, 'admin', '2024-08-18 10:08:33', '::1', 'Google Chrome', 0, 'active', '2024-08-18 04:08:33', '2024-08-18 04:08:33'),
(25, 1, 'admin', '2024-08-19 04:18:45', '::1', 'Google Chrome', 0, 'active', '2024-08-18 22:18:45', '2024-08-18 22:18:45'),
(26, 1, 'admin', '2024-08-19 08:57:11', '::1', 'Google Chrome', 0, 'active', '2024-08-19 02:57:11', '2024-08-19 02:57:11'),
(27, 1, 'admin', '2024-08-20 04:28:59', '::1', 'Google Chrome', 0, 'active', '2024-08-19 22:28:59', '2024-08-19 22:28:59'),
(28, 1, 'admin', '2024-08-20 05:23:01', '::1', 'Google Chrome', 0, 'active', '2024-08-19 23:23:01', '2024-08-19 23:23:01'),
(29, 1, 'admin', '2024-08-21 04:15:29', '::1', 'Google Chrome', 0, 'active', '2024-08-20 22:15:29', '2024-08-20 22:15:29'),
(30, 1, 'admin', '2024-08-21 04:19:05', '::1', 'Google Chrome', 0, 'active', '2024-08-20 22:19:05', '2024-08-20 22:19:05'),
(31, 1, 'admin', '2024-08-21 04:19:28', '::1', 'Google Chrome', 0, 'active', '2024-08-20 22:19:28', '2024-08-20 22:19:28'),
(32, 1, 'admin', '2024-08-21 05:36:48', '::1', 'Google Chrome', 0, 'active', '2024-08-20 23:36:48', '2024-08-20 23:36:48'),
(33, 1, 'admin', '2024-08-21 10:20:42', '::1', 'Google Chrome', 0, 'active', '2024-08-21 04:20:42', '2024-08-21 04:20:42'),
(34, 1, 'admin', '2024-08-22 04:08:50', '::1', 'Google Chrome', 0, 'active', '2024-08-21 22:08:50', '2024-08-21 22:08:50'),
(35, 1, 'admin', '2024-08-22 09:17:59', '::1', 'Google Chrome', 0, 'active', '2024-08-22 03:17:59', '2024-08-22 03:17:59'),
(36, 1, 'admin', '2024-08-22 11:51:26', '::1', 'Google Chrome', 0, 'active', '2024-08-22 05:51:26', '2024-08-22 05:51:26'),
(37, 1, 'admin', '2024-08-25 04:20:30', '::1', 'Google Chrome', 0, 'active', '2024-08-24 22:20:30', '2024-08-24 22:20:30'),
(38, 1, 'admin', '2024-08-26 03:34:49', '::1', 'Google Chrome', 0, 'active', '2024-08-25 21:34:49', '2024-08-25 21:34:49'),
(39, 1, 'admin', '2024-08-26 04:32:29', '::1', 'Google Chrome', 0, 'active', '2024-08-25 22:32:29', '2024-08-25 22:32:29'),
(40, 1, 'admin', '2024-08-27 03:34:54', '::1', 'Google Chrome', 0, 'active', '2024-08-26 21:34:54', '2024-08-26 21:34:54'),
(41, 1, 'admin', '2024-08-27 05:18:18', '::1', 'Google Chrome', 0, 'active', '2024-08-26 23:18:18', '2024-08-26 23:18:18'),
(42, 1, 'admin', '2024-08-27 10:09:09', '::1', 'Google Chrome', 0, 'active', '2024-08-27 04:09:09', '2024-08-27 04:09:09'),
(43, 1, 'admin', '2024-08-27 11:46:14', '::1', 'Google Chrome', 0, 'active', '2024-08-27 05:46:14', '2024-08-27 05:46:14'),
(44, 1, 'admin', '2024-08-28 04:29:07', '::1', 'Google Chrome', 0, 'active', '2024-08-27 22:29:07', '2024-08-27 22:29:07'),
(45, 1, 'admin', '2024-08-29 04:22:03', '::1', 'Google Chrome', 0, 'active', '2024-08-28 22:22:03', '2024-08-28 22:22:03'),
(46, 1, 'admin', '2024-08-29 09:57:58', '::1', 'Google Chrome', 0, 'active', '2024-08-29 03:57:58', '2024-08-29 03:57:58'),
(47, 1, 'admin', '2024-09-01 04:36:35', '::1', 'Google Chrome', 0, 'active', '2024-08-31 22:36:35', '2024-08-31 22:36:35'),
(48, 1, 'admin', '2024-09-10 06:20:48', '::1', 'Google Chrome', 0, 'active', '2024-09-10 00:20:48', '2024-09-10 00:20:48'),
(49, 1, 'admin', '2024-09-10 09:33:59', '::1', 'Google Chrome', 0, 'active', '2024-09-10 03:33:59', '2024-09-10 03:33:59'),
(50, 1, 'admin', '2024-09-10 10:11:43', '::1', 'Google Chrome', 0, 'active', '2024-09-10 04:11:43', '2024-09-10 04:11:43'),
(51, 1, 'admin', '2024-09-10 10:13:56', '::1', 'Google Chrome', 0, 'active', '2024-09-10 04:13:56', '2024-09-10 04:13:56'),
(52, 1, 'admin', '2024-09-10 12:14:15', '::1', 'Google Chrome', 0, 'active', '2024-09-10 06:14:15', '2024-09-10 06:14:15'),
(53, 1, 'admin', '2024-09-11 03:40:51', '::1', 'Google Chrome', 0, 'active', '2024-09-10 21:40:51', '2024-09-10 21:40:51'),
(54, 1, 'admin', '2024-09-12 02:57:23', '::1', 'Google Chrome', 0, 'active', '2024-09-11 20:57:23', '2024-09-11 20:57:23'),
(55, 1, 'admin', '2024-09-12 04:41:27', '::1', 'Google Chrome', 0, 'active', '2024-09-11 22:41:27', '2024-09-11 22:41:27'),
(56, 1, 'admin', '2024-09-12 04:41:59', '::1', 'Google Chrome', 0, 'active', '2024-09-11 22:41:59', '2024-09-11 22:41:59'),
(57, 1, 'admin', '2024-09-12 06:57:54', '::1', 'Google Chrome', 0, 'active', '2024-09-12 00:57:54', '2024-09-12 00:57:54'),
(58, 1, 'admin', '2024-09-12 09:16:43', '::1', 'Google Chrome', 0, 'active', '2024-09-12 03:16:43', '2024-09-12 03:16:43'),
(59, 1, 'admin', '2024-09-12 09:17:46', '::1', 'Google Chrome', 0, 'active', '2024-09-12 03:17:46', '2024-09-12 03:17:46'),
(60, 1, 'admin', '2024-09-12 10:30:17', '::1', 'Google Chrome', 0, 'active', '2024-09-12 04:30:17', '2024-09-12 04:30:17'),
(61, 1, 'admin', '2024-09-12 10:30:40', '::1', 'Google Chrome', 0, 'active', '2024-09-12 04:30:40', '2024-09-12 04:30:40'),
(62, 1, 'admin', '2024-09-12 10:35:34', '::1', 'Google Chrome', 0, 'active', '2024-09-12 04:35:34', '2024-09-12 04:35:34'),
(63, 1, 'admin', '2024-09-12 11:31:54', '::1', 'Google Chrome', 0, 'active', '2024-09-12 05:31:54', '2024-09-12 05:31:54'),
(64, 1, 'admin', '2024-09-12 12:13:13', '::1', 'Google Chrome', 0, 'active', '2024-09-12 06:13:13', '2024-09-12 06:13:13'),
(65, 1, 'admin', '2024-09-15 03:13:06', '::1', 'Google Chrome', 0, 'active', '2024-09-14 21:13:06', '2024-09-14 21:13:06'),
(66, 1, 'admin', '2024-09-15 03:13:51', '::1', 'Google Chrome', 0, 'active', '2024-09-14 21:13:51', '2024-09-14 21:13:51'),
(67, 1, 'admin', '2024-09-15 03:32:47', '::1', 'Google Chrome', 0, 'active', '2024-09-14 21:32:47', '2024-09-14 21:32:47'),
(68, 1, 'admin', '2024-09-15 03:42:21', '::1', 'Google Chrome', 0, 'active', '2024-09-14 21:42:21', '2024-09-14 21:42:21'),
(69, 1, 'admin', '2024-09-15 04:02:22', '::1', 'Google Chrome', 0, 'active', '2024-09-14 22:02:22', '2024-09-14 22:02:22'),
(70, 1, 'admin', '2024-09-15 04:03:53', '::1', 'Google Chrome', 0, 'active', '2024-09-14 22:03:53', '2024-09-14 22:03:53'),
(71, 1, 'admin', '2024-09-15 04:08:12', '::1', 'Google Chrome', 0, 'active', '2024-09-14 22:08:12', '2024-09-14 22:08:12'),
(72, 1, 'admin', '2024-09-15 04:59:34', '::1', 'Google Chrome', 0, 'active', '2024-09-14 22:59:34', '2024-09-14 22:59:34'),
(73, 1, 'admin', '2024-09-15 05:19:56', '::1', 'Google Chrome', 0, 'active', '2024-09-14 23:19:56', '2024-09-14 23:19:56'),
(74, 1, 'admin', '2024-09-15 05:20:15', '::1', 'Google Chrome', 0, 'active', '2024-09-14 23:20:15', '2024-09-14 23:20:15'),
(75, 1, 'admin', '2024-09-15 05:20:35', '::1', 'Google Chrome', 0, 'active', '2024-09-14 23:20:35', '2024-09-14 23:20:35'),
(76, 1, 'admin', '2024-09-15 05:21:40', '::1', 'Google Chrome', 0, 'active', '2024-09-14 23:21:40', '2024-09-14 23:21:40'),
(77, 1, 'admin', '2024-09-15 06:52:34', '::1', 'Google Chrome', 0, 'active', '2024-09-15 00:52:34', '2024-09-15 00:52:34'),
(78, 1, 'admin', '2024-09-15 09:56:52', '::1', 'Google Chrome', 0, 'active', '2024-09-15 03:56:52', '2024-09-15 03:56:52'),
(79, 1, 'admin', '2024-09-15 10:09:50', '::1', 'Google Chrome', 0, 'active', '2024-09-15 04:09:50', '2024-09-15 04:09:50'),
(80, 1, 'admin', '2024-09-15 10:12:07', '::1', 'Google Chrome', 0, 'active', '2024-09-15 04:12:07', '2024-09-15 04:12:07'),
(81, 1, 'admin', '2024-09-15 10:34:27', '::1', 'Google Chrome', 0, 'active', '2024-09-15 04:34:27', '2024-09-15 04:34:27'),
(82, 1, 'admin', '2024-09-15 10:36:38', '::1', 'Google Chrome', 0, 'active', '2024-09-15 04:36:38', '2024-09-15 04:36:38'),
(83, 1, 'admin', '2024-09-15 10:38:08', '::1', 'Google Chrome', 0, 'active', '2024-09-15 04:38:08', '2024-09-15 04:38:08'),
(84, 1, 'admin', '2024-09-15 10:42:15', '::1', 'Google Chrome', 0, 'active', '2024-09-15 04:42:15', '2024-09-15 04:42:15'),
(85, 1, 'admin', '2024-09-17 04:03:26', '::1', 'Google Chrome', 0, 'active', '2024-09-16 22:03:26', '2024-09-16 22:03:26'),
(86, 1, 'admin', '2024-09-18 03:30:49', '::1', 'Google Chrome', 0, 'active', '2024-09-17 21:30:49', '2024-09-17 21:30:49'),
(87, 1, 'admin', '2024-09-19 04:07:27', '::1', 'Google Chrome', 0, 'active', '2024-09-18 22:07:27', '2024-09-18 22:07:27'),
(88, 1, 'admin', '2024-09-19 04:43:33', '::1', 'Google Chrome', 0, 'active', '2024-09-18 22:43:33', '2024-09-18 22:43:33'),
(89, 1, 'admin', '2024-09-19 05:33:20', '::1', 'Google Chrome', 0, 'active', '2024-09-18 23:33:20', '2024-09-18 23:33:20'),
(90, 1, 'admin', '2024-09-19 08:36:18', '::1', 'Google Chrome', 0, 'active', '2024-09-19 02:36:18', '2024-09-19 02:36:18'),
(91, 1, 'admin', '2024-09-19 09:00:12', '::1', 'Google Chrome', 0, 'active', '2024-09-19 03:00:12', '2024-09-19 03:00:12'),
(92, 1, 'admin', '2024-09-19 09:12:43', '::1', 'Google Chrome', 0, 'active', '2024-09-19 03:12:43', '2024-09-19 03:12:43'),
(93, 1, 'admin', '2024-09-22 04:41:29', '::1', 'Google Chrome', 0, 'active', '2024-09-21 22:41:29', '2024-09-21 22:41:29'),
(94, 1, 'admin', '2024-09-22 05:05:24', '::1', 'Google Chrome', 0, 'active', '2024-09-21 23:05:24', '2024-09-21 23:05:24'),
(95, 1, 'admin', '2024-09-22 05:33:19', '::1', 'Google Chrome', 0, 'active', '2024-09-21 23:33:19', '2024-09-21 23:33:19'),
(96, 1, 'admin', '2024-09-22 11:31:57', '::1', 'Google Chrome', 0, 'active', '2024-09-22 05:31:57', '2024-09-22 05:31:57'),
(97, 1, 'admin', '2024-09-22 12:14:35', '::1', 'Google Chrome', 0, 'active', '2024-09-22 06:14:35', '2024-09-22 06:14:35'),
(98, 1, 'admin', '2024-09-23 07:00:06', '::1', 'Google Chrome', 0, 'active', '2024-09-23 01:00:06', '2024-09-23 01:00:06'),
(99, 1, 'admin', '2024-09-23 07:01:06', '::1', 'Google Chrome', 0, 'active', '2024-09-23 01:01:06', '2024-09-23 01:01:06'),
(100, 1, 'admin', '2024-09-23 07:29:20', '::1', 'Google Chrome', 0, 'active', '2024-09-23 01:29:20', '2024-09-23 01:29:20'),
(101, 1, 'admin', '2024-09-29 03:30:22', '::1', 'Google Chrome', 0, 'active', '2024-09-28 21:30:22', '2024-09-28 21:30:22'),
(102, 1, 'admin', '2024-09-29 06:03:30', '::1', 'Google Chrome', 0, 'active', '2024-09-29 00:03:30', '2024-09-29 00:03:30'),
(103, 1, 'admin', '2024-09-29 06:53:15', '::1', 'Google Chrome', 0, 'active', '2024-09-29 00:53:15', '2024-09-29 00:53:15'),
(104, 1, 'admin', '2024-09-29 09:56:19', '::1', 'Google Chrome', 0, 'active', '2024-09-29 03:56:19', '2024-09-29 03:56:19'),
(105, 1, 'admin', '2024-10-02 04:26:42', '::1', 'Google Chrome', 0, 'active', '2024-10-01 22:26:42', '2024-10-01 22:26:42'),
(106, 1, 'admin', '2024-10-02 04:27:32', '::1', 'Google Chrome', 0, 'active', '2024-10-01 22:27:32', '2024-10-01 22:27:32'),
(107, 1, 'admin', '2024-10-02 04:56:08', '::1', 'Google Chrome', 0, 'active', '2024-10-01 22:56:08', '2024-10-01 22:56:08'),
(108, 1, 'admin', '2024-10-02 04:58:31', '::1', 'Google Chrome', 0, 'active', '2024-10-01 22:58:31', '2024-10-01 22:58:31'),
(109, 1, 'admin', '2024-10-02 04:58:51', '::1', 'Google Chrome', 0, 'active', '2024-10-01 22:58:51', '2024-10-01 22:58:51'),
(110, 1, 'admin', '2024-10-02 05:08:46', '::1', 'Google Chrome', 0, 'active', '2024-10-01 23:08:46', '2024-10-01 23:08:46'),
(111, 1, 'admin', '2024-10-02 05:11:57', '::1', 'Google Chrome', 0, 'active', '2024-10-01 23:11:57', '2024-10-01 23:11:57'),
(112, 1, 'admin', '2024-10-02 05:59:46', '::1', 'Google Chrome', 0, 'active', '2024-10-01 23:59:46', '2024-10-01 23:59:46'),
(113, 1, 'admin', '2024-10-02 06:09:27', '::1', 'Google Chrome', 0, 'active', '2024-10-02 00:09:27', '2024-10-02 00:09:27'),
(114, 1, 'admin', '2024-10-02 06:10:37', '::1', 'Google Chrome', 0, 'active', '2024-10-02 00:10:37', '2024-10-02 00:10:37'),
(115, 1, 'admin', '2024-10-02 06:11:25', '::1', 'Google Chrome', 0, 'active', '2024-10-02 00:11:25', '2024-10-02 00:11:25'),
(116, 1, 'admin', '2024-10-06 04:39:40', '::1', 'Google Chrome', 0, 'active', '2024-10-05 22:39:40', '2024-10-05 22:39:40'),
(117, 1, 'admin', '2024-10-06 04:40:20', '::1', 'Google Chrome', 0, 'active', '2024-10-05 22:40:20', '2024-10-05 22:40:20'),
(118, 1, 'admin', '2024-10-07 08:03:12', '::1', 'Google Chrome', 0, 'active', '2024-10-07 02:03:12', '2024-10-07 02:03:12'),
(119, 1, 'admin', '2024-10-07 09:38:09', '::1', 'Google Chrome', 0, 'active', '2024-10-07 03:38:09', '2024-10-07 03:38:09'),
(120, 1, 'admin', '2024-10-07 12:27:55', '::1', 'Google Chrome', 0, 'active', '2024-10-07 06:27:55', '2024-10-07 06:27:55'),
(121, 1, 'admin', '2024-10-08 09:19:01', '::1', 'Google Chrome', 0, 'active', '2024-10-08 03:19:01', '2024-10-08 03:19:01'),
(122, 1, 'admin', '2024-10-09 03:50:33', '::1', 'Google Chrome', 0, 'active', '2024-10-08 21:50:33', '2024-10-08 21:50:33'),
(123, 1, 'admin', '2024-10-09 05:53:28', '::1', 'Google Chrome', 0, 'active', '2024-10-08 23:53:28', '2024-10-08 23:53:28'),
(124, 1, 'admin', '2024-10-09 06:10:36', '::1', 'Google Chrome', 0, 'active', '2024-10-09 00:10:36', '2024-10-09 00:10:36'),
(125, 1, 'admin', '2024-10-10 03:54:53', '::1', 'Google Chrome', 0, 'active', '2024-10-09 21:54:53', '2024-10-09 21:54:53'),
(126, 1, 'admin', '2024-10-10 09:28:16', '::1', 'Google Chrome', 0, 'active', '2024-10-10 03:28:16', '2024-10-10 03:28:16'),
(127, 1, 'admin', '2024-10-13 03:26:38', '::1', 'Google Chrome', 0, 'active', '2024-10-12 21:26:38', '2024-10-12 21:26:38'),
(128, 1, 'admin', '2024-10-13 09:03:33', '::1', 'Google Chrome', 0, 'active', '2024-10-13 03:03:33', '2024-10-13 03:03:33'),
(129, 1, 'admin', '2024-10-15 06:31:58', '::1', 'Google Chrome', 0, 'active', '2024-10-15 00:31:58', '2024-10-15 00:31:58'),
(130, 1, 'admin', '2024-10-16 03:31:51', '::1', 'Google Chrome', 0, 'active', '2024-10-15 21:31:51', '2024-10-15 21:31:51'),
(131, 1, 'admin', '2024-10-17 03:20:12', '::1', 'Google Chrome', 0, 'active', '2024-10-16 21:20:12', '2024-10-16 21:20:12'),
(132, 1, 'admin', '2024-10-20 03:36:39', '::1', 'Google Chrome', 0, 'active', '2024-10-19 21:36:39', '2024-10-19 21:36:39'),
(133, 1, 'admin', '2024-10-20 10:36:58', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-20 04:36:58', '2024-10-20 04:36:58'),
(134, 1, 'admin', '2024-10-20 10:37:27', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-20 04:37:27', '2024-10-20 04:37:27'),
(135, 1, 'admin', '2024-10-21 03:31:39', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-20 21:31:39', '2024-10-20 21:31:39'),
(136, 1, 'admin', '2024-10-21 11:32:44', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-21 05:32:44', '2024-10-21 05:32:44'),
(137, 1, 'admin', '2024-10-22 08:58:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-22 02:58:16', '2024-10-22 02:58:16'),
(138, 1, 'admin', '2024-10-22 10:41:55', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-22 04:41:55', '2024-10-22 04:41:55'),
(139, 1, 'admin', '2024-10-22 13:10:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-22 07:10:14', '2024-10-22 07:10:14'),
(140, 1, 'admin', '2024-10-23 05:10:38', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-22 23:10:38', '2024-10-22 23:10:38'),
(141, 1, 'admin', '2024-10-23 05:11:58', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-22 23:11:58', '2024-10-22 23:11:58'),
(142, 1, 'admin', '2024-10-23 10:11:36', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-23 04:11:36', '2024-10-23 04:11:36'),
(143, 1, 'admin', '2024-10-23 12:55:52', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-23 06:55:52', '2024-10-23 06:55:52'),
(144, 1, 'admin', '2024-10-24 05:58:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-23 23:58:26', '2024-10-23 23:58:26'),
(145, 1, 'admin', '2024-10-24 06:45:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-24 00:45:16', '2024-10-24 00:45:16'),
(146, 1, 'admin', '2024-10-24 07:19:19', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-24 01:19:19', '2024-10-24 01:19:19'),
(147, 1, 'admin', '2024-10-24 10:19:47', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-24 04:19:47', '2024-10-24 04:19:47'),
(148, 1, 'admin', '2024-10-24 13:06:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-24 07:06:16', '2024-10-24 07:06:16'),
(149, 1, 'admin', '2024-10-27 04:30:52', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-26 22:30:52', '2024-10-26 22:30:52'),
(150, 1, 'admin', '2024-10-27 09:26:06', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-27 03:26:07', '2024-10-27 03:26:07'),
(151, 1, 'admin', '2024-10-27 10:43:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-27 04:43:22', '2024-10-27 04:43:22'),
(152, 1, 'admin', '2024-10-28 08:09:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-28 02:09:03', '2024-10-28 02:09:03'),
(153, 1, 'admin', '2024-10-29 03:41:58', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-28 21:41:58', '2024-10-28 21:41:58'),
(154, 1, 'admin', '2024-10-29 03:48:39', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-28 21:48:39', '2024-10-28 21:48:39'),
(155, 1, 'admin', '2024-10-29 04:00:50', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-28 22:00:50', '2024-10-28 22:00:50'),
(156, 1, 'admin', '2024-10-29 09:00:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-29 03:00:16', '2024-10-29 03:00:16'),
(157, 1, 'admin', '2024-10-29 09:43:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-29 03:43:57', '2024-10-29 03:43:57'),
(158, 1, 'admin', '2024-10-29 12:13:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-29 06:13:46', '2024-10-29 06:13:46'),
(159, 1, 'admin', '2024-10-30 03:22:00', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-29 21:22:00', '2024-10-29 21:22:00'),
(160, 1, 'admin', '2024-10-30 11:09:22', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-10-30 05:09:22', '2024-10-30 05:09:22'),
(161, 1, 'admin', '2024-10-30 11:16:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-30 05:16:02', '2024-10-30 05:16:02'),
(162, 1, 'admin', '2024-10-30 11:17:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-30 05:17:07', '2024-10-30 05:17:07'),
(163, 1, 'admin', '2024-10-31 05:11:58', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-30 23:11:58', '2024-10-30 23:11:58'),
(164, 1, 'admin', '2024-10-31 10:59:40', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-10-31 04:59:40', '2024-10-31 04:59:40'),
(165, 1, 'admin', '2024-11-03 04:09:55', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-11-02 22:09:55', '2024-11-02 22:09:55'),
(166, 1, 'admin', '2024-11-03 06:15:54', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-03 00:15:54', '2024-11-03 00:15:54'),
(167, 1, 'admin', '2024-11-03 06:16:51', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-03 00:16:51', '2024-11-03 00:16:51'),
(168, 1, 'admin', '2024-11-03 09:32:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-03 03:32:42', '2024-11-03 03:32:42'),
(169, 1, 'admin', '2024-11-03 12:02:40', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-03 06:02:40', '2024-11-03 06:02:40'),
(170, 1, 'admin', '2024-11-04 03:35:50', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-03 21:35:50', '2024-11-03 21:35:50'),
(171, 1, 'admin', '2024-11-04 04:21:50', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-03 22:21:50', '2024-11-03 22:21:50'),
(172, 1, 'admin', '2024-11-04 04:48:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-03 22:48:28', '2024-11-03 22:48:28'),
(173, 1, 'admin', '2024-11-04 06:57:32', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-04 00:57:32', '2024-11-04 00:57:32'),
(174, 1, 'admin', '2024-11-04 12:33:47', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-04 06:33:47', '2024-11-04 06:33:47'),
(175, 1, 'admin', '2024-11-04 12:45:11', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-04 06:45:11', '2024-11-04 06:45:11'),
(176, 1, 'admin', '2024-11-05 03:24:59', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-04 21:24:59', '2024-11-04 21:24:59'),
(177, 1, 'admin', '2024-11-05 03:32:54', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-04 21:32:54', '2024-11-04 21:32:54'),
(178, 1, 'admin', '2024-11-05 03:48:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-04 21:48:03', '2024-11-04 21:48:03'),
(179, 1, 'admin', '2024-11-05 03:51:57', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-11-04 21:51:57', '2024-11-04 21:51:57'),
(180, 1, 'admin', '2024-11-05 04:01:08', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-04 22:01:08', '2024-11-04 22:01:08'),
(181, 1, 'admin', '2024-11-05 04:14:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-04 22:14:46', '2024-11-04 22:14:46'),
(182, 1, 'admin', '2024-11-05 06:32:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-05 00:32:57', '2024-11-05 00:32:57'),
(183, 1, 'admin', '2024-11-05 07:30:24', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-05 01:30:24', '2024-11-05 01:30:24'),
(184, 1, 'admin', '2024-11-05 08:34:34', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-05 02:34:34', '2024-11-05 02:34:34'),
(185, 1, 'admin', '2024-11-05 09:56:01', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-11-05 03:56:01', '2024-11-05 03:56:01'),
(186, 1, 'admin', '2024-11-05 11:05:53', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-05 05:05:53', '2024-11-05 05:05:53'),
(187, 1, 'admin', '2024-11-05 11:46:51', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-05 05:46:51', '2024-11-05 05:46:51'),
(188, 1, 'admin', '2024-11-06 03:24:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-05 21:24:22', '2024-11-05 21:24:22'),
(189, 1, 'admin', '2024-11-06 03:32:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-05 21:32:10', '2024-11-05 21:32:10'),
(190, 1, 'admin', '2024-11-06 05:36:26', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-11-05 23:36:26', '2024-11-05 23:36:26'),
(191, 1, 'admin', '2024-11-06 08:29:43', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-06 02:29:43', '2024-11-06 02:29:43'),
(192, 1, 'admin', '2024-11-06 17:48:31', '202.181.4.169', 'Google Chrome', 0, 'active', '2024-11-06 11:48:31', '2024-11-06 11:48:31'),
(193, 1, 'admin', '2024-11-06 17:57:23', '202.181.4.169', 'Google Chrome', 0, 'active', '2024-11-06 11:57:23', '2024-11-06 11:57:23'),
(194, 1, 'admin', '2024-11-06 18:23:09', '202.181.4.169', 'Google Chrome', 0, 'active', '2024-11-06 12:23:09', '2024-11-06 12:23:09'),
(195, 1, 'admin', '2024-11-06 18:38:36', '202.181.4.169', 'Google Chrome', 0, 'active', '2024-11-06 12:38:36', '2024-11-06 12:38:36'),
(196, 1, 'admin', '2024-11-06 18:39:29', '202.181.4.169', 'Google Chrome', 0, 'active', '2024-11-06 12:39:29', '2024-11-06 12:39:29'),
(197, 1, 'admin', '2024-11-06 18:42:43', '202.181.4.169', 'Google Chrome', 0, 'active', '2024-11-06 12:42:43', '2024-11-06 12:42:43'),
(198, 1, 'admin', '2024-11-07 03:27:43', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-06 21:27:43', '2024-11-06 21:27:43'),
(199, 1, 'admin', '2024-11-07 04:29:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-06 22:29:07', '2024-11-06 22:29:07'),
(200, 1, 'admin', '2024-11-07 04:51:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-06 22:51:26', '2024-11-06 22:51:26'),
(201, 1, 'admin', '2024-11-07 05:34:54', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-06 23:34:54', '2024-11-06 23:34:54'),
(202, 1, 'admin', '2024-11-07 07:35:20', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-07 01:35:20', '2024-11-07 01:35:20'),
(203, 1, 'admin', '2024-11-07 11:40:43', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-07 05:40:43', '2024-11-07 05:40:43'),
(204, 1, 'admin', '2024-11-07 12:06:44', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-07 06:06:44', '2024-11-07 06:06:44'),
(205, 1, 'admin', '2024-11-10 03:47:36', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-09 21:47:36', '2024-11-09 21:47:36'),
(206, 1, 'admin', '2024-11-10 05:31:36', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-09 23:31:36', '2024-11-09 23:31:36'),
(207, 1, 'admin', '2024-11-10 06:21:13', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-10 00:21:13', '2024-11-10 00:21:13'),
(208, 1, 'admin', '2024-11-10 07:32:13', '202.5.58.113', 'Google Chrome', 0, 'active', '2024-11-10 01:32:13', '2024-11-10 01:32:13'),
(209, 1, 'admin', '2024-11-10 10:00:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-10 04:00:05', '2024-11-10 04:00:05'),
(210, 1, 'admin', '2024-11-11 03:15:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-10 21:15:25', '2024-11-10 21:15:25'),
(211, 1, 'admin', '2024-11-11 03:21:23', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-10 21:21:23', '2024-11-10 21:21:23'),
(212, 1, 'admin', '2024-11-11 03:37:49', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-10 21:37:49', '2024-11-10 21:37:49'),
(213, 1, 'admin', '2024-11-11 06:02:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-11 00:02:05', '2024-11-11 00:02:05'),
(214, 1, 'admin', '2024-11-12 08:54:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-12 02:54:07', '2024-11-12 02:54:07'),
(215, 1, 'admin', '2024-11-12 09:01:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-12 03:01:22', '2024-11-12 03:01:22'),
(216, 1, 'admin', '2024-11-12 12:10:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-12 06:10:17', '2024-11-12 06:10:17'),
(217, 1, 'admin', '2024-11-13 05:55:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-12 23:55:28', '2024-11-12 23:55:28'),
(218, 1, 'admin', '2024-11-13 06:03:19', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-13 00:03:19', '2024-11-13 00:03:19'),
(219, 1, 'admin', '2024-11-13 08:34:06', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-13 02:34:06', '2024-11-13 02:34:06'),
(220, 1, 'admin', '2024-11-13 09:12:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-13 03:12:22', '2024-11-13 03:12:22'),
(221, 1, 'admin', '2024-11-13 11:02:29', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-13 05:02:29', '2024-11-13 05:02:29'),
(222, 1, 'admin', '2024-11-17 11:21:35', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-11-17 05:21:35', '2024-11-17 05:21:35'),
(223, 1, 'admin', '2024-11-19 03:41:58', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-18 21:41:58', '2024-11-18 21:41:58'),
(224, 1, 'admin', '2024-11-19 12:31:36', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-19 06:31:36', '2024-11-19 06:31:36'),
(225, 1, 'admin', '2024-11-19 13:03:53', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-19 07:03:53', '2024-11-19 07:03:53'),
(226, 1, 'admin', '2024-11-20 19:37:58', '119.148.103.158', 'Google Chrome', 0, 'active', '2024-11-20 13:37:58', '2024-11-20 13:37:58'),
(227, 1, 'admin', '2024-11-21 03:42:58', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-20 21:42:58', '2024-11-20 21:42:58'),
(228, 1, 'admin', '2024-11-21 06:51:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-21 00:51:27', '2024-11-21 00:51:27'),
(229, 1, 'admin', '2024-11-21 08:33:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-21 02:33:14', '2024-11-21 02:33:14'),
(230, 1, 'admin', '2024-11-21 08:50:42', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-11-21 02:50:42', '2024-11-21 02:50:42'),
(231, 1, 'admin', '2024-11-21 10:54:20', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-11-21 04:54:20', '2024-11-21 04:54:20'),
(232, 1, 'admin', '2024-11-24 09:03:34', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-24 03:03:34', '2024-11-24 03:03:34'),
(233, 1, 'admin', '2024-11-24 09:11:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-24 03:11:05', '2024-11-24 03:11:05'),
(234, 1, 'admin', '2024-11-24 11:58:52', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-24 05:58:52', '2024-11-24 05:58:52'),
(235, 1, 'admin', '2024-11-25 05:42:00', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-24 23:42:00', '2024-11-24 23:42:00'),
(236, 1, 'admin', '2024-11-25 05:54:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-24 23:54:57', '2024-11-24 23:54:57'),
(237, 1, 'admin', '2024-11-25 06:01:51', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-25 00:01:51', '2024-11-25 00:01:51'),
(238, 1, 'admin', '2024-11-25 12:23:04', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-25 06:23:04', '2024-11-25 06:23:04'),
(239, 1, 'admin', '2024-11-26 04:16:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-25 22:16:07', '2024-11-25 22:16:07'),
(240, 1, 'admin', '2024-11-26 06:39:44', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-26 00:39:44', '2024-11-26 00:39:44'),
(241, 1, 'admin', '2024-11-27 08:30:35', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-27 02:30:35', '2024-11-27 02:30:35'),
(242, 1, 'admin', '2024-11-27 08:43:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-27 02:43:03', '2024-11-27 02:43:03'),
(243, 1, 'admin', '2024-11-27 12:07:33', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-27 06:07:33', '2024-11-27 06:07:33'),
(244, 1, 'admin', '2024-11-27 13:01:38', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-11-27 07:01:38', '2024-11-27 07:01:38'),
(245, 1, 'admin', '2024-11-27 13:03:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-27 07:03:10', '2024-11-27 07:03:10'),
(246, 1, 'admin', '2024-11-28 03:33:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-27 21:33:05', '2024-11-27 21:33:05'),
(247, 1, 'admin', '2024-11-28 04:39:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-27 22:39:46', '2024-11-27 22:39:46'),
(248, 1, 'admin', '2024-11-28 05:12:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-27 23:12:07', '2024-11-27 23:12:07'),
(249, 1, 'admin', '2024-11-28 06:00:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-28 00:00:09', '2024-11-28 00:00:09'),
(250, 1, 'admin', '2024-11-28 06:22:57', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-11-28 00:22:57', '2024-11-28 00:22:57'),
(251, 1, 'admin', '2024-11-28 12:50:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-28 06:50:17', '2024-11-28 06:50:17'),
(252, 1, 'admin', '2024-12-01 05:58:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-11-30 23:58:26', '2024-11-30 23:58:26'),
(253, 1, 'admin', '2024-12-02 05:53:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-01 23:53:05', '2024-12-01 23:53:05'),
(254, 1, 'admin', '2024-12-02 06:07:31', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-02 00:07:31', '2024-12-02 00:07:31'),
(255, 1, 'admin', '2024-12-02 09:20:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-02 03:20:09', '2024-12-02 03:20:09'),
(256, 1, 'admin', '2024-12-04 04:02:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-03 22:02:57', '2024-12-03 22:02:57'),
(257, 1, 'admin', '2024-12-04 06:44:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-04 00:44:01', '2024-12-04 00:44:01'),
(258, 1, 'admin', '2024-12-04 07:24:51', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-04 01:24:51', '2024-12-04 01:24:51'),
(259, 1, 'admin', '2024-12-04 10:33:04', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-12-04 04:33:04', '2024-12-04 04:33:04'),
(260, 1, 'admin', '2024-12-04 10:55:55', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-04 04:55:55', '2024-12-04 04:55:55'),
(261, 1, 'admin', '2024-12-04 11:18:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-04 05:18:28', '2024-12-04 05:18:28'),
(262, 1, 'admin', '2024-12-05 03:36:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-04 21:36:09', '2024-12-04 21:36:09'),
(263, 1, 'admin', '2024-12-05 04:24:48', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-04 22:24:48', '2024-12-04 22:24:48'),
(264, 1, 'admin', '2024-12-05 07:05:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-05 01:05:10', '2024-12-05 01:05:10'),
(265, 1, 'admin', '2024-12-05 09:58:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-05 03:58:25', '2024-12-05 03:58:25'),
(266, 1, 'admin', '2024-12-05 10:08:12', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-05 04:08:12', '2024-12-05 04:08:12'),
(267, 1, 'admin', '2024-12-05 10:37:30', '103.113.149.90', 'Mozilla Firefox', 0, 'active', '2024-12-05 04:37:30', '2024-12-05 04:37:30'),
(268, 1, 'admin', '2024-12-08 09:14:54', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-08 03:14:54', '2024-12-08 03:14:54'),
(269, 1, 'admin', '2024-12-09 04:12:38', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-08 22:12:38', '2024-12-08 22:12:38'),
(270, 1, 'admin', '2024-12-09 11:45:18', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-09 05:45:18', '2024-12-09 05:45:18'),
(271, 1, 'admin', '2024-12-09 12:04:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-09 06:04:16', '2024-12-09 06:04:16'),
(272, 1, 'admin', '2024-12-10 10:55:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-10 04:55:26', '2024-12-10 04:55:26'),
(273, 1, 'admin', '2024-12-10 11:46:47', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-10 05:46:47', '2024-12-10 05:46:47'),
(274, 1, 'admin', '2024-12-11 04:11:15', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-10 22:11:15', '2024-12-10 22:11:15'),
(275, 1, 'admin', '2024-12-11 06:28:26', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-11 00:28:26', '2024-12-11 00:28:26'),
(276, 1, 'admin', '2024-12-11 07:09:33', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-11 01:09:33', '2024-12-11 01:09:33'),
(277, 1, 'admin', '2024-12-11 08:32:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-11 02:32:10', '2024-12-11 02:32:10'),
(278, 1, 'admin', '2024-12-11 10:17:00', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-12-11 04:17:00', '2024-12-11 04:17:00'),
(279, 1, 'admin', '2024-12-12 04:21:05', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-11 22:21:05', '2024-12-11 22:21:05'),
(280, 1, 'admin', '2024-12-12 04:32:57', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-12-11 22:32:57', '2024-12-11 22:32:57'),
(281, 1, 'admin', '2024-12-13 15:50:29', '103.159.115.135', 'Google Chrome', 0, 'active', '2024-12-13 09:50:29', '2024-12-13 09:50:29'),
(282, 1, 'admin', '2024-12-17 12:03:04', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-17 06:03:04', '2024-12-17 06:03:04'),
(283, 1, 'admin', '2024-12-18 03:16:41', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-12-17 21:16:41', '2024-12-17 21:16:41'),
(284, 1, 'admin', '2024-12-18 09:15:06', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-18 03:15:06', '2024-12-18 03:15:06'),
(285, 1, 'admin', '2024-12-18 09:37:32', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-12-18 03:37:32', '2024-12-18 03:37:32'),
(286, 1, 'admin', '2024-12-18 12:25:03', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-18 06:25:03', '2024-12-18 06:25:03'),
(287, 1, 'admin', '2024-12-19 03:29:01', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-12-18 21:29:01', '2024-12-18 21:29:01'),
(288, 1, 'admin', '2024-12-19 05:50:15', '221.120.98.178', '', 0, 'active', '2024-12-18 23:50:15', '2024-12-18 23:50:15'),
(289, 1, 'admin', '2024-12-19 05:55:07', '54.86.50.139', '', 0, 'active', '2024-12-18 23:55:07', '2024-12-18 23:55:07'),
(290, 1, 'admin', '2024-12-19 05:58:18', '54.86.50.139', '', 0, 'active', '2024-12-18 23:58:18', '2024-12-18 23:58:18'),
(291, 1, 'admin', '2024-12-21 03:38:00', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2024-12-20 21:38:00', '2024-12-20 21:38:00'),
(292, 1, 'admin', '2024-12-21 04:59:00', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-20 22:59:00', '2024-12-20 22:59:00'),
(293, 1, 'admin', '2024-12-21 05:53:17', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-20 23:53:17', '2024-12-20 23:53:17'),
(294, 1, 'admin', '2024-12-22 09:03:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-22 03:03:37', '2024-12-22 03:03:37'),
(295, 1, 'admin', '2024-12-22 11:58:56', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-22 05:58:56', '2024-12-22 05:58:56'),
(296, 1, 'admin', '2024-12-23 04:05:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-22 22:05:22', '2024-12-22 22:05:22'),
(297, 1, 'admin', '2024-12-23 09:35:28', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-23 03:35:28', '2024-12-23 03:35:28'),
(298, 1, 'admin', '2024-12-24 03:46:22', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-23 21:46:22', '2024-12-23 21:46:22'),
(299, 1, 'admin', '2024-12-24 09:08:21', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-24 03:08:21', '2024-12-24 03:08:21'),
(300, 1, 'admin', '2024-12-25 09:28:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-25 03:28:09', '2024-12-25 03:28:09'),
(301, 1, 'admin', '2024-12-25 09:30:47', '54.86.50.139', '', 0, 'active', '2024-12-25 03:30:47', '2024-12-25 03:30:47'),
(302, 1, 'admin', '2024-12-29 12:40:09', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-29 06:40:09', '2024-12-29 06:40:09'),
(303, 1, 'admin', '2024-12-31 14:43:55', '221.120.98.178', 'Google Chrome', 0, 'active', '2024-12-31 08:43:55', '2024-12-31 08:43:55'),
(304, 1, 'admin', '2025-01-01 10:16:15', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-01 04:16:15', '2025-01-01 04:16:15'),
(305, 1, 'admin', '2025-01-02 14:15:38', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-02 08:15:38', '2025-01-02 08:15:38'),
(306, 1, 'admin', '2025-01-05 21:19:16', '59.152.97.52', 'Google Chrome', 0, 'active', '2025-01-05 15:19:16', '2025-01-05 15:19:16'),
(307, 1, 'admin', '2025-01-08 23:21:24', '203.78.147.8', 'Google Chrome', 0, 'active', '2025-01-08 17:21:24', '2025-01-08 17:21:24'),
(308, 1, 'admin', '2025-01-14 10:23:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-14 04:23:14', '2025-01-14 04:23:14'),
(309, 1, 'admin', '2025-01-14 10:55:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-14 04:55:28', '2025-01-14 04:55:28'),
(310, 1, 'admin', '2025-01-14 11:38:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-14 05:38:42', '2025-01-14 05:38:42'),
(311, 1, 'admin', '2025-01-15 15:01:53', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-15 09:01:53', '2025-01-15 09:01:53'),
(312, 1, 'admin', '2025-01-15 15:57:51', '202.5.58.113', 'Google Chrome', 0, 'active', '2025-01-15 09:57:51', '2025-01-15 09:57:51'),
(313, 1, 'admin', '2025-01-16 09:18:55', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-01-16 03:18:55', '2025-01-16 03:18:55'),
(314, 1, 'admin', '2025-01-16 15:23:28', '202.5.58.113', 'Google Chrome', 0, 'active', '2025-01-16 09:23:28', '2025-01-16 09:23:28'),
(315, 1, 'admin', '2025-01-16 16:04:38', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-16 10:04:38', '2025-01-16 10:04:38'),
(316, 1, 'admin', '2025-01-16 16:55:39', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-16 10:55:39', '2025-01-16 10:55:39'),
(317, 1, 'admin', '2025-01-19 16:14:53', '192.140.255.111', 'Google Chrome', 0, 'active', '2025-01-19 10:14:53', '2025-01-19 10:14:53'),
(318, 1, 'admin', '2025-01-19 16:58:36', '192.140.255.111', 'Google Chrome', 0, 'active', '2025-01-19 10:58:36', '2025-01-19 10:58:36'),
(319, 1, 'admin', '2025-01-19 17:00:04', '192.140.255.111', 'Google Chrome', 0, 'active', '2025-01-19 11:00:04', '2025-01-19 11:00:04'),
(320, 1, 'admin', '2025-01-19 17:10:32', '221.120.98.178', '', 0, 'active', '2025-01-19 11:10:32', '2025-01-19 11:10:32'),
(321, 1, 'admin', '2025-01-20 22:41:42', '192.140.255.111', '', 0, 'active', '2025-01-20 16:41:42', '2025-01-20 16:41:42'),
(322, 1, 'admin', '2025-01-21 13:02:04', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-21 07:02:04', '2025-01-21 07:02:04'),
(323, 1, 'admin', '2025-01-22 10:00:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-22 04:00:37', '2025-01-22 04:00:37'),
(324, 1, 'admin', '2025-01-24 18:13:52', '192.140.255.111', 'Google Chrome', 0, 'active', '2025-01-24 12:13:52', '2025-01-24 12:13:52'),
(325, 1, 'admin', '2025-01-24 21:40:04', '192.140.255.111', '', 0, 'active', '2025-01-24 15:40:04', '2025-01-24 15:40:04'),
(326, 1, 'admin', '2025-01-24 21:40:34', '192.140.255.111', '', 0, 'active', '2025-01-24 15:40:34', '2025-01-24 15:40:34'),
(327, 1, 'admin', '2025-01-24 21:40:39', '192.140.255.111', '', 0, 'active', '2025-01-24 15:40:39', '2025-01-24 15:40:39'),
(328, 1, 'admin', '2025-01-24 21:40:40', '192.140.255.111', '', 0, 'active', '2025-01-24 15:40:40', '2025-01-24 15:40:40'),
(329, 1, 'admin', '2025-01-24 21:40:54', '192.140.255.111', '', 0, 'active', '2025-01-24 15:40:54', '2025-01-24 15:40:54'),
(330, 1, 'admin', '2025-01-24 22:09:13', '192.140.255.111', '', 0, 'active', '2025-01-24 16:09:13', '2025-01-24 16:09:13'),
(331, 1, 'admin', '2025-01-24 22:54:01', '192.140.255.111', '', 0, 'active', '2025-01-24 16:54:01', '2025-01-24 16:54:01'),
(332, 1, 'admin', '2025-01-24 22:54:04', '192.140.255.111', '', 0, 'active', '2025-01-24 16:54:04', '2025-01-24 16:54:04'),
(333, 1, 'admin', '2025-01-24 22:54:08', '192.140.255.111', '', 0, 'active', '2025-01-24 16:54:08', '2025-01-24 16:54:08'),
(334, 1, 'admin', '2025-01-24 22:55:44', '192.140.255.111', '', 0, 'active', '2025-01-24 16:55:44', '2025-01-24 16:55:44'),
(335, 1, 'admin', '2025-01-24 22:55:56', '192.140.255.111', '', 0, 'active', '2025-01-24 16:55:56', '2025-01-24 16:55:56'),
(336, 1, 'admin', '2025-01-24 23:00:46', '192.140.255.111', '', 0, 'active', '2025-01-24 17:00:46', '2025-01-24 17:00:46'),
(337, 1, 'admin', '2025-01-24 23:14:42', '192.140.255.111', '', 0, 'active', '2025-01-24 17:14:42', '2025-01-24 17:14:42'),
(338, 1, 'admin', '2025-01-24 23:15:27', '192.140.255.111', '', 0, 'active', '2025-01-24 17:15:27', '2025-01-24 17:15:27'),
(339, 1, 'admin', '2025-01-24 23:16:41', '192.140.255.111', '', 0, 'active', '2025-01-24 17:16:41', '2025-01-24 17:16:41'),
(340, 1, 'admin', '2025-01-24 23:17:00', '192.140.255.111', '', 0, 'active', '2025-01-24 17:17:00', '2025-01-24 17:17:00'),
(341, 1, 'admin', '2025-01-24 23:17:08', '192.140.255.111', '', 0, 'active', '2025-01-24 17:17:08', '2025-01-24 17:17:08'),
(342, 1, 'admin', '2025-01-26 09:25:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-26 03:25:27', '2025-01-26 03:25:27'),
(343, 1, 'admin', '2025-01-26 09:32:34', '221.120.98.178', '', 0, 'active', '2025-01-26 03:32:34', '2025-01-26 03:32:34'),
(344, 1, 'admin', '2025-01-26 09:34:33', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-26 03:34:34', '2025-01-26 03:34:34'),
(345, 1, 'admin', '2025-01-26 15:07:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-26 09:07:07', '2025-01-26 09:07:07'),
(346, 1, 'admin', '2025-01-26 15:10:39', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-26 09:10:39', '2025-01-26 09:10:39'),
(347, 1, 'admin', '2025-01-27 10:45:04', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-27 04:45:04', '2025-01-27 04:45:04'),
(348, 1, 'admin', '2025-01-27 11:05:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-27 05:05:42', '2025-01-27 05:05:42'),
(349, 1, 'admin', '2025-01-27 15:03:15', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-27 09:03:15', '2025-01-27 09:03:15'),
(350, 1, 'admin', '2025-01-27 22:15:30', '54.86.50.139', '', 0, 'active', '2025-01-27 16:15:30', '2025-01-27 16:15:30'),
(351, 1, 'admin', '2025-01-27 23:40:54', '192.140.255.111', '', 0, 'active', '2025-01-27 17:40:54', '2025-01-27 17:40:54'),
(352, 1, 'admin', '2025-01-27 23:42:06', '192.140.255.111', '', 0, 'active', '2025-01-27 17:42:06', '2025-01-27 17:42:06'),
(353, 1, 'admin', '2025-01-27 23:42:10', '192.140.255.111', '', 0, 'active', '2025-01-27 17:42:10', '2025-01-27 17:42:10'),
(354, 1, 'admin', '2025-01-27 23:42:23', '192.140.255.111', '', 0, 'active', '2025-01-27 17:42:23', '2025-01-27 17:42:23'),
(355, 1, 'admin', '2025-01-27 23:42:45', '192.140.255.111', '', 0, 'active', '2025-01-27 17:42:45', '2025-01-27 17:42:45'),
(356, 1, 'admin', '2025-01-27 23:49:53', '192.140.255.111', '', 0, 'active', '2025-01-27 17:49:53', '2025-01-27 17:49:53'),
(357, 1, 'admin', '2025-01-28 12:36:27', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-28 06:36:27', '2025-01-28 06:36:27'),
(358, 1, 'admin', '2025-01-28 16:23:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-28 10:23:37', '2025-01-28 10:23:37'),
(359, 1, 'admin', '2025-01-29 19:05:44', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-29 13:05:44', '2025-01-29 13:05:44'),
(360, 1, 'admin', '2025-01-30 16:21:31', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-01-30 10:21:31', '2025-01-30 10:21:31'),
(361, 1, 'admin', '2025-02-02 15:18:53', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-02 09:18:53', '2025-02-02 09:18:53'),
(362, 1, 'admin', '2025-02-02 16:31:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-02 10:31:07', '2025-02-02 10:31:07'),
(363, 1, 'admin', '2025-02-03 10:29:55', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-03 04:29:55', '2025-02-03 04:29:55'),
(364, 1, 'admin', '2025-02-03 16:29:43', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-03 10:29:43', '2025-02-03 10:29:43'),
(365, 1, 'admin', '2025-02-04 11:29:14', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-04 05:29:14', '2025-02-04 05:29:14'),
(366, 1, 'admin', '2025-02-05 10:30:59', '202.5.58.113', 'Google Chrome', 0, 'active', '2025-02-05 04:30:59', '2025-02-05 04:30:59'),
(367, 1, 'admin', '2025-02-07 19:57:32', '192.140.255.111', '', 0, 'active', '2025-02-07 13:57:32', '2025-02-07 13:57:32'),
(368, 1, 'admin', '2025-02-07 19:59:01', '192.140.255.111', '', 0, 'active', '2025-02-07 13:59:01', '2025-02-07 13:59:01'),
(369, 1, 'admin', '2025-02-07 20:06:08', '192.140.255.111', 'Google Chrome', 0, 'active', '2025-02-07 14:06:08', '2025-02-07 14:06:08'),
(370, 1, 'admin', '2025-02-09 15:12:37', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-09 09:12:37', '2025-02-09 09:12:37'),
(371, 1, 'admin', '2025-02-09 15:13:43', '27.147.215.234', 'Google Chrome', 0, 'active', '2025-02-09 09:13:43', '2025-02-09 09:13:43'),
(372, 1, 'admin', '2025-02-09 15:21:16', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-09 09:21:16', '2025-02-09 09:21:16'),
(373, 1, 'admin', '2025-02-10 11:07:43', '202.5.58.113', 'Google Chrome', 0, 'active', '2025-02-10 05:07:43', '2025-02-10 05:07:43'),
(374, 1, 'admin', '2025-02-10 11:28:32', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-02-10 05:28:32', '2025-02-10 05:28:32'),
(375, 1, 'admin', '2025-02-10 19:01:44', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-02-10 13:01:44', '2025-02-10 13:01:44'),
(376, 1, 'admin', '2025-02-11 13:30:03', '221.120.98.178', '', 0, 'active', '2025-02-11 07:30:03', '2025-02-11 07:30:03'),
(377, 1, 'admin', '2025-02-11 14:29:23', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-11 08:29:23', '2025-02-11 08:29:23'),
(378, 1, 'admin', '2025-02-11 14:39:14', '27.147.215.234', 'Google Chrome', 0, 'active', '2025-02-11 08:39:14', '2025-02-11 08:39:14'),
(379, 1, 'admin', '2025-02-11 15:24:34', '27.147.215.234', '', 0, 'active', '2025-02-11 09:24:34', '2025-02-11 09:24:34'),
(380, 1, 'admin', '2025-02-11 15:32:58', '221.120.98.178', '', 0, 'active', '2025-02-11 09:32:58', '2025-02-11 09:32:58'),
(381, 1, 'admin', '2025-02-11 15:39:56', '221.120.98.178', '', 0, 'active', '2025-02-11 09:39:56', '2025-02-11 09:39:56'),
(382, 1, 'admin', '2025-02-11 17:30:31', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-11 11:30:32', '2025-02-11 11:30:32'),
(383, 1, 'admin', '2025-02-11 18:46:31', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-11 12:46:31', '2025-02-11 12:46:31'),
(384, 1, 'admin', '2025-02-12 10:20:03', '202.5.58.113', 'Google Chrome', 0, 'active', '2025-02-12 04:20:03', '2025-02-12 04:20:03'),
(385, 1, 'admin', '2025-02-12 14:11:02', '202.5.58.113', 'Google Chrome', 0, 'active', '2025-02-12 08:11:02', '2025-02-12 08:11:02'),
(386, 1, 'admin', '2025-02-12 18:46:55', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-12 12:46:55', '2025-02-12 12:46:55');
INSERT INTO `user_login_histories` (`id`, `user_id`, `user_guard`, `login_at`, `login_ip`, `login_browser_client`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(387, 1, 'admin', '2025-02-13 11:48:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-13 05:48:01', '2025-02-13 05:48:01'),
(388, 1, 'admin', '2025-02-13 13:12:10', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-13 07:12:10', '2025-02-13 07:12:10'),
(389, 1, 'admin', '2025-02-13 15:31:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-13 09:31:42', '2025-02-13 09:31:42'),
(390, 1, 'admin', '2025-02-13 17:39:06', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-02-13 11:39:06', '2025-02-13 11:39:06'),
(391, 1, 'admin', '2025-02-14 10:04:06', '103.113.149.90', 'Mozilla Firefox', 0, 'active', '2025-02-14 04:04:06', '2025-02-14 04:04:06'),
(392, 1, 'admin', '2025-02-17 09:46:12', '221.120.98.178', 'Mozilla Firefox', 0, 'active', '2025-02-17 03:46:12', '2025-02-17 03:46:12'),
(393, 1, 'admin', '2025-02-17 11:34:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-17 05:34:46', '2025-02-17 05:34:46'),
(394, 1, 'admin', '2025-02-18 09:54:40', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-18 03:54:40', '2025-02-18 03:54:40'),
(395, 1, 'admin', '2025-02-18 17:04:00', '192.140.255.111', '', 0, 'active', '2025-02-18 11:04:00', '2025-02-18 11:04:00'),
(396, 1, 'admin', '2025-02-18 17:12:59', '202.134.11.236', '', 0, 'active', '2025-02-18 11:12:59', '2025-02-18 11:12:59'),
(397, 1, 'admin', '2025-02-18 18:36:55', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-18 12:36:55', '2025-02-18 12:36:55'),
(398, 1, 'admin', '2025-02-19 12:45:36', '221.120.98.178', '', 0, 'active', '2025-02-19 06:45:36', '2025-02-19 06:45:36'),
(399, 1, 'admin', '2025-02-19 16:29:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-19 10:29:57', '2025-02-19 10:29:57'),
(400, 1, 'admin', '2025-02-20 09:42:04', '221.120.98.178', '', 0, 'active', '2025-02-20 03:42:04', '2025-02-20 03:42:04'),
(401, 1, 'admin', '2025-02-20 10:02:23', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-20 04:02:23', '2025-02-20 04:02:23'),
(402, 1, 'admin', '2025-02-20 14:57:04', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-20 08:57:04', '2025-02-20 08:57:04'),
(403, 1, 'admin', '2025-02-20 18:17:25', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-20 12:17:25', '2025-02-20 12:17:25'),
(404, 1, 'admin', '2025-02-21 23:54:57', '180.92.226.125', 'Mozilla Firefox', 0, 'active', '2025-02-21 17:54:57', '2025-02-21 17:54:57'),
(405, 1, 'admin', '2025-02-22 10:00:59', '202.5.58.113', 'Mozilla Firefox', 0, 'active', '2025-02-22 04:00:59', '2025-02-22 04:00:59'),
(406, 1, 'admin', '2025-02-22 10:17:44', '202.5.58.113', 'Mozilla Firefox', 0, 'active', '2025-02-22 04:17:44', '2025-02-22 04:17:44'),
(407, 1, 'admin', '2025-02-22 10:42:26', '202.5.58.113', 'Google Chrome', 0, 'active', '2025-02-22 04:42:26', '2025-02-22 04:42:26'),
(408, 1, 'admin', '2025-02-22 13:56:22', '202.5.58.113', 'Google Chrome', 0, 'active', '2025-02-22 07:56:22', '2025-02-22 07:56:22'),
(409, 1, 'admin', '2025-02-22 14:26:02', '202.5.58.113', '', 0, 'active', '2025-02-22 08:26:02', '2025-02-22 08:26:02'),
(410, 1, 'admin', '2025-02-22 14:30:39', '103.230.104.59', '', 0, 'active', '2025-02-22 08:30:39', '2025-02-22 08:30:39'),
(411, 1, 'admin', '2025-02-22 14:30:57', '59.152.2.33', '', 0, 'active', '2025-02-22 08:30:57', '2025-02-22 08:30:57'),
(412, 1, 'admin', '2025-02-22 17:00:19', '202.5.58.113', 'Mozilla Firefox', 0, 'active', '2025-02-22 11:00:19', '2025-02-22 11:00:19'),
(413, 1, 'admin', '2025-02-23 12:14:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-23 06:14:42', '2025-02-23 06:14:42'),
(414, 1, 'admin', '2025-02-23 14:20:21', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-23 08:20:21', '2025-02-23 08:20:21'),
(415, 1, 'admin', '2025-02-24 10:39:57', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-24 04:39:57', '2025-02-24 04:39:57'),
(416, 1, 'admin', '2025-02-25 13:00:24', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-25 07:00:24', '2025-02-25 07:00:24'),
(417, 1, 'admin', '2025-02-25 15:35:38', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-25 09:35:38', '2025-02-25 09:35:38'),
(418, 1, 'admin', '2025-02-26 14:53:33', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-26 08:53:33', '2025-02-26 08:53:33'),
(419, 1, 'admin', '2025-02-27 14:45:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-27 08:45:30', '2025-02-27 08:45:30'),
(420, 1, 'admin', '2025-02-27 18:37:02', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-02-27 12:37:02', '2025-02-27 12:37:02'),
(421, 1, 'admin', '2025-03-01 11:19:05', '202.5.58.113', 'Google Chrome', 0, 'active', '2025-03-01 05:19:05', '2025-03-01 05:19:05'),
(422, 1, 'admin', '2025-03-02 07:37:23', '192.140.255.111', '', 0, 'active', '2025-03-02 01:37:23', '2025-03-02 01:37:23'),
(423, 1, 'admin', '2025-03-02 09:58:21', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-02 03:58:21', '2025-03-02 03:58:21'),
(424, 1, 'admin', '2025-03-03 08:33:07', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-03 02:33:07', '2025-03-03 02:33:07'),
(425, 1, 'admin', '2025-03-03 08:53:42', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-03 02:53:42', '2025-03-03 02:53:42'),
(426, 1, 'admin', '2025-03-03 12:50:30', '221.120.98.178', '', 0, 'active', '2025-03-03 06:50:30', '2025-03-03 06:50:30'),
(427, 1, 'admin', '2025-03-04 08:43:00', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-04 02:43:00', '2025-03-04 02:43:00'),
(428, 1, 'admin', '2025-03-04 22:26:18', '192.140.255.111', 'Google Chrome', 0, 'active', '2025-03-04 16:26:18', '2025-03-04 16:26:18'),
(429, 1, 'admin', '2025-03-04 22:35:02', '192.140.255.111', '', 0, 'active', '2025-03-04 16:35:02', '2025-03-04 16:35:02'),
(430, 1, 'admin', '2025-03-05 02:44:13', '192.140.255.111', '', 0, 'active', '2025-03-04 20:44:13', '2025-03-04 20:44:13'),
(431, 1, 'admin', '2025-03-06 01:56:07', '192.140.255.111', '', 0, 'active', '2025-03-05 19:56:07', '2025-03-05 19:56:07'),
(432, 1, 'admin', '2025-03-06 07:14:57', '192.140.255.111', '', 0, 'active', '2025-03-06 01:14:57', '2025-03-06 01:14:57'),
(433, 1, 'admin', '2025-03-06 08:43:21', '221.120.98.178', '', 0, 'active', '2025-03-06 02:43:21', '2025-03-06 02:43:21'),
(434, 1, 'admin', '2025-03-06 08:48:11', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-06 02:48:11', '2025-03-06 02:48:11'),
(435, 3, 'admin', '2025-03-06 08:57:31', '221.120.98.178', '', 0, 'active', '2025-03-06 02:57:31', '2025-03-06 02:57:31'),
(436, 1, 'admin', '2025-03-06 08:58:01', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-06 02:58:01', '2025-03-06 02:58:01'),
(437, 3, 'admin', '2025-03-06 11:16:58', '221.120.98.178', '', 0, 'active', '2025-03-06 05:16:58', '2025-03-06 05:16:58'),
(438, 1, 'admin', '2025-03-06 11:19:30', '221.120.98.178', '', 0, 'active', '2025-03-06 05:19:30', '2025-03-06 05:19:30'),
(439, 1, 'admin', '2025-03-06 11:19:40', '182.163.117.209', '', 0, 'active', '2025-03-06 05:19:40', '2025-03-06 05:19:40'),
(440, 1, 'admin', '2025-03-06 11:36:46', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-06 05:36:46', '2025-03-06 05:36:46'),
(441, 1, 'admin', '2025-03-08 21:51:23', '192.140.255.111', '', 0, 'active', '2025-03-08 15:51:23', '2025-03-08 15:51:23'),
(442, 3, 'admin', '2025-03-08 21:54:31', '192.140.255.111', '', 0, 'active', '2025-03-08 15:54:31', '2025-03-08 15:54:31'),
(443, 1, 'admin', '2025-03-08 21:56:34', '192.140.255.111', '', 0, 'active', '2025-03-08 15:56:34', '2025-03-08 15:56:34'),
(444, 1, 'admin', '2025-03-09 09:09:28', '221.120.98.178', '', 0, 'active', '2025-03-09 03:09:28', '2025-03-09 03:09:28'),
(445, 4, 'admin', '2025-03-09 09:40:30', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-09 03:40:30', '2025-03-09 03:40:30'),
(446, 4, 'admin', '2025-03-09 09:43:41', '221.120.98.178', '', 0, 'active', '2025-03-09 03:43:41', '2025-03-09 03:43:41'),
(447, 1, 'admin', '2025-03-09 19:44:31', '103.199.152.5', 'Google Chrome', 0, 'active', '2025-03-09 13:44:31', '2025-03-09 13:44:31'),
(448, 1, 'admin', '2025-03-10 12:37:51', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-10 06:37:51', '2025-03-10 06:37:51'),
(449, 1, 'admin', '2025-03-10 14:11:34', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-10 08:11:34', '2025-03-10 08:11:34'),
(450, 1, 'admin', '2025-03-11 19:35:41', '192.140.255.111', '', 0, 'active', '2025-03-11 13:35:41', '2025-03-11 13:35:41'),
(451, 1, 'admin', '2025-03-11 19:35:45', '192.140.255.111', '', 0, 'active', '2025-03-11 13:35:45', '2025-03-11 13:35:45'),
(452, 1, 'admin', '2025-03-11 19:35:59', '192.140.255.111', '', 0, 'active', '2025-03-11 13:35:59', '2025-03-11 13:35:59'),
(453, 3, 'admin', '2025-03-11 19:41:32', '192.140.255.111', '', 0, 'active', '2025-03-11 13:41:32', '2025-03-11 13:41:32'),
(454, 1, 'admin', '2025-03-11 21:43:52', '103.127.4.14', '', 0, 'active', '2025-03-11 15:43:52', '2025-03-11 15:43:52'),
(455, 3, 'admin', '2025-03-12 01:53:52', '192.140.255.111', '', 0, 'active', '2025-03-11 19:53:52', '2025-03-11 19:53:52'),
(456, 1, 'admin', '2025-03-12 09:45:41', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-12 03:45:41', '2025-03-12 03:45:41'),
(457, 1, 'admin', '2025-03-12 12:28:23', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-12 06:28:23', '2025-03-12 06:28:23'),
(458, 1, 'admin', '2025-03-12 12:32:50', '221.120.98.178', 'Google Chrome', 0, 'active', '2025-03-12 06:32:50', '2025-03-12 06:32:50'),
(459, 1, 'admin', '2025-03-12 14:15:25', '221.120.98.178', '', 0, 'active', '2025-03-12 08:15:25', '2025-03-12 08:15:25'),
(460, 3, 'admin', '2025-03-12 20:12:05', '37.111.193.92', '', 0, 'active', '2025-03-12 14:12:05', '2025-03-12 14:12:05'),
(461, 1, 'admin', '2025-03-12 20:42:52', '192.140.255.111', '', 0, 'active', '2025-03-12 14:42:52', '2025-03-12 14:42:52'),
(462, 4, 'admin', '2025-03-12 20:53:05', '192.140.255.111', '', 0, 'active', '2025-03-12 14:53:05', '2025-03-12 14:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `wealths`
--

CREATE TABLE IF NOT EXISTS `wealths` (
  `id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wealths`
--

INSERT INTO `wealths` (`id`, `title`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Car', 0, 'active', '2024-11-04 03:00:57', '2024-11-04 03:00:57'),
(2, 'House', 2, 'active', '2024-11-04 03:01:08', '2024-11-28 00:00:59'),
(3, 'Real state', 1, 'active', '2024-11-04 03:01:41', '2024-11-10 04:58:00'),
(4, 'House', 4, 'deactive', '2024-12-25 05:06:47', '2024-12-25 05:06:47');

-- --------------------------------------------------------

--
-- Structure for view `activity_attendance_summary_views`
--
DROP TABLE IF EXISTS `activity_attendance_summary_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_attendance_summary_views` AS select `beneficiary_assigns`.`project_id` AS `project_id`,`beneficiary_assigns`.`indicator_id` AS `indicator_id`,`beneficiary_assigns`.`activity_id` AS `activity_id`,count(`beneficiary_assigns`.`id`) AS `beneficiary_assign_count`,(select count(`beneficiary_attendance_details`.`id`) from (`beneficiary_attendances` join `beneficiary_attendance_details` on((`beneficiary_attendances`.`id` = `beneficiary_attendance_details`.`beneficiary_attendance_id`))) where ((`beneficiary_assigns`.`project_id` = `beneficiary_attendances`.`project_id`) and (`beneficiary_assigns`.`indicator_id` = `beneficiary_attendances`.`indicator_id`) and (`beneficiary_assigns`.`activity_id` = `beneficiary_attendances`.`activity_id`) and (`beneficiary_attendance_details`.`attendance` = 1))) AS `beneficiary_present_count`,(((select count(`beneficiary_attendance_details`.`id`) from (`beneficiary_attendances` join `beneficiary_attendance_details` on((`beneficiary_attendances`.`id` = `beneficiary_attendance_details`.`beneficiary_attendance_id`))) where ((`beneficiary_assigns`.`project_id` = `beneficiary_attendances`.`project_id`) and (`beneficiary_assigns`.`indicator_id` = `beneficiary_attendances`.`indicator_id`) and (`beneficiary_assigns`.`activity_id` = `beneficiary_attendances`.`activity_id`) and (`beneficiary_attendance_details`.`attendance` = 1))) * 100) / count(`beneficiary_assigns`.`id`)) AS `present_percentage` from `beneficiary_assigns` group by `beneficiary_assigns`.`project_id`,`beneficiary_assigns`.`indicator_id`,`beneficiary_assigns`.`activity_id`;

-- --------------------------------------------------------

--
-- Structure for view `activity_survey_report_views`
--
DROP TABLE IF EXISTS `activity_survey_report_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_survey_report_views` AS select `survey_report_views`.`project_id` AS `project_id`,`survey_report_views`.`indicator_id` AS `indicator_id`,`survey_report_views`.`activity_id` AS `activity_id`,(sum(`survey_report_views`.`average_survey_mark`) / count(`survey_report_views`.`survey_id`)) AS `average_activity_survey_mark` from `survey_report_views` group by `survey_report_views`.`project_id`,`survey_report_views`.`indicator_id`,`survey_report_views`.`activity_id`;

-- --------------------------------------------------------

--
-- Structure for view `apip_views`
--
DROP TABLE IF EXISTS `apip_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `apip_views` AS select `p`.`id` AS `project_id`,ifnull((select sum(`pap_view`.`pap`) from (select `sap_view`.`project_id` AS `project_id`,`sap_view`.`indicator_id` AS `indicator_id`,(`sap_view`.`sap` * `activity_execute_view`.`eai`) AS `pap` from (((select `pa`.`project_id` AS `project_id`,`pa`.`indicator_id` AS `indicator_id`,`pas`.`activity_point` AS `ap`,count(`pa`.`id`) AS `tap`,(`pas`.`activity_point` / count(`pa`.`id`)) AS `sap` from (`project_activities` `pa` left join `project_achievement_setups` `pas` on((`pa`.`indicator_id` = `pas`.`indicator_id`))) group by `pa`.`project_id`,`pa`.`indicator_id`,`pas`.`activity_point`)) `sap_view` left join (select `pa`.`project_id` AS `project_id`,`pa`.`indicator_id` AS `indicator_id`,if((count(`ai`.`id`) > 0),count(distinct `pa`.`id`),0) AS `eai` from (`project_activities` `pa` left join `activity_infos` `ai` on((`pa`.`id` = `ai`.`activity_id`))) group by `pa`.`project_id`,`pa`.`indicator_id`) `activity_execute_view` on(((`sap_view`.`project_id` = `activity_execute_view`.`project_id`) and (`sap_view`.`indicator_id` = `activity_execute_view`.`indicator_id`))))) `pap_view` where (`pap_view`.`project_id` = `p`.`id`)),0) AS `total_pap`,count(distinct `i`.`id`) AS `ti`,(ifnull((select sum(`pap_view`.`pap`) from (select `sap_view`.`project_id` AS `project_id`,`sap_view`.`indicator_id` AS `indicator_id`,(`sap_view`.`sap` * `activity_execute_view`.`eai`) AS `pap` from (((select `pa`.`project_id` AS `project_id`,`pa`.`indicator_id` AS `indicator_id`,`pas`.`activity_point` AS `ap`,count(`pa`.`id`) AS `tap`,(`pas`.`activity_point` / count(`pa`.`id`)) AS `sap` from (`project_activities` `pa` left join `project_achievement_setups` `pas` on((`pa`.`indicator_id` = `pas`.`indicator_id`))) group by `pa`.`project_id`,`pa`.`indicator_id`,`pas`.`activity_point`)) `sap_view` left join (select `pa`.`project_id` AS `project_id`,`pa`.`indicator_id` AS `indicator_id`,if((count(`ai`.`id`) > 0),count(distinct `pa`.`id`),0) AS `eai` from (`project_activities` `pa` left join `activity_infos` `ai` on((`pa`.`id` = `ai`.`activity_id`))) group by `pa`.`project_id`,`pa`.`indicator_id`) `activity_execute_view` on(((`sap_view`.`project_id` = `activity_execute_view`.`project_id`) and (`sap_view`.`indicator_id` = `activity_execute_view`.`indicator_id`))))) `pap_view` where (`pap_view`.`project_id` = `p`.`id`)),0) / count(distinct `i`.`id`)) AS `apip` from (`projects` `p` left join `indicators` `i` on((`p`.`id` = `i`.`project_id`))) group by `p`.`id`;

-- --------------------------------------------------------

--
-- Structure for view `indicator_attendance_point_summary_views`
--
DROP TABLE IF EXISTS `indicator_attendance_point_summary_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `indicator_attendance_point_summary_views` AS select `indicator_attendance_summary_views`.`project_id` AS `project_id`,`indicator_attendance_summary_views`.`indicator_id` AS `indicator_id`,(case when (`indicator_attendance_summary_views`.`present_percentage_by_indicator` < 30) then `project_achievement_setups`.`activity_att_lt_30` when (`indicator_attendance_summary_views`.`present_percentage_by_indicator` < 50) then `project_achievement_setups`.`activity_att_lt_50` when (`indicator_attendance_summary_views`.`present_percentage_by_indicator` < 80) then `project_achievement_setups`.`activity_att_lt_80` when (`indicator_attendance_summary_views`.`present_percentage_by_indicator` <= 100) then `project_achievement_setups`.`activity_att_lt_100` else 0 end) AS `indicator_attendance_point` from (`indicator_attendance_summary_views` join `project_achievement_setups` on(((`indicator_attendance_summary_views`.`project_id` = `project_achievement_setups`.`project_id`) and (`indicator_attendance_summary_views`.`indicator_id` = `project_achievement_setups`.`indicator_id`))));

-- --------------------------------------------------------

--
-- Structure for view `indicator_attendance_summary_views`
--
DROP TABLE IF EXISTS `indicator_attendance_summary_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `indicator_attendance_summary_views` AS select `activity_attendance_summary_views`.`project_id` AS `project_id`,`activity_attendance_summary_views`.`indicator_id` AS `indicator_id`,sum(`activity_attendance_summary_views`.`present_percentage`) AS `present_percentage_count`,count(`activity_attendance_summary_views`.`activity_id`) AS `activity_count`,(sum(`activity_attendance_summary_views`.`present_percentage`) / count(`activity_attendance_summary_views`.`activity_id`)) AS `present_percentage_by_indicator` from `activity_attendance_summary_views` group by `activity_attendance_summary_views`.`project_id`,`activity_attendance_summary_views`.`indicator_id`;

-- --------------------------------------------------------

--
-- Structure for view `indicator_survey_point_report_views`
--
DROP TABLE IF EXISTS `indicator_survey_point_report_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `indicator_survey_point_report_views` AS select `indicator_survey_report_views`.`project_id` AS `project_id`,`indicator_survey_report_views`.`indicator_id` AS `indicator_id`,(case when (`indicator_survey_report_views`.`average_indicator_survey_mark` < 30) then `project_achievement_setups`.`survey_point_lt_30` when (`indicator_survey_report_views`.`average_indicator_survey_mark` < 50) then `project_achievement_setups`.`survey_point_lt_50` when (`indicator_survey_report_views`.`average_indicator_survey_mark` < 80) then `project_achievement_setups`.`survey_point_lt_80` when (`indicator_survey_report_views`.`average_indicator_survey_mark` <= 100) then `project_achievement_setups`.`survey_point_lt_100` else 0 end) AS `indicator_survey_point` from (`indicator_survey_report_views` join `project_achievement_setups` on(((`indicator_survey_report_views`.`project_id` = `project_achievement_setups`.`project_id`) and (`indicator_survey_report_views`.`indicator_id` = `project_achievement_setups`.`indicator_id`))));

-- --------------------------------------------------------

--
-- Structure for view `indicator_survey_report_views`
--
DROP TABLE IF EXISTS `indicator_survey_report_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `indicator_survey_report_views` AS select `activity_survey_report_views`.`project_id` AS `project_id`,`activity_survey_report_views`.`indicator_id` AS `indicator_id`,(sum(`activity_survey_report_views`.`average_activity_survey_mark`) / count(`activity_survey_report_views`.`activity_id`)) AS `average_indicator_survey_mark` from `activity_survey_report_views` group by `activity_survey_report_views`.`project_id`,`activity_survey_report_views`.`indicator_id`;

-- --------------------------------------------------------

--
-- Structure for view `project_achievement_views`
--
DROP TABLE IF EXISTS `project_achievement_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_achievement_views` AS select `with_project_achievement`.`project_id` AS `project_id`,sum(coalesce(`with_project_achievement`.`single_achievement`,0)) AS `achievement` from (select `apip_views`.`project_id` AS `project_id`,`apip_views`.`apip` AS `single_achievement` from `apip_views` union all select `project_attendance_views`.`project_id` AS `project_id`,`project_attendance_views`.`average_attendance` AS `single_achievement` from `project_attendance_views` union all select `project_survey_point_report_views`.`project_id` AS `project_id`,`project_survey_point_report_views`.`average_survey` AS `single_achievement` from `project_survey_point_report_views`) `with_project_achievement` group by `with_project_achievement`.`project_id`;

-- --------------------------------------------------------

--
-- Structure for view `project_attendance_views`
--
DROP TABLE IF EXISTS `project_attendance_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_attendance_views` AS select `indicator_attendance_point_summary_views`.`project_id` AS `project_id`,(sum(coalesce(`indicator_attendance_point_summary_views`.`indicator_attendance_point`,0)) / count(coalesce(`indicator_attendance_point_summary_views`.`indicator_id`,0))) AS `average_attendance` from `indicator_attendance_point_summary_views` group by `indicator_attendance_point_summary_views`.`project_id`;

-- --------------------------------------------------------

--
-- Structure for view `project_survey_point_report_views`
--
DROP TABLE IF EXISTS `project_survey_point_report_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_survey_point_report_views` AS select `indicator_survey_point_report_views`.`project_id` AS `project_id`,(sum(coalesce(`indicator_survey_point_report_views`.`indicator_survey_point`,0)) / count(coalesce(`indicator_survey_point_report_views`.`indicator_id`,0))) AS `average_survey` from `indicator_survey_point_report_views` group by `indicator_survey_point_report_views`.`project_id`;

-- --------------------------------------------------------

--
-- Structure for view `survey_beneficiary_views`
--
DROP TABLE IF EXISTS `survey_beneficiary_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `survey_beneficiary_views` AS select `surveys`.`project_id` AS `project_id`,`surveys`.`indicator_id` AS `indicator_id`,`surveys`.`activity_id` AS `activity_id`,`surveys`.`id` AS `survey_id`,`survey_beneficiaries`.`id` AS `survey_beneficiary_id`,((`survey_beneficiaries`.`total_mark` * 100) / `survey_question_mark_views`.`total_question_marks`) AS `beneficiary_mark_percentage` from ((`surveys` join `survey_beneficiaries` on((`surveys`.`id` = `survey_beneficiaries`.`survey_id`))) join `survey_question_mark_views` on((`survey_question_mark_views`.`activity_id` = `surveys`.`activity_id`)));

-- --------------------------------------------------------

--
-- Structure for view `survey_question_mark_views`
--
DROP TABLE IF EXISTS `survey_question_mark_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `survey_question_mark_views` AS select `survey_forms`.`project_id` AS `project_id`,`survey_forms`.`indicator_id` AS `indicator_id`,`survey_forms`.`activity_id` AS `activity_id`,sum(`survey_questions`.`mark`) AS `total_question_marks` from (`survey_forms` join `survey_questions` on((`survey_forms`.`id` = `survey_questions`.`survey_form_id`))) group by `survey_forms`.`project_id`,`survey_forms`.`indicator_id`,`survey_forms`.`activity_id`;

-- --------------------------------------------------------

--
-- Structure for view `survey_report_views`
--
DROP TABLE IF EXISTS `survey_report_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `survey_report_views` AS select `survey_beneficiary_views`.`project_id` AS `project_id`,`survey_beneficiary_views`.`indicator_id` AS `indicator_id`,`survey_beneficiary_views`.`activity_id` AS `activity_id`,`survey_beneficiary_views`.`survey_id` AS `survey_id`,(sum(`survey_beneficiary_views`.`beneficiary_mark_percentage`) / count(`survey_beneficiary_views`.`survey_beneficiary_id`)) AS `average_survey_mark` from `survey_beneficiary_views` group by `survey_beneficiary_views`.`project_id`,`survey_beneficiary_views`.`indicator_id`,`survey_beneficiary_views`.`activity_id`,`survey_beneficiary_views`.`survey_id`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_infos`
--
ALTER TABLE `activity_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_role_id_index` (`role_id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiary_assigns`
--
ALTER TABLE `beneficiary_assigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiary_attendances`
--
ALTER TABLE `beneficiary_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiary_attendance_details`
--
ALTER TABLE `beneficiary_attendance_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiary_diseases`
--
ALTER TABLE `beneficiary_diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiary_education`
--
ALTER TABLE `beneficiary_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiary_family_members`
--
ALTER TABLE `beneficiary_family_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiary_healths`
--
ALTER TABLE `beneficiary_healths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiary_liabilites`
--
ALTER TABLE `beneficiary_liabilites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiary_occupations`
--
ALTER TABLE `beneficiary_occupations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiary_wealths`
--
ALTER TABLE `beneficiary_wealths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `benificiary_assets`
--
ALTER TABLE `benificiary_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_infos`
--
ALTER TABLE `help_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liabilities`
--
ALTER TABLE `liabilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_validators`
--
ALTER TABLE `media_validators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `occupations`
--
ALTER TABLE `occupations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_project_name_unique` (`project_name`);

--
-- Indexes for table `project_achievement_setups`
--
ALTER TABLE `project_achievement_setups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_achievement_setups_project_id_foreign` (`project_id`),
  ADD KEY `project_achievement_setups_indicator_id_foreign` (`indicator_id`);

--
-- Indexes for table `project_activities`
--
ALTER TABLE `project_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_activities_project_id_foreign` (`project_id`),
  ADD KEY `project_activities_indicator_id_foreign` (`indicator_id`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_answers`
--
ALTER TABLE `survey_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_beneficiaries`
--
ALTER TABLE `survey_beneficiaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `survey_beneficiaries_survey_id_foreign` (`survey_id`),
  ADD KEY `survey_beneficiaries_beneficiary_id_foreign` (`beneficiary_id`),
  ADD KEY `survey_beneficiaries_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `survey_beneficiary_results`
--
ALTER TABLE `survey_beneficiary_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_forms`
--
ALTER TABLE `survey_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_questions`
--
ALTER TABLE `survey_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thanas`
--
ALTER TABLE `thanas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upazilas`
--
ALTER TABLE `upazilas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_login_histories`
--
ALTER TABLE `user_login_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wealths`
--
ALTER TABLE `wealths`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_infos`
--
ALTER TABLE `activity_infos`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=852;
--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT for table `beneficiary_assigns`
--
ALTER TABLE `beneficiary_assigns`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=567;
--
-- AUTO_INCREMENT for table `beneficiary_attendances`
--
ALTER TABLE `beneficiary_attendances`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `beneficiary_attendance_details`
--
ALTER TABLE `beneficiary_attendance_details`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `beneficiary_diseases`
--
ALTER TABLE `beneficiary_diseases`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `beneficiary_education`
--
ALTER TABLE `beneficiary_education`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `beneficiary_family_members`
--
ALTER TABLE `beneficiary_family_members`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `beneficiary_healths`
--
ALTER TABLE `beneficiary_healths`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=186;
--
-- AUTO_INCREMENT for table `beneficiary_liabilites`
--
ALTER TABLE `beneficiary_liabilites`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `beneficiary_occupations`
--
ALTER TABLE `beneficiary_occupations`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `beneficiary_wealths`
--
ALTER TABLE `beneficiary_wealths`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `benificiary_assets`
--
ALTER TABLE `benificiary_assets`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=254;
--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `help_infos`
--
ALTER TABLE `help_infos`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `indicators`
--
ALTER TABLE `indicators`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=248;
--
-- AUTO_INCREMENT for table `liabilities`
--
ALTER TABLE `liabilities`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `media_validators`
--
ALTER TABLE `media_validators`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `occupations`
--
ALTER TABLE `occupations`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=415;
--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `project_achievement_setups`
--
ALTER TABLE `project_achievement_setups`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `project_activities`
--
ALTER TABLE `project_activities`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `survey_answers`
--
ALTER TABLE `survey_answers`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=221;
--
-- AUTO_INCREMENT for table `survey_beneficiaries`
--
ALTER TABLE `survey_beneficiaries`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `survey_beneficiary_results`
--
ALTER TABLE `survey_beneficiary_results`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `survey_forms`
--
ALTER TABLE `survey_forms`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `survey_questions`
--
ALTER TABLE `survey_questions`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `thanas`
--
ALTER TABLE `thanas`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `upazilas`
--
ALTER TABLE `upazilas`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_login_histories`
--
ALTER TABLE `user_login_histories`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=463;
--
-- AUTO_INCREMENT for table `wealths`
--
ALTER TABLE `wealths`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
