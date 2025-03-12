-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 29, 2024 at 10:35 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `event` varchar(191) DEFAULT NULL,
  `batch_uuid` varchar(191) DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('r','ur','restored') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'ur' COMMENT 'r=read, ur=unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `batch_uuid`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 202, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 202, \"name\": \"XmlController\", \"route\": null, \"parent_id\": null}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(2, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 203, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 203, \"name\": \"index\", \"route\": \"searchData.index\", \"parent_id\": 202}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(3, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 204, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 204, \"name\": \"generateXmlFile\", \"route\": \"searchData.generateXmlFile\", \"parent_id\": 202}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(4, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 205, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 205, \"name\": \"getXmlFile\", \"route\": \"searchData.getXmlFile\", \"parent_id\": 202}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(5, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 206, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 206, \"name\": \"getBrokenUrl\", \"route\": \"searchData.getBrokenUrl\", \"parent_id\": 202}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(6, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 207, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 207, \"name\": \"MediaValidatorController\", \"route\": null, \"parent_id\": null}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(7, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 208, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 208, \"name\": \"index\", \"route\": \"mediaValidator.index\", \"parent_id\": 207}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(8, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 209, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 209, \"name\": \"create\", \"route\": \"mediaValidator.create\", \"parent_id\": 207}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(9, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 210, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 210, \"name\": \"store\", \"route\": \"mediaValidator.store\", \"parent_id\": 207}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(10, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 211, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 211, \"name\": \"show\", \"route\": \"mediaValidator.show\", \"parent_id\": 207}}', '2024-09-09 22:48:20', '2024-09-14 23:32:41', 'r'),
(11, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 212, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 212, \"name\": \"edit\", \"route\": \"mediaValidator.edit\", \"parent_id\": 207}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(12, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 213, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 213, \"name\": \"update\", \"route\": \"mediaValidator.update\", \"parent_id\": 207}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(13, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 214, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 214, \"name\": \"destroy\", \"route\": \"mediaValidator.destroy\", \"parent_id\": 207}}', '2024-09-09 22:48:20', '2024-09-09 22:48:20', 'ur'),
(14, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 1, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": 600, \"created_at\": \"2024-09-10T06:11:19.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"profile\", \"field_type\": \"image\", \"min_height\": 600, \"model_name\": \"Admin\", \"updated_at\": \"2024-09-10T06:11:19.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": [\"600x600\", \"400x400\", \"200x200\"]}}', '2024-09-10 00:11:19', '2024-09-10 00:11:19', 'ur'),
(15, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 48, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 48, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-10 06:20:48\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-10T06:20:48.000000Z\", \"updated_at\": \"2024-09-10T06:20:48.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-10 00:20:48', '2024-09-10 00:20:48', 'ur'),
(16, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 1, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 1, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": 600, \"created_at\": \"2024-09-10T06:11:19.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"profile\", \"field_type\": \"image\", \"min_height\": 600, \"model_name\": \"Admin\", \"updated_at\": \"2024-09-10T06:11:19.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": [\"600x600\", \"400x400\", \"200x200\"]}}', '2024-09-10 00:35:49', '2024-09-10 00:35:49', 'ur'),
(17, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 2, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": 600, \"created_at\": \"2024-09-10T06:36:15.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"profile\", \"field_type\": \"image\", \"min_height\": 600, \"model_name\": \"Admin\", \"updated_at\": \"2024-09-10T06:36:15.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": [\"600x600\"]}}', '2024-09-10 00:36:15', '2024-09-10 00:36:15', 'ur'),
(18, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 3, \"status\": \"active\", \"sorting\": 0, \"max_size\": 6000, \"min_width\": null, \"created_at\": \"2024-09-10T06:38:39.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Notice\", \"updated_at\": \"2024-09-10T06:38:39.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-10 00:38:39', '2024-09-10 00:38:39', 'ur'),
(19, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 2, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"field_type\": \"image\", \"updated_at\": \"2024-09-10T06:36:15.000000Z\"}, \"attributes\": {\"field_type\": \"file\", \"updated_at\": \"2024-09-10T06:54:25.000000Z\"}}', '2024-09-10 00:54:25', '2024-09-10 00:54:25', 'ur'),
(20, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 2, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"field_type\": \"file\", \"updated_at\": \"2024-09-10T06:54:25.000000Z\"}, \"attributes\": {\"field_type\": \"image\", \"updated_at\": \"2024-09-10T06:55:21.000000Z\"}}', '2024-09-10 00:55:21', '2024-09-10 00:55:21', 'ur'),
(21, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 2, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"min_width\": 600, \"field_type\": \"image\", \"min_height\": 600, \"updated_at\": \"2024-09-10T06:55:21.000000Z\", \"resize_value\": [\"600x600\"]}, \"attributes\": {\"min_width\": null, \"field_type\": \"file\", \"min_height\": null, \"updated_at\": \"2024-09-10T06:55:41.000000Z\", \"resize_value\": []}}', '2024-09-10 00:55:41', '2024-09-10 00:55:41', 'ur'),
(22, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 2, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"min_width\": null, \"field_type\": \"file\", \"min_height\": null, \"updated_at\": \"2024-09-10T06:55:41.000000Z\", \"resize_value\": []}, \"attributes\": {\"min_width\": 600, \"field_type\": \"image\", \"min_height\": 600, \"updated_at\": \"2024-09-10T06:57:49.000000Z\", \"resize_value\": [\"600x600\", \"400x400\"]}}', '2024-09-10 00:57:49', '2024-09-10 00:57:49', 'ur'),
(23, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 3, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"max_size\": 6000, \"updated_at\": \"2024-09-10T06:38:39.000000Z\"}, \"attributes\": {\"max_size\": 5000, \"updated_at\": \"2024-09-10T07:03:52.000000Z\"}}', '2024-09-10 01:03:52', '2024-09-10 01:03:52', 'ur'),
(24, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 4, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": 600, \"created_at\": \"2024-09-10T07:04:25.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"profile_image\", \"field_type\": \"image\", \"min_height\": 600, \"model_name\": \"Admin\", \"updated_at\": \"2024-09-10T07:04:25.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": [\"600x600\"]}}', '2024-09-10 01:04:25', '2024-09-10 01:04:25', 'ur'),
(25, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 49, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 49, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-10 09:33:59\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-10T09:33:59.000000Z\", \"updated_at\": \"2024-09-10T09:33:59.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-10 03:33:59', '2024-09-10 03:33:59', 'ur'),
(26, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 5, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": 600, \"created_at\": \"2024-09-10T09:46:00.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"image\", \"field_type\": \"image\", \"min_height\": 830, \"model_name\": \"Album\", \"updated_at\": \"2024-09-10T09:46:00.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": [\"600x600\", \"339x260\", \"242x242\"]}}', '2024-09-10 03:46:00', '2024-09-10 03:46:00', 'ur'),
(27, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 215, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 215, \"name\": \"getFields\", \"route\": \"mediaValidator.getFields\", \"parent_id\": 207}}', '2024-09-10 03:58:10', '2024-09-10 03:58:10', 'ur'),
(28, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 50, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 50, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-10 10:11:43\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-10T10:11:43.000000Z\", \"updated_at\": \"2024-09-10T10:11:43.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-10 04:11:43', '2024-09-10 04:11:43', 'ur'),
(29, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 51, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 51, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-10 10:13:56\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-10T10:13:56.000000Z\", \"updated_at\": \"2024-09-10T10:13:56.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-10 04:13:56', '2024-09-10 04:13:56', 'ur'),
(30, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"updated_at\": \"2024-09-10T09:46:00.000000Z\", \"resize_value\": [\"600x600\", \"339x260\", \"242x242\"]}, \"attributes\": {\"updated_at\": \"2024-09-10T11:51:48.000000Z\", \"resize_value\": [\"1000x600\"]}}', '2024-09-10 05:51:48', '2024-09-10 05:51:48', 'ur'),
(31, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 52, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 52, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-10 12:14:15\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-10T12:14:15.000000Z\", \"updated_at\": \"2024-09-10T12:14:15.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-10 06:14:15', '2024-09-10 06:14:15', 'ur'),
(32, 'default', 'Nogor - created this', 'App\\Models\\Website\\Gallery\\Album', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 5, \"name\": \"dfdf df df dfd\", \"slug\": \"dfdf-df-df-dfd\", \"type\": \"Photos\", \"image\": \"{\\\"1000x600\\\":\\\"upload\\\\/album\\\\/1000x600\\\\/18a7af26-c647-4379-afd8-780bf44a9eaf.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/3e0a4d9a-0e52-467c-bc83-f4293787b308.avif\\\"}\", \"status\": \"active\", \"sorting\": 4, \"created_at\": \"10 Sep 2024 12:15 PM\", \"updated_at\": \"10 Sep 2024  12:15 PM\"}}', '2024-09-10 06:15:39', '2024-09-10 06:15:39', 'ur'),
(33, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"max_size\": 5000, \"min_height\": 830, \"updated_at\": \"2024-09-10T11:51:48.000000Z\", \"resize_value\": [\"1000x600\"]}, \"attributes\": {\"max_size\": 5120, \"min_height\": 600, \"updated_at\": \"2024-09-10T12:17:37.000000Z\", \"resize_value\": [\"600x600\", \"339x260\", \"242x242\"]}}', '2024-09-10 06:17:37', '2024-09-10 06:17:37', 'ur'),
(34, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"1000x600\\\":\\\"upload\\\\/album\\\\/1000x600\\\\/18a7af26-c647-4379-afd8-780bf44a9eaf.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/3e0a4d9a-0e52-467c-bc83-f4293787b308.avif\\\"}\", \"updated_at\": \"10 Sep 2024  12:15 PM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/a0e1c535-2fe5-43df-b836-3ecf54007c3d.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/7c5381e9-d9a9-45fe-9bb7-e7a97e569942.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/dd418890-153f-40e0-8779-47ccf5cdbd6c.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/a1427ade-413e-4b51-99d1-159171b7e059.avif\\\"}\", \"updated_at\": \"10 Sep 2024  12:18 PM\"}}', '2024-09-10 06:18:11', '2024-09-10 06:18:11', 'ur'),
(35, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"min_height\": 600, \"updated_at\": \"2024-09-10T12:17:37.000000Z\"}, \"attributes\": {\"min_height\": 830, \"updated_at\": \"2024-09-10T12:19:02.000000Z\"}}', '2024-09-10 06:19:02', '2024-09-10 06:19:02', 'ur'),
(36, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/a0e1c535-2fe5-43df-b836-3ecf54007c3d.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/7c5381e9-d9a9-45fe-9bb7-e7a97e569942.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/dd418890-153f-40e0-8779-47ccf5cdbd6c.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/a1427ade-413e-4b51-99d1-159171b7e059.avif\\\"}\", \"updated_at\": \"10 Sep 2024  12:18 PM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/4f275c15-9db0-41b3-911c-4576cbf4ddb2.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/5c4709fe-89db-4749-839e-911bc650af6d.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/519143e2-5979-48d0-94af-56e98941e741.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/33258978-975f-4233-8680-707fd6bd3e8d.avif\\\"}\", \"updated_at\": \"10 Sep 2024  12:19 PM\"}}', '2024-09-10 06:19:28', '2024-09-10 06:19:28', 'ur'),
(37, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/4f275c15-9db0-41b3-911c-4576cbf4ddb2.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/5c4709fe-89db-4749-839e-911bc650af6d.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/519143e2-5979-48d0-94af-56e98941e741.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/33258978-975f-4233-8680-707fd6bd3e8d.avif\\\"}\", \"updated_at\": \"10 Sep 2024  12:19 PM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/fe3ded4e-e071-40bf-92a8-944639b6a537.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/d228cae5-c7bd-46f7-87dd-e074c717356c.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/ea0df5e0-e7f4-4e8a-8503-e6ebdf1ba1ac.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/fa1dddce-607d-426f-a88e-b18de0978518.avif\\\"}\", \"updated_at\": \"10 Sep 2024  13:02 PM\"}}', '2024-09-10 07:02:35', '2024-09-10 07:02:35', 'ur'),
(38, 'default', 'Nogor - created this', 'App\\Models\\Website\\Gallery\\Album', 6, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 6, \"name\": \"ddfd fd\", \"slug\": \"ddfd-fd\", \"type\": \"Photos\", \"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/365dade3-4235-4863-8091-8877aaaa7b4c.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/4bda9d78-1310-4527-87cb-225766b24927.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/faefa318-f95b-4448-bebb-24be62ed72c9.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/bbdc12c2-5283-47dd-a2e3-d25f13782501.avif\\\"}\", \"status\": \"active\", \"sorting\": 5, \"created_at\": \"10 Sep 2024 13:03 PM\", \"updated_at\": \"10 Sep 2024  13:03 PM\"}}', '2024-09-10 07:03:34', '2024-09-10 07:03:34', 'ur'),
(39, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/fe3ded4e-e071-40bf-92a8-944639b6a537.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/d228cae5-c7bd-46f7-87dd-e074c717356c.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/ea0df5e0-e7f4-4e8a-8503-e6ebdf1ba1ac.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/fa1dddce-607d-426f-a88e-b18de0978518.avif\\\"}\", \"updated_at\": \"10 Sep 2024  13:02 PM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/d6141094-7bb0-4391-a1a7-cb00d8d634d9.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/f1f1a019-da90-4f97-a1aa-9ffbc6a426be.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/b08b08df-882f-4146-ad7b-6fa9b71651a6.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/004a6b3a-9b7b-4664-9b86-e6d839d15dcd.avif\\\"}\", \"updated_at\": \"10 Sep 2024  13:03 PM\"}}', '2024-09-10 07:03:52', '2024-09-10 07:03:52', 'ur'),
(40, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/d6141094-7bb0-4391-a1a7-cb00d8d634d9.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/f1f1a019-da90-4f97-a1aa-9ffbc6a426be.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/b08b08df-882f-4146-ad7b-6fa9b71651a6.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/004a6b3a-9b7b-4664-9b86-e6d839d15dcd.avif\\\"}\", \"updated_at\": \"10 Sep 2024  13:03 PM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/852b1de9-e48c-4354-9dbb-3e33ef5860e0.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/45320216-8eeb-4aed-9f50-75254b2984ff.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/e221fd82-ff17-47ae-a65f-51af9b3ca33f.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/e1f6f1a2-852f-4d12-8231-5b411d0e205a.avif\\\"}\", \"updated_at\": \"10 Sep 2024  13:04 PM\"}}', '2024-09-10 07:04:09', '2024-09-10 07:04:09', 'ur'),
(41, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"min_height\": 830, \"updated_at\": \"2024-09-10T12:19:02.000000Z\"}, \"attributes\": {\"min_height\": 600, \"updated_at\": \"2024-09-10T13:05:26.000000Z\"}}', '2024-09-10 07:05:26', '2024-09-10 07:05:26', 'ur'),
(42, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 3, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/d9ae070c-ee4e-4411-909f-c739cfb4dd1f.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/6c7068ff-f2e8-4c7e-bc22-26e4038b4c66.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/3c49475e-d1eb-479c-85cf-ba237025ba79.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/99e249c7-d754-46e3-9e4b-05c93aa88878.avif\\\"}\", \"updated_at\": \"29 Aug 2024  04:42 AM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/277794ea-52cc-47b9-93ae-5c1ff09dc16f.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/cc639b37-9d0a-457e-a3f2-6bbd08645123.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/8fd57b0b-6d78-4ed2-8ab1-88b7eb518426.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/829cd128-de13-4bc5-bd49-e080aa823126.avif\\\"}\", \"updated_at\": \"10 Sep 2024  13:06 PM\"}}', '2024-09-10 07:06:13', '2024-09-10 07:06:13', 'ur'),
(43, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 53, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 53, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-11 03:40:51\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-11T03:40:51.000000Z\", \"updated_at\": \"2024-09-11T03:40:51.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-10 21:40:51', '2024-09-10 21:40:51', 'ur'),
(44, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"updated_at\": \"2024-09-10T13:05:26.000000Z\", \"resize_value\": [\"600x600\", \"339x260\", \"242x242\"]}, \"attributes\": {\"updated_at\": \"2024-09-11T03:47:14.000000Z\", \"resize_value\": [\"900x600\"]}}', '2024-09-10 21:47:14', '2024-09-10 21:47:14', 'ur'),
(45, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"min_width\": 600, \"updated_at\": \"2024-09-11T03:47:14.000000Z\", \"resize_value\": [\"900x600\"]}, \"attributes\": {\"min_width\": 900, \"updated_at\": \"2024-09-11T03:47:59.000000Z\", \"resize_value\": [\"600x600\", \"339x260\", \"242x242\"]}}', '2024-09-10 21:47:59', '2024-09-10 21:47:59', 'ur'),
(46, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"min_width\": 900, \"updated_at\": \"2024-09-11T03:47:59.000000Z\"}, \"attributes\": {\"min_width\": 600, \"updated_at\": \"2024-09-11T05:15:19.000000Z\"}}', '2024-09-10 23:15:19', '2024-09-10 23:15:19', 'ur'),
(47, 'default', 'Nogor - created this', 'App\\Models\\Website\\Gallery\\Album', 7, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 7, \"name\": \"My photos 2\", \"slug\": \"my-photos-2\", \"type\": \"Photos\", \"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/066fe499-5098-4743-8307-49432c80a999.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/9e779903-c929-4de2-a5fd-4553c6ecde11.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/fc0d3730-bb7d-439a-90bc-3f786446c51b.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/924b37f2-ee14-4058-a783-eaafc6157baf.avif\\\"}\", \"status\": \"active\", \"sorting\": 6, \"created_at\": \"11 Sep 2024 05:27 AM\", \"updated_at\": \"11 Sep 2024  05:27 AM\"}}', '2024-09-10 23:27:24', '2024-09-10 23:27:24', 'ur'),
(48, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"updated_at\": \"2024-09-11T05:15:19.000000Z\", \"resize_value\": [\"600x600\", \"339x260\", \"242x242\"]}, \"attributes\": {\"updated_at\": \"2024-09-11T05:29:38.000000Z\", \"resize_value\": [\"600x600\", \"340x340\", \"242x242\", \"50x50\"]}}', '2024-09-10 23:29:38', '2024-09-10 23:29:38', 'ur'),
(49, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 2, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/a5376c35-f18b-49d3-a8c8-2e3036f44c86.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/2a9b6de0-8840-4d98-a0f1-bb45185e7551.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/027bfbad-175f-4068-97a3-ba6f089e11d7.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/a0154c7d-0426-4c13-a558-cb4ac7716b04.avif\\\"}\", \"updated_at\": \"29 Aug 2024  04:41 AM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/c9341330-116b-434a-98fc-878fe408ba02.avif\\\",\\\"340x340\\\":\\\"upload\\\\/album\\\\/340x340\\\\/2dca2970-a3a6-4a65-8e18-326a352d1283.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/7a56a2a6-4f85-4947-a456-429b2e4da4c1.avif\\\",\\\"50x50\\\":\\\"upload\\\\/album\\\\/50x50\\\\/3e70a500-61a2-42dd-922c-a497efae4b3a.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/a0797bba-afd4-459d-9fc2-33de3330194f.avif\\\"}\", \"updated_at\": \"11 Sep 2024  05:30 AM\"}}', '2024-09-10 23:30:00', '2024-09-10 23:30:00', 'ur'),
(50, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 3, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/277794ea-52cc-47b9-93ae-5c1ff09dc16f.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/cc639b37-9d0a-457e-a3f2-6bbd08645123.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/8fd57b0b-6d78-4ed2-8ab1-88b7eb518426.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/829cd128-de13-4bc5-bd49-e080aa823126.avif\\\"}\", \"updated_at\": \"10 Sep 2024  13:06 PM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/c9612e6b-f50a-489b-b797-665372a8b935.avif\\\",\\\"340x340\\\":\\\"upload\\\\/album\\\\/340x340\\\\/03726c0c-987b-4853-b6ac-8e1f5bdbbdaf.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/6a68db13-e318-482a-8281-93a11531ee83.avif\\\",\\\"50x50\\\":\\\"upload\\\\/album\\\\/50x50\\\\/16bb5912-e143-4200-a7e8-5710be38072b.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/9a1702fe-24dc-4bd4-83ae-2f4063c8f6ad.avif\\\"}\", \"updated_at\": \"11 Sep 2024  06:38 AM\"}}', '2024-09-11 00:38:13', '2024-09-11 00:38:13', 'ur'),
(51, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 4, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/4a4d22c6-0935-4e9c-b742-d3b3a940ab57.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/da4e9219-0445-43a6-a468-420c519377d1.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/c835c573-538b-492c-a9b6-262126b4f8e9.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/06a930cd-adf9-4959-8c2e-889ea06a90e3.avif\\\"}\", \"updated_at\": \"29 Aug 2024  07:38 AM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/1d3c334c-eb19-4f76-8273-ca991a1e074b.avif\\\",\\\"340x340\\\":\\\"upload\\\\/album\\\\/340x340\\\\/ba824ad5-5e25-408d-b8ca-29921ba26e85.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/476c0ee7-be8f-462e-89b4-1fc32a661833.avif\\\",\\\"50x50\\\":\\\"upload\\\\/album\\\\/50x50\\\\/14d8b754-5b6e-462e-9b9f-65b042482412.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/dfb58bd9-0d21-4228-b950-d144e7ddcae8.avif\\\"}\", \"updated_at\": \"11 Sep 2024  06:38 AM\"}}', '2024-09-11 00:38:27', '2024-09-11 00:38:27', 'ur'),
(52, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/852b1de9-e48c-4354-9dbb-3e33ef5860e0.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/45320216-8eeb-4aed-9f50-75254b2984ff.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/e221fd82-ff17-47ae-a65f-51af9b3ca33f.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/e1f6f1a2-852f-4d12-8231-5b411d0e205a.avif\\\"}\", \"updated_at\": \"10 Sep 2024  13:04 PM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/82736f2a-5ec5-4233-9ce8-a1ee2216b432.avif\\\",\\\"340x340\\\":\\\"upload\\\\/album\\\\/340x340\\\\/7ff43f96-b783-47bc-8c36-75ec4c0bd9fc.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/94c85070-eb76-45e3-94e9-8e633d816038.avif\\\",\\\"50x50\\\":\\\"upload\\\\/album\\\\/50x50\\\\/b08acd6b-9883-4d24-9381-6dad791ed51d.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/53a3e958-faf1-4388-8ffb-df2c52ab904c.avif\\\"}\", \"updated_at\": \"11 Sep 2024  06:38 AM\"}}', '2024-09-11 00:38:47', '2024-09-11 00:38:47', 'ur'),
(53, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 6, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/365dade3-4235-4863-8091-8877aaaa7b4c.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/4bda9d78-1310-4527-87cb-225766b24927.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/faefa318-f95b-4448-bebb-24be62ed72c9.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/bbdc12c2-5283-47dd-a2e3-d25f13782501.avif\\\"}\", \"updated_at\": \"10 Sep 2024  13:03 PM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/0fb53e31-d8bc-4b45-86ca-44cf9ad66bf2.avif\\\",\\\"340x340\\\":\\\"upload\\\\/album\\\\/340x340\\\\/c17f156e-a8b6-48cd-956c-e21728ac7a51.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/6981ce54-c664-4338-829c-bd86249dcbec.avif\\\",\\\"50x50\\\":\\\"upload\\\\/album\\\\/50x50\\\\/af722796-260b-4159-9037-f8bc8deed3a1.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/8c55aa20-0fb4-4ae6-8ad8-65b2eb66adc5.avif\\\"}\", \"updated_at\": \"11 Sep 2024  06:39 AM\"}}', '2024-09-11 00:39:29', '2024-09-11 00:39:29', 'ur'),
(54, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 7, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/066fe499-5098-4743-8307-49432c80a999.avif\\\",\\\"339x260\\\":\\\"upload\\\\/album\\\\/339x260\\\\/9e779903-c929-4de2-a5fd-4553c6ecde11.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/fc0d3730-bb7d-439a-90bc-3f786446c51b.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/924b37f2-ee14-4058-a783-eaafc6157baf.avif\\\"}\", \"updated_at\": \"11 Sep 2024  05:27 AM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/727290e2-f017-4ce4-8e4d-4fbb17be110b.avif\\\",\\\"340x340\\\":\\\"upload\\\\/album\\\\/340x340\\\\/bda87025-8460-445e-bb2f-c2fe1624f63d.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/7320063e-625b-4aac-931c-ced4d17c870c.avif\\\",\\\"50x50\\\":\\\"upload\\\\/album\\\\/50x50\\\\/ce364f7b-2951-4be3-b2ad-59428e62ae57.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/1b635c35-aa60-484e-931d-2d4ac43d4bc5.avif\\\"}\", \"updated_at\": \"11 Sep 2024  06:39 AM\"}}', '2024-09-11 00:39:46', '2024-09-11 00:39:46', 'ur'),
(55, 'default', 'Nogor - created this', 'App\\Models\\Website\\Gallery\\Album', 8, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 8, \"name\": \"A Demo Gallery\", \"slug\": \"a-demo-gallery\", \"type\": \"Photos\", \"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/bfd95927-f4ba-4fc5-aad5-761e41167fec.avif\\\",\\\"340x340\\\":\\\"upload\\\\/album\\\\/340x340\\\\/2526fa53-e413-42b9-8136-c5a5bc87656c.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/65770c65-03f8-43a8-a810-ead3250c5d1e.avif\\\",\\\"50x50\\\":\\\"upload\\\\/album\\\\/50x50\\\\/0343bfa8-7747-4f85-a651-8cfc154e6a82.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/1b4e95c3-1434-4bd2-9eba-751898a7bb44.avif\\\"}\", \"status\": \"active\", \"sorting\": 7, \"created_at\": \"11 Sep 2024 06:40 AM\", \"updated_at\": \"11 Sep 2024  06:40 AM\"}}', '2024-09-11 00:40:34', '2024-09-11 00:40:34', 'ur'),
(56, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 4, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 4, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": 600, \"created_at\": \"2024-09-10T07:04:25.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"profile_image\", \"field_type\": \"image\", \"min_height\": 600, \"model_name\": \"Admin\", \"updated_at\": \"2024-09-10T07:04:25.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": [\"600x600\"]}}', '2024-09-11 00:50:12', '2024-09-11 00:50:12', 'ur'),
(57, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 3, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 3, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-10T06:38:39.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Notice\", \"updated_at\": \"2024-09-10T07:03:52.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-11 00:50:17', '2024-09-11 00:50:17', 'ur'),
(58, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 2, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"updated_at\": \"2024-09-10T06:57:49.000000Z\", \"resize_value\": [\"600x600\", \"400x400\"]}, \"attributes\": {\"updated_at\": \"2024-09-11T06:50:34.000000Z\", \"resize_value\": [\"600x600\", \"300x300\", \"50x50\"]}}', '2024-09-11 00:50:34', '2024-09-11 00:50:34', 'ur'),
(59, 'default', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Album', 2, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/c9341330-116b-434a-98fc-878fe408ba02.avif\\\",\\\"340x340\\\":\\\"upload\\\\/album\\\\/340x340\\\\/2dca2970-a3a6-4a65-8e18-326a352d1283.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/7a56a2a6-4f85-4947-a456-429b2e4da4c1.avif\\\",\\\"50x50\\\":\\\"upload\\\\/album\\\\/50x50\\\\/3e70a500-61a2-42dd-922c-a497efae4b3a.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/a0797bba-afd4-459d-9fc2-33de3330194f.avif\\\"}\", \"updated_at\": \"11 Sep 2024  05:30 AM\"}, \"attributes\": {\"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/baeb2a9f-e2c2-47a0-97ea-2f4d5520612b.avif\\\",\\\"340x340\\\":\\\"upload\\\\/album\\\\/340x340\\\\/7bd5cfad-7bc6-4be5-a991-11f48c3765cd.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/454298fb-c81e-495f-b666-d8e6a05cc371.avif\\\",\\\"50x50\\\":\\\"upload\\\\/album\\\\/50x50\\\\/00fbbafd-97ef-433b-ae21-2e12a7fa6579.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/8a1cc982-761e-4ff8-9b88-60e9ab135adc.avif\\\"}\", \"updated_at\": \"11 Sep 2024  07:20 AM\"}}', '2024-09-11 01:20:45', '2024-09-11 01:20:45', 'ur'),
(60, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 54, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 54, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-12 02:57:23\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-12T02:57:23.000000Z\", \"updated_at\": \"2024-09-12T02:57:23.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-11 20:57:23', '2024-09-11 20:57:23', 'ur'),
(61, 'Site Settings', 'Nogor - updated this', 'App\\Models\\System\\SiteSetting', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240819044633-2901.png\", \"address\": \"Dhaka\", \"logo_small\": \"http://localhost/csfd/public/images/n-logo.png\", \"updated_at\": \"2024-08-19T04:46:33.000000Z\"}, \"attributes\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240912032127-9299.png\", \"address\": \"sdjhasdjhaswdrsdg dfz\", \"logo_small\": \"http://localhost/csfd/public/storage/upload/conf/240912032127-4301php-code.jpg\", \"updated_at\": \"2024-09-12T03:21:27.000000Z\"}}', '2024-09-11 21:21:27', '2024-09-11 21:21:27', 'ur'),
(62, 'Site Settings', 'Nogor - updated this', 'App\\Models\\System\\SiteSetting', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240912032127-9299.png\", \"logo_small\": \"http://localhost/csfd/public/storage/upload/conf/240912032127-4301php-code.jpg\", \"updated_at\": \"2024-09-12T03:21:27.000000Z\"}, \"attributes\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240912032215-8147.png\", \"logo_small\": \"http://localhost/csfd/public/storage/upload/conf/240912032215-2453php-code.jpg\", \"updated_at\": \"2024-09-12T03:22:15.000000Z\"}}', '2024-09-11 21:22:15', '2024-09-11 21:22:15', 'ur'),
(63, 'Site Settings', 'Nogor - updated this', 'App\\Models\\System\\SiteSetting', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240912032215-8147.png\", \"logo_small\": \"http://localhost/csfd/public/storage/upload/conf/240912032215-2453php-code.jpg\", \"updated_at\": \"2024-09-12T03:22:15.000000Z\"}, \"attributes\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240912032411-5140.png\", \"logo_small\": \"http://localhost/csfd/public/storage/upload/conf/240912032411-7031php-code.jpg\", \"updated_at\": \"2024-09-12T03:24:11.000000Z\"}}', '2024-09-11 21:24:11', '2024-09-11 21:24:11', 'ur'),
(64, 'Site Settings', 'Nogor - updated this', 'App\\Models\\System\\SiteSetting', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240912032411-5140.png\", \"logo_small\": \"http://localhost/csfd/public/storage/upload/conf/240912032411-7031php-code.jpg\", \"updated_at\": \"2024-09-12T03:24:11.000000Z\"}, \"attributes\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240912032540-4964.png\", \"logo_small\": \"http://localhost/csfd/public/storage/upload/conf/240912032540-6641n-logo (1) (1).png\", \"updated_at\": \"2024-09-12T03:25:40.000000Z\"}}', '2024-09-11 21:25:40', '2024-09-11 21:25:40', 'ur'),
(65, 'Site Settings', 'Nogor - updated this', 'App\\Models\\System\\SiteSetting', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"logo_small\": \"http://localhost/csfd/public/storage/upload/conf/240912032540-6641n-logo (1) (1).png\", \"updated_at\": \"2024-09-12T03:25:40.000000Z\"}, \"attributes\": {\"logo_small\": \"http://localhost/csfd/public/storage/upload/conf/240912032724-9435n-logo (1) (2).png\", \"updated_at\": \"2024-09-12T03:27:24.000000Z\"}}', '2024-09-11 21:27:24', '2024-09-11 21:27:24', 'ur'),
(66, 'Site Settings', 'Nogor - updated this', 'App\\Models\\System\\SiteSetting', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240912032540-4964.png\", \"logo_small\": \"http://localhost/csfd/public/storage/upload/conf/240912032724-9435n-logo (1) (2).png\", \"updated_at\": \"2024-09-12T03:27:24.000000Z\"}, \"attributes\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240912033543-8081.png\", \"logo_small\": \"http://localhost/csfd/public/images/n-logo.png\", \"updated_at\": \"2024-09-12T03:35:43.000000Z\"}}', '2024-09-11 21:35:43', '2024-09-11 21:35:43', 'ur'),
(67, 'Site Settings', 'Nogor - updated this', 'App\\Models\\System\\SiteSetting', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240912033543-8081.png\", \"logo_small\": \"http://localhost/csfd/public/images/n-logo.png\", \"updated_at\": \"2024-09-12T03:35:43.000000Z\"}, \"attributes\": {\"logo\": \"http://localhost/csfd/public/storage/upload/conf/240912033836-6772.png\", \"logo_small\": \"http://localhost/csfd/public/storage/upload/conf/240912033836-4903.png\", \"updated_at\": \"2024-09-12T03:38:36.000000Z\"}}', '2024-09-11 21:38:36', '2024-09-11 21:38:36', 'ur'),
(68, 'Faq', 'Nogor - updated this', 'App\\Models\\Faq', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"answer\": \"<p>df dfdfd</p>\", \"updated_at\": \"2024-08-27T05:57:29.000000Z\"}, \"attributes\": {\"answer\": \"<p>Bangladesh is a small country.</p>\\n\\n<p><strong>Nogor Solutions Limited.</strong></p>\", \"updated_at\": \"2024-09-12T04:11:20.000000Z\"}}', '2024-09-11 22:11:20', '2024-09-11 22:11:20', 'ur'),
(69, 'Faq', 'Nogor - updated this', 'App\\Models\\Faq', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"answer\": \"<p>Bangladesh is a small country.</p>\\n\\n<p><strong>Nogor Solutions Limited.</strong></p>\", \"updated_at\": \"2024-09-12T04:11:20.000000Z\"}, \"attributes\": {\"answer\": null, \"updated_at\": \"2024-09-12T04:11:31.000000Z\"}}', '2024-09-11 22:11:31', '2024-09-11 22:11:31', 'ur'),
(70, 'Faq', 'Nogor - updated this', 'App\\Models\\Faq', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"answer\": null, \"updated_at\": \"2024-09-12T04:11:31.000000Z\"}, \"attributes\": {\"answer\": \"<p>this.is_initial_data_set</p>\", \"updated_at\": \"2024-09-12T04:11:39.000000Z\"}}', '2024-09-11 22:11:39', '2024-09-11 22:11:39', 'ur'),
(71, 'Faq', 'Nogor - updated this', 'App\\Models\\Faq', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"answer\": \"<p>this.is_initial_data_set</p>\", \"updated_at\": \"2024-09-12T04:11:39.000000Z\"}, \"attributes\": {\"answer\": \"<div class=\\\"warning custom-block\\\">\\n<p class=\\\"custom-block-title\\\">Use with Caution</p>\\n\\n<p>Sync watchers do not have batching and triggers every time a reactive mutation is detected. It&#39;s ok to use them to watch simple boolean values, but avoid using them on data sources that might be synchronously mutated many times, e.g. arrays.</p>\\n</div>\", \"updated_at\": \"2024-09-12T04:12:05.000000Z\"}}', '2024-09-11 22:12:05', '2024-09-11 22:12:05', 'ur'),
(72, 'Faq', 'Nogor - updated this', 'App\\Models\\Faq', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"answer\": \"<div class=\\\"warning custom-block\\\">\\n<p class=\\\"custom-block-title\\\">Use with Caution</p>\\n\\n<p>Sync watchers do not have batching and triggers every time a reactive mutation is detected. It&#39;s ok to use them to watch simple boolean values, but avoid using them on data sources that might be synchronously mutated many times, e.g. arrays.</p>\\n</div>\", \"updated_at\": \"2024-09-12T04:12:05.000000Z\"}, \"attributes\": {\"answer\": \"<div class=\\\"warning custom-block\\\">\\n<p class=\\\"custom-block-title\\\">Use with Caution</p>\\n\\n<p>Sync watchers do not have batching and triggers every time a reactive mutation is detected. It&#39;s ok to use them to watch simple boolean values, but avoid using them on data sources that might be synchronously mutated many times, e.g. arrays.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>Hello.</p>\\n</div>\", \"updated_at\": \"2024-09-12T04:12:19.000000Z\"}}', '2024-09-11 22:12:19', '2024-09-11 22:12:19', 'ur'),
(73, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 6, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 6, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5120, \"min_width\": 600, \"created_at\": \"2024-09-12T04:41:03.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"image\", \"field_type\": \"image\", \"min_height\": 600, \"model_name\": \"Content\", \"updated_at\": \"2024-09-12T04:41:03.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": [\"600x600\", \"200x200\", \"50x50\"]}}', '2024-09-11 22:41:03', '2024-09-11 22:41:03', 'ur'),
(74, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 55, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 55, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-12 04:41:27\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-12T04:41:27.000000Z\", \"updated_at\": \"2024-09-12T04:41:27.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-11 22:41:27', '2024-09-11 22:41:27', 'ur'),
(75, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 56, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 56, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-12 04:41:59\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-12T04:41:59.000000Z\", \"updated_at\": \"2024-09-12T04:41:59.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-11 22:41:59', '2024-09-11 22:41:59', 'ur'),
(76, 'Content', 'Nogor - created this', 'App\\Models\\Website\\Content\\Content', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 5, \"slug\": \"laboris-molestiae-ip\", \"image\": \"null\", \"title\": \"Laboris molestiae ip\", \"status\": \"active\", \"is_meta\": false, \"meta_tag\": [], \"created_at\": \"2024-09-12T05:58:34.000000Z\", \"updated_at\": \"2024-09-12T05:58:34.000000Z\", \"description\": \"<p>fdskfdfd dfsd fsdaf asdfsd</p>\", \"meta_description\": null}}', '2024-09-11 23:58:34', '2024-09-11 23:58:34', 'ur'),
(77, 'default', 'Nogor - created this', 'App\\Models\\Website\\Content\\ContentFile', 14, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 14, \"file\": \"upload/content-files/240912055834-3144ddd.pdf\", \"title\": \"Atque ut quidem id o\", \"sorting\": null, \"content_id\": 5, \"created_at\": \"2024-09-12T05:58:34.000000Z\", \"updated_at\": \"2024-09-12T05:58:34.000000Z\"}}', '2024-09-11 23:58:34', '2024-09-11 23:58:34', 'ur'),
(78, 'Content', 'Nogor - updated this', 'App\\Models\\Website\\Content\\Content', 5, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"updated_at\": \"2024-09-12T05:58:34.000000Z\", \"description\": \"<p>fdskfdfd dfsd fsdaf asdfsd</p>\"}, \"attributes\": {\"updated_at\": \"2024-09-12T06:00:17.000000Z\", \"description\": \"<p>Hello</p>\"}}', '2024-09-12 00:00:17', '2024-09-12 00:00:17', 'ur'),
(79, 'Events', 'Nogor user created this', 'App\\Models\\Events', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 1, \"slug\": \"et-eiusmod-enim-offi\", \"image\": null, \"title\": \"Et eiusmod enim offi\", \"venue\": \"Modi Nam dolor dolor\", \"status\": \"active\", \"sorting\": 4, \"end_date\": \"12 Sep, 2024\", \"meta_tag\": [\"\"], \"created_at\": \"2024-09-12T06:03:10.000000Z\", \"created_by\": \"Nogor\", \"created_ip\": \"::1\", \"start_date\": \"12 Sep, 2024\", \"updated_at\": \"2024-09-12T06:03:10.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"category_id\": 10, \"description\": \"<p>Hello Bangladesh dfkjdkfjdkf dkjfsdk fjdkf jsdkafj sdlkfj asdlkfj asdlkfjsdlkfj sdlkfj asdlkfj sdlkfj asdlkfj&nbsp;</p>\", \"highlighted_text\": \"Nihil voluptate elit\", \"meta_description\": null}}', '2024-09-12 00:03:10', '2024-09-12 00:03:10', 'ur'),
(80, 'EventSchedule', 'Nogor user created this', 'App\\Models\\EventSchedule', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 1, \"title\": \"Exercitation dicta d\", \"status\": \"active\", \"events_id\": 1, \"created_at\": \"2024-09-12T06:03:10.000000Z\", \"created_by\": \"Nogor\", \"created_ip\": \"::1\", \"updated_at\": \"2024-09-12T06:03:10.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"description\": \"Eius soluta consecte\", \"schedule_date\": \"2022-06-18\", \"schedule_time\": \"07:06:00\"}}', '2024-09-12 00:03:10', '2024-09-12 00:03:10', 'ur'),
(81, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 216, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 216, \"name\": \"DemoOneController\", \"route\": null, \"parent_id\": null}}', '2024-09-12 00:06:34', '2024-09-12 00:06:34', 'ur'),
(82, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 217, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 217, \"name\": \"index\", \"route\": \"demoOne.index\", \"parent_id\": 216}}', '2024-09-12 00:06:34', '2024-09-12 00:06:34', 'ur'),
(83, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 218, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 218, \"name\": \"create\", \"route\": \"demoOne.create\", \"parent_id\": 216}}', '2024-09-12 00:06:34', '2024-09-12 00:06:34', 'ur'),
(84, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 219, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 219, \"name\": \"store\", \"route\": \"demoOne.store\", \"parent_id\": 216}}', '2024-09-12 00:06:34', '2024-09-12 00:06:34', 'ur');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `batch_uuid`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`, `status`) VALUES
(85, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 220, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 220, \"name\": \"show\", \"route\": \"demoOne.show\", \"parent_id\": 216}}', '2024-09-12 00:06:34', '2024-09-12 00:06:34', 'ur'),
(86, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 221, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 221, \"name\": \"edit\", \"route\": \"demoOne.edit\", \"parent_id\": 216}}', '2024-09-12 00:06:34', '2024-09-12 00:06:34', 'ur'),
(87, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 222, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 222, \"name\": \"update\", \"route\": \"demoOne.update\", \"parent_id\": 216}}', '2024-09-12 00:06:34', '2024-09-12 00:06:34', 'ur'),
(88, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 223, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 223, \"name\": \"destroy\", \"route\": \"demoOne.destroy\", \"parent_id\": 216}}', '2024-09-12 00:06:34', '2024-09-12 00:06:34', 'ur'),
(89, 'DemoOne', 'Nogor - created this', 'App\\Models\\DemoOne', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 1, \"status\": \"active\", \"details\": \"<p>djjdkjd dfdkf dfjd</p>\", \"created_at\": \"2024-09-12T06:06:49.000000Z\", \"created_by\": 1, \"created_ip\": 1, \"updated_at\": \"2024-09-12T06:06:49.000000Z\", \"updated_by\": 1, \"updated_ip\": 1}}', '2024-09-12 00:06:49', '2024-09-12 05:19:47', 'r'),
(90, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 57, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 57, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-12 06:57:54\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-12T06:57:54.000000Z\", \"updated_at\": \"2024-09-12T06:57:54.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-12 00:57:54', '2024-09-12 00:57:54', 'ur'),
(91, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 58, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 58, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-12 09:16:43\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-12T09:16:43.000000Z\", \"updated_at\": \"2024-09-12T09:16:43.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-12 03:16:43', '2024-09-12 03:16:43', 'ur'),
(92, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 59, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 59, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-12 09:17:46\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-12T09:17:46.000000Z\", \"updated_at\": \"2024-09-12T09:17:46.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-12 03:17:46', '2024-09-12 03:17:46', 'ur'),
(93, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 60, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 60, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-12 10:30:17\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-12T10:30:17.000000Z\", \"updated_at\": \"2024-09-12T10:30:17.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-12 04:30:17', '2024-09-12 04:30:17', 'ur'),
(94, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 61, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 61, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-12 10:30:40\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-12T10:30:40.000000Z\", \"updated_at\": \"2024-09-12T10:30:40.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-12 04:30:41', '2024-09-12 04:30:41', 'ur'),
(95, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 62, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 62, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-12 10:35:34\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-12T10:35:34.000000Z\", \"updated_at\": \"2024-09-12T10:35:34.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-12 04:35:34', '2024-09-12 04:35:34', 'ur'),
(96, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 63, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 63, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-12 11:31:54\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-12T11:31:54.000000Z\", \"updated_at\": \"2024-09-12T11:31:54.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-12 05:31:54', '2024-09-12 05:31:54', 'ur'),
(97, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 64, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 64, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-12 12:13:13\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-12T12:13:13.000000Z\", \"updated_at\": \"2024-09-12T12:13:13.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-12 06:13:13', '2024-09-12 06:13:13', 'ur'),
(98, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 65, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 65, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 03:13:06\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T03:13:06.000000Z\", \"updated_at\": \"2024-09-15T03:13:06.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 21:13:06', '2024-09-14 21:13:06', 'ur'),
(99, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 66, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 66, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 03:13:51\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T03:13:51.000000Z\", \"updated_at\": \"2024-09-15T03:13:51.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 21:13:51', '2024-09-14 21:13:51', 'ur'),
(100, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 67, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 67, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 03:32:47\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T03:32:47.000000Z\", \"updated_at\": \"2024-09-15T03:32:47.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 21:32:47', '2024-09-14 21:32:47', 'ur'),
(101, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 68, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 68, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 03:42:21\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T03:42:21.000000Z\", \"updated_at\": \"2024-09-15T03:42:21.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 21:42:21', '2024-09-14 23:22:33', 'r'),
(102, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 69, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 69, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 04:02:22\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T04:02:22.000000Z\", \"updated_at\": \"2024-09-15T04:02:22.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 22:02:22', '2024-09-14 22:02:22', 'ur'),
(103, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 70, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 70, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 04:03:53\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T04:03:53.000000Z\", \"updated_at\": \"2024-09-15T04:03:53.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 22:03:53', '2024-09-14 22:03:53', 'ur'),
(104, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 71, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 71, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 04:08:12\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T04:08:12.000000Z\", \"updated_at\": \"2024-09-15T04:08:12.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 22:08:12', '2024-09-14 23:03:19', 'r'),
(105, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 72, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 72, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 04:59:34\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T04:59:34.000000Z\", \"updated_at\": \"2024-09-15T04:59:34.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 22:59:34', '2024-09-14 23:03:09', 'r'),
(106, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 73, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 73, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 05:19:56\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T05:19:56.000000Z\", \"updated_at\": \"2024-09-15T05:19:56.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 23:19:56', '2024-09-14 23:19:56', 'ur'),
(107, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 74, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 74, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 05:20:15\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T05:20:15.000000Z\", \"updated_at\": \"2024-09-15T05:20:15.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 23:20:15', '2024-09-14 23:20:15', 'ur'),
(108, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 75, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 75, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 05:20:35\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T05:20:35.000000Z\", \"updated_at\": \"2024-09-15T05:20:35.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 23:20:35', '2024-09-14 23:20:35', 'ur'),
(109, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 76, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 76, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 05:21:40\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T05:21:40.000000Z\", \"updated_at\": \"2024-09-15T05:21:40.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-14 23:21:41', '2024-09-14 23:29:48', 'r'),
(110, 'MediaValidator', 'Nogor - updated this', 'App\\Models\\MediaValidator', 6, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"max_size\": 5120, \"updated_at\": \"2024-09-12T04:41:03.000000Z\"}, \"attributes\": {\"max_size\": 5000, \"updated_at\": \"2024-09-15T05:28:08.000000Z\"}}', '2024-09-14 23:28:08', '2024-09-14 23:29:28', 'r'),
(111, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 10, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 10, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-14 23:33:29', '2024-09-14 23:33:40', 'r'),
(112, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 10, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 10, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-14 23:33:57', '2024-09-15 01:09:25', 'restored'),
(113, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 224, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 224, \"name\": \"restore\", \"route\": \"activityLog.restore\", \"parent_id\": 1}}', '2024-09-14 23:52:07', '2024-09-14 23:52:07', 'ur'),
(114, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 77, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 77, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 06:52:34\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T06:52:34.000000Z\", \"updated_at\": \"2024-09-15T06:52:34.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-15 00:52:34', '2024-09-15 00:52:43', 'r'),
(115, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 11, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 11, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": null}}', '2024-09-15 00:53:16', '2024-09-15 00:58:52', 'r'),
(116, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 12, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 12, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-15 00:56:25', '2024-09-15 00:58:57', 'r'),
(117, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 13, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 13, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-15 01:02:29', '2024-09-15 01:02:29', 'ur'),
(118, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 14, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 14, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-15 01:02:52', '2024-09-15 01:02:52', 'ur'),
(119, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 15, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 15, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-15 01:06:42', '2024-09-15 01:06:42', 'ur'),
(120, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 16, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 16, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-15 01:08:31', '2024-09-15 01:08:31', 'ur'),
(121, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 17, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 17, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-15 01:09:25', '2024-09-15 01:11:49', 'r'),
(122, 'default', 'Nogor - created this', 'App\\Models\\Website\\News', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 1, \"date\": \"15 Sep, 2024\", \"slug\": \"fdfd-fdsf\", \"image\": \"{\\\"200x200\\\":\\\"upload\\\\/news\\\\/200x200\\\\/c882132e-31a5-489f-8c6c-babd8512fee6.avif\\\",\\\"600x600\\\":\\\"upload\\\\/news\\\\/600x600\\\\/97b29753-13a8-432c-a3f6-b8dc200262aa.avif\\\",\\\"original\\\":\\\"upload\\\\/news\\\\/original\\\\/9a851011-cd93-4b49-b465-42b71943a3c8.avif\\\"}\", \"title\": \"fdfd fdsf\", \"status\": \"active\", \"sorting\": 1, \"meta_tag\": [], \"created_at\": \"15 Sep 2024 08:41 AM\", \"updated_at\": \"15 Sep 2024  08:41 AM\", \"category_id\": 11, \"description\": \"<p>dsafsdf sdd f</p>\", \"meta_description\": null}}', '2024-09-15 02:41:45', '2024-09-15 02:41:45', 'ur'),
(123, 'default', 'Nogor - deleted this', 'App\\Models\\Website\\News', 1, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 1, \"date\": \"15 Sep, 2024\", \"slug\": \"fdfd-fdsf\", \"image\": \"{\\\"200x200\\\":\\\"upload\\\\/news\\\\/200x200\\\\/c882132e-31a5-489f-8c6c-babd8512fee6.avif\\\",\\\"600x600\\\":\\\"upload\\\\/news\\\\/600x600\\\\/97b29753-13a8-432c-a3f6-b8dc200262aa.avif\\\",\\\"original\\\":\\\"upload\\\\/news\\\\/original\\\\/9a851011-cd93-4b49-b465-42b71943a3c8.avif\\\"}\", \"title\": \"fdfd fdsf\", \"status\": \"active\", \"sorting\": 1, \"meta_tag\": [], \"created_at\": \"15 Sep 2024 08:41 AM\", \"updated_at\": \"15 Sep 2024  08:41 AM\", \"category_id\": 11, \"description\": \"<p>dsafsdf sdd f</p>\", \"meta_description\": null}}', '2024-09-15 02:43:16', '2024-09-15 02:43:44', 'restored'),
(124, 'default', 'Nogor - created this', 'App\\Models\\Website\\News', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 2, \"date\": \"15 Sep, 2024\", \"slug\": \"fdfd-fdsf\", \"image\": \"{\\\"200x200\\\":\\\"upload\\\\/news\\\\/200x200\\\\/c882132e-31a5-489f-8c6c-babd8512fee6.avif\\\",\\\"600x600\\\":\\\"upload\\\\/news\\\\/600x600\\\\/97b29753-13a8-432c-a3f6-b8dc200262aa.avif\\\",\\\"original\\\":\\\"upload\\\\/news\\\\/original\\\\/9a851011-cd93-4b49-b465-42b71943a3c8.avif\\\"}\", \"title\": \"fdfd fdsf\", \"status\": \"active\", \"sorting\": 1, \"meta_tag\": null, \"created_at\": \"15 Sep 2024 08:41 AM\", \"updated_at\": \"15 Sep 2024  08:41 AM\", \"category_id\": 11, \"description\": \"<p>dsafsdf sdd f</p>\", \"meta_description\": null}}', '2024-09-15 02:43:44', '2024-09-15 02:45:09', 'r'),
(125, 'default', 'Nogor - deleted this', 'App\\Models\\Website\\News', 2, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 2, \"date\": \"15 Sep, 2024\", \"slug\": \"fdfd-fdsf\", \"image\": \"{\\\"200x200\\\":\\\"upload\\\\/news\\\\/200x200\\\\/c882132e-31a5-489f-8c6c-babd8512fee6.avif\\\",\\\"600x600\\\":\\\"upload\\\\/news\\\\/600x600\\\\/97b29753-13a8-432c-a3f6-b8dc200262aa.avif\\\",\\\"original\\\":\\\"upload\\\\/news\\\\/original\\\\/9a851011-cd93-4b49-b465-42b71943a3c8.avif\\\"}\", \"title\": \"fdfd fdsf\", \"status\": \"active\", \"sorting\": 1, \"meta_tag\": null, \"created_at\": \"15 Sep 2024 08:41 AM\", \"updated_at\": \"15 Sep 2024  08:41 AM\", \"category_id\": 11, \"description\": \"<p>dsafsdf sdd f</p>\", \"meta_description\": null}}', '2024-09-15 02:45:24', '2024-09-15 02:46:07', 'restored'),
(126, 'default', 'Nogor - created this', 'App\\Models\\Website\\News', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 3, \"date\": \"15 Sep, 2024\", \"slug\": \"fdfd-fdsf\", \"image\": \"{\\\"200x200\\\":\\\"upload\\\\/news\\\\/200x200\\\\/c882132e-31a5-489f-8c6c-babd8512fee6.avif\\\",\\\"600x600\\\":\\\"upload\\\\/news\\\\/600x600\\\\/97b29753-13a8-432c-a3f6-b8dc200262aa.avif\\\",\\\"original\\\":\\\"upload\\\\/news\\\\/original\\\\/9a851011-cd93-4b49-b465-42b71943a3c8.avif\\\"}\", \"title\": \"fdfd fdsf\", \"status\": \"active\", \"sorting\": 1, \"meta_tag\": null, \"created_at\": \"15 Sep 2024 08:41 AM\", \"updated_at\": \"15 Sep 2024  08:41 AM\", \"category_id\": 11, \"description\": \"<p>dsafsdf sdd f</p>\", \"meta_description\": null}}', '2024-09-15 02:46:07', '2024-09-15 02:46:07', 'ur'),
(127, 'default', 'Nogor - deleted this', 'App\\Models\\Website\\News', 3, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 3, \"date\": \"15 Sep, 2024\", \"slug\": \"fdfd-fdsf\", \"image\": \"{\\\"200x200\\\":\\\"upload\\\\/news\\\\/200x200\\\\/c882132e-31a5-489f-8c6c-babd8512fee6.avif\\\",\\\"600x600\\\":\\\"upload\\\\/news\\\\/600x600\\\\/97b29753-13a8-432c-a3f6-b8dc200262aa.avif\\\",\\\"original\\\":\\\"upload\\\\/news\\\\/original\\\\/9a851011-cd93-4b49-b465-42b71943a3c8.avif\\\"}\", \"title\": \"fdfd fdsf\", \"status\": \"active\", \"sorting\": 1, \"meta_tag\": null, \"created_at\": \"15 Sep 2024 08:41 AM\", \"updated_at\": \"15 Sep 2024  08:41 AM\", \"category_id\": 11, \"description\": \"<p>dsafsdf sdd f</p>\", \"meta_description\": null}}', '2024-09-15 02:51:04', '2024-09-15 02:51:35', 'restored'),
(128, 'default', 'Nogor - created this', 'App\\Models\\Website\\News', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 4, \"date\": \"15 Sep, 2024\", \"slug\": \"fdfd-fdsf\", \"image\": \"{\\\"200x200\\\":\\\"upload\\\\/news\\\\/200x200\\\\/c882132e-31a5-489f-8c6c-babd8512fee6.avif\\\",\\\"600x600\\\":\\\"upload\\\\/news\\\\/600x600\\\\/97b29753-13a8-432c-a3f6-b8dc200262aa.avif\\\",\\\"original\\\":\\\"upload\\\\/news\\\\/original\\\\/9a851011-cd93-4b49-b465-42b71943a3c8.avif\\\"}\", \"title\": \"fdfd fdsf\", \"status\": \"active\", \"sorting\": 1, \"meta_tag\": null, \"created_at\": \"15 Sep 2024 08:41 AM\", \"updated_at\": \"15 Sep 2024  08:41 AM\", \"category_id\": 11, \"description\": \"<p>dsafsdf sdd f</p>\", \"meta_description\": null}}', '2024-09-15 02:51:35', '2024-09-15 02:51:35', 'ur'),
(129, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 11, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 11, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-15 02:53:46', '2024-09-15 02:53:46', 'ur'),
(130, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 12, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 12, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-15 02:53:54', '2024-09-15 02:53:54', 'ur'),
(131, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 15, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 15, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-15 02:54:03', '2024-09-15 02:54:03', 'ur'),
(132, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 16, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 16, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-15 02:54:11', '2024-09-15 02:54:11', 'ur'),
(133, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 17, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 17, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": null, \"created_at\": \"2024-09-15T05:33:29.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"attachment\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Demo\", \"updated_at\": \"2024-09-15T05:33:29.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-15 02:54:20', '2024-09-15 02:54:20', 'ur'),
(134, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 6, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 6, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": 600, \"created_at\": \"2024-09-12T04:41:03.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"image\", \"field_type\": \"image\", \"min_height\": 600, \"model_name\": \"Content\", \"updated_at\": \"2024-09-15T05:28:08.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": [\"600x600\", \"200x200\", \"50x50\"]}}', '2024-09-15 02:54:40', '2024-09-15 02:55:09', 'restored'),
(135, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 18, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 18, \"status\": \"active\", \"sorting\": 0, \"max_size\": 5000, \"min_width\": 600, \"created_at\": \"2024-09-12T04:41:03.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"image\", \"field_type\": \"image\", \"min_height\": 600, \"model_name\": \"Content\", \"updated_at\": \"2024-09-15T05:28:08.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": [\"600x600\", \"200x200\", \"50x50\"]}}', '2024-09-15 02:55:09', '2024-09-15 02:55:09', 'ur'),
(136, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 78, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 78, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 09:56:52\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T09:56:52.000000Z\", \"updated_at\": \"2024-09-15T09:56:52.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-15 03:56:52', '2024-09-15 03:56:52', 'ur'),
(137, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 79, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 79, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 10:09:50\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T10:09:50.000000Z\", \"updated_at\": \"2024-09-15T10:09:50.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-15 04:09:50', '2024-09-15 04:09:50', 'ur'),
(138, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 80, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 80, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 10:12:07\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T10:12:07.000000Z\", \"updated_at\": \"2024-09-15T10:12:07.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-15 04:12:07', '2024-09-15 04:12:07', 'ur'),
(139, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 81, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 81, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 10:34:27\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T10:34:27.000000Z\", \"updated_at\": \"2024-09-15T10:34:27.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-15 04:34:27', '2024-09-15 04:34:27', 'ur'),
(140, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 82, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 82, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 10:36:38\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T10:36:38.000000Z\", \"updated_at\": \"2024-09-15T10:36:38.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-15 04:36:38', '2024-09-15 04:36:38', 'ur'),
(141, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 83, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 83, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 10:38:08\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T10:38:08.000000Z\", \"updated_at\": \"2024-09-15T10:38:08.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-15 04:38:08', '2024-09-15 04:38:08', 'ur'),
(142, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 84, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 84, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-15 10:42:15\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-15T10:42:15.000000Z\", \"updated_at\": \"2024-09-15T10:42:15.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-15 04:42:15', '2024-09-15 04:42:15', 'ur'),
(143, 'Category', 'Nogor - created this', 'App\\Models\\Category', 14, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 14, \"title\": \"dfdfdfdf\", \"status\": \"active\", \"sorting\": 12, \"created_at\": \"2024-09-15T10:42:30.000000Z\", \"updated_at\": \"2024-09-15T10:42:30.000000Z\", \"module_name\": \"Notice\"}}', '2024-09-15 04:42:30', '2024-09-15 04:42:30', 'ur'),
(144, 'Site Settings', 'Nogor - updated this', 'App\\Models\\System\\SiteSetting', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"updated_at\": \"2024-09-12T03:38:36.000000Z\", \"short_title\": \"nsl\"}, \"attributes\": {\"updated_at\": \"2024-09-15T10:44:47.000000Z\", \"short_title\": \"NSL\"}}', '2024-09-15 04:44:47', '2024-09-15 04:44:47', 'ur'),
(145, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 85, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 85, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-17 04:03:26\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-17T04:03:26.000000Z\", \"updated_at\": \"2024-09-17T04:03:26.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-16 22:03:26', '2024-09-16 22:03:26', 'ur'),
(146, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 19, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 19, \"status\": \"active\", \"sorting\": 0, \"max_size\": 500, \"min_width\": null, \"created_at\": \"2024-09-17T07:04:35.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"Ursa Andrews\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Kennan Garner\", \"updated_at\": \"2024-09-17T07:04:35.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-17 01:04:35', '2024-09-17 01:04:35', 'ur'),
(147, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 19, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 19, \"status\": \"active\", \"sorting\": 0, \"max_size\": 500, \"min_width\": null, \"created_at\": \"2024-09-17T07:04:35.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"Ursa Andrews\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Kennan Garner\", \"updated_at\": \"2024-09-17T07:04:35.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-17 01:04:43', '2024-09-17 01:05:21', 'restored'),
(148, 'MediaValidator', 'Nogor - created this', 'App\\Models\\MediaValidator', 20, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 20, \"status\": \"active\", \"sorting\": 0, \"max_size\": 500, \"min_width\": null, \"created_at\": \"2024-09-17T07:04:35.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"Ursa Andrews\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Kennan Garner\", \"updated_at\": \"2024-09-17T07:04:35.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-17 01:05:21', '2024-09-17 01:05:21', 'ur'),
(149, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 86, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 86, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-18 03:30:49\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-18T03:30:49.000000Z\", \"updated_at\": \"2024-09-18T03:30:49.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-17 21:30:50', '2024-09-17 21:30:50', 'ur'),
(150, 'MediaValidator', 'Nogor - deleted this', 'App\\Models\\MediaValidator', 20, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 20, \"status\": \"active\", \"sorting\": 0, \"max_size\": 500, \"min_width\": null, \"created_at\": \"2024-09-17T07:04:35.000000Z\", \"created_by\": null, \"created_ip\": null, \"field_name\": \"Ursa Andrews\", \"field_type\": \"file\", \"min_height\": null, \"model_name\": \"Kennan Garner\", \"updated_at\": \"2024-09-17T07:04:35.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"resize_value\": []}}', '2024-09-18 01:02:15', '2024-09-18 01:02:15', 'ur'),
(151, 'Page', 'Nogor - created this', 'App\\Models\\Page', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 1, \"title\": \"Quod quo et aperiam\", \"status\": \"active\", \"sorting\": 0, \"created_at\": \"2024-09-18T09:05:46.000000Z\", \"updated_at\": \"2024-09-18T09:05:46.000000Z\"}}', '2024-09-18 03:05:46', '2024-09-18 03:05:46', 'ur'),
(152, 'Page', 'Nogor - created this', 'App\\Models\\Page', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 2, \"title\": \"Quae aliquam dolor v\", \"status\": \"active\", \"sorting\": 0, \"created_at\": \"2024-09-18T09:05:50.000000Z\", \"updated_at\": \"2024-09-18T09:05:50.000000Z\"}}', '2024-09-18 03:05:50', '2024-09-18 03:05:50', 'ur'),
(153, 'Page', 'Nogor - created this', 'App\\Models\\Page', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 3, \"title\": \"Ducimus voluptas pa\", \"status\": \"active\", \"sorting\": 0, \"created_at\": \"2024-09-18T09:05:56.000000Z\", \"updated_at\": \"2024-09-18T09:05:56.000000Z\"}}', '2024-09-18 03:05:56', '2024-09-18 03:05:56', 'ur'),
(154, 'PageSeo', 'Nogor - created this', 'App\\Models\\PageSeo', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 1, \"image\": null, \"status\": \"active\", \"page_id\": 3, \"sorting\": 78, \"meta_tag\": [\"dfjkd\"], \"created_at\": \"2024-09-18T09:06:32.000000Z\", \"updated_at\": \"2024-09-18T09:06:32.000000Z\", \"meta_description\": \"Aut sit eius velit a\"}}', '2024-09-18 03:06:32', '2024-09-18 03:06:32', 'ur'),
(155, 'PageSeo', 'Nogor - created this', 'App\\Models\\PageSeo', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 2, \"image\": null, \"status\": \"active\", \"page_id\": 2, \"sorting\": 57, \"meta_tag\": [\"Maiores\"], \"created_at\": \"2024-09-18T09:06:48.000000Z\", \"updated_at\": \"2024-09-18T09:06:48.000000Z\", \"meta_description\": \"Soluta minima veniam\"}}', '2024-09-18 03:06:48', '2024-09-18 03:06:48', 'ur'),
(156, 'PageSeo', 'Nogor - created this', 'App\\Models\\PageSeo', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 3, \"image\": null, \"status\": \"deactive\", \"page_id\": 2, \"sorting\": 91, \"meta_tag\": [\"Qui\"], \"created_at\": \"2024-09-18T09:06:57.000000Z\", \"updated_at\": \"2024-09-18T09:06:57.000000Z\", \"meta_description\": \"Sit sit natus moles\"}}', '2024-09-18 03:06:57', '2024-09-18 03:06:57', 'ur'),
(157, 'PageSeo', 'Nogor - updated this', 'App\\Models\\PageSeo', 3, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"status\": \"deactive\", \"updated_at\": \"2024-09-18T09:06:57.000000Z\"}, \"attributes\": {\"status\": \"active\", \"updated_at\": \"2024-09-18T09:07:01.000000Z\"}}', '2024-09-18 03:07:01', '2024-09-18 03:07:01', 'ur'),
(158, 'PageSeo', 'Nogor - created this', 'App\\Models\\PageSeo', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 4, \"image\": null, \"status\": \"active\", \"page_id\": 2, \"sorting\": 41, \"meta_tag\": [\"Molestiae\"], \"created_at\": \"2024-09-18T09:07:15.000000Z\", \"updated_at\": \"2024-09-18T09:07:15.000000Z\", \"meta_description\": \"Doloremque in illo n\"}}', '2024-09-18 03:07:15', '2024-09-18 03:07:15', 'ur'),
(159, 'PageSeo', 'Nogor - created this', 'App\\Models\\PageSeo', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 5, \"image\": null, \"status\": \"active\", \"page_id\": 1, \"sorting\": 5, \"meta_tag\": [\"df dfd\"], \"created_at\": \"2024-09-18T09:07:25.000000Z\", \"updated_at\": \"2024-09-18T09:07:25.000000Z\", \"meta_description\": \"d fd fdsf asdf\"}}', '2024-09-18 03:07:25', '2024-09-18 03:07:25', 'ur'),
(160, 'Admin', 'Nogor - updated this', 'App\\Models\\Admin', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"mobile\": \"01700000000\", \"updated_at\": \"2024-09-15T03:12:40.000000Z\"}, \"attributes\": {\"mobile\": \"01700000001\", \"updated_at\": \"2024-09-18T09:21:37.000000Z\"}}', '2024-09-18 03:21:37', '2024-09-18 03:28:40', 'restored'),
(161, 'Admin', 'Nogor - created this', 'App\\Models\\Admin', 4, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 4, \"name\": \"Solomon Robinson\", \"block\": 0, \"email\": \"poqurad@mailinator.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$VL0mMzIBvqr2753iEKZOg.CXLrM99j2syK2XAYEUQFEEiiy6ZBEP.\", \"username\": null, \"created_at\": \"2024-09-18T09:26:55.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-18T09:26:55.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": null}}', '2024-09-18 03:26:55', '2024-09-18 03:27:10', 'r'),
(162, 'Admin', 'Nogor - updated this', 'App\\Models\\Admin', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"mobile\": \"01700000001\", \"updated_at\": \"2024-09-18T09:21:37.000000Z\"}, \"attributes\": {\"mobile\": \"01700000000\", \"updated_at\": \"2024-09-15T03:12:40.000000Z\"}}', '2024-09-18 03:28:40', '2024-09-18 03:28:40', 'ur'),
(163, 'Menu', 'Nogor - created this', 'App\\Models\\System\\Menu', 36, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 36, \"icon\": \"<i class=\'fas fa-adjust\'></i>\", \"params\": null, \"sorting\": 30, \"menu_name\": \"dfdfd\", \"parent_id\": 6, \"created_at\": \"2024-09-18T09:30:52.000000Z\", \"route_name\": \"sitemap.sitemap\", \"updated_at\": \"2024-09-18T09:30:52.000000Z\", \"show_profile\": 0, \"show_dasboard\": 0}}', '2024-09-18 03:30:52', '2024-09-18 03:30:52', 'ur'),
(164, 'Menu', 'Nogor - updated this', 'App\\Models\\System\\Menu', 36, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"route_name\": \"sitemap.sitemap\", \"updated_at\": \"2024-09-18T09:30:52.000000Z\"}, \"attributes\": {\"route_name\": \"activityLog.index\", \"updated_at\": \"2024-09-18T09:31:17.000000Z\"}}', '2024-09-18 03:31:17', '2024-09-18 03:31:17', 'ur'),
(165, 'Role', 'Nogor - created this', 'App\\Models\\System\\Role', 3, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 3, \"name\": \"Nogor Solutions Limited\", \"status\": \"active\", \"created_at\": \"2024-09-18T09:35:06.000000Z\", \"updated_at\": \"2024-09-18T09:35:06.000000Z\"}}', '2024-09-18 03:35:06', '2024-09-18 03:35:19', 'r'),
(166, 'Menu', 'Nogor - updated this', 'App\\Models\\System\\Menu', 36, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"sorting\": 30, \"updated_at\": \"2024-09-18T09:31:17.000000Z\"}, \"attributes\": {\"sorting\": 29, \"updated_at\": \"2024-09-18T10:23:29.000000Z\"}}', '2024-09-18 04:23:29', '2024-09-18 04:23:29', 'ur'),
(167, 'Menu', 'Nogor - updated this', 'App\\Models\\System\\Menu', 36, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"sorting\": 29, \"updated_at\": \"2024-09-18T10:23:29.000000Z\"}, \"attributes\": {\"sorting\": 28, \"updated_at\": \"2024-09-18T10:23:31.000000Z\"}}', '2024-09-18 04:23:31', '2024-09-18 04:23:31', 'ur'),
(168, 'Album', 'Nogor - deleted this', 'App\\Models\\Website\\Gallery\\Album', 2, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 2, \"name\": \"My Photos\", \"slug\": \"my-photos\", \"type\": \"Photos\", \"image\": \"{\\\"600x600\\\":\\\"upload\\\\/album\\\\/600x600\\\\/baeb2a9f-e2c2-47a0-97ea-2f4d5520612b.avif\\\",\\\"340x340\\\":\\\"upload\\\\/album\\\\/340x340\\\\/7bd5cfad-7bc6-4be5-a991-11f48c3765cd.avif\\\",\\\"242x242\\\":\\\"upload\\\\/album\\\\/242x242\\\\/454298fb-c81e-495f-b666-d8e6a05cc371.avif\\\",\\\"50x50\\\":\\\"upload\\\\/album\\\\/50x50\\\\/00fbbafd-97ef-433b-ae21-2e12a7fa6579.avif\\\",\\\"original\\\":\\\"upload\\\\/album\\\\/original\\\\/8a1cc982-761e-4ff8-9b88-60e9ab135adc.avif\\\"}\", \"status\": \"active\", \"sorting\": 1, \"created_at\": \"29 Aug 2024 04:41 AM\", \"updated_at\": \"11 Sep 2024  07:20 AM\"}}', '2024-09-18 04:31:12', '2024-09-18 04:31:12', 'ur'),
(169, 'Photo', 'Nogor - deleted this', 'App\\Models\\Website\\Gallery\\Photo', 2, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 2, \"title\": null, \"images\": {\"resize0\": \"upload/photos/dfd fdfdfd/resize_300X300/240918103134-8052.png\", \"resize1\": \"upload/photos/dfd fdfdfd/resize_800X800/240918103134-8917.png\"}, \"status\": \"active\", \"sorting\": 2, \"album_id\": 4, \"created_at\": \"2024-09-18T10:31:34.000000Z\", \"updated_at\": \"2024-09-18T10:31:34.000000Z\"}}', '2024-09-18 04:31:38', '2024-09-18 04:31:38', 'ur'),
(170, 'Video', 'Nogor - created this', 'App\\Models\\Website\\Gallery\\Video', 2, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 2, \"url\": \"https://www.youtube.com/watch?v=yVsEzVyhYiM\", \"title\": \"fdsfdsfds\", \"status\": \"active\", \"sorting\": 1, \"album_id\": 3, \"thumbnail\": \"{\\\"600x600\\\":\\\"upload\\\\/video\\\\/600x600\\\\/adbce4e0-b413-4c32-846e-35248c5e7c71.avif\\\",\\\"200x200\\\":\\\"upload\\\\/video\\\\/200x200\\\\/9fc26ce9-78ce-4d8f-823c-fa2c88401314.avif\\\",\\\"50x50\\\":\\\"upload\\\\/video\\\\/50x50\\\\/9165fbf9-d9ec-48ba-a612-b6ef280c99ad.avif\\\",\\\"original\\\":\\\"upload\\\\/video\\\\/original\\\\/368e1ece-faf0-484a-9f6a-b0d8dc487479.avif\\\"}\", \"created_at\": \"2024-09-18T10:32:09.000000Z\", \"updated_at\": \"2024-09-18T10:32:09.000000Z\"}}', '2024-09-18 04:32:09', '2024-09-18 04:32:09', 'ur'),
(171, 'Slider', 'Nogor - updated this', 'App\\Models\\Website\\Gallery\\Slider', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"title\": \"dfd fdfd\"}, \"attributes\": {\"title\": \"First\"}}', '2024-09-18 04:32:25', '2024-09-18 04:32:25', 'ur'),
(172, 'News', 'Nogor - updated this', 'App\\Models\\Website\\News', 4, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"meta_tag\": null, \"updated_at\": \"15 Sep 2024  08:41 AM\", \"category_id\": 11}, \"attributes\": {\"meta_tag\": [], \"updated_at\": \"18 Sep 2024  10:32 AM\", \"category_id\": 5}}', '2024-09-18 04:32:38', '2024-09-18 04:32:38', 'ur'),
(173, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 87, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 87, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-19 04:07:27\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-19T04:07:27.000000Z\", \"updated_at\": \"2024-09-19T04:07:27.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-18 22:07:27', '2024-09-18 22:07:27', 'ur'),
(174, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 88, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 88, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-19 04:43:33\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-19T04:43:33.000000Z\", \"updated_at\": \"2024-09-19T04:43:33.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-18 22:43:33', '2024-09-18 22:43:33', 'ur'),
(175, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 89, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 89, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-19 05:33:20\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-19T05:33:20.000000Z\", \"updated_at\": \"2024-09-19T05:33:20.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-18 23:33:20', '2024-09-18 23:33:20', 'ur'),
(176, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 90, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 90, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-19 08:36:18\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-19T08:36:18.000000Z\", \"updated_at\": \"2024-09-19T08:36:18.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-19 02:36:18', '2024-09-19 02:36:18', 'ur'),
(177, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 91, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 91, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-19 09:00:12\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-19T09:00:12.000000Z\", \"updated_at\": \"2024-09-19T09:00:12.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-19 03:00:12', '2024-09-19 03:00:12', 'ur'),
(178, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 92, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 92, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-19 09:12:43\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-19T09:12:43.000000Z\", \"updated_at\": \"2024-09-19T09:12:43.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-19 03:12:43', '2024-09-19 03:12:43', 'ur'),
(179, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 225, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 225, \"name\": \"HelpInfoController\", \"route\": null, \"parent_id\": null}}', '2024-09-19 05:57:44', '2024-09-19 05:57:44', 'ur'),
(180, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 226, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 226, \"name\": \"index\", \"route\": \"helpInfo.index\", \"parent_id\": 225}}', '2024-09-19 05:57:44', '2024-09-19 05:57:44', 'ur'),
(181, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 227, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 227, \"name\": \"create\", \"route\": \"helpInfo.create\", \"parent_id\": 225}}', '2024-09-19 05:57:44', '2024-09-19 05:57:44', 'ur');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `batch_uuid`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`, `status`) VALUES
(182, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 228, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 228, \"name\": \"store\", \"route\": \"helpInfo.store\", \"parent_id\": 225}}', '2024-09-19 05:57:44', '2024-09-19 05:57:44', 'ur'),
(183, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 229, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 229, \"name\": \"show\", \"route\": \"helpInfo.show\", \"parent_id\": 225}}', '2024-09-19 05:57:45', '2024-09-19 05:57:45', 'ur'),
(184, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 230, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 230, \"name\": \"edit\", \"route\": \"helpInfo.edit\", \"parent_id\": 225}}', '2024-09-19 05:57:45', '2024-09-19 05:57:45', 'ur'),
(185, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 231, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 231, \"name\": \"update\", \"route\": \"helpInfo.update\", \"parent_id\": 225}}', '2024-09-19 05:57:45', '2024-09-19 05:57:45', 'ur'),
(186, 'Permission', 'Nogor - created this', 'App\\Models\\System\\Permission', 232, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 232, \"name\": \"destroy\", \"route\": \"helpInfo.destroy\", \"parent_id\": 225}}', '2024-09-19 05:57:45', '2024-09-19 05:57:45', 'ur'),
(187, 'Site Settings', 'Nogor - updated this', 'App\\Models\\System\\SiteSetting', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"logo\": \"upload/conf/240912033836-6772.png\", \"logo_small\": \"upload/conf/240912033836-4903.png\", \"updated_at\": \"2024-09-15T10:44:47.000000Z\"}, \"attributes\": {\"logo\": \"{\\\"600x600\\\":\\\"upload\\\\/logo\\\\/600x600\\\\/b71482b9-90f5-407d-861e-9afdb08eae03.avif\\\",\\\"300x300\\\":\\\"upload\\\\/logo\\\\/300x300\\\\/40ed9dba-d042-4d4d-9c62-b0b629214544.avif\\\",\\\"50x50\\\":\\\"upload\\\\/logo\\\\/50x50\\\\/6e85fb2c-65d0-498d-8a95-6ccfb6edd625.avif\\\",\\\"original\\\":\\\"upload\\\\/logo\\\\/original\\\\/cfaf2bbe-8fe9-42b8-8e97-7bf17338631b.avif\\\"}\", \"logo_small\": \"{\\\"600x600\\\":\\\"upload\\\\/logo_small\\\\/600x600\\\\/cf5a4ab4-4e92-457f-aced-d727f38121ab.avif\\\",\\\"300x300\\\":\\\"upload\\\\/logo_small\\\\/300x300\\\\/64344636-ac0d-4576-b86b-165090df9f90.avif\\\",\\\"50x50\\\":\\\"upload\\\\/logo_small\\\\/50x50\\\\/f5ff4cb7-f50b-4735-8839-5a04645fca27.avif\\\",\\\"original\\\":\\\"upload\\\\/logo_small\\\\/original\\\\/2cbbf479-2003-4fcb-92a4-9ec670928eff.avif\\\"}\", \"updated_at\": \"2024-09-19T12:08:56.000000Z\"}}', '2024-09-19 06:08:56', '2024-09-19 06:08:56', 'ur'),
(188, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 93, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 93, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-22 04:41:29\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-22T04:41:29.000000Z\", \"updated_at\": \"2024-09-22T04:41:29.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-21 22:41:29', '2024-09-21 22:41:29', 'ur'),
(189, 'Site Settings', 'Nogor - updated this', 'App\\Models\\System\\SiteSetting', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"logo\": \"{\\\"600x600\\\":\\\"upload\\\\/logo\\\\/600x600\\\\/b71482b9-90f5-407d-861e-9afdb08eae03.avif\\\",\\\"300x300\\\":\\\"upload\\\\/logo\\\\/300x300\\\\/40ed9dba-d042-4d4d-9c62-b0b629214544.avif\\\",\\\"50x50\\\":\\\"upload\\\\/logo\\\\/50x50\\\\/6e85fb2c-65d0-498d-8a95-6ccfb6edd625.avif\\\",\\\"original\\\":\\\"upload\\\\/logo\\\\/original\\\\/cfaf2bbe-8fe9-42b8-8e97-7bf17338631b.avif\\\"}\", \"logo_small\": \"{\\\"600x600\\\":\\\"upload\\\\/logo_small\\\\/600x600\\\\/cf5a4ab4-4e92-457f-aced-d727f38121ab.avif\\\",\\\"300x300\\\":\\\"upload\\\\/logo_small\\\\/300x300\\\\/64344636-ac0d-4576-b86b-165090df9f90.avif\\\",\\\"50x50\\\":\\\"upload\\\\/logo_small\\\\/50x50\\\\/f5ff4cb7-f50b-4735-8839-5a04645fca27.avif\\\",\\\"original\\\":\\\"upload\\\\/logo_small\\\\/original\\\\/2cbbf479-2003-4fcb-92a4-9ec670928eff.avif\\\"}\", \"updated_at\": \"2024-09-19T12:08:56.000000Z\"}, \"attributes\": {\"logo\": \"{\\\"600x200\\\":\\\"upload\\\\/logo\\\\/600x200\\\\/ad7c3438-22ef-4e2b-9cfa-f98ad96a991e.avif\\\",\\\"300x100\\\":\\\"upload\\\\/logo\\\\/300x100\\\\/24ccc8ce-8c2a-4105-843c-0933c7595e29.avif\\\",\\\"150x50\\\":\\\"upload\\\\/logo\\\\/150x50\\\\/3a53c74a-9f10-4864-9042-cf569b142d65.avif\\\",\\\"original\\\":\\\"upload\\\\/logo\\\\/original\\\\/c39c0fcf-403c-49a7-acd8-3db0f5e8a0fe.avif\\\"}\", \"logo_small\": \"{\\\"600x200\\\":\\\"upload\\\\/logo_small\\\\/600x200\\\\/b321be1c-0ca6-4451-afaa-d805c501d129.avif\\\",\\\"300x100\\\":\\\"upload\\\\/logo_small\\\\/300x100\\\\/1cee3854-5ac2-45ba-be88-e135b4cabe13.avif\\\",\\\"150x50\\\":\\\"upload\\\\/logo_small\\\\/150x50\\\\/5716cb1e-d8cd-49af-b8c4-aa8a78355bc7.avif\\\",\\\"original\\\":\\\"upload\\\\/logo_small\\\\/original\\\\/5c572cde-d8d0-424a-9ad5-06222cc51e9f.avif\\\"}\", \"updated_at\": \"2024-09-22T04:42:43.000000Z\"}}', '2024-09-21 22:42:43', '2024-09-21 22:42:43', 'ur'),
(190, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 94, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 94, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-22 05:05:24\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-22T05:05:24.000000Z\", \"updated_at\": \"2024-09-22T05:05:24.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-21 23:05:24', '2024-09-21 23:05:24', 'ur'),
(191, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 95, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 95, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-22 05:33:19\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-22T05:33:19.000000Z\", \"updated_at\": \"2024-09-22T05:33:19.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-21 23:33:19', '2024-09-21 23:33:19', 'ur'),
(192, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 96, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 96, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-22 11:31:57\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-22T11:31:57.000000Z\", \"updated_at\": \"2024-09-22T11:31:57.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-22 05:31:57', '2024-09-22 05:31:57', 'ur'),
(193, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 97, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 97, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-22 12:14:35\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-22T12:14:35.000000Z\", \"updated_at\": \"2024-09-22T12:14:35.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-22 06:14:35', '2024-09-22 06:14:35', 'ur'),
(194, 'PageSection', 'Nogor - created this', 'App\\Models\\PageSection', 1, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 1, \"url\": null, \"icon\": \"http://localhost/csfd/public/storage/null\", \"slug\": \"df-dfdf-dfdf-df\", \"type\": \"text\", \"image\": \"null\", \"title\": \"df dfdf dfdf df\", \"status\": \"active\", \"page_id\": \"2\", \"sorting\": 1, \"video_url\": null, \"created_at\": \"2024-09-22T12:58:39.000000Z\", \"updated_at\": \"2024-09-22T12:58:39.000000Z\", \"description\": \"<p>ds fsdf dsf df&nbsp;</p>\"}}', '2024-09-22 06:58:39', '2024-09-22 06:58:39', 'ur'),
(195, 'Admin', 'Nogor - updated this', 'App\\Models\\Admin', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"remember_token\": \"G0bQmfbiLmHYPrUy9RFDhQBCYHqhpPCjDlNcoyAHKNaTS4ei3Oy5d4rljztL\"}, \"attributes\": {\"remember_token\": \"nX5fY7bnmIKDiLuUWFe0Klr9eVAf5eNacVA7jK48OVl8JzcaOY9d4mW9tFy8\"}}', '2024-09-23 00:59:56', '2024-09-23 00:59:56', 'ur'),
(196, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 98, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 98, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-23 07:00:06\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-23T07:00:06.000000Z\", \"updated_at\": \"2024-09-23T07:00:06.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-23 01:00:06', '2024-09-23 01:00:06', 'ur'),
(197, 'Site Settings', 'Nogor - updated this', 'App\\Models\\System\\SiteSetting', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"logo\": \"{\\\"600x200\\\":\\\"upload\\\\/logo\\\\/600x200\\\\/ad7c3438-22ef-4e2b-9cfa-f98ad96a991e.avif\\\",\\\"300x100\\\":\\\"upload\\\\/logo\\\\/300x100\\\\/24ccc8ce-8c2a-4105-843c-0933c7595e29.avif\\\",\\\"150x50\\\":\\\"upload\\\\/logo\\\\/150x50\\\\/3a53c74a-9f10-4864-9042-cf569b142d65.avif\\\",\\\"original\\\":\\\"upload\\\\/logo\\\\/original\\\\/c39c0fcf-403c-49a7-acd8-3db0f5e8a0fe.avif\\\"}\", \"logo_small\": \"{\\\"600x200\\\":\\\"upload\\\\/logo_small\\\\/600x200\\\\/b321be1c-0ca6-4451-afaa-d805c501d129.avif\\\",\\\"300x100\\\":\\\"upload\\\\/logo_small\\\\/300x100\\\\/1cee3854-5ac2-45ba-be88-e135b4cabe13.avif\\\",\\\"150x50\\\":\\\"upload\\\\/logo_small\\\\/150x50\\\\/5716cb1e-d8cd-49af-b8c4-aa8a78355bc7.avif\\\",\\\"original\\\":\\\"upload\\\\/logo_small\\\\/original\\\\/5c572cde-d8d0-424a-9ad5-06222cc51e9f.avif\\\"}\", \"updated_at\": \"2024-09-22T04:42:43.000000Z\"}, \"attributes\": {\"logo\": \"{\\\"600x200\\\":\\\"upload\\\\/logo\\\\/600x200\\\\/f6608da8-74d6-44bf-a05d-7832b9d48133.avif\\\",\\\"300x100\\\":\\\"upload\\\\/logo\\\\/300x100\\\\/985fe9bd-a89b-4849-a482-6814db461eb6.avif\\\",\\\"150x50\\\":\\\"upload\\\\/logo\\\\/150x50\\\\/4eee65c6-2639-4904-a762-aa21c70fa9f4.avif\\\",\\\"original\\\":\\\"upload\\\\/logo\\\\/original\\\\/9ba5ef6e-0a6b-4be1-94e5-eafee2346bd9.avif\\\"}\", \"logo_small\": \"{\\\"600x200\\\":\\\"upload\\\\/logo_small\\\\/600x200\\\\/99139217-fcec-432d-8b13-17a6c9a0b825.avif\\\",\\\"300x100\\\":\\\"upload\\\\/logo_small\\\\/300x100\\\\/03d1110e-cb55-4733-b713-7dd0d8be78a6.avif\\\",\\\"150x50\\\":\\\"upload\\\\/logo_small\\\\/150x50\\\\/a15d300a-11e3-43ee-8083-06ac63c70d78.avif\\\",\\\"original\\\":\\\"upload\\\\/logo_small\\\\/original\\\\/f2baab5f-fc97-48fd-b356-c91467a4ecda.avif\\\"}\", \"updated_at\": \"2024-09-23T07:00:41.000000Z\"}}', '2024-09-23 01:00:42', '2024-09-23 01:00:42', 'ur'),
(198, 'Admin', 'Nogor - updated this', 'App\\Models\\Admin', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"remember_token\": \"nX5fY7bnmIKDiLuUWFe0Klr9eVAf5eNacVA7jK48OVl8JzcaOY9d4mW9tFy8\"}, \"attributes\": {\"remember_token\": \"oFj8ysUqyoQGahxHbEhH5xNljzxp5IS5meVMsGdUhWgKEaCSAakoJheNIPVC\"}}', '2024-09-23 01:00:56', '2024-09-23 01:00:56', 'ur'),
(199, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 99, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 99, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-23 07:01:06\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-23T07:01:06.000000Z\", \"updated_at\": \"2024-09-23T07:01:06.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-23 01:01:06', '2024-09-23 01:01:06', 'ur'),
(200, 'Menu', 'Nogor - deleted this', 'App\\Models\\System\\Menu', 5, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 5, \"icon\": \"<i class=\'fa fa-windows\'></i>\", \"params\": null, \"sorting\": 3, \"menu_name\": \"Contents\", \"parent_id\": null, \"created_at\": null, \"route_name\": null, \"updated_at\": null, \"show_profile\": 0, \"show_dasboard\": 0}}', '2024-09-23 01:12:42', '2024-09-23 01:12:42', 'ur'),
(201, 'Menu', 'Nogor - deleted this', 'App\\Models\\System\\Menu', 6, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 6, \"icon\": \"<i class=\'fa fa-list text-aqua\'></i>\", \"params\": null, \"sorting\": 0, \"menu_name\": \"Content List\", \"parent_id\": 5, \"created_at\": null, \"route_name\": \"content.index\", \"updated_at\": null, \"show_profile\": 0, \"show_dasboard\": 0}}', '2024-09-23 01:12:48', '2024-09-23 01:12:48', 'ur'),
(202, 'Menu', 'Nogor - deleted this', 'App\\Models\\System\\Menu', 11, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 11, \"icon\": \"<i class=\'fab fa-leanpub\'></i>\", \"params\": null, \"sorting\": 4, \"menu_name\": \"Notice\", \"parent_id\": 7, \"created_at\": null, \"route_name\": \"notice.index\", \"updated_at\": \"2024-08-14T06:21:33.000000Z\", \"show_profile\": 0, \"show_dasboard\": 0}}', '2024-09-23 01:26:49', '2024-09-23 01:26:49', 'ur'),
(203, 'Menu', 'Nogor - deleted this', 'App\\Models\\System\\Menu', 12, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 12, \"icon\": \"<i class=\'fa fa-newspaper-o\'></i>\", \"params\": null, \"sorting\": 4, \"menu_name\": \"News\", \"parent_id\": 7, \"created_at\": null, \"route_name\": \"news.index\", \"updated_at\": null, \"show_profile\": 0, \"show_dasboard\": 1}}', '2024-09-23 01:27:03', '2024-09-23 01:27:03', 'ur'),
(204, 'Menu', 'Nogor - deleted this', 'App\\Models\\System\\Menu', 10, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 10, \"icon\": \"<i class=\'fas fa-book-open\'></i>\", \"params\": null, \"sorting\": 2, \"menu_name\": \"Faq\", \"parent_id\": 7, \"created_at\": null, \"route_name\": \"faq.index\", \"updated_at\": null, \"show_profile\": 0, \"show_dasboard\": 0}}', '2024-09-23 01:27:13', '2024-09-23 01:27:13', 'ur'),
(205, 'Menu', 'Nogor - deleted this', 'App\\Models\\System\\Menu', 9, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 9, \"icon\": \"<i class=\'fas fa-snowflake\'></i>\", \"params\": null, \"sorting\": 1, \"menu_name\": \"Event\", \"parent_id\": 7, \"created_at\": null, \"route_name\": \"events.index\", \"updated_at\": null, \"show_profile\": 0, \"show_dasboard\": 0}}', '2024-09-23 01:27:23', '2024-09-23 01:27:23', 'ur'),
(206, 'Menu', 'Nogor - deleted this', 'App\\Models\\System\\Menu', 8, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 8, \"icon\": \"<i class=\'fas fa-address-book\'></i>\", \"params\": null, \"sorting\": 0, \"menu_name\": \"Contact Us\", \"parent_id\": 7, \"created_at\": null, \"route_name\": \"contacts.index\", \"updated_at\": null, \"show_profile\": 0, \"show_dasboard\": 1}}', '2024-09-23 01:27:37', '2024-09-23 01:27:37', 'ur'),
(207, 'Menu', 'Nogor - deleted this', 'App\\Models\\System\\Menu', 7, 'deleted', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"id\": 7, \"icon\": \"<i class=\'fas fa-globe\'></i>\", \"params\": null, \"sorting\": 4, \"menu_name\": \"Website\", \"parent_id\": null, \"created_at\": null, \"route_name\": null, \"updated_at\": null, \"show_profile\": 0, \"show_dasboard\": 0}}', '2024-09-23 01:27:45', '2024-09-23 01:27:45', 'ur'),
(208, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 100, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 100, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-23 07:29:20\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-23T07:29:20.000000Z\", \"updated_at\": \"2024-09-23T07:29:20.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-23 01:29:20', '2024-09-23 01:29:20', 'ur'),
(209, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 101, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 101, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-29 03:30:22\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-29T03:30:22.000000Z\", \"updated_at\": \"2024-09-29T03:30:22.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-28 21:30:22', '2024-09-28 21:30:22', 'ur'),
(210, 'Menu', 'Nogor - created this', 'App\\Models\\System\\Menu', 37, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 37, \"icon\": \"<i class=\'fas fa-question-circle\'></i>\", \"params\": null, \"sorting\": 13, \"menu_name\": \"Help Info\", \"parent_id\": 3, \"created_at\": \"2024-09-29T06:03:18.000000Z\", \"route_name\": \"helpInfo.index\", \"updated_at\": \"2024-09-29T06:03:18.000000Z\", \"show_profile\": 0, \"show_dasboard\": 0}}', '2024-09-29 00:03:18', '2024-09-29 00:03:18', 'ur'),
(211, 'UserLoginHistory', 'Nogor - created this', 'App\\Models\\UserLoginHistory', 102, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 102, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-29 06:03:30\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-29T06:03:30.000000Z\", \"updated_at\": \"2024-09-29T06:03:30.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-29 00:03:30', '2024-09-29 00:03:30', 'ur'),
(212, 'Admin', 'Nogor - updated this', 'App\\Models\\Admin', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"name\": \"Nogor\", \"updated_at\": \"2024-09-15T03:12:40.000000Z\"}, \"attributes\": {\"name\": \"Nogor Solutions\", \"updated_at\": \"2024-09-29T06:37:25.000000Z\"}}', '2024-09-29 00:37:25', '2024-09-29 00:37:25', 'ur'),
(213, 'Admin', 'Nogor Solutions - updated this', 'App\\Models\\Admin', 1, 'updated', NULL, 'App\\Models\\Admin', 1, '{\"old\": {\"remember_token\": \"oFj8ysUqyoQGahxHbEhH5xNljzxp5IS5meVMsGdUhWgKEaCSAakoJheNIPVC\"}, \"attributes\": {\"remember_token\": \"Noq0rS6iAAACOw3Zd0yrjCEB65fctH0JWTlVs24Cl89KTP1E904igwhlM5Ek\"}}', '2024-09-29 00:52:53', '2024-09-29 00:52:53', 'ur'),
(214, 'UserLoginHistory', 'Nogor Solutions - created this', 'App\\Models\\UserLoginHistory', 103, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 103, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-29 06:53:15\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-29T06:53:15.000000Z\", \"updated_at\": \"2024-09-29T06:53:15.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-29 00:53:15', '2024-09-29 00:53:15', 'ur'),
(215, 'UserLoginHistory', 'Nogor Solutions - created this', 'App\\Models\\UserLoginHistory', 104, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 104, \"status\": \"active\", \"sorting\": 0, \"user_id\": 1, \"login_at\": \"2024-09-29 09:56:19\", \"login_ip\": \"::1\", \"created_at\": \"2024-09-29T09:56:19.000000Z\", \"updated_at\": \"2024-09-29T09:56:19.000000Z\", \"user_guard\": \"admin\", \"login_browser_client\": \"Google Chrome\"}}', '2024-09-29 03:56:19', '2024-09-29 03:56:19', 'ur'),
(216, 'Admin', 'Nogor Solutions - created this', 'App\\Models\\Admin', 5, 'created', NULL, 'App\\Models\\Admin', 1, '{\"attributes\": {\"id\": 5, \"name\": \"Emma Finch\", \"block\": 0, \"email\": \"cyhohypo@mailinator.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$Y/f7ez9oiZqiY.oAPUNRleXPp/JcnYDtFMt6Ax0/SQ/m4ODtkS4KK\", \"username\": null, \"created_at\": \"2024-09-29T10:03:53.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:03:53.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": null}}', '2024-09-29 04:03:53', '2024-09-29 04:03:53', 'ur'),
(217, 'Admin', ' - created this', 'App\\Models\\Admin', 6, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 6, \"name\": \"Cordelia Volkman\", \"block\": 0, \"email\": \"jimmie.wintheiser@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"iIykCWmqyD\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(218, 'Admin', ' - created this', 'App\\Models\\Admin', 7, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 7, \"name\": \"Jocelyn Ullrich\", \"block\": 0, \"email\": \"stracke.sylvia@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"HUGZDi2cjW\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(219, 'Admin', ' - created this', 'App\\Models\\Admin', 8, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 8, \"name\": \"Gene Willms\", \"block\": 0, \"email\": \"opal75@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"HV11sc6J2R\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(220, 'Admin', ' - created this', 'App\\Models\\Admin', 9, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 9, \"name\": \"Lisandro Hill I\", \"block\": 0, \"email\": \"tbayer@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"BtHDHEDxrT\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(221, 'Admin', ' - created this', 'App\\Models\\Admin', 10, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 10, \"name\": \"Miss Krystel Spinka V\", \"block\": 0, \"email\": \"rossie87@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"9QjQ2QNTQh\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(222, 'Admin', ' - created this', 'App\\Models\\Admin', 11, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 11, \"name\": \"Estefania Weissnat PhD\", \"block\": 0, \"email\": \"nat.gerhold@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"PusKaV9AQr\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(223, 'Admin', ' - created this', 'App\\Models\\Admin', 12, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 12, \"name\": \"Mr. Jeramie Hills III\", \"block\": 0, \"email\": \"gjast@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"e1fikTF3Wr\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(224, 'Admin', ' - created this', 'App\\Models\\Admin', 13, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 13, \"name\": \"Kraig Hauck II\", \"block\": 0, \"email\": \"gulgowski.sally@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"4pDe3AOhW5\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(225, 'Admin', ' - created this', 'App\\Models\\Admin', 14, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 14, \"name\": \"Prof. Fatima Streich\", \"block\": 0, \"email\": \"ryan.kristofer@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"YAPYj6gE7P\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(226, 'Admin', ' - created this', 'App\\Models\\Admin', 15, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 15, \"name\": \"Kali Dietrich\", \"block\": 0, \"email\": \"bennie44@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"uU1ofnyA4e\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(227, 'Admin', ' - created this', 'App\\Models\\Admin', 16, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 16, \"name\": \"Allan Mraz\", \"block\": 0, \"email\": \"abshire.imelda@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"Pqun1dRGKW\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(228, 'Admin', ' - created this', 'App\\Models\\Admin', 17, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 17, \"name\": \"Bria Bahringer\", \"block\": 0, \"email\": \"lubowitz.margaret@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"LcZp3NOxyD\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(229, 'Admin', ' - created this', 'App\\Models\\Admin', 18, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 18, \"name\": \"Bert Ankunding\", \"block\": 0, \"email\": \"boehm.orion@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"GMQGvwyO7s\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(230, 'Admin', ' - created this', 'App\\Models\\Admin', 19, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 19, \"name\": \"Jordy Quitzon\", \"block\": 0, \"email\": \"zkonopelski@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"xZPhJfgiC5\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(231, 'Admin', ' - created this', 'App\\Models\\Admin', 20, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 20, \"name\": \"Adell Kertzmann I\", \"block\": 0, \"email\": \"clare.goyette@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"2wqxCzu1w7\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(232, 'Admin', ' - created this', 'App\\Models\\Admin', 21, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 21, \"name\": \"Rhiannon Bradtke\", \"block\": 0, \"email\": \"julien81@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"mMBxdPgVlF\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(233, 'Admin', ' - created this', 'App\\Models\\Admin', 22, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 22, \"name\": \"Norberto O\'Conner\", \"block\": 0, \"email\": \"janet.willms@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"QWZ81pMYvh\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(234, 'Admin', ' - created this', 'App\\Models\\Admin', 23, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 23, \"name\": \"Gustave Crona\", \"block\": 0, \"email\": \"mosciski.mathias@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"y6wCRieyYB\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(235, 'Admin', ' - created this', 'App\\Models\\Admin', 24, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 24, \"name\": \"Miss Lyla Wisoky III\", \"block\": 0, \"email\": \"mathias63@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"Havdhe3Yil\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(236, 'Admin', ' - created this', 'App\\Models\\Admin', 25, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 25, \"name\": \"Prof. Adam Gulgowski\", \"block\": 0, \"email\": \"crist.breanne@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"iZUpiPjeH9\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(237, 'Admin', ' - created this', 'App\\Models\\Admin', 26, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 26, \"name\": \"Brenda Gislason\", \"block\": 0, \"email\": \"rene.larson@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"7phwOjSRXB\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(238, 'Admin', ' - created this', 'App\\Models\\Admin', 27, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 27, \"name\": \"Prof. Retha Cronin\", \"block\": 0, \"email\": \"ada83@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"ggqkrL4Iwa\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(239, 'Admin', ' - created this', 'App\\Models\\Admin', 28, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 28, \"name\": \"Lia Crooks\", \"block\": 0, \"email\": \"jcole@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"g0o9KqFBkd\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(240, 'Admin', ' - created this', 'App\\Models\\Admin', 29, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 29, \"name\": \"Olin Goyette\", \"block\": 0, \"email\": \"litzy64@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"tYjnaBusL4\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(241, 'Admin', ' - created this', 'App\\Models\\Admin', 30, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 30, \"name\": \"Alycia Wyman\", \"block\": 0, \"email\": \"cklein@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"sJxKLbToHR\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(242, 'Admin', ' - created this', 'App\\Models\\Admin', 31, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 31, \"name\": \"Jayde Block\", \"block\": 0, \"email\": \"rohan.jessica@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"Ou7ki48KiT\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(243, 'Admin', ' - created this', 'App\\Models\\Admin', 32, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 32, \"name\": \"Shanelle Glover\", \"block\": 0, \"email\": \"price.trisha@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"aG2skpfxmE\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(244, 'Admin', ' - created this', 'App\\Models\\Admin', 33, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 33, \"name\": \"Jake Schneider\", \"block\": 0, \"email\": \"corwin.coty@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"OjupZNzWj4\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(245, 'Admin', ' - created this', 'App\\Models\\Admin', 34, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 34, \"name\": \"Jarrell Kris PhD\", \"block\": 0, \"email\": \"alex91@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"xAxzp0kmip\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(246, 'Admin', ' - created this', 'App\\Models\\Admin', 35, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 35, \"name\": \"Dr. Harmon Schaden PhD\", \"block\": 0, \"email\": \"zschroeder@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"sIgrXjF36W\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(247, 'Admin', ' - created this', 'App\\Models\\Admin', 36, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 36, \"name\": \"Anastacio Eichmann\", \"block\": 0, \"email\": \"jamar09@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"U3nwoofyFB\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(248, 'Admin', ' - created this', 'App\\Models\\Admin', 37, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 37, \"name\": \"Salma Stamm\", \"block\": 0, \"email\": \"delphine12@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"sqzFe0G7cU\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(249, 'Admin', ' - created this', 'App\\Models\\Admin', 38, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 38, \"name\": \"Maximo Cormier I\", \"block\": 0, \"email\": \"rwelch@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"jJBkWLZPFe\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(250, 'Admin', ' - created this', 'App\\Models\\Admin', 39, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 39, \"name\": \"Camden Wolff\", \"block\": 0, \"email\": \"lbailey@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"uhdhdvCh5v\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(251, 'Admin', ' - created this', 'App\\Models\\Admin', 40, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 40, \"name\": \"Fidel Schulist\", \"block\": 0, \"email\": \"monahan.ellsworth@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"ZScB8K2RxB\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(252, 'Admin', ' - created this', 'App\\Models\\Admin', 41, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 41, \"name\": \"Zakary Greenholt\", \"block\": 0, \"email\": \"okon.torrance@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"foV0zBIw6q\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(253, 'Admin', ' - created this', 'App\\Models\\Admin', 42, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 42, \"name\": \"Rhianna Leannon\", \"block\": 0, \"email\": \"evalyn72@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"rmG7wRhPKv\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(254, 'Admin', ' - created this', 'App\\Models\\Admin', 43, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 43, \"name\": \"Ulises Nitzsche\", \"block\": 0, \"email\": \"beaulah12@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"wQjpxiMjsb\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(255, 'Admin', ' - created this', 'App\\Models\\Admin', 44, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 44, \"name\": \"Devin Bednar\", \"block\": 0, \"email\": \"ohyatt@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"AzvvP6KPPO\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(256, 'Admin', ' - created this', 'App\\Models\\Admin', 45, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 45, \"name\": \"Thurman Aufderhar\", \"block\": 0, \"email\": \"emedhurst@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"VO4wjrsnf4\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(257, 'Admin', ' - created this', 'App\\Models\\Admin', 46, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 46, \"name\": \"Maribel Skiles\", \"block\": 0, \"email\": \"randy00@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"7UVVL8Qcc4\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(258, 'Admin', ' - created this', 'App\\Models\\Admin', 47, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 47, \"name\": \"Deontae Deckow PhD\", \"block\": 0, \"email\": \"ureilly@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"JzTQL1zzR9\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(259, 'Admin', ' - created this', 'App\\Models\\Admin', 48, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 48, \"name\": \"Chasity Bergstrom MD\", \"block\": 0, \"email\": \"hane.jamie@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"HcOefwm9Mr\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `batch_uuid`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`, `status`) VALUES
(260, 'Admin', ' - created this', 'App\\Models\\Admin', 49, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 49, \"name\": \"Alvina Boyle\", \"block\": 0, \"email\": \"joanie22@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"92wt47llGn\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(261, 'Admin', ' - created this', 'App\\Models\\Admin', 50, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 50, \"name\": \"Joanie Collins\", \"block\": 0, \"email\": \"anderson.andres@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"FbpbLWFva9\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(262, 'Admin', ' - created this', 'App\\Models\\Admin', 51, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 51, \"name\": \"Mrs. Heath King I\", \"block\": 0, \"email\": \"klein.fermin@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"umZlK8Kg0q\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(263, 'Admin', ' - created this', 'App\\Models\\Admin', 52, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 52, \"name\": \"Mrs. Ashlee Wolf\", \"block\": 0, \"email\": \"asa25@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"D2Y91dYQSN\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(264, 'Admin', ' - created this', 'App\\Models\\Admin', 53, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 53, \"name\": \"Zoila Rath\", \"block\": 0, \"email\": \"fisher.reilly@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"JUIDimlXFt\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(265, 'Admin', ' - created this', 'App\\Models\\Admin', 54, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 54, \"name\": \"Ms. Dora Crooks\", \"block\": 0, \"email\": \"virginie87@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"C2eZTJNejt\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(266, 'Admin', ' - created this', 'App\\Models\\Admin', 55, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 55, \"name\": \"Ms. Elva Kshlerin\", \"block\": 0, \"email\": \"chanelle97@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"N5bCe0bfCs\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(267, 'Admin', ' - created this', 'App\\Models\\Admin', 56, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 56, \"name\": \"Shannon Glover I\", \"block\": 0, \"email\": \"drew78@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"ufTFFt0dni\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(268, 'Admin', ' - created this', 'App\\Models\\Admin', 57, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 57, \"name\": \"Tatyana Collins\", \"block\": 0, \"email\": \"vbergnaum@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"GBu5BotdNg\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(269, 'Admin', ' - created this', 'App\\Models\\Admin', 58, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 58, \"name\": \"Rowland Bechtelar\", \"block\": 0, \"email\": \"schaefer.gregg@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"Dw1WM75cUU\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(270, 'Admin', ' - created this', 'App\\Models\\Admin', 59, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 59, \"name\": \"Dr. Addison Kshlerin Sr.\", \"block\": 0, \"email\": \"gislason.kadin@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"khKqRbB0Ek\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(271, 'Admin', ' - created this', 'App\\Models\\Admin', 60, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 60, \"name\": \"Dr. Albertha Legros DDS\", \"block\": 0, \"email\": \"spinka.fredy@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"URAAPEXdHB\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(272, 'Admin', ' - created this', 'App\\Models\\Admin', 61, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 61, \"name\": \"Ms. Reanna Roob\", \"block\": 0, \"email\": \"rodriguez.bert@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"nT9lVGvvij\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(273, 'Admin', ' - created this', 'App\\Models\\Admin', 62, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 62, \"name\": \"Alfred Thompson\", \"block\": 0, \"email\": \"okertzmann@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"5luA1urBhk\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(274, 'Admin', ' - created this', 'App\\Models\\Admin', 63, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 63, \"name\": \"Alanis Roberts DVM\", \"block\": 0, \"email\": \"krosenbaum@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"F9NsZI3nGW\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(275, 'Admin', ' - created this', 'App\\Models\\Admin', 64, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 64, \"name\": \"Carleton Leffler\", \"block\": 0, \"email\": \"harvey.stephan@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"QyTor4i0tT\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(276, 'Admin', ' - created this', 'App\\Models\\Admin', 65, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 65, \"name\": \"Reese Hintz\", \"block\": 0, \"email\": \"jenkins.josiane@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"UTP6dE1cDu\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(277, 'Admin', ' - created this', 'App\\Models\\Admin', 66, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 66, \"name\": \"Lynn Kuhn\", \"block\": 0, \"email\": \"joesph.fahey@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"7aVXItfckc\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(278, 'Admin', ' - created this', 'App\\Models\\Admin', 67, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 67, \"name\": \"Elisha Bashirian\", \"block\": 0, \"email\": \"heichmann@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"Fy8O0ptIQt\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(279, 'Admin', ' - created this', 'App\\Models\\Admin', 68, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 68, \"name\": \"Mrs. Heaven Dietrich\", \"block\": 0, \"email\": \"kayley.wiza@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"wYJNHpLCFR\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(280, 'Admin', ' - created this', 'App\\Models\\Admin', 69, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 69, \"name\": \"Dr. Geovanni Bruen IV\", \"block\": 0, \"email\": \"queen.murray@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"lQdiMWyCgE\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(281, 'Admin', ' - created this', 'App\\Models\\Admin', 70, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 70, \"name\": \"Kenny Rutherford\", \"block\": 0, \"email\": \"tavares09@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"31xkkmOcfV\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(282, 'Admin', ' - created this', 'App\\Models\\Admin', 71, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 71, \"name\": \"Dr. Alysa Towne\", \"block\": 0, \"email\": \"mfarrell@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"mADCItb5BK\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(283, 'Admin', ' - created this', 'App\\Models\\Admin', 72, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 72, \"name\": \"Lisa Dach\", \"block\": 0, \"email\": \"brenna44@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"f04BDHyVh7\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(284, 'Admin', ' - created this', 'App\\Models\\Admin', 73, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 73, \"name\": \"Dr. Julio Green\", \"block\": 0, \"email\": \"tlowe@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"gPVVdiKUMK\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(285, 'Admin', ' - created this', 'App\\Models\\Admin', 74, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 74, \"name\": \"Lawson Rowe\", \"block\": 0, \"email\": \"carmel45@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"kZS1bTYTD4\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(286, 'Admin', ' - created this', 'App\\Models\\Admin', 75, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 75, \"name\": \"Dr. Faye Feeney II\", \"block\": 0, \"email\": \"lavonne96@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"TKpIEHqW7q\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(287, 'Admin', ' - created this', 'App\\Models\\Admin', 76, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 76, \"name\": \"Geo Donnelly\", \"block\": 0, \"email\": \"parker51@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"xvuJMbEN3U\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(288, 'Admin', ' - created this', 'App\\Models\\Admin', 77, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 77, \"name\": \"Bobby Schinner\", \"block\": 0, \"email\": \"gsauer@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"3vmLE4GVwL\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(289, 'Admin', ' - created this', 'App\\Models\\Admin', 78, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 78, \"name\": \"Mitchel Feil\", \"block\": 0, \"email\": \"ybechtelar@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"X0WLaYpjz4\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(290, 'Admin', ' - created this', 'App\\Models\\Admin', 79, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 79, \"name\": \"Chyna Mueller\", \"block\": 0, \"email\": \"vcrooks@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"5P27RjM7Pa\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(291, 'Admin', ' - created this', 'App\\Models\\Admin', 80, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 80, \"name\": \"Macie Rosenbaum\", \"block\": 0, \"email\": \"fking@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"tP6bpW1qXd\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(292, 'Admin', ' - created this', 'App\\Models\\Admin', 81, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 81, \"name\": \"Brycen O\'Kon\", \"block\": 0, \"email\": \"selina91@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"pXmykV6B7n\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(293, 'Admin', ' - created this', 'App\\Models\\Admin', 82, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 82, \"name\": \"Mrs. Maggie Christiansen\", \"block\": 0, \"email\": \"floyd.harvey@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"uj0ACypjim\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(294, 'Admin', ' - created this', 'App\\Models\\Admin', 83, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 83, \"name\": \"Tatum Brakus\", \"block\": 0, \"email\": \"briana11@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"Mq9DODunDi\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(295, 'Admin', ' - created this', 'App\\Models\\Admin', 84, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 84, \"name\": \"Dr. Eleanora Huel\", \"block\": 0, \"email\": \"zcollier@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"IzYXTISpdu\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(296, 'Admin', ' - created this', 'App\\Models\\Admin', 85, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 85, \"name\": \"Dr. Ernestine White II\", \"block\": 0, \"email\": \"block.dixie@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"rmAT6YZGjT\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(297, 'Admin', ' - created this', 'App\\Models\\Admin', 86, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 86, \"name\": \"D\'angelo Eichmann MD\", \"block\": 0, \"email\": \"xander29@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"2gZ6lSNK2U\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(298, 'Admin', ' - created this', 'App\\Models\\Admin', 87, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 87, \"name\": \"Nasir Kshlerin\", \"block\": 0, \"email\": \"fkertzmann@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"HrKxM9Utzj\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(299, 'Admin', ' - created this', 'App\\Models\\Admin', 88, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 88, \"name\": \"Elizabeth Windler\", \"block\": 0, \"email\": \"morar.christelle@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"uK0mBVdVog\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(300, 'Admin', ' - created this', 'App\\Models\\Admin', 89, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 89, \"name\": \"Nia Wintheiser Sr.\", \"block\": 0, \"email\": \"mitchell.avery@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"xRqCSbQSzH\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(301, 'Admin', ' - created this', 'App\\Models\\Admin', 90, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 90, \"name\": \"Dr. Dereck Collier MD\", \"block\": 0, \"email\": \"ivah.bergstrom@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"2N0xmp73m3\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(302, 'Admin', ' - created this', 'App\\Models\\Admin', 91, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 91, \"name\": \"Miss Abbie Stark I\", \"block\": 0, \"email\": \"eloise93@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"CV5ce3hNZM\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(303, 'Admin', ' - created this', 'App\\Models\\Admin', 92, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 92, \"name\": \"Mertie Treutel\", \"block\": 0, \"email\": \"gkub@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"XUstXnkJoJ\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(304, 'Admin', ' - created this', 'App\\Models\\Admin', 93, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 93, \"name\": \"Duncan Towne\", \"block\": 0, \"email\": \"otho18@example.com\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"zOQDE50R5W\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(305, 'Admin', ' - created this', 'App\\Models\\Admin', 94, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 94, \"name\": \"Dayna Jacobson\", \"block\": 0, \"email\": \"sonny26@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"sW2wDVTI6g\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(306, 'Admin', ' - created this', 'App\\Models\\Admin', 95, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 95, \"name\": \"Prof. Charley Hand MD\", \"block\": 0, \"email\": \"awyman@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"uM4idSOhya\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(307, 'Admin', ' - created this', 'App\\Models\\Admin', 96, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 96, \"name\": \"Prof. Dean Fisher I\", \"block\": 0, \"email\": \"hprosacco@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"mU3rVWHmHN\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(308, 'Admin', ' - created this', 'App\\Models\\Admin', 97, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 97, \"name\": \"Sven Littel\", \"block\": 0, \"email\": \"ewald.kuvalis@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"Rr3188u21d\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(309, 'Admin', ' - created this', 'App\\Models\\Admin', 98, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 98, \"name\": \"Vida Ledner\", \"block\": 0, \"email\": \"pat.olson@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"16GV5AGLww\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(310, 'Admin', ' - created this', 'App\\Models\\Admin', 99, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 99, \"name\": \"Wilmer Hickle\", \"block\": 0, \"email\": \"zrutherford@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"lwFpRYtrxV\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(311, 'Admin', ' - created this', 'App\\Models\\Admin', 100, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 100, \"name\": \"Mr. Brenden Hettinger\", \"block\": 0, \"email\": \"odamore@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"tOE5VMBYyL\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(312, 'Admin', ' - created this', 'App\\Models\\Admin', 101, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 101, \"name\": \"Ms. Gertrude Ankunding DDS\", \"block\": 0, \"email\": \"djaskolski@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"WAsexWOPLo\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(313, 'Admin', ' - created this', 'App\\Models\\Admin', 102, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 102, \"name\": \"Khalil Beatty\", \"block\": 0, \"email\": \"howell.breanna@example.net\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"hcWyLONj5h\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(314, 'Admin', ' - created this', 'App\\Models\\Admin', 103, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 103, \"name\": \"Kolby Feeney\", \"block\": 0, \"email\": \"wilderman.jany@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"LTXdyqxmld\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(315, 'Admin', ' - created this', 'App\\Models\\Admin', 104, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 104, \"name\": \"Cheyanne Fadel Sr.\", \"block\": 0, \"email\": \"jennyfer58@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"HtHEVVPnjg\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur'),
(316, 'Admin', ' - created this', 'App\\Models\\Admin', 105, 'created', NULL, NULL, NULL, '{\"attributes\": {\"id\": 105, \"name\": \"Joyce Funk\", \"block\": 0, \"email\": \"maryse84@example.org\", \"mobile\": null, \"status\": \"active\", \"address\": null, \"profile\": \"null\", \"role_id\": 1, \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"username\": null, \"created_at\": \"2024-09-29T10:10:33.000000Z\", \"created_by\": null, \"created_ip\": null, \"deleted_at\": null, \"updated_at\": \"2024-09-29T10:10:33.000000Z\", \"updated_by\": null, \"updated_ip\": null, \"remember_token\": \"1n39FYmMnm\"}}', '2024-09-29 04:10:33', '2024-09-29 04:10:33', 'ur');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` tinyint NOT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `block` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Active, 1=Deactive',
  `status` enum('active','deactive','trash') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `username`, `email`, `password`, `mobile`, `profile`, `address`, `block`, `status`, `remember_token`, `created_by`, `created_ip`, `updated_by`, `updated_ip`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nogor Solutions', 'nsl', 'abdulmajidcse11@gmail.com', '$2y$10$FMmnMinNWzC4IGDGti4SuuIYUGL8IMF2MWuEfIbDYuRiXxO8deYZa', '01700000000', '{\"600x600\":\"upload\\/profile\\/600x600\\/c6453b57-2dc1-493d-a16a-75c42e9b4944.avif\",\"300x300\":\"upload\\/profile\\/300x300\\/b167c6e5-b4c4-4207-b166-b47e2ef1a131.avif\",\"50x50\":\"upload\\/profile\\/50x50\\/7286c2ed-d7fc-4180-b4f6-f8fe90697ce4.avif\",\"original\":\"upload\\/profile\\/original\\/e1930bc4-8b95-410f-905f-a792a011a414.avif\"}', NULL, 0, 'active', 'Noq0rS6iAAACOw3Zd0yrjCEB65fctH0JWTlVs24Cl89KTP1E904igwhlM5Ek', NULL, NULL, NULL, NULL, NULL, '2024-06-02 06:52:42', '2024-09-29 00:37:25'),
(2, 2, 'Nogor', 'nogor', 'nogor@gmail.com', '$2y$10$vhXVbcz.u20OPXluhUj57.SOgrgetSgtLnMmPwHDw28kKeeQIWWn6', '01700000001', NULL, NULL, 0, 'active', 'ygDxptVw98', NULL, NULL, NULL, NULL, NULL, '2024-06-02 06:52:42', '2024-06-02 06:52:42'),
(3, 1, 'Joseph Gibson', NULL, 'tepyxowef@mailinator.com', '$2y$10$O4yLnEK59eaOwlZHzEyGWOYA/j9sq9d.Vbcn0AUE6ThUmU1KMVnym', NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, '2024-09-17 01:03:51', '2024-09-17 01:03:38', '2024-09-17 01:03:51'),
(4, 1, 'Solomon Robinson', NULL, 'poqurad@mailinator.com', '$2y$10$VL0mMzIBvqr2753iEKZOg.CXLrM99j2syK2XAYEUQFEEiiy6ZBEP.', NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, '2024-09-18 03:27:19', '2024-09-18 03:26:55', '2024-09-18 03:27:19'),
(5, 1, 'Emma Finch', NULL, 'cyhohypo@mailinator.com', '$2y$10$Y/f7ez9oiZqiY.oAPUNRleXPp/JcnYDtFMt6Ax0/SQ/m4ODtkS4KK', NULL, NULL, NULL, 0, 'active', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:03:53', '2024-09-29 04:03:53'),
(6, 1, 'Cordelia Volkman', NULL, 'jimmie.wintheiser@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'iIykCWmqyD', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(7, 1, 'Jocelyn Ullrich', NULL, 'stracke.sylvia@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'HUGZDi2cjW', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(8, 1, 'Gene Willms', NULL, 'opal75@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'HV11sc6J2R', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(9, 1, 'Lisandro Hill I', NULL, 'tbayer@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'BtHDHEDxrT', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(10, 1, 'Miss Krystel Spinka V', NULL, 'rossie87@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '9QjQ2QNTQh', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(11, 1, 'Estefania Weissnat PhD', NULL, 'nat.gerhold@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'PusKaV9AQr', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(12, 1, 'Mr. Jeramie Hills III', NULL, 'gjast@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'e1fikTF3Wr', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(13, 1, 'Kraig Hauck II', NULL, 'gulgowski.sally@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '4pDe3AOhW5', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(14, 1, 'Prof. Fatima Streich', NULL, 'ryan.kristofer@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'YAPYj6gE7P', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(15, 1, 'Kali Dietrich', NULL, 'bennie44@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'uU1ofnyA4e', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(16, 1, 'Allan Mraz', NULL, 'abshire.imelda@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'Pqun1dRGKW', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(17, 1, 'Bria Bahringer', NULL, 'lubowitz.margaret@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'LcZp3NOxyD', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(18, 1, 'Bert Ankunding', NULL, 'boehm.orion@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'GMQGvwyO7s', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(19, 1, 'Jordy Quitzon', NULL, 'zkonopelski@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'xZPhJfgiC5', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(20, 1, 'Adell Kertzmann I', NULL, 'clare.goyette@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '2wqxCzu1w7', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(21, 1, 'Rhiannon Bradtke', NULL, 'julien81@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'mMBxdPgVlF', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(22, 1, 'Norberto O\'Conner', NULL, 'janet.willms@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'QWZ81pMYvh', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(23, 1, 'Gustave Crona', NULL, 'mosciski.mathias@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'y6wCRieyYB', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(24, 1, 'Miss Lyla Wisoky III', NULL, 'mathias63@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'Havdhe3Yil', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(25, 1, 'Prof. Adam Gulgowski', NULL, 'crist.breanne@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'iZUpiPjeH9', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(26, 1, 'Brenda Gislason', NULL, 'rene.larson@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '7phwOjSRXB', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(27, 1, 'Prof. Retha Cronin', NULL, 'ada83@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'ggqkrL4Iwa', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(28, 1, 'Lia Crooks', NULL, 'jcole@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'g0o9KqFBkd', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(29, 1, 'Olin Goyette', NULL, 'litzy64@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'tYjnaBusL4', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(30, 1, 'Alycia Wyman', NULL, 'cklein@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'sJxKLbToHR', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(31, 1, 'Jayde Block', NULL, 'rohan.jessica@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'Ou7ki48KiT', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(32, 1, 'Shanelle Glover', NULL, 'price.trisha@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'aG2skpfxmE', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(33, 1, 'Jake Schneider', NULL, 'corwin.coty@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'OjupZNzWj4', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(34, 1, 'Jarrell Kris PhD', NULL, 'alex91@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'xAxzp0kmip', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(35, 1, 'Dr. Harmon Schaden PhD', NULL, 'zschroeder@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'sIgrXjF36W', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(36, 1, 'Anastacio Eichmann', NULL, 'jamar09@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'U3nwoofyFB', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(37, 1, 'Salma Stamm', NULL, 'delphine12@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'sqzFe0G7cU', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(38, 1, 'Maximo Cormier I', NULL, 'rwelch@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'jJBkWLZPFe', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(39, 1, 'Camden Wolff', NULL, 'lbailey@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'uhdhdvCh5v', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(40, 1, 'Fidel Schulist', NULL, 'monahan.ellsworth@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'ZScB8K2RxB', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(41, 1, 'Zakary Greenholt', NULL, 'okon.torrance@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'foV0zBIw6q', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(42, 1, 'Rhianna Leannon', NULL, 'evalyn72@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'rmG7wRhPKv', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(43, 1, 'Ulises Nitzsche', NULL, 'beaulah12@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'wQjpxiMjsb', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(44, 1, 'Devin Bednar', NULL, 'ohyatt@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'AzvvP6KPPO', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(45, 1, 'Thurman Aufderhar', NULL, 'emedhurst@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'VO4wjrsnf4', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(46, 1, 'Maribel Skiles', NULL, 'randy00@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '7UVVL8Qcc4', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(47, 1, 'Deontae Deckow PhD', NULL, 'ureilly@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'JzTQL1zzR9', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(48, 1, 'Chasity Bergstrom MD', NULL, 'hane.jamie@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'HcOefwm9Mr', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(49, 1, 'Alvina Boyle', NULL, 'joanie22@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '92wt47llGn', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(50, 1, 'Joanie Collins', NULL, 'anderson.andres@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'FbpbLWFva9', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(51, 1, 'Mrs. Heath King I', NULL, 'klein.fermin@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'umZlK8Kg0q', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(52, 1, 'Mrs. Ashlee Wolf', NULL, 'asa25@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'D2Y91dYQSN', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(53, 1, 'Zoila Rath', NULL, 'fisher.reilly@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'JUIDimlXFt', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(54, 1, 'Ms. Dora Crooks', NULL, 'virginie87@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'C2eZTJNejt', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(55, 1, 'Ms. Elva Kshlerin', NULL, 'chanelle97@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'N5bCe0bfCs', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(56, 1, 'Shannon Glover I', NULL, 'drew78@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'ufTFFt0dni', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(57, 1, 'Tatyana Collins', NULL, 'vbergnaum@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'GBu5BotdNg', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(58, 1, 'Rowland Bechtelar', NULL, 'schaefer.gregg@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'Dw1WM75cUU', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(59, 1, 'Dr. Addison Kshlerin Sr.', NULL, 'gislason.kadin@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'khKqRbB0Ek', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(60, 1, 'Dr. Albertha Legros DDS', NULL, 'spinka.fredy@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'URAAPEXdHB', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(61, 1, 'Ms. Reanna Roob', NULL, 'rodriguez.bert@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'nT9lVGvvij', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(62, 1, 'Alfred Thompson', NULL, 'okertzmann@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '5luA1urBhk', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(63, 1, 'Alanis Roberts DVM', NULL, 'krosenbaum@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'F9NsZI3nGW', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(64, 1, 'Carleton Leffler', NULL, 'harvey.stephan@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'QyTor4i0tT', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(65, 1, 'Reese Hintz', NULL, 'jenkins.josiane@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'UTP6dE1cDu', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(66, 1, 'Lynn Kuhn', NULL, 'joesph.fahey@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '7aVXItfckc', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(67, 1, 'Elisha Bashirian', NULL, 'heichmann@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'Fy8O0ptIQt', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(68, 1, 'Mrs. Heaven Dietrich', NULL, 'kayley.wiza@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'wYJNHpLCFR', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(69, 1, 'Dr. Geovanni Bruen IV', NULL, 'queen.murray@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'lQdiMWyCgE', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(70, 1, 'Kenny Rutherford', NULL, 'tavares09@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '31xkkmOcfV', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(71, 1, 'Dr. Alysa Towne', NULL, 'mfarrell@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'mADCItb5BK', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(72, 1, 'Lisa Dach', NULL, 'brenna44@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'f04BDHyVh7', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(73, 1, 'Dr. Julio Green', NULL, 'tlowe@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'gPVVdiKUMK', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(74, 1, 'Lawson Rowe', NULL, 'carmel45@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'kZS1bTYTD4', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(75, 1, 'Dr. Faye Feeney II', NULL, 'lavonne96@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'TKpIEHqW7q', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(76, 1, 'Geo Donnelly', NULL, 'parker51@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'xvuJMbEN3U', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(77, 1, 'Bobby Schinner', NULL, 'gsauer@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '3vmLE4GVwL', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(78, 1, 'Mitchel Feil', NULL, 'ybechtelar@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'X0WLaYpjz4', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(79, 1, 'Chyna Mueller', NULL, 'vcrooks@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '5P27RjM7Pa', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(80, 1, 'Macie Rosenbaum', NULL, 'fking@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'tP6bpW1qXd', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(81, 1, 'Brycen O\'Kon', NULL, 'selina91@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'pXmykV6B7n', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(82, 1, 'Mrs. Maggie Christiansen', NULL, 'floyd.harvey@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'uj0ACypjim', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(83, 1, 'Tatum Brakus', NULL, 'briana11@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'Mq9DODunDi', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(84, 1, 'Dr. Eleanora Huel', NULL, 'zcollier@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'IzYXTISpdu', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(85, 1, 'Dr. Ernestine White II', NULL, 'block.dixie@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'rmAT6YZGjT', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(86, 1, 'D\'angelo Eichmann MD', NULL, 'xander29@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '2gZ6lSNK2U', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(87, 1, 'Nasir Kshlerin', NULL, 'fkertzmann@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'HrKxM9Utzj', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(88, 1, 'Elizabeth Windler', NULL, 'morar.christelle@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'uK0mBVdVog', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(89, 1, 'Nia Wintheiser Sr.', NULL, 'mitchell.avery@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'xRqCSbQSzH', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(90, 1, 'Dr. Dereck Collier MD', NULL, 'ivah.bergstrom@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '2N0xmp73m3', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(91, 1, 'Miss Abbie Stark I', NULL, 'eloise93@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'CV5ce3hNZM', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(92, 1, 'Mertie Treutel', NULL, 'gkub@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'XUstXnkJoJ', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(93, 1, 'Duncan Towne', NULL, 'otho18@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'zOQDE50R5W', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(94, 1, 'Dayna Jacobson', NULL, 'sonny26@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'sW2wDVTI6g', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(95, 1, 'Prof. Charley Hand MD', NULL, 'awyman@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'uM4idSOhya', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(96, 1, 'Prof. Dean Fisher I', NULL, 'hprosacco@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'mU3rVWHmHN', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(97, 1, 'Sven Littel', NULL, 'ewald.kuvalis@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'Rr3188u21d', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(98, 1, 'Vida Ledner', NULL, 'pat.olson@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '16GV5AGLww', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(99, 1, 'Wilmer Hickle', NULL, 'zrutherford@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'lwFpRYtrxV', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(100, 1, 'Mr. Brenden Hettinger', NULL, 'odamore@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'tOE5VMBYyL', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(101, 1, 'Ms. Gertrude Ankunding DDS', NULL, 'djaskolski@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'WAsexWOPLo', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(102, 1, 'Khalil Beatty', NULL, 'howell.breanna@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'hcWyLONj5h', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(103, 1, 'Kolby Feeney', NULL, 'wilderman.jany@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'LTXdyqxmld', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(104, 1, 'Cheyanne Fadel Sr.', NULL, 'jennyfer58@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', 'HtHEVVPnjg', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33'),
(105, 1, 'Joyce Funk', NULL, 'maryse84@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 0, 'active', '1n39FYmMnm', NULL, NULL, NULL, NULL, NULL, '2024-09-29 04:10:33', '2024-09-29 04:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `module_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `module_name`, `title`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Events', 'Event', 1, 'active', NULL, '2024-08-21 06:17:55'),
(2, 'News', 'News', 2, 'active', NULL, '2024-08-21 06:41:08'),
(3, 'Notice', 'Notice', 3, 'active', NULL, '2024-08-21 06:41:13'),
(4, 'Notice', 'new updated', 4, 'active', '2024-08-18 04:30:56', '2024-08-18 04:31:09'),
(5, 'News', 'ttt ed', 5, 'deactive', '2024-08-18 04:33:29', '2024-08-18 04:33:29'),
(6, 'Notice', 'fdfd', 5, 'active', '2024-08-18 04:34:38', '2024-08-21 06:40:56'),
(9, 'Events', 'tttt', 8, 'active', '2024-08-21 00:42:12', '2024-08-25 04:46:54'),
(10, 'Events', 'dfdfd', 8, 'active', '2024-08-25 22:02:38', '2024-08-25 22:02:38'),
(11, 'News', 'dfd fdfd', 9, 'active', '2024-08-25 22:02:44', '2024-08-25 22:02:54'),
(12, 'Notice', 'dffdfdfd', 10, 'active', '2024-08-25 22:26:18', '2024-08-25 22:26:18'),
(13, 'Notice', 'my title', 11, 'active', '2024-08-25 22:27:35', '2024-08-26 23:05:26'),
(14, 'Notice', 'dfdfdfdf', 12, 'active', '2024-09-15 04:42:30', '2024-09-15 04:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `iso` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numcode` smallint DEFAULT NULL,
  `phonecode` int NOT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(53, 'CI', 'Cote D\'Ivoire', 'CIV', 384, 225, 0, 'active', NULL, NULL),
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
(112, 'KP', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850, 0, 'active', NULL, NULL),
(113, 'KR', 'Korea, Republic of', 'KOR', 410, 82, 0, 'active', NULL, NULL),
(114, 'KW', 'Kuwait', 'KWT', 414, 965, 0, 'active', NULL, NULL),
(115, 'KG', 'Kyrgyzstan', 'KGZ', 417, 996, 0, 'active', NULL, NULL),
(116, 'LA', 'Lao People\'s Democratic Republic', 'LAO', 418, 856, 0, 'active', NULL, NULL),
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
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_infos`
--

CREATE TABLE `help_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_validators`
--

CREATE TABLE `media_validators` (
  `id` bigint UNSIGNED NOT NULL,
  `model_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_size` int NOT NULL,
  `min_width` int DEFAULT NULL,
  `min_height` int DEFAULT NULL,
  `resize_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_validators`
--

INSERT INTO `media_validators` (`id`, `model_name`, `field_name`, `field_type`, `max_size`, `min_width`, `min_height`, `resize_value`, `sorting`, `status`, `created_by`, `updated_by`, `created_ip`, `updated_ip`, `created_at`, `updated_at`) VALUES
(2, 'Admin', 'profile', 'image', 5000, 600, 600, '[\"600x600\",\"300x300\",\"50x50\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-10 00:36:15', '2024-09-11 00:50:34'),
(5, 'Album', 'image', 'image', 5120, 600, 600, '[\"600x600\",\"340x340\",\"242x242\",\"50x50\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-10 03:46:00', '2024-09-10 23:29:38'),
(18, 'Content', 'image', 'image', 5000, 600, 600, '[\"600x600\",\"200x200\",\"50x50\"]', 0, 'active', NULL, NULL, NULL, NULL, '2024-09-11 22:41:03', '2024-09-14 23:28:08');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `menu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `show_dasboard` tinyint NOT NULL DEFAULT '0',
  `show_profile` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `menu_name`, `icon`, `route_name`, `params`, `sorting`, `show_dasboard`, `show_profile`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Dashboard', '<i class=\'fas fa-cog spin\'></i>', 'dashboard.index', NULL, 0, 0, 0, NULL, '2024-08-26 02:38:45'),
(2, NULL, 'Admin', '<i class=\'fa fa-user\'></i>', 'admin.index', NULL, 1, 0, 0, NULL, '2024-08-26 02:38:53'),
(3, NULL, 'Master Setup', '<i class=\'fab fa-mastodon\'></i>', NULL, NULL, 2, 0, 0, NULL, NULL),
(4, 3, 'Category', '<i class=\'fa fa-list text-aqua\'></i>', 'category.index', NULL, 0, 0, 0, NULL, NULL),
(13, NULL, 'Profile', '<i class=\'fa fa-user-o\'></i>', 'profile.index', NULL, 5, 0, 0, NULL, NULL),
(19, NULL, 'System Settings', '<i class=\'fa fa-windows\'></i>', NULL, NULL, 7, 0, 0, NULL, NULL),
(20, 19, 'User Role', '<i class=\'fa fa-list text-aqua\'></i>', 'role.index', NULL, 0, 1, 0, NULL, NULL),
(21, 19, 'Backend Menu List', '<i class=\'fa fa-list text-aqua\'></i>', 'menu.index', NULL, 1, 0, 0, NULL, '2024-08-25 22:00:11'),
(23, 19, 'Site Settings', '<i class=\'fa fa-cog text-aqua\'></i>', 'siteSetting.show', NULL, 3, 1, 1, NULL, '2024-08-26 02:39:11'),
(24, 19, 'Activity Log', '<i class=\'fa fa-history\'></i>', 'activityLog.index', NULL, 4, 0, 0, NULL, NULL),
(25, 19, 'Module Create', '<i class=\'fa fa-folder text-aqua\'></i>', 'module.create', NULL, 5, 0, 0, NULL, NULL),
(34, 3, 'Media Validator', '<i class=\'fas fa-image\'></i>', 'mediaValidator.index', NULL, 29, 0, 0, '2024-09-09 22:50:02', '2024-09-09 22:50:02'),
(37, 3, 'Help Info', '<i class=\'fas fa-question-circle\'></i>', 'helpInfo.index', NULL, 13, 0, 0, '2024-09-29 00:03:18', '2024-09-29 00:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(38, '2024_09_18_113232_create_help_infos_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(1, 'nsl@gmail.com', '$2y$10$TPwVTU2Q3EscGtm2tzP0h.CGOPWpRWRdvvm9xvnjHR/21sjeot7Ra', '2024-09-12 05:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(232, 'destroy', 'helpInfo.destroy', 225);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corp` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `select` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'active', '2024-06-02 06:52:42', '2024-06-02 06:52:42'),
(2, 'Nogor', 'active', '2024-06-02 06:52:42', '2024-06-02 06:52:42'),
(3, 'Nogor Solutions Limited', 'active', '2024-09-18 03:35:06', '2024-09-18 03:35:06');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL
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
(1, 4),
(2, 4),
(3, 4),
(1, 5),
(2, 5),
(3, 5),
(1, 6),
(2, 6),
(3, 6),
(1, 8),
(2, 8),
(1, 9),
(2, 9),
(3, 9),
(1, 75),
(2, 75),
(1, 76),
(2, 76),
(3, 76),
(1, 77),
(2, 77),
(3, 77),
(1, 78),
(2, 78),
(3, 78),
(1, 79),
(2, 79),
(3, 79),
(1, 80),
(2, 80),
(3, 80),
(1, 81),
(2, 81),
(3, 81),
(1, 82),
(2, 82),
(3, 82),
(1, 115),
(2, 115),
(1, 116),
(2, 116),
(3, 116),
(1, 117),
(2, 117),
(1, 118),
(2, 118),
(3, 118),
(1, 119),
(2, 119),
(3, 119),
(1, 120),
(2, 120),
(3, 120),
(1, 121),
(2, 121),
(3, 121),
(1, 122),
(2, 122),
(3, 122),
(1, 123),
(2, 123),
(3, 123),
(1, 124),
(2, 124),
(3, 124),
(1, 125),
(2, 125),
(1, 126),
(2, 126),
(3, 126),
(1, 127),
(2, 127),
(3, 127),
(1, 128),
(2, 128),
(3, 128),
(1, 129),
(2, 129),
(3, 129),
(1, 130),
(2, 130),
(3, 130),
(1, 131),
(2, 131),
(3, 131),
(1, 132),
(2, 132),
(3, 132),
(1, 133),
(2, 133),
(1, 134),
(2, 134),
(3, 134),
(1, 135),
(2, 135),
(3, 135),
(1, 136),
(2, 136),
(3, 136),
(1, 137),
(2, 137),
(3, 137),
(1, 138),
(2, 138),
(3, 138),
(1, 139),
(2, 139),
(3, 139),
(1, 140),
(2, 140),
(3, 140),
(1, 141),
(2, 141),
(1, 142),
(2, 142),
(3, 142),
(1, 143),
(2, 143),
(3, 143),
(1, 144),
(2, 144),
(3, 144),
(1, 145),
(2, 145),
(3, 145),
(1, 146),
(2, 146),
(3, 146),
(1, 147),
(2, 147),
(3, 147),
(1, 148),
(2, 148),
(3, 148),
(1, 149),
(2, 149),
(3, 149),
(1, 198),
(2, 198),
(1, 202),
(2, 202),
(1, 207),
(2, 207),
(1, 208),
(2, 208),
(3, 208),
(1, 209),
(2, 209),
(3, 209),
(1, 210),
(2, 210),
(3, 210),
(1, 211),
(2, 211),
(3, 211),
(1, 212),
(2, 212),
(3, 212),
(1, 213),
(2, 213),
(3, 213),
(1, 214),
(2, 214),
(3, 214),
(1, 215),
(2, 215),
(3, 215),
(1, 224),
(2, 224),
(3, 224),
(1, 225),
(2, 225),
(1, 226),
(2, 226),
(1, 227),
(2, 227),
(1, 228),
(2, 228),
(1, 229),
(2, 229),
(1, 230),
(2, 230),
(1, 231),
(2, 231),
(1, 232),
(2, 232);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo_small` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `favicon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `developed_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `developed_by_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tw` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ln` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `yt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_meta` tinyint NOT NULL DEFAULT '0',
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sidebar_footer_color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sidebar_top_color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sidebar_color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `navbar_color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `breadcrumb_color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `title`, `short_title`, `contact_email`, `feedback_email`, `mobile1`, `mobile2`, `logo`, `logo_small`, `favicon`, `address`, `developed_by`, `developed_by_url`, `web`, `fb`, `tw`, `ln`, `yt`, `map`, `is_meta`, `meta`, `sidebar_footer_color`, `sidebar_top_color`, `sidebar_color`, `navbar_color`, `breadcrumb_color`, `created_at`, `updated_at`) VALUES
(1, 'Nogor Solutions Limited', 'NSL', 'nsl@gmail.com', 'nsl@gmail.com', '01700000000', '01700000000', '{\"600x200\":\"upload\\/logo\\/600x200\\/f6608da8-74d6-44bf-a05d-7832b9d48133.avif\",\"300x100\":\"upload\\/logo\\/300x100\\/985fe9bd-a89b-4849-a482-6814db461eb6.avif\",\"150x50\":\"upload\\/logo\\/150x50\\/4eee65c6-2639-4904-a762-aa21c70fa9f4.avif\",\"original\":\"upload\\/logo\\/original\\/9ba5ef6e-0a6b-4be1-94e5-eafee2346bd9.avif\"}', '{\"600x200\":\"upload\\/logo_small\\/600x200\\/99139217-fcec-432d-8b13-17a6c9a0b825.avif\",\"300x100\":\"upload\\/logo_small\\/300x100\\/03d1110e-cb55-4733-b713-7dd0d8be78a6.avif\",\"150x50\":\"upload\\/logo_small\\/150x50\\/a15d300a-11e3-43ee-8083-06ac63c70d78.avif\",\"original\":\"upload\\/logo_small\\/original\\/f2baab5f-fc97-48fd-b356-c91467a4ecda.avif\"}', '', 'sdjhasdjhaswdrsdg dfz', 'Nogor Solutions', 'https://nogorsolutions.com/', 'https://nogorsolutions.com/', NULL, NULL, NULL, NULL, NULL, 0, NULL, '#000000', '#000000', '#2f3a4e', '#61daff', '#ffffff', '2024-06-02 06:52:42', '2024-09-23 01:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_login_histories`
--

CREATE TABLE `user_login_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `user_guard` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_at` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_browser_client` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `status` enum('active','deactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(104, 1, 'admin', '2024-09-29 09:56:19', '::1', 'Google Chrome', 0, 'active', '2024-09-29 03:56:19', '2024-09-29 03:56:19');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `help_infos`
--
ALTER TABLE `help_infos`
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_infos`
--
ALTER TABLE `help_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_validators`
--
ALTER TABLE `media_validators`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_login_histories`
--
ALTER TABLE `user_login_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
