-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 22, 2023 at 08:11 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `automobile`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$VXEYYOC4VZ/Ge/OGXcXimOHE.2JMWlGGy/ONZeEa9xRNBLP7/5Qri', 'fQFI18Vapad06ZVd0lD3YZCkSFJeIbXr3HxnzmGUJf6nL2BZPgp1vaE1LP5I', '2023-06-19 12:23:33', '2023-08-27 15:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

CREATE TABLE `agencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `showroom_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_hide` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `showroom_id`, `city_id`, `district_id`, `name`, `address`, `phone`, `whatsapp`, `link`, `is_hide`, `created_at`, `updated_at`) VALUES
(20, 7, 3, 6, '{\"ar\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"en\":\"Ciro\"}', '{\"en\":\"Maadi\",\"ar\":\"\\u0627\\u0644\\u0645\\u0639\\u0627\\u062f\\u064a\"}', '01009282540', '01009282540', NULL, '0', '2023-08-03 16:05:08', '2023-08-03 16:05:08'),
(21, 7, 3, 5, '{\"ar\":\"\\u0644\\u0627\\u0639\\u0627\\u0627\\u0644\",\"en\":\"\\u0644\\u0627\\u062a\\u0627\\u0639\"}', '{\"en\":\"\\u0629\\u0647\\u062a\\u062a\\u0639\",\"ar\":\"\\u0629\\u062a\\u062a\\u062a\\u062a\"}', '01018829405', '01018829405', NULL, '0', '2023-08-03 16:07:27', '2023-08-03 16:07:27'),
(23, 9, 3, 5, '{\"ar\":\"test_man\",\"en\":\"test_man_en\"}', '{\"en\":\"test_address_en\",\"ar\":\"test_address\"}', '01006449771', '01006449771', NULL, '0', '2023-08-08 10:38:45', '2023-08-08 10:38:45'),
(24, 9, 3, 5, '{\"ar\":\"new addresss\",\"en\":\"new addresss\"}', '{\"en\":\"new address\",\"ar\":\"new address\"}', '01006449771', '01006449771', NULL, '0', '2023-08-09 17:00:14', '2023-08-09 17:09:40'),
(25, 8, 3, 6, '{\"ar\":\"t\",\"en\":\"t\"}', '{\"en\":\"t\",\"ar\":\"t\"}', '01234567890', '01234567890', NULL, '0', '2023-08-09 19:10:47', '2023-08-09 19:10:47'),
(26, 8, 3, 5, '{\"ar\":\"\\u0641\\u0631\\u0639 \\u0627\\u0644\\u0647\\u0631\\u0645\",\"en\":\"haram branch\"}', '{\"en\":\"\\u0668\\u0665\\u0665\\u0631\\u0646\\u0629\\u0645\\u0649\\u0632\",\"ar\":\"\\u0645\\u0627\\u0627\\u0644\\u0646\\u0644\\u0647\\u0648\\u063a\\u0627\\u0667\\u063a\\u0665\\u0641\\u0629\\u0649\"}', '٠١١١١١٣٥٦٧٧٦٦٥', '٠٨٦٥٥٤٣٥٧٧٨٦٦', NULL, '0', '2023-08-09 21:15:13', '2023-08-09 21:15:13'),
(27, 10, 3, 6, '{\"ar\":\"\\u0645\\u0635\\u0631 \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0629\",\"en\":\"Egypt\"}', '{\"en\":\"Egypt\",\"ar\":\"\\u0645\\u0635\\u0631\"}', '01987654321', '01987654321', NULL, '0', '2023-08-13 12:39:48', '2023-08-13 12:39:48'),
(28, 11, 3, 6, '{\"ar\":\"Qana\",\"en\":\"ciro\"}', '{\"en\":\"ciro\",\"ar\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\"}', '01018829405', '01018829405', NULL, '0', '2023-08-13 14:43:41', '2023-08-14 13:01:06'),
(29, 11, 6, 12, '{\"ar\":\"\\u0641\\u0631\\u0639 \\u0623\\u0643\\u062a\\u0648\\u0628\\u0631\",\"en\":\"October Branch\"}', '{\"en\":\"October Branch, El Hosary Square, Central Spine, in front of El Tawheed and El Nour\",\"ar\":\"\\u0641\\u0631\\u0639 \\u0627\\u0643\\u062a\\u0648\\u0628\\u0631 \\u0645\\u064a\\u062f\\u0627\\u0646 \\u0627\\u0644\\u062d\\u0635\\u0631\\u0649 \\u0627\\u0644\\u0645\\u062d\\u0648\\u0631 \\u0627\\u0644\\u0645\\u0631\\u0643\\u0632\\u0649 \\u0627\\u0645\\u0627\\u0645 \\u0627\\u0644\\u062a\\u0648\\u062d\\u064a\\u062f \\u0648\\u0627\\u0644\\u0646\\u0648\\u0631\"}', '01023557603', '01023557603', 'https://www.google.com/maps/search/October+Branch,+El+Hosary+Square,+Central+Spine,+in+front+of+El+Tawheed+and+El+Nour/@29.9720858,31.27672,15z?entry=ttu', '0', '2023-08-13 14:44:55', '2023-08-24 18:09:18'),
(30, 10, 3, 5, '{\"ar\":\"znzzj\",\"en\":\"ddhxhhd\"}', '{\"en\":\"xhxbxjx\",\"ar\":\"dgdhx\"}', '01099106281', '01099106281', NULL, '0', '2023-09-03 21:41:53', '2023-09-03 21:41:53'),
(31, 10, 3, 5, '{\"ar\":\"h\",\"en\":\"h\"}', '{\"en\":\"h\",\"ar\":\"h\"}', '06889', '876557899', NULL, '0', '2023-09-06 10:13:55', '2023-09-06 10:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(7, '{\"en\":\"Fiat\",\"ar\":\"\\u0641\\u064a\\u0627\\u062a\"}', '2023-08-08 10:59:08', '2023-08-08 10:59:08'),
(8, '{\"en\":\"KIA\",\"ar\":\"\\u0643\\u064a\\u0627\"}', '2023-08-08 11:03:46', '2023-08-08 11:03:46'),
(9, '{\"en\":\"Nissan\",\"ar\":\"\\u0646\\u064a\\u0633\\u0627\\u0646\"}', '2023-08-08 11:07:44', '2023-08-08 11:07:44'),
(10, '{\"en\":\"Seat\",\"ar\":\"\\u0633\\u064a\\u0627\\u062a\"}', '2023-08-08 11:08:09', '2023-08-08 11:08:09'),
(11, '{\"en\":\"Skoda\",\"ar\":\"\\u0633\\u0643\\u0648\\u062f\\u0627\"}', '2023-08-08 11:08:29', '2023-08-08 11:08:29'),
(12, '{\"en\":\"Mercedes\",\"ar\":\"\\u0645\\u0631\\u0633\\u064a\\u062f\\u0633\"}', '2023-08-08 11:08:56', '2023-08-08 11:08:56'),
(13, '{\"en\":\"Jeep\",\"ar\":\"\\u062c\\u064a\\u0628\"}', '2023-08-08 11:09:18', '2023-08-08 11:09:18'),
(14, '{\"en\":\"Hyundai\",\"ar\":\"\\u0647\\u064a\\u0648\\u0646\\u062f\\u0627\\u064a\"}', '2023-08-08 11:09:36', '2023-08-08 11:09:36'),
(15, '{\"en\":\"BMW\",\"ar\":\"\\u0628\\u064a \\u0625\\u0645 \\u062f\\u0627\\u0628\\u0644\\u064a\\u0648\"}', '2023-08-08 11:09:57', '2023-08-08 11:09:57'),
(16, '{\"en\":\"DFSK\",\"ar\":\"\\u062f\\u0641\\u0633\\u0643\"}', '2023-08-08 11:10:19', '2023-08-08 11:10:19'),
(17, '{\"en\":\"Toyota\",\"ar\":\"\\u062a\\u0648\\u064a\\u0648\\u062a\\u0627\"}', '2023-08-08 11:10:40', '2023-08-08 11:10:40'),
(18, '{\"en\":\"MG\",\"ar\":\"\\u0625\\u0645 \\u062c\\u064a\"}', '2023-08-08 11:11:02', '2023-08-08 11:11:02'),
(19, '{\"en\":\"Geely\",\"ar\":\"\\u062c\\u064a\\u0644\\u064a\"}', '2023-08-08 11:11:22', '2023-08-08 11:11:22'),
(20, '{\"en\":\"Soueast\",\"ar\":\"\\u0633\\u0627\\u0648\\u064a\\u0633\\u062a\"}', '2023-08-08 11:11:55', '2023-08-08 11:11:55'),
(21, '{\"en\":\"Chevrolet\",\"ar\":\"\\u0634\\u064a\\u0641\\u0631\\u0648\\u0644\\u064a\\u0647\"}', '2023-08-08 11:12:14', '2023-08-08 11:12:14'),
(22, '{\"en\":\"BYD\",\"ar\":\"\\u0628\\u064a \\u0648\\u0627\\u064a \\u062f\\u064a\"}', '2023-08-08 11:12:32', '2023-08-08 11:12:32'),
(23, '{\"en\":\"Brilliance\",\"ar\":\"\\u0628\\u0631\\u064a\\u0644\\u064a\\u0627\\u0646\\u0633\"}', '2023-08-08 11:12:53', '2023-08-08 11:12:53'),
(24, '{\"en\":\"Chery\",\"ar\":\"\\u0634\\u064a\\u0631\\u064a\"}', '2023-08-08 11:13:18', '2023-08-08 11:13:18'),
(25, '{\"en\":\"Changan\",\"ar\":\"\\u0634\\u0627\\u0646\\u062c\\u0627\\u0646\"}', '2023-08-08 11:13:40', '2023-08-08 11:13:40'),
(26, '{\"en\":\"Citro\\u00ebn\",\"ar\":\"\\u0633\\u064a\\u062a\\u0631\\u0648\\u064a\\u0646\"}', '2023-08-08 11:14:34', '2023-08-08 11:14:34'),
(27, '{\"en\":\"Ford\",\"ar\":\"\\u0641\\u0648\\u0631\\u062f\"}', '2023-08-08 11:14:51', '2023-08-08 11:14:51'),
(28, '{\"en\":\"Haval\",\"ar\":\"\\u0647\\u0627\\u0641\\u0627\\u0644\"}', '2023-08-08 11:15:13', '2023-08-08 11:15:13'),
(29, '{\"en\":\"Honda\",\"ar\":\"\\u0647\\u0648\\u0646\\u062f\\u0627\"}', '2023-08-08 11:15:32', '2023-08-08 11:15:32'),
(30, '{\"en\":\"JAC\",\"ar\":\"\\u062c\\u0627\\u0643\"}', '2023-08-08 11:16:02', '2023-08-08 11:16:02'),
(31, '{\"en\":\"JETOUR\",\"ar\":\"\\u062c\\u064a\\u062a\\u0648\\u0631\"}', '2023-08-08 11:16:22', '2023-08-08 11:16:22'),
(32, '{\"en\":\"Lada\",\"ar\":\"\\u0644\\u0627\\u062f\\u0627\"}', '2023-08-08 11:16:44', '2023-08-08 11:16:44'),
(33, '{\"en\":\"Mazda\",\"ar\":\"\\u0645\\u0627\\u0632\\u062f\\u0627\"}', '2023-08-08 11:17:06', '2023-08-08 11:17:06'),
(34, '{\"en\":\"Mitsubishi\",\"ar\":\"\\u0645\\u064a\\u062a\\u0633\\u0648\\u0628\\u064a\\u0634\\u064a\"}', '2023-08-08 11:17:23', '2023-08-08 11:17:23'),
(35, '{\"en\":\"Opel\",\"ar\":\"\\u0623\\u0648\\u0628\\u0644\"}', '2023-08-08 11:17:48', '2023-08-08 11:17:48'),
(36, '{\"en\":\"Peugeot\",\"ar\":\"\\u0628\\u064a\\u062c\\u0648\"}', '2023-08-08 11:19:23', '2023-08-08 11:19:23'),
(37, '{\"en\":\"Proton\",\"ar\":\"\\u0628\\u0631\\u0648\\u062a\\u0648\\u0646\"}', '2023-08-08 11:19:47', '2023-08-08 11:19:47'),
(38, '{\"en\":\"Renault\",\"ar\":\"\\u0631\\u064a\\u0646\\u0648\"}', '2023-08-08 11:20:12', '2023-08-08 11:20:12'),
(39, '{\"en\":\"Soueast\",\"ar\":\"\\u0633\\u0627\\u0648\\u0627\\u064a\\u0633\\u062a\"}', '2023-08-08 11:20:29', '2023-08-08 11:20:29'),
(40, '{\"en\":\"Ssang Yong\",\"ar\":\"\\u0633\\u0627\\u0646\\u063a \\u064a\\u0648\\u0646\\u063a\"}', '2023-08-08 11:20:53', '2023-08-08 11:20:53'),
(41, '{\"en\":\"Subaru\",\"ar\":\"\\u0633\\u0648\\u0628\\u0627\\u0631\\u0648\"}', '2023-08-08 11:21:13', '2023-08-08 11:21:13'),
(42, '{\"en\":\"Suzuki\",\"ar\":\"\\u0633\\u0648\\u0632\\u0648\\u0643\\u064a\"}', '2023-08-08 11:21:34', '2023-08-08 11:21:34'),
(43, '{\"en\":\"Volkswagen\",\"ar\":\"\\u0641\\u0648\\u0644\\u0643\\u0633 \\u0641\\u0627\\u062c\\u0646\"}', '2023-08-08 11:21:52', '2023-08-08 11:21:52'),
(44, '{\"en\":\"Other\",\"ar\":\"\\u0627\\u062e\\u0631\\u064a\"}', '2023-08-08 11:22:24', '2023-08-08 11:22:24'),
(45, '{\"en\":\"Mercedes\",\"ar\":\"\\u0645\\u0631\\u0633\\u064a\\u062f\\u0633\"}', '2023-08-09 19:12:13', '2023-08-09 19:12:13'),
(46, '{\"en\":\"bmw\",\"ar\":\"bmw\"}', '2023-08-27 15:21:15', '2023-08-27 15:21:15'),
(47, '{\"en\":\"hyundai\",\"ar\":\"hyundai\"}', '2023-08-27 15:21:15', '2023-08-27 15:21:15'),
(48, '{\"en\":\"mercedes\",\"ar\":\"mercedes\"}', '2023-08-27 15:21:15', '2023-08-27 15:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `car_model_id` bigint(20) UNSIGNED NOT NULL,
  `car_model_extension_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_hide` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_approved` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `drive_type` enum('manual','automatic') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fuel_type` enum('gasoline','diesel','natural_gas') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('new','used','certificated_used') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_buyed` enum('pending','approved','buyed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `vin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `doors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engine` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cylinders` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mileage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `car_type_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `model_name`, `model_id`, `title`, `brand_id`, `car_model_id`, `car_model_extension_id`, `branch_id`, `city_id`, `district_id`, `year`, `is_hide`, `is_approved`, `drive_type`, `fuel_type`, `status`, `status_buyed`, `vin`, `price`, `doors`, `engine`, `cylinders`, `mileage`, `description`, `created_at`, `updated_at`, `request_id`, `color_id`, `car_type_id`) VALUES
(111, 'App\\Models\\Showroom', 10, NULL, 8, 13, 81, 27, NULL, NULL, '2023', '1', '1', 'automatic', 'gasoline', 'used', 'buyed', NULL, '1660000.00', '4', '1300', '4', '8989898', 'تويوتا C-HR', '2023-08-29 10:58:03', '2023-09-21 22:03:28', NULL, 2, 2),
(112, 'App\\Models\\Admin', 1, NULL, 8, 13, 83, NULL, NULL, NULL, '2020', '1', '1', 'automatic', 'gasoline', 'used', 'buyed', NULL, '400000.00', NULL, '1600', '4', '10000', 'KIA GRAND CERATO 2020 A/T / HIGHLINE NEW', '2023-08-29 11:02:32', '2023-09-19 11:57:27', NULL, 2, 1),
(113, 'App\\Models\\Showroom', 10, NULL, 11, 18, 82, 27, NULL, NULL, '2021', '1', '1', 'automatic', 'natural_gas', 'used', 'pending', NULL, '1420000.00', '4', '1600', '4', '55000', 'Skoda Octavia', '2023-08-29 11:04:48', '2023-09-21 22:03:28', NULL, 1, 1),
(114, 'App\\Models\\Admin', 1, NULL, 11, 18, 80, NULL, NULL, NULL, '2023', '1', '1', 'automatic', 'gasoline', 'used', 'buyed', NULL, '1700000.00', NULL, '1400', '4', '0', 'Skoda Octavia A8 2023 A/T / Ambition for sale', '2023-08-29 11:10:49', '2023-09-19 16:11:58', NULL, 4, 1),
(116, 'App\\Models\\Showroom', 11, NULL, 23, 25, 59, 28, NULL, NULL, '2023', '1', '1', 'automatic', 'gasoline', 'new', 'pending', NULL, '406000.00', '4', '1600', '4', NULL, 'بريليانس H530', '2023-08-29 11:18:11', '2023-09-21 21:12:41', NULL, 3, 1),
(117, 'App\\Models\\Showroom', 11, NULL, 22, 26, 60, 29, NULL, NULL, '2023', '1', '1', 'automatic', 'diesel', 'new', 'pending', NULL, '430000.00', '4', '1500', '5', NULL, 'BYD L3 2023', '2023-08-29 11:28:26', '2023-09-21 21:12:41', NULL, 6, 1),
(118, 'App\\Models\\Admin', 1, NULL, 14, 21, 80, NULL, NULL, NULL, '2021', '1', '1', 'automatic', 'gasoline', 'used', 'approved', NULL, '600000.00', NULL, '1600', '4', '150000', 'HYUNDAI ELANTRA CN7 2021 A/T / SMART SAFETY', '2023-08-29 11:32:09', '2023-09-19 11:57:02', NULL, 3, 1),
(119, 'App\\Models\\Showroom', 11, NULL, 30, 27, 61, 28, NULL, NULL, '2022', '1', '1', 'automatic', 'diesel', 'new', 'pending', NULL, '610000.00', '4', '1500', '4', NULL, 'J7 2022', '2023-08-29 11:37:47', '2023-09-21 21:12:41', NULL, 1, 1),
(121, 'App\\Models\\Admin', 1, NULL, 18, 22, 83, NULL, NULL, NULL, '2022', '1', '1', 'automatic', 'gasoline', 'used', 'approved', NULL, '100000.00', NULL, '1500', '4', '5000', 'MG 6 2022 A/T / LUX / Black interior', '2023-08-29 11:55:40', '2023-09-19 11:53:47', NULL, 1, 1),
(125, 'App\\Models\\Admin', 1, NULL, 17, 28, 66, NULL, NULL, NULL, '2023', '0', '1', 'automatic', 'gasoline', 'used', 'approved', NULL, '1750000.00', NULL, '1500', '4', '0', NULL, '2023-08-30 11:43:32', '2023-09-14 16:14:44', NULL, 4, 5),
(141, 'App\\Models\\User', 13, NULL, 8, 13, 80, NULL, NULL, NULL, '2023', '1', '1', 'automatic', 'gasoline', 'used', 'pending', NULL, '5000000.00', '4', '1600', '4', '10000', 'test test', '2023-08-31 17:20:06', '2023-09-06 10:09:00', NULL, 2, 1),
(142, 'App\\Models\\User', 13, NULL, 8, 13, 82, NULL, NULL, NULL, '2021', '0', '1', 'manual', 'diesel', 'used', 'buyed', NULL, '646.00', '4', '44', '77', '44', 'تست', '2023-08-31 19:16:52', '2023-09-06 09:09:55', NULL, 3, 2),
(144, 'App\\Models\\Showroom', 10, NULL, 8, 11, 80, 27, NULL, NULL, '2021', '1', '1', 'automatic', 'diesel', 'new', 'pending', NULL, '6600000.00', '4', '1600', '4', NULL, 'car', '2023-09-04 17:11:14', '2023-09-21 22:03:28', NULL, 5, 1),
(145, 'App\\Models\\User', 27, NULL, 7, 11, 80, NULL, NULL, NULL, '2023', '0', '1', 'automatic', 'diesel', 'used', 'pending', NULL, '900000.00', '4', '1500', '4', '500', 'test test test', '2023-09-04 18:08:32', '2023-09-05 11:50:17', NULL, 2, 1),
(146, 'App\\Models\\User', 27, NULL, 8, 13, 83, NULL, NULL, NULL, '2022', '0', '1', 'automatic', 'diesel', 'used', 'pending', NULL, '1000000.00', '4', '1500', '4', '15000', 'test test test', '2023-09-04 18:30:43', '2023-09-05 11:50:17', NULL, 1, 1),
(147, 'App\\Models\\User', 27, NULL, 8, 13, 82, NULL, NULL, NULL, '2022', '0', '1', 'automatic', 'diesel', 'used', 'pending', NULL, '500000.00', '4', '1400', '4', '10000', 'test test', '2023-09-05 11:38:15', '2023-09-05 11:50:17', NULL, 3, 1),
(148, 'App\\Models\\Showroom', 10, NULL, 7, 11, 80, 27, NULL, NULL, '2023', '1', '1', 'automatic', 'diesel', 'new', 'pending', NULL, '28865.00', '4', '1600', '4', NULL, 'sa', '2023-09-05 11:49:37', '2023-09-21 22:03:28', NULL, 4, 1),
(149, 'App\\Models\\Admin', 1, NULL, 18, 22, 83, NULL, 3, NULL, '2022', '1', '1', 'automatic', 'gasoline', 'used', 'approved', NULL, '5000000.00', NULL, '1500', '4', '<optimized out>#fe47b(TextEditingValue(text: ┤10000├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', NULL, '2023-09-05 12:44:21', '2023-09-19 11:53:37', 43, 2, 1),
(150, 'App\\Models\\Showroom', 10, NULL, 7, 11, 80, 27, NULL, NULL, '2023', '1', '1', 'manual', 'gasoline', 'new', 'pending', NULL, '1300000.00', '4', '1400', '4', NULL, 'xbh', '2023-09-05 13:09:03', '2023-09-21 22:03:28', NULL, 6, 1),
(151, 'App\\Models\\Admin', 1, NULL, 7, 11, 80, NULL, 10, NULL, '2020', '1', '1', 'automatic', 'gasoline', 'used', 'approved', NULL, '147.00', NULL, 'Excepturi irure inci', 'Porro excepteur ea d', '500000', NULL, '2023-09-05 15:16:43', '2023-09-17 11:34:38', 48, 1, 5),
(152, 'App\\Models\\Admin', 1, NULL, 8, 13, 81, NULL, 3, NULL, '2022', '1', '1', 'automatic', 'diesel', 'used', 'approved', NULL, '95000000.00', NULL, 'Iure itaque pariatur', 'Dolore nostrum corpo', '<optimized out>#47aea(TextEditingValue(text: ┤2000├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', NULL, '2023-09-07 11:12:01', '2023-09-22 18:51:44', 52, 1, 8),
(153, 'App\\Models\\User', 29, NULL, 8, 13, 83, NULL, NULL, NULL, '2021', '0', '1', 'automatic', 'natural_gas', 'used', 'pending', NULL, '50000.00', '4', '1500', '1200', '1000', 'بحالة ممتازة', '2023-09-07 11:25:22', '2023-09-07 11:27:46', NULL, 7, 6),
(154, 'App\\Models\\User', 29, NULL, 7, 11, 80, NULL, NULL, NULL, '2022', '0', '1', 'automatic', 'diesel', 'used', 'pending', NULL, '1000000.00', '4', '1500', '4', '100000', 'test test', '2023-09-07 11:37:56', '2023-09-07 11:38:50', NULL, 3, 1),
(155, 'App\\Models\\User', 27, NULL, 8, 13, 82, NULL, NULL, NULL, '2022', '1', '0', 'manual', 'diesel', 'used', 'pending', NULL, '2880.00', '4', '88', '88', '100', 'hcg', '2023-09-07 13:49:08', '2023-09-07 13:49:08', NULL, 3, 6),
(156, 'App\\Models\\User', 35, NULL, 7, 11, 80, NULL, NULL, NULL, '2022', '0', '1', 'automatic', 'gasoline', 'used', 'pending', NULL, '89898.00', '4', '1598', '4', '95000', 'ؤورترتب', '2023-09-10 23:26:03', '2023-09-10 23:26:44', NULL, 5, 1),
(157, 'App\\Models\\User', 38, NULL, 7, 11, 81, NULL, 7, 20, '2007', '1', '0', 'automatic', 'gasoline', 'new', 'buyed', NULL, '900000.00', NULL, '5618', '4', '25663666', 'qweeqwrqwe', '2023-09-11 16:54:30', '2023-09-11 17:08:18', NULL, 2, 5),
(158, 'App\\Models\\Showroom', 10, NULL, 7, 11, 80, 27, NULL, NULL, '2023', '1', '1', 'automatic', 'diesel', 'new', 'pending', NULL, '990000.00', '4', '1600', '4', NULL, 'car', '2023-09-14 16:36:17', '2023-09-21 22:03:28', NULL, 6, 1),
(159, 'App\\Models\\Admin', 1, NULL, 17, 24, 58, NULL, NULL, NULL, '1995', '1', '1', 'automatic', 'diesel', 'used', 'approved', NULL, '1500.00', NULL, 'Ipsam quasi Nam qui', '1200', '20000', 'Occaecat beatae sed', '2023-09-17 11:33:16', '2023-09-19 16:12:46', NULL, 7, 8),
(160, 'App\\Models\\Admin', 1, NULL, 7, 11, 83, NULL, 3, NULL, '2023', '1', '1', 'automatic', 'diesel', 'used', 'approved', NULL, '100015.00', NULL, '1600', '2000', '200000', NULL, '2023-09-17 11:40:52', '2023-09-19 16:11:46', 55, 2, 2),
(161, 'App\\Models\\Admin', 1, NULL, 7, 12, 83, NULL, 3, NULL, '2023', '1', '1', 'automatic', 'diesel', 'used', 'approved', NULL, '1751231.00', NULL, '111', '11111', '<optimized out>#f15d1(TextEditingValue(text: ┤16005├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', NULL, '2023-09-17 11:59:50', '2023-09-19 16:11:39', 56, 2, 6),
(162, 'App\\Models\\Admin', 1, NULL, 8, 13, 82, NULL, 3, NULL, '2020', '1', '0', 'manual', 'natural_gas', 'used', 'approved', NULL, '851.00', NULL, 'Ut sed et quia fuga', 'Ducimus maiores dol', '500000', NULL, '2023-09-17 12:09:30', '2023-09-19 16:11:38', 57, 6, 9),
(163, 'App\\Models\\Admin', 1, NULL, 8, 13, 82, NULL, 3, NULL, '2020', '1', '0', 'automatic', 'natural_gas', 'used', 'approved', NULL, '253.00', NULL, 'Dicta tempora anim a', 'Quis aspernatur culp', '600000', NULL, '2023-09-17 12:15:17', '2023-09-19 16:11:37', 58, 5, 6),
(164, 'App\\Models\\Admin', 1, NULL, 7, 11, 80, NULL, 3, NULL, '2023', '1', '0', 'automatic', 'natural_gas', 'used', 'approved', NULL, '782.00', NULL, 'Eos recusandae Reru', 'Consequuntur accusam', '<optimized out>#71bc4(TextEditingValue(text: ┤20000├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', NULL, '2023-09-17 12:17:02', '2023-09-19 16:11:36', 59, 3, 1),
(165, 'App\\Models\\Admin', 1, NULL, 17, 29, 76, NULL, NULL, NULL, '2023', '0', '1', 'automatic', 'gasoline', 'new', 'approved', NULL, '1100000.00', NULL, '1300', '4', '5000', 'Toyota Yaris 2023 Gulf model', '2023-09-19 12:36:56', '2023-09-21 12:51:00', NULL, 6, 1),
(166, 'App\\Models\\Admin', 1, NULL, 17, 30, 83, NULL, NULL, NULL, '2023', '0', '1', 'automatic', 'gasoline', 'used', 'approved', NULL, '950000.00', NULL, '1.2', '4', '10000', 'Toyota Raize XLE Model 2023', '2023-09-19 13:14:45', '2023-09-19 13:17:16', NULL, 3, 1),
(167, 'App\\Models\\Admin', 1, NULL, 7, 11, 80, NULL, 3, NULL, '2023', '0', '0', 'automatic', 'diesel', 'used', 'approved', NULL, '4000.00', NULL, '200', '4', '<optimized out>#7e818(TextEditingValue(text: ┤500├, selection: TextSelection.collapsed(offset: 3, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', NULL, '2023-09-19 15:37:47', '2023-09-20 09:48:24', 60, 2, 1),
(168, 'App\\Models\\User', 49, NULL, 7, 11, 80, NULL, NULL, NULL, '2023', '1', '1', 'manual', 'gasoline', 'used', 'pending', NULL, '250000.00', '4', '500', '5', '50000', 'test', '2023-09-19 16:12:26', '2023-09-19 16:15:39', NULL, 7, 1),
(169, 'App\\Models\\Admin', 1, NULL, 7, 11, 80, NULL, 3, NULL, '2023', '1', '0', 'manual', 'gasoline', 'used', 'approved', NULL, '250000.00', NULL, 'test', '5', 'TextEditingController#837c3(TextEditingValue(text: ┤50000├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', NULL, '2023-09-19 20:59:19', '2023-09-19 20:59:19', 61, 1, 1),
(170, 'App\\Models\\Admin', 1, NULL, 7, 11, 82, NULL, 3, NULL, '2022', '1', '1', 'manual', 'diesel', 'used', 'approved', NULL, '5423.00', NULL, '1500', '2000', 'TextEditingController#eb2a3(TextEditingValue(text: ┤408200├, selection: TextSelection.collapsed(offset: 6, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', NULL, '2023-09-19 22:56:49', '2023-09-20 09:54:49', 73, 4, 6),
(171, 'App\\Models\\Admin', 1, NULL, 7, 11, 80, NULL, 3, NULL, '2023', '0', '1', 'automatic', 'diesel', 'used', 'approved', NULL, '950000.00', NULL, '40000', '4', '70000', 'هل من الممكن اضافه خانه نكتب فيها مواصفات السياره يدويا زى الافراد', '2023-09-20 15:55:17', '2023-09-20 16:57:12', 75, 2, 1),
(172, 'App\\Models\\User', 51, NULL, 7, 12, 82, NULL, 3, 6, '2021', '1', '1', 'manual', 'gasoline', 'new', 'pending', NULL, '33.00', NULL, '24', '2', '10000', 'شبشبسشبشسب', '2023-09-21 21:52:46', '2023-09-21 22:01:19', NULL, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `car_models`
--

CREATE TABLE `car_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_models`
--

INSERT INTO `car_models` (`id`, `name`, `brand_id`, `created_at`, `updated_at`) VALUES
(11, '{\"en\":\"Tipo\",\"ar\":\"\\u062a\\u064a\\u0628\\u0648\"}', 7, '2023-08-08 11:01:31', '2023-08-08 11:01:31'),
(12, '{\"en\":\"500X\",\"ar\":\"\\u0627\\u0643\\u0633 500\"}', 7, '2023-08-08 11:03:17', '2023-08-08 11:03:17'),
(13, '{\"en\":\"Cerato\",\"ar\":\"\\u0633\\u064a\\u0631\\u0627\\u062a\\u0648\"}', 8, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(18, '{\"en\":\"Octavia\",\"ar\":\"\\u0623\\u0648\\u0643\\u062a\\u0627\\u0641\\u064a\\u0627\"}', 11, '2023-08-24 16:48:02', '2023-08-24 16:48:02'),
(19, '{\"en\":\"Supereb\",\"ar\":\"\\u0633\\u0648\\u0628\\u064a\\u0631\\u0628\"}', 11, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(20, '{\"en\":\"Accent\",\"ar\":\"\\u0623\\u0643\\u0633\\u0646\\u062a\"}', 14, '2023-08-24 16:52:46', '2023-08-24 16:52:46'),
(21, '{\"en\":\"Elantra\",\"ar\":\"\\u0625\\u0644\\u0646\\u062a\\u0631\\u0627\"}', 14, '2023-08-24 16:53:58', '2023-08-24 16:53:58'),
(22, '{\"en\":\"MG 6\",\"ar\":\"\\u0627\\u0645 \\u062c\\u064a 6\"}', 18, '2023-08-24 19:20:55', '2023-08-24 19:20:55'),
(23, '{\"en\":\"Opel Mocha\",\"ar\":\"\\u0627\\u0648\\u0628\\u0644 \\u0645\\u0648\\u0643\\u0627\"}', 35, '2023-08-24 19:38:03', '2023-08-24 19:38:03'),
(24, '{\"en\":\"C-HR\",\"ar\":\"C-HR\"}', 17, '2023-08-29 10:54:20', '2023-08-29 10:54:20'),
(25, '{\"en\":\"H530\",\"ar\":\"H530\"}', 23, '2023-08-29 11:14:29', '2023-08-29 11:14:29'),
(26, '{\"en\":\"L3\",\"ar\":\"L3\"}', 22, '2023-08-29 11:22:39', '2023-08-29 11:22:39'),
(27, '{\"en\":\"J7\",\"ar\":\"J7\"}', 30, '2023-08-29 11:35:27', '2023-08-29 11:35:27'),
(28, '{\"en\":\"URBAN CRUISER\",\"ar\":\"\\u0623\\u0648\\u0631\\u0628\\u0627\\u0646 \\u0643\\u0631\\u0648\\u0632\\u0631\"}', 17, '2023-08-30 11:27:11', '2023-08-30 11:27:11'),
(29, '{\"en\":\"Yaris Y-Plus\",\"ar\":\"\\u064a\\u0627\\u0631\\u0633 \\u0648\\u0627\\u064a \\u0628\\u0644\\u0633\"}', 17, '2023-09-19 12:24:56', '2023-09-19 12:26:35'),
(30, '{\"en\":\"Raize XLE\",\"ar\":\"\\u0631\\u0627\\u064a\\u0632 \\u0627\\u0643\\u0633 \\u0627\\u0644 \\u0625\\u064a\"}', 17, '2023-09-19 13:09:46', '2023-09-19 13:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `car_model_extensions`
--

CREATE TABLE `car_model_extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_model_extensions`
--

INSERT INTO `car_model_extensions` (`id`, `name`, `car_model_id`, `created_at`, `updated_at`) VALUES
(32, 'Base Line', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(33, 'Med Line', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(34, 'High Line', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(35, 'Top Line', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(40, 'High Line', 18, '2023-08-24 16:48:02', '2023-08-24 16:48:02'),
(41, 'Med Line', 18, '2023-08-24 16:48:02', '2023-08-24 16:48:02'),
(42, 'Base Line', 18, '2023-08-24 16:48:02', '2023-08-24 16:48:02'),
(43, 'Top Line', 18, '2023-08-24 16:48:03', '2023-08-24 16:48:03'),
(44, 'High Line', 19, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(45, 'Base Line', 19, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(46, 'Med Line', 19, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(47, 'Top Line', 19, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(48, 'Top Line', 20, '2023-08-24 16:52:46', '2023-08-24 16:52:46'),
(49, 'High Line', 20, '2023-08-24 16:52:46', '2023-08-24 16:52:46'),
(50, 'Med Line', 20, '2023-08-24 16:52:46', '2023-08-24 16:52:46'),
(51, 'Base Line', 20, '2023-08-24 16:52:46', '2023-08-24 16:52:46'),
(52, 'Top Line', 21, '2023-08-24 16:53:58', '2023-08-24 16:53:58'),
(53, 'High Line', 21, '2023-08-24 16:53:58', '2023-08-24 16:53:58'),
(54, 'Med Line', 21, '2023-08-24 16:53:58', '2023-08-24 16:53:58'),
(55, 'Base Line', 21, '2023-08-24 16:53:58', '2023-08-24 16:53:58'),
(57, 'Opel Mocha', 23, '2023-08-24 19:38:03', '2023-08-24 19:38:03'),
(58, 'Toyota', 24, '2023-08-29 10:54:21', '2023-08-29 10:54:21'),
(59, 'H530', 25, '2023-08-29 11:14:29', '2023-08-29 11:14:29'),
(60, 'BYD L3', 26, '2023-08-29 11:22:39', '2023-08-29 11:22:39'),
(61, 'JAC J7', 27, '2023-08-29 11:35:27', '2023-08-29 11:35:27'),
(62, 'High Line', 22, '2023-08-29 11:52:59', '2023-08-29 11:52:59'),
(63, 'Base Line', 22, '2023-08-29 11:52:59', '2023-08-29 11:52:59'),
(64, 'Med Line', 22, '2023-08-29 11:52:59', '2023-08-29 11:52:59'),
(65, 'Top Line', 22, '2023-08-29 11:52:59', '2023-08-29 11:52:59'),
(66, 'GLX', 28, '2023-08-30 11:27:11', '2023-08-30 11:27:11'),
(67, 'Base Line/ بيز لاين', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(68, 'Med Line/ميد لاين', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(69, 'High Line/هاي لاين', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(70, 'Top Line/توب لاين', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(71, 'Base Line/بيز لاين', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(72, 'Med Line/ميد لاين', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(73, 'HighLine/هاي لاين', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(74, 'Top Line/توب لاين', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(76, 'Sedan', 29, '2023-09-19 12:26:35', '2023-09-19 12:26:35'),
(77, 'High line', 30, '2023-09-19 13:09:46', '2023-09-19 13:09:46'),
(78, 'Base line', 30, '2023-09-19 13:09:46', '2023-09-19 13:09:46'),
(79, 'Med line', 30, '2023-09-19 13:09:46', '2023-09-19 13:09:46'),
(80, 'base-line/بيز-لاين', NULL, '2023-09-22 18:27:15', '2023-09-22 18:27:15'),
(81, 'top-line/توب-لاين', NULL, '2023-09-22 18:27:15', '2023-09-22 18:27:15'),
(82, 'med-line/ميد-لاين', NULL, '2023-09-22 18:27:15', '2023-09-22 18:27:15'),
(83, 'high-line/هاي-لاين', NULL, '2023-09-22 18:27:15', '2023-09-22 18:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `car_model_years`
--

CREATE TABLE `car_model_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_model_years`
--

INSERT INTO `car_model_years` (`id`, `year`, `car_model_id`, `created_at`, `updated_at`) VALUES
(54, '2023', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(55, '2022', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(56, '2021', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(57, '2020', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(58, '2019', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(59, '2018', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(60, '2017', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(61, '2016', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(62, '2015', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(63, '2014', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(64, '2013', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(65, '2012', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(66, '2011', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(67, '2010', 13, '2023-08-08 11:06:13', '2023-08-08 11:06:13'),
(72, '2023', 18, '2023-08-24 16:48:02', '2023-08-24 16:48:02'),
(73, '2022', 18, '2023-08-24 16:48:02', '2023-08-24 16:48:02'),
(74, '2021', 18, '2023-08-24 16:48:02', '2023-08-24 16:48:02'),
(75, '2020', 18, '2023-08-24 16:48:02', '2023-08-24 16:48:02'),
(76, '2023', 19, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(77, '2022', 19, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(78, '2021', 19, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(79, '2020', 19, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(80, '2019', 19, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(81, '2018', 19, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(82, '2017', 19, '2023-08-24 16:51:01', '2023-08-24 16:51:01'),
(83, '2022', 20, '2023-08-24 16:52:46', '2023-08-24 16:52:46'),
(84, '2021', 20, '2023-08-24 16:52:46', '2023-08-24 16:52:46'),
(85, '2020', 20, '2023-08-24 16:52:46', '2023-08-24 16:52:46'),
(86, '2019', 20, '2023-08-24 16:52:46', '2023-08-24 16:52:46'),
(87, '2018', 20, '2023-08-24 16:52:46', '2023-08-24 16:52:46'),
(88, '2023', 21, '2023-08-24 16:53:58', '2023-08-24 16:53:58'),
(89, '2022', 21, '2023-08-24 16:53:58', '2023-08-24 16:53:58'),
(90, '2021', 21, '2023-08-24 16:53:58', '2023-08-24 16:53:58'),
(91, '2020', 21, '2023-08-24 16:53:58', '2023-08-24 16:53:58'),
(92, '2019', 21, '2023-08-24 16:53:58', '2023-08-24 16:53:58'),
(94, '2022', 23, '2023-08-24 19:38:03', '2023-08-24 19:38:03'),
(95, '2023', 24, '2023-08-29 10:54:21', '2023-08-29 10:54:21'),
(96, '2022', 25, '2023-08-29 11:14:29', '2023-08-29 11:14:29'),
(97, '2023', 26, '2023-08-29 11:22:39', '2023-08-29 11:22:39'),
(98, '2022', 27, '2023-08-29 11:35:27', '2023-08-29 11:35:27'),
(99, '2023', 22, '2023-08-29 11:52:59', '2023-08-29 11:52:59'),
(100, '2023', 28, '2023-08-30 11:27:11', '2023-08-30 11:27:11'),
(101, '2022', 28, '2023-08-30 11:27:11', '2023-08-30 11:27:11'),
(102, '2021', 28, '2023-08-30 11:27:11', '2023-08-30 11:27:11'),
(103, '2023', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(104, '2022', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(105, '2021', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(106, '2020', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(107, '2019', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(108, '2018', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(109, '2017', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(110, '2016', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(111, '2015', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(112, '2014', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(113, '2013', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(114, '2012', 11, '2023-09-04 16:07:05', '2023-09-04 16:07:05'),
(115, '2023', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(116, '2022', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(117, '2021', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(118, '2020', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(119, '2019', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(120, '2018', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(121, '2017', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(122, '2016', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(123, '2015', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(124, '2014', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(125, '2013', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(126, '2012', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(127, '2011', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(128, '2010', 12, '2023-09-04 16:11:24', '2023-09-04 16:11:24'),
(131, '2023', 29, '2023-09-19 12:26:35', '2023-09-19 12:26:35'),
(132, '2022', 29, '2023-09-19 12:26:35', '2023-09-19 12:26:35'),
(136, '2023', 30, '2023-09-22 18:27:15', '2023-09-22 18:27:15'),
(137, '2022', 30, '2023-09-22 18:27:15', '2023-09-22 18:27:15'),
(138, '2021', 30, '2023-09-22 18:27:15', '2023-09-22 18:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `car_options`
--

CREATE TABLE `car_options` (
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `feature_option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_options`
--

INSERT INTO `car_options` (`car_id`, `feature_option_id`, `created_at`, `updated_at`) VALUES
(111, 13, NULL, NULL),
(111, 17, NULL, NULL),
(111, 16, NULL, NULL),
(111, 20, NULL, NULL),
(111, 21, NULL, NULL),
(111, 25, NULL, NULL),
(112, 12, NULL, NULL),
(112, 13, NULL, NULL),
(112, 14, NULL, NULL),
(112, 15, NULL, NULL),
(112, 16, NULL, NULL),
(112, 17, NULL, NULL),
(112, 18, NULL, NULL),
(112, 19, NULL, NULL),
(112, 20, NULL, NULL),
(112, 21, NULL, NULL),
(112, 23, NULL, NULL),
(112, 25, NULL, NULL),
(112, 26, NULL, NULL),
(112, 27, NULL, NULL),
(112, 28, NULL, NULL),
(113, 12, NULL, NULL),
(113, 13, NULL, NULL),
(113, 14, NULL, NULL),
(113, 16, NULL, NULL),
(113, 19, NULL, NULL),
(113, 20, NULL, NULL),
(113, 25, NULL, NULL),
(114, 12, NULL, NULL),
(114, 13, NULL, NULL),
(114, 14, NULL, NULL),
(114, 15, NULL, NULL),
(114, 16, NULL, NULL),
(114, 17, NULL, NULL),
(114, 18, NULL, NULL),
(114, 19, NULL, NULL),
(114, 20, NULL, NULL),
(114, 21, NULL, NULL),
(114, 22, NULL, NULL),
(114, 23, NULL, NULL),
(114, 24, NULL, NULL),
(114, 25, NULL, NULL),
(114, 27, NULL, NULL),
(116, 12, NULL, NULL),
(116, 16, NULL, NULL),
(116, 20, NULL, NULL),
(116, 21, NULL, NULL),
(116, 25, NULL, NULL),
(117, 12, NULL, NULL),
(117, 17, NULL, NULL),
(117, 20, NULL, NULL),
(117, 25, NULL, NULL),
(118, 12, NULL, NULL),
(118, 13, NULL, NULL),
(118, 14, NULL, NULL),
(118, 15, NULL, NULL),
(118, 16, NULL, NULL),
(118, 17, NULL, NULL),
(118, 18, NULL, NULL),
(118, 19, NULL, NULL),
(118, 23, NULL, NULL),
(118, 24, NULL, NULL),
(118, 25, NULL, NULL),
(118, 27, NULL, NULL),
(119, 12, NULL, NULL),
(119, 16, NULL, NULL),
(119, 20, NULL, NULL),
(119, 25, NULL, NULL),
(119, 26, NULL, NULL),
(121, 12, NULL, NULL),
(121, 13, NULL, NULL),
(121, 14, NULL, NULL),
(121, 15, NULL, NULL),
(121, 16, NULL, NULL),
(121, 17, NULL, NULL),
(121, 18, NULL, NULL),
(121, 19, NULL, NULL),
(121, 20, NULL, NULL),
(121, 21, NULL, NULL),
(121, 22, NULL, NULL),
(121, 23, NULL, NULL),
(121, 25, NULL, NULL),
(121, 26, NULL, NULL),
(121, 27, NULL, NULL),
(121, 28, NULL, NULL),
(125, 12, NULL, NULL),
(125, 13, NULL, NULL),
(125, 14, NULL, NULL),
(125, 15, NULL, NULL),
(125, 16, NULL, NULL),
(125, 17, NULL, NULL),
(125, 18, NULL, NULL),
(125, 19, NULL, NULL),
(125, 20, NULL, NULL),
(125, 21, NULL, NULL),
(125, 22, NULL, NULL),
(125, 24, NULL, NULL),
(125, 25, NULL, NULL),
(125, 26, NULL, NULL),
(125, 27, NULL, NULL),
(125, 28, NULL, NULL),
(141, 12, NULL, NULL),
(141, 16, NULL, NULL),
(141, 20, NULL, NULL),
(141, 25, NULL, NULL),
(141, 28, NULL, NULL),
(142, 16, NULL, NULL),
(142, 18, NULL, NULL),
(142, 20, NULL, NULL),
(142, 22, NULL, NULL),
(142, 27, NULL, NULL),
(144, 12, NULL, NULL),
(144, 20, NULL, NULL),
(145, 12, NULL, NULL),
(145, 17, NULL, NULL),
(145, 20, NULL, NULL),
(145, 22, NULL, NULL),
(145, 25, NULL, NULL),
(146, 12, NULL, NULL),
(146, 16, NULL, NULL),
(146, 19, NULL, NULL),
(146, 20, NULL, NULL),
(146, 24, NULL, NULL),
(146, 25, NULL, NULL),
(147, 12, NULL, NULL),
(147, 15, NULL, NULL),
(147, 16, NULL, NULL),
(147, 19, NULL, NULL),
(148, 12, NULL, NULL),
(148, 16, NULL, NULL),
(148, 20, NULL, NULL),
(148, 25, NULL, NULL),
(150, 12, NULL, NULL),
(150, 14, NULL, NULL),
(150, 16, NULL, NULL),
(144, 14, NULL, NULL),
(144, 22, NULL, NULL),
(153, 17, NULL, NULL),
(153, 20, NULL, NULL),
(153, 23, NULL, NULL),
(153, 16, NULL, NULL),
(154, 12, NULL, NULL),
(154, 14, NULL, NULL),
(154, 17, NULL, NULL),
(154, 18, NULL, NULL),
(154, 25, NULL, NULL),
(154, 20, NULL, NULL),
(154, 24, NULL, NULL),
(155, 12, NULL, NULL),
(155, 19, NULL, NULL),
(155, 23, NULL, NULL),
(155, 24, NULL, NULL),
(155, 14, NULL, NULL),
(155, 16, NULL, NULL),
(156, 13, NULL, NULL),
(156, 15, NULL, NULL),
(157, 12, NULL, NULL),
(157, 15, NULL, NULL),
(157, 16, NULL, NULL),
(158, 12, NULL, NULL),
(158, 16, NULL, NULL),
(158, 20, NULL, NULL),
(158, 25, NULL, NULL),
(152, 13, NULL, NULL),
(152, 16, NULL, NULL),
(152, 18, NULL, NULL),
(152, 20, NULL, NULL),
(152, 22, NULL, NULL),
(152, 23, NULL, NULL),
(152, 25, NULL, NULL),
(159, 12, NULL, NULL),
(159, 13, NULL, NULL),
(159, 14, NULL, NULL),
(159, 16, NULL, NULL),
(159, 19, NULL, NULL),
(159, 21, NULL, NULL),
(159, 22, NULL, NULL),
(159, 23, NULL, NULL),
(159, 24, NULL, NULL),
(165, 12, NULL, NULL),
(165, 13, NULL, NULL),
(165, 14, NULL, NULL),
(165, 15, NULL, NULL),
(165, 16, NULL, NULL),
(165, 17, NULL, NULL),
(165, 20, NULL, NULL),
(165, 22, NULL, NULL),
(165, 23, NULL, NULL),
(165, 24, NULL, NULL),
(165, 25, NULL, NULL),
(165, 26, NULL, NULL),
(165, 27, NULL, NULL),
(165, 28, NULL, NULL),
(166, 12, NULL, NULL),
(166, 13, NULL, NULL),
(166, 14, NULL, NULL),
(166, 15, NULL, NULL),
(166, 16, NULL, NULL),
(166, 17, NULL, NULL),
(166, 18, NULL, NULL),
(166, 19, NULL, NULL),
(166, 20, NULL, NULL),
(166, 21, NULL, NULL),
(166, 22, NULL, NULL),
(166, 23, NULL, NULL),
(166, 24, NULL, NULL),
(166, 25, NULL, NULL),
(166, 26, NULL, NULL),
(166, 27, NULL, NULL),
(166, 28, NULL, NULL),
(167, 14, NULL, NULL),
(167, 19, NULL, NULL),
(167, 22, NULL, NULL),
(167, 24, NULL, NULL),
(167, 27, NULL, NULL),
(168, 13, NULL, NULL),
(168, 15, NULL, NULL),
(168, 12, NULL, NULL),
(168, 14, NULL, NULL),
(168, 17, NULL, NULL),
(168, 19, NULL, NULL),
(168, 21, NULL, NULL),
(172, 13, NULL, NULL),
(172, 17, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `car_reports`
--

CREATE TABLE `car_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `report_option_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_reports`
--

INSERT INTO `car_reports` (`id`, `car_id`, `report_option_id`, `image`, `created_at`, `updated_at`) VALUES
(231, 112, 6, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(232, 112, 118, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(233, 112, 121, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(234, 112, 122, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(235, 112, 123, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(236, 112, 124, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(237, 112, 133, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(238, 112, 134, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(239, 112, 139, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(240, 112, 106, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(241, 112, 107, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(242, 112, 109, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(243, 112, 19, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(244, 112, 20, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(245, 112, 93, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(246, 112, 94, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(247, 112, 96, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(248, 112, 97, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(249, 112, 99, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(250, 112, 102, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(251, 112, 25, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(252, 112, 86, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(253, 112, 16, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(254, 112, 76, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(255, 112, 21, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(256, 112, 63, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(257, 112, 65, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(258, 112, 27, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(259, 112, 28, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(260, 112, 29, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(261, 112, 33, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(262, 112, 34, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(263, 112, 36, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(264, 112, 140, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(265, 112, 141, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(266, 112, 142, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(267, 112, 143, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(268, 112, 144, NULL, '2023-08-29 11:03:58', '2023-08-29 11:03:58'),
(269, 114, 6, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(270, 114, 8, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(271, 114, 119, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(272, 114, 120, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(273, 114, 121, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(274, 114, 123, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(275, 114, 124, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(276, 114, 125, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(277, 114, 126, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(278, 114, 127, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(279, 114, 128, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(280, 114, 133, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(281, 114, 136, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(282, 114, 139, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(283, 114, 106, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(284, 114, 107, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(285, 114, 109, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(286, 114, 115, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(287, 114, 116, NULL, '2023-08-29 11:12:22', '2023-08-29 11:12:22'),
(288, 114, 20, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(289, 114, 90, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(290, 114, 92, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(291, 114, 96, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(292, 114, 100, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(293, 114, 101, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(294, 114, 102, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(295, 114, 104, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(296, 114, 25, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(297, 114, 87, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(298, 114, 88, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(299, 114, 10, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(300, 114, 80, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(301, 114, 81, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(302, 114, 82, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(303, 114, 16, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(304, 114, 76, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(305, 114, 22, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(306, 114, 63, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(307, 114, 68, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(308, 114, 72, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(309, 114, 28, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(310, 114, 35, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(311, 114, 37, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(312, 114, 40, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(313, 114, 41, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(314, 114, 140, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(315, 114, 141, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(316, 114, 142, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(317, 114, 143, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(318, 114, 144, NULL, '2023-08-29 11:12:23', '2023-08-29 11:12:23'),
(319, 118, 6, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(320, 118, 118, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(321, 118, 119, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(322, 118, 122, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(323, 118, 123, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(324, 118, 124, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(325, 118, 126, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(326, 118, 127, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(327, 118, 131, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(328, 118, 133, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(329, 118, 135, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(330, 118, 137, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(331, 118, 138, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(332, 118, 139, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(333, 118, 13, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(334, 118, 106, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(335, 118, 107, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(336, 118, 108, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(337, 118, 115, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(338, 118, 19, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(339, 118, 93, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(340, 118, 96, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(341, 118, 97, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(342, 118, 25, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(343, 118, 85, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(344, 118, 87, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(345, 118, 9, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(346, 118, 78, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(347, 118, 84, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(348, 118, 17, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(349, 118, 74, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(350, 118, 75, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(351, 118, 21, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(352, 118, 65, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(353, 118, 66, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(354, 118, 67, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(355, 118, 70, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(356, 118, 71, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(357, 118, 72, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(358, 118, 28, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(359, 118, 34, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(360, 118, 35, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(361, 118, 36, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(362, 118, 40, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(363, 118, 41, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(364, 118, 42, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(365, 118, 43, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(366, 118, 50, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(367, 118, 52, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(368, 118, 54, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(369, 118, 55, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(370, 118, 56, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(371, 118, 59, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(372, 118, 140, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(373, 118, 142, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(374, 118, 144, NULL, '2023-08-29 11:34:20', '2023-08-29 11:34:20'),
(444, 121, 6, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(445, 121, 118, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(446, 121, 121, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(447, 121, 122, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(448, 121, 123, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(449, 121, 127, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(450, 121, 131, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(451, 121, 133, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(452, 121, 135, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(453, 121, 137, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(454, 121, 138, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(455, 121, 139, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(456, 121, 12, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(457, 121, 13, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(458, 121, 14, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(459, 121, 105, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(460, 121, 106, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(461, 121, 107, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(462, 121, 108, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(463, 121, 109, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(464, 121, 110, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(465, 121, 111, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(466, 121, 112, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(467, 121, 113, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(468, 121, 114, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(469, 121, 115, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(470, 121, 116, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(471, 121, 18, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(472, 121, 90, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(473, 121, 92, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(474, 121, 93, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(475, 121, 94, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(476, 121, 95, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(477, 121, 96, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(478, 121, 98, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(479, 121, 99, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(480, 121, 100, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(481, 121, 102, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(482, 121, 103, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(483, 121, 104, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(484, 121, 25, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(485, 121, 16, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(486, 121, 74, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(487, 121, 21, NULL, '2023-08-29 11:57:05', '2023-08-29 11:57:05'),
(488, 121, 71, NULL, '2023-08-29 11:57:06', '2023-08-29 11:57:06'),
(489, 121, 72, NULL, '2023-08-29 11:57:06', '2023-08-29 11:57:06'),
(490, 125, 6, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(491, 125, 118, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(492, 125, 121, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(493, 125, 122, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(494, 125, 123, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(495, 125, 127, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(496, 125, 129, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(497, 125, 130, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(498, 125, 131, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(499, 125, 132, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(500, 125, 133, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(501, 125, 136, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(502, 125, 137, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(503, 125, 12, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(504, 125, 13, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(505, 125, 105, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(506, 125, 106, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(507, 125, 107, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(508, 125, 109, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(509, 125, 110, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(510, 125, 112, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(511, 125, 115, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(512, 125, 116, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(513, 125, 19, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(514, 125, 20, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(515, 125, 89, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(516, 125, 91, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(517, 125, 92, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(518, 125, 94, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(519, 125, 95, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(520, 125, 96, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(521, 125, 97, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(522, 125, 98, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(523, 125, 99, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(524, 125, 102, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(525, 125, 104, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(526, 125, 25, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(527, 125, 87, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(528, 125, 9, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(529, 125, 79, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(530, 125, 80, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(531, 125, 81, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(532, 125, 84, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(533, 125, 16, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(534, 125, 17, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(535, 125, 74, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(536, 125, 75, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(537, 125, 76, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(538, 125, 21, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(539, 125, 22, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(540, 125, 63, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(541, 125, 66, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(542, 125, 68, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(543, 125, 70, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(544, 125, 73, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(545, 125, 27, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(546, 125, 28, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(547, 125, 29, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(548, 125, 33, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(549, 125, 34, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(550, 125, 36, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(551, 125, 38, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(552, 125, 40, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(553, 125, 41, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(554, 125, 45, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(555, 125, 57, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(556, 125, 58, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(557, 125, 59, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(558, 125, 60, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(559, 125, 141, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(560, 125, 143, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(561, 125, 144, NULL, '2023-08-30 11:49:32', '2023-08-30 11:49:32'),
(562, 165, 6, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(563, 165, 8, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(564, 165, 118, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(565, 165, 121, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(566, 165, 122, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(567, 165, 123, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(568, 165, 130, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(569, 165, 133, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(570, 165, 12, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(571, 165, 14, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(572, 165, 105, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(573, 165, 106, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(574, 165, 107, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(575, 165, 108, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(576, 165, 109, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(577, 165, 110, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(578, 165, 111, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(579, 165, 112, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(580, 165, 113, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(581, 165, 115, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(582, 165, 116, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(583, 165, 91, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(584, 165, 94, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(585, 165, 99, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(586, 165, 102, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(587, 165, 24, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(588, 165, 86, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(589, 165, 10, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(590, 165, 11, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(591, 165, 77, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(592, 165, 81, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(593, 165, 82, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(594, 165, 83, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(595, 165, 84, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(596, 165, 15, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(597, 165, 16, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(598, 165, 74, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(599, 165, 76, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(600, 165, 21, NULL, '2023-09-19 12:40:33', '2023-09-19 12:40:33'),
(601, 165, 23, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(602, 165, 62, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(603, 165, 63, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(604, 165, 68, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(605, 165, 69, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(606, 165, 71, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(607, 165, 73, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(608, 165, 27, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(609, 165, 28, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(610, 165, 33, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(611, 165, 34, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(612, 165, 35, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(613, 165, 36, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(614, 165, 40, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(615, 165, 41, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(616, 165, 58, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(617, 165, 140, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(618, 165, 141, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(619, 165, 142, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(620, 165, 143, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(621, 165, 144, NULL, '2023-09-19 12:40:34', '2023-09-19 12:40:34'),
(622, 166, 6, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(623, 166, 8, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(624, 166, 118, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(625, 166, 122, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(626, 166, 123, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(627, 166, 125, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(628, 166, 127, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(629, 166, 128, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(630, 166, 129, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(631, 166, 130, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(632, 166, 133, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(633, 166, 134, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(634, 166, 135, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(635, 166, 136, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(636, 166, 137, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(637, 166, 139, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(638, 166, 12, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(639, 166, 14, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(640, 166, 105, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(641, 166, 106, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(642, 166, 107, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(643, 166, 108, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(644, 166, 110, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(645, 166, 111, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(646, 166, 112, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(647, 166, 113, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(648, 166, 116, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(649, 166, 18, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(650, 166, 19, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(651, 166, 20, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(652, 166, 90, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(653, 166, 92, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(654, 166, 94, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(655, 166, 95, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(656, 166, 97, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(657, 166, 99, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(658, 166, 101, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(659, 166, 102, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(660, 166, 103, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(661, 166, 104, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(662, 166, 24, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(663, 166, 26, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(664, 166, 85, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(665, 166, 86, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(666, 166, 87, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(667, 166, 88, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(668, 166, 9, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(669, 166, 10, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(670, 166, 79, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(671, 166, 81, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(672, 166, 82, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(673, 166, 83, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(674, 166, 84, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(675, 166, 15, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(676, 166, 17, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(677, 166, 75, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(678, 166, 76, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(679, 166, 23, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(680, 166, 61, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(681, 166, 62, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(682, 166, 64, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(683, 166, 68, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(684, 166, 70, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(685, 166, 72, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(686, 166, 27, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(687, 166, 29, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(688, 166, 33, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(689, 166, 34, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(690, 166, 36, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(691, 166, 38, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(692, 166, 41, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(693, 166, 46, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(694, 166, 48, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(695, 166, 54, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(696, 166, 55, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(697, 166, 56, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(698, 166, 57, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(699, 166, 58, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(700, 166, 60, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(701, 166, 140, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(702, 166, 141, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(703, 166, 142, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(704, 166, 143, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04'),
(705, 166, 144, NULL, '2023-09-19 13:17:04', '2023-09-19 13:17:04');

-- --------------------------------------------------------

--
-- Table structure for table `car_types`
--

CREATE TABLE `car_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_types`
--

INSERT INTO `car_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\": \"سيدان\", \"en\": \"Sedan\"}', '2023-08-27 13:24:00', '2023-08-27 13:24:00'),
(2, '{\"ar\": \"كروس اوفر\", \"en\": \"crossover\"}', '2023-08-27 17:23:17', '2023-08-27 17:23:17'),
(5, '{\"ar\": \"اس يو في\", \"en\": \"SUV\"}', '2023-08-28 00:10:50', '2023-08-28 00:10:50'),
(6, '{\"ar\": \"بيك أب\", \"en\": \"Pickup\"}', '2023-08-28 00:12:13', '2023-08-28 00:12:13'),
(7, '{\"ar\": \"هاتشباك\", \"en\": \"Hatchback\"}', '2023-08-28 00:13:50', '2023-08-28 00:13:50'),
(8, '{\"ar\": \"رياضية\", \"en\": \"Sport\"}', '2023-08-28 00:19:09', '2023-08-28 00:19:09'),
(9, '{\"ar\": \"فان\", \"en\": \"Van\"}', '2023-08-28 00:20:40', '2023-08-28 00:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(3, '{\"en\":\"Cairo\",\"ar\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\"}', NULL, '2023-08-03 14:17:57', '2023-08-03 14:17:57'),
(6, '{\"en\":\"Giza\",\"ar\":\"\\u0627\\u0644\\u062c\\u064a\\u0632\\u0629\"}', NULL, '2023-08-03 14:21:11', '2023-08-03 14:21:11'),
(7, '{\"en\":\"Alexandria\",\"ar\":\"\\u0627\\u0644\\u0625\\u0633\\u0643\\u0646\\u062f\\u0631\\u064a\\u0629\"}', NULL, '2023-08-24 12:59:37', '2023-08-24 12:59:37'),
(8, '{\"en\":\"Ismailia\",\"ar\":\"\\u0627\\u0644\\u0625\\u0633\\u0645\\u0627\\u0639\\u064a\\u0644\\u064a\\u0629\"}', NULL, '2023-08-24 13:00:18', '2023-08-24 13:00:18'),
(9, '{\"en\":\"Aswan\",\"ar\":\"\\u0623\\u0633\\u0648\\u0627\\u0646\"}', NULL, '2023-08-24 13:00:39', '2023-08-24 13:00:39'),
(10, '{\"en\":\"Asyut\",\"ar\":\"\\u0623\\u0633\\u064a\\u0648\\u0637\"}', NULL, '2023-08-24 13:00:58', '2023-08-24 13:00:58'),
(11, '{\"en\":\"Luxor\",\"ar\":\"\\u0627\\u0644\\u0623\\u0642\\u0635\\u0631\"}', NULL, '2023-08-24 13:01:38', '2023-08-24 13:01:38'),
(12, '{\"en\":\"The Red Sea\",\"ar\":\"\\u0627\\u0644\\u0628\\u062d\\u0631 \\u0627\\u0644\\u0623\\u062d\\u0645\\u0631\"}', NULL, '2023-08-24 13:02:01', '2023-08-24 13:02:01'),
(13, '{\"en\":\"Beheira\",\"ar\":\"\\u0627\\u0644\\u0628\\u062d\\u064a\\u0631\\u0629\"}', NULL, '2023-08-24 13:02:49', '2023-08-24 13:02:49'),
(14, '{\"en\":\"Bani Sweif\",\"ar\":\"\\u0628\\u0646\\u064a \\u0633\\u0648\\u064a\\u0641\"}', NULL, '2023-08-24 13:03:12', '2023-08-24 13:03:12'),
(15, '{\"en\":\"Port Said\",\"ar\":\"\\u0628\\u0648\\u0631\\u0633\\u0639\\u064a\\u062f\"}', NULL, '2023-08-24 13:03:29', '2023-08-24 13:03:29'),
(16, '{\"en\":\"South of Sinaa\",\"ar\":\"\\u062c\\u0646\\u0648\\u0628 \\u0633\\u064a\\u0646\\u0627\\u0621\"}', NULL, '2023-08-24 13:03:50', '2023-08-24 13:03:50'),
(17, '{\"en\":\"Dakahlia\",\"ar\":\"\\u0627\\u0644\\u062f\\u0642\\u0647\\u0644\\u064a\\u0629\"}', NULL, '2023-08-24 13:04:10', '2023-08-24 13:04:10'),
(18, '{\"en\":\"Damietta\",\"ar\":\"\\u062f\\u0645\\u064a\\u0627\\u0637\"}', NULL, '2023-08-24 13:04:31', '2023-08-24 13:04:31'),
(19, '{\"en\":\"Sohag\",\"ar\":\"\\u0633\\u0648\\u0647\\u0627\\u062c\"}', NULL, '2023-08-24 13:04:50', '2023-08-24 13:04:50'),
(20, '{\"en\":\"Suez\",\"ar\":\"\\u0627\\u0644\\u0633\\u0648\\u064a\\u0633\"}', NULL, '2023-08-24 13:05:07', '2023-08-24 13:05:07'),
(21, '{\"en\":\"alsharqia\",\"ar\":\"\\u0627\\u0644\\u0634\\u0631\\u0642\\u064a\\u0629\"}', NULL, '2023-08-24 13:05:38', '2023-08-24 13:05:38'),
(22, '{\"en\":\"North Sinai\",\"ar\":\"\\u0634\\u0645\\u0627\\u0644 \\u0633\\u064a\\u0646\\u0627\\u0621\"}', NULL, '2023-08-24 13:05:55', '2023-08-24 13:05:55'),
(23, '{\"en\":\"algharbia\",\"ar\":\"\\u0627\\u0644\\u063a\\u0631\\u0628\\u064a\\u0629\"}', NULL, '2023-08-24 13:06:17', '2023-08-24 13:06:17'),
(24, '{\"en\":\"Fayoum\",\"ar\":\"\\u0627\\u0644\\u0641\\u064a\\u0648\\u0645\"}', NULL, '2023-08-24 13:06:34', '2023-08-24 13:06:34'),
(25, '{\"en\":\"Qalyubia\",\"ar\":\"\\u0627\\u0644\\u0642\\u0644\\u064a\\u0648\\u0628\\u064a\\u0629\"}', NULL, '2023-08-24 13:06:52', '2023-08-24 13:06:52'),
(26, '{\"en\":\"Qena\",\"ar\":\"\\u0642\\u0646\\u0627\"}', NULL, '2023-08-24 13:07:14', '2023-08-24 13:07:14'),
(27, '{\"en\":\"Kafr El-Sheikh\",\"ar\":\"\\u0643\\u0641\\u0631 \\u0627\\u0644\\u0634\\u064a\\u062e\"}', NULL, '2023-08-24 13:07:37', '2023-08-24 13:07:37'),
(28, '{\"en\":\"matruh\",\"ar\":\"\\u0645\\u0637\\u0631\\u0648\\u062d\"}', NULL, '2023-08-24 13:07:56', '2023-08-24 13:07:56'),
(29, '{\"en\":\"Menoufia\",\"ar\":\"\\u0627\\u0644\\u0645\\u0646\\u0648\\u0641\\u064a\\u0629\"}', NULL, '2023-08-24 13:08:12', '2023-08-24 13:08:12'),
(30, '{\"en\":\"Minya\",\"ar\":\"\\u0627\\u0644\\u0645\\u0646\\u064a\\u0627\"}', NULL, '2023-08-24 13:08:30', '2023-08-24 13:08:30'),
(31, '{\"en\":\"alwadi aljadid\",\"ar\":\"\\u0627\\u0644\\u0648\\u0627\\u062f\\u064a \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-08-24 13:08:54', '2023-08-24 13:08:54'),
(32, '{\"en\":\"city1\",\"ar\":\"city1\"}', NULL, '2023-08-27 15:21:15', '2023-08-27 15:21:15'),
(33, '{\"en\":\"city2\",\"ar\":\"city2\"}', NULL, '2023-08-27 15:21:15', '2023-08-27 15:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"red\",\"ar\":\"\\u0627\\u062d\\u0645\\u0631\"}', '#f70202', '2023-07-20 12:40:06', '2023-07-20 12:40:06'),
(2, '{\"en\":\"black\",\"ar\":\"\\u0627\\u0633\\u0648\\u062f\"}', '#000000', '2023-07-20 12:40:25', '2023-07-20 12:40:25'),
(3, '{\"en\":\"blue\",\"ar\":\"\\u0627\\u0632\\u0631\\u0642\"}', '#0a19f0', '2023-07-20 12:40:46', '2023-07-20 12:40:46'),
(4, '{\"en\":\"white\",\"ar\":\"\\u0627\\u0628\\u064a\\u0636\"}', '#ffffff', '2023-08-03 11:33:52', '2023-08-03 11:33:52'),
(5, '{\"en\":\"yellow\",\"ar\":\"\\u0627\\u0635\\u0641\\u0631\"}', '#fbff00', '2023-08-03 11:34:20', '2023-08-03 11:34:20'),
(6, '{\"en\":\"silver\",\"ar\":\"\\u0641\\u0636\\u064a\"}', '#d4d4d4', '2023-08-03 13:19:22', '2023-08-03 13:19:22'),
(7, '{\"en\":\"green\",\"ar\":\"\\u0627\\u062e\\u0636\\u0631\"}', '#56c918', '2023-09-07 11:20:49', '2023-09-07 11:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(1, 'test', 'qodirog@mailinator.com', '01020304050', 'test subject', 'test messagetest messagetest messagetest message', '2023-08-27 15:41:14', '2023-08-27 15:41:14'),
(2, 'RaymondBip', 'no.reply.TimLefevre@gmail.com', '84953738524', 'Are you searching for a value-for-money and imaginative advertising option?', 'Howdy! automobile-egy.com \r\n \r\nDid you know that it is possible to send message accurately and lawfully? We propose a new method of delivering business proposals through contact forms. These forms are available on plenty of websites. \r\nWhen such appeals are sent, no personal data is used, and messages are sent to forms specifically designed to receive messages and appeals securely. Messages that are sent by Feedback Forms are not seen as spam, since they are thought of as important. \r\nGet a free sample of our service! \r\nWe are able to provide up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', '2023-09-05 21:42:24', '2023-09-05 21:42:24'),
(3, 'Domain Registrar', 'markus.kiel@gmail.com', '443-561-8188', 'Deadline for automobile-egy.com', 'Congrats on your new domain! \r\n\r\nThe next step you need to take for automobile-egy.com is to make sure it is listed in the search engines. \r\n\r\nGetting automobile-egy.com included in the search engines is important to make sure your customers can find you. \r\n\r\nTo list automobile-egy.com in Google, Bing, and Yahoo follow the link below: \r\n\r\nhttps://goto13.com/l/automobile-egy.com/9/', '2023-09-06 14:15:14', '2023-09-06 14:15:14'),
(4, 'Geri Pickrell', 'geri.pickrell@hotmail.com', '024 343 33 66', 'FREE Website Traffic Today', 'I was reviewing your website and I noticed that it is not listed on the major search engines.\r\nGetting automobile-egy.com included in the search engines is important to make sure your customers can find you.\r\nTo list automobile-egy.com in Google, Bing, and Yahoo follow the link below:\r\nhttps://goto13.com/l/automobile-egy.com/10/', '2023-09-07 02:07:11', '2023-09-07 02:07:11'),
(5, 'Domain Registrar', 'minda.stuart@gmail.com', '780-837-4485', 'Deadline for automobile-egy.com', 'Congrats on your new domain! \r\n\r\nThe next step you need to take for automobile-egy.com is to make sure it is listed in the search engines. \r\n\r\nGetting automobile-egy.com included in the search engines is important to make sure your customers can find you. \r\n\r\nTo list automobile-egy.com in Google, Bing, and Yahoo follow the link below: \r\n\r\nhttps://goto13.com/l/automobile-egy.com/9/', '2023-09-08 00:47:49', '2023-09-08 00:47:49'),
(6, 'Maribel Person', 'maribel.person@outlook.com', '412 02 279', 'FREE Website Traffic Today', 'I was reviewing your website and I noticed that it is not listed on the major search engines.\r\nGetting automobile-egy.com included in the search engines is important to make sure your customers can find you.\r\nTo list automobile-egy.com in Google, Bing, and Yahoo follow the link below:\r\nhttps://goto13.com/l/automobile-egy.com/10/', '2023-09-09 03:43:14', '2023-09-09 03:43:14'),
(7, 'Domain Registrar', 'spyer.tarah@msn.com', '06747 30 60 66', 'Deadline for automobile-egy.com', 'Congrats on your new domain! \r\n\r\nThe next step you need to take for automobile-egy.com is to make sure it is listed in the search engines. \r\n\r\nGetting automobile-egy.com included in the search engines is important to make sure your customers can find you. \r\n\r\nTo list automobile-egy.com in Google, Bing, and Yahoo follow the link below: \r\n\r\nhttps://goto13.com/l/automobile-egy.com/9/', '2023-09-09 20:03:36', '2023-09-09 20:03:36'),
(8, 'RaymondBip', 'no.reply.LeviMercier@gmail.com', '85844344136', 'A state-of-the-art new method of advertising.', 'What’s up? automobile-egy.com \r\n \r\nDid you know that it is possible to send letter fully lawfully and accurately? We are offering a novel, unique way of sending commercial offers through feedback forms. Such feedback forms can be found on a lot of webpages. \r\nWhen such business offers are sent, no personal data is employed, and messages are dispatched to forms specifically created to securely and safely receive messages and appeals. Messages through Feedback Forms are not likely to end up in spam, since they are deemed as essential. \r\nGet a free sample of our service! \r\nWe shall forward up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis letter is automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', '2023-09-19 19:45:25', '2023-09-19 19:45:25');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `code`, `city_id`, `created_at`, `updated_at`) VALUES
(5, '{\"en\":\"Helioplis\",\"ar\":\"\\u0645\\u0635\\u0631 \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0629\"}', NULL, 3, '2023-08-03 14:24:25', '2023-08-03 14:24:25'),
(6, '{\"en\":\"Nasr City\",\"ar\":\"\\u0645\\u062f\\u064a\\u0646\\u0629 \\u0646\\u0635\\u0631\"}', NULL, 3, '2023-08-03 14:24:48', '2023-08-03 14:24:48'),
(7, '{\"en\":\"New Cairo\",\"ar\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0647 \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0647\"}', NULL, 3, '2023-08-24 13:14:31', '2023-08-24 13:14:31'),
(8, '{\"en\":\"Rehab\",\"ar\":\"\\u0627\\u0644\\u0631\\u062d\\u0627\\u0628\"}', NULL, 3, '2023-08-24 13:14:57', '2023-08-24 13:14:57'),
(9, '{\"en\":\"alsalam city\",\"ar\":\"\\u0645\\u062f\\u064a\\u0646\\u0629 \\u0627\\u0644\\u0633\\u0644\\u0627\\u0645\"}', NULL, 3, '2023-08-24 13:16:03', '2023-08-24 13:16:03'),
(10, '{\"en\":\"Sheraton\",\"ar\":\"\\u0645\\u0633\\u0627\\u0643\\u0646 \\u0634\\u064a\\u0631\\u0627\\u062a\\u0648\\u0646\"}', NULL, 3, '2023-08-24 13:17:31', '2023-08-24 13:17:31'),
(11, '{\"en\":\"Zamalek\",\"ar\":\"\\u0627\\u0644\\u0632\\u0645\\u0627\\u0644\\u0643\"}', NULL, 6, '2023-08-24 13:19:29', '2023-08-24 13:19:29'),
(12, '{\"en\":\"6 October\",\"ar\":\"6 \\u0627\\u0643\\u062a\\u0648\\u0628\\u0631\"}', NULL, 6, '2023-08-24 13:20:41', '2023-08-24 13:20:41'),
(13, '{\"en\":\"sheikh Zayed\",\"ar\":\"\\u0627\\u0644\\u0634\\u064a\\u062e \\u0632\\u0627\\u064a\\u062f\"}', NULL, 6, '2023-08-24 13:21:05', '2023-08-24 13:21:05'),
(14, '{\"en\":\"Agouza\",\"ar\":\"\\u0627\\u0644\\u0639\\u062c\\u0648\\u0632\\u0629\"}', NULL, 6, '2023-08-24 13:21:50', '2023-08-24 13:21:50'),
(15, '{\"en\":\"Bulaq Dakror\",\"ar\":\"\\u0628\\u0648\\u0644\\u0627\\u0642 \\u0627\\u0644\\u062f\\u0643\\u0631\\u0648\\u0631\"}', NULL, 6, '2023-08-24 13:22:31', '2023-08-24 13:22:31'),
(16, '{\"en\":\"kit kat\",\"ar\":\"\\u0627\\u0644\\u0643\\u064a\\u062a \\u0643\\u0627\\u062a\"}', NULL, 6, '2023-08-24 13:23:07', '2023-08-24 13:23:07'),
(17, '{\"en\":\"Imbaba\",\"ar\":\"\\u0625\\u0645\\u0628\\u0627\\u0628\\u0629\"}', NULL, 6, '2023-08-24 13:23:34', '2023-08-24 13:23:34'),
(18, '{\"en\":\"Abu Qir\",\"ar\":\"\\u0627\\u0628\\u0648 \\u0642\\u064a\\u0631\"}', NULL, 7, '2023-08-24 13:24:21', '2023-08-24 13:24:21'),
(19, '{\"en\":\"Al Ajmi\",\"ar\":\"\\u0627\\u0644\\u0639\\u062c\\u0645\\u064a\"}', NULL, 7, '2023-08-24 13:24:44', '2023-08-24 13:24:44'),
(20, '{\"en\":\"aleasafiruh\",\"ar\":\"\\u0627\\u0644\\u0639\\u0635\\u0627\\u0641\\u0631\\u0647\"}', NULL, 7, '2023-08-24 13:25:16', '2023-08-24 13:25:16'),
(21, '{\"en\":\"almuntazah\",\"ar\":\"\\u0627\\u0644\\u0645\\u0646\\u062a\\u0632\\u0647\"}', NULL, 6, '2023-08-24 13:26:15', '2023-08-24 13:26:15'),
(22, '{\"en\":\"Mandara\",\"ar\":\"\\u0627\\u0644\\u0645\\u0646\\u062f\\u0631\\u0647\"}', NULL, 7, '2023-08-24 13:26:41', '2023-08-24 13:26:41'),
(23, '{\"en\":\"Amiriya\",\"ar\":\"\\u062d\\u0649 \\u0627\\u0644\\u0639\\u0627\\u0645\\u0631\\u064a\\u0629\"}', NULL, 7, '2023-08-24 13:27:06', '2023-08-24 13:27:06'),
(24, '{\"en\":\"Ibrahimia\",\"ar\":\"\\u0627\\u0644\\u0627\\u0628\\u0631\\u0627\\u0647\\u064a\\u0645\\u064a\\u0629\"}', NULL, 7, '2023-08-24 13:27:53', '2023-08-24 13:27:53');

-- --------------------------------------------------------

--
-- Table structure for table `extension_models`
--

CREATE TABLE `extension_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `car_model_id` bigint(20) UNSIGNED NOT NULL,
  `car_model_extension_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extension_models`
--

INSERT INTO `extension_models` (`id`, `car_model_id`, `car_model_extension_id`, `created_at`, `updated_at`) VALUES
(8, 30, 80, NULL, NULL),
(9, 30, 81, NULL, NULL),
(10, 30, 82, NULL, NULL),
(11, 30, 83, NULL, NULL),
(12, 13, 80, NULL, NULL),
(13, 13, 81, NULL, NULL),
(14, 13, 82, NULL, NULL),
(15, 13, 83, NULL, NULL),
(16, 11, 80, NULL, NULL),
(17, 11, 81, NULL, NULL),
(18, 11, 82, NULL, NULL),
(19, 11, 83, NULL, NULL),
(20, 12, 80, NULL, NULL),
(21, 12, 81, NULL, NULL),
(22, 12, 82, NULL, NULL),
(23, 12, 83, NULL, NULL),
(24, 18, 80, NULL, NULL),
(25, 18, 81, NULL, NULL),
(26, 18, 82, NULL, NULL),
(27, 18, 83, NULL, NULL),
(28, 19, 80, NULL, NULL),
(29, 19, 81, NULL, NULL),
(30, 19, 82, NULL, NULL),
(31, 19, 83, NULL, NULL),
(32, 20, 80, NULL, NULL),
(33, 20, 81, NULL, NULL),
(34, 20, 82, NULL, NULL),
(35, 20, 83, NULL, NULL),
(36, 21, 80, NULL, NULL),
(37, 21, 81, NULL, NULL),
(38, 21, 82, NULL, NULL),
(39, 21, 83, NULL, NULL),
(40, 23, 57, NULL, NULL),
(41, 24, 58, NULL, NULL),
(42, 25, 59, NULL, NULL),
(43, 26, 60, NULL, NULL),
(44, 27, 61, NULL, NULL),
(45, 28, 66, NULL, NULL),
(46, 29, 76, NULL, NULL),
(47, 22, 80, NULL, NULL),
(48, 22, 81, NULL, NULL),
(49, 22, 82, NULL, NULL),
(50, 22, 83, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `car_id`, `created_at`, `updated_at`) VALUES
(66, 12, 114, '2023-08-29 15:57:53', '2023-08-29 15:57:53'),
(68, 12, 121, '2023-08-29 15:58:08', '2023-08-29 15:58:08'),
(71, 22, 112, '2023-08-30 08:23:46', '2023-08-30 08:23:46'),
(74, 22, 114, '2023-08-30 08:28:17', '2023-08-30 08:28:17'),
(79, 13, 111, '2023-08-31 19:32:11', '2023-08-31 19:32:11'),
(80, 13, 112, '2023-08-31 19:39:52', '2023-08-31 19:39:52'),
(82, 22, 111, '2023-09-01 07:43:50', '2023-09-01 07:43:50'),
(88, 28, 121, '2023-09-05 23:06:14', '2023-09-05 23:06:14'),
(90, 27, 144, '2023-09-07 13:36:14', '2023-09-07 13:36:14'),
(93, 38, 118, '2023-09-11 16:53:19', '2023-09-11 16:53:19'),
(94, 38, 121, '2023-09-11 16:53:25', '2023-09-11 16:53:25'),
(95, 38, 111, '2023-09-11 20:25:44', '2023-09-11 20:25:44'),
(98, 29, 144, '2023-09-13 11:59:11', '2023-09-13 11:59:11'),
(99, 49, 111, '2023-09-17 21:28:09', '2023-09-17 21:28:09'),
(100, 49, 113, '2023-09-17 21:28:13', '2023-09-17 21:28:13'),
(103, 50, 144, '2023-09-18 12:41:15', '2023-09-18 12:41:15'),
(104, 50, 111, '2023-09-18 12:41:33', '2023-09-18 12:41:33'),
(105, 50, 158, '2023-09-18 12:41:34', '2023-09-18 12:41:34'),
(106, 29, 111, '2023-09-18 13:26:44', '2023-09-18 13:26:44'),
(111, 29, 125, '2023-09-20 07:14:48', '2023-09-20 07:14:48'),
(113, 50, 166, '2023-09-21 21:19:57', '2023-09-21 21:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`, `created_at`, `updated_at`) VALUES
(5, '{\"en\":\"Safety\",\"ar\":\"\\u0627\\u0644\\u0623\\u0645\\u0627\\u0646\"}', '2023-07-24 15:12:25', '2023-07-24 15:12:25'),
(6, '{\"en\":\"comfort\",\"ar\":\"\\u0627\\u0644\\u0631\\u0627\\u062d\\u0629\"}', '2023-07-24 15:13:10', '2023-07-24 15:13:10'),
(7, '{\"en\":\"Techniques\",\"ar\":\"\\u062a\\u0642\\u0646\\u064a\\u0627\\u062a\"}', '2023-07-24 15:13:46', '2023-07-24 15:13:46'),
(8, '{\"en\":\"Outdoor equipment\",\"ar\":\"\\u062a\\u062c\\u0647\\u064a\\u0632\\u0627\\u062a \\u062e\\u0627\\u0631\\u062c\\u064a\\u0629\"}', '2023-07-24 15:14:21', '2023-07-24 15:14:21');

-- --------------------------------------------------------

--
-- Table structure for table `feature_options`
--

CREATE TABLE `feature_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `feature_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feature_options`
--

INSERT INTO `feature_options` (`id`, `name`, `feature_id`, `created_at`, `updated_at`) VALUES
(12, '{\"en\":\"Safety belts\",\"ar\":\"\\u0623\\u062d\\u0632\\u0645\\u0629 \\u0623\\u0645\\u0627\\u0646\"}', 5, '2023-07-24 16:19:43', '2023-07-24 16:19:43'),
(13, '{\"en\":\"Front airbags\",\"ar\":\"\\u0648\\u0633\\u0627\\u0626\\u062f \\u0647\\u0648\\u0627\\u0626\\u064a\\u0629 \\u0627\\u0645\\u0627\\u0645\\u064a\\u0629\"}', 5, '2023-07-24 16:21:28', '2023-07-24 16:21:28'),
(14, '{\"en\":\"center lock\",\"ar\":\"\\u0633\\u0646\\u062a\\u0631 \\u0644\\u0648\\u0643\"}', 5, '2023-07-24 16:21:50', '2023-07-24 16:21:50'),
(15, '{\"en\":\"Tire pressure monitoring\",\"ar\":\"\\u0645\\u0631\\u0627\\u0642\\u0628\\u0629 \\u0636\\u063a\\u0637 \\u0627\\u0644\\u0627\\u0637\\u0627\\u0631\\u0627\\u062a\"}', 5, '2023-07-24 16:22:14', '2023-07-24 16:22:14'),
(16, '{\"en\":\"Electric windows\",\"ar\":\"\\u0632\\u062c\\u0627\\u062c \\u0643\\u0647\\u0631\\u0628\\u0627\\u0626\\u064a\"}', 6, '2023-07-24 16:23:06', '2023-08-30 12:46:39'),
(17, '{\"en\":\"key operation\",\"ar\":\"\\u062a\\u0634\\u063a\\u064a\\u0644 \\u0645\\u0641\\u062a\\u0627\\u062d\"}', 6, '2023-07-24 16:23:29', '2023-07-24 16:23:29'),
(18, '{\"en\":\"Manual seat control\",\"ar\":\"\\u062a\\u062d\\u0643\\u0645 \\u0645\\u0642\\u0627\\u0639\\u062f \\u064a\\u062f\\u0648\\u0649\"}', 6, '2023-07-24 16:23:55', '2023-07-24 16:23:55'),
(19, '{\"en\":\"Manual conditioner\",\"ar\":\"\\u0645\\u0643\\u064a\\u0641 \\u064a\\u062f\\u0648\\u064a\"}', 6, '2023-07-24 16:24:28', '2023-07-24 16:24:28'),
(20, '{\"en\":\"rear camera\",\"ar\":\"\\u0643\\u0627\\u0645\\u064a\\u0631\\u0627 \\u062e\\u0644\\u0641\\u064a\\u0629\"}', 7, '2023-07-24 16:25:30', '2023-07-24 16:25:30'),
(21, '{\"en\":\"AUX input\",\"ar\":\"\\u0645\\u062f\\u062e\\u0644 AUX\"}', 7, '2023-07-24 16:25:41', '2023-07-24 16:25:41'),
(22, '{\"en\":\"Navigation system \\/ maps\",\"ar\":\"\\u0646\\u0638\\u0627\\u0645 \\u0645\\u0644\\u0627\\u062d\\u0629 \\/ \\u062e\\u0631\\u0627\\u0626\\u0637\"}', 7, '2023-07-24 16:26:01', '2023-07-24 16:26:01'),
(23, '{\"en\":\"radio\",\"ar\":\"\\u0631\\u0627\\u062f\\u064a\\u0648\"}', 7, '2023-07-24 16:26:55', '2023-07-24 16:26:55'),
(24, '{\"en\":\"CD player\",\"ar\":\"\\u0645\\u0634\\u063a\\u0644 \\u0627\\u0633\\u0637\\u0648\\u0627\\u0646\\u0627\\u062a CD\"}', 7, '2023-07-24 16:27:16', '2023-07-24 16:27:16'),
(25, '{\"en\":\"Halogen lights\",\"ar\":\"\\u0645\\u0635\\u0627\\u0628\\u064a\\u062d \\u0647\\u0627\\u0644\\u0648\\u062c\\u064a\\u0646\"}', 8, '2023-07-24 16:28:04', '2023-07-24 16:28:04'),
(26, '{\"en\":\"Front fog lights\",\"ar\":\"\\u0643\\u0634\\u0627\\u0641\\u0627\\u062a \\u0636\\u0628\\u0627\\u0628 \\u0627\\u0645\\u0627\\u0645\\u064a\\u0629\"}', 8, '2023-07-24 16:28:21', '2023-07-24 16:28:21'),
(27, '{\"en\":\"Electric control mirrors\",\"ar\":\"\\u0645\\u0631\\u0627\\u064a\\u0627 \\u062a\\u062d\\u0643\\u0645 \\u0643\\u0647\\u0631\\u0628\\u0627\\u0626\\u064a\"}', 8, '2023-07-24 16:28:49', '2023-07-24 16:28:49'),
(28, '{\"en\":\"side sills\",\"ar\":\"\\u0639\\u062a\\u0628\\u0627\\u062a \\u062c\\u0627\\u0646\\u0628\\u064a\\u0629\"}', 8, '2023-07-24 16:29:47', '2023-07-24 16:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `key` text COLLATE utf8mb4_bin NOT NULL,
  `value` text COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, 'ar', 'global', 'manual', 'مانيوال', '2023-08-30 16:19:13', '2023-09-21 16:50:42'),
(2, 0, 'ar', 'global', 'automatic', 'اوتوماتيك', '2023-08-30 16:19:13', '2023-09-21 16:50:42'),
(3, 1, 'ar', 'global', 'hatchback', 'هاتشباك', '2023-08-30 16:19:13', '2023-09-21 17:44:46'),
(4, 0, 'ar', 'global', 'sedan', 'سيدان', '2023-08-30 16:19:13', '2023-09-21 16:50:42'),
(5, 0, 'ar', 'global', 'gasoline', 'جاز', '2023-08-30 16:19:14', '2023-09-21 16:50:42'),
(6, 0, 'ar', 'global', 'diesel', 'بنزين', '2023-08-30 16:19:14', '2023-09-21 16:50:42'),
(7, 0, 'ar', 'global', 'natural_gas', 'غاز', '2023-08-30 16:19:14', '2023-09-21 16:50:42'),
(8, 0, 'ar', 'global', 'new', 'جديدة', '2023-08-30 16:19:14', '2023-09-21 16:50:42'),
(9, 0, 'ar', 'global', 'used', 'مستعملة', '2023-08-30 16:19:14', '2023-09-21 16:50:42'),
(10, 0, 'ar', 'mobileValidation', 'email_required', 'البريد الاكتروني مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(11, 0, 'ar', 'mobileValidation', 'year_required', 'السنة المطلوبة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(12, 0, 'ar', 'mobileValidation', 'email_email', 'صيغة البريد الالكتروني غير صحيحة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(13, 0, 'ar', 'mobileValidation', 'email_unique', 'هذا الايميل مستخدم من قبل', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(14, 0, 'ar', 'mobileValidation', 'email_exists', 'البريد الإلكتروني غير موجود', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(15, 0, 'ar', 'mobileValidation', 'name_required', 'الاسم مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(16, 0, 'ar', 'mobileValidation', 'name_en_required', 'الاسم بالانجليزية مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(17, 0, 'ar', 'mobileValidation', 'name_ar_required', 'الاسم العربي مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(18, 0, 'ar', 'mobileValidation', 'name_max', 'الحد الأقصى للاسم 255', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(19, 0, 'ar', 'mobileValidation', 'name_unique', 'يجب أن يكون الاسم غير مستخدم من قبل', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(20, 0, 'ar', 'mobileValidation', 'data_error', 'لقد حدث خطأ ما', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(21, 0, 'ar', 'mobileValidation', 'data_error_login', 'حدث خطأ ما في تسجيل الدخول', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(22, 0, 'ar', 'mobileValidation', 'password_required', 'كلمة المرور مطلوبة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(23, 0, 'ar', 'mobileValidation', 'password_min', 'كلمة المرور مكونة من 6 أرقام على الأقل', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(24, 0, 'ar', 'mobileValidation', 'password_confirmed', 'يجب تأكيد كلمة المرور', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(25, 0, 'ar', 'mobileValidation', 'phone_required', 'الهاتف مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(26, 0, 'ar', 'mobileValidation', 'whatsapp_required', 'مطلوب واتساب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(27, 0, 'ar', 'mobileValidation', 'phone_unique', 'يجب أن يكون الهاتف غير مستخدم من قبل', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(28, 0, 'ar', 'mobileValidation', 'phone_exists', 'الهاتف غير موجود', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(29, 0, 'ar', 'mobileValidation', 'image_required', 'الصورة مطلوبة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(30, 0, 'ar', 'mobileValidation', 'image_image', 'يجب أن يكون الملف صورة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(31, 0, 'ar', 'mobileValidation', 'image_mimes', 'يجب أن يكون الملف', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(32, 0, 'ar', 'mobileValidation', 'city_id_required', 'المدينة مطلوبة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(33, 0, 'ar', 'mobileValidation', 'city_id_exists', 'المدينة غير موجودة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(34, 0, 'ar', 'mobileValidation', 'district_id_required', 'المنطقة مطلوبة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(35, 0, 'ar', 'mobileValidation', 'district_id_exists', 'لم يتم العثور على المنطقة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(36, 0, 'ar', 'mobileValidation', 'car_id_required', 'السيارة مطلوبة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(37, 0, 'ar', 'mobileValidation', 'car_id_exists', 'السيارة غير موجودة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(38, 0, 'ar', 'mobileValidation', 'code_required', 'الكود مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(39, 0, 'ar', 'mobileValidation', 'code_id_exists', 'لم يتم العثور على الكود', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(40, 0, 'ar', 'mobileValidation', 'owner_name_required', 'اسم المالك مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(41, 0, 'ar', 'mobileValidation', 'showroom_name_required', 'اسم المعرض مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(42, 0, 'ar', 'mobileValidation', 'end_tax_card_date', 'يجب أن تكون البطاقة الضريبية النهائية بتنسيق التاريخ', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(43, 0, 'ar', 'mobileValidation', 'limit_numeric', 'يجب أن تكون سمة الحد عبارة عن رقم', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(44, 0, 'ar', 'mobileValidation', 'limit_max', 'الحد الأقصى للعدد هو 30 رقمًا', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(45, 0, 'ar', 'mobileValidation', 'order_in', 'يجب أن يكون الطلب تصاعديًا | تنازلياً', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(46, 0, 'ar', 'mobileValidation', 'brand_id_required', 'العلامة التجارية مطلوبة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(47, 0, 'ar', 'mobileValidation', 'brand_id_exists', 'العلامة التجارية غير موجودة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(48, 0, 'ar', 'mobileValidation', 'car_model_id_required', 'موديل السيارة مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(49, 0, 'ar', 'mobileValidation', 'car_model_id_exists', 'موديل السيارة غير موجود', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(50, 0, 'ar', 'mobileValidation', 'car_model_extension_id_required', 'مطلوب ملحقات موديل السيارة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(51, 0, 'ar', 'mobileValidation', 'car_model_extension_id_exists', 'لم يتم العثور على ملحقات موديل السيارة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(52, 0, 'ar', 'mobileValidation', 'user_id_not_found', 'لم يتم العثور على المستخدم', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(53, 0, 'ar', 'mobileValidation', 'user_cannot_add_new_car', 'لا يمكن للمستخدم إضافة سيارة جديدة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(54, 0, 'ar', 'mobileValidation', 'agency_id_not_found', 'لم يتم العثور على الوكالة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(55, 0, 'ar', 'mobileValidation', 'agency_cannot_add_used_car', 'لا تستطيع الوكالة إضافة سيارة مستعملة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(56, 0, 'ar', 'mobileValidation', 'showroom_id_not_found', 'لم يتم العثور على معرض', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(57, 0, 'ar', 'mobileValidation', 'model_id_required', 'الموديل مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(58, 0, 'ar', 'mobileValidation', 'model_id_integer', 'عدد صحيح للنموذج', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(59, 0, 'ar', 'mobileValidation', 'model_role_required', 'دور الموديل مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(60, 0, 'ar', 'mobileValidation', 'model_role_in', 'يجب أن يكون الصلاحية معرض أو مستخدم أو وكالة', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(61, 0, 'ar', 'mobileValidation', 'car_type_id_required', 'نوع السيارة مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(62, 0, 'ar', 'mobileValidation', 'car_type_id_exists', 'نوع السيارة غير موجود', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(63, 0, 'ar', 'mobileValidation', 'branch_id_required', 'الفرع مطلوب', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(64, 0, 'ar', 'mobileValidation', 'branch_id_exists', 'لم يتم العثور على فرع', '2023-08-30 16:19:14', '2023-09-19 14:36:25'),
(65, 0, 'ar', 'mobileValidation', 'color_id_required', 'اللون مطلوب', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(66, 0, 'ar', 'mobileValidation', 'color_id_exists', 'اللون غير موجود', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(67, 0, 'ar', 'mobileValidation', 'drive_type_required', 'نوع محرك السيارة مطلوب', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(68, 0, 'ar', 'mobileValidation', 'drive_type_in', 'يجب أن يكون نوع محرك السيارة يدويًا | آليًا', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(69, 0, 'ar', 'mobileValidation', 'fuel_type_required', 'نوع الوقود المطلوب', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(70, 0, 'ar', 'mobileValidation', 'fuel_type_in', 'نوع الوقود يجب أن يكون في البنزين | ديزل |غاز طبيعي', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(71, 0, 'ar', 'mobileValidation', 'status_required', 'الحالة المطلوبة', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(72, 0, 'ar', 'mobileValidation', 'status_in', 'يجب أن تكون الحالة جديدة | مستعملة', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(73, 0, 'ar', 'mobileValidation', 'doors_required', 'الأبواب مطلوبة', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(74, 0, 'ar', 'mobileValidation', 'doors_in', 'يجب أن تكون الحالة في 2 | 3 | 4 | 6', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(75, 0, 'ar', 'mobileValidation', 'price_required', 'السعر المطلوب', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(76, 0, 'ar', 'mobileValidation', 'engine_required', 'المحرك مطلوب', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(77, 0, 'ar', 'mobileValidation', 'cylinders_required', 'السلندر مطلوب', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(78, 0, 'ar', 'mobileValidation', 'main_image_required', 'الصورة الرئيسية مطلوبة', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(79, 0, 'ar', 'mobileValidation', 'features_required', 'الميزات مطلوبة', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(80, 0, 'ar', 'mobileValidation', 'add_to_favorite_Successfully', 'تم الإضافة الي المفضلة بنجاح', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(81, 0, 'ar', 'mobileValidation', 'remove_from_favorite_Successfully', 'إزالة من المفضلة بنجاح', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(82, 0, 'ar', 'mobileValidation', 'branch_updated_successfully', 'تم تحديث الفرع بنجاح', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(83, 0, 'ar', 'mobileValidation', 'car_has_been_sold', 'لقد تم بيع السيارة', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(84, 0, 'ar', 'validation', 'email_required', 'الايميل مطلوب', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(85, 0, 'ar', 'validation', 'email_email', 'ادخل الايميل بطريقة صحيحة', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(86, 0, 'ar', 'validation', 'data_error', 'من فضلك تاكد من البيانات مرة اخرى', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(87, 0, 'ar', 'validation', 'password_required', 'الباسورد مطلوب', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(88, 0, 'ar', 'validation', 'password_min', 'الباسورد لا يقل عن 8 احرف او ارقام', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(89, 0, 'ar', 'validation', 'password_confirmed', 'الباسور غير متطابق', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(90, 0, 'ar', 'validation', 'data_not_correct', 'البيانات غير صحيحة', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(91, 0, 'ar', 'validation', 'email_unique', 'الايميل مكرر', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(92, 0, 'ar', 'validation', 'type_required', 'التصنيف مطلوب', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(93, 0, 'ar', 'validation', 'districts_required', 'المناطق مطلوبة', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(94, 0, 'ar', 'validation', 'district_exists', 'تم ادخال منطقة غير موجودة', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(95, 0, 'ar', 'validation', 'has_delivery_required', 'خدمة التوصيل مطلوبة', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(96, 0, 'ar', 'validation', 'has_delivery_boolean', 'قيمة خدمة التوصل خطاء', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(97, 0, 'ar', 'validation', 'delivery_fee_required_if', 'سعر التوصيل مطلوب', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(98, 0, 'ar', 'validation', 'is_online_required', 'مواعيد المطعم مطلوب', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(99, 0, 'ar', 'validation', 'is_online_boolean', 'قيمة مواعيد المطعم خطاء', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(100, 0, 'ar', 'validation', 'name_required', 'الاسم مطلوب', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(101, 0, 'ar', 'validation', 'name_unique', 'الاسم مكرر', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(102, 0, 'ar', 'validation', 'price_required', 'االسعر مطلوب', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(103, 0, 'ar', 'validation', 'content_required', 'المحتوى مطلوب', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(104, 0, 'ar', 'validation', 'image_required', 'الصورة مطلوبة', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(105, 0, 'ar', 'validation', 'images_required', 'الصور مطلوبة', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(106, 0, 'ar', 'validation', 'images_array', 'الصور  لابد ان تكون مصفوفة', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(107, 0, 'ar', 'validation', 'image_image', 'الصور  لابد ان تكون صورة', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(108, 0, 'ar', 'validation', 'phone_numeric', 'البيانات لابد انت تكون رقم', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(109, 0, 'ar', 'validation', 'product_id_required', 'المنتج مطلوب', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(110, 0, 'ar', 'validation', 'product_id_exists', 'المنتج غير موجود', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(111, 0, 'ar', 'validation', 'restaurant_id_exists', 'المطعم غير موجود', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(112, 0, 'ar', 'validation', 'description_required', 'الوصف مطلوب', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(113, 0, 'ar', 'validation', 'items_cart_required', 'العربة فارغة', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(114, 0, 'ar', 'validation', 'phone_required', 'رقم الهاتف مطلوب', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(115, 0, 'ar', 'validation', 'limit_numeric', ' limit لابد انا يكون رقم', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(116, 0, 'ar', 'validation', 'limit_max', 'limit الحد الاقص 30 رقم', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(117, 0, 'ar', 'validation', 'order_in', 'order بين قمتين فقط  ( asc | desc)', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(118, 0, 'en', 'global', 'manual', 'Manual', '2023-08-30 16:19:15', '2023-09-21 16:50:42'),
(119, 0, 'en', 'global', 'automatic', 'Automatic', '2023-08-30 16:19:15', '2023-09-21 16:50:42'),
(120, 0, 'en', 'global', 'hatchback', 'Hatchback', '2023-08-30 16:19:15', '2023-09-21 16:50:42'),
(121, 0, 'en', 'global', 'sedan', 'Sedan', '2023-08-30 16:19:15', '2023-09-21 16:50:42'),
(122, 0, 'en', 'global', 'gasoline', 'Gasoline', '2023-08-30 16:19:15', '2023-09-21 16:50:42'),
(123, 0, 'en', 'global', 'diesel', 'Diesel', '2023-08-30 16:19:15', '2023-09-21 16:50:42'),
(124, 0, 'en', 'global', 'natural_gas', 'Natural Gas', '2023-08-30 16:19:15', '2023-09-21 16:50:42'),
(125, 0, 'en', 'global', 'new', 'New', '2023-08-30 16:19:15', '2023-09-21 16:50:42'),
(126, 0, 'en', 'global', 'used', 'Used', '2023-08-30 16:19:15', '2023-09-21 16:50:42'),
(127, 0, 'en', 'mobileValidation', 'email_required', 'Email required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(128, 0, 'en', 'mobileValidation', 'year_required', 'Year required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(129, 0, 'en', 'mobileValidation', 'email_email', 'The email format is incorrect', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(130, 0, 'en', 'mobileValidation', 'email_unique', 'This Email has been used before', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(131, 0, 'en', 'mobileValidation', 'email_exists', 'Email not found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(132, 0, 'en', 'mobileValidation', 'name_required', 'name required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(133, 0, 'en', 'mobileValidation', 'name_en_required', 'name English required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(134, 0, 'en', 'mobileValidation', 'name_ar_required', 'name Arabic required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(135, 0, 'en', 'mobileValidation', 'name_max', 'name maximum 255', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(136, 0, 'en', 'mobileValidation', 'name_unique', 'name must be unique 123', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(137, 0, 'en', 'mobileValidation', 'data_error', 'something is went wrong', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(138, 0, 'en', 'mobileValidation', 'data_error_login', 'something is went wrong in login', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(139, 0, 'en', 'mobileValidation', 'password_required', 'password required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(140, 0, 'en', 'mobileValidation', 'password_min', 'password minimum 6 digits', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(141, 0, 'en', 'mobileValidation', 'password_confirmed', 'password must confirmed', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(142, 0, 'en', 'mobileValidation', 'phone_required', 'phone required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(143, 0, 'en', 'mobileValidation', 'whatsapp_required', 'whatsapp required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(144, 0, 'en', 'mobileValidation', 'phone_unique', 'phone must be unique ', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(145, 0, 'en', 'mobileValidation', 'phone_exists', 'phone Not found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(146, 0, 'en', 'mobileValidation', 'image_required', 'Image required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(147, 0, 'en', 'mobileValidation', 'image_image', 'File must be Image', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(148, 0, 'en', 'mobileValidation', 'image_mimes', 'File must be Extension', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(149, 0, 'en', 'mobileValidation', 'city_id_required', 'City required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(150, 0, 'en', 'mobileValidation', 'city_id_exists', 'City Not Found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(151, 0, 'en', 'mobileValidation', 'district_id_required', 'District required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(152, 0, 'en', 'mobileValidation', 'district_id_exists', 'District Not Found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(153, 0, 'en', 'mobileValidation', 'car_id_required', 'Car required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(154, 0, 'en', 'mobileValidation', 'car_id_exists', 'Car Not Found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(155, 0, 'en', 'mobileValidation', 'code_required', 'Code required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(156, 0, 'en', 'mobileValidation', 'code_id_exists', 'Code Not Found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(157, 0, 'en', 'mobileValidation', 'owner_name_required', 'owner name required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(158, 0, 'en', 'mobileValidation', 'showroom_name_required', 'showroom name required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(159, 0, 'en', 'mobileValidation', 'end_tax_card_date', 'End tax card must be in date format', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(160, 0, 'en', 'mobileValidation', 'limit_numeric', 'The limit attribute must be the number', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(161, 0, 'en', 'mobileValidation', 'limit_max', 'Limit max number 30 digits', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(162, 0, 'en', 'mobileValidation', 'order_in', 'Order Must In asc | desc', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(163, 0, 'en', 'mobileValidation', 'brand_id_required', 'brand required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(164, 0, 'en', 'mobileValidation', 'brand_id_exists', 'brand Not Found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(165, 0, 'en', 'mobileValidation', 'car_model_id_required', 'car model required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(166, 0, 'en', 'mobileValidation', 'car_model_id_exists', 'car model Not Found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(167, 0, 'en', 'mobileValidation', 'car_model_extension_id_required', 'car model  extension required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(168, 0, 'en', 'mobileValidation', 'car_model_extension_id_exists', 'car model extension Not Found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(169, 0, 'en', 'mobileValidation', 'user_id_not_found', 'user not found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(170, 0, 'en', 'mobileValidation', 'user_cannot_add_new_car', 'user cannot add new car', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(171, 0, 'en', 'mobileValidation', 'agency_id_not_found', 'ِِAgency not found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(172, 0, 'en', 'mobileValidation', 'agency_cannot_add_used_car', 'Agency can\'t add a used car', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(173, 0, 'en', 'mobileValidation', 'showroom_id_not_found', 'showroom not found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(174, 0, 'en', 'mobileValidation', 'model_id_required', 'model required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(175, 0, 'en', 'mobileValidation', 'model_id_integer', 'model Integer', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(176, 0, 'en', 'mobileValidation', 'model_role_required', 'model Role required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(177, 0, 'en', 'mobileValidation', 'model_role_in', 'model Role must be in showroom , user , agency', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(178, 0, 'en', 'mobileValidation', 'car_type_id_required', 'car type required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(179, 0, 'en', 'mobileValidation', 'car_type_id_exists', 'car type not found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(180, 0, 'en', 'mobileValidation', 'branch_id_required', 'branch required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(181, 0, 'en', 'mobileValidation', 'branch_id_exists', 'branch not found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(182, 0, 'en', 'mobileValidation', 'color_id_required', 'color required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(183, 0, 'en', 'mobileValidation', 'color_id_exists', 'color not found', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(184, 0, 'en', 'mobileValidation', 'drive_type_required', 'drive type required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(185, 0, 'en', 'mobileValidation', 'drive_type_in', 'drive type must in manual |automatic', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(186, 0, 'en', 'mobileValidation', 'fuel_type_required', 'Fuel type required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(187, 0, 'en', 'mobileValidation', 'fuel_type_in', 'fuel type must in gasoline | diesel |natural gas', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(188, 0, 'en', 'mobileValidation', 'status_required', 'status required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(189, 0, 'en', 'mobileValidation', 'status_in', 'status must in new | used', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(190, 0, 'en', 'mobileValidation', 'doors_required', 'doors required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(191, 0, 'en', 'mobileValidation', 'doors_in', 'status must in 2 | 3 | 4 |  6', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(192, 0, 'en', 'mobileValidation', 'price_required', 'price required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(193, 0, 'en', 'mobileValidation', 'engine_required', 'Engine required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(194, 0, 'en', 'mobileValidation', 'cylinders_required', 'cylinders required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(195, 0, 'en', 'mobileValidation', 'main_image_required', 'main image required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(196, 0, 'en', 'mobileValidation', 'features_required', 'Features required', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(197, 0, 'en', 'mobileValidation', 'add_to_favorite_Successfully', 'Add To favorite Successfully', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(198, 0, 'en', 'mobileValidation', 'remove_from_favorite_Successfully', 'remove from favorite Successfully', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(199, 0, 'en', 'mobileValidation', 'branch_updated_successfully', 'branch updated successfully', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(200, 0, 'en', 'mobileValidation', 'car_has_been_sold', 'the car has been sold', '2023-08-30 16:19:15', '2023-09-19 14:36:25'),
(201, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(202, 0, 'en', 'validation', 'accepted_if', 'The :attribute must be accepted when :other is :value.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(203, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(204, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(205, 0, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(206, 0, 'en', 'validation', 'alpha', 'The :attribute must only contain letters.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(207, 0, 'en', 'validation', 'alpha_dash', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(208, 0, 'en', 'validation', 'alpha_num', 'The :attribute must only contain letters and numbers.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(209, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(210, 0, 'en', 'validation', 'ascii', 'The :attribute field must only contain single-byte alphanumeric characters and symbols.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(211, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(212, 0, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(213, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(214, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(215, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(216, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(217, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(218, 0, 'en', 'validation', 'can', 'The :attribute field contains an unauthorized value.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(219, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(220, 0, 'en', 'validation', 'current_password', 'The password is incorrect.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(221, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(222, 0, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(223, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(224, 0, 'en', 'validation', 'decimal', 'The :attribute field must have :decimal decimal places.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(225, 0, 'en', 'validation', 'declined', 'The :attribute must be declined.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(226, 0, 'en', 'validation', 'declined_if', 'The :attribute must be declined when :other is :value.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(227, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(228, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(229, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(230, 0, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(231, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(232, 0, 'en', 'validation', 'doesnt_end_with', 'The :attribute field must not end with one of the following: :values.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(233, 0, 'en', 'validation', 'doesnt_start_with', 'The :attribute field must not start with one of the following: :values.', '2023-08-30 16:19:15', '2023-09-14 17:24:48'),
(234, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(235, 0, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(236, 0, 'en', 'validation', 'enum', 'The selected :attribute is invalid.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(237, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(238, 0, 'en', 'validation', 'file', 'The :attribute must be a file.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(239, 0, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(240, 0, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(241, 0, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(242, 0, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(243, 0, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(244, 0, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(245, 0, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal to :value kilobytes.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(246, 0, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal to :value.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(247, 0, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal to :value characters.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(248, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(249, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(250, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(251, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(252, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(253, 0, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(254, 0, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(255, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(256, 0, 'en', 'validation', 'lowercase', 'The :attribute field must be lowercase.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(257, 0, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(258, 0, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(259, 0, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(260, 0, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(261, 0, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(262, 0, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal to :value kilobytes.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(263, 0, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal to :value.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(264, 0, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal to :value characters.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(265, 0, 'en', 'validation', 'mac_address', 'The :attribute must be a valid MAC address.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(266, 0, 'en', 'validation', 'max.array', 'The :attribute must not have more than :max items.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(267, 0, 'en', 'validation', 'max.file', 'The :attribute must not be greater than :max kilobytes.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(268, 0, 'en', 'validation', 'max.numeric', 'The :attribute must not be greater than :max.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(269, 0, 'en', 'validation', 'max.string', 'The :attribute must not be greater than :max characters.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(270, 0, 'en', 'validation', 'max_digits', 'The :attribute field must not have more than :max digits.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(271, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(272, 0, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(273, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(274, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(275, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(276, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(277, 0, 'en', 'validation', 'min_digits', 'The :attribute field must have at least :min digits.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(278, 0, 'en', 'validation', 'missing', 'The :attribute field must be missing.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(279, 0, 'en', 'validation', 'missing_if', 'The :attribute field must be missing when :other is :value.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(280, 0, 'en', 'validation', 'missing_unless', 'The :attribute field must be missing unless :other is :value.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(281, 0, 'en', 'validation', 'missing_with', 'The :attribute field must be missing when :values is present.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(282, 0, 'en', 'validation', 'missing_with_all', 'The :attribute field must be missing when :values are present.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(283, 0, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(284, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(285, 0, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(286, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(287, 0, 'en', 'validation', 'password', 'The password is incorrect.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(288, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(289, 0, 'en', 'validation', 'prohibited', 'The :attribute field is prohibited.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(290, 0, 'en', 'validation', 'prohibited_if', 'The :attribute field is prohibited when :other is :value.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(291, 0, 'en', 'validation', 'prohibited_unless', 'The :attribute field is prohibited unless :other is in :values.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(292, 0, 'en', 'validation', 'prohibits', 'The :attribute field prohibits :other from being present.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(293, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(294, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(295, 0, 'en', 'validation', 'required_array_keys', 'The :attribute field must contain entries for: :values.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(296, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(297, 0, 'en', 'validation', 'required_if_accepted', 'The :attribute field is required when :other is accepted.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(298, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(299, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(300, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(301, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(302, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(303, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(304, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(305, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(306, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(307, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(308, 0, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(309, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(310, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid timezone.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(311, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(312, 0, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(313, 0, 'en', 'validation', 'uppercase', 'The :attribute field must be uppercase.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(314, 0, 'en', 'validation', 'url', 'The :attribute must be a valid URL.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(315, 0, 'en', 'validation', 'ulid', 'The :attribute field must be a valid ULID.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(316, 0, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(317, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2023-08-30 16:19:16', '2023-09-14 17:24:48'),
(318, 0, 'ar', 'validation', 'accepted', 'قبلت', '2023-09-14 17:24:23', '2023-09-14 17:24:48'),
(319, 0, 'ar', 'site', 'home', 'الرئيسية', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(320, 0, 'ar', 'site', 'used_cars', 'مستعملة', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(321, 0, 'ar', 'site', 'showrooms', 'المعارض', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(322, 0, 'ar', 'site', 'users', 'المستخدمين', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(323, 0, 'ar', 'site', 'new_cars', 'السيارات الجديدة', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(324, 0, 'ar', 'site', 'agencies', 'الوكالات', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(325, 0, 'ar', 'site', 'automobile_cars', 'سيارات اوتومبيل', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(326, 0, 'ar', 'site', 'login', 'الدخول', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(327, 0, 'ar', 'site', 'sell_trade_your_car', 'بيع / بدل سيارتك', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(328, 0, 'ar', 'site', 'type_keyword', 'اكتب الكلمة الرئيسية', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(329, 0, 'ar', 'site', 'about_more', 'المزيد', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(330, 0, 'ar', 'site', 'let_find_your_perfect_car', 'ابحث عن سيارتك', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(331, 0, 'ar', 'site', 'car_condition', 'حالة السيارة', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(332, 0, 'ar', 'site', 'all_status', 'كل الحالات', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(333, 0, 'ar', 'site', 'new_car', 'جديدة', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(334, 0, 'ar', 'site', 'used_car', 'مستعملة', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(335, 0, 'ar', 'site', 'brand_name', 'اسم الماركة', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(336, 0, 'ar', 'site', 'all_brands', 'كل الماركات', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(337, 0, 'ar', 'site', 'car_model', 'موديل السيارة', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(338, 0, 'ar', 'site', 'all_model', 'كل الموديلات', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(339, 0, 'ar', 'site', 'choose_year', 'اختر السنة', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(340, 0, 'ar', 'site', 'all_year', 'اختر السنة', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(341, 0, 'ar', 'site', 'find_your_car', 'ابحث عن سيارتك', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(342, 0, 'ar', 'site', '30_years', 'الاكثر خبره في مجالنا', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(343, 0, 'ar', 'site', 'about_us', 'معلومات عنا', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(344, 0, 'ar', 'site', 'discover_more', 'اكتشف المزيد', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(345, 0, 'ar', 'site', 'new_arrivals', 'أحدث السيارات', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(346, 0, 'ar', 'site', 'certified_used_car', 'سيارات أوتومبيل', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(347, 0, 'ar', 'site', 'available', 'متاح', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(348, 0, 'ar', 'site', 'year', 'سنة', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(349, 0, 'ar', 'site', 'details', 'التفاصيل', '2023-09-19 17:38:32', '2023-09-21 20:53:21'),
(350, 0, 'ar', 'site', 'see_more', 'شاهد المزيد', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(351, 0, 'ar', 'site', 'car', 'السيارة', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(352, 0, 'ar', 'site', 'the_best_in_your_city', 'الأفضل في مدينتك', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(353, 0, 'ar', 'site', 'agency', 'الوكالة', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(354, 0, 'ar', 'site', 'showroom', 'المعرض', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(355, 0, 'ar', 'site', 'listing', 'عدد السيارات', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(356, 0, 'ar', 'site', 'branches', 'الفروع', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(357, 0, 'ar', 'site', 'popular_brands', 'أشهر الماركات', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(358, 0, 'ar', 'site', 'our_top_quality_brands', 'أفضل الماركات', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(359, 0, 'ar', 'site', 'get_our_app', 'قم بتحميل التطبيق', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(360, 0, 'ar', 'site', 'get_it_on', 'احصل عليه', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(361, 0, 'ar', 'site', 'google_play', 'جوجل بلاي', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(362, 0, 'ar', 'site', 'app_store', 'متجر أبل', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(363, 0, 'ar', 'site', 'track_your_order_no', 'تتبع طلبك', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(364, 0, 'ar', 'site', 'login_showrooms_agencies', 'تسجيل دخول المعارض / الوكالات', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(365, 0, 'ar', 'site', 'contact_us', 'اتصل بنا', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(366, 0, 'ar', 'site', 'terms_and_conditions', 'الشروط والأحكام', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(367, 0, 'ar', 'site', 'privacy_policy', 'سياسة الخصوصية', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(368, 0, 'ar', 'site', 'quick_links', 'الروابط السريعة', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(369, 0, 'ar', 'site', 'terms_of_service', 'شروط الخدمة', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(370, 0, 'ar', 'site', 'buying_and_selling_policy', 'سياسة البيع والشراء', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(371, 0, 'ar', 'site', 'support_center', 'مركز الدعم', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(372, 0, 'ar', 'site', 'Faq', 'الأسئلة الشائعة', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(373, 0, 'ar', 'site', 'sell_vehicles', 'بيع السيارات', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(374, 0, 'ar', 'site', 'our_showroom', 'معارضنا', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(375, 0, 'ar', 'site', 'contact', 'تواصل معنا', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(376, 0, 'ar', 'site', 'designed_&_developed_by_matrix_cloud', 'تم تصميمه وتطويره بواسطة شركة ماتريكس كلاودز', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(377, 0, 'en', 'site', 'home', 'Home', '2023-09-19 17:38:33', '2023-09-21 20:53:21'),
(378, 0, 'en', 'site', 'used_cars', 'Used', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(379, 0, 'en', 'site', 'showrooms', 'Showrooms', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(380, 0, 'en', 'site', 'users', 'Users', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(381, 0, 'en', 'site', 'new_cars', 'New cars', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(382, 0, 'en', 'site', 'agencies', 'Agencies', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(383, 0, 'en', 'site', 'automobile_cars', 'Automobile cars', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(384, 0, 'en', 'site', 'login', 'Login', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(385, 0, 'en', 'site', 'sell_trade_your_car', 'Sell or trade your car', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(386, 0, 'en', 'site', 'type_keyword', 'Type keyword', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(387, 0, 'en', 'site', 'about_more', 'More', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(388, 0, 'en', 'site', 'let_find_your_perfect_car', 'Find your car', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(389, 0, 'en', 'site', 'car_condition', 'Car condition', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(390, 0, 'en', 'site', 'all_status', 'All status', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(391, 0, 'en', 'site', 'new_car', 'New', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(392, 0, 'en', 'site', 'used_car', 'Used', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(393, 0, 'en', 'site', 'brand_name', 'Brand name', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(394, 0, 'en', 'site', 'all_brands', 'All brands', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(395, 0, 'en', 'site', 'car_model', 'Car model', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(396, 0, 'en', 'site', 'all_model', 'All model', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(397, 0, 'en', 'site', 'choose_year', 'Choose year', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(398, 0, 'en', 'site', 'all_year', 'All year', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(399, 0, 'en', 'site', 'find_your_car', 'Find your car', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(400, 0, 'en', 'site', '30_years', 'The Most expert in our field', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(401, 0, 'en', 'site', 'about_us', 'About us', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(402, 0, 'en', 'site', 'discover_more', 'Discover more', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(403, 0, 'en', 'site', 'new_arrivals', 'Latest cars', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(404, 0, 'en', 'site', 'certified_used_car', 'Automobile Cars', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(405, 0, 'en', 'site', 'available', 'Available', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(406, 0, 'en', 'site', 'year', 'Year', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(407, 0, 'en', 'site', 'details', 'Details', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(408, 0, 'en', 'site', 'see_more', 'See more', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(409, 0, 'en', 'site', 'car', 'Car', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(410, 0, 'en', 'site', 'the_best_in_your_city', 'The best in your city', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(411, 0, 'en', 'site', 'agency', 'Agency', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(412, 0, 'en', 'site', 'showroom', 'Showroom', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(413, 0, 'en', 'site', 'listing', 'Listing', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(414, 0, 'en', 'site', 'branches', 'Branches', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(415, 0, 'en', 'site', 'popular_brands', 'Popular brands', '2023-09-19 17:38:34', '2023-09-21 20:53:21');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(416, 0, 'en', 'site', 'our_top_quality_brands', 'Our top quality brands', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(417, 0, 'en', 'site', 'get_our_app', 'Get our app', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(418, 0, 'en', 'site', 'get_it_on', 'Get it on', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(419, 0, 'en', 'site', 'google_play', 'Google play', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(420, 0, 'en', 'site', 'app_store', 'App store', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(421, 0, 'en', 'site', 'track_your_order_no', 'Track your order no', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(422, 0, 'en', 'site', 'login_showrooms_agencies', 'Login Showrooms / Agencies', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(423, 0, 'en', 'site', 'contact_us', 'Contact us', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(424, 0, 'en', 'site', 'terms_and_conditions', 'Terms and conditions', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(425, 0, 'en', 'site', 'privacy_policy', 'Privacy policy', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(426, 0, 'en', 'site', 'quick_links', 'Quick links', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(427, 0, 'en', 'site', 'terms_of_service', 'Terms of service', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(428, 0, 'en', 'site', 'buying_and_selling_policy', 'Buying and selling policy', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(429, 0, 'en', 'site', 'support_center', 'Support center', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(430, 0, 'en', 'site', 'Faq', 'Faq', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(431, 0, 'en', 'site', 'sell_vehicles', 'Sell vehicles', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(432, 0, 'en', 'site', 'our_showroom', 'Our showroom', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(433, 0, 'en', 'site', 'contact', 'Contact', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(434, 0, 'en', 'site', 'designed_&_developed_by_matrix_cloud', 'Designed & Developed by Matrix Clouds', '2023-09-19 17:38:34', '2023-09-21 20:53:21'),
(435, 0, 'ar', 'site', 'automatic', 'اتوماتيك', '2023-09-20 13:32:01', '2023-09-21 20:53:21'),
(436, 0, 'en', 'site', 'automatic', 'Automatic', '2023-09-20 13:32:01', '2023-09-21 20:53:21'),
(437, 0, 'ar', 'site', 'listed_on', 'عدد السيارات', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(438, 0, 'ar', 'site', 'car_information', 'تفاصيل العربية', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(439, 0, 'ar', 'site', 'description', 'الوصف/ الملاحظات', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(440, 0, 'ar', 'site', 'seller_description', 'مواصفات البائع', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(441, 0, 'ar', 'site', 'showroom_same_cars', 'اعلانات اخري للسيارة', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(442, 0, 'ar', 'site', 'used', 'مستعملة', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(443, 0, 'ar', 'site', 'inspection_report', 'تقرير الفحص', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(444, 0, 'ar', 'site', 'car_inspection_report', 'تقرير الفحص', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(445, 0, 'ar', 'site', 'view_full_inspection_report', 'مشاهدة التقرير كامل', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(446, 0, 'ar', 'site', 'cars', 'السيارات', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(447, 0, 'ar', 'site', 'brands', 'الماركة', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(448, 0, 'ar', 'site', 'price_range', 'نطاق السعر', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(449, 0, 'ar', 'site', 'years', 'السنين', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(450, 0, 'ar', 'site', 'transmission', 'ناقل الحركة', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(451, 0, 'ar', 'site', 'manual', 'مانيوال', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(452, 0, 'ar', 'site', 'fuel_type', 'نوع الوقود', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(453, 0, 'ar', 'site', 'gas', 'جاز', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(454, 0, 'ar', 'site', 'hybrid', 'هايبرد', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(455, 0, 'ar', 'site', 'diesel', 'ديزل', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(456, 0, 'ar', 'site', 'eletric', 'كهربا', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(457, 0, 'ar', 'site', 'features', 'المميزات', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(458, 0, 'ar', 'site', 'model', 'الموديل', '2023-09-20 17:11:18', '2023-09-21 20:53:21'),
(459, 0, 'en', 'site', 'listed_on', 'Listed on', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(460, 0, 'en', 'site', 'car_information', 'Car information', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(461, 0, 'en', 'site', 'description', 'Description', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(462, 0, 'en', 'site', 'seller_description', 'Seller description', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(463, 0, 'en', 'site', 'showroom_same_cars', 'Showroom same cars', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(464, 0, 'en', 'site', 'used', 'Used', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(465, 0, 'en', 'site', 'inspection_report', 'Inspection report', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(466, 0, 'en', 'site', 'car_inspection_report', 'Car report', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(467, 0, 'en', 'site', 'view_full_inspection_report', 'View full inspection report', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(468, 0, 'en', 'site', 'cars', 'Cars', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(469, 0, 'en', 'site', 'brands', 'Brands', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(470, 0, 'en', 'site', 'price_range', 'Price range', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(471, 0, 'en', 'site', 'years', 'Years', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(472, 0, 'en', 'site', 'transmission', 'Transmission', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(473, 0, 'en', 'site', 'manual', 'Manual', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(474, 0, 'en', 'site', 'fuel_type', 'Fuel type', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(475, 0, 'en', 'site', 'gas', 'Gas', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(476, 0, 'en', 'site', 'hybrid', 'Hybrid', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(477, 0, 'en', 'site', 'diesel', 'Diesel', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(478, 0, 'en', 'site', 'eletric', 'Eletric', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(479, 0, 'en', 'site', 'features', 'Features', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(480, 0, 'en', 'site', 'model', 'Model', '2023-09-20 17:11:19', '2023-09-21 20:53:21'),
(481, 0, 'ar', 'site', 'car_type', 'نوع السيارة', '2023-09-21 17:44:46', '2023-09-21 20:53:21'),
(482, 0, 'ar', 'site', 'l_e', 'L e', '2023-09-21 17:44:46', '2023-09-21 20:53:21'),
(483, 0, 'ar', 'site', 'related_cars', 'السيارات المماثلة', '2023-09-21 17:44:46', '2023-09-21 20:53:21'),
(484, 0, 'ar', 'site', 'drive_type', 'ناقل الحركة', '2023-09-21 17:44:46', '2023-09-21 20:53:21'),
(485, 0, 'ar', 'site', 'engine', 'المحرك', '2023-09-21 17:44:46', '2023-09-21 20:53:21'),
(486, 0, 'ar', 'site', 'color', 'اللون', '2023-09-21 17:44:46', '2023-09-21 20:53:21'),
(487, 0, 'ar', 'site', 'select_model', 'اختر الموديل', '2023-09-21 17:44:46', '2023-09-21 20:53:21'),
(488, 0, 'ar', 'site', 'select_brand', 'اختر الماركة', '2023-09-21 17:44:46', '2023-09-21 20:53:21'),
(489, 0, 'ar', 'site', 'models', 'الموديلات', '2023-09-21 17:44:46', '2023-09-21 20:53:21'),
(490, 0, 'ar', 'site', 'new', 'جديد', '2023-09-21 17:44:46', '2023-09-21 20:53:21'),
(491, 0, 'en', 'site', 'car_type', 'Car type', '2023-09-21 17:44:47', '2023-09-21 20:53:21'),
(492, 0, 'en', 'site', 'l_e', 'L e', '2023-09-21 17:44:47', '2023-09-21 20:53:21'),
(493, 0, 'en', 'site', 'related_cars', 'Related cars', '2023-09-21 17:44:47', '2023-09-21 20:53:21'),
(494, 0, 'en', 'site', 'drive_type', 'Drive type', '2023-09-21 17:44:47', '2023-09-21 20:53:21'),
(495, 0, 'en', 'site', 'engine', 'Engine', '2023-09-21 17:44:47', '2023-09-21 20:53:21'),
(496, 0, 'en', 'site', 'color', 'Color', '2023-09-21 17:44:47', '2023-09-21 20:53:21'),
(497, 0, 'en', 'site', 'select_model', 'Select model', '2023-09-21 17:44:47', '2023-09-21 20:53:21'),
(498, 0, 'en', 'site', 'select_brand', 'Select brand', '2023-09-21 17:44:47', '2023-09-21 20:53:21'),
(499, 0, 'en', 'site', 'models', 'Models', '2023-09-21 17:44:47', '2023-09-21 20:53:21'),
(500, 0, 'en', 'site', 'new', 'New', '2023-09-21 17:44:47', '2023-09-21 20:53:21'),
(501, 0, 'ar', 'site', 'gasoline', 'جاز', '2023-09-21 18:13:23', '2023-09-21 20:53:21'),
(502, 0, 'ar', 'site', 'natural_gas', 'غاز طبيعي', '2023-09-21 18:13:23', '2023-09-21 20:53:21'),
(503, 0, 'ar', 'site', 'from', 'من', '2023-09-21 18:13:23', '2023-09-21 20:53:21'),
(504, 0, 'ar', 'site', 'to', 'الي', '2023-09-21 18:13:23', '2023-09-21 20:53:21'),
(505, 0, 'en', 'site', 'gasoline', 'gasoline', '2023-09-21 18:13:23', '2023-09-21 20:53:21'),
(506, 0, 'en', 'site', 'natural_gas', 'natural_gas', '2023-09-21 18:13:23', '2023-09-21 20:53:21'),
(507, 0, 'en', 'site', 'from', 'from', '2023-09-21 18:13:23', '2023-09-21 20:53:21'),
(508, 0, 'en', 'site', 'to', 'to', '2023-09-21 18:13:23', '2023-09-21 20:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(7, 'App\\Models\\Branch', 1, '5efbd7ad-d326-4f05-8111-9a7bd59010c6', 'branches', 'avatar-demo', 'avatar-demo.png', 'image/png', 'public', 'public', 35206, '[]', '[]', '[]', '[]', 1, '2023-06-19 15:35:58', '2023-06-19 15:35:58'),
(8, 'App\\Models\\Car', 1, 'eaa7bbe7-ec41-46b5-828c-5ab1e4421d43', 'cars', 'user', 'user.png', 'image/png', 'public', 'public', 37148, '[]', '[]', '[]', '[]', 1, '2023-06-19 15:36:08', '2023-06-19 15:36:08'),
(9, 'App\\Models\\Car', 1, '09256326-b57a-4aec-a85e-794db3684746', 'cars', 'agency', 'agency.webp', 'image/webp', 'public', 'public', 50976, '[]', '[]', '[]', '[]', 2, '2023-06-19 15:36:08', '2023-06-19 15:36:08'),
(10, 'App\\Models\\Car', 1, '74deb206-daf3-4ddd-9291-f236cf43fb67', 'cars', 'car', 'car.jpg', 'image/jpeg', 'public', 'public', 37076, '[]', '[]', '[]', '[]', 3, '2023-06-19 15:36:08', '2023-06-19 15:36:08'),
(11, 'App\\Models\\Car', 2, '228e7681-8a35-45b4-8aee-41091f919bf0', 'cars', 'jed-owen-q6Y8Xr3SoQA-unsplash', 'jed-owen-q6Y8Xr3SoQA-unsplash.jpg', 'image/jpeg', 'public', 'public', 3060572, '[]', '[]', '[]', '[]', 1, '2023-06-21 06:56:55', '2023-06-21 06:56:55'),
(12, 'App\\Models\\Car', 3, '6cdb2b2a-0a3e-406e-98ee-561934a84313', 'cars', 'IMG-20230620-WA0004', 'IMG-20230620-WA0004.jpg', 'image/jpeg', 'public', 'public', 121634, '[]', '[]', '[]', '[]', 1, '2023-06-21 07:58:47', '2023-06-21 07:58:47'),
(13, 'App\\Models\\Car', 3, '0cef70ad-33ed-4320-8ee0-7dc7de788ee4', 'cars', 'IMG-20230619-WA0017', 'IMG-20230619-WA0017.jpg', 'image/jpeg', 'public', 'public', 134535, '[]', '[]', '[]', '[]', 2, '2023-06-21 07:58:47', '2023-06-21 07:58:47'),
(14, 'App\\Models\\Car', 4, '2f50364f-fa72-4c33-a26a-2323a2718a00', 'cars', 'IMG-20230620-WA0004', 'IMG-20230620-WA0004.jpg', 'image/jpeg', 'public', 'public', 121634, '[]', '[]', '[]', '[]', 1, '2023-06-21 07:59:38', '2023-06-21 07:59:38'),
(15, 'App\\Models\\Car', 4, 'c5ec7d37-697d-4b99-a0c1-7da30dcbed72', 'cars', 'IMG-20230619-WA0017', 'IMG-20230619-WA0017.jpg', 'image/jpeg', 'public', 'public', 134535, '[]', '[]', '[]', '[]', 2, '2023-06-21 07:59:38', '2023-06-21 07:59:38'),
(16, 'App\\Models\\Car', 5, '9274b8e5-a05a-4ba2-9372-1efd666de30d', 'cars', 'IMG-20230620-WA0004', 'IMG-20230620-WA0004.jpg', 'image/jpeg', 'public', 'public', 121634, '[]', '[]', '[]', '[]', 1, '2023-06-21 08:42:13', '2023-06-21 08:42:13'),
(17, 'App\\Models\\Car', 5, '5a72c5d2-8782-4d1f-b9a3-f98c78722021', 'cars', 'IMG-20230620-WA0011', 'IMG-20230620-WA0011.jpg', 'image/jpeg', 'public', 'public', 44023, '[]', '[]', '[]', '[]', 2, '2023-06-21 08:42:13', '2023-06-21 08:42:13'),
(18, 'App\\Models\\Car', 6, '16778eaa-124e-46dc-8ebe-30d51d9b2d46', 'cars', 'showroom', 'showroom.png', 'image/png', 'public', 'public', 2404, '[]', '[]', '[]', '[]', 1, '2023-06-21 14:30:13', '2023-06-21 14:30:13'),
(19, 'App\\Models\\Car', 6, '909d2f04-2105-4528-a5a0-326aadbb7a11', 'cars', 'car', 'car.jpg', 'image/jpeg', 'public', 'public', 37076, '[]', '[]', '[]', '[]', 2, '2023-06-21 14:30:13', '2023-06-21 14:30:13'),
(20, 'App\\Models\\Car', 6, 'd1274adc-7757-43e2-8742-aa9e7ccfc484', 'cars-logo', 'showroom', 'showroom.png', 'image/png', 'public', 'public', 2404, '[]', '[]', '[]', '[]', 3, '2023-06-21 14:30:13', '2023-06-21 14:30:13'),
(21, 'App\\Models\\Car', 7, '4dfb7ced-4664-4e55-ae45-1f22a99dac0a', 'cars', 'IMG-20230523-WA0002', 'IMG-20230523-WA0002.jpg', 'image/jpeg', 'public', 'public', 49142, '[]', '[]', '[]', '[]', 1, '2023-06-21 15:22:54', '2023-06-21 15:22:54'),
(22, 'App\\Models\\Car', 7, '6e326382-51ae-4732-9072-30a068a226b4', 'cars', 'IMG-20230621-WA0005', 'IMG-20230621-WA0005.jpg', 'image/jpeg', 'public', 'public', 104107, '[]', '[]', '[]', '[]', 2, '2023-06-21 15:22:54', '2023-06-21 15:22:54'),
(23, 'App\\Models\\Car', 7, 'b1d69a97-366a-476d-95ca-2f0b7887e1ca', 'cars-logo', 'IMG-20230523-WA0002', 'IMG-20230523-WA0002.jpg', 'image/jpeg', 'public', 'public', 49142, '[]', '[]', '[]', '[]', 3, '2023-06-21 15:22:54', '2023-06-21 15:22:54'),
(24, 'App\\Models\\Car', 8, 'ab51d51c-6172-416c-8b59-f86a8d11213b', 'cars', 'showroom', 'showroom.png', 'image/png', 'public', 'public', 2404, '[]', '[]', '[]', '[]', 1, '2023-06-22 15:19:55', '2023-06-22 15:19:55'),
(25, 'App\\Models\\Car', 8, 'acd725e5-9812-4af8-8de9-52ebb57f758a', 'cars', 'car', 'car.jpg', 'image/jpeg', 'public', 'public', 37076, '[]', '[]', '[]', '[]', 2, '2023-06-22 15:19:55', '2023-06-22 15:19:55'),
(26, 'App\\Models\\Car', 8, 'b8127998-babd-489d-b440-484cf53daf7b', 'cars-logo', 'user', 'user.png', 'image/png', 'public', 'public', 37148, '[]', '[]', '[]', '[]', 3, '2023-06-22 15:19:55', '2023-06-22 15:19:55'),
(27, 'App\\Models\\Car', 9, 'cb44c4b5-d090-409e-a5ef-fe0e50c399ad', 'cars', 'Screenshot_2023-06-19-09-58-44-02_a23b203fd3aafc6dcb84e438dda678b6', 'Screenshot_2023-06-19-09-58-44-02_a23b203fd3aafc6dcb84e438dda678b6.jpg', 'image/jpeg', 'public', 'public', 614160, '[]', '[]', '[]', '[]', 1, '2023-06-22 19:57:12', '2023-06-22 19:57:12'),
(28, 'App\\Models\\Car', 9, 'b9bc9441-69a8-4750-a4ca-23bc617fc50d', 'cars-logo', 'Screenshot_2023-06-19-09-58-44-02_a23b203fd3aafc6dcb84e438dda678b6', 'Screenshot_2023-06-19-09-58-44-02_a23b203fd3aafc6dcb84e438dda678b6.jpg', 'image/jpeg', 'public', 'public', 614160, '[]', '[]', '[]', '[]', 2, '2023-06-22 19:57:12', '2023-06-22 19:57:12'),
(29, 'App\\Models\\Car', 10, '6e0ad6f0-30dd-4e18-90d4-fb757eab2931', 'cars', 'man-nacelle', 'man-nacelle.jpg', 'image/jpeg', 'public', 'public', 11421757, '[]', '[]', '[]', '[]', 1, '2023-07-03 17:06:22', '2023-07-03 17:06:22'),
(30, 'App\\Models\\Car', 10, 'bc9872f9-2e87-4bd3-9cb3-44343784a9e9', 'cars', 'crane-blue-sky', 'crane-blue-sky.jpg', 'image/jpeg', 'public', 'public', 12270375, '[]', '[]', '[]', '[]', 2, '2023-07-03 17:06:22', '2023-07-03 17:06:22'),
(31, 'App\\Models\\Car', 10, 'f36bda6e-1efb-4b5f-9bd8-1a60857414ec', 'cars-logo', 'user', 'user.png', 'image/png', 'public', 'public', 37148, '[]', '[]', '[]', '[]', 3, '2023-07-03 17:06:22', '2023-07-03 17:06:22'),
(32, 'App\\Models\\Car', 11, '64175f29-716d-4da4-b7e8-bf63287c199b', 'cars', '1', '1.png', 'image/png', 'public', 'public', 168991, '[]', '[]', '[]', '[]', 1, '2023-07-16 12:38:48', '2023-07-16 12:38:48'),
(33, 'App\\Models\\Car', 11, 'c8c0c231-98ed-465e-b55b-02d64e57fbf3', 'cars', '2', '2.png', 'image/png', 'public', 'public', 168842, '[]', '[]', '[]', '[]', 2, '2023-07-16 12:38:48', '2023-07-16 12:38:48'),
(34, 'App\\Models\\Car', 11, '5d7242d0-1b89-4957-afbf-eec205486ba6', 'cars-logo', 'Group 41', 'Group-41.png', 'image/png', 'public', 'public', 19474, '[]', '[]', '[]', '[]', 3, '2023-07-16 12:38:48', '2023-07-16 12:38:48'),
(35, 'App\\Models\\Car', 12, '48fb6755-90af-42f8-a836-b1c930153af1', 'cars', 'IMG_20230703_141104', 'IMG_20230703_141104.jpg', 'image/jpeg', 'public', 'public', 141596, '[]', '[]', '[]', '[]', 1, '2023-07-16 12:53:06', '2023-07-16 12:53:06'),
(36, 'App\\Models\\Car', 12, 'f3820034-ac8d-4e45-8e68-312a674aa680', 'cars-logo', 'IMG_20230703_141047_1', 'IMG_20230703_141047_1.jpg', 'image/jpeg', 'public', 'public', 145452, '[]', '[]', '[]', '[]', 2, '2023-07-16 12:53:06', '2023-07-16 12:53:06'),
(37, 'App\\Models\\CarReport', 1, 'e05eee81-5c1f-4ea0-a8ae-37937b361eea', 'car_reports', 'jobinterview_1', 'jobinterview_1.jpg', 'image/jpeg', 'public', 'public', 284298, '[]', '[]', '[]', '[]', 1, '2023-07-16 14:14:14', '2023-07-16 14:14:14'),
(38, 'App\\Models\\CarReport', 2, '3e7fb103-752b-4743-b40d-d87c11e5679d', 'car_reports', 'jobinterview_1', 'jobinterview_1.jpg', 'image/jpeg', 'public', 'public', 284298, '[]', '[]', '[]', '[]', 1, '2023-07-16 14:14:27', '2023-07-16 14:14:27'),
(39, 'App\\Models\\Car', 14, 'a3032463-96fa-46e1-bd53-8e89d93b8628', 'cars-logo', 'Frame_2', 'Frame_2.png', 'image/png', 'public', 'public', 69903, '[]', '[]', '[]', '[]', 1, '2023-07-16 14:15:52', '2023-07-16 14:15:52'),
(40, 'App\\Models\\Car', 14, 'cc56ea1b-f806-45e7-ac36-dae11c61c71b', 'cars-door-1', 'jobinterview_1', 'jobinterview_1.jpg', 'image/jpeg', 'public', 'public', 284298, '[]', '[]', '[]', '[]', 2, '2023-07-16 14:15:52', '2023-07-16 14:15:52'),
(41, 'App\\Models\\Car', 14, '130ae4b4-656f-4277-ad24-f5f370990eca', 'cars-door-2', 'Frame_1', 'Frame_1.png', 'image/png', 'public', 'public', 73558, '[]', '[]', '[]', '[]', 3, '2023-07-16 14:15:52', '2023-07-16 14:15:52'),
(42, 'App\\Models\\Car', 14, '1200cd96-f6b7-4e17-944b-e7cbb96e4197', 'cars-door-3', 'Frame_2', 'Frame_2.png', 'image/png', 'public', 'public', 69903, '[]', '[]', '[]', '[]', 4, '2023-07-16 14:15:52', '2023-07-16 14:15:52'),
(43, 'App\\Models\\Car', 14, 'be2c8530-e2c8-4968-b4ba-6c3ab6750ca1', 'cars-door-4', 'l2', 'l2.png', 'image/png', 'public', 'public', 184216, '[]', '[]', '[]', '[]', 5, '2023-07-16 14:15:52', '2023-07-16 14:15:52'),
(44, 'App\\Models\\CarReport', 3, 'aa2263a2-bd54-49d3-85e2-32c2df22ef55', 'car_reports', 'l2', 'l2.png', 'image/png', 'public', 'public', 184216, '[]', '[]', '[]', '[]', 1, '2023-07-16 14:16:15', '2023-07-16 14:16:15'),
(45, 'App\\Models\\CarReport', 4, '17a9f0ce-b155-46fd-af43-53589c846cdb', 'car_reports', 'app', 'app.png', 'image/png', 'public', 'public', 138371, '[]', '[]', '[]', '[]', 1, '2023-07-16 14:27:29', '2023-07-16 14:27:29'),
(46, 'App\\Models\\CarReport', 6, 'a2cc46a3-954c-4a71-80ea-0febd7df4a88', 'car_reports', 'banner1', 'banner1.png', 'image/png', 'public', 'public', 449404, '[]', '[]', '[]', '[]', 1, '2023-07-16 14:27:29', '2023-07-16 14:27:29'),
(47, 'App\\Models\\CarReport', 7, '2f9df2a1-5660-4873-8f2f-b3e277cdef4b', 'car_reports', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 1, '2023-07-16 17:20:23', '2023-07-16 17:20:23'),
(48, 'App\\Models\\CarReport', 8, '7d9ea7c8-11f4-49e6-99e4-832d0ff07ba7', 'car_reports', '2 (1)', '2-(1).png', 'image/png', 'public', 'public', 201744, '[]', '[]', '[]', '[]', 1, '2023-07-16 17:20:39', '2023-07-16 17:20:39'),
(49, 'App\\Models\\Car', 16, '055e48c0-752d-4989-b218-140cd7b9d8ab', 'cars', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 1, '2023-07-17 14:37:41', '2023-07-17 14:37:41'),
(50, 'App\\Models\\Car', 16, '00174c95-f33b-4a57-9d23-61615cea78d3', 'cars', '4', '4.png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 2, '2023-07-17 14:37:41', '2023-07-17 14:37:41'),
(51, 'App\\Models\\Car', 16, '42596348-c0ab-4784-82bc-6f919743ccd3', 'cars', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 3, '2023-07-17 14:37:41', '2023-07-17 14:37:41'),
(52, 'App\\Models\\Car', 16, '9094ec53-b536-4a03-982c-b370d69d881e', 'cars', '3', '3.png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 4, '2023-07-17 14:37:41', '2023-07-17 14:37:41'),
(53, 'App\\Models\\Car', 16, '0346f639-2c07-4d6e-beb3-0543d89e2714', 'cars-logo', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 5, '2023-07-17 14:37:41', '2023-07-17 14:37:41'),
(54, 'App\\Models\\Car', 17, '8bda3c3c-cd07-44ef-9656-0075b6c498f9', 'cars', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 1, '2023-07-17 14:40:00', '2023-07-17 14:40:00'),
(55, 'App\\Models\\Car', 17, '04462eb8-06af-4df3-96e6-5ff24a84c98e', 'cars', '4', '4.png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 2, '2023-07-17 14:40:00', '2023-07-17 14:40:00'),
(56, 'App\\Models\\Car', 17, '16035bd2-9eba-4901-bf55-4a49421f02fa', 'cars', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 3, '2023-07-17 14:40:00', '2023-07-17 14:40:00'),
(57, 'App\\Models\\Car', 17, 'f75596ce-c595-4b49-804d-c8dc9feeae2f', 'cars', '3', '3.png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 4, '2023-07-17 14:40:00', '2023-07-17 14:40:00'),
(58, 'App\\Models\\Car', 17, 'e6bd7cc4-fc81-436b-9d8d-e0d6dfe9d512', 'cars-logo', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 5, '2023-07-17 14:40:00', '2023-07-17 14:40:00'),
(59, 'App\\Models\\Car', 18, '51aab0fe-d5e6-498c-b153-62f3345bbe7c', 'cars', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 1, '2023-07-17 14:42:48', '2023-07-17 14:42:48'),
(60, 'App\\Models\\Car', 18, 'd6966638-77ce-4477-ae04-95b4d0e480bc', 'cars', '4', '4.png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 2, '2023-07-17 14:42:48', '2023-07-17 14:42:48'),
(61, 'App\\Models\\Car', 18, 'c1a91260-78de-4e1d-bda9-420b133780fa', 'cars', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 3, '2023-07-17 14:42:48', '2023-07-17 14:42:48'),
(62, 'App\\Models\\Car', 18, '60eb13d3-3d3c-47a6-b486-e154b9503d4d', 'cars', '3', '3.png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 4, '2023-07-17 14:42:48', '2023-07-17 14:42:48'),
(63, 'App\\Models\\Car', 18, '66f4e627-f4a5-4fc8-839e-472ebd2d574b', 'cars-logo', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 5, '2023-07-17 14:42:48', '2023-07-17 14:42:48'),
(64, 'App\\Models\\Car', 19, '7441bd7c-8586-465c-b2ad-89db727537fd', 'cars', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 1, '2023-07-17 15:30:51', '2023-07-17 15:30:51'),
(65, 'App\\Models\\Car', 19, 'a0743bde-1c3e-4089-96fe-e28d80db8b1c', 'cars', '4', '4.png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 2, '2023-07-17 15:30:51', '2023-07-17 15:30:51'),
(66, 'App\\Models\\Car', 19, 'b0fd2c7d-24a4-4f07-a8ed-fe817ce130dc', 'cars', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 3, '2023-07-17 15:30:51', '2023-07-17 15:30:51'),
(67, 'App\\Models\\Car', 19, 'eaef43b1-6574-4998-9829-647318713140', 'cars', '3', '3.png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 4, '2023-07-17 15:30:51', '2023-07-17 15:30:51'),
(68, 'App\\Models\\Car', 19, '288c3acc-bc21-42c5-918d-b876dc40e473', 'cars-logo', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 5, '2023-07-17 15:30:51', '2023-07-17 15:30:51'),
(69, 'App\\Models\\Car', 20, '237f1242-8196-4451-ab9b-fe73af69e6db', 'cars', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 1, '2023-07-17 15:39:56', '2023-07-17 15:39:56'),
(70, 'App\\Models\\Car', 20, '1f218a9b-7dfa-4de7-9619-a573c7c50edb', 'cars', '4', '4.png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 2, '2023-07-17 15:39:56', '2023-07-17 15:39:56'),
(71, 'App\\Models\\Car', 20, '61e088e6-f4d6-42c9-ad1f-bf442345a5d3', 'cars', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 3, '2023-07-17 15:39:56', '2023-07-17 15:39:56'),
(72, 'App\\Models\\Car', 20, 'da5c6b8f-4331-4e3e-b294-95446810588d', 'cars-logo', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 4, '2023-07-17 15:39:56', '2023-07-17 15:39:56'),
(73, 'App\\Models\\Car', 21, 'efec7ec6-3d99-4b12-bf33-af7f4933f3c8', 'cars', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 1, '2023-07-17 15:40:16', '2023-07-17 15:40:16'),
(74, 'App\\Models\\Car', 21, '907b9b43-4a4b-4c12-a878-53bcf41c2e44', 'cars', '4', '4.png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 2, '2023-07-17 15:40:16', '2023-07-17 15:40:16'),
(75, 'App\\Models\\Car', 21, '2ec8abc2-b1c9-4873-92c3-34b726c24806', 'cars', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 3, '2023-07-17 15:40:16', '2023-07-17 15:40:16'),
(76, 'App\\Models\\Car', 21, '0d871a32-984c-4d60-9318-8d587dcb4a27', 'cars-logo', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 4, '2023-07-17 15:40:16', '2023-07-17 15:40:16'),
(77, 'App\\Models\\Car', 22, '28ff51a9-9bbc-4504-90cf-2001e9b9f91a', 'cars', 'IMG_20230703_141104', 'IMG_20230703_141104.jpg', 'image/jpeg', 'public', 'public', 141596, '[]', '[]', '[]', '[]', 1, '2023-07-18 10:49:10', '2023-07-18 10:49:10'),
(78, 'App\\Models\\Car', 22, 'd835a08e-8126-4023-8c8f-8d2ccd291ad3', 'cars-logo', 'IMG_20230703_141104', 'IMG_20230703_141104.jpg', 'image/jpeg', 'public', 'public', 141596, '[]', '[]', '[]', '[]', 2, '2023-07-18 10:49:10', '2023-07-18 10:49:10'),
(79, 'App\\Models\\Car', 23, '21923fba-1c02-460c-884b-526766bab08c', 'cars', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 1, '2023-07-18 10:53:47', '2023-07-18 10:53:47'),
(80, 'App\\Models\\Car', 23, 'a982b7ab-b219-48d9-934d-3fc0be5034a6', 'cars', '4', '4.png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 2, '2023-07-18 10:53:47', '2023-07-18 10:53:47'),
(81, 'App\\Models\\Car', 23, '1694ccfe-4097-44a4-8c12-529a7f1c5535', 'cars', '3', '3.png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 3, '2023-07-18 10:53:47', '2023-07-18 10:53:47'),
(82, 'App\\Models\\Car', 23, '2f2d29d2-c7bb-472b-bf95-aaa69c79897e', 'cars-logo', '1 (1)', '1-(1).png', 'image/png', 'public', 'public', 193154, '[]', '[]', '[]', '[]', 4, '2023-07-18 10:53:47', '2023-07-18 10:53:47'),
(83, 'App\\Models\\Car', 24, 'b51e4a7f-4801-48a9-8fa7-5e311d426b20', 'cars', 'IMG-20230718-WA0064', 'IMG-20230718-WA0064.jpg', 'image/jpeg', 'public', 'public', 119489, '[]', '[]', '[]', '[]', 1, '2023-07-19 09:26:02', '2023-07-19 09:26:02'),
(84, 'App\\Models\\Car', 24, '2ed4822d-7367-479f-8e42-3076b1cf028b', 'cars', 'IMG-20230718-WA0079', 'IMG-20230718-WA0079.jpg', 'image/jpeg', 'public', 'public', 3791, '[]', '[]', '[]', '[]', 2, '2023-07-19 09:26:02', '2023-07-19 09:26:02'),
(85, 'App\\Models\\Car', 24, '26fc49ab-da3f-43de-84db-b0095b4adaf5', 'cars', 'IMG-20230718-WA0061', 'IMG-20230718-WA0061.jpg', 'image/jpeg', 'public', 'public', 10124, '[]', '[]', '[]', '[]', 3, '2023-07-19 09:26:02', '2023-07-19 09:26:02'),
(86, 'App\\Models\\Car', 24, '33dd6946-69f9-4a7d-896c-d3e1e949812a', 'cars-logo', 'IMG-20230718-WA0087', 'IMG-20230718-WA0087.jpg', 'image/jpeg', 'public', 'public', 150245, '[]', '[]', '[]', '[]', 4, '2023-07-19 09:26:02', '2023-07-19 09:26:02'),
(88, 'App\\Models\\Car', 25, 'e0cbc5b3-dca1-4aa1-a1c7-5c76b47b28b9', 'cars', 'IMG_20230703_141104', 'IMG_20230703_141104.jpg', 'image/jpeg', 'public', 'public', 141596, '[]', '[]', '[]', '[]', 1, '2023-07-19 13:17:14', '2023-07-19 13:17:14'),
(89, 'App\\Models\\Car', 25, 'd00a6483-616b-4061-a844-20158ec18dc9', 'cars-logo', 'IMG_20230703_141104', 'IMG_20230703_141104.jpg', 'image/jpeg', 'public', 'public', 141596, '[]', '[]', '[]', '[]', 2, '2023-07-19 13:17:14', '2023-07-19 13:17:14'),
(90, 'App\\Models\\Car', 26, '6635bf02-29eb-49a0-b175-101be77b1b23', 'cars', 'IMG_20230703_141104', 'IMG_20230703_141104.jpg', 'image/jpeg', 'public', 'public', 141596, '[]', '[]', '[]', '[]', 1, '2023-07-19 13:47:31', '2023-07-19 13:47:31'),
(91, 'App\\Models\\Car', 26, '729a34bd-3873-462a-b686-0c80fa81bf23', 'cars-logo', 'IMG_20230703_141047_1', 'IMG_20230703_141047_1.jpg', 'image/jpeg', 'public', 'public', 145452, '[]', '[]', '[]', '[]', 2, '2023-07-19 13:47:31', '2023-07-19 13:47:31'),
(92, 'App\\Models\\Car', 27, 'bcc33eb6-7c60-4a66-be11-5beb49ccaab3', 'cars', 'IMG_20230703_141104', 'IMG_20230703_141104.jpg', 'image/jpeg', 'public', 'public', 141596, '[]', '[]', '[]', '[]', 1, '2023-07-19 15:30:49', '2023-07-19 15:30:49'),
(93, 'App\\Models\\Car', 27, 'e57e69ae-868d-4207-bd22-14fc35eb699d', 'cars-logo', 'IMG_20230703_141104', 'IMG_20230703_141104.jpg', 'image/jpeg', 'public', 'public', 141596, '[]', '[]', '[]', '[]', 2, '2023-07-19 15:30:49', '2023-07-19 15:30:49'),
(97, 'App\\Models\\Car', 28, 'fe4d7a93-9926-4316-9888-e2d9f46a5a7d', 'cars', '3', '3.png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 1, '2023-07-20 12:42:37', '2023-07-20 12:42:37'),
(98, 'App\\Models\\Car', 28, '688e138c-f238-4973-90cd-802abb081184', 'cars-logo', '4', '4.png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 2, '2023-07-20 12:42:37', '2023-07-20 12:42:37'),
(99, 'App\\Models\\Car', 29, '9fc9aba1-549b-4996-9039-2d8974227e85', 'cars', 'IMG_20230328_150126', 'IMG_20230328_150126.jpg', 'image/jpeg', 'public', 'public', 66510, '[]', '[]', '[]', '[]', 1, '2023-07-23 12:54:23', '2023-07-23 12:54:23'),
(100, 'App\\Models\\Car', 29, '19b79759-0ae3-431f-bd59-21af3337cf4f', 'cars-logo', 'IMG_20230328_150126', 'IMG_20230328_150126.jpg', 'image/jpeg', 'public', 'public', 66510, '[]', '[]', '[]', '[]', 2, '2023-07-23 12:54:23', '2023-07-23 12:54:23'),
(101, 'App\\Models\\Car', 30, '834ba21e-0f98-4a0a-86c2-ca4467e915eb', 'cars', 'IMG_20230328_145851', 'IMG_20230328_145851.jpg', 'image/jpeg', 'public', 'public', 115553, '[]', '[]', '[]', '[]', 1, '2023-07-23 13:00:56', '2023-07-23 13:00:56'),
(102, 'App\\Models\\Car', 30, 'f207b833-74ee-45f5-b204-1129ae050f9b', 'cars-logo', 'IMG_20230328_150113', 'IMG_20230328_150113.jpg', 'image/jpeg', 'public', 'public', 123116, '[]', '[]', '[]', '[]', 2, '2023-07-23 13:00:56', '2023-07-23 13:00:56'),
(103, 'App\\Models\\Car', 31, 'a0d5e73c-4b4d-4422-a607-ff3b794ad916', 'cars', 'IMG_20230328_150113', 'IMG_20230328_150113.jpg', 'image/jpeg', 'public', 'public', 123116, '[]', '[]', '[]', '[]', 1, '2023-07-23 13:21:07', '2023-07-23 13:21:07'),
(104, 'App\\Models\\Car', 31, '350a6a62-ad28-4409-bfed-bd850df50b19', 'cars-logo', 'IMG_20230328_150126', 'IMG_20230328_150126.jpg', 'image/jpeg', 'public', 'public', 66510, '[]', '[]', '[]', '[]', 2, '2023-07-23 13:21:07', '2023-07-23 13:21:07'),
(111, 'App\\Models\\Car', 32, '785efe43-64c2-4982-b9fa-45eb8e4cacd2', 'cars', 'images (1)', 'images-(1).jpg', 'image/jpeg', 'public', 'public', 11389, '[]', '[]', '[]', '[]', 1, '2023-07-24 23:07:42', '2023-07-24 23:07:42'),
(112, 'App\\Models\\Car', 32, '31e18115-311c-4603-b224-73822ed4a612', 'cars-logo', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 2, '2023-07-24 23:07:42', '2023-07-24 23:07:42'),
(113, 'App\\Models\\Car', 33, '6b2c31c7-1c11-4819-aff7-6ce6eb19e4b8', 'cars-logo', 'car', 'car.jpg', 'image/jpeg', 'public', 'public', 37076, '[]', '[]', '[]', '[]', 1, '2023-07-25 13:12:18', '2023-07-25 13:12:18'),
(114, 'App\\Models\\Car', 33, '780e4eff-5c8d-486a-8183-325937beb94e', 'cars-door-1', 'car', 'car.jpg', 'image/jpeg', 'public', 'public', 37076, '[]', '[]', '[]', '[]', 2, '2023-07-25 13:12:18', '2023-07-25 13:12:18'),
(115, 'App\\Models\\Car', 33, '56906295-bbd7-45bb-9541-4df3e0cc66a7', 'cars-door-2', 'car', 'car.webp', 'image/webp', 'public', 'public', 33574, '[]', '[]', '[]', '[]', 3, '2023-07-25 13:12:18', '2023-07-25 13:12:18'),
(116, 'App\\Models\\Car', 33, 'ba3ead23-a6c3-4936-b60a-e1da904c0ce2', 'cars-door-3', 'car', 'car.jpg', 'image/jpeg', 'public', 'public', 37076, '[]', '[]', '[]', '[]', 4, '2023-07-25 13:12:18', '2023-07-25 13:12:18'),
(117, 'App\\Models\\Car', 33, '7fd5cebd-b7cf-4c8e-9538-345ae72687e4', 'cars-door-4', 'car', 'car.webp', 'image/webp', 'public', 'public', 33574, '[]', '[]', '[]', '[]', 5, '2023-07-25 13:12:18', '2023-07-25 13:12:18'),
(118, 'App\\Models\\Car', 33, '696b3d67-215d-46fa-9422-27b08aa3d9ba', 'cars', '2 (1)', '2-(1).png', 'image/png', 'public', 'public', 201744, '[]', '[]', '[]', '[]', 6, '2023-07-25 13:12:18', '2023-07-25 13:12:18'),
(119, 'App\\Models\\Car', 33, 'f31d3106-e3fe-43dd-87a3-ceb2704c6d16', 'cars', '1 (1)', '1-(1).png', 'image/png', 'public', 'public', 193154, '[]', '[]', '[]', '[]', 7, '2023-07-25 13:12:18', '2023-07-25 13:12:18'),
(120, 'App\\Models\\CarReport', 9, 'd88817f8-f69f-4ab4-ad7d-f25a40e74702', 'car_reports', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 1, '2023-07-25 13:12:49', '2023-07-25 13:12:49'),
(121, 'App\\Models\\CarReport', 11, '54e4dbe2-4826-4de4-862d-ff8bff788b94', 'car_reports', '1 (2)', '1-(2).png', 'image/png', 'public', 'public', 193154, '[]', '[]', '[]', '[]', 1, '2023-07-25 13:12:49', '2023-07-25 13:12:49'),
(123, 'App\\Models\\Car', 34, '1d4b3fa2-f801-4d7d-b4c5-f1bce05c4b05', 'cars-logo', 'success', 'success.png', 'image/png', 'public', 'public', 3058, '[]', '[]', '[]', '[]', 1, '2023-07-25 14:22:48', '2023-07-25 14:22:48'),
(124, 'App\\Models\\Car', 34, 'f8e36b61-c054-4b9b-a072-731731c567fa', 'cars-door-1', 'success', 'success.png', 'image/png', 'public', 'public', 3058, '[]', '[]', '[]', '[]', 2, '2023-07-25 14:22:48', '2023-07-25 14:22:48'),
(125, 'App\\Models\\Car', 34, 'bd49a75f-31b0-4135-9e93-60fca42eec21', 'cars-door-2', 'success', 'success.png', 'image/png', 'public', 'public', 3058, '[]', '[]', '[]', '[]', 3, '2023-07-25 14:22:48', '2023-07-25 14:22:48'),
(126, 'App\\Models\\Car', 34, '45f0eb03-e001-4f9f-a087-600377a0547a', 'cars-door-3', 'success', 'success.png', 'image/png', 'public', 'public', 3058, '[]', '[]', '[]', '[]', 4, '2023-07-25 14:22:48', '2023-07-25 14:22:48'),
(127, 'App\\Models\\Car', 34, '4d2cef35-3d4e-4ea8-9090-48928be5a46f', 'cars-door-4', 'success', 'success.png', 'image/png', 'public', 'public', 3058, '[]', '[]', '[]', '[]', 5, '2023-07-25 14:22:48', '2023-07-25 14:22:48'),
(128, 'App\\Models\\CarReport', 13, '220b0747-94dd-4ae5-b144-440c5d1e01a4', 'car_reports', 'success', 'success.png', 'image/png', 'public', 'public', 3058, '[]', '[]', '[]', '[]', 1, '2023-07-25 14:23:55', '2023-07-25 14:23:55'),
(129, 'App\\Models\\CarReport', 14, '186c3359-f27c-49e5-a9c4-2f119148b35c', 'car_reports', 'success', 'success.png', 'image/png', 'public', 'public', 3058, '[]', '[]', '[]', '[]', 1, '2023-07-25 14:46:11', '2023-07-25 14:46:11'),
(130, 'App\\Models\\Car', 35, 'fc5565e8-0ce0-4b33-8709-9d9009ed47f9', 'cars', 'IMG-20230725-WA0021', 'IMG-20230725-WA0021.jpg', 'image/jpeg', 'public', 'public', 20784, '[]', '[]', '[]', '[]', 1, '2023-07-26 14:42:57', '2023-07-26 14:42:57'),
(131, 'App\\Models\\Car', 35, 'ae0b944f-214d-4506-9cdf-c6cb51b8584b', 'cars', 'IMG-20230725-WA0021', 'IMG-20230725-WA0021.jpg', 'image/jpeg', 'public', 'public', 20784, '[]', '[]', '[]', '[]', 2, '2023-07-26 14:42:57', '2023-07-26 14:42:57'),
(132, 'App\\Models\\Car', 35, 'e1adfb8b-83d6-45e0-94cd-fc461497c775', 'cars-logo', 'IMG-20230725-WA0021', 'IMG-20230725-WA0021.jpg', 'image/jpeg', 'public', 'public', 20784, '[]', '[]', '[]', '[]', 3, '2023-07-26 14:42:57', '2023-07-26 14:42:57'),
(133, 'App\\Models\\Car', 36, '0a5ed929-eb8c-4c59-897d-9b00c9516791', 'cars', 'download (2)', 'download-(2).jfif', 'image/jpeg', 'public', 'public', 4753, '[]', '[]', '[]', '[]', 1, '2023-07-30 09:57:16', '2023-07-30 09:57:16'),
(134, 'App\\Models\\Car', 36, 'ebf2d9b8-14d4-4e6b-890f-e3902d20be8a', 'cars-logo', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 2, '2023-07-30 09:57:16', '2023-07-30 09:57:16'),
(135, 'App\\Models\\Car', 36, '7a132239-33ab-421e-98ca-91a5b68790c7', 'cars-door-1', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 3, '2023-07-30 09:57:16', '2023-07-30 09:57:16'),
(136, 'App\\Models\\Car', 36, 'c996e0cb-cba4-4733-a369-b72a6642d3fe', 'cars-door-2', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 4, '2023-07-30 09:57:16', '2023-07-30 09:57:16'),
(137, 'App\\Models\\Car', 36, '3e44f41e-a72e-407c-82a5-2b15fd1bcd9b', 'cars-door-3', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 5, '2023-07-30 09:57:16', '2023-07-30 09:57:16'),
(138, 'App\\Models\\Car', 36, 'a86c5314-d5eb-496d-8483-4f51cb79e76e', 'cars-door-4', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 6, '2023-07-30 09:57:16', '2023-07-30 09:57:16'),
(139, 'App\\Models\\CarReport', 15, '7fe08836-ed5c-4ce1-a672-8c486f28dd6f', 'car_reports', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 1, '2023-07-30 09:58:45', '2023-07-30 09:58:45'),
(140, 'App\\Models\\CarReport', 16, 'c916ec3e-b36f-4f6f-86bc-4e779bfc0f15', 'car_reports', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 1, '2023-07-30 09:58:45', '2023-07-30 09:58:45'),
(141, 'App\\Models\\CarReport', 17, 'cb39ad43-4d22-493b-b36b-b7f237d5c42c', 'car_reports', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 1, '2023-07-30 09:58:45', '2023-07-30 09:58:45'),
(142, 'App\\Models\\CarReport', 18, '09c884f7-90ec-40a3-98f8-014f818b1b84', 'car_reports', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 1, '2023-07-30 09:58:45', '2023-07-30 09:58:45'),
(143, 'App\\Models\\CarReport', 19, '465d37e9-64ad-40d2-a305-6bdf934895ea', 'car_reports', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 1, '2023-07-30 09:58:45', '2023-07-30 09:58:45'),
(144, 'App\\Models\\CarReport', 20, 'c1f7b1f5-4ab5-4d87-bddd-6861dbcf2cf8', 'car_reports', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 1, '2023-07-30 09:58:45', '2023-07-30 09:58:45'),
(145, 'App\\Models\\CarReport', 21, '06f51219-a2e9-45c6-b931-0ef76e7d5a69', 'car_reports', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 1, '2023-07-30 09:58:45', '2023-07-30 09:58:45'),
(146, 'App\\Models\\CarReport', 22, '69cff54c-a67f-45ed-a3e6-3e0890e71e93', 'car_reports', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6270, '[]', '[]', '[]', '[]', 1, '2023-07-30 09:58:45', '2023-07-30 09:58:45'),
(147, 'App\\Models\\Car', 37, '3dee75c7-af7c-4722-bacf-a28736312a6c', 'cars', 'images (1)', 'images-(1).PNG', 'image/jpeg', 'public', 'public', 2798, '[]', '[]', '[]', '[]', 1, '2023-07-30 10:08:05', '2023-07-30 10:08:05'),
(148, 'App\\Models\\Car', 37, '120076ca-f086-405a-93d3-0efb77691458', 'cars-logo', 'images (1)', 'images-(1).PNG', 'image/jpeg', 'public', 'public', 2798, '[]', '[]', '[]', '[]', 2, '2023-07-30 10:08:05', '2023-07-30 10:08:05'),
(149, 'App\\Models\\Car', 37, 'cf323c05-e094-4e6d-9630-da4bb934a393', 'cars-door-1', 'images (1)', 'images-(1).PNG', 'image/jpeg', 'public', 'public', 2798, '[]', '[]', '[]', '[]', 3, '2023-07-30 10:08:05', '2023-07-30 10:08:05'),
(150, 'App\\Models\\Car', 37, 'dddb64b5-3bbf-44c8-bd0d-0eaa5ea6c484', 'cars-door-2', 'images (1)', 'images-(1).PNG', 'image/jpeg', 'public', 'public', 2798, '[]', '[]', '[]', '[]', 4, '2023-07-30 10:08:05', '2023-07-30 10:08:05'),
(151, 'App\\Models\\Car', 37, '08d34f54-0861-4596-b4d4-b06c8fbddc46', 'cars-door-3', 'images (1)', 'images-(1).PNG', 'image/jpeg', 'public', 'public', 2798, '[]', '[]', '[]', '[]', 5, '2023-07-30 10:08:05', '2023-07-30 10:08:05'),
(152, 'App\\Models\\Car', 37, 'a0af443f-be9a-449c-8c4e-075c3d8f2ac7', 'cars-door-4', 'images (1)', 'images-(1).PNG', 'image/jpeg', 'public', 'public', 2798, '[]', '[]', '[]', '[]', 6, '2023-07-30 10:08:05', '2023-07-30 10:08:05'),
(153, 'App\\Models\\CarReport', 23, 'b05b637a-37fd-40dd-9209-f7c3b85c40f2', 'car_reports', 'images (1)', 'images-(1).PNG', 'image/jpeg', 'public', 'public', 2798, '[]', '[]', '[]', '[]', 1, '2023-07-30 10:09:13', '2023-07-30 10:09:13'),
(154, 'App\\Models\\CarReport', 24, 'f5fa8ef0-8bd7-4a57-93aa-1b852c87edeb', 'car_reports', 'images (1)', 'images-(1).PNG', 'image/jpeg', 'public', 'public', 2798, '[]', '[]', '[]', '[]', 1, '2023-07-30 10:09:13', '2023-07-30 10:09:13'),
(155, 'App\\Models\\CarReport', 25, '62107ad7-c166-4b34-9b74-92932377254a', 'car_reports', 'images (1)', 'images-(1).PNG', 'image/jpeg', 'public', 'public', 2798, '[]', '[]', '[]', '[]', 1, '2023-07-30 10:09:13', '2023-07-30 10:09:13'),
(156, 'App\\Models\\CarReport', 26, 'bdf2001c-94f7-4987-b094-ec9173f9b02a', 'car_reports', 'images (1)', 'images-(1).PNG', 'image/jpeg', 'public', 'public', 2798, '[]', '[]', '[]', '[]', 1, '2023-07-30 10:09:36', '2023-07-30 10:09:36'),
(157, 'App\\Models\\CarReport', 27, 'd4c347d6-b4c0-43d7-afc3-a8172ba68478', 'car_reports', 'images (1)', 'images-(1).PNG', 'image/jpeg', 'public', 'public', 2798, '[]', '[]', '[]', '[]', 1, '2023-07-30 10:09:36', '2023-07-30 10:09:36'),
(158, 'App\\Models\\Showroom', 3, '5d385b01-1d98-45ae-8c8a-061b280239fc', 'showrooms-logo', 'logo', 'logo.png', 'image/png', 'public', 'public', 38129, '[]', '[]', '[]', '[]', 1, '2023-07-31 11:21:12', '2023-07-31 11:21:12'),
(159, 'App\\Models\\Showroom', 3, '545d1050-e35d-4e15-889b-99b639b66442', 'showrooms-tax_card', 'logo', 'logo.png', 'image/png', 'public', 'public', 38129, '[]', '[]', '[]', '[]', 2, '2023-07-31 11:21:12', '2023-07-31 11:21:12'),
(160, 'App\\Models\\Showroom', 3, '1ccf3ab3-ab1d-440b-8fb1-a51641a312f4', 'showrooms-commercial', 'logo', 'logo.png', 'image/png', 'public', 'public', 38129, '[]', '[]', '[]', '[]', 3, '2023-07-31 11:21:12', '2023-07-31 11:21:12'),
(161, 'App\\Models\\Showroom', 4, 'ee869baa-2c4a-4f99-a18f-9706b3fd611c', 'showrooms-logo', 'logoN', 'logoN.png', 'image/png', 'public', 'public', 4585, '[]', '[]', '[]', '[]', 1, '2023-07-31 11:29:00', '2023-07-31 11:29:00'),
(162, 'App\\Models\\Showroom', 4, '8fbd6685-d4f1-4a2d-a6c5-d084cf93f6a5', 'showrooms-tax_card', 'logoN', 'logoN.png', 'image/png', 'public', 'public', 4585, '[]', '[]', '[]', '[]', 2, '2023-07-31 11:29:00', '2023-07-31 11:29:00'),
(163, 'App\\Models\\Showroom', 4, 'a96b738e-6469-4937-888e-18432d9962eb', 'showrooms-commercial', 'logoN', 'logoN.png', 'image/png', 'public', 'public', 4585, '[]', '[]', '[]', '[]', 3, '2023-07-31 11:29:00', '2023-07-31 11:29:00'),
(171, 'App\\Models\\User', 3, '9860ba19-8247-481b-aab3-0c76a6936240', 'users-logo', 'FB_IMG_1690659341630', 'FB_IMG_1690659341630.jpg', 'image/jpeg', 'public', 'public', 95556, '[]', '[]', '[]', '[]', 1, '2023-08-01 13:53:05', '2023-08-01 13:53:05'),
(173, 'App\\Models\\Car', 38, 'e8794e2a-a105-4c0c-971b-f2ea0134926c', 'cars-logo', '--develearn-logo-footer', '--develearn-logo-footer.png', 'image/png', 'public', 'public', 6293, '[]', '[]', '[]', '[]', 1, '2023-08-01 15:23:57', '2023-08-01 15:23:57'),
(174, 'App\\Models\\Car', 38, 'ff4f77ca-91b3-4071-a0ae-18e14ecd27c4', 'cars-door-1', 'egy-icon', 'egy-icon.png', 'image/png', 'public', 'public', 4046, '[]', '[]', '[]', '[]', 2, '2023-08-01 15:23:57', '2023-08-01 15:23:57'),
(175, 'App\\Models\\Car', 38, '364119d5-86b7-47cd-9127-e7a2fa6f9b4d', 'cars-door-2', '--develearn-logo-footer', '--develearn-logo-footer.png', 'image/png', 'public', 'public', 6293, '[]', '[]', '[]', '[]', 3, '2023-08-01 15:23:57', '2023-08-01 15:23:57'),
(176, 'App\\Models\\Car', 38, 'b7ff111b-5277-419f-b94f-2390bc921283', 'cars-door-3', '5', '5.jpg', 'image/jpeg', 'public', 'public', 17641, '[]', '[]', '[]', '[]', 4, '2023-08-01 15:23:57', '2023-08-01 15:23:57'),
(177, 'App\\Models\\Car', 38, '7ac725e7-9ccf-41aa-b3fb-a8a0a0f3e32c', 'cars-door-4', 'job', 'job.jpg', 'image/jpeg', 'public', 'public', 87146, '[]', '[]', '[]', '[]', 5, '2023-08-01 15:23:57', '2023-08-01 15:23:57'),
(178, 'App\\Models\\Car', 39, '6b271835-ce32-4e8f-8b07-99cecbbf4190', 'cars-logo', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5130, '[]', '[]', '[]', '[]', 1, '2023-08-01 15:50:35', '2023-08-01 15:50:35'),
(179, 'App\\Models\\Car', 39, '350fb730-7d79-46f9-a160-ca63deaf07e8', 'cars-door-1', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5130, '[]', '[]', '[]', '[]', 2, '2023-08-01 15:50:35', '2023-08-01 15:50:35'),
(180, 'App\\Models\\Car', 39, '9160ace2-e4d3-42ee-afc7-44913c840040', 'cars-door-2', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5130, '[]', '[]', '[]', '[]', 3, '2023-08-01 15:50:35', '2023-08-01 15:50:35'),
(181, 'App\\Models\\Car', 39, '428b5393-298c-4ec1-b59d-be5731424b44', 'cars-door-3', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5130, '[]', '[]', '[]', '[]', 4, '2023-08-01 15:50:35', '2023-08-01 15:50:35'),
(182, 'App\\Models\\Car', 39, 'dc7ecd93-d155-4794-bd22-bc36ec48a5f4', 'cars-door-4', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5130, '[]', '[]', '[]', '[]', 5, '2023-08-01 15:50:35', '2023-08-01 15:50:35'),
(183, 'App\\Models\\Car', 40, 'd91a6656-e938-4eb6-8c60-b8b25e6ddae9', 'cars-logo', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5130, '[]', '[]', '[]', '[]', 1, '2023-08-01 15:51:43', '2023-08-01 15:51:43'),
(184, 'App\\Models\\Car', 40, 'd0ee6d08-3e9b-48b1-bb51-22650afe8169', 'cars-door-1', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5130, '[]', '[]', '[]', '[]', 2, '2023-08-01 15:51:43', '2023-08-01 15:51:43'),
(185, 'App\\Models\\Car', 40, '568e0437-d6ba-425c-a1d6-727478149e99', 'cars-door-2', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5130, '[]', '[]', '[]', '[]', 3, '2023-08-01 15:51:43', '2023-08-01 15:51:43'),
(186, 'App\\Models\\Car', 40, '53429038-36f3-4f57-8882-62b9b4dfbec1', 'cars-door-3', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5130, '[]', '[]', '[]', '[]', 4, '2023-08-01 15:51:43', '2023-08-01 15:51:43'),
(187, 'App\\Models\\Car', 40, '9f6d7d3d-9000-4032-8d28-5ba29030d290', 'cars-door-4', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5130, '[]', '[]', '[]', '[]', 5, '2023-08-01 15:51:43', '2023-08-01 15:51:43'),
(188, 'App\\Models\\CarReport', 32, '2fd2d32b-3ff7-4279-ae38-4eb87bf3c7b8', 'car_reports', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5130, '[]', '[]', '[]', '[]', 1, '2023-08-01 15:52:28', '2023-08-01 15:52:28'),
(189, 'App\\Models\\CarReport', 36, 'e16bbf22-f106-4c52-b81b-5f604c0aed96', 'car_reports', 'download (1)', 'download-(1).jpeg', 'image/jpeg', 'public', 'public', 6175, '[]', '[]', '[]', '[]', 1, '2023-08-01 15:55:04', '2023-08-01 15:55:04'),
(190, 'App\\Models\\Car', 44, '21a0a8c0-5422-451c-bd15-3085eb8c9938', 'cars', 'IMG_20230328_150113', 'IMG_20230328_150113.jpg', 'image/jpeg', 'public', 'public', 123116, '[]', '[]', '[]', '[]', 1, '2023-08-02 09:48:07', '2023-08-02 09:48:07'),
(191, 'App\\Models\\Car', 44, '40da9bca-3dff-48d5-aff1-ecbec2b71b6e', 'cars-logo', 'IMG_20230328_150120', 'IMG_20230328_150120.jpg', 'image/jpeg', 'public', 'public', 99905, '[]', '[]', '[]', '[]', 2, '2023-08-02 09:48:07', '2023-08-02 09:48:07'),
(192, 'App\\Models\\Car', 45, 'f7f0823d-4093-42b7-8d0f-6677ce986bfd', 'cars', 'IMG_20230328_150120', 'IMG_20230328_150120.jpg', 'image/jpeg', 'public', 'public', 99905, '[]', '[]', '[]', '[]', 1, '2023-08-02 09:50:58', '2023-08-02 09:50:58'),
(193, 'App\\Models\\Car', 45, 'd73a6c83-78ee-474e-879e-0651270b3d57', 'cars-logo', 'IMG_20230328_150126', 'IMG_20230328_150126.jpg', 'image/jpeg', 'public', 'public', 66510, '[]', '[]', '[]', '[]', 2, '2023-08-02 09:50:58', '2023-08-02 09:50:58'),
(194, 'App\\Models\\Car', 46, '3602a515-b3bf-4c21-9d15-a76f4b7190fb', 'cars', '2 (2)', '2-(2).png', 'image/png', 'public', 'public', 201744, '[]', '[]', '[]', '[]', 1, '2023-08-02 09:57:31', '2023-08-02 09:57:31'),
(195, 'App\\Models\\Car', 46, '94d74e75-a159-4833-a849-90c41bdff25e', 'cars', '1 (1)', '1-(1).png', 'image/png', 'public', 'public', 193154, '[]', '[]', '[]', '[]', 2, '2023-08-02 09:57:31', '2023-08-02 09:57:31'),
(196, 'App\\Models\\Car', 46, 'da2d94c1-f501-4942-94e9-44282ce380e3', 'cars-logo', 'WhatsApp-Image-2022-10-27-at-4.37.20-PM', 'WhatsApp-Image-2022-10-27-at-4.37.20-PM.jpeg', 'image/jpeg', 'public', 'public', 416521, '[]', '[]', '[]', '[]', 3, '2023-08-02 09:57:31', '2023-08-02 09:57:31'),
(197, 'App\\Models\\Car', 47, 'bdd0b6c3-80ac-4a48-9ba1-ff370598b353', 'cars', '2 (2)', '2-(2).png', 'image/png', 'public', 'public', 201744, '[]', '[]', '[]', '[]', 1, '2023-08-02 09:58:32', '2023-08-02 09:58:32'),
(198, 'App\\Models\\Car', 47, '8052412e-3041-408b-8546-147efd40a79f', 'cars', '1 (1)', '1-(1).png', 'image/png', 'public', 'public', 193154, '[]', '[]', '[]', '[]', 2, '2023-08-02 09:58:32', '2023-08-02 09:58:32'),
(199, 'App\\Models\\Car', 47, '899b7a68-163f-4730-a880-d350d3e7b5ba', 'cars-logo', 'WhatsApp-Image-2022-10-27-at-4.37.20-PM', 'WhatsApp-Image-2022-10-27-at-4.37.20-PM.jpeg', 'image/jpeg', 'public', 'public', 416521, '[]', '[]', '[]', '[]', 3, '2023-08-02 09:58:32', '2023-08-02 09:58:32'),
(200, 'App\\Models\\Car', 48, 'f59b51bd-e788-46f7-9561-86fa72add7a8', 'cars', '2 (2)', '2-(2).png', 'image/png', 'public', 'public', 201744, '[]', '[]', '[]', '[]', 1, '2023-08-02 10:00:28', '2023-08-02 10:00:28'),
(201, 'App\\Models\\Car', 48, 'd1a3fc68-a0c1-4d87-853f-9ac94a8d6f1e', 'cars', '1 (1)', '1-(1).png', 'image/png', 'public', 'public', 193154, '[]', '[]', '[]', '[]', 2, '2023-08-02 10:00:28', '2023-08-02 10:00:28'),
(202, 'App\\Models\\Car', 48, '2d39c8fc-a133-4d48-b3d6-db99e00a01a7', 'cars-logo', 'WhatsApp-Image-2022-10-27-at-4.37.20-PM', 'WhatsApp-Image-2022-10-27-at-4.37.20-PM.jpeg', 'image/jpeg', 'public', 'public', 416521, '[]', '[]', '[]', '[]', 3, '2023-08-02 10:00:28', '2023-08-02 10:00:28'),
(203, 'App\\Models\\Car', 49, 'e448bd1c-edd8-411e-af98-146c949c1cd4', 'cars', '1', '1.png', 'image/png', 'public', 'public', 168991, '[]', '[]', '[]', '[]', 1, '2023-08-02 10:02:21', '2023-08-02 10:02:21'),
(204, 'App\\Models\\Car', 49, '41eecd7e-65d5-4fea-9683-1fc4edff72ef', 'cars-logo', '1', '1.png', 'image/png', 'public', 'public', 168991, '[]', '[]', '[]', '[]', 2, '2023-08-02 10:02:21', '2023-08-02 10:02:21'),
(205, 'App\\Models\\Car', 50, 'ca4002e9-bf2a-449a-a1ca-ac0bcb8ac7eb', 'cars', 'IMG_20230328_150120', 'IMG_20230328_150120.jpg', 'image/jpeg', 'public', 'public', 99905, '[]', '[]', '[]', '[]', 1, '2023-08-02 10:12:59', '2023-08-02 10:12:59'),
(206, 'App\\Models\\Car', 50, '31229d5e-e4ea-4712-88fe-3a3a2f6aad78', 'cars-logo', 'IMG_20230328_150120', 'IMG_20230328_150120.jpg', 'image/jpeg', 'public', 'public', 99905, '[]', '[]', '[]', '[]', 2, '2023-08-02 10:12:59', '2023-08-02 10:12:59'),
(215, 'App\\Models\\Car', 51, 'd91c4991-a0de-4364-bfa5-39fe03346482', 'cars-logo', 'Screenshot', 'Screenshot.png', 'image/png', 'public', 'public', 649923, '[]', '[]', '[]', '[]', 1, '2023-08-03 13:35:15', '2023-08-03 13:35:15'),
(216, 'App\\Models\\Car', 51, '15cbdac4-22ed-4214-8803-16e6b1f10ef0', 'cars-door-1', 'Screenshot', 'Screenshot.png', 'image/png', 'public', 'public', 649923, '[]', '[]', '[]', '[]', 2, '2023-08-03 13:35:15', '2023-08-03 13:35:15'),
(217, 'App\\Models\\Car', 51, '0be7875e-27e1-4516-a6bd-f6ac0742b88c', 'cars-door-2', 'Screenshot', 'Screenshot.png', 'image/png', 'public', 'public', 649923, '[]', '[]', '[]', '[]', 3, '2023-08-03 13:35:15', '2023-08-03 13:35:15'),
(218, 'App\\Models\\Car', 51, 'b4f1a353-c470-4cc2-9415-129f9548e360', 'cars-door-3', 'Screenshot', 'Screenshot.png', 'image/png', 'public', 'public', 649923, '[]', '[]', '[]', '[]', 4, '2023-08-03 13:35:15', '2023-08-03 13:35:15'),
(219, 'App\\Models\\Car', 51, '49ea5cda-c33a-44ad-8c37-ab56585078b8', 'cars-door-4', 'Screenshot', 'Screenshot.png', 'image/png', 'public', 'public', 649923, '[]', '[]', '[]', '[]', 5, '2023-08-03 13:35:15', '2023-08-03 13:35:15'),
(228, 'App\\Models\\Car', 52, '05916ae7-acc1-444a-9128-0ebe075f000d', 'cars', '1', '1.png', 'image/png', 'public', 'public', 168991, '[]', '[]', '[]', '[]', 1, '2023-08-03 15:51:30', '2023-08-03 15:51:30'),
(229, 'App\\Models\\Car', 52, '38700af8-0c4a-4a06-a6c4-74c6c7d0678e', 'cars-logo', '1', '1.png', 'image/png', 'public', 'public', 168991, '[]', '[]', '[]', '[]', 2, '2023-08-03 15:51:30', '2023-08-03 15:51:30'),
(230, 'App\\Models\\Car', 53, '41ed649b-ae4f-4b42-8c30-83bb300b87a8', 'cars', '2 (2)', '2-(2).png', 'image/png', 'public', 'public', 201744, '[]', '[]', '[]', '[]', 1, '2023-08-03 15:51:40', '2023-08-03 15:51:40'),
(231, 'App\\Models\\Car', 53, '2fa7896e-b41e-4fd9-b61f-65c99ae4e6c5', 'cars', '1 (1)', '1-(1).png', 'image/png', 'public', 'public', 193154, '[]', '[]', '[]', '[]', 2, '2023-08-03 15:51:40', '2023-08-03 15:51:40'),
(232, 'App\\Models\\Car', 53, '35a33847-fcec-4a71-abab-42165875257c', 'cars-logo', 'WhatsApp-Image-2022-10-27-at-4.37.20-PM', 'WhatsApp-Image-2022-10-27-at-4.37.20-PM.jpeg', 'image/jpeg', 'public', 'public', 416521, '[]', '[]', '[]', '[]', 3, '2023-08-03 15:51:40', '2023-08-03 15:51:40'),
(235, 'App\\Models\\Car', 54, '8d760169-80d8-4f89-bd69-10ae370716ab', 'cars', 'IMG_20230703_141047_1', 'IMG_20230703_141047_1.jpg', 'image/jpeg', 'public', 'public', 145452, '[]', '[]', '[]', '[]', 1, '2023-08-03 16:07:18', '2023-08-03 16:07:18'),
(236, 'App\\Models\\Car', 54, '84000fbd-1369-42ab-9524-fee617241e2a', 'cars-logo', 'IMG_20230703_141047', 'IMG_20230703_141047.jpg', 'image/jpeg', 'public', 'public', 145649, '[]', '[]', '[]', '[]', 2, '2023-08-03 16:07:18', '2023-08-03 16:07:18'),
(237, 'App\\Models\\Car', 55, 'ef8a322c-bcaa-44c3-b3bb-5edd3dfa02ed', 'cars', 'IMG-20230803-WA0009', 'IMG-20230803-WA0009.jpg', 'image/jpeg', 'public', 'public', 87520, '[]', '[]', '[]', '[]', 1, '2023-08-03 16:26:38', '2023-08-03 16:26:38'),
(238, 'App\\Models\\Car', 55, '6b15299f-ddfe-43cb-a9a2-62897a116eed', 'cars', 'IMG-20230803-WA0010', 'IMG-20230803-WA0010.jpg', 'image/jpeg', 'public', 'public', 115381, '[]', '[]', '[]', '[]', 2, '2023-08-03 16:26:38', '2023-08-03 16:26:38'),
(239, 'App\\Models\\Car', 55, 'd096af3d-1034-4fcb-9eac-8b947e95bed4', 'cars', 'IMG-20230803-WA0012', 'IMG-20230803-WA0012.jpg', 'image/jpeg', 'public', 'public', 136478, '[]', '[]', '[]', '[]', 3, '2023-08-03 16:26:38', '2023-08-03 16:26:38'),
(240, 'App\\Models\\Car', 55, '5f5f65f5-d68d-4b71-a48a-05f7966f818d', 'cars', 'IMG-20230803-WA0013', 'IMG-20230803-WA0013.jpg', 'image/jpeg', 'public', 'public', 70404, '[]', '[]', '[]', '[]', 4, '2023-08-03 16:26:38', '2023-08-03 16:26:38'),
(241, 'App\\Models\\Car', 55, 'bd16bf16-41cb-46d4-90bb-0e770a77110c', 'cars-logo', 'IMG-20230803-WA0009', 'IMG-20230803-WA0009.jpg', 'image/jpeg', 'public', 'public', 87520, '[]', '[]', '[]', '[]', 5, '2023-08-03 16:26:38', '2023-08-03 16:26:38'),
(242, 'App\\Models\\Car', 56, '7ea55d23-5dba-48f8-81bc-7769f66f23a0', 'cars', '1', '1.png', 'image/png', 'public', 'public', 168991, '[]', '[]', '[]', '[]', 1, '2023-08-03 16:30:43', '2023-08-03 16:30:43'),
(243, 'App\\Models\\Car', 56, '68e6613e-5da6-423b-999d-297bf587886d', 'cars-logo', '1', '1.png', 'image/png', 'public', 'public', 168991, '[]', '[]', '[]', '[]', 2, '2023-08-03 16:30:43', '2023-08-03 16:30:43'),
(244, 'App\\Models\\Car', 57, '761ec9cf-9342-4d39-b7d1-42d28b8c7951', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 1, '2023-08-03 16:31:29', '2023-08-03 16:31:29'),
(245, 'App\\Models\\Car', 57, 'a4a92336-35f4-41d0-9895-6da1d4f2aa7c', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 2, '2023-08-03 16:31:29', '2023-08-03 16:31:29'),
(246, 'App\\Models\\Car', 57, '50fb3fab-3258-4b00-ba0b-e9e194209d8f', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 3, '2023-08-03 16:31:29', '2023-08-03 16:31:29'),
(247, 'App\\Models\\Car', 57, '063e0c96-923b-4710-aa05-927b3fe71309', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 4, '2023-08-03 16:31:29', '2023-08-03 16:31:29'),
(248, 'App\\Models\\Car', 57, '49356128-821b-440b-bea0-523ff6a0471a', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 5, '2023-08-03 16:31:29', '2023-08-03 16:31:29'),
(249, 'App\\Models\\Car', 57, 'cc45b587-ea6c-4da4-a76e-4efee65e5282', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 6, '2023-08-03 16:31:29', '2023-08-03 16:31:29'),
(250, 'App\\Models\\Car', 57, '662a3ac3-9f6c-4d8c-bcd2-ac0e99d1b50d', 'cars-logo', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 7, '2023-08-03 16:31:29', '2023-08-03 16:31:29'),
(252, 'App\\Models\\Car', 58, '2a794487-5f8b-4d6e-a90b-61763310e881', 'cars', 'IMG-20230803-WA0001', 'IMG-20230803-WA0001.jpg', 'image/jpeg', 'public', 'public', 78511, '[]', '[]', '[]', '[]', 1, '2023-08-03 20:56:53', '2023-08-03 20:56:53'),
(253, 'App\\Models\\Car', 58, '26d14454-0381-4038-b837-9775e6e62ae2', 'cars', 'IMG-20230803-WA0021', 'IMG-20230803-WA0021.jpg', 'image/jpeg', 'public', 'public', 91174, '[]', '[]', '[]', '[]', 2, '2023-08-03 20:56:53', '2023-08-03 20:56:53'),
(254, 'App\\Models\\Car', 58, '3f61861b-17e0-4a34-a345-9da14e0595ec', 'cars-logo', 'IMG-20230803-WA0020', 'IMG-20230803-WA0020.jpg', 'image/jpeg', 'public', 'public', 86098, '[]', '[]', '[]', '[]', 3, '2023-08-03 20:56:53', '2023-08-03 20:56:53'),
(255, 'App\\Models\\Car', 59, '323fcb55-f382-4b75-8c5f-e2c1d891b6f8', 'cars', 'Screenshot_2023-08-03-11-59-43-74_a23b203fd3aafc6dcb84e438dda678b6', 'Screenshot_2023-08-03-11-59-43-74_a23b203fd3aafc6dcb84e438dda678b6.jpg', 'image/jpeg', 'public', 'public', 202858, '[]', '[]', '[]', '[]', 1, '2023-08-04 00:47:20', '2023-08-04 00:47:20'),
(256, 'App\\Models\\Car', 59, '8ca4d427-edce-4d7b-97ce-70a8879a7f32', 'cars-logo', 'Screenshot_2023-08-03-11-59-43-74_a23b203fd3aafc6dcb84e438dda678b6', 'Screenshot_2023-08-03-11-59-43-74_a23b203fd3aafc6dcb84e438dda678b6.jpg', 'image/jpeg', 'public', 'public', 202858, '[]', '[]', '[]', '[]', 2, '2023-08-04 00:47:20', '2023-08-04 00:47:20');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(260, 'App\\Models\\Car', 60, 'c8ecbff8-9539-49f8-b435-5ff244af7208', 'cars', '4', '4.png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 1, '2023-08-04 18:59:20', '2023-08-04 18:59:20'),
(261, 'App\\Models\\Car', 60, '063ed2f6-e910-459a-a8cf-5922638ff6da', 'cars', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 2, '2023-08-04 18:59:20', '2023-08-04 18:59:20'),
(262, 'App\\Models\\Car', 60, '0286e6a3-d18e-4228-8bb4-5fd7df6588bb', 'cars-logo', 'crystal', 'crystal.png', 'image/png', 'public', 'public', 1653986, '[]', '[]', '[]', '[]', 3, '2023-08-04 18:59:20', '2023-08-04 18:59:20'),
(263, 'App\\Models\\Car', 61, '8cdc9b9a-e961-40fe-b9eb-8f8b00c064b0', 'cars', '4', '4.png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 1, '2023-08-04 21:09:26', '2023-08-04 21:09:26'),
(264, 'App\\Models\\Car', 61, '18cdd4ac-2a57-4243-b877-42909d6051ce', 'cars', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 2, '2023-08-04 21:09:26', '2023-08-04 21:09:26'),
(265, 'App\\Models\\Car', 61, '9c204f2a-8dd2-4b04-942c-930b6cad89cd', 'cars-logo', 'crystal', 'crystal.png', 'image/png', 'public', 'public', 1653986, '[]', '[]', '[]', '[]', 3, '2023-08-04 21:09:26', '2023-08-04 21:09:26'),
(266, 'App\\Models\\Car', 62, '4820c6cd-6a5c-4feb-8bf0-415449885326', 'cars', 'IMG-20230803-WA0069', 'IMG-20230803-WA0069.jpg', 'image/jpeg', 'public', 'public', 158266, '[]', '[]', '[]', '[]', 1, '2023-08-05 10:05:38', '2023-08-05 10:05:38'),
(267, 'App\\Models\\Car', 62, '2dfbd202-0f73-4f9c-96aa-a341c939de19', 'cars-logo', 'Automobile Screen', 'Automobile-Screen.png', 'image/png', 'public', 'public', 220774, '[]', '[]', '[]', '[]', 2, '2023-08-05 10:05:38', '2023-08-05 10:05:38'),
(268, 'App\\Models\\Car', 63, '955d05ed-7a88-48ba-8c9e-bbe60915f1a9', 'cars', 'Screenshot_20230805_101043', 'Screenshot_20230805_101043.png', 'image/png', 'public', 'public', 484156, '[]', '[]', '[]', '[]', 1, '2023-08-05 10:26:04', '2023-08-05 10:26:04'),
(269, 'App\\Models\\Car', 63, '5c702c32-c6e2-4a2a-a6d2-d76d4b1e7f0e', 'cars-logo', 'Screenshot_20230805_101043', 'Screenshot_20230805_101043.png', 'image/png', 'public', 'public', 484156, '[]', '[]', '[]', '[]', 2, '2023-08-05 10:26:04', '2023-08-05 10:26:04'),
(270, 'App\\Models\\CarReport', 50, '88d764b1-f8a6-422b-ba16-b538791d289d', 'car_reports', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-06 10:08:35', '2023-08-06 10:08:35'),
(271, 'App\\Models\\CarReport', 48, '9a59ec9c-3cee-48bb-8679-be5c2f118926', 'car_reports', 'Rear crank oil seal', 'Rear-crank-oil-seal.jpg', 'image/jpeg', 'public', 'public', 25706, '[]', '[]', '[]', '[]', 1, '2023-08-06 10:09:38', '2023-08-06 10:09:38'),
(273, 'App\\Models\\FeatureOption', 13, 'f97b87b1-9281-49f5-9f41-b779a51ad9d5', 'feature_options-icon', 'airbag', 'airbag.png', 'image/png', 'public', 'public', 21044, '[]', '[]', '[]', '[]', 1, '2023-08-06 10:15:36', '2023-08-06 10:15:36'),
(274, 'App\\Models\\FeatureOption', 14, 'f0e79a9e-a8e9-4b00-b56b-1f67f5603f4e', 'feature_options-icon', 'lock-padlock-symbol-for-security-interface', 'lock-padlock-symbol-for-security-interface.png', 'image/png', 'public', 'public', 16182, '[]', '[]', '[]', '[]', 1, '2023-08-06 10:17:38', '2023-08-06 10:17:38'),
(275, 'App\\Models\\FeatureOption', 15, '0830eb84-8155-4bec-ade0-2561ff1f737e', 'feature_options-icon', 'tire', 'tire.png', 'image/png', 'public', 'public', 47472, '[]', '[]', '[]', '[]', 1, '2023-08-06 10:18:39', '2023-08-06 10:18:39'),
(276, 'App\\Models\\FeatureOption', 12, 'c1b69f05-c699-43bd-b815-8acdca2190fb', 'feature_options-icon', 'safety-belt (1)', 'safety-belt-(1).png', 'image/png', 'public', 'public', 15311, '[]', '[]', '[]', '[]', 1, '2023-08-06 10:19:13', '2023-08-06 10:19:13'),
(282, 'App\\Models\\Car', 64, 'ae404629-a236-4616-aa06-7985c1f98eaf', 'cars-logo', 'WhatsApp Image 2023-08-03 at 12.17.47 (2)', 'WhatsApp-Image-2023-08-03-at-12.17.47-(2).jpeg', 'image/jpeg', 'public', 'public', 137948, '[]', '[]', '[]', '[]', 1, '2023-08-06 10:45:57', '2023-08-06 10:45:57'),
(283, 'App\\Models\\Car', 64, '1a3b2f1c-5764-451d-bda9-0cde313da17c', 'cars-door-1', 'WhatsApp Image 2023-08-03 at 12.17.47 (1)', 'WhatsApp-Image-2023-08-03-at-12.17.47-(1).jpeg', 'image/jpeg', 'public', 'public', 121431, '[]', '[]', '[]', '[]', 2, '2023-08-06 10:45:57', '2023-08-06 10:45:57'),
(284, 'App\\Models\\Car', 64, '754928ee-693c-4e3b-80d0-56a298b4918c', 'cars-door-2', 'WhatsApp Image 2023-08-03 at 12.17.47', 'WhatsApp-Image-2023-08-03-at-12.17.47.jpeg', 'image/jpeg', 'public', 'public', 131053, '[]', '[]', '[]', '[]', 3, '2023-08-06 10:45:57', '2023-08-06 10:45:57'),
(285, 'App\\Models\\Car', 64, '50fd6ae2-62be-4331-871d-8b1a1760ec78', 'cars-door-3', 'WhatsApp Image 2023-08-03 at 12.17.47 (2)', 'WhatsApp-Image-2023-08-03-at-12.17.47-(2).jpeg', 'image/jpeg', 'public', 'public', 137948, '[]', '[]', '[]', '[]', 4, '2023-08-06 10:45:57', '2023-08-06 10:45:57'),
(286, 'App\\Models\\Car', 64, '9c13548b-bf7e-4521-91af-e1d5aa22c9bc', 'cars-door-4', 'WhatsApp Image 2023-08-03 at 12.17.47', 'WhatsApp-Image-2023-08-03-at-12.17.47.jpeg', 'image/jpeg', 'public', 'public', 131053, '[]', '[]', '[]', '[]', 5, '2023-08-06 10:45:57', '2023-08-06 10:45:57'),
(287, 'App\\Models\\Car', 65, '2c341072-df09-43a1-aa16-eefa6a63b711', 'cars', 'download', 'download.jpg', 'image/jpeg', 'public', 'public', 8276, '[]', '[]', '[]', '[]', 1, '2023-08-06 11:19:53', '2023-08-06 11:19:53'),
(288, 'App\\Models\\Car', 65, '417e4767-aa16-4387-b8dd-6f75ebab3c78', 'cars-logo', 'download', 'download.jpg', 'image/jpeg', 'public', 'public', 8276, '[]', '[]', '[]', '[]', 2, '2023-08-06 11:19:53', '2023-08-06 11:19:53'),
(289, 'App\\Models\\CarReport', 51, '80bc21c6-430b-4a0e-a5d8-4a00949a4c90', 'car_reports', '2021-mercedes-benz-s-class-arabsauto-e1640148126862-pr4c91j1ic3dt4g6b9sa22ahxekh83225uswfofu6s', '2021-mercedes-benz-s-class-arabsauto-e1640148126862-pr4c91j1ic3dt4g6b9sa22ahxekh83225uswfofu6s.jpg', 'image/jpeg', 'public', 'public', 59413, '[]', '[]', '[]', '[]', 1, '2023-08-06 13:02:43', '2023-08-06 13:02:43'),
(290, 'App\\Models\\CarReport', 52, '934be59f-fc19-4cbc-ba2f-0c519f76fa69', 'car_reports', 'safety-belt (1)', 'safety-belt-(1).png', 'image/png', 'public', 'public', 15311, '[]', '[]', '[]', '[]', 1, '2023-08-06 13:02:43', '2023-08-06 13:02:43'),
(291, 'App\\Models\\CarReport', 53, '20f8022b-5371-424a-84a8-41d942b7848f', 'car_reports', 'tire', 'tire.png', 'image/png', 'public', 'public', 47472, '[]', '[]', '[]', '[]', 1, '2023-08-06 13:02:43', '2023-08-06 13:02:43'),
(293, 'App\\Models\\Car', 66, '1d8c5484-b37a-42c1-adaa-30925ebaa8f7', 'cars-logo', '59624620_101', '59624620_101.jpg', 'image/jpeg', 'public', 'public', 55914, '[]', '[]', '[]', '[]', 1, '2023-08-06 14:09:52', '2023-08-06 14:09:52'),
(294, 'App\\Models\\Car', 66, '1f5b846a-d0cf-41d8-b1c2-bdb7271fa165', 'cars-door-1', '59624620_101', '59624620_101.jpg', 'image/jpeg', 'public', 'public', 55914, '[]', '[]', '[]', '[]', 2, '2023-08-06 14:09:52', '2023-08-06 14:09:52'),
(295, 'App\\Models\\Car', 66, '383e3126-8641-4904-b8af-2aa19c9ea04f', 'cars-door-2', '59624620_101', '59624620_101.jpg', 'image/jpeg', 'public', 'public', 55914, '[]', '[]', '[]', '[]', 3, '2023-08-06 14:09:52', '2023-08-06 14:09:52'),
(296, 'App\\Models\\Car', 66, '081dde1c-d082-47e1-87c4-be1abc7d11b6', 'cars-door-3', '59624620_101', '59624620_101.jpg', 'image/jpeg', 'public', 'public', 55914, '[]', '[]', '[]', '[]', 4, '2023-08-06 14:09:52', '2023-08-06 14:09:52'),
(297, 'App\\Models\\Car', 66, '1dfdb8d1-989c-4157-a702-d2d3b61ca080', 'cars-door-4', '59624620_101', '59624620_101.jpg', 'image/jpeg', 'public', 'public', 55914, '[]', '[]', '[]', '[]', 5, '2023-08-06 14:09:52', '2023-08-06 14:09:52'),
(300, 'App\\Models\\ReportOption', 6, '6b0231d1-628d-4c9b-922b-83ebb403a2d6', 'report_options-icon', 'crank-arm', 'crank-arm.png', 'image/png', 'public', 'public', 25722, '[]', '[]', '[]', '[]', 1, '2023-08-06 14:46:57', '2023-08-06 14:46:57'),
(301, 'App\\Models\\ReportOption', 12, '913ea323-b8f6-405a-ba7d-e5f08d00205e', 'report_options-icon', 'car-battery', 'car-battery.png', 'image/png', 'public', 'public', 8800, '[]', '[]', '[]', '[]', 1, '2023-08-06 14:47:28', '2023-08-06 14:47:28'),
(307, 'App\\Models\\CarReport', 61, 'f75b400f-19ba-4527-bba0-ca7234708864', 'car_reports', 'two-arrows', 'two-arrows.png', 'image/png', 'public', 'public', 15741, '[]', '[]', '[]', '[]', 1, '2023-08-06 15:22:37', '2023-08-06 15:22:37'),
(312, 'App\\Models\\Car', 68, 'd53c4e19-7922-4f02-8c32-9633c317607b', 'cars', 'download', 'download.jpg', 'image/jpeg', 'public', 'public', 8276, '[]', '[]', '[]', '[]', 1, '2023-08-07 11:07:08', '2023-08-07 11:07:08'),
(313, 'App\\Models\\Car', 68, 'afc1e96c-a926-486f-8d2b-5ce0f098f5e5', 'cars-logo', 'download', 'download.jpg', 'image/jpeg', 'public', 'public', 8276, '[]', '[]', '[]', '[]', 2, '2023-08-07 11:07:08', '2023-08-07 11:07:08'),
(314, 'App\\Models\\Car', 69, '4418bbe6-95f6-4741-9f74-68bfad91a457', 'cars', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 6440, '[]', '[]', '[]', '[]', 1, '2023-08-07 15:44:19', '2023-08-07 15:44:19'),
(315, 'App\\Models\\Car', 69, '347f8236-c5fd-4c27-8509-edb817bbd0c8', 'cars-logo', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 6440, '[]', '[]', '[]', '[]', 2, '2023-08-07 15:44:19', '2023-08-07 15:44:19'),
(316, 'App\\Models\\Car', 70, 'a0270d4d-bfc6-4054-b653-6e31944ad9b7', 'cars', 'Screenshot_20230807_124756_Chrome', 'Screenshot_20230807_124756_Chrome.png', 'image/png', 'public', 'public', 75885, '[]', '[]', '[]', '[]', 1, '2023-08-07 17:47:50', '2023-08-07 17:47:50'),
(317, 'App\\Models\\Car', 70, 'ca3b8fe5-4ec1-4ddc-b954-4a32ae56c3fb', 'cars-logo', 'Screenshot_20230807_124756_Chrome', 'Screenshot_20230807_124756_Chrome.png', 'image/png', 'public', 'public', 75885, '[]', '[]', '[]', '[]', 2, '2023-08-07 17:47:50', '2023-08-07 17:47:50'),
(318, 'App\\Models\\Brand', 7, 'd0ac9d28-5107-4247-8de0-919cd5558f16', 'brands', '1665931065', '1665931065.jpg', 'image/jpeg', 'public', 'public', 1713, '[]', '[]', '[]', '[]', 1, '2023-08-08 10:59:08', '2023-08-08 10:59:08'),
(319, 'App\\Models\\Brand', 8, '831d7bf6-8263-4450-bcbf-ab4a3c7969c4', 'brands', '1665931126', '1665931126.png', 'image/png', 'public', 'public', 5187, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:03:46', '2023-08-08 11:03:46'),
(320, 'App\\Models\\Brand', 9, 'c0975d6f-8aa3-4a24-9f88-29955d24aebd', 'brands', '1665931174', '1665931174.png', 'image/png', 'public', 'public', 4971, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:07:44', '2023-08-08 11:07:44'),
(321, 'App\\Models\\Brand', 10, '4630d4f7-5043-44c0-80fd-29056e2aa1cc', 'brands', '1665931225', '1665931225.png', 'image/png', 'public', 'public', 4287, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:08:09', '2023-08-08 11:08:09'),
(322, 'App\\Models\\Brand', 11, 'ae0407fa-dd24-417d-9af0-b49c55080928', 'brands', '1665931382', '1665931382.png', 'image/png', 'public', 'public', 2640, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:08:29', '2023-08-08 11:08:29'),
(323, 'App\\Models\\Brand', 12, 'da40ad1a-1f6c-4c1a-81e9-0e57e616aacf', 'brands', '1665931426', '1665931426.png', 'image/png', 'public', 'public', 3585, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:08:56', '2023-08-08 11:08:56'),
(324, 'App\\Models\\Brand', 13, '0afb5ba6-ffe9-49b8-84fa-e4433fe2360c', 'brands', '1665931498', '1665931498.jpg', 'image/jpeg', 'public', 'public', 1154, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:09:18', '2023-08-08 11:09:18'),
(325, 'App\\Models\\Brand', 14, '49432804-dd9f-4303-aa22-655907f95440', 'brands', '1665931540', '1665931540.jpg', 'image/jpeg', 'public', 'public', 1377, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:09:36', '2023-08-08 11:09:36'),
(326, 'App\\Models\\Brand', 15, 'c7e2d5eb-b968-4d15-944f-4089616b739f', 'brands', '1665931582', '1665931582.png', 'image/png', 'public', 'public', 4226, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:09:57', '2023-08-08 11:09:57'),
(327, 'App\\Models\\Brand', 16, '9fd6e03d-1826-44a0-8fbb-f400c115cd16', 'brands', '1665931657', '1665931657.jpg', 'image/jpeg', 'public', 'public', 1257, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:10:19', '2023-08-08 11:10:19'),
(328, 'App\\Models\\Brand', 17, 'de9fcde5-1386-4a82-bc2e-63e5f2ca035d', 'brands', '1665931712', '1665931712.png', 'image/png', 'public', 'public', 2872, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:10:40', '2023-08-08 11:10:40'),
(329, 'App\\Models\\Brand', 18, '6a206191-1edf-4ba9-85d1-7f1b08f3743d', 'brands', '1665931753', '1665931753.png', 'image/png', 'public', 'public', 5311, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:11:02', '2023-08-08 11:11:02'),
(330, 'App\\Models\\Brand', 19, '23f34d9a-a5fc-4860-b1d4-f267d58f5e26', 'brands', '1665933898', '1665933898.png', 'image/png', 'public', 'public', 2983, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:11:22', '2023-08-08 11:11:22'),
(331, 'App\\Models\\Brand', 20, 'b30eaeae-ebfe-49d4-ae4f-008f546fd42d', 'brands', '1674994184', '1674994184.webp', 'image/webp', 'public', 'public', 996, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:11:55', '2023-08-08 11:11:55'),
(332, 'App\\Models\\Brand', 21, '03beaec0-c8e8-432e-a757-a9eb221f13ff', 'brands', '1665931803', '1665931803.png', 'image/png', 'public', 'public', 2244, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:12:14', '2023-08-08 11:12:14'),
(333, 'App\\Models\\Brand', 22, '836315da-0786-4724-ac58-aec2ce430ae3', 'brands', '1665931870', '1665931870.png', 'image/png', 'public', 'public', 5769, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:12:33', '2023-08-08 11:12:33'),
(334, 'App\\Models\\Brand', 23, '8a1611c0-ca83-44d0-a67e-dbf51199c40d', 'brands', '1665931993', '1665931993.png', 'image/png', 'public', 'public', 5534, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:12:54', '2023-08-08 11:12:54'),
(335, 'App\\Models\\Brand', 24, 'fd522c5f-f770-4be7-a778-f4cd7f411183', 'brands', '1665932046', '1665932046.jpg', 'image/jpeg', 'public', 'public', 1660, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:13:18', '2023-08-08 11:13:18'),
(336, 'App\\Models\\Brand', 25, 'b4a75929-fe7b-40bb-ad36-51d22e542907', 'brands', '1665932141', '1665932141.png', 'image/png', 'public', 'public', 4210, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:13:40', '2023-08-08 11:13:40'),
(337, 'App\\Models\\Brand', 26, '367f4ff6-6df0-4f08-a732-ae99880780b4', 'brands', '1665934846', '1665934846.png', 'image/png', 'public', 'public', 4198, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:14:34', '2023-08-08 11:14:34'),
(338, 'App\\Models\\Brand', 27, '39474076-2a82-4b18-a2e6-e7a9d9dae629', 'brands', '1665934879', '1665934879.png', 'image/png', 'public', 'public', 11697, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:14:51', '2023-08-08 11:14:51'),
(339, 'App\\Models\\Brand', 28, '5b16dd35-e67a-4e6c-8618-597d7f64e926', 'brands', '1665934911', '1665934911.png', 'image/png', 'public', 'public', 2593, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:15:13', '2023-08-08 11:15:13'),
(340, 'App\\Models\\Brand', 29, '070b4f43-1357-4b29-9965-03cfadccd202', 'brands', '1665935112', '1665935112.png', 'image/png', 'public', 'public', 4936, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:15:32', '2023-08-08 11:15:32'),
(341, 'App\\Models\\Brand', 30, '04386b96-1479-45aa-957b-00b8ba6cbb36', 'brands', '1665935147', '1665935147.png', 'image/png', 'public', 'public', 8390, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:16:02', '2023-08-08 11:16:02'),
(342, 'App\\Models\\Brand', 31, '901e55a4-3cce-4c41-a046-d71780d442de', 'brands', '1665935178', '1665935178.png', 'image/png', 'public', 'public', 758, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:16:22', '2023-08-08 11:16:22'),
(343, 'App\\Models\\Brand', 32, '982ce51f-a6de-4a67-acd2-aba4d007e244', 'brands', '1665935213', '1665935213.png', 'image/png', 'public', 'public', 5485, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:16:44', '2023-08-08 11:16:44'),
(344, 'App\\Models\\Brand', 33, 'd09b9f74-c7df-43f3-ae46-9ac23ad8609b', 'brands', '1665935254', '1665935254.png', 'image/png', 'public', 'public', 5400, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:17:06', '2023-08-08 11:17:06'),
(345, 'App\\Models\\Brand', 34, 'edfaaf04-f2ed-473a-a41b-ade4040fe795', 'brands', '1665935286', '1665935286.png', 'image/png', 'public', 'public', 1561, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:17:23', '2023-08-08 11:17:23'),
(346, 'App\\Models\\Brand', 35, 'b01bc7d7-4199-4e34-acf0-f8758ff58995', 'brands', '1665935320', '1665935320.png', 'image/png', 'public', 'public', 4044, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:17:48', '2023-08-08 11:17:48'),
(347, 'App\\Models\\Brand', 36, '27252c80-ab5d-4e75-a433-af9c1fc101d8', 'brands', '1665935422', '1665935422.jpg', 'image/jpeg', 'public', 'public', 1375, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:19:23', '2023-08-08 11:19:23'),
(348, 'App\\Models\\Brand', 37, 'fe1b84b6-f86b-43c5-b23e-f22bf35b7d03', 'brands', '1665935462', '1665935462.png', 'image/png', 'public', 'public', 4525, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:19:47', '2023-08-08 11:19:47'),
(349, 'App\\Models\\Brand', 38, '130649bb-d74c-4828-ba63-786873428c23', 'brands', '1665935512', '1665935512.png', 'image/png', 'public', 'public', 2395, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:20:12', '2023-08-08 11:20:12'),
(350, 'App\\Models\\Brand', 39, 'b7523d5b-1e3b-42fc-b8b7-9f3911af336e', 'brands', '1665935661', '1665935661.jpg', 'image/jpeg', 'public', 'public', 1315, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:20:29', '2023-08-08 11:20:29'),
(351, 'App\\Models\\Brand', 40, '80a9ba5b-6afa-4942-aa6b-3dcf2bca42ba', 'brands', '1665935721', '1665935721.jpg', 'image/jpeg', 'public', 'public', 1260, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:20:53', '2023-08-08 11:20:53'),
(352, 'App\\Models\\Brand', 41, '87144bf1-b42a-4b4b-a312-25a98c50daba', 'brands', '1665935757', '1665935757.png', 'image/png', 'public', 'public', 8979, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:21:13', '2023-08-08 11:21:13'),
(353, 'App\\Models\\Brand', 42, 'f7d37c45-168f-4a95-af6f-643dfbe97cfe', 'brands', '1665935790', '1665935790.jpg', 'image/jpeg', 'public', 'public', 1622, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:21:34', '2023-08-08 11:21:34'),
(354, 'App\\Models\\Brand', 43, '96c87081-1dce-478c-9980-b69441ad1eb0', 'brands', '1665935829', '1665935829.jpg', 'image/jpeg', 'public', 'public', 1774, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:21:52', '2023-08-08 11:21:52'),
(355, 'App\\Models\\Brand', 44, 'c5827605-be9c-4347-b87c-6a1d6f545196', 'brands', 'logo-nav', 'logo-nav.png', 'image/png', 'public', 'public', 12170, '[]', '[]', '[]', '[]', 1, '2023-08-08 11:22:24', '2023-08-08 11:22:24'),
(356, 'App\\Models\\Car', 71, '3b14460f-bb58-40cc-8b92-fd288cccf71f', 'cars', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 6440, '[]', '[]', '[]', '[]', 1, '2023-08-08 15:33:44', '2023-08-08 15:33:44'),
(357, 'App\\Models\\Car', 71, 'b25d3317-67f8-4532-8e0c-24aa1f4da3e1', 'cars-logo', 'download', 'download.jpeg', 'image/jpeg', 'public', 'public', 6440, '[]', '[]', '[]', '[]', 2, '2023-08-08 15:33:44', '2023-08-08 15:33:44'),
(358, 'App\\Models\\Car', 72, 'a5f700f9-0240-4627-b9da-59e299aa3a3d', 'cars-logo', 'blue-sport-sedan-parked-yard', 'blue-sport-sedan-parked-yard.jpg', 'image/jpeg', 'public', 'public', 14600349, '[]', '[]', '[]', '[]', 1, '2023-08-08 17:11:54', '2023-08-08 17:11:54'),
(359, 'App\\Models\\Car', 72, '9ab53c28-9824-4322-ab00-b7b3abdba9bd', 'cars-door-1', '59624620_101', '59624620_101.jpg', 'image/jpeg', 'public', 'public', 55914, '[]', '[]', '[]', '[]', 2, '2023-08-08 17:11:54', '2023-08-08 17:11:54'),
(360, 'App\\Models\\Car', 72, 'e60ec5f1-9b7f-43ab-9d57-e318db377a70', 'cars-door-2', '59624620_101', '59624620_101.jpg', 'image/jpeg', 'public', 'public', 55914, '[]', '[]', '[]', '[]', 3, '2023-08-08 17:11:54', '2023-08-08 17:11:54'),
(361, 'App\\Models\\Car', 72, 'f9b2e19d-f351-4ff4-b887-d940a5d9d3d8', 'cars-door-3', '59624620_101', '59624620_101.jpg', 'image/jpeg', 'public', 'public', 55914, '[]', '[]', '[]', '[]', 4, '2023-08-08 17:11:54', '2023-08-08 17:11:54'),
(362, 'App\\Models\\Car', 72, 'ff8ff9b7-ef9a-4880-b425-1cdb8bb2f129', 'cars-door-4', '59624620_101', '59624620_101.jpg', 'image/jpeg', 'public', 'public', 55914, '[]', '[]', '[]', '[]', 5, '2023-08-08 17:11:54', '2023-08-08 17:11:54'),
(363, 'App\\Models\\CarReport', 63, '12aa53b6-4ee4-48a1-919d-e4a3aa9803f1', 'car_reports', 'logo-nav', 'logo-nav.png', 'image/png', 'public', 'public', 12170, '[]', '[]', '[]', '[]', 1, '2023-08-08 17:12:40', '2023-08-08 17:12:40'),
(364, 'App\\Models\\Car', 73, '09465fac-71b6-4478-bb5c-8ac493a643e8', 'cars-logo', '59624620_101', '59624620_101.jpg', 'image/jpeg', 'public', 'public', 55914, '[]', '[]', '[]', '[]', 1, '2023-08-08 17:17:32', '2023-08-08 17:17:32'),
(365, 'App\\Models\\Car', 73, '54e36de7-a757-4edb-a3e8-77bc05aa880c', 'cars-door-1', '2021-mercedes-benz-s-class-arabsauto-e1640148126862-pr4c91j1ic3dt4g6b9sa22ahxekh83225uswfofu6s', '2021-mercedes-benz-s-class-arabsauto-e1640148126862-pr4c91j1ic3dt4g6b9sa22ahxekh83225uswfofu6s.jpg', 'image/jpeg', 'public', 'public', 59413, '[]', '[]', '[]', '[]', 2, '2023-08-08 17:17:32', '2023-08-08 17:17:32'),
(366, 'App\\Models\\Car', 73, 'c5a3d1a3-2f6c-4e04-bac3-aa498974be92', 'cars-door-2', 'images (4)', 'images-(4).jpeg', 'image/jpeg', 'public', 'public', 11576, '[]', '[]', '[]', '[]', 3, '2023-08-08 17:17:32', '2023-08-08 17:17:32'),
(367, 'App\\Models\\Car', 73, 'bfea12db-64b0-4fbb-bb03-70cf7063382f', 'cars-door-3', '1665935286', '1665935286.png', 'image/png', 'public', 'public', 1561, '[]', '[]', '[]', '[]', 4, '2023-08-08 17:17:32', '2023-08-08 17:17:32'),
(368, 'App\\Models\\Car', 73, '44a99e41-4f59-4d93-85d8-15990b3cbade', 'cars-door-4', '1665935286', '1665935286.png', 'image/png', 'public', 'public', 1561, '[]', '[]', '[]', '[]', 5, '2023-08-08 17:17:33', '2023-08-08 17:17:33'),
(369, 'App\\Models\\CarReport', 72, 'edeab0fd-e2a5-465c-a655-1467391bbdc8', 'car_reports', '1665935462', '1665935462.png', 'image/png', 'public', 'public', 4525, '[]', '[]', '[]', '[]', 1, '2023-08-08 17:18:06', '2023-08-08 17:18:06'),
(370, 'App\\Models\\Car', 74, '6f4f696d-5688-47d5-87b4-3e9270b6ae2f', 'cars', 'IMG-20230803-WA0009', 'IMG-20230803-WA0009.jpg', 'image/jpeg', 'public', 'public', 87520, '[]', '[]', '[]', '[]', 1, '2023-08-08 17:19:22', '2023-08-08 17:19:22'),
(371, 'App\\Models\\Car', 74, 'f20418fb-5f6e-43cc-8ad8-52b6124d59ab', 'cars-logo', 'IMG-20230803-WA0009', 'IMG-20230803-WA0009.jpg', 'image/jpeg', 'public', 'public', 87520, '[]', '[]', '[]', '[]', 2, '2023-08-08 17:19:22', '2023-08-08 17:19:22'),
(372, 'App\\Models\\Car', 75, '5eed660b-fcc2-4b6d-b79b-9623e1825f7f', 'cars', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 1, '2023-08-08 17:34:23', '2023-08-08 17:34:23'),
(373, 'App\\Models\\Car', 75, '978b209e-f320-4d97-a5d3-5d80c5361398', 'cars-logo', 'images (1)', 'images-(1).jpg', 'image/jpeg', 'public', 'public', 11389, '[]', '[]', '[]', '[]', 2, '2023-08-08 17:34:23', '2023-08-08 17:34:23'),
(374, 'App\\Models\\Car', 76, '8da9d831-4b9f-4ca8-98f1-ba8756e5e795', 'cars', 'flag', 'flag.png', 'image/png', 'public', 'public', 16838, '[]', '[]', '[]', '[]', 1, '2023-08-08 18:13:14', '2023-08-08 18:13:14'),
(375, 'App\\Models\\Car', 76, '0bfa9ae9-bcb9-4529-a314-87eaf6dda1ef', 'cars-logo', 'flag', 'flag.png', 'image/png', 'public', 'public', 16838, '[]', '[]', '[]', '[]', 2, '2023-08-08 18:13:14', '2023-08-08 18:13:14'),
(378, 'App\\Models\\Car', 77, '105b4587-856e-4495-ba91-a7043a3f6c19', 'cars', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 1, '2023-08-09 16:18:41', '2023-08-09 16:18:41'),
(379, 'App\\Models\\Car', 77, 'd54588c3-6d94-43ca-88aa-69553cb17bde', 'cars-logo', 'images (1)', 'images-(1).jpg', 'image/jpeg', 'public', 'public', 11389, '[]', '[]', '[]', '[]', 2, '2023-08-09 16:18:41', '2023-08-09 16:18:41'),
(380, 'App\\Models\\Car', 75, 'afa9659b-e07d-4117-a1ec-6e9d5345c98b', 'cars-logo', 'images (1)', 'images-(1).jpg', 'image/jpeg', 'public', 'public', 11389, '[]', '[]', '[]', '[]', 3, '2023-08-09 16:35:56', '2023-08-09 16:35:56'),
(381, 'App\\Models\\Car', 75, 'da8cd130-c9a1-4f9e-8f79-8470c1ba4264', 'cars', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 4, '2023-08-09 16:35:56', '2023-08-09 16:35:56'),
(382, 'App\\Models\\Brand', 45, 'c21d83c3-1a21-4910-9743-8e2b2b58b883', 'brands', 'Mercedes-Benz_Star_2022.svg', 'Mercedes-Benz_Star_2022.svg.png', 'image/png', 'public', 'public', 184493, '[]', '[]', '[]', '[]', 1, '2023-08-09 19:12:13', '2023-08-09 19:12:13'),
(384, 'App\\Models\\Car', 78, '420872c3-84bb-47a1-aa91-9550cab68dc2', 'cars', 'IMG-20230803-WA0012', 'IMG-20230803-WA0012.jpg', 'image/jpeg', 'public', 'public', 136478, '[]', '[]', '[]', '[]', 1, '2023-08-09 19:40:57', '2023-08-09 19:40:57'),
(385, 'App\\Models\\Car', 78, '388f4301-4b2b-4749-8ca2-f47135421ecd', 'cars-logo', 'IMG-20230803-WA0009', 'IMG-20230803-WA0009.jpg', 'image/jpeg', 'public', 'public', 87520, '[]', '[]', '[]', '[]', 2, '2023-08-09 19:40:57', '2023-08-09 19:40:57'),
(387, 'App\\Models\\Car', 79, 'ba66741a-cadd-4704-92bb-a87adb17fd0e', 'cars', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 1, '2023-08-10 11:54:27', '2023-08-10 11:54:27'),
(388, 'App\\Models\\Car', 79, '851d140b-6a08-436a-884d-7ec119f359bc', 'cars', 'images (1)', 'images-(1).jpg', 'image/jpeg', 'public', 'public', 11389, '[]', '[]', '[]', '[]', 2, '2023-08-10 11:54:27', '2023-08-10 11:54:27'),
(389, 'App\\Models\\Car', 79, 'd9a5c3a1-b804-4c04-a417-a72bc895daa0', 'cars-logo', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 3, '2023-08-10 11:54:27', '2023-08-10 11:54:27'),
(390, 'App\\Models\\Car', 80, 'bfba3d2e-8e8a-4e79-9acc-4bbf4e74854d', 'cars', 'Screenshot_20230723-010754_Instagram', 'Screenshot_20230723-010754_Instagram.jpg', 'image/jpeg', 'public', 'public', 240967, '[]', '[]', '[]', '[]', 1, '2023-08-10 13:02:44', '2023-08-10 13:02:44'),
(391, 'App\\Models\\Car', 80, 'ae406670-d268-4f17-ab18-1aecba8c7307', 'cars-logo', 'Screenshot_20230723-010754_Instagram', 'Screenshot_20230723-010754_Instagram.jpg', 'image/jpeg', 'public', 'public', 240967, '[]', '[]', '[]', '[]', 2, '2023-08-10 13:02:44', '2023-08-10 13:02:44'),
(392, 'App\\Models\\Car', 81, '6c26f641-5e4e-4a5a-a170-4a0d9be75466', 'cars', 'Screenshot_20230810-130236', 'Screenshot_20230810-130236.jpg', 'image/jpeg', 'public', 'public', 276989, '[]', '[]', '[]', '[]', 1, '2023-08-10 13:08:38', '2023-08-10 13:08:38'),
(393, 'App\\Models\\Car', 81, '43e40e4c-b471-47bc-9deb-0edbaa0b3d22', 'cars', 'Screenshot_20230810-130236', 'Screenshot_20230810-130236.jpg', 'image/jpeg', 'public', 'public', 276989, '[]', '[]', '[]', '[]', 2, '2023-08-10 13:08:38', '2023-08-10 13:08:38'),
(394, 'App\\Models\\Car', 81, '798820f2-9e90-4c2a-9d45-9a9a39e6bbb2', 'cars', 'Screenshot_20230810-130236', 'Screenshot_20230810-130236.jpg', 'image/jpeg', 'public', 'public', 276989, '[]', '[]', '[]', '[]', 3, '2023-08-10 13:08:38', '2023-08-10 13:08:38'),
(395, 'App\\Models\\Car', 81, '6047cb1e-c645-4265-a573-0363f001824b', 'cars', 'Screenshot_20230723-010754_Instagram', 'Screenshot_20230723-010754_Instagram.jpg', 'image/jpeg', 'public', 'public', 240967, '[]', '[]', '[]', '[]', 4, '2023-08-10 13:08:38', '2023-08-10 13:08:38'),
(396, 'App\\Models\\Car', 81, 'a4b6ff34-6ae6-487e-a54c-996bd7900017', 'cars-logo', 'Screenshot_20230810-130236', 'Screenshot_20230810-130236.jpg', 'image/jpeg', 'public', 'public', 276989, '[]', '[]', '[]', '[]', 5, '2023-08-10 13:08:38', '2023-08-10 13:08:38'),
(397, 'App\\Models\\Car', 82, '862ac46e-0003-4825-b151-7e0779a89f2d', 'cars', 'Screenshot_20230810-133533', 'Screenshot_20230810-133533.jpg', 'image/jpeg', 'public', 'public', 342584, '[]', '[]', '[]', '[]', 1, '2023-08-10 15:31:41', '2023-08-10 15:31:41'),
(398, 'App\\Models\\Car', 82, 'e7d43b29-0268-4537-9f84-e13a6d0b0560', 'cars-logo', 'Screenshot_20230810-144118', 'Screenshot_20230810-144118.jpg', 'image/jpeg', 'public', 'public', 171547, '[]', '[]', '[]', '[]', 2, '2023-08-10 15:31:41', '2023-08-10 15:31:41'),
(400, 'App\\Models\\Car', 83, 'aa7ce447-5d41-4eaa-a281-21833d57a234', 'cars', 'images (1)', 'images-(1).jpg', 'image/jpeg', 'public', 'public', 11389, '[]', '[]', '[]', '[]', 1, '2023-08-10 18:36:41', '2023-08-10 18:36:41'),
(401, 'App\\Models\\Car', 83, 'd75020d6-32c0-4c12-8420-607c616be8cd', 'cars-logo', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 2, '2023-08-10 18:36:41', '2023-08-10 18:36:41'),
(402, 'App\\Models\\Car', 84, '74bbbf1e-5e99-428a-bd13-58f88b525b64', 'cars', 'images (1)', 'images-(1).jpg', 'image/jpeg', 'public', 'public', 11389, '[]', '[]', '[]', '[]', 1, '2023-08-10 18:38:14', '2023-08-10 18:38:14'),
(403, 'App\\Models\\Car', 84, 'b5ed9722-833d-457c-857f-b85bba21163a', 'cars-logo', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 2, '2023-08-10 18:38:14', '2023-08-10 18:38:14'),
(404, 'App\\Models\\Car', 85, 'e5e8d235-3aaf-4d1c-a0b6-61cf49c0edd0', 'cars', 'images (1)', 'images-(1).jpg', 'image/jpeg', 'public', 'public', 11389, '[]', '[]', '[]', '[]', 1, '2023-08-10 18:39:39', '2023-08-10 18:39:39'),
(405, 'App\\Models\\Car', 85, 'a14eaa38-c9d2-47bb-b67a-19590c02bc6a', 'cars-logo', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 2, '2023-08-10 18:39:39', '2023-08-10 18:39:39'),
(406, 'App\\Models\\Car', 86, '85629984-a4ba-411b-81f2-10726485fd97', 'cars', 'images (1)', 'images-(1).jpg', 'image/jpeg', 'public', 'public', 11389, '[]', '[]', '[]', '[]', 1, '2023-08-10 18:41:07', '2023-08-10 18:41:07'),
(407, 'App\\Models\\Car', 86, '2b7dfeeb-9c92-467b-a4e9-1cae24123948', 'cars-logo', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 2, '2023-08-10 18:41:07', '2023-08-10 18:41:07'),
(408, 'App\\Models\\Car', 87, '796c7e67-ecd8-4595-81a2-b1e7ea2e1593', 'cars', 'Screenshot_20230810-154025', 'Screenshot_20230810-154025.jpg', 'image/jpeg', 'public', 'public', 315319, '[]', '[]', '[]', '[]', 1, '2023-08-10 19:25:33', '2023-08-10 19:25:33'),
(409, 'App\\Models\\Car', 87, 'e2e4aed5-1404-43f5-be29-5a79d54b4394', 'cars-logo', 'Screenshot_20230810-144118', 'Screenshot_20230810-144118.jpg', 'image/jpeg', 'public', 'public', 171547, '[]', '[]', '[]', '[]', 2, '2023-08-10 19:25:33', '2023-08-10 19:25:33'),
(414, 'App\\Models\\Car', 88, 'f77c70f8-4395-4522-95fb-c55f3fd89dbc', 'cars', 'Screenshot_20230813-123831', 'Screenshot_20230813-123831.jpg', 'image/jpeg', 'public', 'public', 180090, '[]', '[]', '[]', '[]', 1, '2023-08-13 12:43:55', '2023-08-13 12:43:55'),
(415, 'App\\Models\\Car', 88, '457e920c-10e5-40eb-97d9-6f2f0c12c387', 'cars-logo', 'Screenshot_20230813-124037', 'Screenshot_20230813-124037.jpg', 'image/jpeg', 'public', 'public', 187873, '[]', '[]', '[]', '[]', 2, '2023-08-13 12:43:55', '2023-08-13 12:43:55'),
(416, 'App\\Models\\Car', 89, '367926fa-b675-436e-8279-22bcaa14a957', 'cars', 'images (1)', 'images-(1).jpg', 'image/jpeg', 'public', 'public', 11389, '[]', '[]', '[]', '[]', 1, '2023-08-13 12:44:46', '2023-08-13 12:44:46'),
(417, 'App\\Models\\Car', 89, 'f0f0d8b3-4d27-4d1c-b147-54819bc6e52b', 'cars', 'images (1)', 'images-(1).jpg', 'image/jpeg', 'public', 'public', 11389, '[]', '[]', '[]', '[]', 2, '2023-08-13 12:44:46', '2023-08-13 12:44:46'),
(418, 'App\\Models\\Car', 89, 'c7a39a88-2063-4a2c-bef7-c357afba7bed', 'cars-logo', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 3, '2023-08-13 12:44:46', '2023-08-13 12:44:46'),
(435, 'App\\Models\\User', 18, '6e71d536-31f2-4e6c-b63e-3ef2a19e3d7a', 'users-logo', 'IMG-20230813-WA0013', 'IMG-20230813-WA0013.jpg', 'image/jpeg', 'public', 'public', 114190, '[]', '[]', '[]', '[]', 1, '2023-08-13 18:08:47', '2023-08-13 18:08:47'),
(436, 'App\\Models\\Car', 90, '853e2d59-f2bb-48c8-92f5-bdafe7d35eaf', 'cars', 'Screenshot_20230813-152600', 'Screenshot_20230813-152600.jpg', 'image/jpeg', 'public', 'public', 169089, '[]', '[]', '[]', '[]', 1, '2023-08-13 18:10:45', '2023-08-13 18:10:45'),
(437, 'App\\Models\\Car', 90, '1a45127a-1cb4-4c0b-be38-1aead6956163', 'cars-logo', 'Screenshot_20230813-173353', 'Screenshot_20230813-173353.jpg', 'image/jpeg', 'public', 'public', 304464, '[]', '[]', '[]', '[]', 2, '2023-08-13 18:10:45', '2023-08-13 18:10:45'),
(439, 'App\\Models\\Car', 91, '1bfbec66-7db3-4270-893f-61bded395ff4', 'cars', 'Screenshot_20230813-152720', 'Screenshot_20230813-152720.jpg', 'image/jpeg', 'public', 'public', 201881, '[]', '[]', '[]', '[]', 1, '2023-08-14 12:51:49', '2023-08-14 12:51:49'),
(440, 'App\\Models\\Car', 91, '1a1e67ca-d144-4a2f-9e00-180b847ebe2b', 'cars-logo', 'Screenshot_20230814-112213', 'Screenshot_20230814-112213.jpg', 'image/jpeg', 'public', 'public', 153852, '[]', '[]', '[]', '[]', 2, '2023-08-14 12:51:49', '2023-08-14 12:51:49'),
(441, 'App\\Models\\Car', 88, '9838fcea-b5c5-4de1-9ffc-0a8c153469cd', 'cars-logo', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 3, '2023-08-14 17:12:44', '2023-08-14 17:12:44'),
(442, 'App\\Models\\Car', 88, '9a44ebad-45e9-42a2-b065-07527f8ecb7f', 'cars', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 4, '2023-08-14 17:12:44', '2023-08-14 17:12:44'),
(447, 'App\\Models\\Car', 92, '77f39554-0400-498d-bfc5-740bc1f50dae', 'cars', 'IMG-20230814-WA0000', 'IMG-20230814-WA0000.jpg', 'image/jpeg', 'public', 'public', 187490, '[]', '[]', '[]', '[]', 1, '2023-08-14 17:29:21', '2023-08-14 17:29:21'),
(448, 'App\\Models\\Car', 92, '315af846-66b9-4365-a698-85cd1f11b301', 'cars', 'IMG-20230814-WA0000', 'IMG-20230814-WA0000.jpg', 'image/jpeg', 'public', 'public', 187490, '[]', '[]', '[]', '[]', 2, '2023-08-14 17:29:21', '2023-08-14 17:29:21'),
(449, 'App\\Models\\Car', 92, 'a856e5b2-07e6-4a6d-85fb-275c75a7b6f9', 'cars-logo', 'IMG-20230814-WA0000', 'IMG-20230814-WA0000.jpg', 'image/jpeg', 'public', 'public', 187490, '[]', '[]', '[]', '[]', 3, '2023-08-14 17:29:21', '2023-08-14 17:29:21'),
(450, 'App\\Models\\Car', 88, '06350b6e-301f-46b2-bb03-3ede6bfc523d', 'cars-logo', 'images', 'images.jpg', 'image/jpeg', 'public', 'public', 27735, '[]', '[]', '[]', '[]', 5, '2023-08-14 18:02:54', '2023-08-14 18:02:54'),
(451, 'App\\Models\\Car', 93, 'eab86851-86bd-43f5-b307-2467a3fdaa17', 'cars', 'f7cd8d45ec2e9e3ce57bf35652a31495', 'f7cd8d45ec2e9e3ce57bf35652a31495.png', 'image/webp', 'public', 'public', 374868, '[]', '[]', '[]', '[]', 1, '2023-08-15 16:59:24', '2023-08-15 16:59:24'),
(452, 'App\\Models\\Car', 93, '34ec49a0-963a-4837-b41e-538c832e65e5', 'cars-logo', 'f7cd8d45ec2e9e3ce57bf35652a31495', 'f7cd8d45ec2e9e3ce57bf35652a31495.png', 'image/webp', 'public', 'public', 374868, '[]', '[]', '[]', '[]', 2, '2023-08-15 16:59:24', '2023-08-15 16:59:24'),
(453, 'App\\Models\\Page', 6, 'c2601d5d-e542-4f31-936d-bf48576c0d00', 'pages', 'logo-nav', 'logo-nav.png', 'image/png', 'public', 'public', 12170, '[]', '[]', '[]', '[]', 1, '2023-08-16 09:56:03', '2023-08-16 09:56:03'),
(454, 'App\\Models\\Showroom', 13, '9dea8a19-172e-436a-b773-02d7c1c8c498', 'showrooms-logo', 'ررر', 'ررر.jpg', 'image/jpeg', 'public', 'public', 30361, '[]', '[]', '[]', '[]', 1, '2023-08-24 11:53:35', '2023-08-24 11:53:35'),
(455, 'App\\Models\\Showroom', 13, '58e5b5e9-9f4e-4ef3-bbd3-48282be666b0', 'showrooms-tax_card', 'orignal-1675780374-542_cut', 'orignal-1675780374-542_cut.png', 'image/webp', 'public', 'public', 767960, '[]', '[]', '[]', '[]', 2, '2023-08-24 11:53:35', '2023-08-24 11:53:35'),
(456, 'App\\Models\\Showroom', 13, '0f087c05-4c2c-4323-8ab0-b4f2af7152ab', 'showrooms-commercial', 'orignal-1675780372-731_cut', 'orignal-1675780372-731_cut.png', 'image/webp', 'public', 'public', 755684, '[]', '[]', '[]', '[]', 3, '2023-08-24 11:53:35', '2023-08-24 11:53:35'),
(458, 'App\\Models\\ReportOption', 33, '5e3c34bf-efd2-4659-b521-6be7fa1ed2f5', 'report_options-icon', 'side-mirror', 'side-mirror.png', 'image/png', 'public', 'public', 61077, '[]', '[]', '[]', '[]', 1, '2023-08-24 13:42:28', '2023-08-24 13:42:28'),
(459, 'App\\Models\\ReportOption', 34, '6478f91f-3460-48a4-985b-cf20fdc33bb2', 'report_options-icon', 'car', 'car.png', 'image/png', 'public', 'public', 23344, '[]', '[]', '[]', '[]', 1, '2023-08-24 13:52:59', '2023-08-24 13:52:59'),
(460, 'App\\Models\\ReportOption', 35, '3cbded76-ce03-4267-9561-8178208ef3e2', 'report_options-icon', 'steering-wheel', 'steering-wheel.png', 'image/png', 'public', 'public', 78799, '[]', '[]', '[]', '[]', 1, '2023-08-24 13:55:31', '2023-08-24 13:55:31'),
(461, 'App\\Models\\ReportOption', 36, '68c1d4a5-ee81-4903-8bfd-ab0f22cb410a', 'report_options-icon', 'control', 'control.png', 'image/png', 'public', 'public', 39063, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:00:18', '2023-08-24 14:00:18'),
(462, 'App\\Models\\ReportOption', 37, '6886b9c4-26d4-44bc-9de4-7f1b0621e268', 'report_options-icon', 'hands', 'hands.png', 'image/png', 'public', 'public', 43101, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:02:06', '2023-08-24 14:02:06'),
(463, 'App\\Models\\ReportOption', 38, '7d95492b-c64a-4d12-85a1-dcdfbe5ea7eb', 'report_options-icon', 'service-call', 'service-call.png', 'image/png', 'public', 'public', 79169, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:03:42', '2023-08-24 14:03:42'),
(464, 'App\\Models\\ReportOption', 39, 'c31b9da1-aa51-4250-9eea-f86c94f7adf8', 'report_options-icon', 'car (1)', 'car-(1).png', 'image/png', 'public', 'public', 57992, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:05:31', '2023-08-24 14:05:31'),
(465, 'App\\Models\\ReportOption', 40, 'c03b0da2-3552-44ca-be91-2fa9bef37032', 'report_options-icon', 'air-conditioning', 'air-conditioning.png', 'image/png', 'public', 'public', 29151, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:07:58', '2023-08-24 14:07:58'),
(466, 'App\\Models\\ReportOption', 41, '5a41c471-a1c4-4c22-b1fe-cfe492920b0f', 'report_options-icon', 'control-panel', 'control-panel.png', 'image/png', 'public', 'public', 45972, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:09:28', '2023-08-24 14:09:28'),
(467, 'App\\Models\\ReportOption', 42, 'ced82578-4fa0-45b6-9458-17874b26d286', 'report_options-icon', 'convertible-car', 'convertible-car.png', 'image/png', 'public', 'public', 16593, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:12:08', '2023-08-24 14:12:08'),
(468, 'App\\Models\\ReportOption', 43, '58bb7c6e-0fd2-4a5d-b6cf-4060484822cc', 'report_options-icon', 'car (2)', 'car-(2).png', 'image/png', 'public', 'public', 45748, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:34:48', '2023-08-24 14:34:48'),
(469, 'App\\Models\\ReportOption', 44, 'e043c3ce-d9d8-4521-8dda-a7ff1970b76d', 'report_options-icon', 'car (2)', 'car-(2).png', 'image/png', 'public', 'public', 45748, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:35:10', '2023-08-24 14:35:10'),
(470, 'App\\Models\\ReportOption', 45, '8d40f5c5-a936-4713-9bf5-757e253e835a', 'report_options-icon', 'car (3)', 'car-(3).png', 'image/png', 'public', 'public', 39989, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:37:53', '2023-08-24 14:37:53'),
(471, 'App\\Models\\ReportOption', 46, 'ba4ae28c-d676-4c6d-ad7a-c00bae2518f5', 'report_options-icon', 'left', 'left.png', 'image/png', 'public', 'public', 45360, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:39:44', '2023-08-24 14:39:44'),
(472, 'App\\Models\\ReportOption', 47, '10604f6e-56ac-4163-bdbb-38c2f3438fa3', 'report_options-icon', 'seat', 'seat.png', 'image/png', 'public', 'public', 42056, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:41:54', '2023-08-24 14:41:54'),
(473, 'App\\Models\\ReportOption', 48, 'a85d2f9f-f349-408c-9ae0-fd3b7aad3359', 'report_options-icon', 'sedan', 'sedan.png', 'image/png', 'public', 'public', 29582, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:44:38', '2023-08-24 14:44:38'),
(474, 'App\\Models\\ReportOption', 49, 'e51dac4f-8fa6-4c67-afb0-b81e8b070f57', 'report_options-icon', 'car (3)', 'car-(3).png', 'image/png', 'public', 'public', 39989, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:45:09', '2023-08-24 14:45:09'),
(475, 'App\\Models\\ReportOption', 50, '0dadd972-0664-4c39-a540-bbd2a75bb299', 'report_options-icon', 'left', 'left.png', 'image/png', 'public', 'public', 45360, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:45:30', '2023-08-24 14:45:30'),
(476, 'App\\Models\\ReportOption', 51, '6ae8f442-2936-44cb-9534-052a1cc15952', 'report_options-icon', 'right', 'right.png', 'image/png', 'public', 'public', 44286, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:46:42', '2023-08-24 14:46:42'),
(477, 'App\\Models\\ReportOption', 52, 'a3695903-c9b5-4d9c-9298-11d1b5986d25', 'report_options-icon', 'open-door', 'open-door.png', 'image/png', 'public', 'public', 44206, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:47:51', '2023-08-24 14:47:51'),
(478, 'App\\Models\\ReportOption', 53, '85687b37-8dc8-4219-9d9a-b53c7a3da60c', 'report_options-icon', 'power-button', 'power-button.png', 'image/png', 'public', 'public', 38498, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:49:32', '2023-08-24 14:49:32'),
(479, 'App\\Models\\ReportOption', 54, '238c6e88-7d80-4892-a909-077aa2b90316', 'report_options-icon', 'power-button', 'power-button.png', 'image/png', 'public', 'public', 38498, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:49:54', '2023-08-24 14:49:54'),
(480, 'App\\Models\\ReportOption', 55, 'd116461e-8127-4004-9469-72924890bffa', 'report_options-icon', 'power-button', 'power-button.png', 'image/png', 'public', 'public', 38498, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:50:20', '2023-08-24 14:50:20'),
(481, 'App\\Models\\ReportOption', 56, '2920704d-0308-40e4-a541-7bbf47693ab3', 'report_options-icon', 'power-button', 'power-button.png', 'image/png', 'public', 'public', 38498, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:50:39', '2023-08-24 14:50:39'),
(482, 'App\\Models\\ReportOption', 57, '5db1653e-efd6-48a3-a144-24d8723653c9', 'report_options-icon', 'gear-stick', 'gear-stick.png', 'image/png', 'public', 'public', 37791, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:52:06', '2023-08-24 14:52:06'),
(483, 'App\\Models\\ReportOption', 58, '32b14837-3bf4-4965-bf6f-16806c76fc3d', 'report_options-icon', 'coffee-cups', 'coffee-cups.png', 'image/png', 'public', 'public', 11896, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:54:29', '2023-08-24 14:54:29'),
(484, 'App\\Models\\ReportOption', 59, '03d22744-8748-48a5-adba-9abb94b4b771', 'report_options-icon', 'vehicle', 'vehicle.png', 'image/png', 'public', 'public', 22804, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:56:13', '2023-08-24 14:56:13'),
(485, 'App\\Models\\ReportOption', 60, '8fcd0b8b-970e-460d-b1d7-e99c1a241b5d', 'report_options-icon', 'car (4)', 'car-(4).png', 'image/png', 'public', 'public', 17811, '[]', '[]', '[]', '[]', 1, '2023-08-24 14:57:06', '2023-08-24 14:57:06'),
(486, 'App\\Models\\ReportOption', 61, 'df8fabd4-852c-4643-8324-adcc4ce074cc', 'report_options-icon', 'pedal', 'pedal.png', 'image/png', 'public', 'public', 39900, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:04:12', '2023-08-24 15:04:12'),
(487, 'App\\Models\\ReportOption', 62, '9663e535-f231-4963-993d-ca5e7fe2588a', 'report_options-icon', 'handbrake', 'handbrake.png', 'image/png', 'public', 'public', 14098, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:05:06', '2023-08-24 15:05:06'),
(488, 'App\\Models\\ReportOption', 63, '00360aa8-b21f-473c-87ff-ca6ddd30b4fc', 'report_options-icon', 'car (5)', 'car-(5).png', 'image/png', 'public', 'public', 24160, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:06:51', '2023-08-24 15:06:51'),
(489, 'App\\Models\\ReportOption', 64, '35d1c83e-f180-447c-8b1b-5093cfa310c8', 'report_options-icon', 'car (6)', 'car-(6).png', 'image/png', 'public', 'public', 71158, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:08:22', '2023-08-24 15:08:22'),
(490, 'App\\Models\\ReportOption', 65, '8041e869-36b7-4510-84e1-1ef61135b21e', 'report_options-icon', 'car (7)', 'car-(7).png', 'image/png', 'public', 'public', 33020, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:11:12', '2023-08-24 15:11:12'),
(491, 'App\\Models\\ReportOption', 66, '939b0a6c-7b1a-4dea-84c1-ba99813448d4', 'report_options-icon', 'car (7)', 'car-(7).png', 'image/png', 'public', 'public', 33020, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:11:36', '2023-08-24 15:11:36'),
(492, 'App\\Models\\ReportOption', 67, '149f4f48-090c-4de8-a2cf-9029ffea6186', 'report_options-icon', 'car (8)', 'car-(8).png', 'image/png', 'public', 'public', 41172, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:12:52', '2023-08-24 15:12:52'),
(493, 'App\\Models\\ReportOption', 68, 'bf29f894-c4be-4729-b442-4b59af4ed2a7', 'report_options-icon', 'car (8)', 'car-(8).png', 'image/png', 'public', 'public', 41172, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:13:17', '2023-08-24 15:13:17'),
(494, 'App\\Models\\ReportOption', 69, '5119e501-5890-4714-b160-5360a04898b0', 'report_options-icon', 'piston', 'piston.png', 'image/png', 'public', 'public', 38194, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:14:39', '2023-08-24 15:14:39'),
(495, 'App\\Models\\ReportOption', 70, '02870df8-820b-416e-8fd1-1068fe442822', 'report_options-icon', 'piston (3)', 'piston-(3).png', 'image/png', 'public', 'public', 47556, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:16:58', '2023-08-24 15:16:58'),
(496, 'App\\Models\\ReportOption', 71, '1a53ea07-dcf4-4bc3-aafd-3eee8506f83f', 'report_options-icon', 'piston (1)', 'piston-(1).png', 'image/png', 'public', 'public', 51764, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:17:21', '2023-08-24 15:17:21'),
(497, 'App\\Models\\ReportOption', 72, 'fd9d1145-5dfe-4a91-b39b-dca8da9d3858', 'report_options-icon', 'piston', 'piston.png', 'image/png', 'public', 'public', 38194, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:17:43', '2023-08-24 15:17:43'),
(498, 'App\\Models\\ReportOption', 73, '9621d78f-ee61-4c2f-8352-793d1902ba98', 'report_options-icon', 'handbrake', 'handbrake.png', 'image/png', 'public', 'public', 14098, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:18:14', '2023-08-24 15:18:14'),
(499, 'App\\Models\\ReportOption', 74, '0cec7a07-a30c-405d-bbf2-504fd6f827df', 'report_options-icon', 'car-radiator', 'car-radiator.png', 'image/png', 'public', 'public', 59369, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:20:39', '2023-08-24 15:20:39'),
(500, 'App\\Models\\ReportOption', 75, 'ffd3a066-3dc8-4f02-a282-95a283b3dd4d', 'report_options-icon', 'windshield', 'windshield.png', 'image/png', 'public', 'public', 45841, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:21:34', '2023-08-24 15:21:34'),
(501, 'App\\Models\\ReportOption', 76, '22cbec8e-7980-48f2-9dc5-2d7a056ceb1b', 'report_options-icon', 'fluid', 'fluid.png', 'image/png', 'public', 'public', 53320, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:22:25', '2023-08-24 15:22:25'),
(502, 'App\\Models\\ReportOption', 77, 'fa53d45e-7552-465e-a947-a73f918f4f1a', 'report_options-icon', 'manual-transmission', 'manual-transmission.png', 'image/png', 'public', 'public', 24433, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:26:41', '2023-08-24 15:26:41'),
(503, 'App\\Models\\ReportOption', 78, 'a0b3647e-f27a-4d46-b4a3-bda025e246be', 'report_options-icon', 'sedan (1)', 'sedan-(1).png', 'image/png', 'public', 'public', 29492, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:29:19', '2023-08-24 15:29:19'),
(504, 'App\\Models\\ReportOption', 79, '0bafafbd-d4c6-4cb6-b501-476d43449624', 'report_options-icon', 'shift-stick', 'shift-stick.png', 'image/png', 'public', 'public', 50462, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:31:02', '2023-08-24 15:31:02'),
(505, 'App\\Models\\ReportOption', 80, '0616eede-6ba3-486e-99ac-85c49e0835d9', 'report_options-icon', 'gear-stick (1)', 'gear-stick-(1).png', 'image/png', 'public', 'public', 31988, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:32:00', '2023-08-24 15:32:00'),
(506, 'App\\Models\\ReportOption', 81, '739ba3dc-1f84-4640-9df6-8fd4b6853dd1', 'report_options-icon', 'gear-stick', 'gear-stick.png', 'image/png', 'public', 'public', 37791, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:32:23', '2023-08-24 15:32:23'),
(507, 'App\\Models\\ReportOption', 82, '33bf4bf0-6e59-4eeb-ad82-3b6a0f8b5ba3', 'report_options-icon', 'shift-stick', 'shift-stick.png', 'image/png', 'public', 'public', 50462, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:32:44', '2023-08-24 15:32:44'),
(508, 'App\\Models\\ReportOption', 83, 'b6c96455-ba03-4f42-ad8c-0460cf7e9120', 'report_options-icon', 'car (9)', 'car-(9).png', 'image/png', 'public', 'public', 42600, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:34:53', '2023-08-24 15:34:53'),
(509, 'App\\Models\\ReportOption', 84, '33732fa8-c21e-40a1-84e9-dc3053862c95', 'report_options-icon', 'car (9)', 'car-(9).png', 'image/png', 'public', 'public', 42600, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:35:11', '2023-08-24 15:35:11'),
(510, 'App\\Models\\ReportOption', 85, '05b1315b-70e1-4dcb-85f5-fd1095573bd7', 'report_options-icon', 'sofa', 'sofa.png', 'image/png', 'public', 'public', 27153, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:37:49', '2023-08-24 15:37:49'),
(511, 'App\\Models\\ReportOption', 86, '00c80917-cb2b-49e3-a995-6e57dc96050c', 'report_options-icon', 'recycle', 'recycle.png', 'image/png', 'public', 'public', 76991, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:38:31', '2023-08-24 15:38:31'),
(512, 'App\\Models\\ReportOption', 87, '8b3db176-d022-4770-b531-ec0ce9d99617', 'report_options-icon', 'pillar', 'pillar.png', 'image/png', 'public', 'public', 16505, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:40:59', '2023-08-24 15:40:59'),
(513, 'App\\Models\\ReportOption', 88, 'bfd7da57-5e31-4c58-8ab3-d2ae8f163765', 'report_options-icon', 'car-parking', 'car-parking.png', 'image/png', 'public', 'public', 68126, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:42:56', '2023-08-24 15:42:56'),
(514, 'App\\Models\\ReportOption', 89, '96b3d9ca-3933-44ac-a7f9-62c6e437e5d1', 'report_options-icon', 'steering', 'steering.png', 'image/png', 'public', 'public', 110939, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:45:48', '2023-08-24 15:45:48'),
(515, 'App\\Models\\ReportOption', 90, '3cafe478-8907-4c3d-b8e8-5521f7f850c2', 'report_options-icon', 'spring', 'spring.png', 'image/png', 'public', 'public', 50644, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:49:48', '2023-08-24 15:49:48');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(516, 'App\\Models\\ReportOption', 91, 'cf9e7230-06a4-4716-aad0-848fc6ad26ab', 'report_options-icon', 'spare-parts', 'spare-parts.png', 'image/png', 'public', 'public', 58112, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:50:57', '2023-08-24 15:50:57'),
(517, 'App\\Models\\ReportOption', 92, 'ee687798-b760-486e-b4d6-d122e9754679', 'report_options-icon', 'spare-parts', 'spare-parts.png', 'image/png', 'public', 'public', 58112, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:51:52', '2023-08-24 15:51:52'),
(518, 'App\\Models\\ReportOption', 93, '83c875e0-163c-44bd-ae71-b3520a40a1a9', 'report_options-icon', 'spare-parts', 'spare-parts.png', 'image/png', 'public', 'public', 58112, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:52:15', '2023-08-24 15:52:15'),
(519, 'App\\Models\\ReportOption', 94, '06c8dec6-81c1-442d-9e8e-f0f2a1d33501', 'report_options-icon', 'spring (1)', 'spring-(1).png', 'image/png', 'public', 'public', 54119, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:54:57', '2023-08-24 15:54:57'),
(520, 'App\\Models\\ReportOption', 95, '91aafec8-a26e-4d7f-af02-9e8b4c484355', 'report_options-icon', 'spare-parts', 'spare-parts.png', 'image/png', 'public', 'public', 58112, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:56:59', '2023-08-24 15:56:59'),
(521, 'App\\Models\\ReportOption', 96, '55f689ec-0a70-4eba-8299-8fda48b8e44f', 'report_options-icon', 'balancing', 'balancing.png', 'image/png', 'public', 'public', 37768, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:58:34', '2023-08-24 15:58:34'),
(522, 'App\\Models\\ReportOption', 97, '06d8c771-e846-4c41-9ec4-8d15d9dc6252', 'report_options-icon', 'spare-parts', 'spare-parts.png', 'image/png', 'public', 'public', 58112, '[]', '[]', '[]', '[]', 1, '2023-08-24 15:59:41', '2023-08-24 15:59:41'),
(523, 'App\\Models\\ReportOption', 98, '28bbc1bc-0eb1-4f27-a682-62f2c2a548f9', 'report_options-icon', 'car-manufacturing', 'car-manufacturing.png', 'image/png', 'public', 'public', 21656, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:01:54', '2023-08-24 16:01:54'),
(524, 'App\\Models\\ReportOption', 99, '6ea5c307-8dc1-4ee2-89f8-0a90d6cfeb73', 'report_options-icon', 'car (10)', 'car-(10).png', 'image/png', 'public', 'public', 66687, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:03:47', '2023-08-24 16:03:47'),
(525, 'App\\Models\\ReportOption', 100, '120bbc03-3724-435d-89e9-d5d44a0c7ddf', 'report_options-icon', 'racing', 'racing.png', 'image/png', 'public', 'public', 47681, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:04:32', '2023-08-24 16:04:32'),
(526, 'App\\Models\\ReportOption', 101, 'a692eae8-5b0f-4535-a7ea-ba4cdc0ae207', 'report_options-icon', 'racing', 'racing.png', 'image/png', 'public', 'public', 47681, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:04:56', '2023-08-24 16:04:56'),
(527, 'App\\Models\\ReportOption', 102, '44a5a453-6606-4947-b88a-3f85aaf7b672', 'report_options-icon', 'car (10)', 'car-(10).png', 'image/png', 'public', 'public', 66687, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:07:02', '2023-08-24 16:07:02'),
(528, 'App\\Models\\ReportOption', 103, 'f115ab98-a060-45c6-bcc1-ba595c344310', 'report_options-icon', 'spring', 'spring.png', 'image/png', 'public', 'public', 50644, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:07:24', '2023-08-24 16:07:24'),
(529, 'App\\Models\\ReportOption', 104, '6f4c9dbb-2a95-448f-a5be-4d23eb3205f2', 'report_options-icon', 'spring', 'spring.png', 'image/png', 'public', 'public', 50644, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:07:40', '2023-08-24 16:07:40'),
(532, 'App\\Models\\ReportOption', 107, '17076958-d80a-40ce-ab27-cd4d0f886375', 'report_options-icon', 'car-door', 'car-door.png', 'image/png', 'public', 'public', 29214, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:14:20', '2023-08-24 16:14:20'),
(533, 'App\\Models\\ReportOption', 108, 'b9c2da60-3e4c-42f9-ba07-734951555a56', 'report_options-icon', 'windscreen', 'windscreen.png', 'image/png', 'public', 'public', 48434, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:18:13', '2023-08-24 16:18:13'),
(535, 'App\\Models\\ReportOption', 110, 'da221d21-1784-4192-b6a4-38e0469e4319', 'report_options-icon', 'car (12)', 'car-(12).png', 'image/png', 'public', 'public', 62417, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:21:08', '2023-08-24 16:21:08'),
(536, 'App\\Models\\ReportOption', 111, '00327810-c299-48d3-a128-2b5550d056c9', 'report_options-icon', 'air-conditioner', 'air-conditioner.png', 'image/png', 'public', 'public', 14890, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:23:05', '2023-08-24 16:23:05'),
(546, 'App\\Models\\ReportOption', 121, '5e2da1f0-5f81-414e-8cef-0160dbe5a206', 'report_options-icon', 'oil-filter', 'oil-filter.png', 'image/png', 'public', 'public', 69752, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:45:13', '2023-08-24 16:45:13'),
(547, 'App\\Models\\ReportOption', 122, '5f81bb1e-cac6-4170-b530-b50c690d14ae', 'report_options-icon', 'snowflake', 'snowflake.png', 'image/png', 'public', 'public', 59254, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:51:19', '2023-08-24 16:51:19'),
(548, 'App\\Models\\ReportOption', 123, '3d273697-d4bd-431e-816f-a427a0318d11', 'report_options-icon', 'car-radiator (1)', 'car-radiator-(1).png', 'image/png', 'public', 'public', 60492, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:52:12', '2023-08-24 16:52:12'),
(549, 'App\\Models\\ReportOption', 124, '7b30b316-ef0e-4829-a3df-ee9189421170', 'report_options-icon', 'service', 'service.png', 'image/png', 'public', 'public', 32866, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:53:25', '2023-08-24 16:53:25'),
(557, 'App\\Models\\ReportOption', 132, 'e1648cde-e6d9-4977-a257-9a1e8221a961', 'report_options-icon', 'pulley (1)', 'pulley-(1).png', 'image/png', 'public', 'public', 45682, '[]', '[]', '[]', '[]', 1, '2023-08-24 16:59:56', '2023-08-24 16:59:56'),
(558, 'App\\Models\\Car', 73, '2fa6507a-a19a-4f76-9050-a35b6b1119ce', 'cars-logo', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6676, '[]', '[]', '[]', '[]', 6, '2023-08-24 17:00:10', '2023-08-24 17:00:10'),
(559, 'App\\Models\\Car', 73, 'cf487e95-cfa1-4ddb-9465-27c49c418e02', 'cars-door-1', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6676, '[]', '[]', '[]', '[]', 7, '2023-08-24 17:00:10', '2023-08-24 17:00:10'),
(560, 'App\\Models\\Car', 73, '4d0a6a01-d046-4792-a88e-c21f9368bfe1', 'cars-door-2', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6676, '[]', '[]', '[]', '[]', 8, '2023-08-24 17:00:10', '2023-08-24 17:00:10'),
(561, 'App\\Models\\Car', 73, 'f71bc2e6-9906-4b9b-a4b9-714ae6b316f6', 'cars-door-3', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6676, '[]', '[]', '[]', '[]', 9, '2023-08-24 17:00:10', '2023-08-24 17:00:10'),
(562, 'App\\Models\\Car', 73, '0eb7cfeb-d046-4c97-8f0e-8224e82c517c', 'cars-door-4', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6676, '[]', '[]', '[]', '[]', 10, '2023-08-24 17:00:10', '2023-08-24 17:00:10'),
(564, 'App\\Models\\Showroom', 10, '94bac361-22de-4e66-8c32-96340b63b4e6', 'showrooms-logo', 'IMG-20230824-WA0002', 'IMG-20230824-WA0002.jpg', 'image/jpeg', 'public', 'public', 15526, '[]', '[]', '[]', '[]', 1, '2023-08-24 17:07:55', '2023-08-24 17:07:55'),
(565, 'App\\Models\\Showroom', 10, '27e7c41f-6d8e-478c-a24b-5785863bc794', 'showrooms-cover_image', 'IMG-20230824-WA0003', 'IMG-20230824-WA0003.jpg', 'image/jpeg', 'public', 'public', 83273, '[]', '[]', '[]', '[]', 2, '2023-08-24 17:08:19', '2023-08-24 17:08:19'),
(568, 'App\\Models\\Car', 72, '1a56d9cb-c62a-4ffb-ba38-c75973e424e1', 'cars-logo', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 6, '2023-08-24 17:12:40', '2023-08-24 17:12:40'),
(569, 'App\\Models\\Car', 72, 'c2787f03-abb8-40f9-9d93-cda14031b7c4', 'cars-door-1', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 7, '2023-08-24 17:12:40', '2023-08-24 17:12:40'),
(570, 'App\\Models\\Car', 72, 'd697c6de-918f-4079-92b5-91bcc492ddaf', 'cars-door-2', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 8, '2023-08-24 17:12:40', '2023-08-24 17:12:40'),
(571, 'App\\Models\\Car', 72, 'e8b44e97-9e22-4f4d-a3fa-aeb9574e6c7f', 'cars-door-3', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 9, '2023-08-24 17:12:40', '2023-08-24 17:12:40'),
(572, 'App\\Models\\Car', 72, '5b6b36f9-18eb-4369-8266-9e7f6d801a1b', 'cars-door-4', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 10, '2023-08-24 17:12:40', '2023-08-24 17:12:40'),
(577, 'App\\Models\\Car', 73, 'c0986cf2-0a45-4ada-a7b3-15d83991b9b3', 'cars-logo', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 11, '2023-08-24 17:16:34', '2023-08-24 17:16:34'),
(578, 'App\\Models\\Car', 73, '68a6d12d-85bf-4334-ab79-4b17da8956a3', 'cars-door-1', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 12, '2023-08-24 17:16:34', '2023-08-24 17:16:34'),
(579, 'App\\Models\\Car', 73, 'eeb20a7b-8bda-4b73-9517-eaf1cff80bd8', 'cars-door-2', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 13, '2023-08-24 17:16:34', '2023-08-24 17:16:34'),
(580, 'App\\Models\\Car', 73, 'b346359e-74a7-400b-9816-3623ad845665', 'cars-door-3', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 14, '2023-08-24 17:16:34', '2023-08-24 17:16:34'),
(581, 'App\\Models\\Car', 73, '9a6a4d6c-e9e2-4ca4-918e-e014d736276c', 'cars-door-4', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 15, '2023-08-24 17:16:34', '2023-08-24 17:16:34'),
(582, 'App\\Models\\Car', 94, '8949cd30-2846-43f5-bb43-a8fc40bcbda3', 'cars', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6676, '[]', '[]', '[]', '[]', 1, '2023-08-24 17:21:37', '2023-08-24 17:21:37'),
(583, 'App\\Models\\Car', 94, '31c3bcc6-fd05-4521-ab79-9c0d40b9b675', 'cars-logo', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6676, '[]', '[]', '[]', '[]', 2, '2023-08-24 17:21:37', '2023-08-24 17:21:37'),
(584, 'App\\Models\\Car', 94, 'a54a65a1-1cbc-4bb2-a65f-b9d982e4f18b', 'cars-door-1', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6676, '[]', '[]', '[]', '[]', 3, '2023-08-24 17:21:37', '2023-08-24 17:21:37'),
(585, 'App\\Models\\Car', 94, '704322ed-6d58-4849-9939-92318d87df32', 'cars-door-2', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6676, '[]', '[]', '[]', '[]', 4, '2023-08-24 17:21:37', '2023-08-24 17:21:37'),
(586, 'App\\Models\\Car', 94, '3507f11c-0c7a-4956-aa16-bc4cca64c72c', 'cars-door-3', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6676, '[]', '[]', '[]', '[]', 5, '2023-08-24 17:21:37', '2023-08-24 17:21:37'),
(587, 'App\\Models\\Car', 94, '240eea8c-f3f2-4f0d-aa31-eea25283ba3f', 'cars-door-4', 'download', 'download.png', 'image/jpeg', 'public', 'public', 6676, '[]', '[]', '[]', '[]', 6, '2023-08-24 17:21:37', '2023-08-24 17:21:37'),
(588, 'App\\Models\\ReportOption', 140, '5cbac335-060c-4078-9f05-f5c6925e527d', 'report_options-icon', 'sedan (1)', 'sedan-(1).png', 'image/png', 'public', 'public', 29492, '[]', '[]', '[]', '[]', 1, '2023-08-24 17:21:51', '2023-08-24 17:21:51'),
(589, 'App\\Models\\ReportOption', 141, 'be171bf7-fbbf-4650-a947-a6581d6f6581', 'report_options-icon', 'side-mirror', 'side-mirror.png', 'image/png', 'public', 'public', 61077, '[]', '[]', '[]', '[]', 1, '2023-08-24 17:22:19', '2023-08-24 17:22:19'),
(590, 'App\\Models\\ReportOption', 142, 'de72645e-bc59-46af-848f-d378e87a480d', 'report_options-icon', 'bag', 'bag.png', 'image/png', 'public', 'public', 5756, '[]', '[]', '[]', '[]', 1, '2023-08-24 17:25:06', '2023-08-24 17:25:06'),
(591, 'App\\Models\\Car', 95, '658f3858-6c75-4eab-b0d8-a57b0428c1c8', 'cars-logo', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 1, '2023-08-24 17:26:24', '2023-08-24 17:26:24'),
(592, 'App\\Models\\Car', 95, 'c5a8aeb3-07f7-4523-90cb-95ee6bad1f0d', 'cars-door-1', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 2, '2023-08-24 17:26:24', '2023-08-24 17:26:24'),
(593, 'App\\Models\\Car', 95, '1093394b-a536-45b5-8d49-e573d5b60677', 'cars-door-2', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 3, '2023-08-24 17:26:24', '2023-08-24 17:26:24'),
(594, 'App\\Models\\Car', 95, 'e867a02b-602f-4692-b39e-59fe3ee276f8', 'cars-door-3', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 4, '2023-08-24 17:26:24', '2023-08-24 17:26:24'),
(595, 'App\\Models\\Car', 95, '7f02f81c-a829-4ee4-afab-113491ae113e', 'cars-door-4', 'download1', 'download1.png', 'image/jpeg', 'public', 'public', 4434, '[]', '[]', '[]', '[]', 5, '2023-08-24 17:26:24', '2023-08-24 17:26:24'),
(596, 'App\\Models\\ReportOption', 143, 'ffc07fd4-1944-4927-ad25-fad5ea79b37d', 'report_options-icon', 'car-trailer', 'car-trailer.png', 'image/png', 'public', 'public', 37667, '[]', '[]', '[]', '[]', 1, '2023-08-24 17:28:00', '2023-08-24 17:28:00'),
(597, 'App\\Models\\ReportOption', 144, '88ae74f4-c228-4a64-859c-221bb0203457', 'report_options-icon', 'warning-sign', 'warning-sign.png', 'image/png', 'public', 'public', 63526, '[]', '[]', '[]', '[]', 1, '2023-08-24 17:29:53', '2023-08-24 17:29:53'),
(598, 'App\\Models\\Car', 96, '2898ebba-af97-42f3-9885-8bae26b7b926', 'cars', 'download2', 'download2.png', 'image/jpeg', 'public', 'public', 4574, '[]', '[]', '[]', '[]', 1, '2023-08-24 17:38:47', '2023-08-24 17:38:47'),
(599, 'App\\Models\\Car', 96, '2b3485ad-b321-4246-9034-d23c3450a058', 'cars-logo', 'download2', 'download2.png', 'image/jpeg', 'public', 'public', 4574, '[]', '[]', '[]', '[]', 2, '2023-08-24 17:38:47', '2023-08-24 17:38:47'),
(600, 'App\\Models\\Car', 96, 'c8b35c46-9351-4200-8afe-ee51f42895a3', 'cars-door-1', 'download2', 'download2.png', 'image/jpeg', 'public', 'public', 4574, '[]', '[]', '[]', '[]', 3, '2023-08-24 17:38:47', '2023-08-24 17:38:47'),
(601, 'App\\Models\\Car', 96, '637716ea-2d05-4842-add7-b666f52bb3b7', 'cars-door-2', 'download2', 'download2.png', 'image/jpeg', 'public', 'public', 4574, '[]', '[]', '[]', '[]', 4, '2023-08-24 17:38:47', '2023-08-24 17:38:47'),
(602, 'App\\Models\\Car', 96, '28dd3158-0cdb-41a0-8df0-c2640c46dcbc', 'cars-door-3', 'download2', 'download2.png', 'image/jpeg', 'public', 'public', 4574, '[]', '[]', '[]', '[]', 5, '2023-08-24 17:38:47', '2023-08-24 17:38:47'),
(603, 'App\\Models\\Car', 96, 'a34e079e-2458-42ee-a598-54e4bcf7e048', 'cars-door-4', 'download2', 'download2.png', 'image/jpeg', 'public', 'public', 4574, '[]', '[]', '[]', '[]', 6, '2023-08-24 17:38:47', '2023-08-24 17:38:47'),
(604, 'App\\Models\\Car', 97, 'ef5dfe28-f19b-4cd4-b1a3-2e64ef6e8991', 'cars', 'download60', 'download60.png', 'image/jpeg', 'public', 'public', 6509, '[]', '[]', '[]', '[]', 1, '2023-08-24 17:54:28', '2023-08-24 17:54:28'),
(605, 'App\\Models\\Car', 97, 'e7cd6b89-268b-4ef0-852a-7769955a98fa', 'cars-logo', 'download60', 'download60.png', 'image/jpeg', 'public', 'public', 6509, '[]', '[]', '[]', '[]', 2, '2023-08-24 17:54:28', '2023-08-24 17:54:28'),
(606, 'App\\Models\\Car', 97, '77e24005-62a9-4bdb-ba12-517489d0c8ba', 'cars-door-1', 'download60', 'download60.png', 'image/jpeg', 'public', 'public', 6509, '[]', '[]', '[]', '[]', 3, '2023-08-24 17:54:28', '2023-08-24 17:54:28'),
(607, 'App\\Models\\Car', 97, '089853f3-b6dc-413a-baa4-284af8467d71', 'cars-door-2', 'download60', 'download60.png', 'image/jpeg', 'public', 'public', 6509, '[]', '[]', '[]', '[]', 4, '2023-08-24 17:54:28', '2023-08-24 17:54:28'),
(608, 'App\\Models\\Car', 97, '91398f56-97df-492e-abba-4da8d8f91ba0', 'cars-door-3', 'download60', 'download60.png', 'image/jpeg', 'public', 'public', 6509, '[]', '[]', '[]', '[]', 5, '2023-08-24 17:54:28', '2023-08-24 17:54:28'),
(609, 'App\\Models\\Car', 97, '8bd64148-dc33-4b43-a315-4f74b33fd958', 'cars-door-4', 'download60', 'download60.png', 'image/jpeg', 'public', 'public', 6509, '[]', '[]', '[]', '[]', 6, '2023-08-24 17:54:28', '2023-08-24 17:54:28'),
(610, 'App\\Models\\Showroom', 11, '00e136d0-5e72-4db8-b96f-2938239a4c8e', 'showrooms-logo', 'download (3)', 'download-(3).png', 'image/jpeg', 'public', 'public', 7408, '[]', '[]', '[]', '[]', 1, '2023-08-24 18:04:03', '2023-08-24 18:04:03'),
(611, 'App\\Models\\Showroom', 11, '14ab2d03-0793-45c7-b553-2fed4831e8d4', 'showrooms-tax_card', 'download (3)', 'download-(3).png', 'image/jpeg', 'public', 'public', 7408, '[]', '[]', '[]', '[]', 2, '2023-08-24 18:04:03', '2023-08-24 18:04:03'),
(612, 'App\\Models\\Showroom', 11, '9da31a6e-f9f0-43e2-bbdd-caa3b6249abe', 'showrooms-cover_image', 'download (3)', 'download-(3).png', 'image/jpeg', 'public', 'public', 7408, '[]', '[]', '[]', '[]', 3, '2023-08-24 18:04:03', '2023-08-24 18:04:03'),
(613, 'App\\Models\\Showroom', 11, '3b4a0eed-0c69-4de5-b2dd-a8580e4787a1', 'showrooms-commercial', 'download (3)', 'download-(3).png', 'image/jpeg', 'public', 'public', 7408, '[]', '[]', '[]', '[]', 4, '2023-08-24 18:04:03', '2023-08-24 18:04:03'),
(614, 'App\\Models\\Branch', 29, 'f3436b0c-609c-4649-a4d2-57f37ad99bbf', 'branches', 'download (3)', 'download-(3).png', 'image/jpeg', 'public', 'public', 7408, '[]', '[]', '[]', '[]', 1, '2023-08-24 18:09:18', '2023-08-24 18:09:18'),
(615, 'App\\Models\\Car', 98, 'a49c56d5-26da-4c37-8ac5-e1eda829835c', 'cars', 'IMG-20230824-WA0004', 'IMG-20230824-WA0004.jpg', 'image/jpeg', 'public', 'public', 224238, '[]', '[]', '[]', '[]', 1, '2023-08-24 18:30:03', '2023-08-24 18:30:03'),
(616, 'App\\Models\\Car', 98, 'a97e20ff-3686-4eec-b774-80a490c7f6de', 'cars', 'IMG-20230824-WA0007', 'IMG-20230824-WA0007.jpg', 'image/jpeg', 'public', 'public', 80905, '[]', '[]', '[]', '[]', 2, '2023-08-24 18:30:03', '2023-08-24 18:30:03'),
(617, 'App\\Models\\Car', 98, '1b1ef3fb-2b2c-4813-8ae6-7472b3b1f97e', 'cars', 'IMG-20230824-WA0006', 'IMG-20230824-WA0006.jpg', 'image/jpeg', 'public', 'public', 315067, '[]', '[]', '[]', '[]', 3, '2023-08-24 18:30:03', '2023-08-24 18:30:03'),
(618, 'App\\Models\\Car', 98, '3bf8082f-a495-4798-a0db-553cccdbd5d6', 'cars', 'IMG-20230824-WA0005', 'IMG-20230824-WA0005.jpg', 'image/jpeg', 'public', 'public', 300803, '[]', '[]', '[]', '[]', 4, '2023-08-24 18:30:03', '2023-08-24 18:30:03'),
(619, 'App\\Models\\Car', 98, '423411b1-5371-452d-b7ff-a3d367e3dde7', 'cars-logo', 'IMG-20230824-WA0008', 'IMG-20230824-WA0008.jpg', 'image/jpeg', 'public', 'public', 558717, '[]', '[]', '[]', '[]', 5, '2023-08-24 18:30:03', '2023-08-24 18:30:03'),
(620, 'App\\Models\\Car', 99, 'a79db346-d578-4870-bd65-793592051e7b', 'cars', 'IMG-20230824-WA0014', 'IMG-20230824-WA0014.jpg', 'image/jpeg', 'public', 'public', 100593, '[]', '[]', '[]', '[]', 1, '2023-08-24 18:48:43', '2023-08-24 18:48:43'),
(621, 'App\\Models\\Car', 99, 'e84244d4-5942-4da8-9d39-bd2770a96fba', 'cars', 'IMG-20230824-WA0013', 'IMG-20230824-WA0013.jpg', 'image/jpeg', 'public', 'public', 135964, '[]', '[]', '[]', '[]', 2, '2023-08-24 18:48:43', '2023-08-24 18:48:43'),
(622, 'App\\Models\\Car', 99, '7d2c44fa-4e48-4979-8888-9d8eacc0d235', 'cars', 'IMG-20230824-WA0012', 'IMG-20230824-WA0012.jpg', 'image/jpeg', 'public', 'public', 10498, '[]', '[]', '[]', '[]', 3, '2023-08-24 18:48:43', '2023-08-24 18:48:43'),
(623, 'App\\Models\\Car', 99, '23783863-d7d6-4f50-873c-99f4bd1fe567', 'cars-logo', 'IMG-20230824-WA0011', 'IMG-20230824-WA0011.jpg', 'image/jpeg', 'public', 'public', 55495, '[]', '[]', '[]', '[]', 4, '2023-08-24 18:48:43', '2023-08-24 18:48:43'),
(624, 'App\\Models\\Car', 100, '32fd1e01-4b61-4a3c-b52c-711e8459c68c', 'cars', 'IMG-20230824-WA0018', 'IMG-20230824-WA0018.jpg', 'image/jpeg', 'public', 'public', 97247, '[]', '[]', '[]', '[]', 1, '2023-08-24 18:59:37', '2023-08-24 18:59:37'),
(625, 'App\\Models\\Car', 100, '1445eb79-6ca2-4ee5-ab72-870a823bfbf9', 'cars', 'IMG-20230824-WA0017', 'IMG-20230824-WA0017.jpg', 'image/jpeg', 'public', 'public', 87081, '[]', '[]', '[]', '[]', 2, '2023-08-24 18:59:37', '2023-08-24 18:59:37'),
(626, 'App\\Models\\Car', 100, 'a6bc84ca-de8f-4596-8343-289ea8bf310f', 'cars', 'IMG-20230824-WA0016', 'IMG-20230824-WA0016.jpg', 'image/jpeg', 'public', 'public', 75491, '[]', '[]', '[]', '[]', 3, '2023-08-24 18:59:37', '2023-08-24 18:59:37'),
(627, 'App\\Models\\Car', 100, 'cb1fffe1-2f91-4d5f-9ba0-940dabe3ea63', 'cars-logo', 'IMG-20230824-WA0015', 'IMG-20230824-WA0015.jpg', 'image/jpeg', 'public', 'public', 102049, '[]', '[]', '[]', '[]', 4, '2023-08-24 18:59:37', '2023-08-24 18:59:37'),
(628, 'App\\Models\\Car', 101, '66162d50-48c6-47a5-8d83-f729b9105101', 'cars', 'IMG-20230824-WA0020(1)', 'IMG-20230824-WA0020(1).jpg', 'image/jpeg', 'public', 'public', 7512, '[]', '[]', '[]', '[]', 1, '2023-08-24 19:25:20', '2023-08-24 19:25:20'),
(629, 'App\\Models\\Car', 101, '40e82720-d830-4c3f-b048-5b98b1ebcfee', 'cars', 'IMG-20230824-WA0019', 'IMG-20230824-WA0019.jpg', 'image/jpeg', 'public', 'public', 7782, '[]', '[]', '[]', '[]', 2, '2023-08-24 19:25:20', '2023-08-24 19:25:20'),
(630, 'App\\Models\\Car', 101, '189f2cdd-ab79-4956-9861-f640a47157f3', 'cars-logo', 'IMG-20230824-WA0020', 'IMG-20230824-WA0020.jpg', 'image/jpeg', 'public', 'public', 7512, '[]', '[]', '[]', '[]', 3, '2023-08-24 19:25:20', '2023-08-24 19:25:20'),
(631, 'App\\Models\\Car', 102, '9d1fbffb-274d-4150-b04a-39e08696c780', 'cars', 'IMG-20230824-WA0021', 'IMG-20230824-WA0021.jpg', 'image/jpeg', 'public', 'public', 41836, '[]', '[]', '[]', '[]', 1, '2023-08-24 19:31:18', '2023-08-24 19:31:18'),
(632, 'App\\Models\\Car', 102, '71f4b6bf-f091-4b13-b6e5-3001bdc0f975', 'cars-logo', 'IMG-20230824-WA0021', 'IMG-20230824-WA0021.jpg', 'image/jpeg', 'public', 'public', 41836, '[]', '[]', '[]', '[]', 2, '2023-08-24 19:31:18', '2023-08-24 19:31:18'),
(633, 'App\\Models\\Car', 103, '1e67e2f2-6d61-4c0d-876d-b5861ee283f1', 'cars', 'IMG-20230824-WA0022', 'IMG-20230824-WA0022.jpg', 'image/jpeg', 'public', 'public', 72331, '[]', '[]', '[]', '[]', 1, '2023-08-24 19:40:14', '2023-08-24 19:40:14'),
(634, 'App\\Models\\Car', 103, '7534d394-1641-4ff7-81e9-3125b23ec37d', 'cars-logo', 'IMG-20230824-WA0022', 'IMG-20230824-WA0022.jpg', 'image/jpeg', 'public', 'public', 72331, '[]', '[]', '[]', '[]', 2, '2023-08-24 19:40:14', '2023-08-24 19:40:14'),
(635, 'App\\Models\\User', 14, 'dbcf3742-383b-431f-9564-84eeb1d0e9a3', 'users-logo', 'images.jpeg-4', 'images.jpeg-4.jpg', 'image/jpeg', 'public', 'public', 4878, '[]', '[]', '[]', '[]', 1, '2023-08-24 19:59:06', '2023-08-24 19:59:06'),
(636, 'App\\Models\\Car', 104, '609db4aa-51ae-4cc4-b6c1-7f2a3b94958b', 'cars', 'IMG-20230824-WA0025', 'IMG-20230824-WA0025.jpg', 'image/jpeg', 'public', 'public', 64436, '[]', '[]', '[]', '[]', 1, '2023-08-24 20:04:41', '2023-08-24 20:04:41'),
(637, 'App\\Models\\Car', 104, '013cd0c9-e196-40be-90c7-da8fd6e15dee', 'cars', 'IMG-20230824-WA0023', 'IMG-20230824-WA0023.jpg', 'image/jpeg', 'public', 'public', 69910, '[]', '[]', '[]', '[]', 2, '2023-08-24 20:04:41', '2023-08-24 20:04:41'),
(638, 'App\\Models\\Car', 104, 'f72ab90e-dff6-4f9a-8858-cecbcae281a5', 'cars-logo', 'IMG-20230824-WA0024', 'IMG-20230824-WA0024.jpg', 'image/jpeg', 'public', 'public', 72530, '[]', '[]', '[]', '[]', 3, '2023-08-24 20:04:41', '2023-08-24 20:04:41'),
(640, 'App\\Models\\Car', 105, 'f46a7d86-aac5-45e0-97ee-081941e5e9e9', 'cars', '4 (1)', '4-(1).png', 'image/png', 'public', 'public', 131506, '[]', '[]', '[]', '[]', 1, '2023-08-27 13:24:16', '2023-08-27 13:24:16'),
(641, 'App\\Models\\Car', 105, '5223ed1e-9623-4504-b2bd-10319e2cbbf3', 'cars', '3 (1)', '3-(1).png', 'image/png', 'public', 'public', 265687, '[]', '[]', '[]', '[]', 2, '2023-08-27 13:24:16', '2023-08-27 13:24:16'),
(642, 'App\\Models\\Car', 105, '9db86ec3-18f1-49e8-a1cb-c7996c2e2252', 'cars-logo', '1 (2)', '1-(2).png', 'image/png', 'public', 'public', 193154, '[]', '[]', '[]', '[]', 3, '2023-08-27 13:24:16', '2023-08-27 13:24:16'),
(643, 'App\\Models\\Car', 106, 'c02aaa73-4031-4ed1-92a8-b04e08307336', 'cars', 'IMG_20230328_150113', 'IMG_20230328_150113.jpg', 'image/jpeg', 'public', 'public', 123116, '[]', '[]', '[]', '[]', 1, '2023-08-27 16:30:55', '2023-08-27 16:30:55'),
(644, 'App\\Models\\Car', 106, 'ceef376f-9222-4e16-ad3f-9e2d90f37eeb', 'cars-logo', 'IMG_20230328_150120', 'IMG_20230328_150120.jpg', 'image/jpeg', 'public', 'public', 99905, '[]', '[]', '[]', '[]', 2, '2023-08-27 16:30:55', '2023-08-27 16:30:55'),
(657, 'App\\Models\\Car', 107, 'f74dc359-3875-4c79-a120-6c0e92ee672c', 'cars', 'IMG_20230328_150113', 'IMG_20230328_150113.jpg', 'image/jpeg', 'public', 'public', 123116, '[]', '[]', '[]', '[]', 1, '2023-08-28 17:00:58', '2023-08-28 17:00:58'),
(658, 'App\\Models\\Car', 107, 'd2e89264-1363-4a68-9d5f-b10414bcb536', 'cars-logo', 'IMG_20230328_150120', 'IMG_20230328_150120.jpg', 'image/jpeg', 'public', 'public', 99905, '[]', '[]', '[]', '[]', 2, '2023-08-28 17:00:58', '2023-08-28 17:00:58'),
(659, 'App\\Models\\Car', 108, '3d26adc0-b79c-46ed-9a8f-9cb92e9c6a29', 'cars', 'IMG-20230829-WA0000', 'IMG-20230829-WA0000.jpg', 'image/jpeg', 'public', 'public', 24723, '[]', '[]', '[]', '[]', 1, '2023-08-29 09:56:57', '2023-08-29 09:56:57'),
(660, 'App\\Models\\Car', 108, '8c181a6e-422f-4bc4-9ba8-35343e3d2ed2', 'cars-logo', 'IMG-20230829-WA0000', 'IMG-20230829-WA0000.jpg', 'image/jpeg', 'public', 'public', 24723, '[]', '[]', '[]', '[]', 2, '2023-08-29 09:56:57', '2023-08-29 09:56:57'),
(661, 'App\\Models\\CarType', 9, 'da36f4d5-d24f-4aa0-bf59-34b96769060b', 'car_types-icon', 'delivery-van', 'delivery-van.png', 'image/png', 'public', 'public', 12405, '[]', '[]', '[]', '[]', 1, '2023-08-29 10:45:15', '2023-08-29 10:45:15'),
(662, 'App\\Models\\Car', 109, 'e4c3a6a8-62d5-428e-a5ca-56eca36211a9', 'cars', 'IMG-20230824-WA0020(1)', 'IMG-20230824-WA0020(1).jpg', 'image/jpeg', 'public', 'public', 7512, '[]', '[]', '[]', '[]', 1, '2023-08-29 10:47:15', '2023-08-29 10:47:15'),
(663, 'App\\Models\\Car', 109, '95c0436e-9e7b-4067-a080-db8b64ee4da1', 'cars', 'IMG-20230824-WA0020', 'IMG-20230824-WA0020.jpg', 'image/jpeg', 'public', 'public', 7512, '[]', '[]', '[]', '[]', 2, '2023-08-29 10:47:15', '2023-08-29 10:47:15'),
(664, 'App\\Models\\Car', 109, 'c8e8020d-bd0d-45e1-83ef-5fe513e92106', 'cars-logo', 'IMG-20230824-WA0019', 'IMG-20230824-WA0019.jpg', 'image/jpeg', 'public', 'public', 7782, '[]', '[]', '[]', '[]', 3, '2023-08-29 10:47:15', '2023-08-29 10:47:15'),
(665, 'App\\Models\\CarType', 8, '38aa8d9a-5c9a-40d6-b7b7-0ddb3c550b35', 'car_types-icon', 'ferrari (1)', 'ferrari-(1).png', 'image/png', 'public', 'public', 23664, '[]', '[]', '[]', '[]', 1, '2023-08-29 10:47:20', '2023-08-29 10:47:20'),
(666, 'App\\Models\\CarType', 7, '5ca0dc7f-f49e-4ba1-8eeb-aa55af690322', 'car_types-icon', 'hatchback-car', 'hatchback-car.png', 'image/png', 'public', 'public', 14714, '[]', '[]', '[]', '[]', 1, '2023-08-29 10:49:11', '2023-08-29 10:49:11'),
(667, 'App\\Models\\CarType', 6, 'f2044bec-35b4-4815-a10b-1ffa3044ee50', 'car_types-icon', 'pickup', 'pickup.png', 'image/png', 'public', 'public', 16453, '[]', '[]', '[]', '[]', 1, '2023-08-29 10:50:01', '2023-08-29 10:50:01'),
(668, 'App\\Models\\CarType', 5, '39fc2de8-c030-40df-aa21-eb363b97545d', 'car_types-icon', 'car', 'car.png', 'image/png', 'public', 'public', 19412, '[]', '[]', '[]', '[]', 1, '2023-08-29 10:51:13', '2023-08-29 10:51:13'),
(669, 'App\\Models\\CarType', 2, '725c8c37-1aa0-4267-895c-6cc22058ef94', 'car_types-icon', 'crossover', 'crossover.png', 'image/png', 'public', 'public', 14789, '[]', '[]', '[]', '[]', 1, '2023-08-29 10:51:47', '2023-08-29 10:51:47'),
(670, 'App\\Models\\CarType', 1, '001d340c-27fc-48bf-b3e2-cc51f2d3f1c9', 'car_types-icon', 'sedan-car-model', 'sedan-car-model.png', 'image/png', 'public', 'public', 19160, '[]', '[]', '[]', '[]', 1, '2023-08-29 10:52:29', '2023-08-29 10:52:29'),
(671, 'App\\Models\\Car', 110, '790e5635-2100-450f-a300-c6c5828ee87b', 'cars', '1000055770', '1000055770.jpg', 'image/jpeg', 'public', 'public', 46754, '[]', '[]', '[]', '[]', 1, '2023-08-29 10:52:36', '2023-08-29 10:52:36'),
(672, 'App\\Models\\Car', 110, '016efc5f-d012-4250-a382-276ab50f149a', 'cars', '1000055770', '1000055770.jpg', 'image/jpeg', 'public', 'public', 46754, '[]', '[]', '[]', '[]', 2, '2023-08-29 10:52:36', '2023-08-29 10:52:36'),
(673, 'App\\Models\\Car', 110, 'a4ec4244-aca6-4354-8db3-3c17b48e9dd1', 'cars', '1000055770', '1000055770.jpg', 'image/jpeg', 'public', 'public', 46754, '[]', '[]', '[]', '[]', 3, '2023-08-29 10:52:36', '2023-08-29 10:52:36'),
(674, 'App\\Models\\Car', 110, '77a5d554-3e97-428c-bdbd-2642645ca661', 'cars', '1000055770', '1000055770.jpg', 'image/jpeg', 'public', 'public', 46754, '[]', '[]', '[]', '[]', 4, '2023-08-29 10:52:36', '2023-08-29 10:52:36'),
(675, 'App\\Models\\Car', 110, '6bd193de-27fb-4a61-b71d-ccf1522bea42', 'cars', '1000055770', '1000055770.jpg', 'image/jpeg', 'public', 'public', 46754, '[]', '[]', '[]', '[]', 5, '2023-08-29 10:52:36', '2023-08-29 10:52:36'),
(676, 'App\\Models\\Car', 110, 'af5ae352-cbdd-490e-95ea-325217ea20f0', 'cars', '1000055770', '1000055770.jpg', 'image/jpeg', 'public', 'public', 46754, '[]', '[]', '[]', '[]', 6, '2023-08-29 10:52:36', '2023-08-29 10:52:36'),
(677, 'App\\Models\\Car', 110, '4bb9a768-d8e8-456a-8375-d3e7dcb42484', 'cars-logo', '1000055770', '1000055770.jpg', 'image/jpeg', 'public', 'public', 46754, '[]', '[]', '[]', '[]', 7, '2023-08-29 10:52:36', '2023-08-29 10:52:36'),
(678, 'App\\Models\\Car', 111, '8241e793-7539-4946-b95a-c07dc87497d9', 'cars', 'IMG-20230829-WA0002', 'IMG-20230829-WA0002.jpg', 'image/jpeg', 'public', 'public', 36504, '[]', '[]', '[]', '[]', 1, '2023-08-29 10:58:03', '2023-08-29 10:58:03'),
(679, 'App\\Models\\Car', 111, '35231424-72dd-45ca-96d3-a0663d807574', 'cars-logo', 'IMG-20230829-WA0002', 'IMG-20230829-WA0002.jpg', 'image/jpeg', 'public', 'public', 36504, '[]', '[]', '[]', '[]', 2, '2023-08-29 10:58:03', '2023-08-29 10:58:03'),
(680, 'App\\Models\\Car', 112, '870a47be-b0da-416d-8098-9f53d196f7a9', 'cars-logo', 'big-up_cc15e61ba1a85a900888a32b30878773', 'big-up_cc15e61ba1a85a900888a32b30878773.png', 'image/png', 'public', 'public', 147954, '[]', '[]', '[]', '[]', 1, '2023-08-29 11:02:32', '2023-08-29 11:02:32'),
(681, 'App\\Models\\Car', 112, '819d6679-d608-43cd-91bf-6f2922acd93f', 'cars-door-1', 'big-up_cc15e61ba1a85a900888a32b30878773', 'big-up_cc15e61ba1a85a900888a32b30878773.png', 'image/png', 'public', 'public', 147954, '[]', '[]', '[]', '[]', 2, '2023-08-29 11:02:32', '2023-08-29 11:02:32'),
(682, 'App\\Models\\Car', 112, 'd1c72222-290f-48fa-bff9-b46ef3cc6cf7', 'cars-door-2', 'big-up_cc15e61ba1a85a900888a32b30878773', 'big-up_cc15e61ba1a85a900888a32b30878773.png', 'image/png', 'public', 'public', 147954, '[]', '[]', '[]', '[]', 3, '2023-08-29 11:02:32', '2023-08-29 11:02:32'),
(683, 'App\\Models\\Car', 112, '8decf7b0-5c7c-4f3e-98c9-93651eb06b2d', 'cars-door-3', 'big-up_cc15e61ba1a85a900888a32b30878773', 'big-up_cc15e61ba1a85a900888a32b30878773.png', 'image/png', 'public', 'public', 147954, '[]', '[]', '[]', '[]', 4, '2023-08-29 11:02:32', '2023-08-29 11:02:32'),
(684, 'App\\Models\\Car', 112, '731248ef-e2be-4a0c-b396-d4a6d2e9053a', 'cars-door-4', 'big-up_cc15e61ba1a85a900888a32b30878773', 'big-up_cc15e61ba1a85a900888a32b30878773.png', 'image/png', 'public', 'public', 147954, '[]', '[]', '[]', '[]', 5, '2023-08-29 11:02:32', '2023-08-29 11:02:32'),
(685, 'App\\Models\\Showroom', 13, '883bf431-fc4e-4891-8f93-3be37aeb9737', 'showrooms-cover_image', 'ررر', 'ررر.jpg', 'image/jpeg', 'public', 'public', 30361, '[]', '[]', '[]', '[]', 4, '2023-08-29 11:03:51', '2023-08-29 11:03:51'),
(686, 'App\\Models\\Car', 113, '20c2c52f-a75b-45c8-841d-2c9b455e9851', 'cars', 'IMG-20230824-WA0018', 'IMG-20230824-WA0018.jpg', 'image/jpeg', 'public', 'public', 97247, '[]', '[]', '[]', '[]', 1, '2023-08-29 11:04:48', '2023-08-29 11:04:48'),
(687, 'App\\Models\\Car', 113, '4b454147-fa0e-4c4a-8f84-6042ec7354c5', 'cars', 'IMG-20230824-WA0017', 'IMG-20230824-WA0017.jpg', 'image/jpeg', 'public', 'public', 87081, '[]', '[]', '[]', '[]', 2, '2023-08-29 11:04:48', '2023-08-29 11:04:48'),
(688, 'App\\Models\\Car', 113, 'be0a3f27-f23c-423a-94cd-e6592a917478', 'cars', 'IMG-20230824-WA0016', 'IMG-20230824-WA0016.jpg', 'image/jpeg', 'public', 'public', 75491, '[]', '[]', '[]', '[]', 3, '2023-08-29 11:04:48', '2023-08-29 11:04:48'),
(689, 'App\\Models\\Car', 113, '7af1de13-99ba-4af1-a98f-d67725ae56fe', 'cars-logo', 'IMG-20230824-WA0015', 'IMG-20230824-WA0015.jpg', 'image/jpeg', 'public', 'public', 102049, '[]', '[]', '[]', '[]', 4, '2023-08-29 11:04:48', '2023-08-29 11:04:48'),
(690, 'App\\Models\\Car', 114, 'd676bc8b-5a2c-473e-a26d-a8990b820b7e', 'cars-logo', 'images', 'images.png', 'image/jpeg', 'public', 'public', 5071, '[]', '[]', '[]', '[]', 1, '2023-08-29 11:10:49', '2023-08-29 11:10:49'),
(691, 'App\\Models\\Car', 114, '8313513d-526f-4dd9-96a5-b1643056a990', 'cars-door-1', 'images', 'images.png', 'image/jpeg', 'public', 'public', 5071, '[]', '[]', '[]', '[]', 2, '2023-08-29 11:10:49', '2023-08-29 11:10:49'),
(692, 'App\\Models\\Car', 114, 'a0bbc0f2-bd7b-48d6-8e17-f3b3c3c39396', 'cars-door-2', 'images', 'images.png', 'image/jpeg', 'public', 'public', 5071, '[]', '[]', '[]', '[]', 3, '2023-08-29 11:10:49', '2023-08-29 11:10:49'),
(693, 'App\\Models\\Car', 114, 'cdad8436-4da2-4eba-ba26-1d6da874291d', 'cars-door-3', 'images', 'images.png', 'image/jpeg', 'public', 'public', 5071, '[]', '[]', '[]', '[]', 4, '2023-08-29 11:10:49', '2023-08-29 11:10:49'),
(694, 'App\\Models\\Car', 114, '17a72bed-3c68-4ba6-80a9-b7b1e44e231a', 'cars-door-4', 'images', 'images.png', 'image/jpeg', 'public', 'public', 5071, '[]', '[]', '[]', '[]', 5, '2023-08-29 11:10:49', '2023-08-29 11:10:49'),
(695, 'App\\Models\\Car', 115, 'c04afab3-0588-4287-9540-b94b2ae65943', 'cars', 'IMG-20230829-WA0028', 'IMG-20230829-WA0028.jpg', 'image/jpeg', 'public', 'public', 33180, '[]', '[]', '[]', '[]', 1, '2023-08-29 11:14:37', '2023-08-29 11:14:37'),
(696, 'App\\Models\\Car', 115, '8f852f19-786f-454b-9b94-c937dd8cf729', 'cars', 'IMG-20230829-WA0028', 'IMG-20230829-WA0028.jpg', 'image/jpeg', 'public', 'public', 33180, '[]', '[]', '[]', '[]', 2, '2023-08-29 11:14:37', '2023-08-29 11:14:37'),
(697, 'App\\Models\\Car', 115, 'fb0ba1bc-0038-453a-b999-868b43a06a8c', 'cars', 'IMG-20230829-WA0028', 'IMG-20230829-WA0028.jpg', 'image/jpeg', 'public', 'public', 33180, '[]', '[]', '[]', '[]', 3, '2023-08-29 11:14:37', '2023-08-29 11:14:37'),
(698, 'App\\Models\\Car', 115, '83a34ff9-006f-4df5-9700-1ac747ec7992', 'cars', 'IMG-20230829-WA0028', 'IMG-20230829-WA0028.jpg', 'image/jpeg', 'public', 'public', 33180, '[]', '[]', '[]', '[]', 4, '2023-08-29 11:14:37', '2023-08-29 11:14:37'),
(699, 'App\\Models\\Car', 115, 'e3937012-f7cc-4fbb-993c-f7bee5146054', 'cars-logo', 'IMG-20230829-WA0028', 'IMG-20230829-WA0028.jpg', 'image/jpeg', 'public', 'public', 33180, '[]', '[]', '[]', '[]', 5, '2023-08-29 11:14:37', '2023-08-29 11:14:37'),
(700, 'App\\Models\\Car', 116, 'a49704bf-b9ad-456b-ba61-557436e16973', 'cars', 'IMG-20230829-WA0003', 'IMG-20230829-WA0003.jpg', 'image/jpeg', 'public', 'public', 167030, '[]', '[]', '[]', '[]', 1, '2023-08-29 11:18:11', '2023-08-29 11:18:11'),
(701, 'App\\Models\\Car', 116, '4e56e4ae-f879-4483-8179-788c03b0e709', 'cars-logo', 'IMG-20230829-WA0004', 'IMG-20230829-WA0004.jpg', 'image/jpeg', 'public', 'public', 161052, '[]', '[]', '[]', '[]', 2, '2023-08-29 11:18:11', '2023-08-29 11:18:11'),
(702, 'App\\Models\\Car', 117, '951cea0c-3ca4-40fb-8fd5-1da5435617ff', 'cars', 'IMG-20230829-WA0012', 'IMG-20230829-WA0012.jpg', 'image/jpeg', 'public', 'public', 35359, '[]', '[]', '[]', '[]', 1, '2023-08-29 11:28:26', '2023-08-29 11:28:26'),
(703, 'App\\Models\\Car', 117, '3360063e-8e4f-4437-89ea-f53eeb4b6d65', 'cars', 'IMG-20230829-WA0011', 'IMG-20230829-WA0011.jpg', 'image/jpeg', 'public', 'public', 57436, '[]', '[]', '[]', '[]', 2, '2023-08-29 11:28:26', '2023-08-29 11:28:26'),
(704, 'App\\Models\\Car', 117, '5f0395ba-c81e-4b62-badc-fd3348742501', 'cars-logo', 'IMG-20230829-WA0008', 'IMG-20230829-WA0008.jpg', 'image/jpeg', 'public', 'public', 37957, '[]', '[]', '[]', '[]', 3, '2023-08-29 11:28:26', '2023-08-29 11:28:26'),
(705, 'App\\Models\\Car', 118, 'a7292483-c1e1-4a5b-9961-22a1fe8fa6ea', 'cars-logo', 'big-up_d6813715c4ff4d0a2e404b8157616f31', 'big-up_d6813715c4ff4d0a2e404b8157616f31.png', 'image/jpeg', 'public', 'public', 48833, '[]', '[]', '[]', '[]', 1, '2023-08-29 11:32:10', '2023-08-29 11:32:10'),
(706, 'App\\Models\\Car', 118, 'bc350cc7-7dbb-44a3-83be-b8e89c30445e', 'cars-door-1', 'big-up_d6813715c4ff4d0a2e404b8157616f31', 'big-up_d6813715c4ff4d0a2e404b8157616f31.png', 'image/jpeg', 'public', 'public', 48833, '[]', '[]', '[]', '[]', 2, '2023-08-29 11:32:10', '2023-08-29 11:32:10'),
(707, 'App\\Models\\Car', 118, 'b2666476-28ca-4692-aeae-7aaa7d33b36c', 'cars-door-2', 'big-up_d6813715c4ff4d0a2e404b8157616f31', 'big-up_d6813715c4ff4d0a2e404b8157616f31.png', 'image/jpeg', 'public', 'public', 48833, '[]', '[]', '[]', '[]', 3, '2023-08-29 11:32:10', '2023-08-29 11:32:10'),
(708, 'App\\Models\\Car', 118, '87932989-e809-4b53-8609-f0c963f4ce19', 'cars-door-3', 'big-up_d6813715c4ff4d0a2e404b8157616f31', 'big-up_d6813715c4ff4d0a2e404b8157616f31.png', 'image/jpeg', 'public', 'public', 48833, '[]', '[]', '[]', '[]', 4, '2023-08-29 11:32:10', '2023-08-29 11:32:10'),
(709, 'App\\Models\\Car', 118, 'e643edfa-34bf-40fb-aea1-74219dd1b31b', 'cars-door-4', 'big-up_d6813715c4ff4d0a2e404b8157616f31', 'big-up_d6813715c4ff4d0a2e404b8157616f31.png', 'image/jpeg', 'public', 'public', 48833, '[]', '[]', '[]', '[]', 5, '2023-08-29 11:32:10', '2023-08-29 11:32:10'),
(710, 'App\\Models\\Car', 119, 'f33311e9-f898-455c-914b-2600153b77a4', 'cars', 'IMG-20230829-WA0014', 'IMG-20230829-WA0014.jpg', 'image/jpeg', 'public', 'public', 54653, '[]', '[]', '[]', '[]', 1, '2023-08-29 11:37:47', '2023-08-29 11:37:47'),
(711, 'App\\Models\\Car', 119, '8cfe1e61-4597-4146-8e37-9e533a2ce476', 'cars', 'IMG-20230829-WA0015', 'IMG-20230829-WA0015.jpg', 'image/jpeg', 'public', 'public', 46237, '[]', '[]', '[]', '[]', 2, '2023-08-29 11:37:47', '2023-08-29 11:37:47'),
(712, 'App\\Models\\Car', 119, '3554e1fd-e616-49aa-bbc2-d13110d9e572', 'cars-logo', 'IMG-20230829-WA0016', 'IMG-20230829-WA0016.jpg', 'image/jpeg', 'public', 'public', 52080, '[]', '[]', '[]', '[]', 3, '2023-08-29 11:37:47', '2023-08-29 11:37:47'),
(713, 'App\\Models\\Car', 120, 'dbec06e9-bded-4a60-ace9-0b2a66eabfda', 'cars-logo', 'big-up_cff33ddb848df142707bbdfd1abc2d9e', 'big-up_cff33ddb848df142707bbdfd1abc2d9e.png', 'image/png', 'public', 'public', 231109, '[]', '[]', '[]', '[]', 1, '2023-08-29 11:48:34', '2023-08-29 11:48:34'),
(714, 'App\\Models\\Car', 120, '8a9dc541-add1-4073-af01-e343e0941a0e', 'cars-door-1', 'big-up_cff33ddb848df142707bbdfd1abc2d9e', 'big-up_cff33ddb848df142707bbdfd1abc2d9e.png', 'image/png', 'public', 'public', 231109, '[]', '[]', '[]', '[]', 2, '2023-08-29 11:48:34', '2023-08-29 11:48:34'),
(715, 'App\\Models\\Car', 120, '6e9a26a2-1c3c-4a16-b7e9-ab78667466a5', 'cars-door-2', 'big-up_cff33ddb848df142707bbdfd1abc2d9e', 'big-up_cff33ddb848df142707bbdfd1abc2d9e.png', 'image/png', 'public', 'public', 231109, '[]', '[]', '[]', '[]', 3, '2023-08-29 11:48:34', '2023-08-29 11:48:34'),
(716, 'App\\Models\\Car', 120, '201bfaba-7332-46d4-b591-7e7bffda83d1', 'cars-door-3', 'big-up_cff33ddb848df142707bbdfd1abc2d9e', 'big-up_cff33ddb848df142707bbdfd1abc2d9e.png', 'image/png', 'public', 'public', 231109, '[]', '[]', '[]', '[]', 4, '2023-08-29 11:48:34', '2023-08-29 11:48:34'),
(717, 'App\\Models\\Car', 120, '525f7f57-3de3-4a87-8f60-a3808b2a6987', 'cars-door-4', 'big-up_cff33ddb848df142707bbdfd1abc2d9e', 'big-up_cff33ddb848df142707bbdfd1abc2d9e.png', 'image/png', 'public', 'public', 231109, '[]', '[]', '[]', '[]', 5, '2023-08-29 11:48:34', '2023-08-29 11:48:34'),
(718, 'App\\Models\\Car', 121, '02570fdf-572e-4fcd-8735-bf7e38d9333d', 'cars-logo', 'big-up_cff33ddb848df142707bbdfd1abc2d9e', 'big-up_cff33ddb848df142707bbdfd1abc2d9e.png', 'image/png', 'public', 'public', 231109, '[]', '[]', '[]', '[]', 1, '2023-08-29 11:55:40', '2023-08-29 11:55:40'),
(719, 'App\\Models\\Car', 121, 'f4ca9cb5-e6a3-4f73-a10b-96381969a5b3', 'cars-door-1', 'big-up_cff33ddb848df142707bbdfd1abc2d9e', 'big-up_cff33ddb848df142707bbdfd1abc2d9e.png', 'image/png', 'public', 'public', 231109, '[]', '[]', '[]', '[]', 2, '2023-08-29 11:55:40', '2023-08-29 11:55:40'),
(720, 'App\\Models\\Car', 121, '00bdac0d-a67a-4f1d-8fd3-6f114d8d4529', 'cars-door-2', 'big-up_cff33ddb848df142707bbdfd1abc2d9e', 'big-up_cff33ddb848df142707bbdfd1abc2d9e.png', 'image/png', 'public', 'public', 231109, '[]', '[]', '[]', '[]', 3, '2023-08-29 11:55:40', '2023-08-29 11:55:40'),
(721, 'App\\Models\\Car', 121, '7cd4a6fa-5b53-44de-93cf-04f919ae1608', 'cars-door-3', 'big-up_cff33ddb848df142707bbdfd1abc2d9e', 'big-up_cff33ddb848df142707bbdfd1abc2d9e.png', 'image/png', 'public', 'public', 231109, '[]', '[]', '[]', '[]', 4, '2023-08-29 11:55:40', '2023-08-29 11:55:40'),
(722, 'App\\Models\\Car', 121, 'f71f37f4-3e85-40a1-a711-45ae1be0eace', 'cars-door-4', 'big-up_cff33ddb848df142707bbdfd1abc2d9e', 'big-up_cff33ddb848df142707bbdfd1abc2d9e.png', 'image/png', 'public', 'public', 231109, '[]', '[]', '[]', '[]', 5, '2023-08-29 11:55:40', '2023-08-29 11:55:40'),
(728, 'App\\Models\\Car', 122, '4c052998-3fcd-426d-862b-de7bec4cb183', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-29 12:38:15', '2023-08-29 12:38:15'),
(729, 'App\\Models\\Car', 122, '5ee7e9b1-c7e2-481c-9d79-63f7c9422c7f', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-29 12:38:15', '2023-08-29 12:38:15'),
(730, 'App\\Models\\Car', 123, 'c165ba6c-8ab8-411f-a2f7-9b7546fe615b', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-29 12:38:31', '2023-08-29 12:38:31'),
(731, 'App\\Models\\Car', 123, '70cd6cc1-8f18-47d9-bb8c-38b3418030f0', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-29 12:38:31', '2023-08-29 12:38:31'),
(732, 'App\\Models\\Car', 124, '3d1ab62f-aeef-489a-8220-f5e9c1689193', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-29 12:40:33', '2023-08-29 12:40:33'),
(733, 'App\\Models\\Car', 124, '6d40db00-106d-44ed-b230-7453afd0d360', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-29 12:40:33', '2023-08-29 12:40:33'),
(736, 'App\\Models\\User', 12, '714024a3-3945-4599-bffe-73a08b924283', 'users-logo', 'image_picker_371328CB-05C6-4A6D-9594-9EB111F53737-94177-00002E080BCCCA04', 'image_picker_371328CB-05C6-4A6D-9594-9EB111F53737-94177-00002E080BCCCA04.jpg', 'image/jpeg', 'public', 'public', 1483806, '[]', '[]', '[]', '[]', 1, '2023-08-29 16:05:09', '2023-08-29 16:05:09'),
(738, 'App\\Models\\User', 22, '5da21715-7864-4c10-8ef7-6cd3ac7d71f4', 'users-logo', 'Screenshot_2023-08-25-14-13-43-89_a23b203fd3aafc6dcb84e438dda678b6', 'Screenshot_2023-08-25-14-13-43-89_a23b203fd3aafc6dcb84e438dda678b6.jpg', 'image/jpeg', 'public', 'public', 497096, '[]', '[]', '[]', '[]', 1, '2023-08-30 09:33:24', '2023-08-30 09:33:24'),
(739, 'App\\Models\\Car', 125, '6c0a6ead-6616-4b25-bf5a-016c86a43b20', 'cars', 'WhatsApp Image 2023-08-30 at 10.44.46 AM', 'WhatsApp-Image-2023-08-30-at-10.44.46-AM.jpeg', 'image/jpeg', 'public', 'public', 283464, '[]', '[]', '[]', '[]', 1, '2023-08-30 11:43:32', '2023-08-30 11:43:32'),
(740, 'App\\Models\\Car', 125, 'a45f5f63-adae-4541-b2b0-44d9b6beffa1', 'cars-logo', 'WhatsApp Image 2023-08-30 at 10.44.41 AM', 'WhatsApp-Image-2023-08-30-at-10.44.41-AM.jpeg', 'image/jpeg', 'public', 'public', 203938, '[]', '[]', '[]', '[]', 2, '2023-08-30 11:43:32', '2023-08-30 11:43:32'),
(741, 'App\\Models\\Car', 125, 'eab5b568-dfb0-44f5-90be-77ef422b8cd8', 'cars-door-1', 'WhatsApp Image 2023-08-30 at 10.44.42 AM', 'WhatsApp-Image-2023-08-30-at-10.44.42-AM.jpeg', 'image/jpeg', 'public', 'public', 205220, '[]', '[]', '[]', '[]', 3, '2023-08-30 11:43:32', '2023-08-30 11:43:32'),
(742, 'App\\Models\\Car', 125, '1030fa9a-dce9-4a2c-9b9b-b9970654a3b3', 'cars-door-2', 'WhatsApp Image 2023-08-30 at 10.44.43 AM', 'WhatsApp-Image-2023-08-30-at-10.44.43-AM.jpeg', 'image/jpeg', 'public', 'public', 218865, '[]', '[]', '[]', '[]', 4, '2023-08-30 11:43:32', '2023-08-30 11:43:32'),
(743, 'App\\Models\\Car', 125, '93d12774-fb1f-4f68-9803-622d42137f0a', 'cars-door-3', 'WhatsApp Image 2023-08-30 at 10.44.44 AM', 'WhatsApp-Image-2023-08-30-at-10.44.44-AM.jpeg', 'image/jpeg', 'public', 'public', 214178, '[]', '[]', '[]', '[]', 5, '2023-08-30 11:43:32', '2023-08-30 11:43:32'),
(744, 'App\\Models\\Car', 125, 'aef1bde9-fc5c-4e23-bddc-2ab22c88d2d6', 'cars-door-4', 'WhatsApp Image 2023-08-30 at 10.44.45 AM', 'WhatsApp-Image-2023-08-30-at-10.44.45-AM.jpeg', 'image/jpeg', 'public', 'public', 216834, '[]', '[]', '[]', '[]', 6, '2023-08-30 11:43:32', '2023-08-30 11:43:32'),
(745, 'App\\Models\\Car', 126, '8bb45700-0564-47f1-8f67-480c16db2f8c', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 11:59:08', '2023-08-30 11:59:08'),
(746, 'App\\Models\\Car', 126, '3a8cf786-66bc-4eab-b865-40a3dcdb4d28', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 11:59:08', '2023-08-30 11:59:08'),
(747, 'App\\Models\\Car', 127, '798ad703-1c32-4972-91b7-6fecff35d49f', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 11:59:48', '2023-08-30 11:59:48'),
(748, 'App\\Models\\Car', 127, '37034916-06bc-471b-bd71-0a6f65159eda', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 11:59:48', '2023-08-30 11:59:48'),
(749, 'App\\Models\\Car', 128, '03d7aca2-101c-45a0-9d7a-87b8113482da', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:01:40', '2023-08-30 12:01:40'),
(750, 'App\\Models\\Car', 128, '10ef3c66-a445-404d-93a6-a9889461e352', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 12:01:40', '2023-08-30 12:01:40'),
(751, 'App\\Models\\Car', 129, '6aa7af0f-222e-4b6a-aecb-5ad1c09dbf98', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:04:59', '2023-08-30 12:04:59'),
(752, 'App\\Models\\Car', 129, '342425a4-fbd5-433f-8cdb-5776f1a7d5eb', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 12:04:59', '2023-08-30 12:04:59'),
(753, 'App\\Models\\Car', 130, '63a4acbd-192a-44f5-aaa4-e5055b69a118', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:05:37', '2023-08-30 12:05:37'),
(754, 'App\\Models\\Car', 130, '9f689968-a570-4eb3-9d20-018241541616', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 12:05:37', '2023-08-30 12:05:37'),
(755, 'App\\Models\\Car', 131, 'd6b7e42f-5a94-42ca-8f3a-bcf972d47b7b', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:07:12', '2023-08-30 12:07:12'),
(756, 'App\\Models\\Car', 131, '09066641-fdfe-4332-9619-de4ddd725c18', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 12:07:12', '2023-08-30 12:07:12'),
(757, 'App\\Models\\Car', 132, 'e39cd9bd-e606-4849-aeb3-5b0fe518f877', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:07:17', '2023-08-30 12:07:17'),
(758, 'App\\Models\\Car', 132, '15604382-949b-4ac8-874c-1a3c402caccc', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 12:07:17', '2023-08-30 12:07:17'),
(759, 'App\\Models\\Car', 133, '72e1f46b-ea86-4737-b00b-75c3b6d109b9', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:07:56', '2023-08-30 12:07:56'),
(760, 'App\\Models\\Car', 133, 'b24d5fba-997c-4dfb-8606-918b04a32cf6', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 12:07:56', '2023-08-30 12:07:56'),
(761, 'App\\Models\\Car', 134, 'c6198adc-e7cd-4e5d-9f55-2eec0a369205', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:08:25', '2023-08-30 12:08:25'),
(762, 'App\\Models\\Car', 134, 'd25bf2ad-953a-4ef5-a9fa-9886f824f723', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 12:08:25', '2023-08-30 12:08:25'),
(763, 'App\\Models\\Car', 135, 'c27e1138-d071-466a-8ec6-54889887c986', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:08:41', '2023-08-30 12:08:41'),
(764, 'App\\Models\\Car', 135, '28b97a55-8cd2-4bab-ae62-54feaad2d236', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 12:08:41', '2023-08-30 12:08:41'),
(765, 'App\\Models\\Car', 136, '21f9980f-da9b-4f4d-8d8e-704988f0b221', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:09:56', '2023-08-30 12:09:56'),
(766, 'App\\Models\\Car', 136, 'aa7fb1c2-22f4-4dfe-b91e-b9ac72ed0048', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 12:09:56', '2023-08-30 12:09:56'),
(767, 'App\\Models\\Car', 137, 'af042213-cf1e-4c4b-a83a-dfce79a3cd28', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:13:12', '2023-08-30 12:13:12'),
(768, 'App\\Models\\Car', 137, 'affc81ca-b5b7-4e90-8469-d31fae8ef279', 'cars-logo', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-08-30 12:13:12', '2023-08-30 12:13:12');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(769, 'App\\Models\\FeatureOption', 24, 'ecd77861-739d-4552-a8f1-b694eec2b836', 'feature_options-icon', 'cd-player', 'cd-player.png', 'image/png', 'public', 'public', 34978, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:25:29', '2023-08-30 12:25:29'),
(775, 'App\\Models\\FeatureOption', 16, '75279622-3c4c-4b2d-80cd-0deb0dd9ea36', 'feature_options-icon', 'car-window', 'car-window.png', 'image/png', 'public', 'public', 19336, '[]', '[]', '[]', '[]', 1, '2023-08-30 12:46:39', '2023-08-30 12:46:39'),
(776, 'App\\Models\\Car', 138, '26397aea-991d-42fb-a25d-4f4edbf13459', 'cars', 'Screenshot_2023-08-30-08-29-47-37_6913c1cfeed79049cb920262eb7ca918', 'Screenshot_2023-08-30-08-29-47-37_6913c1cfeed79049cb920262eb7ca918.jpg', 'image/jpeg', 'public', 'public', 671722, '[]', '[]', '[]', '[]', 1, '2023-08-30 13:14:49', '2023-08-30 13:14:49'),
(777, 'App\\Models\\Car', 138, '0100867d-8ba9-4411-b2ea-aac8b775e516', 'cars-logo', 'Screenshot_2023-08-30-08-29-47-37_6913c1cfeed79049cb920262eb7ca918', 'Screenshot_2023-08-30-08-29-47-37_6913c1cfeed79049cb920262eb7ca918.jpg', 'image/jpeg', 'public', 'public', 671722, '[]', '[]', '[]', '[]', 2, '2023-08-30 13:14:49', '2023-08-30 13:14:49'),
(778, 'App\\Models\\FeatureOption', 17, 'd579815a-2039-4e28-8db4-ab9d5cdbc03b', 'feature_options-icon', 'car-key', 'car-key.png', 'image/png', 'public', 'public', 30970, '[]', '[]', '[]', '[]', 1, '2023-08-30 13:15:05', '2023-08-30 13:15:05'),
(779, 'App\\Models\\FeatureOption', 18, 'ba9096fb-0a62-4291-9002-6a6c7b3148a7', 'feature_options-icon', 'seat', 'seat.png', 'image/png', 'public', 'public', 25006, '[]', '[]', '[]', '[]', 1, '2023-08-30 13:20:08', '2023-08-30 13:20:08'),
(780, 'App\\Models\\FeatureOption', 19, '8acde1aa-7a74-4bb1-b7d3-bfd308258d09', 'feature_options-icon', 'air-conditioner', 'air-conditioner.png', 'image/png', 'public', 'public', 29648, '[]', '[]', '[]', '[]', 1, '2023-08-30 13:32:47', '2023-08-30 13:32:47'),
(781, 'App\\Models\\FeatureOption', 20, '37b25f0a-d4e2-4390-9c96-2feae997f20d', 'feature_options-icon', 'camera-360', 'camera-360.png', 'image/png', 'public', 'public', 28097, '[]', '[]', '[]', '[]', 1, '2023-08-30 13:35:39', '2023-08-30 13:35:39'),
(782, 'App\\Models\\FeatureOption', 21, 'baa3ac6b-58aa-452e-afab-ea7bf9fd60be', 'feature_options-icon', 'usb-connector', 'usb-connector.png', 'image/png', 'public', 'public', 12458, '[]', '[]', '[]', '[]', 1, '2023-08-30 13:45:43', '2023-08-30 13:45:43'),
(783, 'App\\Models\\FeatureOption', 22, '3921f436-b1d9-431d-a6c7-0a61c542a0ba', 'feature_options-icon', 'navigation', 'navigation.png', 'image/png', 'public', 'public', 20268, '[]', '[]', '[]', '[]', 1, '2023-08-30 13:47:39', '2023-08-30 13:47:39'),
(784, 'App\\Models\\FeatureOption', 23, '15a2f27c-70e1-489a-9195-c7d0f309f134', 'feature_options-icon', 'car-radio', 'car-radio.png', 'image/png', 'public', 'public', 16340, '[]', '[]', '[]', '[]', 1, '2023-08-30 13:50:14', '2023-08-30 13:50:14'),
(785, 'App\\Models\\FeatureOption', 25, 'a7a4bb43-c733-4350-8cf9-29dd03bafbf0', 'feature_options-icon', 'headlight', 'headlight.png', 'image/png', 'public', 'public', 18262, '[]', '[]', '[]', '[]', 1, '2023-08-30 13:54:28', '2023-08-30 13:54:28'),
(786, 'App\\Models\\FeatureOption', 26, '4a15896f-b168-4bd6-a9d8-eb69fd960a26', 'feature_options-icon', 'headlight', 'headlight.png', 'image/png', 'public', 'public', 18262, '[]', '[]', '[]', '[]', 1, '2023-08-30 14:17:27', '2023-08-30 14:17:27'),
(788, 'App\\Models\\FeatureOption', 27, '5b400ab7-f5a9-4e52-97e3-6a27f976c128', 'feature_options-icon', 'rearview-mirror', 'rearview-mirror.png', 'image/png', 'public', 'public', 17436, '[]', '[]', '[]', '[]', 1, '2023-08-30 14:21:39', '2023-08-30 14:21:39'),
(790, 'App\\Models\\FeatureOption', 28, '450f5eef-cdc9-4d53-8a9c-2a2a93fa0ed0', 'feature_options-icon', 'sport-car', 'sport-car.png', 'image/png', 'public', 'public', 14774, '[]', '[]', '[]', '[]', 1, '2023-08-30 16:22:35', '2023-08-30 16:22:35'),
(791, 'App\\Models\\ReportOption', 135, 'a5014533-a541-4df4-b69c-0f27f7b1c569', 'report_options-icon', 'steering-wheel', 'steering-wheel.png', 'image/png', 'public', 'public', 32276, '[]', '[]', '[]', '[]', 1, '2023-08-30 16:26:00', '2023-08-30 16:26:00'),
(792, 'App\\Models\\ReportOption', 133, 'b66f0c6e-258d-42fe-be04-a1d231fc0819', 'report_options-icon', 'hood-open', 'hood-open.png', 'image/png', 'public', 'public', 15034, '[]', '[]', '[]', '[]', 1, '2023-08-30 16:28:08', '2023-08-30 16:28:08'),
(793, 'App\\Models\\ReportOption', 125, '90519e1a-3f85-44c2-9987-fd44f5f611f0', 'report_options-icon', 'water-tank', 'water-tank.png', 'image/png', 'public', 'public', 12229, '[]', '[]', '[]', '[]', 1, '2023-08-30 16:31:12', '2023-08-30 16:31:12'),
(794, 'App\\Models\\ReportOption', 126, 'ab52ab64-eec2-4cd3-8297-17063564e940', 'report_options-icon', 'safety-belt', 'safety-belt.png', 'image/png', 'public', 'public', 15311, '[]', '[]', '[]', '[]', 1, '2023-08-30 16:41:09', '2023-08-30 16:41:09'),
(795, 'App\\Models\\ReportOption', 127, '285df3ac-8ca0-4688-80fc-b6c3f6b681e5', 'report_options-icon', 'funnel', 'funnel.png', 'image/png', 'public', 'public', 20013, '[]', '[]', '[]', '[]', 1, '2023-08-30 16:43:13', '2023-08-30 16:43:13'),
(797, 'App\\Models\\ReportOption', 129, '8d49a85d-1aed-4b47-bba7-2d8bb12a7476', 'report_options-icon', 'axle', 'axle.png', 'image/png', 'public', 'public', 8378, '[]', '[]', '[]', '[]', 1, '2023-08-30 16:49:26', '2023-08-30 16:49:26'),
(798, 'App\\Models\\ReportOption', 130, 'b8024d8a-a068-4eca-87be-72a7c2de8402', 'report_options-icon', 'intake', 'intake.png', 'image/png', 'public', 'public', 27027, '[]', '[]', '[]', '[]', 1, '2023-08-30 16:51:19', '2023-08-30 16:51:19'),
(799, 'App\\Models\\User', 13, 'fa314c41-5ed0-4748-99c2-c96f38ff5177', 'users-logo', 'AUTOMOBILE', 'AUTOMOBILE.png', 'image/png', 'public', 'public', 32537, '[]', '[]', '[]', '[]', 1, '2023-08-30 16:57:18', '2023-08-30 16:57:18'),
(800, 'App\\Models\\Car', 139, '34021f26-d75c-4472-9491-fe98c85ebe1d', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 1, '2023-08-30 19:56:22', '2023-08-30 19:56:22'),
(801, 'App\\Models\\Car', 139, 'dca4a93e-1ff9-4b98-bfff-f45f648c638c', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 2, '2023-08-30 19:56:22', '2023-08-30 19:56:22'),
(802, 'App\\Models\\Car', 139, '005eb90b-cf2f-4e00-a019-23f10718d4a9', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 3, '2023-08-30 19:56:22', '2023-08-30 19:56:22'),
(803, 'App\\Models\\Car', 139, 'ca9d2f63-7648-4caf-9dfb-ceb6d10ca3b1', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 4, '2023-08-30 19:56:22', '2023-08-30 19:56:22'),
(804, 'App\\Models\\Car', 139, 'cec160a4-55d6-44df-a9d8-b9ac99ce93bb', 'cars-logo', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 5, '2023-08-30 19:56:23', '2023-08-30 19:56:23'),
(805, 'App\\Models\\ReportOption', 128, '4e9f6cb9-18d5-48d8-8277-ae0c5931de23', 'report_options-icon', 'air-purifier', 'air-purifier.png', 'image/png', 'public', 'public', 29896, '[]', '[]', '[]', '[]', 1, '2023-08-31 10:37:46', '2023-08-31 10:37:46'),
(806, 'App\\Models\\ReportOption', 131, 'c6928914-3188-4fba-8131-30f5b817d9f8', 'report_options-icon', 'car-radiator', 'car-radiator.png', 'image/png', 'public', 'public', 25621, '[]', '[]', '[]', '[]', 1, '2023-08-31 10:46:09', '2023-08-31 10:46:09'),
(807, 'App\\Models\\ReportOption', 134, '52673607-54f2-419b-ad36-cb52cf4a4a69', 'report_options-icon', 'tank', 'tank.png', 'image/png', 'public', 'public', 14818, '[]', '[]', '[]', '[]', 1, '2023-08-31 10:52:13', '2023-08-31 10:52:13'),
(808, 'App\\Models\\ReportOption', 136, 'a13f6ccf-e972-49d9-a34e-c60dd6812c37', 'report_options-icon', 'front-wiper', 'front-wiper.png', 'image/png', 'public', 'public', 25371, '[]', '[]', '[]', '[]', 1, '2023-08-31 10:58:25', '2023-08-31 10:58:25'),
(809, 'App\\Models\\ReportOption', 137, '3ea511a8-1c09-487c-be61-a597b32399ec', 'report_options-icon', 'car-radiator', 'car-radiator.png', 'image/png', 'public', 'public', 25621, '[]', '[]', '[]', '[]', 1, '2023-08-31 11:07:43', '2023-08-31 11:07:43'),
(810, 'App\\Models\\ReportOption', 138, 'a7b45e46-9fee-45e8-b888-b76d05caf7d6', 'report_options-icon', 'tank', 'tank.png', 'image/png', 'public', 'public', 14818, '[]', '[]', '[]', '[]', 1, '2023-08-31 11:09:19', '2023-08-31 11:09:19'),
(811, 'App\\Models\\ReportOption', 139, '7d6c2aee-689f-4ea2-ba84-72e80a33cdd0', 'report_options-icon', 'car-engine', 'car-engine.png', 'image/png', 'public', 'public', 7363, '[]', '[]', '[]', '[]', 1, '2023-08-31 11:13:15', '2023-08-31 11:13:15'),
(812, 'App\\Models\\ReportOption', 13, 'b7aa43de-a68f-4bcc-ad23-b3ba17b624bc', 'report_options-icon', 'generator', 'generator.png', 'image/png', 'public', 'public', 14388, '[]', '[]', '[]', '[]', 1, '2023-08-31 11:33:52', '2023-08-31 11:33:52'),
(813, 'App\\Models\\ReportOption', 14, 'fc052619-cd77-44dd-8737-4a411554c4bc', 'report_options-icon', 'ignition', 'ignition.png', 'image/png', 'public', 'public', 18676, '[]', '[]', '[]', '[]', 1, '2023-08-31 11:42:33', '2023-08-31 11:42:33'),
(814, 'App\\Models\\ReportOption', 105, 'f77edfa4-eead-498a-9c30-1f43fdfec5af', 'report_options-icon', 'headlight', 'headlight.png', 'image/png', 'public', 'public', 18262, '[]', '[]', '[]', '[]', 1, '2023-08-31 11:43:46', '2023-08-31 11:43:46'),
(815, 'App\\Models\\ReportOption', 106, '9c8bc38b-b36b-4484-8dca-a2056c02fedc', 'report_options-icon', 'air-conditioner', 'air-conditioner.png', 'image/png', 'public', 'public', 29648, '[]', '[]', '[]', '[]', 1, '2023-08-31 11:48:01', '2023-08-31 11:48:01'),
(816, 'App\\Models\\ReportOption', 109, 'd641e07d-c9df-44c3-a4c0-2fadd2ceed8b', 'report_options-icon', 'air-conditioner (1)', 'air-conditioner-(1).png', 'image/png', 'public', 'public', 10187, '[]', '[]', '[]', '[]', 1, '2023-08-31 12:01:42', '2023-08-31 12:01:42'),
(817, 'App\\Models\\ReportOption', 112, 'e3fca23f-f6ca-493d-a50d-38a86bb16cd6', 'report_options-icon', 'radiator', 'radiator.png', 'image/png', 'public', 'public', 14245, '[]', '[]', '[]', '[]', 1, '2023-08-31 13:29:56', '2023-08-31 13:29:56'),
(818, 'App\\Models\\ReportOption', 113, '9652363f-7f90-4f4b-8c7e-ab8574aa7094', 'report_options-icon', 'air-filter', 'air-filter.png', 'image/png', 'public', 'public', 8170, '[]', '[]', '[]', '[]', 1, '2023-08-31 13:31:33', '2023-08-31 13:31:33'),
(819, 'App\\Models\\ReportOption', 114, '026e51c1-969d-4c7d-aebd-ea123e2651ff', 'report_options-icon', 'air-conditioner (2)', 'air-conditioner-(2).png', 'image/png', 'public', 'public', 32851, '[]', '[]', '[]', '[]', 1, '2023-08-31 13:46:44', '2023-08-31 13:46:44'),
(820, 'App\\Models\\ReportOption', 115, '1b49494f-c89c-460a-83de-3545e25ea271', 'report_options-icon', 'air-conditioner (3)', 'air-conditioner-(3).png', 'image/png', 'public', 'public', 29936, '[]', '[]', '[]', '[]', 1, '2023-08-31 14:41:26', '2023-08-31 14:41:26'),
(822, 'App\\Models\\ReportOption', 116, '440225c4-c82e-4e9a-9c8b-474839cecd68', 'report_options-icon', 'fuse', 'fuse.png', 'image/png', 'public', 'public', 13566, '[]', '[]', '[]', '[]', 1, '2023-08-31 14:51:53', '2023-08-31 14:51:53'),
(823, 'App\\Models\\ReportOption', 7, 'de3f06ab-7a55-48a7-8e6d-e39066a36d85', 'report_options-icon', 'maintenance', 'maintenance.png', 'image/png', 'public', 'public', 35141, '[]', '[]', '[]', '[]', 1, '2023-08-31 14:59:15', '2023-08-31 14:59:15'),
(824, 'App\\Models\\ReportOption', 8, '562ad07e-bf2d-41bc-9a9a-c42382331471', 'report_options-icon', 'tyre', 'tyre.png', 'image/png', 'public', 'public', 24630, '[]', '[]', '[]', '[]', 1, '2023-08-31 15:05:12', '2023-08-31 15:05:12'),
(825, 'App\\Models\\ReportOption', 117, '28d8ad5c-e6ee-4663-8e8b-dcef2230dcbb', 'report_options-icon', 'tuning', 'tuning.png', 'image/png', 'public', 'public', 24449, '[]', '[]', '[]', '[]', 1, '2023-08-31 15:06:45', '2023-08-31 15:06:45'),
(826, 'App\\Models\\ReportOption', 118, '0f7f9b8d-b879-433f-bad7-7d6b802ccc19', 'report_options-icon', 'strut-mounting', 'strut-mounting.png', 'image/png', 'public', 'public', 34267, '[]', '[]', '[]', '[]', 1, '2023-08-31 15:08:49', '2023-08-31 15:08:49'),
(829, 'App\\Models\\Setting', 36, '9d9ca18d-a577-4546-92dc-03e853e58d6e', 'settings', 'AUTOMOBILE', 'AUTOMOBILE.png', 'image/png', 'public', 'public', 32537, '[]', '[]', '[]', '[]', 1, '2023-08-31 15:45:06', '2023-08-31 15:45:06'),
(832, 'App\\Models\\Slider', 1, 'b67fac12-22b4-44eb-a4d7-8c95059770c1', 'sliders', '13841402_2010.i123.005..car headlights AD composition', '13841402_2010.i123.005..car-headlights-AD-composition.jpg', 'image/jpeg', 'public', 'public', 1822980, '[]', '[]', '[]', '[]', 1, '2023-08-31 15:57:44', '2023-08-31 15:57:44'),
(834, 'App\\Models\\ReportOption', 119, '73991a24-308d-41d4-9029-f275fc2a5145', 'report_options-icon', 'oil', 'oil.png', 'image/png', 'public', 'public', 12509, '[]', '[]', '[]', '[]', 1, '2023-08-31 16:16:37', '2023-08-31 16:16:37'),
(835, 'App\\Models\\ReportOption', 120, '1479530e-5923-4244-89c4-8cb034af04b7', 'report_options-icon', 'gasket', 'gasket.png', 'image/png', 'public', 'public', 41670, '[]', '[]', '[]', '[]', 1, '2023-08-31 16:18:33', '2023-08-31 16:18:33'),
(836, 'App\\Models\\Car', 140, '5ca8ae6a-aa51-4b1a-a1f0-8a8df98f534c', 'cars', 'IMG-20230831-WA0001', 'IMG-20230831-WA0001.jpg', 'image/jpeg', 'public', 'public', 124518, '[]', '[]', '[]', '[]', 1, '2023-08-31 16:18:53', '2023-08-31 16:18:53'),
(837, 'App\\Models\\Car', 140, 'd2f05106-04e9-4374-bae9-c2185983afd9', 'cars-logo', 'IMG-20230831-WA0001', 'IMG-20230831-WA0001.jpg', 'image/jpeg', 'public', 'public', 124518, '[]', '[]', '[]', '[]', 2, '2023-08-31 16:18:53', '2023-08-31 16:18:53'),
(838, 'App\\Models\\Car', 141, '8f0eadd2-3762-4499-a205-8991ee75d0fa', 'cars', '1000056867', '1000056867.jpg', 'image/jpeg', 'public', 'public', 9299, '[]', '[]', '[]', '[]', 1, '2023-08-31 17:20:06', '2023-08-31 17:20:06'),
(839, 'App\\Models\\Car', 141, '79bb8660-8c7f-4793-89df-ae86150d34dd', 'cars', '1000056867', '1000056867.jpg', 'image/jpeg', 'public', 'public', 9299, '[]', '[]', '[]', '[]', 2, '2023-08-31 17:20:06', '2023-08-31 17:20:06'),
(840, 'App\\Models\\Car', 141, '6fc8452c-5036-4e47-a848-73e9c1ff27b5', 'cars', '1000056867', '1000056867.jpg', 'image/jpeg', 'public', 'public', 9299, '[]', '[]', '[]', '[]', 3, '2023-08-31 17:20:06', '2023-08-31 17:20:06'),
(841, 'App\\Models\\Car', 141, '65211348-2f60-4c43-a03f-dc83bdba3fda', 'cars-logo', '1000056867', '1000056867.jpg', 'image/jpeg', 'public', 'public', 9299, '[]', '[]', '[]', '[]', 4, '2023-08-31 17:20:06', '2023-08-31 17:20:06'),
(842, 'App\\Models\\Setting', 51, '7faa3f6a-83e4-4fab-8956-3756d3932e56', 'settings', '01', '01.png', 'image/png', 'public', 'public', 531607, '[]', '[]', '[]', '[]', 1, '2023-08-31 18:54:10', '2023-08-31 18:54:10'),
(843, 'App\\Models\\Slider', 3, '6157cfc4-3e7a-42d5-ac94-f8508ac3d5af', 'sliders', '01 (1)', '01-(1).png', 'image/png', 'public', 'public', 221079, '[]', '[]', '[]', '[]', 1, '2023-08-31 19:00:24', '2023-08-31 19:00:24'),
(844, 'App\\Models\\Car', 142, 'befe9696-b112-4828-b442-0a5432a7f9c2', 'cars', 'Screenshot_20230831_183539', 'Screenshot_20230831_183539.png', 'image/png', 'public', 'public', 20981, '[]', '[]', '[]', '[]', 1, '2023-08-31 19:16:52', '2023-08-31 19:16:52'),
(845, 'App\\Models\\Car', 142, '37276031-6a00-4ed9-bcc2-4394f2c40758', 'cars-logo', 'Screenshot_20230831_183539', 'Screenshot_20230831_183539.png', 'image/png', 'public', 'public', 20981, '[]', '[]', '[]', '[]', 2, '2023-08-31 19:16:52', '2023-08-31 19:16:52'),
(846, 'App\\Models\\Page', 5, 'e122bace-57e9-4aa1-b591-323dc6468428', 'pages', 'logo-nav', 'logo-nav.png', 'image/png', 'public', 'public', 12170, '[]', '[]', '[]', '[]', 1, '2023-09-01 22:37:25', '2023-09-01 22:37:25'),
(847, 'App\\Models\\Car', 143, '3280a9f8-100c-499d-887f-a3d7beed2e98', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 1, '2023-09-04 15:38:20', '2023-09-04 15:38:20'),
(848, 'App\\Models\\Car', 143, 'a93dbef4-1024-42ee-b571-84e08da543a2', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 2, '2023-09-04 15:38:20', '2023-09-04 15:38:20'),
(849, 'App\\Models\\Car', 143, '4aa4cfdc-05ce-48c6-819e-bea5cb9839c1', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 3, '2023-09-04 15:38:20', '2023-09-04 15:38:20'),
(850, 'App\\Models\\Car', 143, '77410eeb-7366-4a5f-bc09-03a4ce83db6a', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 4, '2023-09-04 15:38:20', '2023-09-04 15:38:20'),
(851, 'App\\Models\\Car', 143, 'f062ff86-ea41-4775-82a3-0fdabbef6df1', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 5, '2023-09-04 15:38:20', '2023-09-04 15:38:20'),
(852, 'App\\Models\\Car', 143, '39d1156e-3322-4a2b-9e0e-9769635397e5', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 6, '2023-09-04 15:38:20', '2023-09-04 15:38:20'),
(853, 'App\\Models\\Car', 143, '571ae96c-0c29-41e2-a913-01099b8f5573', 'cars-logo', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 7, '2023-09-04 15:38:20', '2023-09-04 15:38:20'),
(854, 'App\\Models\\Car', 144, '7e6bc4ba-d60f-4552-99b8-35042839210d', 'cars', 'Screenshot_20230904-163747', 'Screenshot_20230904-163747.jpg', 'image/jpeg', 'public', 'public', 194377, '[]', '[]', '[]', '[]', 1, '2023-09-04 17:11:14', '2023-09-04 17:11:14'),
(855, 'App\\Models\\Car', 144, 'ede08122-48ad-4c4d-9449-4be6c9c92977', 'cars-logo', 'IMG-20230904-WA0003', 'IMG-20230904-WA0003.jpg', 'image/jpeg', 'public', 'public', 38484, '[]', '[]', '[]', '[]', 2, '2023-09-04 17:11:14', '2023-09-04 17:11:14'),
(856, 'App\\Models\\Car', 145, 'bb434e2a-3910-4cea-a9e1-cb7dc508ae62', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 1, '2023-09-04 18:08:33', '2023-09-04 18:08:33'),
(857, 'App\\Models\\Car', 145, 'ec4798f6-0202-49a6-a1f5-fa658a103f7f', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 2, '2023-09-04 18:08:33', '2023-09-04 18:08:33'),
(858, 'App\\Models\\Car', 145, '0545fe9d-4c9b-4ced-aa73-d45c66ca949b', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 3, '2023-09-04 18:08:33', '2023-09-04 18:08:33'),
(859, 'App\\Models\\Car', 145, 'd9396a6d-cb74-42cd-8e45-930c5ed15684', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 4, '2023-09-04 18:08:33', '2023-09-04 18:08:33'),
(860, 'App\\Models\\Car', 145, '3babd170-7e6d-42d2-ade1-940dd2c25a53', 'cars-logo', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 5, '2023-09-04 18:08:33', '2023-09-04 18:08:33'),
(861, 'App\\Models\\Car', 146, '71c37281-3f15-4175-b4df-0434fc3c77ba', 'cars', 'BMW-X5-PNG-HD', 'BMW-X5-PNG-HD.png', 'image/png', 'public', 'public', 139611, '[]', '[]', '[]', '[]', 1, '2023-09-04 18:30:43', '2023-09-04 18:30:43'),
(862, 'App\\Models\\Car', 146, 'ad3c1708-15d3-443c-adc4-7289e80d8fba', 'cars', 'BMW-X5-PNG-HD', 'BMW-X5-PNG-HD.png', 'image/png', 'public', 'public', 139611, '[]', '[]', '[]', '[]', 2, '2023-09-04 18:30:43', '2023-09-04 18:30:43'),
(863, 'App\\Models\\Car', 146, 'd5e7e656-51d4-4812-89de-87b5f7c7de8f', 'cars', 'BMW-X5-PNG-HD', 'BMW-X5-PNG-HD.png', 'image/png', 'public', 'public', 139611, '[]', '[]', '[]', '[]', 3, '2023-09-04 18:30:43', '2023-09-04 18:30:43'),
(864, 'App\\Models\\Car', 146, 'bca061d4-d331-4a39-9702-305687038e50', 'cars-logo', 'BMW-X5-PNG-HD', 'BMW-X5-PNG-HD.png', 'image/png', 'public', 'public', 139611, '[]', '[]', '[]', '[]', 4, '2023-09-04 18:30:43', '2023-09-04 18:30:43'),
(865, 'App\\Models\\Car', 147, 'c3f05338-bdb2-4b35-a8a3-fcc38f8f68e1', 'cars', 'big-up_1d0fd14efb1a0396791a7fe9172de8a1', 'big-up_1d0fd14efb1a0396791a7fe9172de8a1.png', 'image/png', 'public', 'public', 191868, '[]', '[]', '[]', '[]', 1, '2023-09-05 11:38:15', '2023-09-05 11:38:15'),
(866, 'App\\Models\\Car', 147, 'f605d314-fcbb-40da-9fd3-46be63d6c6ca', 'cars', 'big-up_1d0fd14efb1a0396791a7fe9172de8a1', 'big-up_1d0fd14efb1a0396791a7fe9172de8a1.png', 'image/png', 'public', 'public', 191868, '[]', '[]', '[]', '[]', 2, '2023-09-05 11:38:16', '2023-09-05 11:38:16'),
(867, 'App\\Models\\Car', 147, 'b681f8f3-fe58-458d-b646-def4a1adcf97', 'cars', 'big-up_1d0fd14efb1a0396791a7fe9172de8a1', 'big-up_1d0fd14efb1a0396791a7fe9172de8a1.png', 'image/png', 'public', 'public', 191868, '[]', '[]', '[]', '[]', 3, '2023-09-05 11:38:16', '2023-09-05 11:38:16'),
(868, 'App\\Models\\Car', 147, 'a6423ffa-5ff7-4374-be9f-6cc258c22ded', 'cars-logo', 'big-up_1d0fd14efb1a0396791a7fe9172de8a1', 'big-up_1d0fd14efb1a0396791a7fe9172de8a1.png', 'image/png', 'public', 'public', 191868, '[]', '[]', '[]', '[]', 4, '2023-09-05 11:38:16', '2023-09-05 11:38:16'),
(869, 'App\\Models\\Car', 148, '7dc04e8f-c068-422c-bde1-5e798da2c7b3', 'cars', 'Screenshot_20230904-171229', 'Screenshot_20230904-171229.jpg', 'image/jpeg', 'public', 'public', 182828, '[]', '[]', '[]', '[]', 1, '2023-09-05 11:49:37', '2023-09-05 11:49:37'),
(870, 'App\\Models\\Car', 148, '82bf466d-9b07-4809-9c13-e101ec21762f', 'cars-logo', 'Screenshot_20230904-181305', 'Screenshot_20230904-181305.jpg', 'image/jpeg', 'public', 'public', 112819, '[]', '[]', '[]', '[]', 2, '2023-09-05 11:49:37', '2023-09-05 11:49:37'),
(871, 'App\\Models\\Car', 150, '42820974-f71a-415a-aa95-babd9600a60b', 'cars', 'IMG-20230831-WA0001', 'IMG-20230831-WA0001.jpg', 'image/jpeg', 'public', 'public', 124518, '[]', '[]', '[]', '[]', 1, '2023-09-05 13:09:03', '2023-09-05 13:09:03'),
(872, 'App\\Models\\Car', 150, 'bcd61263-7f14-4088-a9b1-11cbc27989d2', 'cars-logo', 'IMG-20230831-WA0001', 'IMG-20230831-WA0001.jpg', 'image/jpeg', 'public', 'public', 124518, '[]', '[]', '[]', '[]', 2, '2023-09-05 13:09:03', '2023-09-05 13:09:03'),
(873, 'App\\Models\\User', 28, '78b8b62d-024d-4d84-ad78-05d87dc6fff0', 'users-logo', 'image_picker_33738FFF-9188-42E2-8CEB-A20C324BDFC9-5771-000004D0167C22FD', 'image_picker_33738FFF-9188-42E2-8CEB-A20C324BDFC9-5771-000004D0167C22FD.png', 'image/png', 'public', 'public', 863067, '[]', '[]', '[]', '[]', 1, '2023-09-05 23:07:10', '2023-09-05 23:07:10'),
(874, 'App\\Models\\Car', 153, 'b0bcec34-a4c4-422d-b6a8-c736eaef465a', 'cars', '1000090939', '1000090939.jpg', 'image/jpeg', 'public', 'public', 54199, '[]', '[]', '[]', '[]', 1, '2023-09-07 11:25:22', '2023-09-07 11:25:22'),
(875, 'App\\Models\\Car', 153, '586198df-ae5a-42a1-a39a-2066d3036bb9', 'cars', '1000090939', '1000090939.jpg', 'image/jpeg', 'public', 'public', 54199, '[]', '[]', '[]', '[]', 2, '2023-09-07 11:25:23', '2023-09-07 11:25:23'),
(876, 'App\\Models\\Car', 153, '4d423018-7b0e-494f-86d7-2c3e44f05545', 'cars', '1000090943', '1000090943.png', 'image/png', 'public', 'public', 499447, '[]', '[]', '[]', '[]', 3, '2023-09-07 11:25:23', '2023-09-07 11:25:23'),
(877, 'App\\Models\\Car', 153, '3ea1edfb-e300-49e9-9df4-83074f4e5eb4', 'cars', '1000090934', '1000090934.jpg', 'image/jpeg', 'public', 'public', 88573, '[]', '[]', '[]', '[]', 4, '2023-09-07 11:25:23', '2023-09-07 11:25:23'),
(878, 'App\\Models\\Car', 153, '24da58ef-d567-4b41-9b79-92874647e3e5', 'cars-logo', '1000089621', '1000089621.png', 'image/png', 'public', 'public', 25686, '[]', '[]', '[]', '[]', 5, '2023-09-07 11:25:23', '2023-09-07 11:25:23'),
(879, 'App\\Models\\Car', 154, 'a328f3a3-94a1-44e2-98ca-93a50063f821', 'cars', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 1, '2023-09-07 11:37:57', '2023-09-07 11:37:57'),
(880, 'App\\Models\\Car', 154, '55fe2504-d628-4488-95e2-32a39375a53f', 'cars-logo', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707', 'fiat-tipo-cross-tipo-tipo-cross-1-5-hybrid-48v-cross-garmin-5dr-ddct-hatchback-vert_8712299707.jpg', 'image/jpeg', 'public', 'public', 14562, '[]', '[]', '[]', '[]', 2, '2023-09-07 11:37:57', '2023-09-07 11:37:57'),
(881, 'App\\Models\\Car', 155, 'c9b69cd7-60d6-4d97-a7b7-5eba4bb66a8c', 'cars', '1000090989', '1000090989.jpg', 'image/jpeg', 'public', 'public', 127585, '[]', '[]', '[]', '[]', 1, '2023-09-07 13:49:08', '2023-09-07 13:49:08'),
(882, 'App\\Models\\Car', 155, '265500c7-9905-4fcf-b2b3-68e8203d58ba', 'cars', '1000090989', '1000090989.jpg', 'image/jpeg', 'public', 'public', 127585, '[]', '[]', '[]', '[]', 2, '2023-09-07 13:49:08', '2023-09-07 13:49:08'),
(883, 'App\\Models\\Car', 155, '7de3df00-129f-4321-a4e5-129ea2b71f35', 'cars', '1000090989', '1000090989.jpg', 'image/jpeg', 'public', 'public', 127585, '[]', '[]', '[]', '[]', 3, '2023-09-07 13:49:08', '2023-09-07 13:49:08'),
(884, 'App\\Models\\Car', 155, '9aa8e2eb-5e1a-4d33-8f14-55c90ee5a351', 'cars', '1000090989', '1000090989.jpg', 'image/jpeg', 'public', 'public', 127585, '[]', '[]', '[]', '[]', 4, '2023-09-07 13:49:08', '2023-09-07 13:49:08'),
(885, 'App\\Models\\Car', 155, '4cad9224-1507-4c09-a119-a75999b37de6', 'cars-logo', '1000090989', '1000090989.jpg', 'image/jpeg', 'public', 'public', 127585, '[]', '[]', '[]', '[]', 5, '2023-09-07 13:49:08', '2023-09-07 13:49:08'),
(886, 'App\\Models\\Car', 156, '5c104cd7-6901-48ce-ab06-37ccd742ecff', 'cars', 'IMG-20230910-WA0030', 'IMG-20230910-WA0030.jpg', 'image/jpeg', 'public', 'public', 40242, '[]', '[]', '[]', '[]', 1, '2023-09-10 23:26:03', '2023-09-10 23:26:03'),
(887, 'App\\Models\\Car', 156, 'd886c4b6-f4e0-4f2b-a809-7ce618c480a3', 'cars-logo', 'IMG-20230910-WA0030', 'IMG-20230910-WA0030.jpg', 'image/jpeg', 'public', 'public', 40242, '[]', '[]', '[]', '[]', 2, '2023-09-10 23:26:03', '2023-09-10 23:26:03'),
(888, 'App\\Models\\User', 38, '4977c4cc-f122-41e3-af01-540622d2a51d', 'users-logo', 'AUTOMOBILE', 'AUTOMOBILE.png', 'image/png', 'public', 'public', 32537, '[]', '[]', '[]', '[]', 1, '2023-09-11 16:52:34', '2023-09-11 16:52:34'),
(889, 'App\\Models\\Car', 157, '430ab650-5ac2-4c5b-8c37-44c63405e502', 'cars', 'AUTOMOBILE', 'AUTOMOBILE.png', 'image/png', 'public', 'public', 32537, '[]', '[]', '[]', '[]', 1, '2023-09-11 16:59:35', '2023-09-11 16:59:35'),
(890, 'App\\Models\\Car', 157, '4f2b7d66-98b6-40db-b4e7-f0bf96d87287', 'cars', 'main', 'main.png', 'image/png', 'public', 'public', 66629, '[]', '[]', '[]', '[]', 2, '2023-09-11 16:59:35', '2023-09-11 16:59:35'),
(891, 'App\\Models\\Car', 158, 'b58bc2c7-276a-4449-9ac9-e3090a8b87ca', 'cars', 'Screenshot_20230914-160521', 'Screenshot_20230914-160521.jpg', 'image/jpeg', 'public', 'public', 96090, '[]', '[]', '[]', '[]', 1, '2023-09-14 16:36:17', '2023-09-14 16:36:17'),
(892, 'App\\Models\\Car', 158, '4ee30f64-8aba-4f20-81b4-8be690f70c73', 'cars-logo', 'Screenshot_20230914-161242', 'Screenshot_20230914-161242.jpg', 'image/jpeg', 'public', 'public', 294365, '[]', '[]', '[]', '[]', 2, '2023-09-14 16:36:17', '2023-09-14 16:36:17'),
(893, 'App\\Models\\Car', 152, '3d8965b4-e0d4-4104-90ac-a3f6cd092d7e', 'cars-logo', '554', '554.jpg', 'image/jpeg', 'public', 'public', 62669, '[]', '[]', '[]', '[]', 1, '2023-09-17 11:18:18', '2023-09-17 11:18:18'),
(894, 'App\\Models\\Car', 159, '861c07de-dab8-4113-82af-64b380990000', 'cars-logo', '61Isge10F0L', '61Isge10F0L.jpg', 'image/jpeg', 'public', 'public', 110559, '[]', '[]', '[]', '[]', 1, '2023-09-17 11:33:16', '2023-09-17 11:33:16'),
(895, 'App\\Models\\Car', 159, '3df78109-de7f-4755-8412-63c3adbb4bbc', 'cars-door-1', 'steering-wheel', 'steering-wheel.png', 'image/png', 'public', 'public', 32276, '[]', '[]', '[]', '[]', 2, '2023-09-17 11:33:16', '2023-09-17 11:33:16'),
(896, 'App\\Models\\Car', 159, 'e063ad55-abff-41da-a87b-0e99b0c74ab8', 'cars-door-2', 'steering-wheel', 'steering-wheel.png', 'image/png', 'public', 'public', 32276, '[]', '[]', '[]', '[]', 3, '2023-09-17 11:33:16', '2023-09-17 11:33:16'),
(897, 'App\\Models\\Car', 159, '9c24d7a8-76d3-411f-9ebd-2bd7fe825f19', 'cars-door-3', 'steering-wheel', 'steering-wheel.png', 'image/png', 'public', 'public', 32276, '[]', '[]', '[]', '[]', 4, '2023-09-17 11:33:16', '2023-09-17 11:33:16'),
(898, 'App\\Models\\Car', 159, '39354ba7-eab1-451c-9acd-784cd0b824d0', 'cars-door-4', 'steering-wheel', 'steering-wheel.png', 'image/png', 'public', 'public', 32276, '[]', '[]', '[]', '[]', 5, '2023-09-17 11:33:16', '2023-09-17 11:33:16'),
(900, 'App\\Models\\Showroom', 14, '87b122e4-ee10-4310-8624-5364aa389165', 'showrooms-logo', 'header-logo', 'header-logo.png', 'image/png', 'public', 'public', 17352, '[]', '[]', '[]', '[]', 1, '2023-09-18 13:30:32', '2023-09-18 13:30:32'),
(901, 'App\\Models\\Showroom', 14, '5189dae5-9aed-444e-8263-241e719a414c', 'showrooms-tax_card', 'header-logo', 'header-logo.png', 'image/png', 'public', 'public', 17352, '[]', '[]', '[]', '[]', 2, '2023-09-18 13:30:32', '2023-09-18 13:30:32'),
(902, 'App\\Models\\Showroom', 14, 'cbce89de-2048-4edd-babe-297ff442a9f7', 'showrooms-commercial', 'header-logo', 'header-logo.png', 'image/png', 'public', 'public', 17352, '[]', '[]', '[]', '[]', 3, '2023-09-18 13:30:32', '2023-09-18 13:30:32'),
(903, 'App\\Models\\Showroom', 14, 'fc96bc1c-39a7-4089-9985-d9ccca1d8ec8', 'showrooms-cover_image', 'download', 'download.jfif', 'image/jpeg', 'public', 'public', 853068, '[]', '[]', '[]', '[]', 4, '2023-09-18 13:30:32', '2023-09-18 13:30:32'),
(904, 'App\\Models\\Car', 165, '1cd30c0c-d452-4e0c-875b-1a8db4a0ef6c', 'cars', 'WhatsApp Image 2023-09-19 at 11.29.27 AM (2)', 'WhatsApp-Image-2023-09-19-at-11.29.27-AM-(2).jpeg', 'image/jpeg', 'public', 'public', 225228, '[]', '[]', '[]', '[]', 1, '2023-09-19 12:36:56', '2023-09-19 12:36:56'),
(905, 'App\\Models\\Car', 165, '1092875e-b215-4762-9137-8805c5380a0a', 'cars-logo', 'WhatsApp Image 2023-09-19 at 11.29.27 AM', 'WhatsApp-Image-2023-09-19-at-11.29.27-AM.jpeg', 'image/jpeg', 'public', 'public', 199553, '[]', '[]', '[]', '[]', 2, '2023-09-19 12:36:56', '2023-09-19 12:36:56'),
(906, 'App\\Models\\Car', 165, '9c6b9189-887f-4137-a80f-d11e78894afb', 'cars-door-1', 'WhatsApp Image 2023-09-19 at 11.29.27 AM (2)', 'WhatsApp-Image-2023-09-19-at-11.29.27-AM-(2).jpeg', 'image/jpeg', 'public', 'public', 225228, '[]', '[]', '[]', '[]', 3, '2023-09-19 12:36:56', '2023-09-19 12:36:56'),
(907, 'App\\Models\\Car', 165, 'f9ab1e88-f0da-4456-8a8f-8658394c7c03', 'cars-door-2', 'WhatsApp Image 2023-09-19 at 11.29.28 AM (2)', 'WhatsApp-Image-2023-09-19-at-11.29.28-AM-(2).jpeg', 'image/jpeg', 'public', 'public', 285018, '[]', '[]', '[]', '[]', 4, '2023-09-19 12:36:56', '2023-09-19 12:36:56'),
(908, 'App\\Models\\Car', 165, '513d1a91-fb0b-4bc0-a85a-6c07666d7dc0', 'cars-door-3', 'WhatsApp Image 2023-09-19 at 11.29.28 AM (3)', 'WhatsApp-Image-2023-09-19-at-11.29.28-AM-(3).jpeg', 'image/jpeg', 'public', 'public', 259918, '[]', '[]', '[]', '[]', 5, '2023-09-19 12:36:56', '2023-09-19 12:36:56'),
(909, 'App\\Models\\Car', 165, '73123bcd-2f85-4f67-8191-26df29029f00', 'cars-door-4', 'WhatsApp Image 2023-09-19 at 11.29.28 AM (1)', 'WhatsApp-Image-2023-09-19-at-11.29.28-AM-(1).jpeg', 'image/jpeg', 'public', 'public', 200174, '[]', '[]', '[]', '[]', 6, '2023-09-19 12:36:56', '2023-09-19 12:36:56'),
(910, 'App\\Models\\Car', 166, 'afb53a36-d32f-4cdc-98dc-e0ec663cdbc2', 'cars', 'WhatsApp Image 2023-09-19 at 11.29.29 AM', 'WhatsApp-Image-2023-09-19-at-11.29.29-AM.jpeg', 'image/jpeg', 'public', 'public', 219376, '[]', '[]', '[]', '[]', 1, '2023-09-19 13:14:45', '2023-09-19 13:14:45'),
(911, 'App\\Models\\Car', 166, '37b3b0b6-8a0f-435e-98eb-7094e7a5ef4c', 'cars-logo', 'WhatsApp Image 2023-09-19 at 11.29.30 AM', 'WhatsApp-Image-2023-09-19-at-11.29.30-AM.jpeg', 'image/jpeg', 'public', 'public', 226461, '[]', '[]', '[]', '[]', 2, '2023-09-19 13:14:45', '2023-09-19 13:14:45'),
(912, 'App\\Models\\Car', 166, 'e4cbb0ee-9c6a-43a1-aca6-c9a4c70bb74c', 'cars-door-1', 'WhatsApp Image 2023-09-19 at 11.29.29 AM', 'WhatsApp-Image-2023-09-19-at-11.29.29-AM.jpeg', 'image/jpeg', 'public', 'public', 219376, '[]', '[]', '[]', '[]', 3, '2023-09-19 13:14:45', '2023-09-19 13:14:45'),
(913, 'App\\Models\\Car', 166, '2cb8e723-3b9a-4b40-8a66-853c61a99e15', 'cars-door-2', 'WhatsApp Image 2023-09-19 at 11.29.30 AM (4)', 'WhatsApp-Image-2023-09-19-at-11.29.30-AM-(4).jpeg', 'image/jpeg', 'public', 'public', 290552, '[]', '[]', '[]', '[]', 4, '2023-09-19 13:14:45', '2023-09-19 13:14:45'),
(914, 'App\\Models\\Car', 166, '4e1174b5-d909-4032-8bcc-629b4cac9fba', 'cars-door-3', 'WhatsApp Image 2023-09-19 at 11.29.30 AM (2)', 'WhatsApp-Image-2023-09-19-at-11.29.30-AM-(2).jpeg', 'image/jpeg', 'public', 'public', 227565, '[]', '[]', '[]', '[]', 5, '2023-09-19 13:14:45', '2023-09-19 13:14:45'),
(915, 'App\\Models\\Car', 166, '12d2cb70-e59b-425d-ac1f-0fb964bf8029', 'cars-door-4', 'WhatsApp Image 2023-09-19 at 11.29.31 AM (1)', 'WhatsApp-Image-2023-09-19-at-11.29.31-AM-(1).jpeg', 'image/jpeg', 'public', 'public', 210926, '[]', '[]', '[]', '[]', 6, '2023-09-19 13:14:45', '2023-09-19 13:14:45'),
(916, 'App\\Models\\Car', 167, '59f979ad-6379-4eb0-8270-393a26d4f146', 'cars-logo', 'big-up_d55a39a921f96f3adfdcb710c941a5e6', 'big-up_d55a39a921f96f3adfdcb710c941a5e6.jpg', 'image/jpeg', 'public', 'public', 36504, '[]', '[]', '[]', '[]', 1, '2023-09-19 15:40:45', '2023-09-19 15:40:45'),
(917, 'App\\Models\\Car', 168, 'a2cdc02d-8189-480c-9d1a-6e33a4cd2123', 'cars', 'IMG-20230919-WA0031', 'IMG-20230919-WA0031.jpg', 'image/jpeg', 'public', 'public', 26166, '[]', '[]', '[]', '[]', 1, '2023-09-19 16:12:26', '2023-09-19 16:12:26'),
(918, 'App\\Models\\Car', 168, '43add361-50f0-4256-b84a-7b0b206f4211', 'cars-logo', 'IMG-20230919-WA0031', 'IMG-20230919-WA0031.jpg', 'image/jpeg', 'public', 'public', 26166, '[]', '[]', '[]', '[]', 2, '2023-09-19 16:12:26', '2023-09-19 16:12:26'),
(919, 'App\\Models\\Car', 170, '197af27f-5bc4-4fa2-bea9-022d54acfad2', 'cars', 'splash2', 'splash2.png', 'image/png', 'public', 'public', 241525, '[]', '[]', '[]', '[]', 1, '2023-09-20 09:54:49', '2023-09-20 09:54:49'),
(920, 'App\\Models\\Car', 170, 'e6774aba-ae68-489b-a7b3-82f0fa90334d', 'cars', 'app_logo', 'app_logo.png', 'image/png', 'public', 'public', 5141, '[]', '[]', '[]', '[]', 2, '2023-09-20 09:54:49', '2023-09-20 09:54:49'),
(921, 'App\\Models\\Car', 166, '84b61b3a-76fc-4ed4-814a-e5e1e9ea237e', 'cars', 'splash2', 'splash2.png', 'image/png', 'public', 'public', 241525, '[]', '[]', '[]', '[]', 7, '2023-09-20 09:56:05', '2023-09-20 09:56:05'),
(922, 'App\\Models\\Car', 166, '4d4cea6a-3ddf-46a3-890c-80b586545068', 'cars', 'app_logo', 'app_logo.png', 'image/png', 'public', 'public', 5141, '[]', '[]', '[]', '[]', 8, '2023-09-20 09:56:05', '2023-09-20 09:56:05'),
(923, 'App\\Models\\User', 50, '60578093-7f91-49fb-ae07-95a2eb7ca960', 'users-logo', 'crossover', 'crossover.png', 'image/png', 'public', 'public', 14789, '[]', '[]', '[]', '[]', 1, '2023-09-21 21:17:23', '2023-09-21 21:17:23'),
(924, 'App\\Models\\Car', 172, 'a8750196-f5a2-4247-b8b9-45f1243fa48e', 'cars', '01 (1)', '01-(1).png', 'image/png', 'public', 'public', 221079, '[]', '[]', '[]', '[]', 1, '2023-09-21 21:52:46', '2023-09-21 21:52:46'),
(925, 'App\\Models\\Car', 172, '75fa4f32-b6fd-4ccf-8cd4-67d8cbda52c5', 'cars', '01', '01.png', 'image/png', 'public', 'public', 531607, '[]', '[]', '[]', '[]', 2, '2023-09-21 21:52:46', '2023-09-21 21:52:46'),
(926, 'App\\Models\\Car', 172, '1b74390b-9498-4915-a672-8099be489f9d', 'cars', 'front-car-lights-night-road', 'front-car-lights-night-road.jpg', 'image/jpeg', 'public', 'public', 1006219, '[]', '[]', '[]', '[]', 3, '2023-09-21 21:52:46', '2023-09-21 21:52:46'),
(927, 'App\\Models\\Car', 172, 'd1b86c98-dd48-4499-a543-63530c083dcf', 'cars', '13841402_2010.i123.005..car headlights AD composition', '13841402_2010.i123.005..car-headlights-AD-composition.jpg', 'image/jpeg', 'public', 'public', 1822980, '[]', '[]', '[]', '[]', 4, '2023-09-21 21:52:46', '2023-09-21 21:52:46'),
(928, 'App\\Models\\Car', 172, '945498ba-7bc9-49af-b97a-a3cba7ffc681', 'cars', '3601986_67354', '3601986_67354.jpg', 'image/jpeg', 'public', 'public', 1833190, '[]', '[]', '[]', '[]', 5, '2023-09-21 21:52:46', '2023-09-21 21:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2023_03_21_120112_create_settings_table', 1),
(12, '2023_03_21_121918_create_media_table', 1),
(13, '2023_03_22_152954_create_cities_table', 1),
(14, '2023_03_22_153207_create_districts_table', 1),
(15, '2023_06_11_114124_create_admins_table', 1),
(16, '2023_06_11_121858_create_sliders_table', 1),
(17, '2023_06_11_121958_create_brands_table', 1),
(18, '2023_06_11_122049_create_car_models_table', 1),
(19, '2023_06_11_122208_create_car_model_years_table', 1),
(20, '2023_06_11_122209_create_car_model_extensions_table', 1),
(21, '2023_06_11_123015_create_showrooms_table', 1),
(22, '2023_06_11_123036_create_agencies_table', 1),
(23, '2023_06_12_090214_create_permission_tables', 1),
(24, '2023_06_12_120409_create_features_table', 1),
(25, '2023_06_13_135252_create_branches_table', 1),
(26, '2023_06_18_110906_create_feature_options_table', 1),
(27, '2023_06_19_124808_create_cars_table', 1),
(28, '2023_06_20_120319_create_car_features_table', 1),
(29, '2023_06_21_214720_create_car_options_table', 2),
(30, '2023_07_06_142508_add_phone_to_users', 3),
(31, '2023_07_09_122131_add_is_blocked_to_users', 4),
(32, '2023_07_09_135128_add_hide_to_cars', 4),
(33, '2023_07_10_112322_create_requests_table', 5),
(34, '2023_07_10_121313_create_reports_table', 6),
(35, '2023_07_10_121419_create_report_options_table', 6),
(36, '2023_07_10_143520_add_status_buyed_to_cars', 6),
(37, '2023_07_12_144246_create_car_reports_table', 7),
(38, '2023_07_16_111026_add_request_id_to_cars', 8),
(39, '2023_07_17_102514_add_title_to_cars', 9),
(40, '2023_07_17_111441_create_pages_table', 9),
(41, '2023_07_19_095820_create_favorites_table', 10),
(42, '2023_06_18_102957_create_colors_table', 11),
(43, '2023_07_20_110010_add_color_id_to_cars', 11),
(44, '2023_08_03_115545_add_whatsapp_to_branches', 12),
(45, '2023_08_03_152540_add_is_hide_to_branches', 13),
(46, '2023_06_18_101306_create_car_types_table', 14),
(47, '2023_08_27_105717_add_car_type_id_to_cars', 14),
(48, '2023_08_27_131216_create_contacts_table', 15),
(49, '2023_08_28_115723_create_notifications_table', 16),
(50, '2023_08_28_121253_add_fcm_token_to_users', 16),
(51, '2023_08_28_122115_add_fcm_token_to_showrooms', 16),
(52, '2023_08_28_154415_create_pacakges_table', 17),
(53, '2023_08_28_155700_create_packages_table', 18),
(54, '2023_08_32_115723_create_notifications_table', 19),
(55, '2014_04_02_193005_create_translations_table', 20),
(56, '2023_08_30_152219_add_is_approved_to_cars', 21),
(57, '2023_09_07_140542_add_deleted_at_to_showrooms', 22),
(58, '2023_09_07_140548_add_deleted_at_to_users', 22),
(59, '2023_09_22_162612_add_city_id_to_users', 23),
(60, '2023_09_22_185920_create_extension_models_table', 23);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(11, 'App\\Models\\Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_increment` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `id_increment`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('6d90e41a-6b83-473e-938f-9fd173b18e01', 1, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"test all\",\"message\":\"test all  test all   test all\",\"role\":\"users\"}', NULL, '2023-08-30 11:24:14', '2023-08-30 11:24:14'),
('fd624431-72fd-43ab-85a2-3607111f6af3', 2, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"test all\",\"message\":\"test all  test all   test all\",\"role\":\"users\"}', NULL, '2023-08-30 11:24:14', '2023-08-30 11:24:14'),
('8209c2b2-6d6f-4c82-a4f7-18a74c72aba5', 3, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"test all\",\"message\":\"test all  test all   test all\",\"role\":\"users\"}', NULL, '2023-08-30 11:24:14', '2023-08-30 11:24:14'),
('202ad333-2457-413d-9289-22f0ce3a9a56', 4, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"test all\",\"message\":\"test all  test all   test all\",\"role\":\"showrooms\"}', NULL, '2023-08-30 11:24:14', '2023-08-30 11:24:14'),
('4707c0b8-3ab3-40bf-913f-c7bf82ccd6c0', 5, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 11, '{\"title\":\"test all\",\"message\":\"test all  test all   test all\",\"role\":\"agencies\"}', NULL, '2023-08-30 11:24:14', '2023-08-30 11:24:14'),
('8a363b95-9ba6-4a6b-8430-891c6c099711', 6, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"test all\",\"message\":\"test all  test all   test all\",\"role\":\"agencies\"}', NULL, '2023-08-30 11:24:14', '2023-08-30 11:24:14'),
('efa685b7-013e-47de-bfdb-a36f0075e8af', 7, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"test 222\",\"message\":\"test 222 test 222 test 222 test 222\",\"role\":\"users\"}', NULL, '2023-08-30 11:37:02', '2023-08-30 11:37:02'),
('b20c6908-0058-4442-b98a-f4cb14129f2a', 8, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"test 222\",\"message\":\"test 222 test 222 test 222 test 222\",\"role\":\"users\"}', NULL, '2023-08-30 11:37:02', '2023-08-30 11:37:02'),
('2803f03f-42cb-4949-8d38-207da67a350e', 9, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"test 222\",\"message\":\"test 222 test 222 test 222 test 222\",\"role\":\"users\"}', NULL, '2023-08-30 11:37:02', '2023-08-30 11:37:02'),
('056ef818-5f2e-46be-9d84-905da2b2ae96', 10, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"test 222\",\"message\":\"test 222 test 222 test 222 test 222\",\"role\":\"showrooms\"}', NULL, '2023-08-30 11:37:02', '2023-08-30 11:37:02'),
('56dd4393-0ff3-4eac-b20c-2b86bb0df224', 11, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"test 222\",\"message\":\"test 222 test 222 test 222 test 222\",\"role\":\"agencies\"}', NULL, '2023-08-30 11:37:02', '2023-08-30 11:37:02'),
('b9a59dcf-0522-4f97-ac39-1ec8b4976c42', 12, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 11, '{\"title\":\"test 222\",\"message\":\"test 222 test 222 test 222 test 222\",\"role\":\"agencies\"}', NULL, '2023-08-30 11:37:02', '2023-08-30 11:37:02'),
('2f667b87-e638-4157-8999-7b81577b53ed', 13, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"test 222\",\"message\":\"test 222 test 222 test 222 test 222\",\"role\":\"agencies\"}', NULL, '2023-08-30 11:37:02', '2023-08-30 11:37:02'),
('726e4fd3-8633-4cbd-8ea0-e5b79a73c86d', 14, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":null,\"id\":137}', NULL, '2023-08-30 12:13:12', '2023-08-30 12:13:12'),
('721d15d4-53a1-4311-b3a8-6745e121e567', 15, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":137}', NULL, '2023-08-30 12:17:53', '2023-08-30 12:17:53'),
('07858a92-bfd8-4a11-9385-3be844305114', 16, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":137}', NULL, '2023-08-30 12:17:53', '2023-08-30 12:17:53'),
('27343952-f279-4d55-960e-d4f1d49c6bf2', 17, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":136}', NULL, '2023-08-30 12:18:32', '2023-08-30 12:18:32'),
('79a46407-619e-4145-9224-668bb440c191', 18, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":136}', NULL, '2023-08-30 12:18:32', '2023-08-30 12:18:32'),
('cd65db32-5361-4f9e-8bd1-f5aee1f00dbf', 19, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":135}', NULL, '2023-08-30 12:42:55', '2023-08-30 12:42:55'),
('c6caee32-5c05-4fd4-86d7-f27a4a1a729d', 20, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"mahmoid\",\"message\":\"hASDzfxgchvjbknl\",\"role\":\"users\"}', NULL, '2023-08-30 12:48:37', '2023-08-30 12:48:37'),
('fd04170b-c435-41cf-99bb-f10a255f573d', 21, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"mahmoid\",\"message\":\"hASDzfxgchvjbknl\",\"role\":\"users\"}', NULL, '2023-08-30 12:48:38', '2023-08-30 12:48:38'),
('0e817b0d-c59e-4b12-82c9-a663b5fc5b2c', 22, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"mahmoid\",\"message\":\"hASDzfxgchvjbknl\",\"role\":\"users\"}', NULL, '2023-08-30 12:48:38', '2023-08-30 12:48:38'),
('a2d9d68e-2cbd-4c3e-8d34-853cd97ebf55', 23, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"users\"}', NULL, '2023-08-30 12:51:05', '2023-08-30 12:51:05'),
('b4fc144f-dac8-4187-ac7b-3162f68b43fc', 24, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"users\"}', NULL, '2023-08-30 12:51:05', '2023-08-30 12:51:05'),
('46b8ff55-36ef-47b9-8221-13c3d7d27a29', 25, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"users\"}', NULL, '2023-08-30 12:51:05', '2023-08-30 12:51:05'),
('6e6dbfa8-a38b-4bba-906a-d540e83e15b6', 26, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"showrooms\"}', NULL, '2023-08-30 12:51:05', '2023-08-30 12:51:05'),
('c0332792-658b-438f-b02d-4a3de2752de3', 27, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"agencies\"}', NULL, '2023-08-30 12:51:05', '2023-08-30 12:51:05'),
('940b77c1-daea-43ae-bdf0-33b3b8ead317', 28, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 11, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"agencies\"}', NULL, '2023-08-30 12:51:05', '2023-08-30 12:51:05'),
('12322af1-d0b5-48ba-b36c-8abaea17d1ba', 29, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"agencies\"}', NULL, '2023-08-30 12:51:05', '2023-08-30 12:51:05'),
('b4a749f2-90a9-486d-bf80-da4e5220bd2d', 30, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"users\"}', NULL, '2023-08-30 12:51:06', '2023-08-30 12:51:06'),
('0c7465fd-59c4-4c11-b611-7ed05ade5b4d', 31, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"users\"}', NULL, '2023-08-30 12:51:06', '2023-08-30 12:51:06'),
('be2e3a84-fd2c-4e87-8cd1-e73be02c1371', 32, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"users\"}', NULL, '2023-08-30 12:51:06', '2023-08-30 12:51:06'),
('15e97186-450e-4831-a6d7-d378f694bf31', 33, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"showrooms\"}', NULL, '2023-08-30 12:51:06', '2023-08-30 12:51:06'),
('915d6175-9107-4a0d-91e1-8da94464514c', 34, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"agencies\"}', NULL, '2023-08-30 12:51:06', '2023-08-30 12:51:06'),
('c253cc82-2d7a-4bce-9aae-cf4aa917f446', 35, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 11, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"agencies\"}', NULL, '2023-08-30 12:51:06', '2023-08-30 12:51:06'),
('e275981e-1169-420a-bb5b-240f81d100e5', 36, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"ytftytyd\",\"message\":\"szdfxgchvjbkl\",\"role\":\"agencies\"}', NULL, '2023-08-30 12:51:06', '2023-08-30 12:51:06'),
('7d0ff15f-d728-47ad-94a3-b1b252937f23', 37, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"f\",\"message\":\"j\",\"role\":\"users\"}', NULL, '2023-08-30 12:52:10', '2023-08-30 12:52:10'),
('d91dbfb6-d68a-4c0a-8399-7cdf7870d983', 38, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"f\",\"message\":\"j\",\"role\":\"users\"}', NULL, '2023-08-30 12:52:10', '2023-08-30 12:52:10'),
('f1fc596e-54c5-42b9-a783-ad3c350705e6', 39, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"f\",\"message\":\"j\",\"role\":\"users\"}', NULL, '2023-08-30 12:52:10', '2023-08-30 12:52:10'),
('df9eba4b-eecc-43d2-9a7a-c83e4f1e3d7c', 40, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"22\",\"message\":\"654564\",\"role\":\"users\"}', NULL, '2023-08-30 12:52:20', '2023-08-30 12:52:20'),
('0987860e-8efe-4602-96db-b0d6d2911c64', 41, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"22\",\"message\":\"654564\",\"role\":\"users\"}', NULL, '2023-08-30 12:52:20', '2023-08-30 12:52:20'),
('53031cad-111d-4f51-a2ba-1743d0d0bfdf', 42, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"22\",\"message\":\"654564\",\"role\":\"users\"}', NULL, '2023-08-30 12:52:20', '2023-08-30 12:52:20'),
('4de08459-ea2b-497f-8f71-f5fc8074b332', 43, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"22\",\"message\":\"654564\",\"role\":\"showrooms\"}', NULL, '2023-08-30 12:52:20', '2023-08-30 12:52:20'),
('c930af3c-f489-4894-8c6b-841d6a59c172', 44, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"22\",\"message\":\"654564\",\"role\":\"agencies\"}', NULL, '2023-08-30 12:52:20', '2023-08-30 12:52:20'),
('6a83e4d8-1411-4a5f-b735-de9133d358ca', 45, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 11, '{\"title\":\"22\",\"message\":\"654564\",\"role\":\"agencies\"}', NULL, '2023-08-30 12:52:20', '2023-08-30 12:52:20'),
('2dcff482-9e40-4e2c-a477-a5e0de045b9c', 46, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"22\",\"message\":\"654564\",\"role\":\"agencies\"}', NULL, '2023-08-30 12:52:20', '2023-08-30 12:52:20'),
('3d28c7fd-c9ed-4644-ac19-d12948469788', 47, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"test mahfouz now\",\"message\":\"test mahfouz now  test mahfouz now\",\"role\":\"users\"}', NULL, '2023-08-30 13:01:47', '2023-08-30 13:01:47'),
('d9d98552-de88-4ed3-83b8-7314ce9ca1e3', 48, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"test mahfouz now\",\"message\":\"test mahfouz now  test mahfouz now\",\"role\":\"users\"}', NULL, '2023-08-30 13:01:47', '2023-08-30 13:01:47'),
('a311b4c8-70bc-47e7-ab2b-ffa9ba54481d', 49, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"test mahfouz now\",\"message\":\"test mahfouz now  test mahfouz now\",\"role\":\"users\"}', NULL, '2023-08-30 13:01:47', '2023-08-30 13:01:47'),
('2182bdc1-c374-4442-8fe2-e606d0aca837', 50, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"test mahfouz now\",\"message\":\"test mahfouz now  test mahfouz now\",\"role\":\"showrooms\"}', NULL, '2023-08-30 13:01:47', '2023-08-30 13:01:47'),
('a329cc0b-c435-40a2-9278-748226833ef2', 51, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"test mahfouz now\",\"message\":\"test mahfouz now  test mahfouz now\",\"role\":\"agencies\"}', NULL, '2023-08-30 13:01:47', '2023-08-30 13:01:47'),
('9fdcdffe-0eec-471a-9c1d-42007c5f4074', 52, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 11, '{\"title\":\"test mahfouz now\",\"message\":\"test mahfouz now  test mahfouz now\",\"role\":\"agencies\"}', NULL, '2023-08-30 13:01:47', '2023-08-30 13:01:47'),
('cb3dc8e3-7a7e-4cef-868e-f2b0f140000c', 53, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"test mahfouz now\",\"message\":\"test mahfouz now  test mahfouz now\",\"role\":\"agencies\"}', NULL, '2023-08-30 13:01:47', '2023-08-30 13:01:47'),
('2917c473-a86d-458f-8a99-adffdb2df261', 54, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"test mahmoud\",\"message\":\"sertdyfguhikjl;\",\"role\":\"users\"}', NULL, '2023-08-30 13:07:16', '2023-08-30 13:07:16'),
('6145a4e7-e222-4a6e-a805-7d1d08339dfd', 55, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"test mahmoud\",\"message\":\"sertdyfguhikjl;\",\"role\":\"users\"}', NULL, '2023-08-30 13:07:16', '2023-08-30 13:07:16'),
('e4499b21-425f-4a2c-8af4-4c0f3b1bc5fd', 56, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"test mahmoud\",\"message\":\"sertdyfguhikjl;\",\"role\":\"users\"}', NULL, '2023-08-30 13:07:16', '2023-08-30 13:07:16'),
('c580bde1-e6e3-436b-a51b-3a3b95e771a1', 57, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"test mahmoud\",\"message\":\"sertdyfguhikjl;\",\"role\":\"showrooms\"}', NULL, '2023-08-30 13:07:16', '2023-08-30 13:07:16'),
('94aebfe9-6a97-46e4-84c4-af6a1bd769a0', 58, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"test mahmoud\",\"message\":\"sertdyfguhikjl;\",\"role\":\"agencies\"}', NULL, '2023-08-30 13:07:16', '2023-08-30 13:07:16'),
('2bffa188-8e3a-4a74-a94e-191b66ba2be2', 59, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 11, '{\"title\":\"test mahmoud\",\"message\":\"sertdyfguhikjl;\",\"role\":\"agencies\"}', NULL, '2023-08-30 13:07:16', '2023-08-30 13:07:16'),
('1c582b08-0cb4-4f97-9cec-8e657a8f7fcd', 60, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"test mahmoud\",\"message\":\"sertdyfguhikjl;\",\"role\":\"agencies\"}', NULL, '2023-08-30 13:07:16', '2023-08-30 13:07:16'),
('24c24ed1-48c0-47a2-ab54-091665e7b99d', 61, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"please\",\"id\":138}', NULL, '2023-08-30 13:14:49', '2023-08-30 13:14:49'),
('0b9bdf82-aecd-4316-9899-a1f280d88156', 62, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 22, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":138}', NULL, '2023-08-30 13:15:57', '2023-08-30 13:15:57'),
('32d485dd-9dae-4072-aa80-e74ba30066fe', 63, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 22, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":138}', NULL, '2023-08-30 13:27:39', '2023-08-30 13:27:39'),
('b9bf7b57-6fc6-42d6-be72-5699c90afc07', 64, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 13, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":115}', NULL, '2023-08-30 17:32:09', '2023-08-30 17:32:09'),
('127e4832-814c-4374-8091-6e9d0aeb5401', 65, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":111}', NULL, '2023-08-30 17:35:27', '2023-08-30 17:35:27'),
('256aa01e-1c81-48cc-9d05-54aacb82fe02', 66, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 11, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":116}', NULL, '2023-08-30 18:55:11', '2023-08-30 18:55:11'),
('8b61ee6c-01b7-4f0b-9392-5409cd3510d1', 67, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 11, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":117}', NULL, '2023-08-30 18:55:17', '2023-08-30 18:55:17'),
('60821452-570c-4e41-9fe0-dfbbbd72e350', 68, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 11, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":119}', NULL, '2023-08-30 18:55:21', '2023-08-30 18:55:21'),
('b227c7f6-03e1-4a6a-90f8-fe88ea9832ab', 69, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"user1\",\"id\":139}', NULL, '2023-08-30 19:56:23', '2023-08-30 19:56:23'),
('8b436439-a2d8-4040-816b-11f55310a8f8', 70, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-08-30 20:28:02', '2023-08-30 20:28:02'),
('8d45f03c-915a-42ad-943f-a1e6be5b9782', 71, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":110}', NULL, '2023-08-31 07:38:22', '2023-08-31 07:38:22'),
('03261345-68d0-40a5-91ea-365796635658', 72, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"please\",\"id\":140}', NULL, '2023-08-31 16:18:53', '2023-08-31 16:18:53'),
('7dfb44e4-4a63-4337-a4b9-b3a42700f9a0', 73, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-08-31 17:15:18', '2023-08-31 17:15:18'),
('3ef7cdc2-4da4-45ca-aa5d-55f6b7ece283', 74, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"user1\",\"id\":141}', NULL, '2023-08-31 17:20:06', '2023-08-31 17:20:06'),
('f49a71a1-0dea-4290-9c6f-89c6d546003e', 75, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":113}', NULL, '2023-08-31 18:31:13', '2023-08-31 18:31:13'),
('4512dd05-73dc-41a9-9c90-b0300d95409c', 76, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":122}', NULL, '2023-08-31 18:31:19', '2023-08-31 18:31:19'),
('7d8552f9-177c-44c0-96e8-a8767416b44f', 77, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":123}', NULL, '2023-08-31 18:46:46', '2023-08-31 18:46:46'),
('4bf5ac69-c7c8-4c1b-9d1b-253c4931c127', 78, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"user1\",\"id\":142}', NULL, '2023-08-31 19:16:52', '2023-08-31 19:16:52'),
('e9f720be-0320-4620-99f9-83ff1adbac3d', 79, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 13, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":142}', NULL, '2023-08-31 19:23:07', '2023-08-31 19:23:07'),
('7f63b471-b65e-4683-a592-13fe0688f646', 80, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\\u0627\\u0634\\u0644\\u0627\\u0647\\u0644\\u0627\\u0634\",\"message\":\"\\u0633\\u0634\\u064a\\u0634\\u064a\",\"role\":\"users\"}', NULL, '2023-08-31 19:25:45', '2023-08-31 19:25:45'),
('e843a8ae-1908-4685-9bd5-63e1898eeede', 81, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\\u0627\\u0634\\u0644\\u0627\\u0647\\u0644\\u0627\\u0634\",\"message\":\"\\u0633\\u0634\\u064a\\u0634\\u064a\",\"role\":\"users\"}', NULL, '2023-08-31 19:25:45', '2023-08-31 19:25:45'),
('21b02881-247b-45a1-a432-01009402665a', 82, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"\\u0627\\u0634\\u0644\\u0627\\u0647\\u0644\\u0627\\u0634\",\"message\":\"\\u0633\\u0634\\u064a\\u0634\\u064a\",\"role\":\"users\"}', NULL, '2023-08-31 19:25:45', '2023-08-31 19:25:45'),
('b5c11365-5d14-4b3c-817f-059831f5da10', 83, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\\u0627\\u0634\\u0644\\u0627\\u0647\\u0644\\u0627\\u0634\",\"message\":\"\\u0633\\u0634\\u064a\\u0634\\u064a\",\"role\":\"users\"}', NULL, '2023-08-31 19:25:45', '2023-08-31 19:25:45'),
('a48eab1e-dfe2-4f05-b978-5b03aac3aff2', 84, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\\u0627\\u0634\\u0644\\u0627\\u0647\\u0644\\u0627\\u0634\",\"message\":\"\\u0633\\u0634\\u064a\\u0634\\u064a\",\"role\":\"users\"}', NULL, '2023-08-31 19:25:45', '2023-08-31 19:25:45'),
('5852cf84-5159-4380-941c-ef028cbae2da', 85, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"\\u0627\\u0634\\u0644\\u0627\\u0647\\u0644\\u0627\\u0634\",\"message\":\"\\u0633\\u0634\\u064a\\u0634\\u064a\",\"role\":\"showrooms\"}', NULL, '2023-08-31 19:25:45', '2023-08-31 19:25:45'),
('ce84ce8f-2fe0-47c5-a05f-b8d96777b35a', 86, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"\\u0627\\u0634\\u0644\\u0627\\u0647\\u0644\\u0627\\u0634\",\"message\":\"\\u0633\\u0634\\u064a\\u0634\\u064a\",\"role\":\"agencies\"}', NULL, '2023-08-31 19:25:45', '2023-08-31 19:25:45'),
('dbc4af83-f35e-41f1-95c8-2594ec808c93', 87, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"\\u0627\\u0634\\u0644\\u0627\\u0647\\u0644\\u0627\\u0634\",\"message\":\"\\u0633\\u0634\\u064a\\u0634\\u064a\",\"role\":\"agencies\"}', NULL, '2023-08-31 19:25:45', '2023-08-31 19:25:45'),
('e6d801fb-847b-4c10-980f-4ea5e6855677', 88, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\\u0621\\u064a\",\"message\":\"\\u0633\\u0633\",\"role\":\"users\"}', NULL, '2023-08-31 19:29:41', '2023-08-31 19:29:41'),
('f8c0114f-6ab4-4087-b215-7df3d4a629ad', 89, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\\u0621\\u064a\",\"message\":\"\\u0633\\u0633\",\"role\":\"users\"}', NULL, '2023-08-31 19:29:41', '2023-08-31 19:29:41'),
('eae67262-754d-471c-927a-f8e01929d24b', 90, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"\\u0621\\u064a\",\"message\":\"\\u0633\\u0633\",\"role\":\"users\"}', NULL, '2023-08-31 19:29:41', '2023-08-31 19:29:41'),
('87baca56-ac87-4892-bd5e-fc9fe164e661', 91, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\\u0621\\u064a\",\"message\":\"\\u0633\\u0633\",\"role\":\"users\"}', NULL, '2023-08-31 19:29:41', '2023-08-31 19:29:41'),
('9e91c335-04b7-42fe-b727-30d047890d31', 92, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\\u0621\\u064a\",\"message\":\"\\u0633\\u0633\",\"role\":\"users\"}', NULL, '2023-08-31 19:29:41', '2023-08-31 19:29:41'),
('b815a47c-96af-4421-a432-3ebba8ce75ed', 93, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"\\u0621\\u064a\",\"message\":\"\\u0633\\u0633\",\"role\":\"showrooms\"}', NULL, '2023-08-31 19:29:41', '2023-08-31 19:29:41'),
('cb0bbc6b-973f-485b-a2d1-bd0730372b8e', 94, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"\\u0621\\u064a\",\"message\":\"\\u0633\\u0633\",\"role\":\"agencies\"}', NULL, '2023-08-31 19:29:41', '2023-08-31 19:29:41'),
('344df428-ef96-49b8-bf9f-9e630f4f7aea', 95, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"\\u0621\\u064a\",\"message\":\"\\u0633\\u0633\",\"role\":\"agencies\"}', NULL, '2023-08-31 19:29:41', '2023-08-31 19:29:41'),
('90729569-9f76-49d6-95fe-59c357b1d73b', 96, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 13, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":141}', NULL, '2023-08-31 19:33:51', '2023-08-31 19:33:51'),
('80e751fd-e9c2-48e0-b52b-9766553c2774', 97, 'App\\Notifications\\CarStatusSoldNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0628\\u064a\\u0639 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"user1\",\"id\":142}', NULL, '2023-08-31 19:34:08', '2023-08-31 19:34:08'),
('fc94d80b-433f-4440-95e8-d251ca6d1610', 98, 'App\\Notifications\\CarStatusSoldNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0628\\u064a\\u0639 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"user\",\"id\":112}', NULL, '2023-08-31 19:39:16', '2023-08-31 19:39:16'),
('e8972150-11ba-49d6-b188-a2334f1123d9', 99, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 22, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":140}', NULL, '2023-09-01 06:58:01', '2023-09-01 06:58:01'),
('2fd22d43-2c30-48d4-b664-b9d7ec170629', 100, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 22, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":138}', NULL, '2023-09-01 07:26:04', '2023-09-01 07:26:04'),
('af8656e1-2563-409c-a028-7b673617cd56', 101, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"123\",\"message\":\"zdfxgchvjbk\",\"role\":\"users\"}', NULL, '2023-09-01 07:34:42', '2023-09-01 07:34:42'),
('d8e97dd9-764b-43c2-bc70-51310dad691d', 102, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"123\",\"message\":\"zdfxgchvjbk\",\"role\":\"users\"}', NULL, '2023-09-01 07:34:42', '2023-09-01 07:34:42'),
('fdf42dd4-2997-4907-81d2-3e13b6c548a4', 103, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"123\",\"message\":\"zdfxgchvjbk\",\"role\":\"users\"}', NULL, '2023-09-01 07:34:42', '2023-09-01 07:34:42'),
('b823297f-7a02-46c9-8081-afa23df636a6', 104, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"123\",\"message\":\"zdfxgchvjbk\",\"role\":\"users\"}', NULL, '2023-09-01 07:34:42', '2023-09-01 07:34:42'),
('57a8ede0-97da-4d4f-bb40-037f99abdb59', 105, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"123\",\"message\":\"zdfxgchvjbk\",\"role\":\"users\"}', NULL, '2023-09-01 07:34:42', '2023-09-01 07:34:42'),
('19a2d9e1-1921-4eb8-9d32-fb4548ab49ca', 106, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-04 11:17:45', '2023-09-04 11:17:45'),
('c04195d9-01b3-440f-be88-4cd96466c99b', 107, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":126}', NULL, '2023-09-04 11:55:27', '2023-09-04 11:55:27'),
('555f357c-0d2b-4b09-8ca9-aca0b7a44fac', 108, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"Aya\",\"id\":143}', NULL, '2023-09-04 15:38:20', '2023-09-04 15:38:20'),
('64f14a30-2c0e-44ee-a758-43756c37ae26', 109, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 27, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":143}', NULL, '2023-09-04 16:04:32', '2023-09-04 16:04:32'),
('9782250a-f087-4d01-9ca1-52fc147ce864', 110, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-04 16:37:55', '2023-09-04 16:37:55'),
('0f67effb-da7e-42b4-a1bb-aa9cbe688321', 111, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":null,\"id\":144}', NULL, '2023-09-04 17:11:14', '2023-09-04 17:11:14'),
('46554921-1c76-4d11-a555-b04575dc6f69', 112, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-04 17:23:55', '2023-09-04 17:23:55'),
('f462152d-f9c0-4e93-bd2b-157ef7ea3e82', 113, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-04 17:55:49', '2023-09-04 17:55:49'),
('161f7d92-f1fb-4fa1-aa2e-c9bcb9bcab91', 114, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"Aya\",\"id\":145}', NULL, '2023-09-04 18:08:33', '2023-09-04 18:08:33'),
('6e61bbc4-f62c-429a-947a-373d1b4b519f', 115, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 27, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":145}', NULL, '2023-09-04 18:08:57', '2023-09-04 18:08:57'),
('ed593f6e-9a02-4150-a93c-daea5de9ca88', 116, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"role\":\"users\"}', NULL, '2023-09-04 18:11:53', '2023-09-04 18:11:53'),
('eee033b8-4c99-4f45-a50b-bea6872595d1', 117, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"role\":\"users\"}', NULL, '2023-09-04 18:11:53', '2023-09-04 18:11:53'),
('c4061087-683f-4b80-b608-02518016cbf7', 118, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"role\":\"users\"}', NULL, '2023-09-04 18:11:53', '2023-09-04 18:11:53'),
('9134dd53-ff33-4c8d-a69a-30dc468592f2', 119, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"role\":\"users\"}', NULL, '2023-09-04 18:11:53', '2023-09-04 18:11:53'),
('0f6e68a3-6ddd-404b-88de-a711737c8004', 120, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"role\":\"users\"}', NULL, '2023-09-04 18:11:53', '2023-09-04 18:11:53'),
('de0a1be3-3fec-4632-9cfc-050ebed3b6cc', 121, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"role\":\"showrooms\"}', NULL, '2023-09-04 18:11:53', '2023-09-04 18:11:53'),
('1bd22ba3-2683-412f-a8c2-cb4427229083', 122, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"role\":\"agencies\"}', NULL, '2023-09-04 18:11:53', '2023-09-04 18:11:53'),
('95f41ebe-bff0-4c66-8473-65234ac3ddfe', 123, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\\u0645\",\"role\":\"agencies\"}', NULL, '2023-09-04 18:11:53', '2023-09-04 18:11:53'),
('127720fb-e226-4e10-a9a2-84a43e15b09c', 124, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:16:37', '2023-09-04 18:16:37'),
('bc6cec84-84c0-4a09-942f-670750ea1cb1', 125, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:16:37', '2023-09-04 18:16:37'),
('fd357dbb-7800-4667-9c1b-8dc06f3de071', 126, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:16:37', '2023-09-04 18:16:37'),
('eabf88a3-611c-4fd8-a429-f2a821a32ff7', 127, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:16:37', '2023-09-04 18:16:37'),
('2485beed-3c10-414e-8a74-fe6b8c421a27', 128, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:16:37', '2023-09-04 18:16:37'),
('b91ec9df-21d1-4cc2-ae7b-8f4c2dfacccb', 129, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"showrooms\"}', NULL, '2023-09-04 18:16:37', '2023-09-04 18:16:37'),
('1669ed85-a70c-41ec-9a82-4de7e58f70c3', 130, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"agencies\"}', NULL, '2023-09-04 18:16:37', '2023-09-04 18:16:37'),
('5c583313-c69b-4f29-918b-29c26eb9d6ec', 131, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"agencies\"}', NULL, '2023-09-04 18:16:37', '2023-09-04 18:16:37'),
('8ff457a1-9ea8-4ab7-b485-47f1ec20d605', 132, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":144}', NULL, '2023-09-04 18:17:35', '2023-09-04 18:17:35'),
('0bfad843-1ad1-486c-972e-6710c47a89cd', 133, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:18:11', '2023-09-04 18:18:11'),
('037ebf42-5a01-4df1-9a91-de5d0423f4df', 134, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:18:11', '2023-09-04 18:18:11'),
('1d66af5f-99e6-443f-8d2d-25c472dc436b', 135, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:18:11', '2023-09-04 18:18:11'),
('a352de78-3b2e-4988-8f8a-7f65f2226a77', 136, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:18:11', '2023-09-04 18:18:11'),
('86e01ae6-faef-43f9-9f54-cfdc9aa5854f', 137, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:18:11', '2023-09-04 18:18:11'),
('e70c15c7-dcbb-4bdd-aa82-aee11015dc0c', 138, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"showrooms\"}', NULL, '2023-09-04 18:18:11', '2023-09-04 18:18:11'),
('fd439de3-f213-4265-844b-31e79334a114', 139, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"agencies\"}', NULL, '2023-09-04 18:18:11', '2023-09-04 18:18:11'),
('7e72bd22-a2a3-4da6-9938-acdddcbac501', 140, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"agencies\"}', NULL, '2023-09-04 18:18:11', '2023-09-04 18:18:11'),
('24325f1e-b85d-402b-86dd-73d6ea16732f', 141, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:18:31', '2023-09-04 18:18:31'),
('65ac0ccd-b070-4a6c-9aa5-0ee7df0863c0', 142, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:18:31', '2023-09-04 18:18:31'),
('5cc218f1-c7b6-4d5a-a114-88c68b6b629f', 143, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:18:31', '2023-09-04 18:18:31'),
('7930d752-112b-4549-a00f-6197cd32889f', 144, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:18:31', '2023-09-04 18:18:31'),
('12e79a4b-dee4-4aa4-9207-9730774e769c', 145, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:18:31', '2023-09-04 18:18:31'),
('63bc67b9-3e90-474b-ba6a-434b9b9d5b24', 146, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:19:44', '2023-09-04 18:19:44'),
('9486999d-9fd6-4250-ac90-ed6cc823bbb0', 147, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:19:44', '2023-09-04 18:19:44'),
('f8486d37-1b00-4022-ba47-01f9f19f1ef0', 148, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:19:44', '2023-09-04 18:19:44'),
('f9d9003b-d6b5-4d31-96d5-c1489b87266e', 149, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:19:44', '2023-09-04 18:19:44'),
('3d1dab5a-619c-4cf4-a35d-63ac2f10d984', 150, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:19:44', '2023-09-04 18:19:44'),
('96717691-d462-4a27-9582-b85458459071', 151, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 27, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:19:44', '2023-09-04 18:19:44'),
('97ef874d-b0c4-46af-8f1e-9e21348b3558', 152, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:20:07', '2023-09-04 18:20:07'),
('379f48a2-4b62-4e97-8796-d91e5bf6d3c5', 153, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:20:07', '2023-09-04 18:20:07'),
('fd19546c-8ffb-4300-ad2b-de63ecc94cde', 154, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 22, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:20:07', '2023-09-04 18:20:07'),
('671b501e-17ac-4ae9-bb07-642aea02072f', 155, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:20:07', '2023-09-04 18:20:07'),
('3b37647d-48dd-45c3-9c9c-e79736cecf0d', 156, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:20:07', '2023-09-04 18:20:07'),
('0ca7885b-2c8a-4bf4-b830-fa68a581d90b', 157, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 27, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"users\"}', NULL, '2023-09-04 18:20:07', '2023-09-04 18:20:07'),
('cc046b12-640b-45e6-8ca5-b9aab95060b9', 158, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"showrooms\"}', NULL, '2023-09-04 18:20:07', '2023-09-04 18:20:07'),
('82447e9f-949b-493f-a8c3-d67a817843da', 159, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"agencies\"}', NULL, '2023-09-04 18:20:07', '2023-09-04 18:20:07'),
('217a83bb-383f-49e1-8c17-da97d425662d', 160, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"message\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0628\\u0643\",\"role\":\"agencies\"}', NULL, '2023-09-04 18:20:07', '2023-09-04 18:20:07'),
('35135529-11b8-4b21-a59a-f14745918e50', 161, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"Aya\",\"id\":146}', NULL, '2023-09-04 18:30:43', '2023-09-04 18:30:43'),
('82e042d4-e114-4045-a633-1b2a1f77d3c1', 162, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"Aya\",\"id\":147}', NULL, '2023-09-05 11:38:16', '2023-09-05 11:38:16'),
('36e9f5b3-e8eb-4ac2-8986-b56b3eb8689d', 163, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 27, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":146}', NULL, '2023-09-05 11:46:47', '2023-09-05 11:46:47'),
('ff9a5d06-df6a-4485-baf2-4b2da2c61f6b', 164, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 27, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":147}', NULL, '2023-09-05 11:48:02', '2023-09-05 11:48:02'),
('0b6d7c17-f8ef-4775-bfbc-9beee1cf9537', 165, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":null,\"id\":148}', NULL, '2023-09-05 11:49:37', '2023-09-05 11:49:37'),
('8330be88-56d0-4718-8e83-a70f78809e4d', 166, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-05 11:50:25', '2023-09-05 11:50:25'),
('50d55326-22de-4cbe-a5c4-372658d9f30b', 167, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-05 12:47:19', '2023-09-05 12:47:19');
INSERT INTO `notifications` (`id`, `id_increment`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('c253424d-6b52-4978-a25e-7635d5d87372', 168, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":null,\"id\":150}', NULL, '2023-09-05 13:09:04', '2023-09-05 13:09:04'),
('3da3b27c-e5a9-422a-a313-3627e7c69555', 169, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":150}', NULL, '2023-09-05 13:10:21', '2023-09-05 13:10:21'),
('a5b85181-d60d-4554-b312-f2ca730b3448', 170, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"title\",\"message\":\"message\",\"role\":\"users\"}', NULL, '2023-09-05 13:12:39', '2023-09-05 13:12:39'),
('8991fef6-efd6-47f7-b576-ad04e875f4ec', 171, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"title\",\"message\":\"message\",\"role\":\"users\"}', NULL, '2023-09-05 13:12:39', '2023-09-05 13:12:39'),
('ebc293d8-b57b-4b86-a7b4-3e1de16b1629', 172, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"title\",\"message\":\"message\",\"role\":\"users\"}', NULL, '2023-09-05 13:12:39', '2023-09-05 13:12:39'),
('086b6df1-ebfc-4cfd-9796-0c63a5060bcd', 173, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"title\",\"message\":\"message\",\"role\":\"users\"}', NULL, '2023-09-05 13:12:39', '2023-09-05 13:12:39'),
('c6e0c16a-c4d2-49e5-b91b-c74f3d577a87', 174, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 27, '{\"title\":\"title\",\"message\":\"message\",\"role\":\"users\"}', NULL, '2023-09-05 13:12:39', '2023-09-05 13:12:39'),
('1bafc2f1-99d8-43a8-804f-193e39762deb', 175, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"title\",\"message\":\"message\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:12:39', '2023-09-05 13:12:39'),
('931021d9-d771-4f52-974c-c23697284585', 176, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"title\",\"message\":\"message\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:12:39', '2023-09-05 13:12:39'),
('8fe86503-533d-432f-b713-7a7a2ca30e33', 177, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"users\"}', NULL, '2023-09-05 13:23:34', '2023-09-05 13:23:34'),
('14063a18-e6c9-4c33-aa68-24d5935d9c6e', 178, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"users\"}', NULL, '2023-09-05 13:23:34', '2023-09-05 13:23:34'),
('b81ca07a-4435-4a73-87fc-98c1c139bd14', 179, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"users\"}', NULL, '2023-09-05 13:23:34', '2023-09-05 13:23:34'),
('632a3c5d-19de-40f4-a077-bda98ff685dc', 180, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"users\"}', NULL, '2023-09-05 13:23:34', '2023-09-05 13:23:34'),
('488a7a00-3b9b-4679-9961-b17eac7326ee', 181, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 27, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"users\"}', NULL, '2023-09-05 13:23:34', '2023-09-05 13:23:34'),
('9c14f66d-5817-4b58-8d21-fc8b69c9916a', 182, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:23:34', '2023-09-05 13:23:34'),
('9ab26db5-4e38-47c1-ba68-26ff2a6c97f4', 183, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:23:34', '2023-09-05 13:23:34'),
('1c616957-ea65-420f-9edc-42155cc45e34', 184, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"users\"}', NULL, '2023-09-05 13:26:17', '2023-09-05 13:26:17'),
('9841828c-7fc2-4fbe-952f-2549a0d7bc71', 185, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"users\"}', NULL, '2023-09-05 13:26:17', '2023-09-05 13:26:17'),
('fed23d10-bebc-452a-b0ce-76123d66aeb4', 186, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"users\"}', NULL, '2023-09-05 13:26:17', '2023-09-05 13:26:17'),
('6e134482-6292-4071-8860-dcbb05c426d5', 187, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"users\"}', NULL, '2023-09-05 13:26:17', '2023-09-05 13:26:17'),
('70b087cd-8295-43f2-99db-5e86675a9ea6', 188, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 27, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"users\"}', NULL, '2023-09-05 13:26:17', '2023-09-05 13:26:17'),
('ecbd1baa-c381-4600-aae5-9e985a92ad72', 189, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:26:17', '2023-09-05 13:26:17'),
('4e40b3c4-0412-4714-a841-044822eb7df5', 190, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"\\u0634\\u0634\",\"message\":\"\\u0634\\u0634\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:26:17', '2023-09-05 13:26:17'),
('77f0b958-5517-4f88-8595-78ad6bb71929', 191, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\'hgf\",\"message\":\";okhkjghgcf\",\"role\":\"users\"}', NULL, '2023-09-05 13:27:25', '2023-09-05 13:27:25'),
('2136a672-ca38-4823-824e-1a9ed5ea1d78', 192, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\'hgf\",\"message\":\";okhkjghgcf\",\"role\":\"users\"}', NULL, '2023-09-05 13:27:25', '2023-09-05 13:27:25'),
('b0263438-c3cd-4b98-bbba-76be5226ca17', 193, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\'hgf\",\"message\":\";okhkjghgcf\",\"role\":\"users\"}', NULL, '2023-09-05 13:27:25', '2023-09-05 13:27:25'),
('6981d558-3f2f-4ca4-a295-919c2ab2304b', 194, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\'hgf\",\"message\":\";okhkjghgcf\",\"role\":\"users\"}', NULL, '2023-09-05 13:27:25', '2023-09-05 13:27:25'),
('892c772d-ab59-4fa0-a484-00a34411a25f', 195, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 27, '{\"title\":\"\'hgf\",\"message\":\";okhkjghgcf\",\"role\":\"users\"}', NULL, '2023-09-05 13:27:25', '2023-09-05 13:27:25'),
('b4e60e75-765b-440e-b39c-a93c31142e8d', 196, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"\'hgf\",\"message\":\";okhkjghgcf\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:27:25', '2023-09-05 13:27:25'),
('0b3c00a2-7758-4f85-81c2-39e94a6cfb56', 197, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"\'hgf\",\"message\":\";okhkjghgcf\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:27:25', '2023-09-05 13:27:25'),
('7466d179-445b-44d5-b21f-6e27019ca8d7', 198, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\";kojlkhjghv\",\"message\":\";\'klhkjghfgv\",\"role\":\"users\"}', NULL, '2023-09-05 13:29:52', '2023-09-05 13:29:52'),
('0b2e2d55-af84-486d-8efe-244ef7d009f3', 199, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\";kojlkhjghv\",\"message\":\";\'klhkjghfgv\",\"role\":\"users\"}', NULL, '2023-09-05 13:29:52', '2023-09-05 13:29:52'),
('2bcb89eb-a536-44d7-a386-3935f66355f7', 200, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\";kojlkhjghv\",\"message\":\";\'klhkjghfgv\",\"role\":\"users\"}', NULL, '2023-09-05 13:29:52', '2023-09-05 13:29:52'),
('7ed1431a-d729-4bfe-bf60-a00b5bb8124c', 201, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\";kojlkhjghv\",\"message\":\";\'klhkjghfgv\",\"role\":\"users\"}', NULL, '2023-09-05 13:29:52', '2023-09-05 13:29:52'),
('ac70f4a9-f5b8-4d62-888d-ea4666262172', 202, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 27, '{\"title\":\";kojlkhjghv\",\"message\":\";\'klhkjghfgv\",\"role\":\"users\"}', NULL, '2023-09-05 13:29:52', '2023-09-05 13:29:52'),
('bf439331-17f2-4bf1-b8fd-24a6afa67403', 203, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\";kojlkhjghv\",\"message\":\";\'klhkjghfgv\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:29:52', '2023-09-05 13:29:52'),
('8686943b-10a6-4e98-bcca-9ccffae5a61a', 204, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\";kojlkhjghv\",\"message\":\";\'klhkjghfgv\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:29:52', '2023-09-05 13:29:52'),
('e288267b-278a-4f1f-8886-4d155d326ff9', 205, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 12, '{\"title\":\"\';l;kbj\",\"message\":\"\'\\r\\nl\';lklbjmnb\",\"role\":\"users\"}', NULL, '2023-09-05 13:30:14', '2023-09-05 13:30:14'),
('9c1740b8-49f2-41ea-841f-b8ff82238ff2', 206, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 13, '{\"title\":\"\';l;kbj\",\"message\":\"\'\\r\\nl\';lklbjmnb\",\"role\":\"users\"}', NULL, '2023-09-05 13:30:14', '2023-09-05 13:30:14'),
('7258bb8b-ccf8-4855-9ddf-bc399dd0ac56', 207, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 23, '{\"title\":\"\';l;kbj\",\"message\":\"\'\\r\\nl\';lklbjmnb\",\"role\":\"users\"}', NULL, '2023-09-05 13:30:14', '2023-09-05 13:30:14'),
('bc63702f-f98c-4c40-9617-ce86e1794574', 208, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 24, '{\"title\":\"\';l;kbj\",\"message\":\"\'\\r\\nl\';lklbjmnb\",\"role\":\"users\"}', NULL, '2023-09-05 13:30:14', '2023-09-05 13:30:14'),
('c8e6875a-6f98-4956-b8da-f4aec904f285', 209, 'App\\Notifications\\GeneralNotification', 'App\\Models\\User', 27, '{\"title\":\"\';l;kbj\",\"message\":\"\'\\r\\nl\';lklbjmnb\",\"role\":\"users\"}', NULL, '2023-09-05 13:30:14', '2023-09-05 13:30:14'),
('5839844c-9304-48fc-ad42-da25898bc611', 210, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 8, '{\"title\":\"\';l;kbj\",\"message\":\"\'\\r\\nl\';lklbjmnb\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:30:14', '2023-09-05 13:30:14'),
('1149b33a-eeb6-4805-a361-be1768ab792b', 211, 'App\\Notifications\\GeneralNotification', 'App\\Models\\Showroom', 13, '{\"title\":\"\';l;kbj\",\"message\":\"\'\\r\\nl\';lklbjmnb\",\"role\":\"agencies\"}', NULL, '2023-09-05 13:30:14', '2023-09-05 13:30:14'),
('4ae04c4b-1bf3-4dbb-8dd6-42e3d99e0be1', 212, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-05 13:52:03', '2023-09-05 13:52:03'),
('39d5f879-dac7-450f-be45-39a1464eca31', 213, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-05 13:53:12', '2023-09-05 13:53:12'),
('eeefadc0-5379-4e83-9e59-aafa12affc02', 214, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-05 13:55:53', '2023-09-05 13:55:53'),
('ed65a9b3-f89a-4f7b-8247-ef5aaf11d7d3', 215, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":148}', NULL, '2023-09-05 17:54:28', '2023-09-05 17:54:28'),
('6649d9e8-bfda-40be-ae63-fe10c1e2f508', 216, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-05 18:00:38', '2023-09-05 18:00:38'),
('ead8f45d-01fd-4c3b-afd4-4c989a9d763e', 217, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-05 20:10:01', '2023-09-05 20:10:01'),
('b94edd0a-6bac-4d82-a619-3f0615832ea9', 218, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-07 10:44:46', '2023-09-07 10:44:46'),
('a1f4f332-2c1d-4220-a09d-4410f28462b0', 219, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-07 10:51:45', '2023-09-07 10:51:45'),
('dcf06141-4e52-4872-9117-64fc25b7914c', 220, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"AAa\",\"id\":153}', NULL, '2023-09-07 11:25:23', '2023-09-07 11:25:23'),
('7992723c-57d9-42df-8e47-2896f5eba260', 221, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 29, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":153}', NULL, '2023-09-07 11:27:46', '2023-09-07 11:27:46'),
('54b5b5c6-2cda-450b-9472-f967f2b6250d', 222, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"AAa\",\"id\":154}', NULL, '2023-09-07 11:37:57', '2023-09-07 11:37:57'),
('37a452e8-f4b2-496c-8136-1512a23a8b1c', 223, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 29, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":154}', NULL, '2023-09-07 11:38:38', '2023-09-07 11:38:38'),
('3a768848-3ae7-4b72-9515-bcc93de14e4c', 224, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"Aya\",\"id\":155}', NULL, '2023-09-07 13:49:08', '2023-09-07 13:49:08'),
('8d5c1e10-21d7-4e9d-b225-497ec59fa647', 225, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"new554\",\"id\":156}', NULL, '2023-09-10 23:26:03', '2023-09-10 23:26:03'),
('1af15f14-e24b-41a0-93ff-c0e30de5e6cc', 226, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 35, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":156}', NULL, '2023-09-10 23:26:40', '2023-09-10 23:26:40'),
('db73b6eb-0be7-4763-8833-1d222b08c32f', 227, 'App\\Notifications\\CarStatusSoldNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0628\\u064a\\u0639 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"testToday\",\"id\":157}', NULL, '2023-09-11 17:08:18', '2023-09-11 17:08:18'),
('e9c86823-0d73-4aa4-a38a-6cc5e79ec9c0', 228, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-13 12:01:52', '2023-09-13 12:01:52'),
('5632b61a-4152-43a6-b30a-a41908621eaf', 229, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":null,\"id\":158}', NULL, '2023-09-14 16:36:18', '2023-09-14 16:36:18'),
('3e8fd276-f83f-4a01-b3b6-1e9186c3f935', 230, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\Showroom', 10, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":158}', NULL, '2023-09-14 16:37:52', '2023-09-14 16:37:52'),
('4e7c93df-f108-443d-8819-8ad2d29eb9be', 231, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-14 17:25:24', '2023-09-14 17:25:24'),
('bb24317f-e302-4045-a112-c79009816c02', 232, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-17 11:40:21', '2023-09-17 11:40:21'),
('c65cadc5-48ae-4f26-83eb-6beed6e7b3a3', 233, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-17 11:59:13', '2023-09-17 11:59:13'),
('945b9712-716b-4d75-b77b-aeb84063ed64', 234, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-17 12:08:58', '2023-09-17 12:08:58'),
('925f7c73-370b-47a1-98ed-34148ad8f995', 235, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-17 12:14:16', '2023-09-17 12:14:16'),
('565c1ba1-6061-44dc-b8a6-2760d0bce5a3', 236, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-17 12:16:50', '2023-09-17 12:16:50'),
('6bb0f92f-2c29-4ce7-8439-d609cd67babb', 237, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 15:36:33', '2023-09-19 15:36:33'),
('2aaab701-4877-4df9-98dc-5fa34d626ab9', 238, 'App\\Notifications\\CarStatusSoldNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0628\\u064a\\u0639 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"user\",\"id\":114}', NULL, '2023-09-19 16:11:57', '2023-09-19 16:11:57'),
('d7f0882a-f70c-4b66-9cc6-11dd74f8dcf6', 239, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"Harbey\",\"id\":168}', NULL, '2023-09-19 16:12:26', '2023-09-19 16:12:26'),
('9e18a5e1-53c9-4e47-bce3-c1d2ecac8099', 240, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 49, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":168}', NULL, '2023-09-19 16:15:06', '2023-09-19 16:15:06'),
('bd75364a-94c3-463f-a83e-659b0eb25c7f', 241, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 20:35:28', '2023-09-19 20:35:28'),
('59e4359f-6987-4a53-af3b-4f1c0be0e600', 242, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 20:57:39', '2023-09-19 20:57:39'),
('f8fe073c-fb12-4e75-97a9-df2271f2feaa', 243, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 20:58:04', '2023-09-19 20:58:04'),
('f432e73f-1392-45ac-b77f-4387f6650b4b', 244, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 21:02:47', '2023-09-19 21:02:47'),
('0af17517-38ad-4e3b-8475-9dc797ad7ee9', 245, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 21:06:36', '2023-09-19 21:06:36'),
('c9675d8a-34eb-42cd-9c15-6be88f106b9a', 246, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 21:08:48', '2023-09-19 21:08:48'),
('04fc3421-2842-412a-9724-207ba677fa44', 247, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 21:11:38', '2023-09-19 21:11:38'),
('c9ef8883-1098-4cd1-95d7-6f115b68f34b', 248, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 21:12:30', '2023-09-19 21:12:30'),
('ffddc08f-b8b2-45a8-a992-fd12a8464d13', 249, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 21:12:53', '2023-09-19 21:12:53'),
('a0e46fb8-694f-48c7-9164-5a9251f2cde0', 250, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 21:14:02', '2023-09-19 21:14:02'),
('18723c2e-0e49-4f3e-8870-13b470d41d53', 251, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 21:14:11', '2023-09-19 21:14:11'),
('031c2ae5-ddf4-42c2-9499-4c14a03c504d', 252, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 21:16:14', '2023-09-19 21:16:14'),
('f00f8d9b-a9ca-4ae3-a164-33b1abcdc642', 253, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-19 21:17:16', '2023-09-19 21:17:16'),
('8ba35dbc-003f-4e1d-9a05-fe6e346b6c00', 254, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-20 07:16:33', '2023-09-20 07:16:33'),
('cd64bd18-6230-4c44-8207-d23dc2ddb9fa', 255, 'App\\Notifications\\CarStatusSoldNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0628\\u064a\\u0639 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"user\",\"id\":165}', NULL, '2023-09-20 09:55:23', '2023-09-20 09:55:23'),
('8a40bd59-3cfe-4d3b-98ee-da42996cff3f', 256, 'App\\Notifications\\RequestCarUserNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u0637\\u0644\\u0628 \\u0628\\u064a\\u0639 \\u0627\\u0648 \\u0627\\u0633\\u062a\\u0628\\u062f\\u0644 \",\"message\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0637\\u0644\\u0628 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u062c\\u062f\\u064a\\u062f\"}', NULL, '2023-09-20 15:33:51', '2023-09-20 15:33:51'),
('eceb016e-e1fb-446c-b37c-27d818978dc2', 257, 'App\\Notifications\\CarNotification', 'App\\Models\\Admin', 1, '{\"title\":\"\\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0639\\u0631\\u064a\\u0628\\u0629\",\"message\":\"a\",\"id\":172}', NULL, '2023-09-21 21:52:47', '2023-09-21 21:52:47'),
('d3d48607-12e9-462e-8253-21c9d19b63ed', 258, 'App\\Notifications\\ShowroomApprovedCarNotification', 'App\\Models\\User', 51, '{\"title\":\"Automobile\",\"message\":\" \\u062a\\u0645 \\u0642\\u0628\\u0648\\u0644 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643\",\"id\":172}', NULL, '2023-09-21 21:57:05', '2023-09-21 21:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0025806e044935b4ee3864e6bbf19464035c92e00474857458286530714e7ff9a388a21287647e9e', 10, 5, '64dcc470b0ef6', '[]', 0, '2023-08-16 15:43:28', '2023-08-16 15:43:28', '2024-08-16 15:43:28'),
('00e2b51c6f68088e4d7c893b14667547507199843d7513ab4b6d6457a26453f640a19268741b29a4', 12, 5, '64dbea27e2a82', '[\"user\"]', 0, '2023-08-16 00:12:07', '2023-08-16 00:12:07', '2024-08-16 00:12:07'),
('01e8b1f8936b5dd9e568b387a94615398e9afb9bccace38e091514f016e05ce3d144fbec4b5d829e', 40, 5, '64ff640479de4', '[\"user\"]', 0, '2023-09-11 22:01:24', '2023-09-11 22:01:24', '2024-09-11 22:01:24'),
('02423d64f9cfe85e591bd87d4628c45148ba35fa2a78c119fe6df56a4b0b59602604b539e4582d68', 8, 5, '64ccef5101b66', '[]', 0, '2023-08-04 15:30:09', '2023-08-04 15:30:09', '2024-08-04 15:30:09'),
('025df7359147a98ccffe550c5917836317e432056c487ef7674a6b253c2d9015d8ad2cad69efa7e5', 12, 5, '64da3a0cd9a99', '[\"showroom\"]', 0, '2023-08-14 17:28:28', '2023-08-14 17:28:28', '2024-08-14 17:28:28'),
('031b9b8f61fe246710b1bd6aac24f83392f93de78273fae5b70eca9457eb0a2108f619e06d81a97e', 13, 5, '64ef4a98cb3bb', '[\"user\"]', 0, '2023-08-30 16:56:40', '2023-08-30 16:56:40', '2024-08-30 16:56:40'),
('05bd3c93ef1de75f08abb6321b12cee8c69ff591563782c2b58171972cb8819547b7e83a2ac8dcd5', 12, 5, '64d8c77d770c3', '[\"user\"]', 0, '2023-08-13 15:07:25', '2023-08-13 15:07:25', '2024-08-13 15:07:25'),
('05d13bdc0b762f808d2f397993d2b84dd6313111bb8a736e9bfea6329b9d862ee487d6e2c07f8b61', 3, 5, '64c8e1a518651', '[\"user\"]', 0, '2023-08-01 13:42:45', '2023-08-01 13:42:45', '2024-08-01 13:42:45'),
('064b5113284d6f2d1fcd6ff7198db4c62d7ec01b3cc8b74464b1946c7bb4011ef8b40bd1862a1c58', 10, 5, '64dcc591eb902', '[\"showroom\"]', 0, '2023-08-16 15:48:17', '2023-08-16 15:48:17', '2024-08-16 15:48:17'),
('068c2a5176b6ae6218ec5f167e18f5fc40e2c2236ca92c7c882a0125dc5e9f725775d02778c1d239', 10, 5, '64f4d310c0f7a', '[\"showroom\"]', 0, '2023-09-03 21:40:16', '2023-09-03 21:40:16', '2024-09-03 21:40:16'),
('068ef9d379fd663a5ccc192187ecc40f23652921807740ef836de98c0886cc9ae8232efc418ad400', 11, 5, '64d9e307b7c7a', '[]', 0, '2023-08-14 11:17:11', '2023-08-14 11:17:11', '2024-08-14 11:17:11'),
('06aaf02508aeb74f9a67af3797e50f12c52cc0a55491d1bf6cbc47e8a9d9ef34e5300105bd7f1c05', 11, 5, '64d8c16a91fe5', '[]', 0, '2023-08-13 14:41:30', '2023-08-13 14:41:30', '2024-08-13 14:41:30'),
('06ab3b8b2267cac87063aa6ef60c03fab966a0e1ba33315a1a5806a9e6128759a84f492ec773bb68', 16, 5, '64d8a8ddc08a0', '[\"user\"]', 0, '2023-08-13 12:56:45', '2023-08-13 12:56:45', '2024-08-13 12:56:45'),
('06b4b9fe03ce33693bf0864a0a1cd8e100840bb78aa0a923d8b0e966deba2e7fd948301492bcee98', 10, 5, '64dcc591e02bf', '[]', 0, '2023-08-16 15:48:17', '2023-08-16 15:48:17', '2024-08-16 15:48:17'),
('0701eacd48500c2815b8b0ed0cd9001f0e807ff46bb8891e3d33d2f585f7a1cb4783df4e14ebff49', 49, 5, '65074905d9c5b', '[\"user\"]', 0, '2023-09-17 21:44:21', '2023-09-17 21:44:21', '2024-09-17 21:44:21'),
('070fa9fdceada33f68326687f38ae857a38bec881d7093bb1cd153f4ab1cfcfde3d2ef1792fb3596', 1, 5, '64cb6e297c1a5', '[]', 0, '2023-08-03 12:06:49', '2023-08-03 12:06:49', '2024-08-03 12:06:49'),
('072982cc5e4cf6baf91197d84c0ad1286c27a4bea402fd97f5801c3e21fc994cd7f7ecca4f31f1f5', 11, 5, '64eda99721307', '[]', 0, '2023-08-29 11:17:27', '2023-08-29 11:17:27', '2024-08-29 11:17:27'),
('07d06883f39c37b81531fcd171af90b2f26d8bc7e57303cf6c7a28ca27c711fd6dbf74e9b6b724d6', 6, 5, '64cba2cdc5209', '[]', 0, '2023-08-03 15:51:25', '2023-08-03 15:51:25', '2024-08-03 15:51:25'),
('07d85483ee8779253494c5e4449d935480c959d47f8b1b453c2947cec02bee39a2698815c7acfd86', 7, 5, '64cbb153bafc3', '[]', 0, '2023-08-03 16:53:23', '2023-08-03 16:53:23', '2024-08-03 16:53:23'),
('08689ab2e619b9e60fc391632e29b7fc0292f21eda0a2ad5a63b15cecfb5935cc222a3a0e839b521', 10, 5, '650054175015a', '[\"showroom\"]', 0, '2023-09-12 15:05:43', '2023-09-12 15:05:43', '2024-09-12 15:05:43'),
('09f61b12eed7bdb36c5d52845ec577c16fe203e5dfd01e8095a7890d5f68d26e702adae00ffa95bc', 1, 5, '64c8b9700ed9e', '[\"showroom\"]', 0, '2023-08-01 10:51:12', '2023-08-01 10:51:12', '2024-08-01 10:51:12'),
('0a2c0e33f3deca7e707f171bf6ac1cf25b66f2c146e3c57b0b2032646c58bf780ac3f101357fdaf4', 11, 5, '64db3e697ae07', '[\"showroom\"]', 0, '2023-08-15 11:59:21', '2023-08-15 11:59:21', '2024-08-15 11:59:21'),
('0c36eb4c349a26b6d3d2430a4de436e95ab00c31bf119bd96d8b6f3714e4023b870f73eb16fd7e41', 12, 5, '64c8ce1eae42e', '[\"user\"]', 0, '2023-08-01 12:19:26', '2023-08-01 12:19:26', '2024-08-01 12:19:26'),
('0c8e8f7df938e4f27360423f0666d5c0eae44b4471d01cfaa82c8541b63470fc86af9ebc86281e6c', 11, 5, '64db31a4cf2bc', '[]', 0, '2023-08-15 11:04:52', '2023-08-15 11:04:52', '2024-08-15 11:04:52'),
('0cb27290d610c89292e18dc69e20a29cefff041e37f471cfdc61b20dfd393cb2be6a3fcf73cb9171', 28, 5, '64f78962b56e1', '[\"user\"]', 0, '2023-09-05 23:02:42', '2023-09-05 23:02:42', '2024-09-05 23:02:42'),
('0daca9a6507c73c11213a2834c36f5a43fc69005e788f6d7cf82dce2911b2d2d8d9fb2d6e005ed28', 8, 5, '64cd729e92f06', '[]', 0, '2023-08-05 00:50:22', '2023-08-05 00:50:22', '2024-08-05 00:50:22'),
('0e3445f31848e7cb86f74966dcee5a0d2d8f2a25ef87edaf26bbcab691f9a66b99d7f91f0706f963', 9, 5, '64d3420e39e03', '[\"showroom\"]', 0, '2023-08-09 10:36:46', '2023-08-09 10:36:46', '2024-08-09 10:36:46'),
('0e9be8d6332e46bfe08d521379bc196bf9115ba19b18795d7c60ce8f7e0ba2def14d719fc2ade46c', 9, 5, '64d223ef7ad2f', '[]', 0, '2023-08-08 14:15:59', '2023-08-08 14:15:59', '2024-08-08 14:15:59'),
('102a8481651ef614bda6f303ebd98b96327ca9c72b05a99118caa1a63cf48f5b26f358907b563fa5', 12, 5, '64d2386f48682', '[\"user\"]', 0, '2023-08-08 15:43:27', '2023-08-08 15:43:27', '2024-08-08 15:43:27'),
('10922f92e866c569cd3cd3db3eca695212b891e87c8208b07161a1c1d374a22b71509f0735763f36', 10, 5, '64f7401c1a418', '[\"showroom\"]', 0, '2023-09-05 17:50:04', '2023-09-05 17:50:04', '2024-09-05 17:50:04'),
('10a371a505a4d895d4eefbff35644bec23bf9b9291dd6e63c7028549be419b215a6bbef71789afd6', 18, 5, '64d8f1f4b0726', '[\"user\"]', 0, '2023-08-13 18:08:36', '2023-08-13 18:08:36', '2024-08-13 18:08:36'),
('11f84b3983546b4fb86c154b4fe1d8b8b569263f690db3ac2ecf0df7ac732311afb14be740d00244', 8, 5, '64d251153d7b1', '[]', 0, '2023-08-08 17:28:37', '2023-08-08 17:28:37', '2024-08-08 17:28:37'),
('127940896a2399152180fa52d4d93214eba27e1c38e732922d5b749d00916b6f39a6bb4f4d4495e7', 11, 5, '64f05931001ce', '[\"showroom\"]', 0, '2023-08-31 12:11:13', '2023-08-31 12:11:13', '2024-08-31 12:11:13'),
('14677dbb8e2d49e3da96dd5ffff0d36b463312605b9ea3ac4c6042292953f8021ff174fe6d7c4e0b', 9, 5, '64d223ef8c3c1', '[\"showroom\"]', 0, '2023-08-08 14:15:59', '2023-08-08 14:15:59', '2024-08-08 14:15:59'),
('15519d9dda6b034ab55ea988f1df936546008e8454e5b20145ff7540a61ceaf7700149895df21dee', 8, 5, '64d3b89c2b415', '[]', 0, '2023-08-09 19:02:36', '2023-08-09 19:02:36', '2024-08-09 19:02:36'),
('159b894cd31e8df8e324418babc4db89d3627d7730d13a0ab97f6a018a0b12f653ac79d64a5bed53', 20, 5, '6506bb49624fa', '[\"user\"]', 0, '2023-09-17 11:39:37', '2023-09-17 11:39:37', '2024-09-17 11:39:37'),
('15a82d6c327ce301d19121f22c3a8815afca864da6e9a150a3dbffe838e35eaad0643add7351f613', 7, 5, '64cba572b8848', '[]', 0, '2023-08-03 16:02:42', '2023-08-03 16:02:42', '2024-08-03 16:02:42'),
('15e2c2102834aa86a944f047c3d898b6d55a2bd997a9c3ecc2b7ae82bb05a9fb0fa4575260357311', 1, 5, '64c840d921f20', '[]', 0, '2023-08-01 02:16:41', '2023-08-01 02:16:41', '2024-08-01 02:16:41'),
('16389740f3fbb324c81159ab8ae40d3cf9cef9fc4edfbe2f4be7172b8dcedf98d00bf6ea7fa7bcd1', 7, 5, '64cc20023525c', '[]', 0, '2023-08-04 00:45:38', '2023-08-04 00:45:38', '2024-08-04 00:45:38'),
('16b9e19a5ee54b9bc7b99885a4ab8ed95d1d74cc8975313ce291d88af1646fdb0849e6866b6cc5a9', 12, 5, '64cf546593828', '[\"user\"]', 0, '2023-08-06 11:05:57', '2023-08-06 11:05:58', '2024-08-06 11:05:57'),
('1793f135e4305d5479c258ab3461aef028d5ae6ddd707bb5141cba340aa3b6d6a2030dbee8c83747', 6, 5, '64cbae6c08fc6', '[]', 0, '2023-08-03 16:41:00', '2023-08-03 16:41:00', '2024-08-03 16:41:00'),
('17cb2544d8d5a8bc62a0f229edf7287cbe5d6f2285420883af3271bfcc9496d186395394e7dcccd3', 13, 5, '64f5ec1230f0f', '[\"user\"]', 0, '2023-09-04 17:39:14', '2023-09-04 17:39:14', '2024-09-04 17:39:14'),
('186e298d9b9c3c2cbfeb25e77fdae82eb4c309459319bf11cb4b35ea69fa82e919e13560baf2dae9', 9, 5, '64d3b747439e6', '[\"showroom\"]', 0, '2023-08-09 18:56:55', '2023-08-09 18:56:55', '2024-08-09 18:56:55'),
('1951608237406a2b462d4651f6da1de2549e34892e69683979ab4e224b72378002aa1c3a98a2bca4', 6, 5, '64cd6e5964202', '[\"showroom\"]', 0, '2023-08-05 00:32:09', '2023-08-05 00:32:09', '2024-08-05 00:32:09'),
('197e9273e7af82fe87f4f26ea1686b540c62c9c81d59460ea6225ba2cfdbaa0795b0d7e1f4843078', 12, 5, '64cb8fc8d2454', '[\"user\"]', 0, '2023-08-03 14:30:16', '2023-08-03 14:30:16', '2024-08-03 14:30:16'),
('1a450229ff32fc3cefbb2f35797a9c9d6a4277a5fe90e17548518260a005479e146a7bb1af95ff2d', 10, 5, '65099212247f1', '[\"showroom\"]', 0, '2023-09-19 15:20:34', '2023-09-19 15:20:34', '2024-09-19 15:20:34'),
('1b8cc3cea4ee25d8bc9fe6bb8598e8871bb1172d8d6a648d2d9fc8dded85b89f215b883e5efebd0d', 27, 5, '64f6e7471955f', '[\"user\"]', 0, '2023-09-05 11:31:03', '2023-09-05 11:31:03', '2024-09-05 11:31:03'),
('1cadaace038a9a2c7089e332cb2bfd91cfd959d37e00abce73f2a700e4590747050d03f6b37eca97', 10, 5, '64f429b612016', '[\"showroom\"]', 0, '2023-09-03 09:37:42', '2023-09-03 09:37:42', '2024-09-03 09:37:42'),
('1ce7b838aedbc6ef45b7f99f8139b3d69ad92274fd068fae3b6129df98016736720ac8d80b2b38ed', 35, 5, '64fe238868f07', '[\"user\"]', 0, '2023-09-10 23:14:00', '2023-09-10 23:14:00', '2024-09-10 23:14:00'),
('1d73bedd3fa6945714b1fd7d3b8147a32aba51a13440a8a9517c18fae551269a5bbf671167b223f6', 41, 5, '6500183ebdd86', '[\"user\"]', 0, '2023-09-12 10:50:22', '2023-09-12 10:50:22', '2024-09-12 10:50:22'),
('1edd600b9ac46df93c91ea4b3fcdf4e9b2bfa6b6573cc88232e8e7af235c7736e834790ef7ebfc55', 29, 5, '650a70a0a463d', '[\"user\"]', 0, '2023-09-20 07:10:08', '2023-09-20 07:10:08', '2024-09-20 07:10:08'),
('20d276c86ae3daa761dd99a85504abf3aabab28fa33d4b5af4d2d0919353e4f1cd9eb58b66ddc397', 12, 5, '64cb717245b6d', '[\"user\"]', 0, '2023-08-03 12:20:50', '2023-08-03 12:20:50', '2024-08-03 12:20:50'),
('2152fa716f80671c805cbb7ed2cdb2a93dd1671b09eeb48f793039b2fc1556bcc573be6cfc61da12', 13, 5, '64d3c021ab691', '[\"user\"]', 0, '2023-08-09 19:34:41', '2023-08-09 19:34:41', '2024-08-09 19:34:41'),
('21e5e21efb2aec77782ac9ac8b98d4fe61f2f5995cecf22c386c7a8e5ab47bf8a8d20fa6c668c7c4', 12, 5, '64ecbe0ac652b', '[\"user\"]', 0, '2023-08-28 18:32:26', '2023-08-28 18:32:26', '2024-08-28 18:32:26'),
('21ec4f89baf44c373337c76b03b9c35e02a41319109ed61bd9e4f0378d5f33250bc2f79efffff206', 11, 5, '64eda795d4c41', '[]', 0, '2023-08-29 11:08:53', '2023-08-29 11:08:53', '2024-08-29 11:08:53'),
('221021a27d3725787a2ba6bcce7009255e5ee29e68253f1c5945b0dba058b83bdebd5ac6178205f7', 11, 5, '64db8b42805c2', '[]', 0, '2023-08-15 17:27:14', '2023-08-15 17:27:14', '2024-08-15 17:27:14'),
('226a146881d52e75614f061cef5650ba7eb34cebb81138e45d62de4d21457d1b70d118522766b119', 5, 5, '64cb939d754ee', '[\"showroom\"]', 0, '2023-08-03 14:46:37', '2023-08-03 14:46:37', '2024-08-03 14:46:37'),
('230aecff0b86f826267c48aee5e429d4c7576c45b4d168520e035327394eb703fcfd53410825da3f', 11, 5, '64dbe87d42835', '[]', 0, '2023-08-16 00:05:01', '2023-08-16 00:05:01', '2024-08-16 00:05:01'),
('237942bb9fbc53d9134c7e1d3b784124265184cedc72af87e6dd99da75ee404a03218d2deb02328d', 22, 5, '64f4d1d5eabab', '[\"user\"]', 0, '2023-09-03 21:35:02', '2023-09-03 21:35:02', '2024-09-03 21:35:02'),
('23c2fef56933135a12166c0ea5985185786b1482a22f0eedf138178c80b8d0f1a8a6504c5ac4b151', 43, 5, '650052fe89728', '[\"user\"]', 0, '2023-09-12 15:01:02', '2023-09-12 15:01:02', '2024-09-12 15:01:02'),
('24242d2816a8d70a906782cecdd03aa857cae158a8d1b281e3cf737da56fe4c353b056bdb854bcba', 1, 5, '64c8b709a1939', '[\"showroom\"]', 0, '2023-08-01 10:40:57', '2023-08-01 10:40:57', '2024-08-01 10:40:57'),
('2478536a00eebcc1449055d770e3eef9c0ac15e81a580e215773224e5f251175cbf1f098677da9b2', 9, 5, '64d8af7de9d22', '[\"showroom\"]', 0, '2023-08-13 13:25:01', '2023-08-13 13:25:02', '2024-08-13 13:25:01'),
('25dc243eb3091aefac00ec17c24b0a77373c6a7da96a738400604133b2a6deb4d4b0e525732c6426', 11, 5, '64da437cdd8b1', '[]', 0, '2023-08-14 18:08:44', '2023-08-14 18:08:44', '2024-08-14 18:08:44'),
('26870d21ee55cdc2df12a326e197be4d086a6cba78def3d2b783c54a47e0a2e56b17da88d9c85551', 10, 5, '64c8b027bb9c6', '[\"user\"]', 0, '2023-08-01 10:11:35', '2023-08-01 10:11:35', '2024-08-01 10:11:35'),
('26e57839c92f854380437d5d3f7b38faf4a4d3fe7aecab99cae1c3591c1ac08cd7203759b00b9c95', 10, 5, '64f83eb775e93', '[\"showroom\"]', 0, '2023-09-06 11:56:23', '2023-09-06 11:56:24', '2024-09-06 11:56:23'),
('2717cc3ebfe4374a61ca4b83a1a8012a45ed04c90d885873723f6db8fc0248cad694d35b138314b8', 9, 5, '64d479c376c41', '[]', 0, '2023-08-10 08:46:43', '2023-08-10 08:46:43', '2024-08-10 08:46:43'),
('28670c958ddedf6aef218a4787123ca2738461b7c0ebc275970f73420fe34a1e5980a65e705fe641', 3, 5, '64c9fb878112a', '[\"user\"]', 0, '2023-08-02 09:45:27', '2023-08-02 09:45:27', '2024-08-02 09:45:27'),
('28d2b3921712e84feba2df83f7fce46ff7bfe1c65cc6252bf43f1f8bdb92e2891d3ea2a3a3379551', 8, 5, '64d478fb3f87f', '[]', 0, '2023-08-10 08:43:23', '2023-08-10 08:43:23', '2024-08-10 08:43:23'),
('292991e5304a97eaca037ac412b0a83144a181691c26365d16db0e17ab71cc774461b44d932b7579', 29, 5, '64fd8a95da591', '[\"user\"]', 0, '2023-09-10 12:21:25', '2023-09-10 12:21:25', '2024-09-10 12:21:25'),
('2953b4449eee57963ff25a88443345b2aab3999bf09676b0293eb4272d9d700eb8d2b03ff81a1012', 22, 5, '64f7029fb35a0', '[\"user\"]', 0, '2023-09-05 13:27:43', '2023-09-05 13:27:43', '2024-09-05 13:27:43'),
('298a427806236047e183a807fb580e42b4d6bb468e111c24e9964c697f464eb6b26aad4e04d2e3dd', 6, 5, '64cc20a532cf2', '[\"showroom\"]', 0, '2023-08-04 00:48:21', '2023-08-04 00:48:21', '2024-08-04 00:48:21'),
('29bd2f8e9accd14b636c87f8548ff2cdf6914602fc59501558d3fc3fe4b648a4cb82aba69b4e85a5', 10, 5, '64f58b36a3d64', '[\"showroom\"]', 0, '2023-09-04 10:45:58', '2023-09-04 10:45:58', '2024-09-04 10:45:58'),
('2a6b61057e1e3049c75bc9c799c02a6cb75a40481dc4af5b1fef41fc2e0c21c4427d33092ad2642c', 14, 5, '64d4daa88ac82', '[\"user\"]', 0, '2023-08-10 15:40:08', '2023-08-10 15:40:08', '2024-08-10 15:40:08'),
('2abac539a530cb93dca822a1f279846c43b90ff081dcbc5f207aa420a84332a3712e9fdd044bff8f', 11, 5, '64eee69802d9d', '[\"showroom\"]', 0, '2023-08-30 09:50:00', '2023-08-30 09:50:00', '2024-08-30 09:50:00'),
('2beeafb89b34ae5afeeac5bc482fbdb69a5a79360f36f5187f18d93cf96533c0fac0c688bcd3c21c', 8, 5, '64d50eb915abe', '[\"showroom\"]', 0, '2023-08-10 19:22:17', '2023-08-10 19:22:17', '2024-08-10 19:22:17'),
('2f1509b358e95ef38b580788e70dad5f2649d8c42b4f7df1b179edd99ad4e6030ce29a35b4af8d70', 9, 5, '64d3420e2e1c9', '[]', 0, '2023-08-09 10:36:46', '2023-08-09 10:36:46', '2024-08-09 10:36:46'),
('2f227daebb9363122655dc1c7be15ffb99dd19dafe54fe41ee82df4c7101ff74030e245a1720e60a', 39, 5, '64ff3bbe3ebe5', '[\"user\"]', 0, '2023-09-11 19:09:34', '2023-09-11 19:09:34', '2024-09-11 19:09:34'),
('305a432c63257a086a0bd2b4f6448122213d464ea9204d2d4b30bb43f81501cc8e68b2acb2f0789a', 12, 5, '64c8cdeded5c4', '[\"user\"]', 0, '2023-08-01 12:18:37', '2023-08-01 12:18:38', '2024-08-01 12:18:37'),
('30685b4eafdeacb4c7376f70fa8dccbbcd3ecde1ad02a208074d30ee347b57892be51c08fb8d7dc6', 32, 5, '64fc4c896518f', '[\"user\"]', 0, '2023-09-09 13:44:25', '2023-09-09 13:44:25', '2024-09-09 13:44:25'),
('309fe1d0fb51ed090efe2fbff861dd069010fec27b92b102ba88bc97c3b0ab1bb99372d99f2f14e6', 10, 5, '64f6e98b5de89', '[\"showroom\"]', 0, '2023-09-05 11:40:43', '2023-09-05 11:40:43', '2024-09-05 11:40:43'),
('30abab122e6230a931b230685a8af0b5c998e4f974ab04344460d4b6394adc551ce268130bdc42e6', 11, 5, '64e77fc8b5779', '[\"showroom\"]', 0, '2023-08-24 19:05:28', '2023-08-24 19:05:28', '2024-08-24 19:05:28'),
('30c0edb73af3d089d7f129910916892b4165ed57937249ba0c242fea51d6784c422804e1d3b239d3', 12, 5, '64cb716082a6a', '[\"user\"]', 0, '2023-08-03 12:20:32', '2023-08-03 12:20:32', '2024-08-03 12:20:32'),
('30e9313a4b4c5d37fa3d938e8da4061c06f2b9c6847e3c250440d30d2fb5d151a2e420a1816c37fc', 12, 5, '64cb71ec491cc', '[\"user\"]', 0, '2023-08-03 12:22:52', '2023-08-03 12:22:52', '2024-08-03 12:22:52'),
('3177bf1c9ad159b616c9aa1f467c00f4527b215b2a082f14902eaa8a514475df7458afc3a0c0dbdf', 29, 5, '64f97a9407268', '[\"user\"]', 0, '2023-09-07 10:24:04', '2023-09-07 10:24:04', '2024-09-07 10:24:04'),
('31e889711225a5a0ff6b6690b1cf048ed2d89be26473c1e460a6d574679408962d3f904b83fde462', 44, 5, '65005675f1460', '[\"user\"]', 0, '2023-09-12 15:15:50', '2023-09-12 15:15:50', '2024-09-12 15:15:50'),
('31f31bf75d85d645f5279250dad2a46f82668abe3fceedfa55a750ca1af4ced334b0d0f239c4d618', 13, 5, '64f986348eb4a', '[\"user\"]', 0, '2023-09-07 11:13:40', '2023-09-07 11:13:40', '2024-09-07 11:13:40'),
('320a8b9df9a0498b8b48db5be262750b6aaaa44564822314d4dfad3a5c54fe00db5809c224110bc2', 49, 5, '6509aa4ab7205', '[\"user\"]', 0, '2023-09-19 17:03:54', '2023-09-19 17:03:54', '2024-09-19 17:03:54'),
('320d426770e23af088c39aa86057f4f6b15a9ed53728accf83e810c9b1d1a7e9657d3e094ff4e06a', 33, 5, '64fd940d334ca', '[\"user\"]', 0, '2023-09-10 13:01:49', '2023-09-10 13:01:49', '2024-09-10 13:01:49'),
('32f9731f6aa898220def679dd86f6be1b05ff6f051928c6da36d6e50569b49562af4072a282acd0c', 13, 5, '64ef528e0205a', '[\"user\"]', 0, '2023-08-30 17:30:38', '2023-08-30 17:30:38', '2024-08-30 17:30:38'),
('331af050ecac4f02d44457b001c81a2d0356d3e4b968cde9d6767f8dacbc3631808518240fbf62e7', 12, 5, '64cb72e0276ab', '[\"user\"]', 0, '2023-08-03 12:26:56', '2023-08-03 12:26:56', '2024-08-03 12:26:56'),
('332702bdbefef335174c8d01d87a63734312b84b1a4a5d6ccdfdfcae0e75c77bc0bb1c8c9eebedad', 22, 5, '64f040c326703', '[\"user\"]', 0, '2023-08-31 10:26:59', '2023-08-31 10:26:59', '2024-08-31 10:26:59'),
('37cd66852a420b79b04f6752136118cf2c9bee3c509253ba6f1062e20b6f7ac43c4a42ea6a5af0ff', 11, 5, '64eeea0112f2b', '[\"showroom\"]', 0, '2023-08-30 10:04:33', '2023-08-30 10:04:33', '2024-08-30 10:04:33'),
('386411b97e38a28843b253648dfa084499dfb422cfd233677d9c9d7f0b14fd877b0e2487feb86cfa', 13, 5, '64ef4e66a4767', '[\"user\"]', 0, '2023-08-30 17:12:54', '2023-08-30 17:12:54', '2024-08-30 17:12:54'),
('3864355f0c22b228de7334530e5c059129f31b1ccb7110d4b687bfc9e7daf4aefdf03cdde9a0e9d2', 29, 5, '64fdb20445734', '[\"user\"]', 0, '2023-09-10 15:09:40', '2023-09-10 15:09:40', '2024-09-10 15:09:40'),
('3a3744cb23de35096c593253b063b79d7f4f25a11a539ba22fee495f359982c36f2ff6d097078dbe', 14, 5, '6509b89086cb5', '[\"showroom\"]', 0, '2023-09-19 18:04:48', '2023-09-19 18:04:48', '2024-09-19 18:04:48'),
('3a87395f130639e8e25ffa562edf4ae76b5ee3c085893986a9b90f323ba16b66f50066b3f2c58908', 8, 5, '64d4b4d0be6d1', '[\"showroom\"]', 0, '2023-08-10 12:58:40', '2023-08-10 12:58:40', '2024-08-10 12:58:40'),
('3a8bebd45690478d6f9e5ba95ea57a4c9e47bee0021aa26d35f80e08cae59eef86b5e462b2087cf3', 12, 5, '64dcc49b79fbd', '[\"user\"]', 0, '2023-08-16 15:44:11', '2023-08-16 15:44:11', '2024-08-16 15:44:11'),
('3ac39fb8dc6e655136f1fbf9356b1b0f764f69bcf138ced42abaf27288b47150a7a2e1b9a22b6378', 9, 5, '64d2518dec64a', '[]', 0, '2023-08-08 17:30:37', '2023-08-08 17:30:38', '2024-08-08 17:30:37'),
('3b90cb541c5c13e85d3f1def0f4b1a5fb4242fda4ed4107b716ae663a9bfe9760f4c872ccaaac353', 12, 5, '64f48de3d6cfe', '[\"user\"]', 0, '2023-09-03 16:45:07', '2023-09-03 16:45:07', '2024-09-03 16:45:07'),
('3bc934244b7a4483491230e4dd46125698f1a3c9dc205de42fb7de5d701882d772ee812ef537c166', 14, 5, '650832c4d2603', '[\"showroom\"]', 0, '2023-09-18 14:21:40', '2023-09-18 14:21:40', '2024-09-18 14:21:40'),
('3bedf569a418b7b31d934bb7bfe793f2fec62f1c82c95a70270d3462da4e37fc42e43d91e9c719f1', 12, 5, '64cb716a4cc02', '[\"user\"]', 0, '2023-08-03 12:20:42', '2023-08-03 12:20:42', '2024-08-03 12:20:42'),
('3c13cb5503b559569f29afa2526d4448e8a90ad57dd071e8b82bc83e9614f4b6fa15ce64e51d5243', 13, 5, '64f5cbc9d9bed', '[\"user\"]', 0, '2023-09-04 15:21:29', '2023-09-04 15:21:29', '2024-09-04 15:21:29'),
('3c29bd069ee1a0f30542c1b16bcccea4e7f2c0d0a77a05eb51f9b6c56dce096de17274e2ea389e90', 10, 5, '64f97ec0e6ad6', '[\"showroom\"]', 0, '2023-09-07 10:41:52', '2023-09-07 10:41:52', '2024-09-07 10:41:52'),
('3c99bd0213b7599404ac2ac529014d308db66ac0f2ce9fe9b92b654f12ed90a16c6ae49950e6c87a', 10, 5, '64f5de837ae84', '[\"showroom\"]', 0, '2023-09-04 16:41:23', '2023-09-04 16:41:23', '2024-09-04 16:41:23'),
('3e00f87f31af3cc07c5448b5d830cd7b85bb95cf6a2a8c075eaa7061597c3255f2b466cceb717cf6', 12, 5, '64eca7fcaddfc', '[\"user\"]', 0, '2023-08-28 16:58:20', '2023-08-28 16:58:20', '2024-08-28 16:58:20'),
('3f2ce92e50921ce9676203dfd914d30a10ba09f0ea6fae180a3be964beb35e8707b68489b3548c8f', 1, 5, '64c8f28f40d3b', '[\"showroom\"]', 0, '2023-08-01 14:54:55', '2023-08-01 14:54:55', '2024-08-01 14:54:55'),
('3f82627022a5ab2d675bb970edabc96da94a3713d16695eb672f08940da0ff24b7e8b7774673b66e', 1, 5, '64c840d92aab4', '[\"showroom\"]', 0, '2023-08-01 02:16:41', '2023-08-01 02:16:41', '2024-08-01 02:16:41'),
('407b40f976d89011ad88e88ea08a552d9ced10de0fda368aac3f19e4629fe58041b6f7cb6feae374', 13, 5, '64cdef470a9f8', '[\"user\"]', 0, '2023-08-05 09:42:15', '2023-08-05 09:42:15', '2024-08-05 09:42:15'),
('407e6e5c953d89ff2bb9295c06491aa2b44a3a698ae729ca2166f68ce6900ffb06da0b88fc838d28', 10, 5, '64e76276d6878', '[]', 0, '2023-08-24 17:00:22', '2023-08-24 17:00:22', '2024-08-24 17:00:22'),
('40c4e2ca589f36e7a096777f9618dbbe85119b29c63b5051f94088557586b3c6c5003f698d1978b2', 10, 5, '64f42d8f5f663', '[\"showroom\"]', 0, '2023-09-03 09:54:07', '2023-09-03 09:54:07', '2024-09-03 09:54:07'),
('40e99eb3353cc57df3464cfff57eb3f01e174d88cd41ca57985de53a1eef51a562c00d4ebe57e806', 7, 5, '64cf8039977e9', '[]', 0, '2023-08-06 14:12:57', '2023-08-06 14:12:57', '2024-08-06 14:12:57'),
('42901920ec04387bfc790c68f21d54b8b0abadd3f56feecb1b45a5421cbf61739b363110b7311959', 1, 5, '64c8f28f37970', '[]', 0, '2023-08-01 14:54:55', '2023-08-01 14:54:55', '2024-08-01 14:54:55'),
('43242f2e3fd89dea8487306a18e81ffb04a89f6fbac0b051d03ce82bcc97733eb080c11dfcd883d4', 22, 5, '64edf2599150a', '[\"user\"]', 0, '2023-08-29 16:27:53', '2023-08-29 16:27:53', '2024-08-29 16:27:53'),
('432f75a010ac37e70fd53a230bbaf3d98b5bd42852a2e5c5f873fe9d897def81ca25112bbfa53139', 36, 5, '64fe2b34b4153', '[\"user\"]', 0, '2023-09-10 23:46:44', '2023-09-10 23:46:44', '2024-09-10 23:46:44'),
('434d27e8290ad88b02e833309adb92097b0da7313664382f65b3ead431f83b2c702f8f2a59de9b80', 8, 5, '64cd2f464fb55', '[]', 0, '2023-08-04 20:03:02', '2023-08-04 20:03:02', '2024-08-04 20:03:02'),
('435060af14d2d518d19628c7a450483dd89c135f06a884db5c7f3e63467ae044ced5d1938686aff7', 49, 5, '65099dd3dbbb4', '[\"user\"]', 0, '2023-09-19 16:10:43', '2023-09-19 16:10:43', '2024-09-19 16:10:43'),
('43aafca328c6586b7c0376266227ce74cccd15313e31926d008f1e8b235d897c6b5b37f97e09e6a9', 45, 5, '65005d916c729', '[\"user\"]', 0, '2023-09-12 15:46:09', '2023-09-12 15:46:09', '2024-09-12 15:46:09'),
('4428524f4c1b94613883bcc5ed6aa15cd05e96c816c046c442c0b22247b0c7b76650131310cf58ff', 13, 5, '64f48e898354f', '[\"user\"]', 0, '2023-09-03 16:47:53', '2023-09-03 16:47:53', '2024-09-03 16:47:53'),
('443c0f7c84565a750fe56a3fc099930d3b06bd9732ef5441ef076ba74ab3ea1305c56a6abb119957', 8, 5, '64d48409d1d33', '[]', 0, '2023-08-10 09:30:33', '2023-08-10 09:30:33', '2024-08-10 09:30:33'),
('44df512091208ac15610c8a7e885e9db5e4bed5a1dd3e2ddcda491c5c091245e90fd9e401a7c78fc', 9, 5, '64d479c3858a6', '[\"showroom\"]', 0, '2023-08-10 08:46:43', '2023-08-10 08:46:43', '2024-08-10 08:46:43'),
('47cef761e628234e1f122661cfd29bea236a53a300e59969cd01f1128fb724f2a0515cb0f305bd36', 11, 5, '64d8aac09fb0a', '[\"showroom\"]', 0, '2023-08-13 13:04:48', '2023-08-13 13:04:48', '2024-08-13 13:04:48'),
('482a090804672d71e60cd67c830d4624d11f88e67db2d66882aa476bb5629ffcfb349ff58addef23', 11, 5, '64db8b428dfbd', '[\"showroom\"]', 0, '2023-08-15 17:27:14', '2023-08-15 17:27:14', '2024-08-15 17:27:14'),
('49114e3ba6d4b7ab1dead1b70b7ec6cbe935b41a006525f5d8683860ea2473fc37bfc203c60a4517', 34, 5, '64fe1d706c173', '[\"user\"]', 0, '2023-09-10 22:48:00', '2023-09-10 22:48:00', '2024-09-10 22:48:00'),
('499e6d93eff561131438307f0848db3c34d941531b878383373da998a025355340175296ebd8283c', 27, 5, '64f744a08f9ae', '[\"user\"]', 0, '2023-09-05 18:09:20', '2023-09-05 18:09:20', '2024-09-05 18:09:20'),
('4c39cc76c63030d1dec1218bce507e38e6212440f7781ec05c0720f398d9818fbb5d5602a9f56df4', 9, 5, '64d8af7dcaefb', '[]', 0, '2023-08-13 13:25:01', '2023-08-13 13:25:01', '2024-08-13 13:25:01'),
('4ce2bfa99bb74bc94ccbdfed669ae167a8980d9dcbe342e308a70da32c0c5c4b1136cd2673fc7db7', 5, 5, '64cbac9b3dde3', '[\"showroom\"]', 0, '2023-08-03 16:33:15', '2023-08-03 16:33:15', '2024-08-03 16:33:15'),
('4d5967cce9477942419a8d23dca91351d69855e100a9558c42985ca04dd84a4d4b7ca7b6175af051', 29, 5, '64fe30ac4b073', '[\"user\"]', 0, '2023-09-11 00:10:04', '2023-09-11 00:10:04', '2024-09-11 00:10:04'),
('4defb54193a7c4a016be0e8095bb29b0f022f0cbc04f31441924ccb2cb8cd602f2e419727c1626e9', 10, 5, '64f70455b4fec', '[\"showroom\"]', 0, '2023-09-05 13:35:01', '2023-09-05 13:35:01', '2024-09-05 13:35:01'),
('4ecb5acd3f43468146718858ca543019495ed2e34b232ef0ff0dde0886313be437eb6198c11b2158', 15, 5, '64d4e310b5ff8', '[\"user\"]', 0, '2023-08-10 16:16:00', '2023-08-10 16:16:00', '2024-08-10 16:16:00'),
('4f8558c6f8f0894e105869604b270f345504830fe673d1c0c7bc3c08b12b5e204ed67663f40f04bb', 11, 5, '64d9e307c3e7a', '[\"showroom\"]', 0, '2023-08-14 11:17:11', '2023-08-14 11:17:11', '2024-08-14 11:17:11'),
('4fb64c0efb96bb03cd90b70c46a1de132e78adb59629829a087108743853dacc3eb42bbe48eb30f1', 10, 5, '64f020d802bac', '[]', 0, '2023-08-31 08:10:48', '2023-08-31 08:10:48', '2024-08-31 08:10:48'),
('50be3803df4ce8be40d151bfd4d1eeb8bfae155391863a95c5143a243e6438c88f9d8ed9ec978388', 10, 5, '64dcc470bd2c2', '[\"showroom\"]', 0, '2023-08-16 15:43:28', '2023-08-16 15:43:28', '2024-08-16 15:43:28'),
('523477faad9e2f34005bde707ed3e6d8baf8f7b279a33916171440006a4448ea1e7fa8b57ab69894', 6, 5, '64d478bf4578f', '[\"showroom\"]', 0, '2023-08-10 08:42:23', '2023-08-10 08:42:23', '2024-08-10 08:42:23'),
('53f44e48413c988a46d6c8dc429974b19f3f109088fc389dd883d37a61ce6201823a3a01e0d46531', 29, 5, '65082171673ed', '[\"user\"]', 0, '2023-09-18 13:07:45', '2023-09-18 13:07:45', '2024-09-18 13:07:45'),
('5443d33487d924bd27088be8bac387f9e1e59fa02490b6c25940fd2b44cd7e230dbd257b93d4d01b', 10, 5, '64fded7a12b3c', '[\"showroom\"]', 0, '2023-09-10 19:23:22', '2023-09-10 19:23:22', '2024-09-10 19:23:22'),
('54842b54a83bacdc650b38c27855aeecbc6c5465cd691f49fb0bd841c7801f33f5aa5f93739ca0c4', 29, 5, '6508278159ed5', '[\"user\"]', 0, '2023-09-18 13:33:37', '2023-09-18 13:33:37', '2024-09-18 13:33:37'),
('5488b5f33121e0498c141b66130c849747c29be5fcf54903af4dd1ff0f5ca7564a90116e13600937', 12, 5, '64ca0089e80ba', '[\"user\"]', 0, '2023-08-02 10:06:49', '2023-08-02 10:06:49', '2024-08-02 10:06:49'),
('549243f4143c4066f566975c2da3a49d2c66bc5795ae225160c929819b28b86a664337fdde468103', 12, 5, '64cf72816725e', '[\"user\"]', 0, '2023-08-06 13:14:25', '2023-08-06 13:14:25', '2024-08-06 13:14:25'),
('54aa69155a48a89db0a335c6746361103fa2ffd000a99f4b4de4127312bd2b79748c11e8bb0c4de9', 8, 5, '64d48409de93c', '[\"showroom\"]', 0, '2023-08-10 09:30:33', '2023-08-10 09:30:33', '2024-08-10 09:30:33'),
('55e31fdbb37073cd702abf6d165627b232a6648a2dfb1f9213e32c0c1dda42d181ef52d1b08e96fb', 1, 5, '64cb6e2987378', '[\"showroom\"]', 0, '2023-08-03 12:06:49', '2023-08-03 12:06:49', '2024-08-03 12:06:49'),
('57098c9e6dfd194a5c63431c6ea23a3298c91d7198bda9f42ab0505a2cd29ff8f806bbf84da33c2d', 10, 5, '64d8a36c6ea93', '[]', 0, '2023-08-13 12:33:32', '2023-08-13 12:33:32', '2024-08-13 12:33:32'),
('59331ea02cbceb501e94029f14874b44e24be1870e092bc05c5569723055e4c980e3cd6f0b3def60', 3, 5, '64c84111576a7', '[\"showroom\"]', 0, '2023-08-01 02:17:37', '2023-08-01 02:17:37', '2024-08-01 02:17:37'),
('5af93a16e9f88b9414d67cda9db00edd18c4603923b55e2ce1010793ae909a75b2f4e6879febcbcd', 9, 5, '64d4d8545b793', '[\"showroom\"]', 0, '2023-08-10 15:30:12', '2023-08-10 15:30:12', '2024-08-10 15:30:12'),
('5b49724613826c45a1971ec0bff20b95804e8f5d0ed9fd159551df9b7c7cb440daa13f815b53acb2', 22, 5, '64f096bce7d28', '[\"user\"]', 0, '2023-08-31 16:33:48', '2023-08-31 16:33:49', '2024-08-31 16:33:48'),
('5b638f06c46196901c9e2c8c28d3a9465ee87d4265d88b500345ad33031ab24800dd2233afdac435', 6, 5, '64cbae6c13a07', '[\"showroom\"]', 0, '2023-08-03 16:41:00', '2023-08-03 16:41:00', '2024-08-03 16:41:00'),
('5b921e2b61cd5615d08860e4256d111f79dc7dd528ceeb50440f1b85418472f1f791df38d81988d6', 22, 5, '64f7032a02de6', '[\"user\"]', 0, '2023-09-05 13:30:02', '2023-09-05 13:30:02', '2024-09-05 13:30:02'),
('5be2e6424dca46a366befeac49efd1ef8ac3225c021b0c90f92909e400abeb1915fd4a5f0e47c5ec', 12, 5, '64e732933dfe1', '[\"user\"]', 0, '2023-08-24 13:36:03', '2023-08-24 13:36:03', '2024-08-24 13:36:03'),
('5be6cc042efd14ff47c5cf9a7bb7e0c0dafc4485ef023d04be2748ea662bc7df7247a2187d116d7e', 5, 5, '64cba97c7da3d', '[\"showroom\"]', 0, '2023-08-03 16:19:56', '2023-08-03 16:19:56', '2024-08-03 16:19:56'),
('5df279eafea8da1f0d29f42474d369fdde7dc13d8ae74f07a4f98ce546aa0951e9303d60f95ad66c', 13, 5, '64ef6503ce3c4', '[\"user\"]', 0, '2023-08-30 18:49:23', '2023-08-30 18:49:23', '2024-08-30 18:49:23'),
('5e011e6fb8f892ca1feac9345393f5c00786316bba6af5c5382c1aba4d3b20992d457bc26a3d7e73', 11, 5, '64db31a4db5d3', '[\"showroom\"]', 0, '2023-08-15 11:04:52', '2023-08-15 11:04:52', '2024-08-15 11:04:52'),
('5e4f212336064995e345abf5b69cc5de810108828c9ac1ca265cbb1ac2d9e92c2e4407c3a5d0ba76', 22, 5, '64f0bcb2b9a45', '[\"user\"]', 0, '2023-08-31 19:15:46', '2023-08-31 19:15:46', '2024-08-31 19:15:46'),
('5f55fd47200a49c66e58690498a8c54d379234a3fc4120b84e52769762c64cce9b232e2661cb83ab', 13, 5, '64eda85653067', '[\"user\"]', 0, '2023-08-29 11:12:06', '2023-08-29 11:12:06', '2024-08-29 11:12:06'),
('607b882f3314f2507b08e37a60152ebae7530a347008227a5f07439155cfef02bf7e41bd75a57352', 12, 5, '64ca4f111563e', '[\"user\"]', 0, '2023-08-02 15:41:53', '2023-08-02 15:41:53', '2024-08-02 15:41:53'),
('62a285ed016882a07d4fb9989667fa9f6d25cb8c71becb9f5e7eaaa91e7b0eafa0f495c675244b34', 9, 5, '64d8d1cae1a53', '[]', 0, '2023-08-13 15:51:22', '2023-08-13 15:51:22', '2024-08-13 15:51:22'),
('66716157d201dc725601b990ff75adce84bae559b300f1f4d6cda8bfe07d4222287cd70119561a64', 14, 5, '650868c31f42b', '[\"showroom\"]', 0, '2023-09-18 18:12:03', '2023-09-18 18:12:03', '2024-09-18 18:12:03'),
('668bf063a9cc8df2e677299e4f42cedce8892d1ba0e7c2bac18d4e6c97b03532b6789c7c27063daf', 6, 5, '64cd6e5958573', '[]', 0, '2023-08-05 00:32:09', '2023-08-05 00:32:09', '2024-08-05 00:32:09'),
('671a69be81155d7bbd27e51ebbb4647cf6a0654c10a719ed7e3b6ffdd3b3e469fa05faa2b8d57559', 13, 5, '64ed95cfcd52b', '[\"user\"]', 0, '2023-08-29 09:53:03', '2023-08-29 09:53:03', '2024-08-29 09:53:03'),
('673aaa30359f667ba544b3962909f232262b85cc81d3dab2cb012f8c3c7bc4b2574996e6412caa9c', 7, 5, '64cc200240402', '[\"showroom\"]', 0, '2023-08-04 00:45:38', '2023-08-04 00:45:38', '2024-08-04 00:45:38'),
('67f47ddeaa0238e1b13e1edb991729ae068b98af56d13310085c4baf5732369e8f03df91e9fb0e82', 22, 5, '64f4cdcd61390', '[\"user\"]', 0, '2023-09-03 21:17:49', '2023-09-03 21:17:49', '2024-09-03 21:17:49'),
('6816e5dd8563331f9b432854cde9e09e713ec7935cecb508d2f8ece96ecd3395cd03f14befd2652b', 14, 5, '65095e3e25c33', '[\"showroom\"]', 0, '2023-09-19 11:39:26', '2023-09-19 11:39:26', '2024-09-19 11:39:26'),
('6871085fae8146c078357079a6cce0a735abaeed0682986b30df2ae82cc9f8e39164c54e1dda1e7f', 23, 5, '64ef547cf2a50', '[\"user\"]', 0, '2023-08-30 17:38:53', '2023-08-30 17:38:53', '2024-08-30 17:38:53'),
('688aa9209fc22d8427ce42e6ba4af97485b5e1f80736657303ed531b2b54e64568b42a71abfb712e', 11, 5, '64f059306bf70', '[]', 0, '2023-08-31 12:11:12', '2023-08-31 12:11:12', '2024-08-31 12:11:12'),
('689651eb901515b1d9913b3c2d5077b60bee443612d547dc9fa8b8491bb43b91740569b6b809d826', 11, 5, '650ae30414eec', '[\"showroom\"]', 0, '2023-09-20 15:18:12', '2023-09-20 15:18:12', '2024-09-20 15:18:12'),
('68b95ea6a67a108600302d0c0f7ac89dfc06351e6f869efdf33b7e545391bf19c6f2b63d3eecfdb7', 22, 5, '64eee1b84b94b', '[\"user\"]', 0, '2023-08-30 09:29:12', '2023-08-30 09:29:12', '2024-08-30 09:29:12'),
('6939d5ef422bf0040f0ea300dd19431bd7ab6968b222d94b843dcdabe7755329b6d359cbbe1f44eb', 11, 5, '64da433782fb6', '[\"showroom\"]', 0, '2023-08-14 18:07:35', '2023-08-14 18:07:35', '2024-08-14 18:07:35'),
('6963ea548ffceeb9336983811dc89c551033058263139e5a862b25246c71465796f0a844453f6eb5', 5, 5, '64cb97b4b26f7', '[\"showroom\"]', 0, '2023-08-03 15:04:04', '2023-08-03 15:04:04', '2024-08-03 15:04:04'),
('6a75b4a57e6540b1e60c2789743c7514cfe86e71eba3d50f93ef5849d43eb7d30970dd98a7fdfa21', 12, 5, '64cb96e402409', '[\"user\"]', 0, '2023-08-03 15:00:36', '2023-08-03 15:00:36', '2024-08-03 15:00:36'),
('6a989c33e57593a655dc0e97e707cd4d3c6a281e3e1ec47d4f51ec0d0984b269a5776859d57e6a20', 10, 5, '65017df716031', '[\"showroom\"]', 0, '2023-09-13 12:16:39', '2023-09-13 12:16:39', '2024-09-13 12:16:39'),
('6bbaaf73aea11cd5e212bf870a4553feb401cb824a11544301fe7d45737a970aff73f0f85d3964e1', 29, 5, '64f9877ab8659', '[\"user\"]', 0, '2023-09-07 11:19:06', '2023-09-07 11:19:06', '2024-09-07 11:19:06'),
('6bcad31e1c3d02fcb655215c59dda90df1af2f2e2e56319abb1b5819e831b42981a7ab81568d5986', 29, 5, '64f97e47d4e2f', '[\"user\"]', 0, '2023-09-07 10:39:51', '2023-09-07 10:39:51', '2024-09-07 10:39:51'),
('6c734de2079aeafb1ca764697fa6d7e9e417cb960bd506d1f848d2e239c3f6657a8ce2d2d946525f', 14, 5, '6508676b281bf', '[\"showroom\"]', 0, '2023-09-18 18:06:19', '2023-09-18 18:06:19', '2024-09-18 18:06:19'),
('6ca96dd38ba36d1801a79699c3c9aaa888a286070f091afd3dd47d7a84adb3ed8a52cfecb29a2b21', 8, 5, '64ccef510d166', '[\"showroom\"]', 0, '2023-08-04 15:30:09', '2023-08-04 15:30:09', '2024-08-04 15:30:09'),
('6fbfa8c011b19aca831b7b8bba557b86c405e354b365c3843a15f074d0a0d9529e37eba377e76e5e', 10, 5, '64f6fa9c930d2', '[\"showroom\"]', 0, '2023-09-05 12:53:32', '2023-09-05 12:53:32', '2024-09-05 12:53:32'),
('6fd13ded240923fb73f0847ee086d30e60970b764fb8a4709247919fada573e789044a76be7952fb', 1, 5, '64c8b70996cab', '[]', 0, '2023-08-01 10:40:57', '2023-08-01 10:40:57', '2024-08-01 10:40:57'),
('7021cdd42681c1d94a17dc3bf8bbff1e8e844799da71405e6d06adfe3fb861e109af55d0b15371a9', 10, 5, '64d8e9cb6db8a', '[]', 0, '2023-08-13 17:33:47', '2023-08-13 17:33:47', '2024-08-13 17:33:47'),
('708f35442cd4f416d8e6f5eb800a3f55cd90d80d39c56a1a93b71b6e75331ed58da21c3c3f9db178', 27, 5, '64f5f58b33ea4', '[\"user\"]', 0, '2023-09-04 18:19:39', '2023-09-04 18:19:39', '2024-09-04 18:19:39'),
('7113a59e141888b71e1c6267058a197760179a6b0703186b19fdfe284fa6ec6a8c41e012df83c703', 6, 5, '64d33f8238f33', '[\"showroom\"]', 0, '2023-08-09 10:25:54', '2023-08-09 10:25:54', '2024-08-09 10:25:54'),
('728d41d626f827ac13b84d6f70cb0dd4c7c6f233c9d8850b0fdc6a0f41579cc9b9e9d19f0a9396c5', 26, 5, '64f4ce5b7fe83', '[\"user\"]', 0, '2023-09-03 21:20:11', '2023-09-03 21:20:11', '2024-09-03 21:20:11'),
('73221d47bbee5479ead482105d277d82a9e94d7116d4ae5b4192c6655d4ba9fd4caaf055e6534138', 3, 5, '64c8cc8e48553', '[\"user\"]', 0, '2023-08-01 12:12:46', '2023-08-01 12:12:46', '2024-08-01 12:12:46'),
('736c7170ab57be41a3e929ccfb82cebf388d899d92a4f183650d111f002a5091c2a0fb48f4a9a3ce', 5, 5, '64cb9dadd2970', '[]', 0, '2023-08-03 15:29:33', '2023-08-03 15:29:33', '2024-08-03 15:29:33'),
('73ae18082277b5091525ec2aecf2f67438f728b444a537a607884c1744384ca0f87a790a2f7dbded', 9, 5, '64da2e6285a8f', '[\"showroom\"]', 0, '2023-08-14 16:38:42', '2023-08-14 16:38:42', '2024-08-14 16:38:42'),
('768e300257a4790c75df98ad629af76c585bf313885a421be937f041802fee17300d83b6c26603d7', 11, 5, '64dbe87d514bb', '[\"showroom\"]', 0, '2023-08-16 00:05:01', '2023-08-16 00:05:01', '2024-08-16 00:05:01'),
('7826811121ba4f829f9449c0c8f06a1e0e333cc858144407592b58d367c212f93049582ec0c52fd7', 12, 5, '64cc1db004bfa', '[\"user\"]', 0, '2023-08-04 00:35:44', '2023-08-04 00:35:44', '2024-08-04 00:35:44'),
('786c086257695778631ac486ec3d156a8d10a6cbb1bfb1a735d970730535b215fcfd765839d04bff', 7, 5, '64cbad6256949', '[\"showroom\"]', 0, '2023-08-03 16:36:34', '2023-08-03 16:36:34', '2024-08-03 16:36:34'),
('7917cf766279acdcb73203702519567134f59f8f88ed2b21ea312c8975ba8a442224a966e7a0f6b3', 22, 5, '64f48eac97070', '[\"user\"]', 0, '2023-09-03 16:48:28', '2023-09-03 16:48:28', '2024-09-03 16:48:28'),
('7919ac3ee500be1bc2f4afa0611fecd55dbe244f7ccec4b80d36c1938f7a491c1b3c339f2192e873', 10, 5, '64f5fb66b44a4', '[\"showroom\"]', 0, '2023-09-04 18:44:38', '2023-09-04 18:44:38', '2024-09-04 18:44:38'),
('79f7bba4a7ef7b7cb16acfa71c902af6b0138e173fe7315b657f8075707ac0c5b77c6b0618cce73e', 7, 5, '64cc1df11546c', '[\"showroom\"]', 0, '2023-08-04 00:36:49', '2023-08-04 00:36:49', '2024-08-04 00:36:49'),
('7ac978b70df4c0ccfdb1250d49a76ef3b445697628172cb50a45408ae77569b37b5db5a7ff849469', 12, 5, '64ecb450022a9', '[\"user\"]', 0, '2023-08-28 17:50:56', '2023-08-28 17:50:56', '2024-08-28 17:50:56'),
('7b2979cc74c36a4dc06bb7a0dffc4862711c9e1cd1db24bde001d2c1e79f7b68b822da5a741b8bd9', 13, 5, '64f0a0ce4d93d', '[\"user\"]', 0, '2023-08-31 17:16:46', '2023-08-31 17:16:46', '2024-08-31 17:16:46'),
('7b59d6f9e4515d6cea8eec2399e0a44afe89669ed5e3d2ac893bcfc9deae74f05e29ba2b470d0eba', 12, 5, '64eb3d871c3d6', '[\"user\"]', 0, '2023-08-27 15:11:51', '2023-08-27 15:11:51', '2024-08-27 15:11:51'),
('7c1914098ab8a96ba95a1966c92b5cd2a0224546b3fdaa1e34c2774da45ed44c8d6540e758ea0e3e', 12, 5, '64c8cda472c2d', '[\"user\"]', 0, '2023-08-01 12:17:24', '2023-08-01 12:17:24', '2024-08-01 12:17:24'),
('7ccad3f886e8dd4dfa06eac5d214aa430dfda0ddf9c4f18515f155e3652949301fb09b077c00303e', 6, 5, '64c8d7454fc96', '[\"user\"]', 0, '2023-08-01 12:58:29', '2023-08-01 12:58:29', '2024-08-01 12:58:29'),
('7d260668d8b70621a94381463145a8db6274a561a3d175466aeeb285fe52f580ea10281cf79fb867', 6, 5, '64cb9e627ecd4', '[]', 0, '2023-08-03 15:32:34', '2023-08-03 15:32:34', '2024-08-03 15:32:34'),
('7d2797c6a818030c8d1cf7c4ff4b6d2ae29f4c251233d77d96771041a5a712d75f227e966d31fb2f', 9, 5, '64d3b74735c66', '[]', 0, '2023-08-09 18:56:55', '2023-08-09 18:56:55', '2024-08-09 18:56:55'),
('7d68a784d60a12dfe19a7646fa4fcb9a1bdf41378a90e74038f5e51290059459f256f722a3de44b4', 7, 5, '64cb8cd1a937e', '[]', 0, '2023-08-03 14:17:37', '2023-08-03 14:17:37', '2024-08-03 14:17:37'),
('7fc52c068f5f589ddc3ce51eec2ca55cbdd08ef5c6f12a8c8bc38b7b65afb80b4b58616cf60e2691', 29, 5, '6507482e0a7de', '[\"user\"]', 0, '2023-09-17 21:40:46', '2023-09-17 21:40:46', '2024-09-17 21:40:46'),
('8055b98a3563ab8e6ee24f24273cb0f88f340bde6c4b823446fb18219243eb5f5ea90a95eab44563', 26, 5, '64f4ce35c7ab1', '[\"user\"]', 0, '2023-09-03 21:19:33', '2023-09-03 21:19:33', '2024-09-03 21:19:33'),
('80dd5d3b7dead375673fa9d5d6c1d591f450d7341b94a5c2df1ff06bb094b12baddeeecd36400d09', 12, 5, '64db1f28bb1e3', '[\"user\"]', 0, '2023-08-15 09:46:00', '2023-08-15 09:46:00', '2024-08-15 09:46:00'),
('821835a8e8ab0372756bfa5d66f4e1d0f69ffe15d899edf2bf1144f9252b5c1ad8f0e926df6ff9fd', 9, 5, '64d8d1caf16de', '[\"showroom\"]', 0, '2023-08-13 15:51:22', '2023-08-13 15:51:23', '2024-08-13 15:51:22'),
('83c301d2b076884341ba658ed9c3f05be58ffd5c35595bb6d9714a007ebf8e253f7bb3bbe82cf8bf', 13, 5, '64eda0d21fa75', '[]', 0, '2023-08-29 10:40:02', '2023-08-29 10:40:02', '2024-08-29 10:40:02'),
('84672c46c1d0fc59b7056e3a05295feb33e6c8b0cb04e0d5aa1c8531ed2ff37bf13e46efbcf8440d', 29, 5, '650814cccf1fc', '[\"user\"]', 0, '2023-09-18 12:13:48', '2023-09-18 12:13:48', '2024-09-18 12:13:48'),
('84e70175298577d568fd121e310999855a3fd613caca8fc6df5c1beec65dc27d7b7564a699bcbc7c', 9, 5, '64d24e286ab4d', '[\"showroom\"]', 0, '2023-08-08 17:16:08', '2023-08-08 17:16:08', '2024-08-08 17:16:08'),
('85aadc551b3890157328a2ab6ab1e7b7053d63094029c720b5c85b1107ed013cbd97d99322195594', 10, 5, '64d8e9cb7a952', '[\"showroom\"]', 0, '2023-08-13 17:33:47', '2023-08-13 17:33:47', '2024-08-13 17:33:47'),
('85b2450a7c09f882b579f5f5458e99ce75e1ea621d4e433d6efa7e3a9354074fecfd5e2fff437eec', 14, 5, '6508680eccc0d', '[\"showroom\"]', 0, '2023-09-18 18:09:02', '2023-09-18 18:09:02', '2024-09-18 18:09:02'),
('85f5add2141d84b791a764c234695d4383e04d7c5f0132c09e328d678b6108ffacaf554e1482525f', 10, 5, '64f82a322556a', '[\"showroom\"]', 0, '2023-09-06 10:28:50', '2023-09-06 10:28:50', '2024-09-06 10:28:50'),
('87151cf78bbc01b708aec744baeb53a8c0304bc0e32b67e02f55eba02c3ac70091ea4c9a1d9dfa10', 27, 5, '64f5cd5c56a2e', '[\"user\"]', 0, '2023-09-04 15:28:12', '2023-09-04 15:28:12', '2024-09-04 15:28:12'),
('872b44773833b9b9dc2678190212bc0002cb3f788b45723a2a2de39fb714b4a8228d3d3f12001caf', 10, 5, '64f0b2e914a76', '[\"showroom\"]', 0, '2023-08-31 18:34:01', '2023-08-31 18:34:01', '2024-08-31 18:34:01'),
('877d6ae74b1acc97061f64231c1e9eaa4300a0df00a63338c1e908c31a307903949c02487bf7c2af', 6, 5, '64cb9e628ac3a', '[\"showroom\"]', 0, '2023-08-03 15:32:34', '2023-08-03 15:32:34', '2024-08-03 15:32:34'),
('87821426bfe1885d865bc8a6882233cc1ef3789ded9c61b94bd18b4de400476d1ccbeb66a44cefd4', 6, 5, '64cba2cdcfb34', '[\"showroom\"]', 0, '2023-08-03 15:51:25', '2023-08-03 15:51:25', '2024-08-03 15:51:25'),
('87b10b6f2b596ddfe5334ddabece149c40b07726a18619e88abf957a7504c7724f1a74736c80b1bb', 9, 5, '64d4d8544e84f', '[]', 0, '2023-08-10 15:30:12', '2023-08-10 15:30:12', '2024-08-10 15:30:12'),
('885a24f103fb41a2f6586a6626ee277c09028ef8345c87b4b2e07160b0e6f836883f0e8e831517a5', 11, 5, '64eda795e21cd', '[\"showroom\"]', 0, '2023-08-29 11:08:53', '2023-08-29 11:08:53', '2024-08-29 11:08:53'),
('888f2375d47b96b85b1ca7eae04d4ef2a7121607376fb61f8760c8c7248684066356b4d109b39ead', 22, 5, '64f702b101148', '[\"user\"]', 0, '2023-09-05 13:28:01', '2023-09-05 13:28:01', '2024-09-05 13:28:01'),
('89b2810f210306de5d90ab019b745c3e6e19010eced3cb805744c5648962f00427255eca5871c441', 8, 5, '64d4b4d0b21f0', '[]', 0, '2023-08-10 12:58:40', '2023-08-10 12:58:40', '2024-08-10 12:58:40'),
('8a23410e7c43e1ac5c1013bf36445b112a5619a2db9bcb7119d1832377582af040abd2344fe68f4e', 12, 5, '64edea01af0cd', '[\"user\"]', 0, '2023-08-29 15:52:17', '2023-08-29 15:52:18', '2024-08-29 15:52:17'),
('8ade0fbc721f93a943f415f7e0dc3a8b5d1f49aa71d1e1a750f279a299749ccb85f9e9a80d49b159', 3, 5, '64c8e64927cd8', '[\"user\"]', 0, '2023-08-01 14:02:33', '2023-08-01 14:02:33', '2024-08-01 14:02:33'),
('8b741a2e3a9919825f0dfa54ea90cdca9b81b79d18c53ef8189437cc9629aed929c1ab1cc1b81135', 5, 5, '64cbac9b31db7', '[]', 0, '2023-08-03 16:33:15', '2023-08-03 16:33:15', '2024-08-03 16:33:15'),
('8c4ef183d490d500173f47c6407737db55ec4e08af1b025aab475e1b78e9f05f51e6da0cbdeccc9c', 8, 5, '64d251154a29a', '[\"showroom\"]', 0, '2023-08-08 17:28:37', '2023-08-08 17:28:37', '2024-08-08 17:28:37'),
('8c829e3ee2bb7a720a5e853bc4d8b425598c99e2067115469c13c224355c79297b61a03bf3d7379c', 6, 5, '64d33f822ae05', '[]', 0, '2023-08-09 10:25:54', '2023-08-09 10:25:54', '2024-08-09 10:25:54'),
('8cca5919f0e93638328127b37f577165c0686d8a8f52dfbf553e56a79831105102cc623331e1db4d', 10, 5, '64c840b2e7795', '[\"user\"]', 0, '2023-08-01 02:16:02', '2023-08-01 02:16:02', '2024-08-01 02:16:02'),
('8d0b3a9500bf0b8e0522af0da44bb014cb3ffd0f362a351c031a6988736dd0be452ca936898b257d', 8, 5, '64cf8ca457eea', '[]', 0, '2023-08-06 15:05:56', '2023-08-06 15:05:56', '2024-08-06 15:05:56'),
('8d1b27787e97296f6f10bb1c135c42e20da8caa75fa5d4e02040faaf40c25f21ceeb9a2e933a86b7', 9, 5, '64d0a5d46dea9', '[]', 0, '2023-08-07 11:05:40', '2023-08-07 11:05:40', '2024-08-07 11:05:40'),
('8e674e80a981d8e259eae306c81575e28bbd55f1163c235e5551da0e243799bcd1df7dbaedc943ea', 22, 5, '64f6f5e4e1c4c', '[\"user\"]', 0, '2023-09-05 12:33:24', '2023-09-05 12:33:25', '2024-09-05 12:33:24'),
('8f956d65ac90b1344a2963af340082cd052a1b3dff7845149f19deb825d7a9da4152667da38dd521', 10, 5, '64da349ea6a3a', '[\"showroom\"]', 0, '2023-08-14 17:05:18', '2023-08-14 17:05:18', '2024-08-14 17:05:18'),
('900fee761df36fa0e71e9a31df4364067c916dd522ace45eae447a277a7d5244d69cf64abc85fe48', 6, 5, '64d478bf38bb5', '[]', 0, '2023-08-10 08:42:23', '2023-08-10 08:42:23', '2024-08-10 08:42:23'),
('9041cf7eef523ba7205e5c736fe4087e88113e7098cdf732441a4076cb3df72ecfacf625ebb9ec4d', 10, 5, '65017b4b0f6a3', '[\"showroom\"]', 0, '2023-09-13 12:05:15', '2023-09-13 12:05:15', '2024-09-13 12:05:15'),
('904af7347af272c1eb082f2b200fc8bac6943c641a636c30873a07b03c65cee60d8cabb175c5e0fa', 6, 5, '64ca31897344f', '[\"user\"]', 0, '2023-08-02 13:35:53', '2023-08-02 13:35:53', '2024-08-02 13:35:53'),
('9102f4875cabf380184afc90e0acb236375c6d649bc43ecab64c73f824a5fbcb7d86621f1f3f60ce', 7, 5, '64cf41220eb3e', '[]', 0, '2023-08-06 09:43:46', '2023-08-06 09:43:46', '2024-08-06 09:43:46'),
('91541357e518ca9af2d494ce1ea94aca313b70de2c0816cafc9fb22e75e3841701730b8594fbc104', 29, 5, '64fe3051f0383', '[\"user\"]', 0, '2023-09-11 00:08:34', '2023-09-11 00:08:34', '2024-09-11 00:08:34'),
('915c7dd3a4d1993a7619875b84d7f73dcd7825012cdb2885083123a4f135489d003a92e6150a6525', 13, 5, '64f47abc4b004', '[\"user\"]', 0, '2023-09-03 15:23:24', '2023-09-03 15:23:24', '2024-09-03 15:23:24'),
('9246218547b4645819066f960123e63949184f81920a971c5efa02337056a92dc75f3b5fb9ff1218', 10, 5, '64d8a36c7a246', '[\"showroom\"]', 0, '2023-08-13 12:33:32', '2023-08-13 12:33:32', '2024-08-13 12:33:32'),
('929c9939c45be8493667a8a4587da7bade447fde740f2b17dafc1e474d132fa9098527bd74def8dd', 10, 5, '6502b89da2ed9', '[\"showroom\"]', 0, '2023-09-14 10:39:09', '2023-09-14 10:39:09', '2024-09-14 10:39:09'),
('9340e4b45574bbc4931ef5082b52b069e32ba28929bdf819c46effbd56300476ee713e25027be760', 10, 5, '64fd8832c86b5', '[\"showroom\"]', 0, '2023-09-10 12:11:14', '2023-09-10 12:11:14', '2024-09-10 12:11:14'),
('93a304c8b7c30ca142d572265a383ad6d8b01613fb8203a4af809412d097716adf151a89acb58ef4', 14, 5, '650867a5376a8', '[\"showroom\"]', 0, '2023-09-18 18:07:17', '2023-09-18 18:07:17', '2024-09-18 18:07:17'),
('94dc2685ffc74e22e1a1ebf20778696e6c0304015c6738ffd848b6111b2e8e5797aeefa56d49f036', 10, 5, '64ef6be198fe7', '[\"showroom\"]', 0, '2023-08-30 19:18:41', '2023-08-30 19:18:41', '2024-08-30 19:18:41'),
('9528fe670cf8de03ae85eee26765d4136b08a0db61c1f50d88ca39f37f80573ef9c20ebcd511472a', 11, 5, '64eda9972e67f', '[\"showroom\"]', 0, '2023-08-29 11:17:27', '2023-08-29 11:17:27', '2024-08-29 11:17:27'),
('96010677dcec13fbc7ea0a1817593e70176d8f78c80ea664bb1153b387603ddc539462ace48b912e', 27, 5, '64f82a11d728f', '[\"user\"]', 0, '2023-09-06 10:28:18', '2023-09-06 10:28:18', '2024-09-06 10:28:18'),
('9666f3ae58bb452fb3350a03f0c4520f732996a8af59f63a96997e45623bdfd4a1566c593f59ce26', 24, 5, '64ef54ab6d1ed', '[\"user\"]', 0, '2023-08-30 17:39:39', '2023-08-30 17:39:39', '2024-08-30 17:39:39'),
('98818fd6822ae4b4c8f2488f782e7d370d5f9edd50910df0442a44e8615155687d2245814d87a17e', 12, 5, '64cb715320ddd', '[\"user\"]', 0, '2023-08-03 12:20:19', '2023-08-03 12:20:19', '2024-08-03 12:20:19'),
('9a35f0162c0aa98da8767a28463bdac8a4fa18f872510792dd85f4703bf3f99b26c7b41a5084d5e4', 13, 5, '64cf92d72cf6c', '[\"user\"]', 0, '2023-08-06 15:32:23', '2023-08-06 15:32:23', '2024-08-06 15:32:23'),
('9d0e9c1a3e3348850732142d4a42c96333a58badd98bc61adc19aa8a04c9a2f7dfed9af28eeb06da', 12, 5, '64c8ce2f8214c', '[\"user\"]', 0, '2023-08-01 12:19:43', '2023-08-01 12:19:43', '2024-08-01 12:19:43'),
('9da4e63d6330b119e1c1b5c7d8c7fb8200316c102043bb74f64d96238bcbda6e254192c2c942ac1a', 6, 5, '64cd735017c5f', '[\"showroom\"]', 0, '2023-08-05 00:53:20', '2023-08-05 00:53:20', '2024-08-05 00:53:20'),
('9e5f215cd79932a7ae6c501fd0e97a2bcfee6dd7f76376c821a0b8308ee0d0168436e146fe57a383', 5, 5, '64cba97c70a2f', '[]', 0, '2023-08-03 16:19:56', '2023-08-03 16:19:56', '2024-08-03 16:19:56'),
('9ea18d98c5a687e008af387a449aa89cceb3d16c970bafdcce55d865baa70a3625d6385a4937e8da', 11, 5, '64db3e69701f8', '[]', 0, '2023-08-15 11:59:21', '2023-08-15 11:59:21', '2024-08-15 11:59:21'),
('9fb527a1a4efeff143f6232b8e7ec3e34f960ec429f41298cf61ef1e5874d2d69eed04091cb95ccb', 10, 5, '64e76be1ee221', '[]', 0, '2023-08-24 17:40:33', '2023-08-24 17:40:34', '2024-08-24 17:40:33'),
('a02c3db980a00cab33058393cb25ed5170379a7a08dddd2e91cbd40bf0f02d7b30383c823e65ba64', 42, 5, '650045346c946', '[\"user\"]', 0, '2023-09-12 14:02:12', '2023-09-12 14:02:12', '2024-09-12 14:02:12'),
('a03304b25b70a47aeb80f78585463fa5c685ba79fa87cf2ffc2b98da887764e33427da7b4d8ed30a', 48, 5, '6502edad661e3', '[\"user\"]', 0, '2023-09-14 14:25:33', '2023-09-14 14:25:33', '2024-09-14 14:25:33'),
('a074f2e918ac6d0a656b0b29707289dc0e36d6d922a2d5b1c96f2fdfd19cba989d807c567a7fad84', 13, 5, '64e7289294ebd', '[\"showroom\"]', 0, '2023-08-24 12:53:22', '2023-08-24 12:53:23', '2024-08-24 12:53:22'),
('a0bed62611830d47cd2a9b149698654d7835d1430098e26b4b8ca488f65850b1191c4ad3ef854c4c', 11, 5, '64da433776d48', '[]', 0, '2023-08-14 18:07:35', '2023-08-14 18:07:35', '2024-08-14 18:07:35'),
('a11f55c704de83f0556b3f6cdcd10fff610762fce1dad62a29618e3d180c1b8f59cc71956d12e5dd', 10, 5, '64fdb123949f6', '[\"showroom\"]', 0, '2023-09-10 15:05:55', '2023-09-10 15:05:55', '2024-09-10 15:05:55'),
('a1b7696de58359cfa121ac3ec64e5cce1bcaf198f0691971d32674dd3eb05dadc21fe706d15dc1a5', 29, 5, '650825db7dede', '[\"user\"]', 0, '2023-09-18 13:26:35', '2023-09-18 13:26:35', '2024-09-18 13:26:35'),
('a2e5479c2c4178827eba932b483b386a83daabf28392b07e48e385d1dbf3504692e368b77f43999b', 10, 5, '64f83fec9feba', '[\"showroom\"]', 0, '2023-09-06 12:01:33', '2023-09-06 12:01:33', '2024-09-06 12:01:33'),
('a308bdeaa50052973c21599490cef9a44f8a46f1ff2f7feea9e9fb31e9cd0f513a5423178fc4097c', 13, 5, '64eda0d2373f0', '[\"showroom\"]', 0, '2023-08-29 10:40:02', '2023-08-29 10:40:02', '2024-08-29 10:40:02'),
('a3f411fe396b9f12699cf1c9b233d56c6540aa4410e179f15d06b3a53dd7bae8412a2c7ee0e8a63e', 27, 5, '64f5dd8eced54', '[\"user\"]', 0, '2023-09-04 16:37:18', '2023-09-04 16:37:18', '2024-09-04 16:37:18'),
('a47698c10606b231a60c0eedce9d434dbdc6c5a57dfc2b493165a60f93a8942e348c5d049f9bfd0a', 12, 5, '64cb96b56f0b8', '[\"user\"]', 0, '2023-08-03 14:59:49', '2023-08-03 14:59:49', '2024-08-03 14:59:49'),
('a478c788e4e68a2dca754aa183a9ce57a26b5eb908aea446534ef602e8571b17acde7757228d3531', 10, 5, '64c8b0b4ae6ba', '[\"user\"]', 0, '2023-08-01 10:13:56', '2023-08-01 10:13:56', '2024-08-01 10:13:56'),
('a56796a4fd936c29b353bc6c4dd196e576468471b9b8549a9144a55fb9135cac15fc332b371bce8e', 13, 5, '64f5ccd660ed2', '[\"user\"]', 0, '2023-09-04 15:25:58', '2023-09-04 15:25:58', '2024-09-04 15:25:58'),
('a66b963184704bc06c14c6517883b8f44214d7f9bf853fa791bb6127749eb2a0135b3584ec0630aa', 13, 5, '64e728918647e', '[]', 0, '2023-08-24 12:53:21', '2023-08-24 12:53:22', '2024-08-24 12:53:21');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('a6cb1bc920fa108aa32a8f4abcd6cacf61d4bb32fb6a63a4dfcd86234eb38212dabf72022b2f443e', 8, 5, '64cf8ca4670ee', '[\"showroom\"]', 0, '2023-08-06 15:05:56', '2023-08-06 15:05:56', '2024-08-06 15:05:56'),
('a6f3e72de0c950a3b1686fe57356ac706bdac25df0c3d2900607c62d5c78efe0bbe59cadbf92d885', 3, 5, '64c8ce52cc9d5', '[\"user\"]', 0, '2023-08-01 12:20:18', '2023-08-01 12:20:18', '2024-08-01 12:20:18'),
('a6f96f2ab1fcdd4f612071f7b470f5701707d68e21d1713b5c47ae8018e5db7b813cc14a13646e2c', 9, 5, '64d3415295290', '[]', 0, '2023-08-09 10:33:38', '2023-08-09 10:33:38', '2024-08-09 10:33:38'),
('a70b70b098b9e75e686f59208f461edee2e7814c4e22043d48e2ca2f34a23de080a1d27dac2e8686', 13, 5, '64f42d34e075e', '[\"user\"]', 0, '2023-09-03 09:52:36', '2023-09-03 09:52:36', '2024-09-03 09:52:36'),
('a779dbcb36ea843c5a066c3dedc38cd36a373ae3b856aaa9fcfd0ce1b795883231f3f696fa71697a', 7, 5, '64cb8cd1ba015', '[\"showroom\"]', 0, '2023-08-03 14:17:37', '2023-08-03 14:17:37', '2024-08-03 14:17:37'),
('a855a327f6287fecdbb8ce40eabf6d6e545d79676ab725374472dbd05913d6e2d7c098d1884e11f3', 8, 5, '64cd729e9faa8', '[\"showroom\"]', 0, '2023-08-05 00:50:22', '2023-08-05 00:50:22', '2024-08-05 00:50:22'),
('a8d43e671bb34b4353e469cf23eadc7d3e4cf37fa7bbd70c79d5c9c7ee1ecb70e3a8aecf09a32a32', 10, 5, '64eda03b6eba6', '[\"showroom\"]', 0, '2023-08-29 10:37:31', '2023-08-29 10:37:31', '2024-08-29 10:37:31'),
('a92aa8eab8257d86a270f9258ddf3bb3d601456a76e5308cd8f71a643c9ce93dfb763971b3f2eb37', 12, 5, '64ecb0a6050bf', '[\"user\"]', 0, '2023-08-28 17:35:18', '2023-08-28 17:35:18', '2024-08-28 17:35:18'),
('aa65dcb3e7d08bbad66731e6bdd73a61481a0920c10e50913e32f7256848325184bfe7841ffc82d0', 11, 5, '64d8c16a9ff14', '[\"showroom\"]', 0, '2023-08-13 14:41:30', '2023-08-13 14:41:30', '2024-08-13 14:41:30'),
('aac218cfe4c2eaf517c6eeb0afbfc94c89c1ab7439d07790e172cd5b0614b6e74dfe37ba6c3f7055', 5, 5, '64cb939d6a01d', '[]', 0, '2023-08-03 14:46:37', '2023-08-03 14:46:37', '2024-08-03 14:46:37'),
('aacc53447d256edda5edd6a9ab7ca93f4ff454f5ae518bab307a787d96a4d74b652e603903d84a93', 9, 5, '64da2e6278671', '[]', 0, '2023-08-14 16:38:42', '2023-08-14 16:38:42', '2024-08-14 16:38:42'),
('ac54536eeb6e3e65099ea5a4af64694ebd82dd2a5b8d534de3d6b3d94498930c70e2d298fbb51961', 10, 5, '64f48a404a4fa', '[\"showroom\"]', 0, '2023-09-03 16:29:36', '2023-09-03 16:29:36', '2024-09-03 16:29:36'),
('ac922291a63e4af04cef642c57fe6655eb86f7a92f4b0988a984f476055227fa2f2d82033204090a', 17, 5, '64d8f19161414', '[\"user\"]', 0, '2023-08-13 18:06:57', '2023-08-13 18:06:57', '2024-08-13 18:06:57'),
('acee9de5562b65ecfcf41e216aeb3916ea1c6dc6c3c24f83682edb41e6aae7e7c68097f78d2655d4', 10, 5, '6509b5986f519', '[\"showroom\"]', 0, '2023-09-19 17:52:08', '2023-09-19 17:52:08', '2024-09-19 17:52:08'),
('acfba189e2aace84cb374a3e662c491637ebd4b55cf81db99a708897da89e0a8fd11a2f2ae4527d1', 6, 5, '64cd73500d147', '[]', 0, '2023-08-05 00:53:20', '2023-08-05 00:53:20', '2024-08-05 00:53:20'),
('ad2de414d8dc7043b2cd75264c5b4041869b5ca1a79c95c4d6d2f7d895536393f93885a98bd7508f', 13, 5, '64f70218c2635', '[\"user\"]', 0, '2023-09-05 13:25:28', '2023-09-05 13:25:28', '2024-09-05 13:25:28'),
('ad8b21f2ab74a49e5570d7049ec1524ab1f6078edbcca9264020649bfcf4c03086f079d25fac402c', 7, 5, '64cc1df10a94e', '[]', 0, '2023-08-04 00:36:49', '2023-08-04 00:36:49', '2024-08-04 00:36:49'),
('ae2c03ccb47a16299ca451481331485df715202ae78edadadbcd981c5692e06a75b54810db0d77c6', 12, 5, '64d899627c9df', '[\"user\"]', 0, '2023-08-13 11:50:42', '2023-08-13 11:50:42', '2024-08-13 11:50:42'),
('af68043947849c9a3018aea2970c6bb628539e77b450597a433a8ca08774c70f94147f06fba2e6c3', 11, 5, '64d8aac093497', '[]', 0, '2023-08-13 13:04:48', '2023-08-13 13:04:48', '2024-08-13 13:04:48'),
('af7428f8b86c76337d1db220caef86b80d4443525ae3d7eb121b027e6ab41e4d56ef3db1a22ac26d', 10, 5, '64e76be206d10', '[\"showroom\"]', 0, '2023-08-24 17:40:34', '2023-08-24 17:40:34', '2024-08-24 17:40:34'),
('afac9021318713957ebff058529d02bfe1c239b9f06c7d8bb4c9d593491ad94b318a6ab9d3056a1e', 12, 5, '64da3a0ccc54d', '[]', 0, '2023-08-14 17:28:28', '2023-08-14 17:28:28', '2024-08-14 17:28:28'),
('b04277f9a3bc4ba2930306b1da9f5962e19fd1acb8737d3332f427c96977478f82555628b4efe0b5', 12, 5, '64c8c76b68d60', '[\"user\"]', 0, '2023-08-01 11:50:51', '2023-08-01 11:50:51', '2024-08-01 11:50:51'),
('b0a035425586c3d38d96f9f229d3bf891170fbcd7a666aa5423e21e3f4949ea176ff52fa91f5776e', 12, 5, '64d23be139772', '[\"user\"]', 0, '2023-08-08 15:58:09', '2023-08-08 15:58:09', '2024-08-08 15:58:09'),
('b0ae61603938a0bf3060053f09c8f8397093683fec1cbbe3257f51de10dca1a476c1725a7301fa07', 12, 5, '64eca81ba5c77', '[\"user\"]', 0, '2023-08-28 16:58:51', '2023-08-28 16:58:51', '2024-08-28 16:58:51'),
('b0f8bc1afab6387b05d1a2e0f650b7cb123baf765064cec865db709839c732a75740526fe54b031e', 7, 5, '64cf41221bd9b', '[\"showroom\"]', 0, '2023-08-06 09:43:46', '2023-08-06 09:43:46', '2024-08-06 09:43:46'),
('b22e78805c4dab16798ff4861efecff69ced7d1dd916cf9f4979723bdf31ef7fe09cd6539d161961', 31, 5, '64fb6b0484c61', '[\"user\"]', 0, '2023-09-08 21:42:12', '2023-09-08 21:42:12', '2024-09-08 21:42:12'),
('b25ab6da7edc7846a260dc55bbcaa6a4630a2732738ddaff64bcd6e51cfd0f6e58b0ff7d831cfa03', 20, 5, '64da3bf7b2aed', '[\"user\"]', 0, '2023-08-14 17:36:39', '2023-08-14 17:36:39', '2024-08-14 17:36:39'),
('b26572fe198ece2a03744d5170a5fef6fa1b290a99859b7cbbda97c83e0750864c96081675fa3f16', 22, 5, '64f03c341e5c8', '[\"user\"]', 0, '2023-08-31 10:07:32', '2023-08-31 10:07:32', '2024-08-31 10:07:32'),
('b2a98f18013485379c33e34dc47ddd40f190307dc75978da1279039623a23951f59f6b904c746ac9', 7, 5, '64cba572c603c', '[\"showroom\"]', 0, '2023-08-03 16:02:42', '2023-08-03 16:02:42', '2024-08-03 16:02:42'),
('b44dfb31f9b2011399bba106e98b2c1a1a457acaef42bfdd426453f2338a38feaddd3a4f5a8ae803', 22, 5, '64eeee2d0543f', '[\"user\"]', 0, '2023-08-30 10:22:21', '2023-08-30 10:22:21', '2024-08-30 10:22:21'),
('b49962fdfaa18777c6d588631a7943d8666cc43f3ca2f4edc045f48949169d0e6bff259ae7e55daa', 13, 5, '64d103a1921b1', '[\"user\"]', 0, '2023-08-07 17:45:53', '2023-08-07 17:45:53', '2024-08-07 17:45:53'),
('b64cd3ada20545422f2ee411f00eb380cb150ec656bc52f7274aeddd02520e434959a593ed76bacf', 10, 5, '65017b05ea8ba', '[\"showroom\"]', 0, '2023-09-13 12:04:05', '2023-09-13 12:04:05', '2024-09-13 12:04:05'),
('b6a92d58291c59e58f901bf267674e0c2a3bca2d795a853ed1ab02af6dbdf6755f5163bf2a4ac802', 20, 5, '64f585db6deb0', '[\"user\"]', 0, '2023-09-04 10:23:07', '2023-09-04 10:23:07', '2024-09-04 10:23:07'),
('b76052fb33a0d66cc87480a34300cf71a547c8c64e710a2f5fd5baacec31750603782ce65b6a67ea', 31, 5, '64fbc3a84edc9', '[\"user\"]', 0, '2023-09-09 04:00:24', '2023-09-09 04:00:24', '2024-09-09 04:00:24'),
('bb428fad3d54fd026d25ccdc20a041bdbe02f18986021806537e3802cc79077fd05d6072180fccee', 27, 5, '64f70e18eaaa7', '[\"user\"]', 0, '2023-09-05 14:16:40', '2023-09-05 14:16:41', '2024-09-05 14:16:40'),
('bc563812c86dd24641fb45fd6c6eb7f0196f6b76259abc2345ae2720d5545495133adb5429a4c61f', 6, 5, '64cb8915e30e7', '[]', 0, '2023-08-03 14:01:41', '2023-08-03 14:01:41', '2024-08-03 14:01:41'),
('bc8521f9bf83519b501cbb42f381fdb7267b4a63e6752a40c4872f8579505cf9c62af2e92ba99f44', 37, 5, '64ff19ebd30a8', '[\"user\"]', 0, '2023-09-11 16:45:15', '2023-09-11 16:45:15', '2024-09-11 16:45:15'),
('bcd1786739dfdca9f767855c9968207a55e9d0aadebf088a1c04df003914487b6178a64a85b1a34b', 10, 5, '64f0b2e901cc6', '[]', 0, '2023-08-31 18:34:01', '2023-08-31 18:34:01', '2024-08-31 18:34:01'),
('bd97f7f20d2a0c5551811d6bbca9eda755b99e390b30008b5aeaa62f805ed6f069ef9a40dc23186f', 14, 5, '650865d58c595', '[\"showroom\"]', 0, '2023-09-18 17:59:33', '2023-09-18 17:59:33', '2024-09-18 17:59:33'),
('bd98a3f141f7d85b6f736b631464b948177f35e2f4541e3082793af115c7bba61aa702ef9decf779', 10, 5, '64f020d81d0fa', '[\"showroom\"]', 0, '2023-08-31 08:10:48', '2023-08-31 08:10:48', '2024-08-31 08:10:48'),
('be4774704ff7ebd6a7cc9e683ca675f0695d2635315ca6b6ec9b697fe370603cadeff4c1115e59e5', 12, 5, '64eda51844640', '[\"user\"]', 0, '2023-08-29 10:58:16', '2023-08-29 10:58:16', '2024-08-29 10:58:16'),
('bf9de54be1a8d90f017c786898ccb53f8059269e942e14a30694f69026b1272a8720ab0110197178', 13, 5, '64f0bad568866', '[\"user\"]', 0, '2023-08-31 19:07:49', '2023-08-31 19:07:49', '2024-08-31 19:07:49'),
('c011e306a95de05a64c7049b1b793a74ffdd20d1d37ded541f09b6bd4c2db4d91562c17855299211', 12, 5, '64cf78806e457', '[\"user\"]', 0, '2023-08-06 13:40:00', '2023-08-06 13:40:00', '2024-08-06 13:40:00'),
('c0ce9f22a19872adae3889bfba1cef4bd3f925c15a7c72d3033aec46771d940a4bdb0ad50d52f70f', 12, 5, '64cba230b2723', '[\"user\"]', 0, '2023-08-03 15:48:48', '2023-08-03 15:48:48', '2024-08-03 15:48:48'),
('c109fa2102f8e55f2d841a4562b650ed90fadbd10b645e4aa21d40c81b515ae76f2517cd50d86214', 27, 5, '64f9a72c43c17', '[\"user\"]', 0, '2023-09-07 13:34:20', '2023-09-07 13:34:20', '2024-09-07 13:34:20'),
('c2996c64c39d1e5a7415315337bb1898f41fad5e3ff975c4eb592ff232355031ddcbf930ef830566', 7, 5, '64cbad624980b', '[]', 0, '2023-08-03 16:36:34', '2023-08-03 16:36:34', '2024-08-03 16:36:34'),
('c3f2995e01171c9d65333ccb3aea3ae01e728c8002ae22e8284b1782fa7211bd402bec0c7414e7e9', 12, 5, '64da395b320a4', '[]', 0, '2023-08-14 17:25:31', '2023-08-14 17:25:31', '2024-08-14 17:25:31'),
('c4020c07d4dad453a6e67df6bf921e9df7087a97f1ed2da3b8ced26b3e13be53ef99e1f3443bfe3f', 5, 5, '64cb94803fa85', '[]', 0, '2023-08-03 14:50:24', '2023-08-03 14:50:24', '2024-08-03 14:50:24'),
('c40e6c3d0406fca5349a6571c03b821b492f5eb63a10dbd8d6e0c4fa3502dda7371df926c9e072f0', 1, 5, '64c8b97005fd7', '[]', 0, '2023-08-01 10:51:12', '2023-08-01 10:51:12', '2024-08-01 10:51:12'),
('c411002900ddf38d933a118147e120b66e2ae7b7d6fbe1021d60b6374186653f142a7fbc6a54e74c', 13, 5, '64f48f04b157d', '[\"user\"]', 0, '2023-09-03 16:49:56', '2023-09-03 16:49:56', '2024-09-03 16:49:56'),
('c656e330a896050f10e8de34a11b35fdba6329aa514fc80166623b49f3077fba564062109390c1c2', 5, 5, '64cb94804b02c', '[\"showroom\"]', 0, '2023-08-03 14:50:24', '2023-08-03 14:50:24', '2024-08-03 14:50:24'),
('c700c8cf2fa2ed3a62ed645943030a7110aff63222abfc73261567c2f070f0845772959ef8be632f', 10, 5, '64f5f601266b4', '[\"showroom\"]', 0, '2023-09-04 18:21:37', '2023-09-04 18:21:37', '2024-09-04 18:21:37'),
('c84d43eaf997d692fdd66dd280874e73deb7901211d173f523981d142e5fe02bac25be33583b3273', 10, 5, '65018ded070b7', '[\"showroom\"]', 0, '2023-09-13 13:24:45', '2023-09-13 13:24:45', '2024-09-13 13:24:45'),
('ca0e93c62957bcb6fb8121d2502174c480f2e3cdb34dafd8a79bf28c56d73d993f9ffcbe3f4545c9', 12, 5, '64da395b3dc50', '[\"showroom\"]', 0, '2023-08-14 17:25:31', '2023-08-14 17:25:31', '2024-08-14 17:25:31'),
('cac89fc27650d3779a24cd2f4a47bce0eb43ff7cf5199cb397a717a1f96f5106147e4404056bb570', 25, 5, '64f30c630a9f6', '[\"user\"]', 0, '2023-09-02 13:20:19', '2023-09-02 13:20:19', '2024-09-02 13:20:19'),
('cbb76d0303ffc87f7f87e378e484f25266fef660e0f02f99632d88c239c631c76920c9bfb3118f17', 10, 5, '64fdb0534a877', '[\"showroom\"]', 0, '2023-09-10 15:02:27', '2023-09-10 15:02:27', '2024-09-10 15:02:27'),
('cc4a7ce9a22bf34d0a9e9f736f8c0cc745720fa5b604ad0aed070e74781e2dbbdd16062112c8e6f0', 11, 5, '64e77fc8a7a1b', '[]', 0, '2023-08-24 19:05:28', '2023-08-24 19:05:28', '2024-08-24 19:05:28'),
('cc99df3e5c2cd0b78d73ba075228b180a49ae8794f7e28de4ac29efc239a15decdf8adf0c769b6a2', 27, 5, '64fb666dc1ff3', '[\"user\"]', 0, '2023-09-08 21:22:37', '2023-09-08 21:22:37', '2024-09-08 21:22:37'),
('cd5ae881c1cc2c2f69e04bc8263d20f1d4163d6d8db1978b0b92df3350172b2697f0ab9f94031f11', 3, 5, '64c841114e855', '[]', 0, '2023-08-01 02:17:37', '2023-08-01 02:17:37', '2024-08-01 02:17:37'),
('ce66bd27024dce21e9e75adb9b90b4308dab56e792ce9f964f6568a3132d74e79c3f362ac86eed36', 10, 5, '64da349e9776f', '[]', 0, '2023-08-14 17:05:18', '2023-08-14 17:05:18', '2024-08-14 17:05:18'),
('cea4245443cd78215dd0ef35ec533685b241aa4cf7f4281aafd60980c61febdfe98c92faff6b094a', 14, 5, '6509b87335682', '[\"showroom\"]', 0, '2023-09-19 18:04:19', '2023-09-19 18:04:19', '2024-09-19 18:04:19'),
('d01755059c37e685b4adc34999c180bb3d4c0db181ee0e404c82470a602db33c551da4fff6e34783', 11, 5, '64eee697dff05', '[]', 0, '2023-08-30 09:49:59', '2023-08-30 09:49:59', '2024-08-30 09:49:59'),
('d06774a4480f6694aa1d88794659126791a9ac596791e6c69dcd7a04ce757f1cfd978904646cc146', 5, 5, '64cb97b4a8097', '[]', 0, '2023-08-03 15:04:04', '2023-08-03 15:04:04', '2024-08-03 15:04:04'),
('d06c9f75854429aafb7f10c2285cde57dd6905ea1caf4d1183cac3fa56cf718ada54fb9264525512', 12, 5, '64d8bc517ab07', '[\"user\"]', 0, '2023-08-13 14:19:45', '2023-08-13 14:19:45', '2024-08-13 14:19:45'),
('d0856a3ea1603d32914c87728d39073e3af40345e0e039448527ae160a95a1b46834f95bc25ead7a', 9, 5, '64d24e285d5e2', '[]', 0, '2023-08-08 17:16:08', '2023-08-08 17:16:08', '2024-08-08 17:16:08'),
('d093c861bb6e7c19e696f18f5c5e5f930e6ce342c8baa5d178b9d7fa6c5115d4264541fa3759fed0', 10, 5, '64c8b9059a71b', '[\"user\"]', 0, '2023-08-01 10:49:25', '2023-08-01 10:49:25', '2024-08-01 10:49:25'),
('d10bf40f7b53a0acd1448e101229060af64e970a05d7d8cb5eb786a46c963ca167c740c3b0c528f4', 22, 5, '64f48e6194891', '[\"user\"]', 0, '2023-09-03 16:47:13', '2023-09-03 16:47:13', '2024-09-03 16:47:13'),
('d2119c5ef044b15a644141cac9ca1dd3f0472efdd0a5f982684a946932a05b67c10265ff371a24ff', 50, 5, '65081aff75d20', '[\"user\"]', 0, '2023-09-18 12:40:15', '2023-09-18 12:40:15', '2024-09-18 12:40:15'),
('d348fa8f0dde33d09fa682faf5df7a85cfb80b20be5bc1b8137b300070e92c859046afc12cafb5dd', 29, 5, '6508287e89bcf', '[\"user\"]', 0, '2023-09-18 13:37:50', '2023-09-18 13:37:50', '2024-09-18 13:37:50'),
('d4702427ef79851e3d8b792ff6c72689b131bdd847a3081da5325a41eeee6968c4d0101f5cd03d6c', 10, 5, '64f4d2f8d5e7a', '[\"showroom\"]', 0, '2023-09-03 21:39:52', '2023-09-03 21:39:52', '2024-09-03 21:39:52'),
('d4dee1bdc6e8e21cd9fc07fa7f1533fac3ef18fff216a8daf6096dff896e2881bd27735d6850c829', 21, 5, '64e72876153d1', '[\"user\"]', 0, '2023-08-24 12:52:54', '2023-08-24 12:52:54', '2024-08-24 12:52:54'),
('d5282354600ead060e1ebd8f325beeef76ae9253a48c3d31d5de90cae7d91ce45a138bfb924e2250', 22, 5, '64f092cee0f41', '[\"user\"]', 0, '2023-08-31 16:17:03', '2023-08-31 16:17:03', '2024-08-31 16:17:03'),
('d63835f188e7c2aa473291d9686a8699a5bb3f39fc1d10ec4e4dc221d1183653bfaaa787c98994f7', 22, 5, '64f031f77b545', '[\"user\"]', 0, '2023-08-31 09:23:51', '2023-08-31 09:23:51', '2024-08-31 09:23:51'),
('d8c8b895337117ae2c82a64099d8d5daebe0ecda48fd8fd4fd8063fb93841b635887877c18ff9158', 10, 5, '64eda03b6106c', '[]', 0, '2023-08-29 10:37:31', '2023-08-29 10:37:31', '2024-08-29 10:37:31'),
('d91802e4b5f4d4ac6bf3dcfa9cab08ae634221dcbce88acc29726b7bea1c239ae3d927a8b704debe', 7, 5, '64cbb153c8247', '[\"showroom\"]', 0, '2023-08-03 16:53:23', '2023-08-03 16:53:23', '2024-08-03 16:53:23'),
('da2d6ef570d6942d37a0cba7def6e04bc215963803399469f5b875a6554b86ef5c86f86efa75cfa8', 11, 5, '64eeea00f3b2e', '[]', 0, '2023-08-30 10:04:33', '2023-08-30 10:04:33', '2024-08-30 10:04:33'),
('dc4d850b9e0846fe12b5c1e655071fa634c552f2911b2e0c7dacdd0d1ed806c6e066a61b6a377838', 9, 5, '64d0a5d47abcb', '[\"showroom\"]', 0, '2023-08-07 11:05:40', '2023-08-07 11:05:40', '2024-08-07 11:05:40'),
('dc978bf46e87a9403e9ec25647b14fd92d2b5949ca25d38243c76326a9b34d7ab3bcae755670c321', 6, 5, '64cb8915f2b93', '[\"showroom\"]', 0, '2023-08-03 14:01:42', '2023-08-03 14:01:42', '2024-08-03 14:01:42'),
('ddf89b5c0768b3490849a3c78e3e06094309652b0ea6304246254d2f220a009684bfb017ffc1c98c', 13, 5, '64f48ee84ac71', '[\"user\"]', 0, '2023-09-03 16:49:28', '2023-09-03 16:49:28', '2024-09-03 16:49:28'),
('de5cb6fecb868aeb38e8c71ed25af584a45b613f9cd36e84b719dfacb20c1ca773fbd9237950f68b', 11, 5, '64da437ce9bbe', '[\"showroom\"]', 0, '2023-08-14 18:08:44', '2023-08-14 18:08:44', '2024-08-14 18:08:44'),
('de83776001c5db57797ba12acf31e8d63d3c0a38d9cf64e563d1acb2418a15940e5a1267dca6b12d', 7, 5, '64cf8039a2201', '[\"showroom\"]', 0, '2023-08-06 14:12:57', '2023-08-06 14:12:57', '2024-08-06 14:12:57'),
('e0a9cead32a4a70138f1a138ba75c91890f0ce393d4ac319e3797e23730fa1b49e1bf70484a1544d', 46, 5, '65009e6a98075', '[\"user\"]', 0, '2023-09-12 20:22:50', '2023-09-12 20:22:50', '2024-09-12 20:22:50'),
('e12dbdbc0703fac29c7815e88693a374a8e74ee0dfbbdf7d6713462688c08143c08e70a3b8e3a521', 8, 5, '64d478fb4c4c6', '[\"showroom\"]', 0, '2023-08-10 08:43:23', '2023-08-10 08:43:23', '2024-08-10 08:43:23'),
('e1c9ebf468a902ad2f80ccabe34e1ae246cb1145eaa4c9781ffae7b67cab567d86e4de9cad5e929d', 11, 5, '64fe2f97552a1', '[\"showroom\"]', 0, '2023-09-11 00:05:27', '2023-09-11 00:05:27', '2024-09-11 00:05:27'),
('e28b80d7a2921aaf4f52f0536c67fa9d578cfd973469d221a99f538e5b9446193c4371be3aa55e50', 12, 5, '64cb71145ea65', '[\"user\"]', 0, '2023-08-03 12:19:16', '2023-08-03 12:19:16', '2024-08-03 12:19:16'),
('e3ee576ff9c97018eb7930e2f4a4d7222482eb8adcf4c87a463a8c69570cbbe448224d60f1f2832e', 11, 5, '64f9c19ad8bd0', '[\"showroom\"]', 0, '2023-09-07 15:27:07', '2023-09-07 15:27:07', '2024-09-07 15:27:07'),
('e45ff8b13ddd023109780b3a37ec7fae906fd3fb3c1ef5eddfdb14451237ac4dbb4a3dd492189dca', 12, 5, '64cb73049d4bb', '[\"user\"]', 0, '2023-08-03 12:27:32', '2023-08-03 12:27:32', '2024-08-03 12:27:32'),
('e497794ee62e19945dec8bd3b8525ea7eaa5122b6cc1dd2f1a6f8b42d48a7149149922b831aa5fce', 49, 5, '65073f219b76a', '[\"user\"]', 0, '2023-09-17 21:02:09', '2023-09-17 21:02:09', '2024-09-17 21:02:09'),
('e5ab69b43601777332e12b0a26413b0f060a5fea40bd899bde9ec65718800b6b78cb8260a80f032b', 13, 5, '64cf8ee84fecd', '[\"user\"]', 0, '2023-08-06 15:15:36', '2023-08-06 15:15:36', '2024-08-06 15:15:36'),
('e5ce802304149bdc96c302d037bb2b607cce008e3f432f1c3d2986fa81d0685d770443da78a4b475', 11, 5, '64c8c59e42d7a', '[\"user\"]', 0, '2023-08-01 11:43:10', '2023-08-01 11:43:10', '2024-08-01 11:43:10'),
('e610188d3e1140450dec8bcd969d473c7bfb596aaba7693307744e54ce0b974ebed2a7e32edeace8', 8, 5, '64cd2f465d765', '[\"showroom\"]', 0, '2023-08-04 20:03:02', '2023-08-04 20:03:02', '2024-08-04 20:03:02'),
('e812b95ceb7e9a0d88c6c1e0b9eb9d5310f647bef2258ea0775b2096f4740df6f2d7d63d559a5095', 25, 5, '64f1ff589597e', '[\"user\"]', 0, '2023-09-01 18:12:24', '2023-09-01 18:12:24', '2024-09-01 18:12:24'),
('e93de788e416f9e88cbf893cb5bafc9a2caf62cbc052532be4aec985347ed50ea94a30298128c728', 22, 5, '64eed201ce531', '[\"user\"]', 0, '2023-08-30 08:22:09', '2023-08-30 08:22:09', '2024-08-30 08:22:09'),
('ea72fdda6533a13d02eecd3fcad378e46700e76205cd30496d94c4e8561d17ce6add99a207e32ca0', 29, 5, '6507496571a7b', '[\"user\"]', 0, '2023-09-17 21:45:57', '2023-09-17 21:45:57', '2024-09-17 21:45:57'),
('eac7a2216ba04b449b093b9523e6f315b8a9f44677d71425600dbe7a022f2a931c1fce1371250f9c', 8, 5, '64d479e8505d6', '[\"showroom\"]', 0, '2023-08-10 08:47:20', '2023-08-10 08:47:20', '2024-08-10 08:47:20'),
('eb772ac91e1a5e10033eb12104a4b56f2f044ad31ebe7971ccd3ce1a884255591e8b56d013ec3be3', 22, 5, '64f7027dd90c1', '[\"user\"]', 0, '2023-09-05 13:27:09', '2023-09-05 13:27:09', '2024-09-05 13:27:09'),
('eb934108f3ce1860e8283e0bcc8845143f7d0ceb34215f44459d26a78f3932b7ad843afdb2314dc6', 8, 5, '64d50eb90a176', '[]', 0, '2023-08-10 19:22:17', '2023-08-10 19:22:17', '2024-08-10 19:22:17'),
('eb983c71d9995e9d00e4a321411d50d9e03a199a7241aaaa51931fd34937102a049bfb918c26a68c', 12, 5, '64d478f1cd74f', '[\"user\"]', 0, '2023-08-10 08:43:13', '2023-08-10 08:43:13', '2024-08-10 08:43:13'),
('eba55d4c1d6d30c0fa5a49fa960b9aa09f23c7ff30f6125dfaf1439de35a1328c33b9ee31f07bdcf', 20, 5, '64f5868526ac7', '[\"user\"]', 0, '2023-09-04 10:25:57', '2023-09-04 10:25:57', '2024-09-04 10:25:57'),
('eda842dc0e0b9e4d23e9004aedc85d9ee9e85c1385d1f6cef6c8d61cd117e6c34a14b9713a0e4f4b', 14, 5, '64e78c49b648e', '[\"user\"]', 0, '2023-08-24 19:58:49', '2023-08-24 19:58:49', '2024-08-24 19:58:49'),
('ee2f9fd25efc80c6dab09ace4e5ab04e9390ff566418f4017d7974157ab1fc575621d658362b7e9d', 15, 5, '64d4e2fb3f92d', '[\"user\"]', 0, '2023-08-10 16:15:39', '2023-08-10 16:15:39', '2024-08-10 16:15:39'),
('f0e26d142cfed4153c079d026648d12d30bf96e1cb5ac9eb3a709f7c24055d64c993ae548d07ea8f', 10, 5, '64e76276e79a5', '[\"showroom\"]', 0, '2023-08-24 17:00:22', '2023-08-24 17:00:22', '2024-08-24 17:00:22'),
('f0f2c414602b03ba8f848a518aceed9431d4db0b214dc54d79bb11dbbf2dfae863a49c98641b2877', 9, 5, '64d2518e059fb', '[\"showroom\"]', 0, '2023-08-08 17:30:38', '2023-08-08 17:30:38', '2024-08-08 17:30:38'),
('f0f4ce6a72967c9e552c3842bc209b39f07ff0f428592eebec19637492622180034bd74ddeee69a9', 13, 5, '64cfa542e7976', '[\"user\"]', 0, '2023-08-06 16:50:58', '2023-08-06 16:50:58', '2024-08-06 16:50:58'),
('f3ffedd22e4e7c24f23995600d19b258b28ffc1ecd728b9e1bfebeae5c1f2cd4f17436d7d4b0d5a1', 22, 5, '64eeca86ed68f', '[\"user\"]', 0, '2023-08-30 07:50:15', '2023-08-30 07:50:15', '2024-08-30 07:50:15'),
('f43019b257b15d4449c9ec48e3c3bffdd624ca75b6d7377824963c6fe4b6ea8b2f89f0f70c6c2e63', 13, 5, '64d25a39ef455', '[\"user\"]', 0, '2023-08-08 18:07:37', '2023-08-08 18:07:38', '2024-08-08 18:07:37'),
('f4dc4ebe709196f23eaaf062ecbd1de59386e53b6e44c110ab7f8a444e753c15e5028e6122e14665', 22, 5, '64f5e3f4d476f', '[\"user\"]', 0, '2023-09-04 17:04:36', '2023-09-04 17:04:36', '2024-09-04 17:04:36'),
('f7599199d7b152431e1e53517a645c6c1227f51db8d663c75d547d5f5075f19707e2d7dd9b3b3ca0', 29, 5, '64f98b3b941b9', '[\"user\"]', 0, '2023-09-07 11:35:07', '2023-09-07 11:35:07', '2024-09-07 11:35:07'),
('f80ed463ce08df11764388233bf6746e81bbf0b89782bcdbccd938b994224bb5a506ec08727544a7', 9, 5, '64d34152a162c', '[\"showroom\"]', 0, '2023-08-09 10:33:38', '2023-08-09 10:33:38', '2024-08-09 10:33:38'),
('f925d8a35555add5fdf38eaa89f9d5e6eefde531e670e31e57dd170627a67bab8f29a15440ae3c6f', 8, 5, '64d479e8448c8', '[]', 0, '2023-08-10 08:47:20', '2023-08-10 08:47:20', '2024-08-10 08:47:20'),
('f9fda9aa667e41fff340895bdf34c913f4f95ae432bdb09a88db747651edb6d2fbc3da04c9641ded', 12, 5, '64d8a172ca222', '[\"user\"]', 0, '2023-08-13 12:25:06', '2023-08-13 12:25:06', '2024-08-13 12:25:06'),
('fa8ca9f92b7c0d1aa4a03f35ce099b9bf4c2d4da5be9ca3d6a5736c80acd7dadc5a3427443216e3e', 6, 5, '64cc20a5268d3', '[]', 0, '2023-08-04 00:48:21', '2023-08-04 00:48:21', '2024-08-04 00:48:21'),
('fba052b12b3dc28213c55c7a1c74d6c188c9c219462bd2cde8e199114660e39927537fe1d71fda7a', 47, 5, '650170d80960a', '[\"user\"]', 0, '2023-09-13 11:20:40', '2023-09-13 11:20:40', '2024-09-13 11:20:40'),
('fc809080e4251e01c63492e641f1c5b4fa225c508634e9190cfbb0c0c7bb00509cc3e783eae312fa', 14, 5, '65087550178ce', '[\"showroom\"]', 0, '2023-09-18 19:05:36', '2023-09-18 19:05:36', '2024-09-18 19:05:36'),
('fcf661d6cca96ce77d307500de1f08aa8fbcfdb0545eef1dbaccbb36744c9f174998e93df8ad5a31', 8, 5, '64d3b89c37af5', '[\"showroom\"]', 0, '2023-08-09 19:02:36', '2023-08-09 19:02:36', '2024-08-09 19:02:36'),
('fd2f8c81df241e7018133595ed3757645228f0d1037e65ef3f02a752ad38545de30bc75928899836', 19, 5, '64d8f22feb8bd', '[\"user\"]', 0, '2023-08-13 18:09:35', '2023-08-13 18:09:35', '2024-08-13 18:09:35'),
('fd9439588e85fc295d350b280a1bc15ebd6ed5d3ef2c7d37b9c8f7d1bb18e67b94928790b4868ced', 12, 5, '64d8f3001ab34', '[\"user\"]', 0, '2023-08-13 18:13:04', '2023-08-13 18:13:04', '2024-08-13 18:13:04'),
('fdbf207b60d6e705e553e7e6730684f461a61bc066baa1e92408cfd8722284ecc58e481ebc597a3e', 10, 5, '64ef6be157d93', '[]', 0, '2023-08-30 19:18:41', '2023-08-30 19:18:41', '2024-08-30 19:18:41'),
('fdc6b2c7674e8ef685458243da901d0e67619a95264439e002cefa30dfa1d2f2b394638725d7187b', 30, 5, '64fb6655cfc6c', '[\"user\"]', 0, '2023-09-08 21:22:13', '2023-09-08 21:22:13', '2024-09-08 21:22:13'),
('ff688e20b41d84476a3af6a677b061ec2e43a6ce13762192831db817cc871a6f25c3a4d50409150d', 10, 5, '64fe315c13dbb', '[\"showroom\"]', 0, '2023-09-11 00:13:00', '2023-09-11 00:13:00', '2024-09-11 00:13:00'),
('ff787a2ddb3f150a06e344e17ccd3bc994832be6487380182f0dcc579c874a86bd9e6078dd90ca88', 12, 5, '64c8c6b5c9c3b', '[\"user\"]', 0, '2023-08-01 11:47:49', '2023-08-01 11:47:49', '2024-08-01 11:47:49'),
('ff7e4653d9581f2fea263a28a934505d9b6d71c1fd45ac7198ab4469d2ef0ff3e3c613c1e3179ce1', 5, 5, '64cb9daddf809', '[\"showroom\"]', 0, '2023-08-03 15:29:33', '2023-08-03 15:29:33', '2024-08-03 15:29:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(5, NULL, 'Laravel Personal Access Client', 'eiGJ3TCvgAPe12jBSeyBwwgruqQdEzlK6v9Vlw13', NULL, 'http://localhost', 1, 0, 0, '2023-08-01 02:15:05', '2023-08-01 02:15:05'),
(6, NULL, 'Laravel Password Grant Client', '6LK9Em23LHSafIhTjW85Rlcjwr4jyKAvI0ddjims', 'users', 'http://localhost', 0, 1, 0, '2023-08-01 02:15:05', '2023-08-01 02:15:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(3, 5, '2023-08-01 02:15:05', '2023-08-01 02:15:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` json DEFAULT NULL,
  `period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'month',
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `period`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\": \"Ingrid Irwin\", \"en\": \"Blaze Mcdaniel\"}', '11', '74', '{\"en\": \"Ut nobis id sint est\"}', '2023-08-28 18:03:39', '2023-08-28 18:03:39'),
(2, '{\"ar\": \"اشتراك مجاني\", \"en\": \"Free package\"}', '1', '0', '{\"en\": \"احصل علي تجربة مميزة لمدة شهر\"}', '2023-08-29 11:03:06', '2023-08-29 11:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
(4, '{\"en\":\"About Us\",\"ar\":\"\\u0645\\u0646 \\u0646\\u062d\\u0646\"}', '{\"en\":\"<p><span style=\\\"font-size:18px\\\"><strong>About Automobile<\\/strong><\\/span><\\/p>\\r\\n\\r\\n<p>&ldquo;Automobile&rdquo;, provides services for selling guaranteed used cars and new cars in an easy way and convenient, where you can search, buy, and sell through our website and our application on your phone, and we cover all regions of the Arab Republic of Egypt.<\\/p>\\r\\n\\r\\n<p>The objectives of Automobile are to transform the car market in general, whether used or new, in the Arab Republic of Egypt into a new modern market characterized by transparency, credibility and high quality, as the company seeks to provide integrated and reliable services to consumers and improve the quality of services received by customers in this market. The company works to improve the process of purchasing cars by providing various and distinctive services, such as evaluating cars, checking their condition, and providing maintenance and repair services. The company also seeks to expand its scope of work and provide its services throughout the Arab Republic of Egypt.<\\/p>\\r\\n\\r\\n<p>The automobile is your perfect guide to choosing the car that suits you at the best price in minutes, whether buying or selling, even if you do not know anything about the world of cars.<\\/p>\\r\\n\\r\\n<p><strong>Our vision<\\/strong>: Providing high-level service that reaches international standards<\\/p>\\r\\n\\r\\n<p><strong>Our message<\\/strong>: The guest&#39;s first<\\/p>\\r\\n\\r\\n<p><strong>Our values<\\/strong>: Commitment to quality in providing service - Commitment to global, ethical, and social rules of conduct<\\/p>\\r\\n\\r\\n<p><strong>Our strategy<\\/strong>: Continuous development to maintain a commitment to providing service that exceeds guest expectations.<\\/p>\\r\\n\\r\\n<p><span style=\\\"font-size:18px\\\"><strong>Features of Automobile<\\/strong>&nbsp;:<\\/span><\\/p>\\r\\n\\r\\n<p>Ease of purchasing your car online from your phone<\\/p>\\r\\n\\r\\n<p>Complete all car purchasing procedures on your behalf and effortlessly<\\/p>\\r\\n\\r\\n<p>Car inspection with more than 200 points<\\/p>\\r\\n\\r\\n<p>Full year warranty<\\/p>\",\"ar\":\"<p><strong>\\u0639\\u0646 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644&nbsp;<\\/strong><\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\">\\u0646\\u062d\\u0646 &ldquo;\\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 &ldquo;\\u060c \\u0646\\u0642\\u062f\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0628\\u064a\\u0639 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0627\\u0644\\u0645\\u0636\\u0645\\u0648\\u0646\\u0629 \\u0627\\u0644\\u0645\\u0633\\u062a\\u0639\\u0645\\u0644\\u0629 \\u0648\\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0629 \\u0628\\u0637\\u0631\\u064a\\u0642\\u0629 \\u0633\\u0647\\u0644\\u0629&nbsp;\\u0648 \\u0645\\u0631\\u064a\\u062d\\u0629\\u060c \\u062d\\u064a\\u062b \\u064a\\u0645\\u0643\\u0646\\u0643 \\u0627\\u0644\\u0628\\u062d\\u062b \\u0648\\u0627\\u0644\\u0628\\u064a\\u0639 \\u0648\\u0627\\u0644\\u0634\\u0631\\u0627\\u0621 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0645\\u0648\\u0642\\u0639\\u0646\\u0627 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a \\u0648 \\u062a\\u0637\\u0628\\u064a\\u0642\\u0646\\u0627 \\u0639\\u0644\\u0649 \\u0647\\u0627\\u062a\\u0641\\u0643\\u060c \\u0648\\u0646\\u063a\\u0637\\u064a \\u062c\\u0645\\u064a\\u0639 \\u0645\\u0646\\u0627\\u0637\\u0642 \\u062c\\u0645\\u0647\\u0648\\u0631\\u064a\\u0629 \\u0645\\u0635\\u0631 \\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629 .<\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\">\\u062a\\u062a\\u0645\\u062b\\u0644 \\u0623\\u0647\\u062f\\u0627\\u0641 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0641\\u064a \\u062a\\u062d\\u0648\\u064a\\u0644 \\u0633\\u0648\\u0642 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0628\\u0634\\u0643\\u0644 \\u0639\\u0627\\u0645 \\u0633\\u0648\\u0627\\u0621&nbsp; \\u0627\\u0644\\u0645\\u0633\\u062a\\u0639\\u0645\\u0644\\u0629 \\u0627\\u0648 \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0629&nbsp; \\u0641\\u064a \\u062c\\u0645\\u0647\\u0648\\u0631\\u064a\\u0629 \\u0645\\u0635\\u0631 \\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629 \\u0625\\u0644\\u0649 \\u0633\\u0648\\u0642 \\u0639\\u0635\\u0631\\u064a \\u062c\\u062f\\u064a\\u062f \\u064a\\u062a\\u0645\\u064a\\u0632 \\u0628\\u0627\\u0644\\u0634\\u0641\\u0627\\u0641\\u064a\\u0629 \\u0648\\u0627\\u0644\\u0645\\u0635\\u062f\\u0627\\u0642\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062c\\u0648\\u062f\\u0629 \\u0627\\u0644\\u0639\\u0627\\u0644\\u064a\\u0629\\u060c \\u062d\\u064a\\u062b \\u062a\\u0633\\u0639\\u0649 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0644\\u062a\\u0648\\u0641\\u064a\\u0631 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0645\\u062a\\u0643\\u0627\\u0645\\u0644\\u0629 \\u0648\\u0645\\u0648\\u062b\\u0648\\u0642\\u0629 \\u0644\\u0644\\u0645\\u0633\\u062a\\u0647\\u0644\\u0643\\u064a\\u0646 \\u0648\\u062a\\u062d\\u0633\\u064a\\u0646 \\u062c\\u0648\\u062f\\u0629 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u062a\\u064a \\u064a\\u062a\\u0644\\u0642\\u0627\\u0647\\u0627 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0641\\u064a \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0633\\u0648\\u0642. \\u0648\\u062a\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0639\\u0644\\u0649 \\u062a\\u062d\\u0633\\u064a\\u0646 \\u0639\\u0645\\u0644\\u064a\\u0629 \\u0634\\u0631\\u0627\\u0621 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a&nbsp; \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u062a\\u0648\\u0641\\u064a\\u0631 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0645\\u062a\\u0646\\u0648\\u0639\\u0629 \\u0648\\u0645\\u0645\\u064a\\u0632\\u0629\\u060c \\u0645\\u062b\\u0644 \\u062a\\u0642\\u064a\\u064a\\u0645 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0648\\u0627\\u0644\\u062a\\u062d\\u0642\\u0642 \\u0645\\u0646 \\u062d\\u0627\\u0644\\u062a\\u0647\\u0627 \\u0648\\u062a\\u0648\\u0641\\u064a\\u0631 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u0635\\u064a\\u0627\\u0646\\u0629 \\u0648\\u0627\\u0644\\u0625\\u0635\\u0644\\u0627\\u062d\\u060c \\u0643\\u0645\\u0627 \\u062a\\u0633\\u0639\\u0649 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0644\\u062a\\u0648\\u0633\\u064a\\u0639 \\u0646\\u0637\\u0627\\u0642 \\u0639\\u0645\\u0644\\u0647\\u0627 \\u0648\\u062a\\u0648\\u0641\\u064a\\u0631 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0647\\u0627 \\u0641\\u064a \\u062c\\u0645\\u064a\\u0639 \\u0623\\u0646\\u062d\\u0627\\u0621 \\u062c\\u0645\\u0647\\u0648\\u0631\\u064a\\u0629 \\u0645\\u0635\\u0631 \\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629.<\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\">\\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0647\\u0648 \\u062f\\u0644\\u064a\\u0644\\u0643 \\u0627\\u0644\\u0623\\u0645\\u062b\\u0644 \\u0644\\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0627\\u0644\\u062a\\u064a \\u062a\\u0646\\u0627\\u0633\\u0628\\u0643 \\u0628\\u0623\\u0641\\u0636\\u0644 \\u0627\\u0644\\u0623\\u0633\\u0639\\u0627\\u0631 \\u0641\\u064a \\u062f\\u0642\\u0627\\u0626\\u0642 \\u0633\\u0648\\u0627\\u0621 \\u0628\\u064a\\u0639 \\u0623\\u0648 \\u0634\\u0631\\u0627\\u0621 \\u062d\\u062a\\u0649 \\u0644\\u0648 \\u0643\\u0646\\u062a \\u0644\\u0627 \\u062a\\u0639\\u0631\\u0641 \\u0634\\u064a\\u0626\\u0627\\u064b \\u0641\\u064a \\u0639\\u0627\\u0644\\u0645 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a.<\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\"><strong>\\u0631\\u0624\\u064a\\u062a\\u0646\\u0627<\\/strong> : \\u062a\\u0642\\u062f\\u064a\\u0645 \\u062e\\u062f\\u0645\\u0629 \\u0631\\u0641\\u064a\\u0639\\u0629 \\u0627\\u0644\\u0645\\u0633\\u062a\\u0648\\u0649 \\u062a\\u0635\\u0644 \\u0644\\u0644\\u0645\\u0633\\u062a\\u0648\\u064a\\u0627\\u062a \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645\\u064a\\u0629<\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\"><strong>\\u0631\\u0633\\u0627\\u0644\\u062a\\u0646\\u0627<\\/strong> : \\u0627\\u0644\\u0636\\u064a\\u0641 \\u0627\\u0648\\u0644\\u0627\\u064b&nbsp;<\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\"><strong>\\u0642\\u064a\\u0645\\u0646\\u0627<\\/strong> : \\u0627\\u0644\\u0627\\u0644\\u062a\\u0632\\u0627\\u0645 \\u0628\\u0627\\u0644\\u062c\\u0648\\u062f\\u0629 \\u0641\\u064a \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0629 - \\u0627\\u0644\\u0627\\u0644\\u062a\\u0632\\u0627\\u0645 \\u0628\\u0642\\u0648\\u0627\\u0639\\u062f \\u0627\\u0644\\u0633\\u0644\\u0648\\u0643 \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645\\u064a\\u0629 \\u0648\\u0627\\u0644\\u0627\\u062e\\u0644\\u0627\\u0642\\u064a\\u0647 \\u0648\\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a\\u0647&nbsp;<\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\"><strong>\\u0627\\u0633\\u062a\\u0631\\u0627\\u062a\\u064a\\u062c\\u064a\\u062a\\u0646\\u0627<\\/strong> : \\u0627\\u0644\\u062a\\u0637\\u0648\\u064a\\u0631 \\u0627\\u0644\\u0645\\u0633\\u062a\\u0645\\u0631 \\u0644\\u0644\\u062d\\u0641\\u0627\\u0638 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0627\\u0644\\u062a\\u0632\\u0627\\u0645 \\u0628\\u062a\\u0642\\u062f\\u064a\\u0645 \\u062e\\u062f\\u0645\\u0629 \\u062a\\u0641\\u0648\\u0642 \\u062a\\u0648\\u0642\\u0639\\u0627\\u062a \\u0627\\u0644\\u0636\\u064a\\u0648\\u0641.<\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\"><strong>\\u0645\\u0645\\u064a\\u0632\\u0627\\u062a \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 :<\\/strong><\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\">-\\u0633\\u0647\\u0648\\u0644\\u0629 \\u0634\\u0631\\u0627\\u0621 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643 \\u0627\\u0648\\u0646\\u0644\\u0627\\u064a\\u0646 \\u0645\\u0646 \\u0647\\u0627\\u062a\\u0641\\u0643<\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\">-\\u0625\\u062a\\u0645\\u0627\\u0645 \\u0643\\u0627\\u0641\\u0629 \\u0625\\u062c\\u0631\\u0627\\u0621\\u0627\\u062a \\u0634\\u0631\\u0627\\u0621 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0639\\u0646\\u0643 \\u0648\\u0628\\u062f\\u0648\\u0646 \\u062c\\u0647\\u062f<\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\">-\\u0641\\u062d\\u0635 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0628\\u0623\\u0643\\u062b\\u0631 \\u0645\\u0646 200 \\u0646\\u0642\\u0637\\u0629<\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\">-\\u0636\\u0645\\u0627\\u0646 \\u0633\\u0646\\u0629 \\u0643\\u0627\\u0645\\u0644\\u0629<\\/p>\"}', 'about-us', 1, '2023-07-17 17:07:21', '2023-09-11 10:38:43'),
(5, '{\"en\":\"Terms And Conditions\",\"ar\":\"\\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0648\\u0627\\u0644\\u0627\\u062d\\u0643\\u0627\\u0645\"}', '{\"en\":\"<p style=\\\"text-align:justify\\\"><span style=\\\"font-size:18px\\\">The goal of&nbsp; Automobile Company is to transform the car market in the Arab Republic of Egypt into a new modern market characterized by transparency, credibility, and high quality, as the company seeks to provide integrated and reliable services to consumers and improve the quality of services that customers receive in this market. The company works to improve the process of buying used cars by providing various and distinctive services, such as evaluating cars, checking their condition, and providing maintenance and repair services. The company also seeks to expand the scope of its work and provide its services throughout the Arab Republic of Egypt.<\\/span><\\/p>\\r\\n\\r\\n<p style=\\\"text-align:justify\\\"><span style=\\\"font-size:18px\\\">The content on the Automobile website comes from users and registered members of Automobile. Therefore, Automobile does not bear any responsibility for the added content, and the users bear all responsibility. Automobile plays a supervisory role over advertisements and content added by users in two ways, before adding (and does not include all advertisements), as some Advertisements do not appear on the site except with the approval of the site administration, and the second type, after addition, where advertisements appear on the site and are then monitored and corrected if necessary. Therefore, the member is not allowed to publish advertisements with content that violates the content policy of the Automelle website\\/application, whether on the website or on social media pages. Please note that such ads will be deleted directly by the site administrators. As an example, but not limited to:<\\/span><\\/p>\\r\\n\\r\\n<p style=\\\"text-align:justify\\\">Once you use any of the Automable Services, register or access your Automable account, or download and install our App, you agree to be bound by these Terms.<\\/p>\\r\\n\\r\\n<p style=\\\"text-align:justify\\\"><span style=\\\"font-size:18px\\\">You should read these Terms carefully before registering an account or using any of the Services and determine whether these Terms and the Services are appropriate to your personal and financial circumstances.<\\/span><\\/p>\\r\\n\\r\\n<p style=\\\"text-align:justify\\\"><span style=\\\"font-size:18px\\\">You should retain a printed copy of these Terms for later reference. If you do not agree to these Terms, or if these Terms and the Services are not suitable for your personal and financial circumstances, you must discontinue use of the Services at the time and request to close your account.<\\/span><\\/p>\\r\\n\\r\\n<p style=\\\"text-align:justify\\\"><span style=\\\"font-size:18px\\\">Automobile reserves the right to change these terms at any time without prior notice to you. Such modifications may be made by updating the App and the Website to include any new or amended terms. Note that the aforementioned amendments will not apply to any purchase made using our services prior to the date of publication of any new or amended terms unless we notify you in advance with a written notice. Accordingly, you, as a user, are responsible for regularly following the information published on our application or website to be aware of the modifications that occur to these terms. Your continued use of the Services following the posting of modifications automatically means your acceptance of the modified terms.<\\/span><\\/p>\",\"ar\":\"<p dir=\\\"rtl\\\" style=\\\"list-style-type:disc; text-align:justify\\\"><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u062a\\u062a\\u0645\\u062b\\u0644 \\u0623\\u0647\\u062f\\u0627\\u0641 \\u0634\\u0631\\u0643\\u0629 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0641\\u064a \\u062a\\u062d\\u0648\\u064a\\u0644 \\u0633\\u0648\\u0642 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a&nbsp; \\u0641\\u064a \\u062c\\u0645\\u0647\\u0648\\u0631\\u064a\\u0629 \\u0645\\u0635\\u0631 \\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629 \\u0625\\u0644\\u0649 \\u0633\\u0648\\u0642 \\u0639\\u0635\\u0631\\u064a \\u062c\\u062f\\u064a\\u062f \\u064a\\u062a\\u0645\\u064a\\u0632 \\u0628\\u0627\\u0644\\u0634\\u0641\\u0627\\u0641\\u064a\\u0629 \\u0648\\u0627\\u0644\\u0645\\u0635\\u062f\\u0627\\u0642\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062c\\u0648\\u062f\\u0629 \\u0627\\u0644\\u0639\\u0627\\u0644\\u064a\\u0629\\u060c \\u062d\\u064a\\u062b \\u062a\\u0633\\u0639\\u0649 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0644\\u062a\\u0648\\u0641\\u064a\\u0631 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0645\\u062a\\u0643\\u0627\\u0645\\u0644\\u0629 \\u0648\\u0645\\u0648\\u062b\\u0648\\u0642\\u0629 \\u0644\\u0644\\u0645\\u0633\\u062a\\u0647\\u0644\\u0643\\u064a\\u0646 \\u0648\\u062a\\u062d\\u0633\\u064a\\u0646 \\u062c\\u0648\\u062f\\u0629 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u062a\\u064a \\u064a\\u062a\\u0644\\u0642\\u0627\\u0647\\u0627 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0641\\u064a \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0633\\u0648\\u0642. \\u0648\\u062a\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0639\\u0644\\u0649 \\u062a\\u062d\\u0633\\u064a\\u0646 \\u0639\\u0645\\u0644\\u064a\\u0629 \\u0634\\u0631\\u0627\\u0621 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0627\\u0644\\u0645\\u0633\\u062a\\u0639\\u0645\\u0644\\u0629 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u062a\\u0648\\u0641\\u064a\\u0631 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0645\\u062a\\u0646\\u0648\\u0639\\u0629 \\u0648\\u0645\\u0645\\u064a\\u0632\\u0629\\u060c \\u0645\\u062b\\u0644 \\u062a\\u0642\\u064a\\u064a\\u0645 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0648\\u0627\\u0644\\u062a\\u062d\\u0642\\u0642 \\u0645\\u0646 \\u062d\\u0627\\u0644\\u062a\\u0647\\u0627 \\u0648\\u062a\\u0648\\u0641\\u064a\\u0631 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u0635\\u064a\\u0627\\u0646\\u0629 \\u0648\\u0627\\u0644\\u0625\\u0635\\u0644\\u0627\\u062d\\u060c \\u0643\\u0645\\u0627 \\u062a\\u0633\\u0639\\u0649 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0644\\u062a\\u0648\\u0633\\u064a\\u0639 \\u0646\\u0637\\u0627\\u0642 \\u0639\\u0645\\u0644\\u0647\\u0627 \\u0648\\u062a\\u0648\\u0641\\u064a\\u0631 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0647\\u0627 \\u0641\\u064a \\u062c\\u0645\\u064a\\u0639 \\u0623\\u0646\\u062d\\u0627\\u0621 \\u062c\\u0645\\u0647\\u0648\\u0631\\u064a\\u0629 \\u0645\\u0635\\u0631 \\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629.<\\/span><\\/span><\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\" style=\\\"list-style-type:disc; text-align:justify\\\"><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u0627\\u0644\\u0645\\u062d\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0645\\u0648\\u062c\\u0648\\u062f \\u0639\\u0644\\u0649 \\u0645\\u0648\\u0642\\u0639 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0646\\u0627\\u0628\\u0639 \\u0645\\u0646 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u064a\\u0646 \\u0648\\u0627\\u0644\\u0623\\u0639\\u0636\\u0627\\u0621 \\u0627\\u0644\\u0645\\u0633\\u062c\\u0644\\u064a\\u0646 \\u0641\\u064a \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0648\\u0628\\u0627\\u0644\\u062a\\u0627\\u0644\\u064a \\u0644\\u0627 \\u064a\\u062a\\u062d\\u0645\\u0644 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0627\\u064a \\u0645\\u0633\\u0624\\u0648\\u0644\\u064a\\u0629 \\u0639\\u0646 \\u0627\\u0644\\u0645\\u062d\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0645\\u064f\\u0636\\u0627\\u0641 \\u0648\\u064a\\u062a\\u062d\\u0645\\u0644 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u064a\\u0646 \\u0643\\u0627\\u0641\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0624\\u0648\\u0644\\u064a\\u0629.\\u064a\\u0642\\u0648\\u0645 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0628\\u062f\\u0648\\u0631 \\u0631\\u0642\\u0627\\u0628\\u064a \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0625\\u0639\\u0644\\u0627\\u0646\\u0627\\u062a \\u0648\\u0627\\u0644\\u0645\\u062d\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0645\\u064f\\u0636\\u0627\\u0641 \\u0645\\u0646 \\u0642\\u0628\\u0644 \\u0627\\u0644\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u064a\\u0646 \\u0628\\u0637\\u0631\\u064a\\u0642\\u062a\\u064a\\u0646\\u060c \\u0642\\u0628\\u0644 \\u0627\\u0644\\u0625\\u0636\\u0627\\u0641\\u0629 (\\u0648\\u0644\\u0627 \\u062a\\u0634\\u0645\\u0644 \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0625\\u0639\\u0644\\u0627\\u0646\\u0627\\u062a) \\u062d\\u064a\\u062b \\u0627\\u0646 \\u0628\\u0639\\u0636 \\u0627\\u0644\\u0627\\u0639\\u0644\\u0627\\u0646\\u0627\\u062a \\u0644\\u0627 \\u062a\\u0638\\u0647\\u0631 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0625\\u0644\\u0627 \\u0628\\u0645\\u0648\\u0627\\u0641\\u0642\\u0629 \\u0625\\u062f\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639\\u060c \\u0648\\u0627\\u0644\\u0646\\u0648\\u0639 \\u0627\\u0644\\u062b\\u0627\\u0646\\u064a\\u060c \\u0628\\u0639\\u062f \\u0627\\u0644\\u0625\\u0636\\u0627\\u0641\\u0629\\u060c \\u062d\\u064a\\u062b \\u062a\\u0638\\u0647\\u0631 \\u0627\\u0644\\u0625\\u0639\\u0644\\u0627\\u0646\\u0627\\u062a \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0648\\u0645\\u0646 \\u062b\\u0645 \\u064a\\u062a\\u0645 \\u0645\\u0631\\u0627\\u0642\\u0628\\u062a\\u0647\\u0627 \\u0648\\u062a\\u0635\\u062d\\u064a\\u062d\\u0647\\u0627 \\u0625\\u0646 \\u0644\\u0632\\u0645 \\u0627\\u0644\\u0623\\u0645\\u0631. \\u0648\\u0644\\u0630\\u0644\\u0643\\u060c \\u0644\\u0627 \\u064a\\u0633\\u0645\\u062d \\u0644\\u0644\\u0639\\u0636\\u0648 \\u0628\\u0646\\u0634\\u0631 \\u0625\\u0639\\u0644\\u0627\\u0646\\u0627\\u062a \\u0628\\u0645\\u062d\\u062a\\u0648\\u0649 \\u0645\\u064f\\u062e\\u0627\\u0644\\u0641 \\u0644\\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u0645\\u062d\\u062a\\u0648\\u0649 \\u0645\\u0648\\u0642\\u0639\\/ \\u062a\\u0637\\u0628\\u064a\\u0642 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0633\\u0648\\u0627\\u0621 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a \\u0623\\u0648 \\u0639\\u0644\\u0649 \\u0635\\u0641\\u062d\\u0627\\u062a \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0627\\u0644\\u0625\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a. \\u0645\\u0639 \\u0627\\u0644\\u0639\\u0644\\u0645 \\u0625\\u0646 \\u0645\\u062b\\u0644 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0625\\u0639\\u0644\\u0627\\u0646\\u0627\\u062a \\u0633\\u0648\\u0641 \\u064a\\u062a\\u0645 \\u062d\\u0630\\u0641\\u0647\\u0627 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629 \\u0645\\u0646 \\u0642\\u0628\\u0644 \\u0645\\u0633\\u0624\\u0648\\u0644\\u064a \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639. \\u0648\\u0643\\u0645\\u062b\\u0627\\u0644 \\u0639\\u0644\\u064a\\u0647\\u0627 \\u0644\\u0627 \\u0644\\u0644\\u062d\\u0635\\u0631:<\\/span><\\/span><\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\" style=\\\"list-style-type:decimal; text-align:justify\\\"><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u0628\\u0645\\u062c\\u0631\\u062f \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0643 \\u0644\\u0623\\u064a \\u0645\\u0646 \\u062e\\u062f\\u0645\\u0627\\u062a &quot;\\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644&quot;\\u060c \\u0623\\u0648 \\u062a\\u0633\\u062c\\u064a\\u0644 \\u062d\\u0633\\u0627\\u0628\\u0643 \\u0639\\u0644\\u0649 &quot;\\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644&quot; \\u0623\\u0648 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644 \\u0625\\u0644\\u064a\\u0647\\u060c \\u0623\\u0648 \\u062a\\u0646\\u0632\\u064a\\u0644 \\u062a\\u0637\\u0628\\u064a\\u0642\\u0646\\u0627 \\u0648\\u062a\\u062b\\u0628\\u064a\\u062a\\u0647 \\u060c \\u0641\\u0625\\u0646\\u0643 \\u062a\\u0648\\u0627\\u0641\\u0642 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0627\\u0644\\u062a\\u0632\\u0627\\u0645 \\u0628\\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637.<\\/span><\\/span><\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\" style=\\\"list-style-type:decimal; text-align:justify\\\"><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u064a\\u062c\\u0628 \\u0642\\u0631\\u0627\\u0621\\u0629 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0628\\u0639\\u0646\\u0627\\u064a\\u0629 \\u0642\\u0628\\u0644 \\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062d\\u0633\\u0627\\u0628 \\u0623\\u0648 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0623\\u064a \\u0645\\u0646 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0648\\u062a\\u062d\\u062f\\u064a\\u062f \\u0645\\u0627 \\u0625\\u0630\\u0627 \\u0643\\u0627\\u0646\\u062a \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0648\\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u062a\\u062a\\u0646\\u0627\\u0633\\u0628 \\u0645\\u0639 \\u0638\\u0631\\u0648\\u0641\\u0643 \\u0627\\u0644\\u0634\\u062e\\u0635\\u064a\\u0629 \\u0648\\u0627\\u0644\\u0645\\u0627\\u062f\\u064a\\u0629.<\\/span><\\/span><\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\" style=\\\"list-style-type:decimal; text-align:justify\\\"><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u064a\\u062c\\u0628 \\u0627\\u0644\\u0627\\u062d\\u062a\\u0641\\u0627\\u0638 \\u0628\\u0646\\u0633\\u062e\\u0629 \\u0645\\u0637\\u0628\\u0648\\u0639\\u0629 \\u0645\\u0646 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0644\\u0644\\u0631\\u062c\\u0648\\u0639 \\u0625\\u0644\\u064a\\u0647\\u0627 \\u0644\\u0627\\u062d\\u0642\\u0627. \\u0625\\u0630\\u0627 \\u0643\\u0646\\u062a \\u0644\\u0627 \\u062a\\u0648\\u0627\\u0641\\u0642 \\u0639\\u0644\\u0649 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u060c \\u0623\\u0648 \\u0625\\u0630\\u0627 \\u0643\\u0627\\u0646\\u062a \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0648\\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u063a\\u064a\\u0631 \\u0645\\u0646\\u0627\\u0633\\u0628\\u0629 \\u0644\\u0638\\u0631\\u0648\\u0641\\u0643 \\u0627\\u0644\\u0634\\u062e\\u0635\\u064a\\u0629 \\u0648\\u0627\\u0644\\u0645\\u0627\\u062f\\u064a\\u0629\\u060c \\u064a\\u062c\\u0628 \\u0639\\u0644\\u064a\\u0643 \\u0627\\u0644\\u062a\\u0648\\u0642\\u0641 \\u0639\\u0646 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0641\\u064a \\u062d\\u064a\\u0646\\u0647 \\u0648\\u0637\\u0644\\u0628 \\u0625\\u063a\\u0644\\u0627\\u0642 \\u062d\\u0633\\u0627\\u0628\\u0643.<\\/span><\\/span><\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\" style=\\\"list-style-type:decimal; text-align:justify\\\"><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u064a\\u062d\\u062a\\u0641\\u0638 &quot;\\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644&quot; \\u0628\\u0627\\u0644\\u062d\\u0642 \\u0641\\u064a \\u062a\\u063a\\u064a\\u064a\\u0631 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0641\\u064a \\u0623\\u064a \\u0648\\u0642\\u062a \\u062f\\u0648\\u0646 \\u0627\\u0644\\u062d\\u0627\\u062c\\u0629 \\u0644\\u0625\\u0639\\u0644\\u0627\\u0645\\u0643 \\u0628\\u0630\\u0644\\u0643 \\u0645\\u0633\\u0628\\u0642\\u0627. \\u0642\\u062f \\u062a\\u062a\\u0645 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u062a\\u0639\\u062f\\u064a\\u0644\\u0627\\u062a \\u0639\\u0646 \\u0637\\u0631\\u064a\\u0642 \\u062a\\u062d\\u062f\\u064a\\u062b \\u0627\\u0644\\u062a\\u0637\\u0628\\u064a\\u0642 \\u0648\\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a \\u0644\\u062a\\u0636\\u0645\\u064a\\u0646 \\u0623\\u064a \\u0634\\u0631\\u0648\\u0637 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0623\\u0648 \\u0645\\u0639\\u062f\\u0644\\u0629. \\u0639\\u0644\\u0645\\u0627 \\u0628\\u0623\\u0646 \\u0627\\u0644\\u062a\\u0639\\u062f\\u064a\\u0644\\u0627\\u062a \\u0627\\u0644\\u0645\\u0630\\u0643\\u0648\\u0631\\u0629 \\u0644\\u0646 \\u062a\\u0646\\u0637\\u0628\\u0642 \\u0639\\u0644\\u0649 \\u0623\\u064a \\u0639\\u0645\\u0644\\u064a\\u0629 \\u0634\\u0631\\u0627\\u0621 \\u062a\\u0645\\u062a \\u0628\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0646\\u0627 \\u0642\\u0628\\u0644 \\u062a\\u0627\\u0631\\u064a\\u062e \\u0646\\u0634\\u0631 \\u0623\\u064a \\u0634\\u0631\\u0648\\u0637 \\u062c\\u062f\\u064a\\u062f\\u0629 \\u0623\\u0648 \\u0645\\u0639\\u062f\\u0644\\u0629 \\u0645\\u0627 \\u0644\\u0645 \\u0646\\u0642\\u0645 \\u0628\\u0625\\u0639\\u0644\\u0627\\u0645\\u0643 \\u0645\\u0633\\u0628\\u0642\\u0627 \\u0628\\u0625\\u0634\\u0639\\u0627\\u0631 \\u0645\\u0643\\u062a\\u0648\\u0628. \\u0648\\u0639\\u0644\\u064a\\u0647 \\u0641\\u0625\\u0646\\u0643 \\u0643\\u0645\\u0633\\u062a\\u062e\\u062f\\u0645 \\u0645\\u0633\\u0624\\u0648\\u0644 \\u0639\\u0646 \\u0645\\u062a\\u0627\\u0628\\u0639\\u0629 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u0645\\u0646\\u0634\\u0648\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u062a\\u0637\\u0628\\u064a\\u0642\\u0646\\u0627 \\u0623\\u0648 \\u0645\\u0648\\u0642\\u0639\\u0646\\u0627 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a \\u0628\\u0627\\u0646\\u062a\\u0638\\u0627\\u0645 \\u0644\\u0644\\u0627\\u0637\\u0644\\u0627\\u0639 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u062f\\u064a\\u0644\\u0627\\u062a \\u0627\\u0644\\u062a\\u064a \\u062a\\u0637\\u0631\\u0623 \\u0639\\u0644\\u0649 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637. \\u0625\\u0646 \\u0627\\u0633\\u062a\\u0645\\u0631\\u0627\\u0631 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0643 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0628\\u0639\\u062f \\u0646\\u0634\\u0631 \\u0627\\u0644\\u062a\\u0639\\u062f\\u064a\\u0644\\u0627\\u062a \\u064a\\u0639\\u0646\\u064a \\u062a\\u0644\\u0642\\u0627\\u0626\\u064a\\u0627 \\u0645\\u0648\\u0627\\u0641\\u0642\\u062a\\u0643 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0627\\u0644\\u0645\\u0639\\u062f\\u0644\\u0629.<\\/span><\\/span><\\/p>\"}', 'terms-and-conditions', 1, '2023-07-17 17:07:21', '2023-09-13 11:36:10'),
(6, '{\"en\":\"Privacy Policy\",\"ar\":\"\\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629\"}', '{\"en\":\"<p style=\\\"text-align:justify\\\">Automobile website management is aware of your concern about the information we collect about you and your interest in how we use it. In order for you to be fully aware and informed, we place in your hands the Privacy Policy. We, in turn, appreciate your trust in us, which ensures that you deal with your information with care and confidence. By visiting the Automil website, you accept the matters contained in this statement:<\\/p>\\r\\n\\r\\n<p style=\\\"text-align:justify\\\">Automobile respects your privacy and is committed to protecting your personal data. This Privacy Policy governs our methods of processing, controlling, and storing the personal information you provide to us. We also inform you of your privacy rights in accordance with Egyptian privacy laws.<\\/p>\\r\\n\\r\\n<p style=\\\"text-align:justify\\\">By visiting our website, mobile application, or other online means operated by Autombil (hereinafter collectively referred to as the &ldquo;Site&rdquo;), providing information, and\\/or using our Services, you acknowledge that you expressly agree to the terms and conditions set out in the Privacy Policy. This is amazing. You also consent to the collection, use, storage, and processing of your personal data for the purposes specified in this privacy policy. You should review this Privacy Policy when using the Site to ensure that you agree to its terms. Reference to &ldquo;you&rdquo; or &ldquo;your&rdquo; includes any person accessing and using the Site and\\/or using its services. If you do not agree to this Privacy Policy, please do not use this site.<\\/p>\\r\\n\\r\\n<p style=\\\"text-align:justify\\\">Information about users of the Automobile website\\/application is an important part of our business, and we will not allow this information to be sold to others. However, only the information of Automobile website users is exchanged as described below:<\\/p>\\r\\n\\r\\n<p style=\\\"text-align:justify\\\">Adding an ad: When you add your ad through the Automobile website\\/application, you are asked to provide us with your contact information. This is to facilitate the communication process between the two parties (the owner of the advertisement and the person interested in it). Other than as indicated above, you will receive a warning when data is shared with a third party.<\\/p>\",\"ar\":\"<p dir=\\\"rtl\\\" style=\\\"text-align:justify\\\"><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u062a\\u064f\\u062f\\u0631\\u0643 \\u0625\\u062f\\u0627\\u0631\\u0629 \\u0645\\u0648\\u0642\\u0639 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u062d\\u0631\\u0635\\u0643 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u062a\\u064a \\u0646\\u062c\\u0645\\u0639\\u0647\\u0627 \\u0639\\u0646\\u0643 \\u0648\\u0627\\u0647\\u062a\\u0645\\u0627\\u0645\\u0643 \\u062d\\u064a\\u0627\\u0644 \\u0643\\u064a\\u0641\\u064a\\u0629 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0646\\u0627 \\u0644\\u0647\\u0627\\u060c \\u0648\\u0644\\u0643\\u064a \\u062a\\u0643\\u0648\\u0646 \\u0639\\u0644\\u0649 \\u0628\\u064a\\u0646\\u0629 \\u0648\\u0625\\u062f\\u0631\\u0627\\u0643 \\u0643\\u0627\\u0645\\u0644\\u060c \\u0646\\u0636\\u0639 \\u0628\\u064a\\u0646 \\u064a\\u062f\\u064a\\u0643 \\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629\\u060c \\u0648\\u0646\\u062d\\u0646 \\u0628\\u062f\\u0648\\u0631\\u0646\\u0627 \\u0646\\u0642\\u062f\\u0631 \\u062b\\u0642\\u062a\\u0643\\u0645 \\u0628\\u0646\\u0627 \\u0648\\u0627\\u0644\\u062a\\u064a \\u062a\\u0636\\u0645\\u0646 \\u0644\\u0643\\u0645 \\u0627\\u0644\\u062a\\u0639\\u0627\\u0645\\u0644 \\u0645\\u0639 \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a\\u0643\\u0645 \\u0628\\u0639\\u0646\\u0627\\u064a\\u0629 \\u0648\\u062b\\u0642\\u0629. \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0632\\u064a\\u0627\\u0631\\u062a\\u0643 \\u0644\\u0645\\u0648\\u0642\\u0639 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644&nbsp; \\u0623\\u0646\\u062a \\u062a\\u0642\\u0628\\u0644 \\u0627\\u0644\\u0623\\u0645\\u0648\\u0631 \\u0627\\u0644\\u0648\\u0627\\u0631\\u062f\\u0629 \\u0641\\u064a \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0628\\u064a\\u0627\\u0646:<\\/span><\\/span><\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\" style=\\\"text-align:justify\\\"><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644&nbsp; \\u064a\\u062d\\u062a\\u0631\\u0645 \\u062e\\u0635\\u0648\\u0635\\u064a\\u062a\\u0643 \\u0648\\u064a\\u0644\\u062a\\u0632\\u0645 \\u0628\\u062d\\u0645\\u0627\\u064a\\u0629 \\u0628\\u064a\\u0627\\u0646\\u0627\\u062a\\u0643 \\u0627\\u0644\\u0634\\u062e\\u0635\\u064a\\u0629. \\u062a\\u062d\\u0643\\u0645 \\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629 \\u0647\\u0630\\u0647 \\u0623\\u0633\\u0627\\u0644\\u064a\\u0628\\u0646\\u0627 \\u0641\\u064a \\u0645\\u0639\\u0627\\u0644\\u062c\\u0629\\u060c \\u0648\\u0627\\u0644\\u0633\\u064a\\u0637\\u0631\\u0629 \\u0639\\u0644\\u0649\\u060c \\u0648\\u062a\\u062e\\u0632\\u064a\\u0646 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u0634\\u062e\\u0635\\u064a\\u0629 \\u0627\\u0644\\u062a\\u064a \\u062a\\u0642\\u062f\\u0645\\u0648\\u0647\\u0627 \\u0644\\u0646\\u0627 \\u0643\\u0645\\u0627 \\u0646\\u0637\\u0644\\u0639\\u0643\\u0645 \\u0639\\u0644\\u0649 \\u062d\\u0642\\u0648\\u0642\\u0643\\u0645 \\u0627\\u0644\\u0645\\u062a\\u0639\\u0644\\u0642\\u0629 \\u0628\\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629 \\u0648\\u0641\\u0642\\u0627 \\u0644\\u0642\\u0648\\u0627\\u0646\\u064a\\u0646 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629 \\u0627\\u0644\\u0645\\u0635\\u0631\\u064a\\u0629.<\\/span><\\/span><\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\" style=\\\"text-align:justify\\\"><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u0644\\u062f\\u0649 \\u0632\\u064a\\u0627\\u0631\\u062a\\u0643 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0646\\u0627 \\u0623\\u0648 \\u062a\\u0637\\u0628\\u064a\\u0642 \\u0627\\u0644\\u0647\\u0627\\u062a\\u0641 \\u0627\\u0644\\u0645\\u062d\\u0645\\u0648\\u0644 \\u0623\\u0648 \\u0623\\u064a \\u0648\\u0633\\u0627\\u0626\\u0644 \\u0623\\u062e\\u0631\\u0649 \\u0639\\u0628\\u0631 \\u0627\\u0644\\u0625\\u0646\\u062a\\u0631\\u0646\\u062a \\u064a\\u062f\\u064a\\u0631\\u0647\\u0627 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644&nbsp; (\\u0648\\u064a\\u0634\\u0627\\u0631 \\u0625\\u0644\\u064a\\u0647\\u0645 \\u0641\\u064a\\u0645\\u0627 \\u0628\\u0639\\u062f \\u0645\\u062c\\u062a\\u0645\\u0639\\u064a\\u0646 \\u0628\\u0640&rdquo;\\u0627\\u0644\\u0645\\u0648\\u0642\\u0639&rdquo;)\\u060c \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0648\\/\\u0623\\u0648 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0646\\u0627\\u060c \\u0641\\u0625\\u0646\\u0643 \\u062a\\u0642\\u0631 \\u0628\\u0623\\u0646\\u0643 \\u062a\\u0648\\u0627\\u0641\\u0642 \\u0635\\u0631\\u0627\\u062d\\u0629\\u064b \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637 \\u0648\\u0627\\u0644\\u0623\\u062d\\u0643\\u0627\\u0645 \\u0627\\u0644\\u0645\\u062d\\u062f\\u062f\\u0629 \\u0641\\u064a \\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629 \\u0647\\u0630\\u0647. \\u0643\\u0645\\u0627 \\u062a\\u0648\\u0627\\u0641\\u0642 \\u0639\\u0644\\u0649 \\u062c\\u0645\\u0639\\u060c \\u0648\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u060c \\u0648\\u062a\\u062e\\u0632\\u064a\\u0646 \\u0648\\u0645\\u0639\\u0627\\u0644\\u062c\\u0629 \\u0628\\u064a\\u0627\\u0646\\u0627\\u062a\\u0643 \\u0627\\u0644\\u0634\\u062e\\u0635\\u064a\\u0629 \\u0644\\u0644\\u0623\\u063a\\u0631\\u0627\\u0636 \\u0627\\u0644\\u0645\\u062d\\u062f\\u062f\\u0629 \\u0641\\u064a \\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629 \\u0647\\u0630\\u0647. \\u064a\\u062c\\u0628 \\u0639\\u0644\\u064a\\u0643 \\u0645\\u0631\\u0627\\u062c\\u0639\\u0629 \\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629 \\u0647\\u0630\\u0647 \\u0639\\u0646\\u062f \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0644\\u0636\\u0645\\u0627\\u0646 \\u0645\\u0648\\u0627\\u0641\\u0642\\u062a\\u0643 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0623\\u062d\\u0643\\u0627\\u0645 \\u0627\\u0644\\u0648\\u0627\\u0631\\u062f\\u0629 \\u0628\\u0647\\u0627. \\u0627\\u0644\\u0625\\u0634\\u0627\\u0631\\u0629 \\u0625\\u0644\\u0649 &rdquo;\\u0623\\u0646\\u062a&rdquo; \\u0623\\u0648 &rdquo;\\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0643&rdquo; \\u062a\\u0634\\u0645\\u0644 \\u0623\\u064a \\u0634\\u062e\\u0635 \\u064a\\u0642\\u0648\\u0645 \\u0628\\u0627\\u0644\\u062f\\u062e\\u0648\\u0644 \\u0648\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0648\\/\\u0623\\u0648 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0647. \\u0625\\u0630\\u0627 \\u0643\\u0646\\u062a \\u0644\\u0627 \\u062a\\u0648\\u0627\\u0641\\u0642 \\u0639\\u0644\\u0649 \\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629 \\u0647\\u0630\\u0647\\u060c \\u064a\\u0631\\u062c\\u0649 \\u0639\\u062f\\u0645 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639.<\\/span><\\/span><\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\" style=\\\"text-align:justify\\\"><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0639\\u0646 \\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u064a \\u0645\\u0648\\u0642\\u0639 \\/ \\u062a\\u0637\\u0628\\u064a\\u0642 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0647\\u0648 \\u062c\\u0632\\u0621 \\u0645\\u0647\\u0645 \\u0645\\u0646 \\u0639\\u0645\\u0644\\u0646\\u0627\\u060c \\u0648\\u0644\\u0646 \\u0646\\u0633\\u0645\\u062d \\u0628\\u0628\\u064a\\u0639 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0644\\u0644\\u0622\\u062e\\u0631\\u064a\\u0646. \\u0648\\u0644\\u0643\\u0646 \\u0641\\u0642\\u0637 \\u064a\\u062a\\u0645 \\u062a\\u0628\\u0627\\u062f\\u0644 \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u064a \\u0645\\u0648\\u0642\\u0639 \\u0626\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0641\\u0642\\u0637 \\u0643\\u0645\\u0627 \\u0647\\u0648 \\u0645\\u0648\\u0636\\u062d \\u0623\\u062f\\u0646\\u0627\\u0647:<\\/span><\\/span><\\/p>\\r\\n\\r\\n<p dir=\\\"rtl\\\" style=\\\"text-align:justify\\\"><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u0625\\u0636\\u0627\\u0641\\u0629 \\u0625\\u0639\\u0644\\u0627\\u0646 : \\u0639\\u0646\\u062f \\u0625\\u0636\\u0627\\u0641\\u0629 \\u0625\\u0639\\u0644\\u0627\\u0646\\u0643 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0645\\u0648\\u0642\\u0639 \\/ \\u062a\\u0637\\u0628\\u064a\\u0642 \\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0641\\u0625\\u0646\\u0647 \\u064a\\u0637\\u0644\\u0628 \\u0645\\u0646\\u0643 \\u0623\\u0646 \\u062a\\u0642\\u062f\\u0645 \\u0644\\u0646\\u0627 \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0627\\u0644\\u0627\\u062a\\u0635\\u0627\\u0644 \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0643. \\u0648\\u0630\\u0644\\u0643 \\u0644\\u062a\\u0633\\u0647\\u064a\\u0644 \\u0639\\u0645\\u0644\\u064a\\u0629 \\u0627\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0628\\u064a\\u0646 \\u0627\\u0644\\u0637\\u0631\\u0641\\u064a\\u0646 (\\u0635\\u0627\\u062d\\u0628 \\u0627\\u0644\\u0625\\u0639\\u0644\\u0627\\u0646\\u060c \\u0648\\u0627\\u0644\\u0645\\u0647\\u062a\\u0645 \\u0628\\u0647)\\u062e\\u0644\\u0627\\u0641 \\u0644\\u0645\\u0627 \\u0647\\u0648 \\u0645\\u0628\\u064a\\u0646 \\u0623\\u0639\\u0644\\u0627\\u0647 \\u060c \\u0633\\u0648\\u0641 \\u062a\\u062a\\u0644\\u0642\\u0649 \\u062a\\u062d\\u0630\\u064a\\u0631\\u0627 \\u0639\\u0646\\u062f \\u0645\\u0634\\u0627\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a \\u0645\\u0639 \\u0637\\u0631\\u0641 \\u062b\\u0627\\u0644\\u062b.<\\/span><\\/span><\\/p>\"}', 'privacy-policy', 1, '2023-07-17 17:07:21', '2023-09-13 11:39:15');
INSERT INTO `pages` (`id`, `name`, `content`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
(7, '{\r\n    \"ar\": \"سياسة البيع والشراء\",\r\n    \"en\": \"buying-and-selling-policy\"\r\n}', '{\"ar\":\"<ol dir=\\\"rtl\\\">\\r\\n\\t<li style=\\\"list-style-type: decimal; text-align: right;\\\">\\r\\n\\t<p><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0644\\u0627 \\u064a\\u0642\\u062f\\u0645 \\u0623\\u064a \\u0636\\u0645\\u0627\\u0646 \\u0645\\u0646 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0645\\u0635\\u0646\\u0639\\u0629 \\u0644\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0645\\u0633\\u062a\\u0639\\u0645\\u0644\\u0629. \\u0644\\u0643\\u0646 \\u0628\\u0627\\u0644\\u0646\\u0633\\u0628\\u0629 \\u0644\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0629 \\u060c \\u0641\\u0647\\u064a \\u062a\\u0623\\u062a\\u064a \\u0645\\u0639 \\u0636\\u0645\\u0627\\u0646 \\u0627\\u0644\\u0645\\u0635\\u0646\\u0639.<\\/span><\\/span><\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li style=\\\"list-style-type: decimal; text-align: right;\\\">\\r\\n\\t<p><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0627\\u0644\\u0645\\u0633\\u062a\\u0639\\u0645\\u0644\\u0629 \\u0627\\u0644\\u0645\\u0639\\u0631\\u0648\\u0636\\u0629 \\u0644\\u062f\\u064a\\u0646\\u0627 \\u0642\\u062f \\u062a\\u0643\\u0648\\u0646 \\u0645\\u0633\\u062a\\u062e\\u062f\\u0645\\u0629 \\u0643\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0645\\u0645\\u0644\\u0648\\u0643\\u0629 \\u0645\\u0646 \\u0639\\u062f\\u0629 \\u0645\\u0627\\u0644\\u0643\\u064a\\u0646. \\u0623\\u0648 \\u062a\\u0645 \\u0627\\u0633\\u062a\\u064a\\u0631\\u0627\\u062f\\u0647\\u0627 \\u0645\\u0646 \\u0628\\u0644\\u062f \\u0622\\u062e\\u0631. \\u0633\\u0646\\u0628\\u0630\\u0644 \\u062c\\u0647\\u0648\\u062f\\u064b\\u0627 \\u0645\\u0639\\u0642\\u0648\\u0644\\u0627\\u064b \\u0644\\u062a\\u0632\\u0648\\u064a\\u062f\\u0643 \\u0628\\u0623\\u064a \\u0645\\u0639\\u0644\\u0648\\u0645\\u0627\\u062a \\u0625\\u0636\\u0627\\u0641\\u064a\\u0629 \\u0628\\u062d\\u0648\\u0632\\u062a\\u0646\\u0627 \\u062d\\u0648\\u0644 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0628\\u0646\\u0627\\u0621\\u064b \\u0639\\u0644\\u0649 \\u0637\\u0644\\u0628\\u0643. \\u0648\\u0645\\u0639 \\u0630\\u0644\\u0643 \\u060c \\u0625\\u0630\\u0627 \\u0643\\u0627\\u0646\\u062a \\u0644\\u062f\\u064a\\u0643 \\u0623\\u064a \\u0623\\u0633\\u0626\\u0644\\u0629 \\u062d\\u0648\\u0644 \\u0627\\u0644\\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0633\\u0627\\u0628\\u0642 \\u0644\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0623\\u0648 \\u0644\\u062f\\u064a\\u0643 \\u0645\\u062a\\u0637\\u0644\\u0628\\u0627\\u062a \\u0645\\u062d\\u062f\\u062f\\u0629 \\u060c \\u0646\\u0646\\u0635\\u062d\\u0643 \\u0628\\u0645\\u0646\\u0627\\u0642\\u0634\\u0629 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0623\\u0633\\u0626\\u0644\\u0629 \\u0645\\u0639\\u0646\\u0627 \\u0642\\u0628\\u0644 \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0637\\u0644\\u0628\\u0643.<\\/span><\\/span><\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li style=\\\"list-style-type: decimal; text-align: right;\\\">\\r\\n\\t<p><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u0642\\u062f \\u064a\\u062e\\u062a\\u0644\\u0641 \\u0627\\u0644\\u0645\\u0633\\u0627\\u0641\\u0629 \\u0627\\u0644\\u0645\\u0642\\u0637\\u0648\\u0639\\u0629 \\u0623\\u0648 \\u0639\\u062f\\u0627\\u062f \\u0627\\u0644\\u0643\\u064a\\u0644\\u0648\\u0645\\u062a\\u0631\\u0627\\u062a \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0645\\u0633\\u062a\\u0639\\u0645\\u0644\\u0629 \\u0628\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0636\\u0626\\u064a\\u0644 \\u0639\\u0646 \\u0627\\u0644\\u0639\\u062f\\u062f \\u0627\\u0644\\u0645\\u0630\\u0643\\u0648\\u0631 \\u0641\\u064a \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\/ \\u0627\\u0644\\u062a\\u0637\\u0628\\u064a\\u0642\\u060c \\u0646\\u062a\\u064a\\u062c\\u0629 \\u0627\\u0644\\u0646\\u0642\\u0644 \\u0625\\u0644\\u0649 \\u0645\\u0631\\u0627\\u0641\\u0642 \\u0627\\u0644\\u062a\\u062c\\u062f\\u064a\\u062f \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0646\\u0627 \\u0648\\u062a\\u062d\\u0645\\u064a\\u0644 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0648\\u062a\\u0648\\u0635\\u064a\\u0644\\u0647\\u0627 \\u0625\\u0644\\u064a\\u0643.<\\/span><\\/span><\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li style=\\\"list-style-type: decimal; text-align: right;\\\">\\r\\n\\t<p><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u0635\\u0648\\u0631 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u0645\\u0648\\u0642\\u0639\\u0646\\u0627 \\/ \\u062a\\u0637\\u0628\\u064a\\u0642\\u0646\\u0627 \\u0647\\u064a \\u0644\\u0623\\u063a\\u0631\\u0627\\u0636 \\u062a\\u0648\\u0636\\u064a\\u062d\\u064a\\u0629 \\u0641\\u0642\\u0637. \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0631\\u063a\\u0645 \\u0645\\u0646 \\u0623\\u0646\\u0646\\u0627 \\u0646\\u0628\\u0630\\u0644 \\u0642\\u0635\\u0627\\u0631\\u0649 \\u062c\\u0647\\u062f\\u0646\\u0627 \\u0644\\u0639\\u0631\\u0636 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0628\\u062f\\u0642\\u0629 \\u060c \\u0625\\u0644\\u0627 \\u0623\\u0646\\u0646\\u0627 \\u0644\\u0627 \\u0646\\u0636\\u0645\\u0646 \\u0623\\u0646 \\u062a\\u0639\\u0643\\u0633 \\u0635\\u0648\\u0631 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u062a\\u0645\\u0627\\u0645\\u064b\\u0627 \\u0627\\u0644\\u0645\\u0638\\u0647\\u0631 \\u0627\\u0644\\u0641\\u0639\\u0644\\u064a \\u0644\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629. \\u0628\\u0627\\u0644\\u0625\\u0636\\u0627\\u0641\\u0629 \\u0625\\u0644\\u0649 \\u0630\\u0644\\u0643 \\u060c \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0631\\u063a\\u0645 \\u0645\\u0646 \\u0623\\u0646\\u0646\\u0627 \\u0646\\u0628\\u0630\\u0644 \\u0642\\u0635\\u0627\\u0631\\u0649 \\u062c\\u0647\\u062f\\u0646\\u0627 \\u0644\\u0648\\u0635\\u0641 \\u0644\\u0648\\u0646 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0628\\u062f\\u0642\\u0629 \\u060c \\u0625\\u0644\\u0627 \\u0623\\u0646\\u0647 \\u064a\\u0645\\u0643\\u0646\\u0643 \\u0627\\u0639\\u062a\\u0628\\u0627\\u0631 \\u0623\\u0646 \\u0648\\u0635\\u0641 \\u0644\\u0648\\u0646 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u064a\\u062e\\u062a\\u0644\\u0641 \\u0639\\u0646 \\u0627\\u0644\\u0645\\u0638\\u0647\\u0631 \\u0627\\u0644\\u0641\\u0639\\u0644\\u064a \\u0644\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629. \\u0644\\u0627 \\u0646\\u0636\\u0645\\u0646 \\u0623\\u0646 \\u064a\\u0639\\u0643\\u0633 \\u0644\\u0648\\u0646 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0648\\u0635\\u0641 \\u0628\\u0627\\u0644\\u0636\\u0628\\u0637. \\u0625\\u0630\\u0627 \\u0643\\u0646\\u062a \\u062a\\u0639\\u062a\\u0642\\u062f \\u0623\\u0646 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0627\\u0644\\u062a\\u064a \\u0627\\u0634\\u062a\\u0631\\u064a\\u062a\\u0647\\u0627 \\u062a\\u062e\\u062a\\u0644\\u0641 \\u0639\\u0646 \\u0627\\u0644\\u0637\\u0631\\u064a\\u0642\\u0629 \\u0627\\u0644\\u0645\\u0648\\u0636\\u062d\\u0629 \\u0628\\u0647\\u0627 \\u0639\\u0644\\u0649 \\u0645\\u0648\\u0642\\u0639\\u0646\\u0627 \\/ \\u062a\\u0637\\u0628\\u064a\\u0642\\u0646\\u0627 \\u060c \\u0641\\u064a\\u062d\\u0642 \\u0644\\u0643 \\u0631\\u0641\\u0636 \\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0623\\u0648 \\u0642\\u0628\\u0648\\u0644\\u0647\\u0627 \\u0623\\u0648 \\u0625\\u0639\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0648\\u0637\\u0644\\u0628 \\u0627\\u0633\\u062a\\u0631\\u062f\\u0627\\u062f \\u0627\\u0644\\u0623\\u0645\\u0648\\u0627\\u0644 \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0647\\u0630\\u0647 \\u0627\\u0644\\u0634\\u0631\\u0648\\u0637.<\\/span><\\/span><\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li style=\\\"list-style-type: decimal; text-align: right;\\\">\\r\\n\\t<p><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u0639\\u0646\\u062f \\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643 \\u060c \\u064a\\u062c\\u0628 \\u062a\\u0623\\u0643\\u064a\\u062f \\u0627\\u0644\\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u0644\\u0645\\u0648\\u0638\\u0641 \\u0627\\u0644\\u0645\\u0639\\u0631\\u0636 \\u0623\\u0648 \\u0645\\u0648\\u0638\\u0641 \\u0639\\u0645\\u0644\\u0627\\u0621 &quot;\\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644&quot;. \\u064a\\u062c\\u0628 \\u0639\\u0644\\u064a\\u0643 \\u0627\\u0644\\u062a\\u0648\\u0642\\u064a\\u0639 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0625\\u064a\\u0635\\u0627\\u0644 \\u0644\\u062a\\u0623\\u0643\\u064a\\u062f \\u0627\\u0633\\u062a\\u0644\\u0627\\u0645\\u0643 \\u0644\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u060c \\u0648\\u0623\\u0646\\u0647\\u0627 \\u062a\\u0644\\u0628\\u064a \\u0627\\u0644\\u0645\\u0648\\u0627\\u0635\\u0641\\u0627\\u062a \\u0627\\u0644\\u0648\\u0627\\u0631\\u062f\\u0629 \\u0641\\u064a \\u0637\\u0644\\u0628\\u0643.<\\/span><\\/span><\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li style=\\\"list-style-type: decimal; text-align: right;\\\">\\r\\n\\t<p><span style=\\\"font-size:13.999999999999998pt\\\"><span style=\\\"font-family:Arial,sans-serif\\\">\\u062d\\u064a\\u062b \\u064a\\u0648\\u0641\\u0631 \\u0644\\u0643 &quot;\\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644&quot; \\u0636\\u0645\\u0627\\u0646 \\u0627\\u0633\\u062a\\u0631\\u062c\\u0627\\u0639 \\u0645\\u0627 \\u062f\\u0641\\u0639\\u062a\\u0647 \\u0628\\u0634\\u0643\\u0644 \\u0643\\u0627\\u0645\\u0644 \\u062e\\u0644\\u0627\\u0644 10 \\u0623\\u064a\\u0627\\u0645 \\u0645\\u0646 \\u062a\\u0627\\u0631\\u064a\\u062e \\u0627\\u0633\\u062a\\u0644\\u0627\\u0645 \\u0633\\u064a\\u0627\\u0631\\u062a\\u0643 \\u0644\\u0623\\u064a \\u0633\\u0628\\u0628. \\u0644\\u0627 \\u064a\\u0645\\u0643\\u0646\\u0646\\u0627 \\u0642\\u0628\\u0648\\u0644 \\u0625\\u0631\\u062c\\u0627\\u0639 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0625\\u0630\\u0627 \\u0642\\u0645\\u062a \\u0628\\u062a\\u0639\\u062f\\u064a\\u0644\\u0647\\u0627 \\u0623\\u0648 \\u0625\\u062a\\u0644\\u0627\\u0641\\u0647\\u0627 \\u0623\\u0648 \\u062a\\u0639\\u0631\\u0636\\u062a \\u0644\\u062d\\u0627\\u062f\\u062b \\u0623\\u0648 \\u062a\\u063a\\u064a\\u064a\\u0631 \\u062d\\u0627\\u0644\\u062a\\u0647\\u0627 \\u0627\\u0644\\u0623\\u0635\\u0644\\u064a\\u0629 \\u0639\\u0646\\u062f\\u0645\\u0627 \\u0642\\u0645\\u0646\\u0627 \\u0628\\u062a\\u0633\\u0644\\u064a\\u0645\\u0647\\u0627 \\u0644\\u0643. \\u0644\\u0627 \\u062a\\u0648\\u062c\\u062f \\u0631\\u0633\\u0648\\u0645 \\u0625\\u0639\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629\\u060c \\u0648\\u0633\\u064a\\u062a\\u0645 \\u0631\\u062f \\u0627\\u0644\\u0633\\u0639\\u0631 \\u0627\\u0644\\u0630\\u064a \\u062f\\u0641\\u0639\\u062a\\u0647 \\u0644\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629\\u060c \\u0648 \\u0627\\u0644\\u0647\\u062f\\u0641 \\u0645\\u0646 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0629 \\u0623\\u0646 \\u0646\\u0648\\u0641\\u0631 \\u0644\\u0643 \\u0637\\u0631\\u064a\\u0642\\u0629 \\u0633\\u0647\\u0644\\u0629 \\u0648\\u0645\\u064a\\u0633\\u0631\\u0629 \\u0639\\u0646\\u062f \\u0634\\u0631\\u0627\\u0626\\u0643 \\u0633\\u064a\\u0627\\u0631\\u0629 \\u0645\\u0633\\u062a\\u0639\\u0645\\u0644\\u0629 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629.<\\/span><\\/span><\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ol>\",\"en\":\"<ol>\\r\\n\\t<li style=\\\"text-align: justify;\\\">\\r\\n\\t<p>Automobile does not offer any warranty from the manufacturer of the used car. But for a new car, it comes with a factory warranty.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li style=\\\"text-align: justify;\\\">\\r\\n\\t<p>The used cars on display with us may have been used as a vehicle owned by multiple owners. Or imported from another country. We will make reasonable efforts to provide you with any additional information we have about the Vehicle upon your request. However, if you have any questions about the previous use of the vehicle or have specific requirements, we advise you to discuss these questions with us before placing your order.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li style=\\\"text-align: justify;\\\">\\r\\n\\t<p>The mileage or mileage on a used vehicle may vary by a small amount from the number stated on the website\\/app, as a result of transportation to our reconditioning facilities and loading and delivery of the vehicle to you.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li style=\\\"text-align: justify;\\\">\\r\\n\\t<p>The vehicle images on our website\\/application are for illustrative purposes only. Although we make every effort to display the vehicle accurately, we cannot guarantee that photographs of the vehicle on the Site exactly reflect the actual appearance of the vehicle. In addition, although we make every effort to accurately describe the color of the vehicle, you may consider that the description of the vehicle&#39;s color is different from the actual appearance of the vehicle. We do not guarantee that vehicle color reflects the exact description. If you believe that the vehicle you have purchased is different from the way it is described on our Website\\/App, you have the right to refuse to pick up or accept the vehicle or to return the vehicle and request a refund in accordance with these Terms.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li style=\\\"text-align: justify;\\\">\\r\\n\\t<p>When you pick up your car, you must confirm receipt to the showroom employee or Automobile customer representative. You must sign the receipt to confirm that you received the vehicle and that it meets the specifications in your order.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li style=\\\"text-align: justify;\\\">\\r\\n\\t<p>Automobile provides you with a full refund guarantee within 10 days of receiving your car for any reason. We cannot accept returns of a vehicle if it has been modified, damaged, in an accident, or altered in its original condition when we delivered it to you. There are no fees for returning the car, and the price you paid for the car will be refunded. The aim of this service is to provide you with an easy and affordable way when you buy a used car directly.<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ol>\"}', 'buying-and-selling-policy', 1, '2023-08-27 12:55:39', '2023-09-11 11:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admins.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(2, 'admins.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(3, 'admins.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(4, 'admins.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(5, 'roles.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(6, 'roles.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(7, 'roles.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(8, 'roles.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(9, 'brands.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(10, 'brands.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(11, 'brands.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(12, 'brands.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(13, 'car_models.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(14, 'car_models.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(15, 'car_models.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(16, 'car_models.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(17, 'cities.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(18, 'cities.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(19, 'cities.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(20, 'cities.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(21, 'districts.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(22, 'districts.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(23, 'districts.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(24, 'districts.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(25, 'features.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(26, 'features.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(27, 'features.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(28, 'features.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(29, 'feature_options.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(30, 'feature_options.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(31, 'feature_options.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(32, 'feature_options.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(33, 'showrooms.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(34, 'showrooms.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(35, 'showrooms.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(36, 'showrooms.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(37, 'showrooms.listCars', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(38, 'branches.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(39, 'branches.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(40, 'branches.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(41, 'branches.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(42, 'cars.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(43, 'cars.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(44, 'cars.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(45, 'cars.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(46, 'users.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(47, 'users.create', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(48, 'users.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(49, 'users.delete', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(50, 'setting.read', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(51, 'setting.edit', 'admin', '2023-06-19 12:23:33', '2023-06-19 12:23:33'),
(52, 'reports.read', 'admin', '2023-07-10 17:15:55', '2023-07-10 17:15:55'),
(53, 'reports.create', 'admin', '2023-07-10 17:15:55', '2023-07-10 17:15:55'),
(54, 'reports.edit', 'admin', '2023-07-10 17:15:55', '2023-07-10 17:15:55'),
(55, 'reports.delete', 'admin', '2023-07-10 17:15:55', '2023-07-10 17:15:55'),
(56, 'report_options.read', 'admin', '2023-07-10 17:15:55', '2023-07-10 17:15:55'),
(57, 'report_options.create', 'admin', '2023-07-10 17:15:55', '2023-07-10 17:15:55'),
(58, 'report_options.edit', 'admin', '2023-07-10 17:15:55', '2023-07-10 17:15:55'),
(59, 'report_options.delete', 'admin', '2023-07-10 17:15:55', '2023-07-10 17:15:55'),
(60, 'requests.read', 'admin', '2023-07-10 17:15:55', '2023-07-10 17:15:55'),
(61, 'requests.approve', 'admin', '2023-07-10 17:15:55', '2023-07-10 17:15:55'),
(62, 'pages.read', 'admin', '2023-07-17 16:40:12', '2023-07-17 16:40:12'),
(63, 'pages.create', 'admin', '2023-07-17 16:40:12', '2023-07-17 16:40:12'),
(64, 'pages.edit', 'admin', '2023-07-17 16:40:12', '2023-07-17 16:40:12'),
(65, 'pages.delete', 'admin', '2023-07-17 16:40:12', '2023-07-17 16:40:12'),
(66, 'sliders.read', 'admin', '2023-07-19 13:13:31', '2023-07-19 13:13:31'),
(67, 'sliders.create', 'admin', '2023-07-19 13:13:31', '2023-07-19 13:13:31'),
(68, 'sliders.edit', 'admin', '2023-07-19 13:13:31', '2023-07-19 13:13:31'),
(69, 'sliders.delete', 'admin', '2023-07-19 13:13:31', '2023-07-19 13:13:31'),
(70, 'colors.read', 'admin', '2023-07-20 12:31:45', '2023-07-20 12:31:45'),
(71, 'colors.create', 'admin', '2023-07-20 12:31:45', '2023-07-20 12:31:45'),
(72, 'colors.edit', 'admin', '2023-07-20 12:31:45', '2023-07-20 12:31:45'),
(73, 'colors.delete', 'admin', '2023-07-20 12:31:45', '2023-07-20 12:31:45'),
(74, 'car_types.read', 'admin', '2023-08-27 12:54:55', '2023-08-27 12:54:55'),
(75, 'car_types.create', 'admin', '2023-08-27 12:54:55', '2023-08-27 12:54:55'),
(76, 'car_types.edit', 'admin', '2023-08-27 12:54:55', '2023-08-27 12:54:55'),
(77, 'car_types.delete', 'admin', '2023-08-27 12:54:55', '2023-08-27 12:54:55'),
(78, 'contact.read', 'admin', '2023-08-27 15:21:15', '2023-08-27 15:21:15'),
(79, 'contact.show', 'admin', '2023-08-27 15:21:15', '2023-08-27 15:21:15'),
(80, 'packages.read', 'admin', '2023-08-28 18:03:01', '2023-08-28 18:03:01'),
(81, 'packages.create', 'admin', '2023-08-28 18:03:01', '2023-08-28 18:03:01'),
(82, 'packages.edit', 'admin', '2023-08-28 18:03:01', '2023-08-28 18:03:01'),
(83, 'packages.delete', 'admin', '2023-08-28 18:03:01', '2023-08-28 18:03:01'),
(84, 'push_notification.read', 'admin', '2023-08-28 18:03:01', '2023-08-28 18:03:01'),
(85, 'push_notification.create', 'admin', '2023-08-28 18:03:01', '2023-08-28 18:03:01'),
(86, 'push_notification.delete', 'admin', '2023-08-28 18:03:01', '2023-08-28 18:03:01');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `name`, `created_at`, `updated_at`) VALUES
(4, '{\"en\":\"ENGINE\",\"ar\":\"\\u0627\\u0644\\u0645\\u0627\\u0643\\u064a\\u0646\\u0629\"}', '2023-07-25 14:38:06', '2023-07-25 14:47:48'),
(5, '{\"en\":\"Electricity System\",\"ar\":\"\\u0646\\u0638\\u0627\\u0645 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0621\"}', '2023-07-25 14:39:40', '2023-07-25 14:39:40'),
(6, '{\"en\":\"UNDER CHASSIS\",\"ar\":\"\\u0623\\u0633\\u0641\\u0644 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629\"}', '2023-07-25 14:40:14', '2023-07-25 14:48:16'),
(7, '{\"en\":\"REAR AXLES & DRIVE SHAFTS\",\"ar\":\"\\u0627\\u0644\\u062f\\u0641\\u0631\\u0646\\u0633 \\/ \\u0627\\u0644\\u0643\\u0648\\u0631\\u0648\\u0646\\u0627\"}', '2023-07-25 14:40:41', '2023-07-25 14:48:53'),
(9, '{\"en\":\"TRANSMISSION\",\"ar\":\"\\u0627\\u0644\\u062c\\u064a\\u0631\\u0628\\u0648\\u0643\\u0633\"}', '2023-07-25 14:42:03', '2023-07-25 14:50:05'),
(10, '{\"en\":\"Liquids\",\"ar\":\"\\u0627\\u0644\\u0633\\u0648\\u0627\\u0626\\u0644\"}', '2023-07-25 14:42:40', '2023-07-25 14:42:40'),
(11, '{\"en\":\"Brake system\",\"ar\":\"\\u0646\\u0638\\u0627\\u0645 \\u0627\\u0644\\u0641\\u0631\\u0627\\u0645\\u0644\"}', '2023-07-25 14:43:08', '2023-07-25 14:43:08'),
(12, '{\"en\":\"Interior\",\"ar\":\"\\u0627\\u0644\\u0642\\u0633\\u0645 \\u0627\\u0644\\u062f\\u0627\\u062e\\u0644\\u064a\"}', '2023-07-25 14:46:42', '2023-07-25 14:46:42'),
(13, '{\"en\":\"Exterior Condition\",\"ar\":\"\\u0641\\u062d\\u0635 \\u0627\\u0644\\u0647\\u064a\\u0643\\u0644 \\u0627\\u0644\\u062e\\u0627\\u0631\\u062c\\u064a\"}', '2023-07-25 14:47:20', '2023-07-25 14:47:20'),
(14, '{\"en\":\"additions\",\"ar\":\"\\u0627\\u0636\\u0627\\u0641\\u0627\\u062a\"}', '2023-08-24 17:18:24', '2023-08-24 17:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `report_options`
--

CREATE TABLE `report_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_options`
--

INSERT INTO `report_options` (`id`, `name`, `report_id`, `created_at`, `updated_at`) VALUES
(6, '{\"en\":\"Front crank oil seal\",\"ar\":\"\\u0627\\u0644\\u0635\\u0648\\u0641\\u0629 \\u0627\\u0644\\u0627\\u0645\\u0627\\u0645\\u064a\\u0629\"}', 4, '2023-07-25 14:45:29', '2023-08-30 13:25:47'),
(7, '{\"en\":\"Engine overhaul\",\"ar\":\"\\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u0645\\u0627\\u0643\\u064a\\u0646\\u0629\"}', 4, '2023-07-25 14:45:51', '2023-07-25 15:15:51'),
(8, '{\"en\":\"Rear crank oil seal\",\"ar\":\"\\u0627\\u0644\\u0635\\u0648\\u0641\\u0629 \\u0627\\u0644\\u062e\\u0644\\u0641\\u064a\\u0629\"}', 4, '2023-07-25 14:46:14', '2023-08-30 13:24:51'),
(9, '{\"en\":\"Oil pump gasket\",\"ar\":\"\\u0648\\u062c\\u0647 \\u0637\\u0631\\u0645\\u0628\\u0629 \\u0627\\u0644\\u0632\\u064a\\u062a\"}', 9, '2023-07-25 15:17:39', '2023-07-25 15:22:36'),
(10, '{\"en\":\"Front oil seal\",\"ar\":\"\\u0627\\u0644\\u0635\\u0648\\u0641\\u0629 \\u0627\\u0644\\u0627\\u0645\\u0627\\u0645\\u064a\\u0629\"}', 9, '2023-07-25 15:17:51', '2023-07-25 15:23:01'),
(11, '{\"en\":\"Rear oil seal\",\"ar\":\"\\u0627\\u0644\\u0635\\u0648\\u0641\\u0629 \\u0627\\u0644\\u062e\\u0644\\u0641\\u064a\\u0629\"}', 9, '2023-07-25 15:18:00', '2023-07-25 15:24:14'),
(12, '{\"en\":\"Battery\",\"ar\":\"\\u0627\\u0644\\u0628\\u0637\\u0627\\u0631\\u064a\\u0629\"}', 5, '2023-07-25 15:24:57', '2023-07-25 15:24:57'),
(13, '{\"en\":\"Alternator\",\"ar\":\"\\u0627\\u0644\\u062f\\u064a\\u0646\\u0645\\u0648\"}', 5, '2023-07-25 15:25:14', '2023-07-25 15:25:14'),
(14, '{\"en\":\"Starler\",\"ar\":\"\\u0627\\u0644\\u0633\\u0644\\u0641\"}', 5, '2023-07-25 15:25:31', '2023-07-25 15:25:31'),
(15, '{\"en\":\"Engine Oil\",\"ar\":\"\\u0632\\u064a\\u062a \\u0627\\u0644\\u0645\\u0627\\u0643\\u064a\\u0646\\u0629\"}', 10, '2023-07-25 15:26:29', '2023-07-25 15:26:29'),
(16, '{\"en\":\"Transmission Oil\",\"ar\":\"\\u0632\\u064a\\u062a \\u0627\\u0644\\u062c\\u064a\\u0631\"}', 10, '2023-07-25 15:26:44', '2023-07-25 15:26:44'),
(17, '{\"en\":\"Brake Fluid\",\"ar\":\"\\u0632\\u064a\\u062a \\u0627\\u0644\\u0641\\u0631\\u0627\\u0645\\u0644\"}', 10, '2023-07-25 15:27:01', '2023-07-25 15:27:01'),
(18, '{\"en\":\"Idler Arm\",\"ar\":\"\\u0630\\u0631\\u0627\\u0639 \\u0634\\u0627\\u0635\"}', 6, '2023-07-25 15:27:52', '2023-07-25 15:27:52'),
(19, '{\"en\":\"Steering Hoses\",\"ar\":\"\\u0644\\u064a\\u0627\\u062a \\u0627\\u0644\\u062f\\u0631\\u0643\\u0633\\u064a\\u0648\\u0646\"}', 6, '2023-07-25 15:28:07', '2023-07-25 15:28:07'),
(20, '{\"en\":\"Steering Box\",\"ar\":\"\\u0627\\u0644\\u062f\\u0648\\u062f\\u0629\"}', 6, '2023-07-25 15:28:28', '2023-07-25 15:28:28'),
(21, '{\"en\":\"Brake Master CLY\",\"ar\":\"\\u0639\\u0644\\u0628\\u0629 \\u0627\\u0644\\u0641\\u0631\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\\u0629\"}', 11, '2023-07-25 15:29:10', '2023-07-25 15:29:10'),
(22, '{\"en\":\"Back Booster\",\"ar\":\"\\u0628\\u0627\\u0643\\u0645 \\u0627\\u0644\\u0641\\u0631\\u0627\\u0645\\u0644\"}', 11, '2023-07-25 15:29:40', '2023-07-25 15:29:40'),
(23, '{\"en\":\"Brake Hoses\",\"ar\":\"\\u0644\\u064a\\u0627\\u062a \\u0641\\u0631\\u0627\\u0645\\u0644\"}', 11, '2023-07-25 15:30:01', '2023-07-25 15:30:01'),
(24, '{\"en\":\"Front Axle\",\"ar\":\"\\u0627\\u0644\\u0639\\u0643\\u0648\\u0633 \\u0627\\u0644\\u0627\\u0645\\u0627\\u0645\\u064a\\u0629\"}', 7, '2023-07-25 15:31:05', '2023-07-25 15:31:05'),
(25, '{\"en\":\"Axle Difference\",\"ar\":\"\\u0627\\u0644\\u0639\\u0643\\u0648\\u0633 \\u0627\\u0644\\u062f\\u0641\\u0631\\u0646\\u0633\"}', 7, '2023-07-25 15:31:20', '2023-07-25 15:31:20'),
(26, '{\"en\":\"Difference\",\"ar\":\"\\u062f\\u0641\\u0631\\u0646\\u0633\"}', 7, '2023-07-25 15:31:54', '2023-07-25 15:31:54'),
(27, '{\"en\":\"Control panel swtich\",\"ar\":\"\\u062a\\u062d\\u0643\\u0645 \\u0627\\u0644\\u0646\\u0648\\u0627\\u0641\\u0630\"}', 12, '2023-07-25 15:32:39', '2023-07-25 15:32:39'),
(28, '{\"en\":\"lock button\",\"ar\":\"\\u0632\\u0631 \\u062a\\u0627\\u0645\\u064a\\u0646 \\u0627\\u0644\\u0627\\u0628\\u0648\\u0627\\u0628\"}', 12, '2023-07-25 15:32:55', '2023-07-25 15:32:55'),
(29, '{\"en\":\"Accessories\",\"ar\":\"\\u062f\\u064a\\u0643\\u0648\\u0631\\u0627\\u062a\"}', 12, '2023-07-25 15:33:10', '2023-07-25 15:33:10'),
(33, '{\"en\":\"Mirrors control\",\"ar\":\"\\u062a\\u062d\\u0643\\u0645 \\u0627\\u0644\\u0645\\u0631\\u064a\\u0627\\u062a\"}', 12, '2023-08-24 13:42:28', '2023-08-24 13:42:28'),
(34, '{\"en\":\"Drummers\",\"ar\":\"\\u0627\\u0644\\u0637\\u0628\\u0644\\u0648\\u0647\"}', 12, '2023-08-24 13:52:59', '2023-08-24 13:52:59'),
(35, '{\"en\":\"Steering wheel control\",\"ar\":\"\\u062a\\u062d\\u0643\\u0645 \\u0627\\u0644\\u062f\\u0631\\u0643\\u0633\\u064a\\u0648\\u0646\"}', 12, '2023-08-24 13:55:31', '2023-08-24 13:55:31'),
(36, '{\"en\":\"the screen\",\"ar\":\"\\u0627\\u0644\\u0634\\u0627\\u0634\\u0629\"}', 12, '2023-08-24 14:00:18', '2023-08-24 14:00:18'),
(37, '{\"en\":\"Steering wheel\",\"ar\":\"\\u0639\\u062c\\u0644\\u0629 \\u0627\\u0644\\u0642\\u064a\\u0627\\u062f\\u0629\"}', 12, '2023-08-24 14:02:06', '2023-08-24 14:02:06'),
(38, '{\"en\":\"headphones\",\"ar\":\"\\u0627\\u0644\\u0633\\u0645\\u0627\\u0639\\u0627\\u062a\"}', 12, '2023-08-24 14:03:42', '2023-08-24 14:03:42'),
(39, '{\"en\":\"roof\",\"ar\":\"\\u0627\\u0644\\u0633\\u0642\\u0641\"}', 12, '2023-08-24 14:05:31', '2023-08-24 14:05:31'),
(40, '{\"en\":\"Air conditioner vents\",\"ar\":\"\\u0641\\u062a\\u062d\\u0627\\u062a \\u0627\\u0644\\u0645\\u0643\\u064a\\u0641\"}', 12, '2023-08-24 14:07:58', '2023-08-24 14:07:58'),
(41, '{\"en\":\"AC control\",\"ar\":\"\\u062a\\u062d\\u0643\\u0645 \\u0627\\u0644\\u0645\\u0643\\u064a\\u0641\"}', 12, '2023-08-24 14:09:28', '2023-08-24 14:09:28'),
(42, '{\"en\":\"Sunroof\",\"ar\":\"\\u0641\\u062a\\u062d\\u0647 \\u0627\\u0644\\u0633\\u0642\\u0641\"}', 12, '2023-08-24 14:12:08', '2023-08-24 14:12:08'),
(43, '{\"en\":\"Right deacon\",\"ar\":\"\\u0634\\u0645\\u0627\\u0633\\u0629 \\u064a\\u0645\\u064a\\u0646\"}', 12, '2023-08-24 14:34:48', '2023-08-24 14:34:48'),
(44, '{\"en\":\"left deacon\",\"ar\":\"\\u0634\\u0645\\u0627\\u0633\\u0629 \\u064a\\u0633\\u0627\\u0631\"}', 12, '2023-08-24 14:35:10', '2023-08-24 14:35:10'),
(45, '{\"en\":\"The front seat is left\",\"ar\":\"\\u0627\\u0644\\u0645\\u0642\\u0639\\u062f \\u0627\\u0644\\u0627\\u0645\\u0627\\u0645\\u064a \\u064a\\u0633\\u0627\\u0631\"}', 12, '2023-08-24 14:37:53', '2023-08-24 14:37:53'),
(46, '{\"en\":\"Front seat right\",\"ar\":\"\\u0627\\u0644\\u0645\\u0642\\u0639\\u062f \\u0627\\u0644\\u0627\\u0645\\u0627\\u0645\\u064a \\u064a\\u0645\\u064a\\u0646\"}', 12, '2023-08-24 14:39:44', '2023-08-24 14:39:44'),
(47, '{\"en\":\"back mattresses\",\"ar\":\"\\u0627\\u0644\\u0645\\u0631\\u0627\\u062a\\u0628 \\u0627\\u0644\\u062e\\u0644\\u0641\\u064a\\u0629\"}', 12, '2023-08-24 14:41:54', '2023-08-24 14:41:54'),
(48, '{\"en\":\"Ceiling brushes\",\"ar\":\"\\u0641\\u0631\\u0634 \\u0627\\u0644\\u0633\\u0642\\u0641\"}', 12, '2023-08-24 14:44:38', '2023-08-24 14:44:38'),
(49, '{\"en\":\"Right front door decoration\",\"ar\":\"\\u062f\\u064a\\u0643\\u0648\\u0631 \\u0627\\u0644\\u0628\\u0627\\u0628 \\u0627\\u0644\\u0627\\u0645\\u0627\\u0645\\u064a \\u064a\\u0645\\u064a\\u0646\"}', 12, '2023-08-24 14:45:09', '2023-08-24 14:45:09'),
(50, '{\"en\":\"Left front door decoration\",\"ar\":\"\\u062f\\u064a\\u0643\\u0648\\u0631 \\u0627\\u0644\\u0628\\u0627\\u0628 \\u0627\\u0644\\u0627\\u0645\\u0627\\u0645\\u064a \\u064a\\u0633\\u0627\\u0631\"}', 12, '2023-08-24 14:45:30', '2023-08-24 14:45:30'),
(51, '{\"en\":\"Rear door trim right\",\"ar\":\"\\u062f\\u064a\\u0643\\u0648\\u0631 \\u0627\\u0644\\u0628\\u0627\\u0628 \\u0627\\u0644\\u062e\\u0644\\u0641\\u064a \\u064a\\u0645\\u064a\\u0646\"}', 12, '2023-08-24 14:46:42', '2023-08-24 14:46:42'),
(52, '{\"en\":\"Left rear door trim\",\"ar\":\"\\u062f\\u064a\\u0643\\u0648\\u0631 \\u0627\\u0644\\u0628\\u0627\\u0628 \\u0627\\u0644\\u062e\\u0644\\u0641\\u064a \\u064a\\u0633\\u0627\\u0631\"}', 12, '2023-08-24 14:47:51', '2023-08-24 14:47:51'),
(53, '{\"en\":\"Right windshield button\",\"ar\":\"\\u0632\\u0631 \\u0627\\u0644\\u0632\\u062c\\u0627\\u062c \\u0627\\u0644\\u0627\\u0645\\u0627\\u0645\\u064a \\u064a\\u0645\\u064a\\u0646\"}', 12, '2023-08-24 14:49:32', '2023-08-24 14:49:32'),
(54, '{\"en\":\"Left windshield button\",\"ar\":\"\\u0632\\u0631 \\u0632\\u062c\\u0627\\u062c \\u0627\\u0644\\u0627\\u0645\\u0627\\u0645\\u064a \\u064a\\u0633\\u0627\\u0631\"}', 12, '2023-08-24 14:49:54', '2023-08-24 14:49:54'),
(55, '{\"en\":\"Rear left window button\",\"ar\":\"\\u0632\\u0631 \\u0627\\u0644\\u0632\\u062c\\u0627\\u062c \\u0627\\u0644\\u062e\\u0644\\u0641\\u064a \\u064a\\u0633\\u0627\\u0631\"}', 12, '2023-08-24 14:50:20', '2023-08-24 14:50:20'),
(56, '{\"en\":\"Back glass button right\",\"ar\":\"\\u0632\\u0631 \\u0627\\u0644\\u0632\\u062c\\u0627\\u062c \\u0627\\u0644\\u062e\\u0644\\u0641\\u064a \\u064a\\u0645\\u064a\\u0646\"}', 12, '2023-08-24 14:50:39', '2023-08-24 14:50:39'),
(57, '{\"en\":\"lime stick\",\"ar\":\"\\u0639\\u0635\\u0627 \\u0627\\u0644\\u062c\\u064a\\u0631\"}', 12, '2023-08-24 14:52:06', '2023-08-24 14:52:06'),
(58, '{\"en\":\"cup holder\",\"ar\":\"\\u062d\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0627\\u0643\\u0648\\u0627\\u0628\"}', 12, '2023-08-24 14:54:29', '2023-08-24 14:54:29'),
(59, '{\"en\":\"Trunk opening button\",\"ar\":\"\\u0632\\u0631 \\u0641\\u062a\\u062d \\u0627\\u0644\\u0634\\u0646\\u0637\\u0647\"}', 12, '2023-08-24 14:56:13', '2023-08-24 14:56:13'),
(60, '{\"en\":\"Hood opening hand\",\"ar\":\"\\u064a\\u062f \\u0641\\u062a\\u062d \\u0627\\u0644\\u0643\\u0628\\u0648\\u062a\"}', 12, '2023-08-24 14:57:06', '2023-08-24 14:57:06'),
(61, '{\"en\":\"Brake Pad Front\",\"ar\":\"\\u0641\\u0631\\u0627\\u0645\\u0644 \\u0627\\u0645\\u0627\\u0645\\u064a\\u0629\"}', 11, '2023-08-24 15:04:12', '2023-08-30 15:34:57'),
(62, '{\"en\":\"rear brake\",\"ar\":\"\\u0641\\u0631\\u0627\\u0645\\u0644 \\u062e\\u0644\\u0641\\u064a\\u0629\"}', 11, '2023-08-24 15:05:06', '2023-08-24 15:05:06'),
(63, '{\"en\":\"Brake Pad Rear\",\"ar\":\"\\u0647\\u0648\\u0628 \\u0627\\u0645\\u0627\\u0645\\u064a\"}', 11, '2023-08-24 15:06:51', '2023-08-30 15:30:56'),
(64, '{\"en\":\"Brake Pad Rear\",\"ar\":\"\\u0647\\u0648\\u0628 \\u062e\\u0644\\u0641\\u064a\"}', 11, '2023-08-24 15:08:22', '2023-08-30 15:09:05'),
(65, '{\"en\":\"Wheel Bearing Rear\",\"ar\":\"\\u0641\\u0644\\u0646\\u062c\\u0627\\u062a \\u0627\\u0645\\u0627\\u0645\\u064a \\u064a\\u0645\\u064a\\u0646\"}', 11, '2023-08-24 15:11:12', '2023-08-30 15:08:25'),
(66, '{\"en\":\"Wheel Bearing Rear\",\"ar\":\"\\u0641\\u0644\\u0646\\u062c\\u0627\\u062a \\u0627\\u0645\\u0627\\u0645\\u064a \\u064a\\u0633\\u0627\\u0631\"}', 11, '2023-08-24 15:11:36', '2023-08-30 15:08:06'),
(67, '{\"en\":\"Wheel Bearing Rear\",\"ar\":\"\\u0641\\u0644\\u0646\\u062c\\u0627\\u062a \\u062e\\u0644\\u0641\\u064a \\u064a\\u0645\\u064a\\u0646\"}', 11, '2023-08-24 15:12:52', '2023-08-30 15:07:48'),
(68, '{\"en\":\"Wheel Bearing Rear\",\"ar\":\"\\u0641\\u0644\\u0646\\u062c\\u0627\\u062a \\u062e\\u0644\\u0641\\u064a \\u064a\\u0633\\u0627\\u0631\"}', 11, '2023-08-24 15:13:17', '2023-08-30 15:07:29'),
(69, '{\"en\":\"Brake Wheel Call\",\"ar\":\"\\u0633\\u0644\\u0646\\u062f\\u0631 \\u0627\\u0645\\u0627\\u0645\\u064a \\u064a\\u0645\\u064a\\u0646\"}', 11, '2023-08-24 15:14:39', '2023-08-30 15:06:33'),
(70, '{\"en\":\"Brake Wheel Call\",\"ar\":\"\\u0633\\u0644\\u0646\\u062f\\u0631 \\u0627\\u0645\\u0627\\u0645\\u064a \\u064a\\u0633\\u0627\\u0631\"}', 11, '2023-08-24 15:16:58', '2023-08-30 15:06:15'),
(71, '{\"en\":\"Brake Wheel Call\",\"ar\":\"\\u0633\\u0644\\u0646\\u062f\\u0631 \\u062e\\u0644\\u0641\\u064a \\u064a\\u0645\\u064a\\u0646\"}', 11, '2023-08-24 15:17:21', '2023-08-30 15:05:52'),
(72, '{\"en\":\"Brake Wheel Call\",\"ar\":\"\\u0633\\u0644\\u0646\\u062f\\u0631 \\u062e\\u0644\\u0641\\u064a \\u064a\\u0633\\u0627\\u0631\"}', 11, '2023-08-24 15:17:43', '2023-08-30 15:03:48'),
(73, '{\"en\":\"Hand Brake Cable\",\"ar\":\"\\u0633\\u0644\\u0643 \\u0641\\u0631\\u0627\\u0645\\u0644 \\u0627\\u0644\\u064a\\u062f \\u062c\\u0644\\u0646\\u0637\"}', 11, '2023-08-24 15:18:14', '2023-08-30 15:02:24'),
(74, '{\"en\":\"Engine Coolant\",\"ar\":\"\\u0645\\u0627\\u0621 \\u0627\\u0644\\u0631\\u062f\\u064a\\u062a\\u0631\"}', 10, '2023-08-24 15:20:39', '2023-08-30 14:54:40'),
(75, '{\"en\":\"Washer Fluid\",\"ar\":\"\\u0645\\u0627\\u0621 \\u0627\\u0644\\u0645\\u0633\\u0627\\u062d\\u0627\\u062a\"}', 10, '2023-08-24 15:21:34', '2023-08-30 14:53:57'),
(76, '{\"en\":\"Engine bolts disassemble sign\",\"ar\":\"\\u0632\\u064a\\u062a \\u062f\\u0631\\u0643\\u0633\\u064a\\u0648\\u0646\"}', 10, '2023-08-24 15:22:25', '2023-08-30 14:53:14'),
(77, '{\"en\":\"Transmission mount\",\"ar\":\"\\u0643\\u0631\\u0633\\u064a \\u0627\\u0644\\u062c\\u064a\\u0631 \\u0628\\u0648\\u0643\\u0633\"}', 9, '2023-08-24 15:26:41', '2023-08-30 14:32:13'),
(78, '{\"en\":\"Oil pan gasket\",\"ar\":\"\\u0648\\u062c\\u0647 \\u0643\\u0631\\u062a\\u064a\\u0631 \\u0627\\u0644\\u062c\\u064a\\u0631\"}', 9, '2023-08-24 15:29:19', '2023-08-30 14:32:49'),
(79, '{\"en\":\"Gear stick souta\",\"ar\":\"\\u0635\\u0648\\u0641 \\u0639\\u0635\\u0627 \\u0627\\u0644\\u062c\\u064a\\u0631\"}', 9, '2023-08-24 15:31:02', '2023-08-30 14:48:54'),
(80, '{\"en\":\"Oil cooler pipe\",\"ar\":\"\\u0645\\u0627\\u0633\\u0648\\u0631\\u0629 \\u0645\\u0628\\u0631\\u062f \\u0627\\u0644\\u062c\\u064a\\u0631\"}', 9, '2023-08-24 15:32:00', '2023-08-30 14:48:11'),
(81, '{\"en\":\"Gear performance\",\"ar\":\"\\u062d\\u0627\\u0644\\u0629 \\u0627\\u0644\\u062c\\u064a\\u0631\"}', 9, '2023-08-24 15:32:23', '2023-08-30 14:34:02'),
(82, '{\"en\":\"transmission sump\",\"ar\":\"\\u0643\\u0627\\u0631\\u062a\\u064a\\u0631 \\u0627\\u0644\\u062c\\u064a\\u0631\"}', 9, '2023-08-24 15:32:44', '2023-08-30 14:47:18'),
(83, '{\"en\":\"Gearbox intercooler\",\"ar\":\"\\u0645\\u0628\\u0631\\u062f \\u0627\\u0644\\u062c\\u064a\\u0631\"}', 9, '2023-08-24 15:34:53', '2023-08-30 13:58:55'),
(84, '{\"en\":\"Transmission bolts disassemble sign\",\"ar\":\"\\u0627\\u062b\\u0631 \\u0641\\u0643 \\u0641\\u064a \\u0627\\u0644\\u062c\\u064a\\u0631\"}', 9, '2023-08-24 15:35:11', '2023-08-30 13:58:25'),
(85, '{\"en\":\"Axle Seal Front\",\"ar\":\"\\u0635\\u0648\\u0641\\u0629 \\u0639\\u0643\\u0633 \\u0627\\u0645\\u0627\\u0645\\u064a\"}', 7, '2023-08-24 15:37:48', '2023-08-30 13:55:34'),
(86, '{\"en\":\"Axle Seal Rear\",\"ar\":\"\\u0635\\u0648\\u0641\\u0629 \\u0639\\u0643\\u0633 \\u062d\\u0644\\u0641\\u064a\"}', 7, '2023-08-24 15:38:31', '2023-08-30 13:56:13'),
(87, '{\"en\":\"propeller shaft\",\"ar\":\"\\u0639\\u0645\\u0648\\u062f \\u0643\\u0631\\u062f\\u0627\\u0646\"}', 7, '2023-08-24 15:40:59', '2023-08-30 13:56:35'),
(88, '{\"en\":\"4WD\",\"ar\":\"\\u062f\\u0628\\u0644\"}', 7, '2023-08-24 15:42:56', '2023-08-30 13:56:55'),
(89, '{\"en\":\"Steering Rack & Pinion\",\"ar\":\"\\u0639\\u0627\\u0645\\u0648\\u062f \\u0627\\u0644\\u062f\\u0631\\u0643\\u0633\\u064a\\u0648\\u0646\"}', 6, '2023-08-24 15:45:48', '2023-08-30 13:51:49'),
(90, '{\"en\":\"Front shock absorbers\",\"ar\":\"\\u0627\\u0644\\u0645\\u0633\\u0627\\u0639\\u062f\\u0627\\u062a \\u0627\\u0644\\u0627\\u0645\\u0627\\u0645\\u064a\\u0629\"}', 6, '2023-08-24 15:49:48', '2023-08-30 13:52:25'),
(91, '{\"en\":\"Rear shock absorbers\",\"ar\":\"\\u0627\\u0644\\u0645\\u0633\\u0627\\u0639\\u062f\\u0627\\u062a \\u0627\\u0644\\u062e\\u0644\\u0641\\u064a\\u0629\"}', 6, '2023-08-24 15:50:57', '2023-08-30 13:52:51'),
(92, '{\"en\":\"Upper Arm Bushing\",\"ar\":\"\\u062c\\u0644\\u062f \\u0627\\u0644\\u0645\\u0642\\u0635 \\u0627\\u0644\\u0639\\u0644\\u0648\\u064a\"}', 6, '2023-08-24 15:51:52', '2023-08-30 13:49:30'),
(93, '{\"en\":\"Rear Lower Arm Bushing\",\"ar\":\"\\u062c\\u0644\\u062f \\u0627\\u0644\\u0645\\u0642\\u0635 \\u0627\\u0644\\u0633\\u0641\\u0644\\u064a\"}', 6, '2023-08-24 15:52:15', '2023-08-30 13:48:28'),
(94, '{\"en\":\"Suspension Spring\",\"ar\":\"\\u0627\\u0644\\u064a\\u0627\\u064a\\u0627\\u062a\"}', 6, '2023-08-24 15:54:57', '2023-08-30 13:48:00'),
(95, '{\"en\":\"stabilizer link rubber\",\"ar\":\"\\u062c\\u0644\\u062f \\u0639\\u0645\\u0648\\u062f \\u062a\\u0648\\u0627\\u0632\\u0646\"}', 6, '2023-08-24 15:56:59', '2023-08-30 13:47:20'),
(96, '{\"en\":\"stabilizer link\",\"ar\":\"\\u0639\\u0645\\u0648\\u062f \\u062a\\u0648\\u0632\\u0627\\u0646\"}', 6, '2023-08-24 15:58:34', '2023-08-30 13:44:50'),
(97, '{\"en\":\"CROSSMEMBER SUB-ASSY\",\"ar\":\"\\u0643\\u0645\\u0631\"}', 6, '2023-08-24 15:59:41', '2023-08-30 13:44:30'),
(98, '{\"en\":\"Inner tie rod end\",\"ar\":\"\\u0630\\u0631\\u0627\\u0639 \\u062f\\u0627\\u062e\\u0644\\u064a\"}', 6, '2023-08-24 16:01:54', '2023-08-30 13:43:38'),
(99, '{\"en\":\"Outer tie rod end\",\"ar\":\"\\u0630\\u0631\\u0627\\u0639 \\u062e\\u0627\\u0631\\u062c\\u064a\"}', 6, '2023-08-24 16:03:47', '2023-08-30 13:43:11'),
(100, '{\"en\":\"Ball Joint Right\",\"ar\":\"\\u0627\\u0644\\u0631\\u0643\\u0628\\u0629 \\u0627\\u0644\\u064a\\u0645\\u0646\\u0649\"}', 6, '2023-08-24 16:04:32', '2023-08-30 13:42:31'),
(101, '{\"en\":\"Ball Joint Left\",\"ar\":\"\\u0627\\u0644\\u0631\\u0643\\u0628\\u0629 \\u0627\\u0644\\u064a\\u0633\\u0631\\u0649\"}', 6, '2023-08-24 16:04:56', '2023-08-30 13:42:05'),
(102, '{\"en\":\"Top strut mount\",\"ar\":\"\\u0643\\u0631\\u0627\\u0633\\u064a \\u0627\\u0644\\u0645\\u0633\\u0627\\u0639\\u062f\\u0627\\u062a\"}', 6, '2023-08-24 16:07:02', '2023-08-30 13:41:45'),
(103, '{\"en\":\"Front Stabilizer Linkage\",\"ar\":\"\\u0645\\u0633\\u0645\\u0627\\u0631 \\u0639\\u0627\\u0645\\u0648\\u062f \\u0627\\u0644\\u062a\\u0648\\u0627\\u0632\\u0646 \\u0627\\u0645\\u0627\\u0645\\u064a\"}', 6, '2023-08-24 16:07:24', '2023-08-30 13:40:20'),
(104, '{\"en\":\"Rear Stabilizer Linkage\",\"ar\":\"\\u0645\\u0633\\u0645\\u0627\\u0631 \\u0639\\u0627\\u0645\\u0648\\u062f \\u0627\\u0644\\u062a\\u0648\\u0627\\u0632\\u0646 \\u062e\\u0644\\u0641\\u064a\"}', 6, '2023-08-24 16:07:40', '2023-08-30 13:39:44'),
(105, '{\"en\":\"Lights\",\"ar\":\"\\u0627\\u0644\\u0627\\u0646\\u0648\\u0627\\u0631\"}', 5, '2023-08-24 16:10:33', '2023-08-30 13:28:10'),
(106, '{\"en\":\"A\\/C\",\"ar\":\"\\u0643\\u0645\\u0628\\u0631\\u0648\\u0633\\u0631 \\u0645\\u0643\\u064a\\u0641\"}', 5, '2023-08-24 16:12:39', '2023-08-30 13:29:28'),
(107, '{\"en\":\"Center lock\",\"ar\":\"\\u0627\\u0644\\u0633\\u0646\\u062a\\u0631 \\u0644\\u0648\\u0643\"}', 5, '2023-08-24 16:14:20', '2023-08-30 13:29:58'),
(108, '{\"en\":\"Wiper blades\",\"ar\":\"\\u0627\\u0644\\u0645\\u0633\\u0627\\u062d\\u0627\\u062a\"}', 5, '2023-08-24 16:18:13', '2023-08-30 13:30:48'),
(109, '{\"en\":\"Trouble code\",\"ar\":\"\\u0634\\u0627\\u0634\\u0629 \\u0627\\u0644\\u0645\\u0643\\u064a\\u0641\"}', 5, '2023-08-24 16:19:29', '2023-08-30 13:33:08'),
(110, '{\"en\":\"Computer cods\",\"ar\":\"\\u0627\\u0639\\u0637\\u0627\\u0644 \\u0627\\u0644\\u0643\\u0645\\u0628\\u064a\\u0648\\u062a\\u0631\"}', 5, '2023-08-24 16:21:08', '2023-08-30 13:35:03'),
(111, '{\"en\":\"A\\/C condenser\",\"ar\":\"\\u062b\\u0644\\u0627\\u062c\\u0629 \\u0645\\u0643\\u064a\\u0641\"}', 5, '2023-08-24 16:23:05', '2023-08-30 13:35:31'),
(112, '{\"en\":\"A\\/C radiator\",\"ar\":\"\\u0631\\u062f\\u064a\\u062a\\u0631 \\u0645\\u0643\\u064a\\u0641\"}', 5, '2023-08-24 16:24:20', '2023-08-30 13:35:52'),
(113, '{\"en\":\"A\\/C filter\",\"ar\":\"\\u0641\\u0644\\u062a\\u0631 \\u0645\\u0643\\u064a\\u0641\"}', 5, '2023-08-24 16:25:22', '2023-08-30 13:36:24'),
(114, '{\"en\":\"A\\/C hose\",\"ar\":\"\\u0644\\u064a\\u0627\\u062a \\u0627\\u0644\\u0641\\u0631\\u064a\\u0648\\u0646\"}', 5, '2023-08-24 16:26:34', '2023-08-30 13:36:59'),
(115, '{\"en\":\"Rear A\\/C\",\"ar\":\"\\u0627\\u0644\\u0645\\u0643\\u064a\\u0641 \\u0627\\u0644\\u062e\\u0644\\u0641\\u064a\"}', 5, '2023-08-24 16:27:57', '2023-08-30 13:37:31'),
(116, '{\"en\":\"Fuse box\",\"ar\":\"\\u0639\\u0644\\u0628\\u0629 \\u0627\\u0644\\u0641\\u064a\\u0648\\u0632\\u0627\\u062a\"}', 5, '2023-08-24 16:28:58', '2023-08-30 13:37:56'),
(117, '{\"en\":\"Engine tune -up\",\"ar\":\"\\u062a\\u0635\\u0641\\u064a\\u0629 \\u0645\\u0627\\u0643\\u064a\\u0646\\u0629\"}', 4, '2023-08-24 16:31:42', '2023-08-30 13:26:24'),
(118, '{\"en\":\"Engine mount\",\"ar\":\"\\u0643\\u0631\\u0633\\u064a \\u0627\\u0644\\u0645\\u0627\\u0643\\u064a\\u0646\\u0629\"}', 4, '2023-08-24 16:33:27', '2023-08-30 13:24:17'),
(119, '{\"en\":\"Oil pan gasket\",\"ar\":\"\\u0642\\u0627\\u0639\\u062f\\u0629 \\u0641\\u0644\\u062a\\u0631 \\u0627\\u0644\\u0632\\u064a\\u062a\"}', 4, '2023-08-24 16:34:42', '2023-08-31 15:24:03'),
(120, '{\"en\":\"Valve cover gasket\",\"ar\":\"\\u0648\\u062c\\u0647 \\u063a\\u0637\\u0627\\u0621 \\u0627\\u0644\\u0628\\u0644\\u0648\\u0641\"}', 4, '2023-08-24 16:36:52', '2023-08-30 13:12:50'),
(121, '{\"en\":\"Oil filter bracket oring\",\"ar\":\"\\u0642\\u0627\\u0639\\u062f\\u0629 \\u0641\\u0644\\u062a\\u0631 \\u0627\\u0644\\u0632\\u064a\\u062a\"}', 4, '2023-08-24 16:45:13', '2023-08-30 13:12:17'),
(122, '{\"en\":\"Intake manifold gasket\",\"ar\":\"\\u0648\\u062c\\u0647 \\u0627\\u0644\\u062b\\u0644\\u0627\\u062c\\u0629\"}', 4, '2023-08-24 16:51:18', '2023-08-30 13:11:23'),
(123, '{\"en\":\"Radiator\",\"ar\":\"\\u0631\\u062f\\u064a\\u062a\\u0631 \\u0627\\u0644\\u0645\\u0627\\u0621\"}', 4, '2023-08-24 16:52:12', '2023-08-30 13:10:34'),
(124, '{\"en\":\"Engine timing cover gasket\",\"ar\":\"\\u0648\\u062c\\u0647 \\u0635\\u062f\\u0631 \\u0627\\u0644\\u0645\\u0627\\u0643\\u064a\\u0646\\u0629 \\u0627\\u0645\\u0627\\u0645 \\/ \\u062e\\u0644\\u0641\\u064a\"}', 4, '2023-08-24 16:53:25', '2023-08-30 13:10:08'),
(125, '{\"en\":\"Water pump\",\"ar\":\"\\u0637\\u0631\\u0645\\u0628\\u0629 \\u0627\\u0644\\u0645\\u0627\\u0621\"}', 4, '2023-08-24 16:55:47', '2023-08-30 13:09:26'),
(126, '{\"en\":\"Belts\",\"ar\":\"\\u0627\\u0644\\u0633\\u064a\\u0648\\u0631\"}', 4, '2023-08-24 16:56:51', '2023-08-30 13:08:55'),
(127, '{\"en\":\"Fuel filter\",\"ar\":\"\\u0635\\u0641\\u0627\\u064a\\u0647 \\u0627\\u0644\\u0628\\u0646\\u0632\\u064a\\u0646\"}', 4, '2023-08-24 16:57:16', '2023-08-30 13:08:04'),
(128, '{\"en\":\"Air filter\",\"ar\":\"\\u0641\\u0644\\u062a\\u0631 \\u0627\\u0644\\u0647\\u0648\\u0627\\u0621\"}', 4, '2023-08-24 16:57:40', '2023-08-30 13:07:29'),
(129, '{\"en\":\"ENGINE sump\",\"ar\":\"\\u0643\\u0627\\u0631\\u062a\\u064a\\u0631 \\u0627\\u0644\\u0645\\u0627\\u0643\\u064a\\u0646\\u0629\"}', 4, '2023-08-24 16:58:07', '2023-08-30 13:06:51'),
(130, '{\"en\":\"intake manifold\",\"ar\":\"\\u062b\\u0644\\u0627\\u062c\\u0629 \\u0627\\u0644\\u0645\\u0627\\u0643\\u064a\\u0646\\u0629\"}', 4, '2023-08-24 16:58:28', '2023-08-30 13:06:18'),
(131, '{\"en\":\"Radiator hose\",\"ar\":\"\\u0644\\u064a\\u0627\\u062a \\u0645\\u0627\\u0621 \\u0627\\u0644\\u0631\\u062f\\u064a\\u062a\\u0631\"}', 4, '2023-08-24 16:58:50', '2023-08-30 13:05:33'),
(132, '{\"en\":\"Pulley belt\",\"ar\":\"\\u0627\\u0644\\u0628\\u0643\\u0627\\u0631\\u0627\\u062a\"}', 4, '2023-08-24 16:59:56', '2023-08-30 13:04:59'),
(133, '{\"en\":\"Engine cover\",\"ar\":\"\\u063a\\u0637\\u0627\\u0621 \\u0627\\u0644\\u0645\\u0627\\u0643\\u064a\\u0646\\u0629\"}', 4, '2023-08-24 17:02:23', '2023-08-30 13:04:37'),
(134, '{\"en\":\"radiator reservoir\",\"ar\":\"\\u0642\\u0631\\u0628\\u0629 \\u0627\\u0644\\u0631\\u062a\\u0627\\u064a\\u062a\\u0631\"}', 4, '2023-08-24 17:09:05', '2023-08-30 13:04:01'),
(135, '{\"en\":\"steering pump\",\"ar\":\"\\u0637\\u0631\\u0645\\u0628\\u0629 \\u0627\\u0644\\u062f\\u0631\\u0643\\u0633\\u064a\\u0648\\u0646\"}', 4, '2023-08-24 17:09:28', '2023-08-30 13:03:31'),
(136, '{\"en\":\"Wiper \\/ water reservoir\",\"ar\":\"\\u0642\\u0631\\u0628\\u0629 \\u0627\\u0644\\u0645\\u0633\\u0627\\u062d\\u0627\\u062a\"}', 4, '2023-08-24 17:13:35', '2023-08-30 13:02:52'),
(137, '{\"en\":\"Radiator cover\",\"ar\":\"\\u063a\\u0637\\u0627\\u0621 \\u0627\\u0644\\u0631\\u062f\\u064a\\u062a\\u0631\"}', 4, '2023-08-24 17:14:37', '2023-08-24 17:14:37'),
(138, '{\"en\":\"Radiator water reservoir cover\",\"ar\":\"\\u063a\\u0637\\u0627\\u0621 \\u0642\\u0631\\u0628\\u0629 \\u0627\\u0644\\u0631\\u062f\\u064a\\u062a\\u0631\"}', 4, '2023-08-24 17:14:59', '2023-08-30 13:01:23'),
(139, '{\"en\":\"Engine bolts disassemble sign\",\"ar\":\"\\u0627\\u062b\\u0631 \\u0641\\u0643 \\u0641\\u064a \\u0627\\u0644\\u0645\\u0627\\u0643\\u064a\\u0646\\u0629\"}', 4, '2023-08-24 17:15:22', '2023-08-30 12:59:25'),
(140, '{\"en\":\"tiding\",\"ar\":\"\\u062a\\u0643\\u0627\\u064a\\u0629\"}', 14, '2023-08-24 17:21:51', '2023-08-24 17:21:51'),
(141, '{\"en\":\"Saft the mirrors\",\"ar\":\"\\u0635\\u0641\\u0637 \\u0627\\u0644\\u0645\\u0631\\u0627\\u064a\\u0627\\u062a\"}', 14, '2023-08-24 17:22:19', '2023-08-24 17:22:19'),
(142, '{\"en\":\"Tool bag\",\"ar\":\"\\u062d\\u0642\\u064a\\u0628\\u0629 \\u0627\\u0644\\u0623\\u062f\\u0648\\u0627\\u062a\"}', 14, '2023-08-24 17:25:06', '2023-08-24 17:25:06'),
(143, '{\"en\":\"Crane\",\"ar\":\"\\u0631\\u0627\\u0641\\u0639\\u0629\"}', 14, '2023-08-24 17:28:00', '2023-08-24 17:28:00'),
(144, '{\"en\":\"Safety triangle\",\"ar\":\"\\u0645\\u062b\\u0644\\u062b \\u0627\\u0644\\u0633\\u0644\\u0627\\u0645\\u0629\"}', 14, '2023-08-24 17:29:52', '2023-08-24 17:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `car_model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `car_model_extension_id` bigint(20) UNSIGNED DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mileage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `brand_id`, `car_model_id`, `car_model_extension_id`, `year`, `mileage`, `city_id`, `district_id`, `name`, `phone`, `is_approved`, `created_at`, `updated_at`) VALUES
(32, 8, 13, 33, '2023', '<optimized out>#f09fd(TextEditingValue(text: ┤1000├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 6, NULL, 'test', '01023556602', '0', '2023-08-13 18:02:30', '2023-08-13 18:02:30'),
(33, 8, 13, 34, '2021', '<optimized out>#206af(TextEditingValue(text: ┤2000├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'sayed', '01023456776', '0', '2023-08-14 13:06:35', '2023-08-14 13:06:35'),
(41, 7, 11, 67, '2023', '<optimized out>#6b9be(TextEditingValue(text: ┤100├, selection: TextSelection.collapsed(offset: 3, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'test', '01019948320', '0', '2023-09-04 16:37:55', '2023-09-04 16:37:55'),
(42, 7, 11, 41, '2023', '<optimized out>#de630(TextEditingValue(text: ┤1700├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'سيد سيد', '01023557602', '0', '2023-09-04 17:23:55', '2023-09-04 17:23:55'),
(43, 18, 22, 62, '2022', '<optimized out>#fe47b(TextEditingValue(text: ┤10000├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'Aya', '01014141625', '1', '2023-09-04 17:55:49', '2023-09-05 12:44:21'),
(44, 7, 11, 69, '2022', '<optimized out>#d306b(TextEditingValue(text: ┤1608├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 6, NULL, 'sayed', '01018829405', '0', '2023-09-05 11:50:25', '2023-09-05 11:50:25'),
(45, 18, 22, 62, '2023', '<optimized out>#f316e(TextEditingValue(text: ┤50000├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'Aya Elsawy', '01273768603', '0', '2023-09-05 12:47:19', '2023-09-05 12:47:19'),
(46, 7, 11, 67, '2021', 'TextEditingController#69e78(TextEditingValue(text: ┤200├, selection: TextSelection.collapsed(offset: 3, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 7, NULL, 'ؤاؤتر', '59598', '0', '2023-09-05 13:52:03', '2023-09-05 13:52:03'),
(47, 7, 11, 67, '2023', 'TextEditingController#0ee91(TextEditingValue(text: ┤53865├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 7, NULL, 'ؤوبوب', '01006449117', '0', '2023-09-05 13:53:12', '2023-09-05 13:53:12'),
(48, 7, 11, 67, '2020', '500000', 10, NULL, 'test name', '01020304050', '1', '2023-09-05 13:55:52', '2023-09-05 15:16:43'),
(49, 7, 11, 67, '2023', '<optimized out>#64cb2(TextEditingValue(text: ┤├, selection: TextSelection.collapsed(offset: 0, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'سيد', '020', '0', '2023-09-05 18:00:38', '2023-09-05 18:00:38'),
(50, 7, 12, 71, '2021', '<optimized out>#c21dd(TextEditingValue(text: ┤├, selection: TextSelection.collapsed(offset: 0, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 8, NULL, 'gujf', '652', '0', '2023-09-05 20:10:01', '2023-09-05 20:10:01'),
(51, 11, 18, 40, '2023', '<optimized out>#e8eef(TextEditingValue(text: ┤1600├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 6, NULL, 'sayedd', '01018829405', '0', '2023-09-07 10:44:46', '2023-09-07 10:44:46'),
(52, 8, 13, 32, '2022', '<optimized out>#47aea(TextEditingValue(text: ┤2000├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'aya', '01254578764', '1', '2023-09-07 10:51:45', '2023-09-07 11:12:01'),
(53, 8, 13, 32, '2023', '<optimized out>#38543(TextEditingValue(text: ┤1000├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'سيد', '01010', '0', '2023-09-13 12:01:52', '2023-09-13 12:01:52'),
(54, 7, 11, 67, '2023', '<optimized out>#3e9a7(TextEditingValue(text: ┤1212├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'سيد', '01023557602', '0', '2023-09-14 17:25:24', '2023-09-14 17:25:24'),
(55, 7, 11, 69, '2023', '<optimized out>#095b0(TextEditingValue(text: ┤1500├, selection: TextSelection.collapsed(offset: 4, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'سيد', '01023557605', '1', '2023-09-17 11:40:21', '2023-09-17 11:40:52'),
(56, 7, 12, 73, '2023', '<optimized out>#f15d1(TextEditingValue(text: ┤16005├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'سيد', '01018829405', '1', '2023-09-17 11:59:13', '2023-09-17 11:59:50'),
(57, 8, 13, 33, '2020', '500000', 3, NULL, 'test name', '01020304050', '1', '2023-09-17 12:08:58', '2023-09-17 12:09:30'),
(58, 8, 13, 33, '2020', '600000', 3, NULL, 'test name sayed', '01020304050', '1', '2023-09-17 12:14:16', '2023-09-17 12:15:17'),
(59, 7, 11, 67, '2023', '<optimized out>#71bc4(TextEditingValue(text: ┤20000├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'سيد', '01018829405', '1', '2023-09-17 12:16:50', '2023-09-17 12:17:02'),
(60, 7, 11, 67, '2023', '<optimized out>#7e818(TextEditingValue(text: ┤500├, selection: TextSelection.collapsed(offset: 3, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'سيد', '01018829405', '1', '2023-09-19 15:36:33', '2023-09-19 15:37:47'),
(61, 7, 11, 67, '2023', 'TextEditingController#837c3(TextEditingValue(text: ┤50000├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'Harbey', '01141475581', '1', '2023-09-19 20:35:28', '2023-09-19 20:59:19'),
(62, 7, 11, 67, '2023', 'TextEditingController#837c3(TextEditingValue(text: ┤50000├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'Harbey', '01141475581', '0', '2023-09-19 20:57:39', '2023-09-19 20:57:39'),
(63, 7, 11, 67, '2023', 'TextEditingController#837c3(TextEditingValue(text: ┤50000├, selection: TextSelection.collapsed(offset: 5, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'Harbey', '01141475581', '0', '2023-09-19 20:58:04', '2023-09-19 20:58:04'),
(64, 8, 13, 33, '2020', '500000', 3, NULL, 'Harbey12', '01141475581', '0', '2023-09-19 21:02:47', '2023-09-19 21:02:47'),
(65, 8, 13, 35, '2023', 'TextEditingController#24610(TextEditingValue(text: ┤123156├, selection: TextSelection.collapsed(offset: 6, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, '01141475581', '01141475581', '0', '2023-09-19 21:06:36', '2023-09-19 21:06:36'),
(66, 8, 13, 35, '2023', 'TextEditingController#24610(TextEditingValue(text: ┤123156├, selection: TextSelection.collapsed(offset: 6, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, '01141475581', '01141475581', '0', '2023-09-19 21:08:48', '2023-09-19 21:08:48'),
(67, 8, 13, 35, '2023', 'TextEditingController#24610(TextEditingValue(text: ┤123156├, selection: TextSelection.collapsed(offset: 6, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, '01141475581', '01141475581', '0', '2023-09-19 21:11:38', '2023-09-19 21:11:38'),
(68, 8, 13, 35, '2023', 'TextEditingController#24610(TextEditingValue(text: ┤123156├, selection: TextSelection.collapsed(offset: 6, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, '01141475581', '01141475581', '0', '2023-09-19 21:12:30', '2023-09-19 21:12:30'),
(69, 8, 13, 35, '2023', 'TextEditingController#24610(TextEditingValue(text: ┤123156├, selection: TextSelection.collapsed(offset: 6, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, '01141475581', '01141475581', '0', '2023-09-19 21:12:53', '2023-09-19 21:12:53'),
(70, 8, 13, 35, '2023', 'TextEditingController#24610(TextEditingValue(text: ┤123156├, selection: TextSelection.collapsed(offset: 6, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, '01141475581', '01141475581', '0', '2023-09-19 21:14:02', '2023-09-19 21:14:02'),
(71, 8, 13, 35, '2023', 'TextEditingController#24610(TextEditingValue(text: ┤123156├, selection: TextSelection.collapsed(offset: 6, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, '01141475581', '01141475581', '0', '2023-09-19 21:14:11', '2023-09-19 21:14:11'),
(72, 8, 13, 35, '2023', 'TextEditingController#24610(TextEditingValue(text: ┤123156├, selection: TextSelection.collapsed(offset: 6, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, '01141475581', '01141475581', '0', '2023-09-19 21:16:14', '2023-09-19 21:16:14'),
(73, 7, 11, 33, '2022', 'TextEditingController#eb2a3(TextEditingValue(text: ┤408200├, selection: TextSelection.collapsed(offset: 6, affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))', 3, NULL, 'Harney', '01141475581', '1', '2023-09-19 21:17:16', '2023-09-19 22:56:49'),
(74, 11, 19, 45, '2023', '100000', 3, NULL, 'habiba', '01112575801', '0', '2023-09-20 07:16:33', '2023-09-20 07:16:33'),
(75, 7, 11, 67, '2023', '70000', 3, NULL, 'سيد', '0101', '1', '2023-09-20 15:33:51', '2023-09-20 15:55:17');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(11, 'admin', 'admin', '2023-08-28 18:03:01', '2023-08-28 18:03:01');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(5, 11),
(6, 11),
(7, 11),
(8, 11),
(9, 11),
(10, 11),
(11, 11),
(12, 11),
(13, 11),
(14, 11),
(15, 11),
(16, 11),
(17, 11),
(18, 11),
(19, 11),
(20, 11),
(21, 11),
(22, 11),
(23, 11),
(24, 11),
(25, 11),
(26, 11),
(27, 11),
(28, 11),
(29, 11),
(30, 11),
(31, 11),
(32, 11),
(33, 11),
(34, 11),
(35, 11),
(36, 11),
(37, 11),
(38, 11),
(39, 11),
(40, 11),
(41, 11),
(42, 11),
(43, 11),
(44, 11),
(45, 11),
(46, 11),
(47, 11),
(48, 11),
(49, 11),
(50, 11),
(51, 11),
(52, 11),
(53, 11),
(54, 11),
(55, 11),
(56, 11),
(57, 11),
(58, 11),
(59, 11),
(60, 11),
(61, 11),
(62, 11),
(63, 11),
(64, 11),
(65, 11),
(66, 11),
(67, 11),
(68, 11),
(69, 11),
(70, 11),
(71, 11),
(72, 11),
(73, 11),
(74, 11),
(75, 11),
(76, 11),
(77, 11),
(78, 11),
(79, 11),
(80, 11),
(81, 11),
(82, 11),
(83, 11),
(84, 11),
(85, 11),
(86, 11);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `option`, `value`, `created_at`, `updated_at`) VALUES
(36, 'site_logo', '{\"en\":\"http:\\/\\/automobile-egy.com\\/\\/storage\\/829\\/AUTOMOBILE.png\"}', '2023-08-27 15:21:15', '2023-08-31 15:45:07'),
(37, 'phone', '{\"en\":\"01018122222\"}', '2023-08-27 15:21:15', '2023-09-21 18:01:32'),
(38, 'email', '{\"en\":\"info@autombile.com\"}', '2023-08-27 15:21:15', '2023-09-21 18:01:32'),
(39, 'address', '{\"en\":\"Khaled Ibn Al-Waleed Street, off Jihan, Al-Jamaa Al-Mansoura District\",\"ar\":\"\\u0634\\u0627\\u0631\\u0639 \\u062e\\u0627\\u0644\\u062f \\u0628\\u0646 \\u0627\\u0644\\u0648\\u0644\\u064a\\u062f \\u0645\\u062a\\u0641\\u0631\\u0639 \\u0645\\u0646 \\u062c\\u064a\\u0647\\u0627\\u0646 \\u062d\\u0649 \\u0627\\u0644\\u062c\\u0627\\u0645\\u0639\\u0647 \\u0627\\u0644\\u0645\\u0646\\u0635\\u0648\\u0631\\u0647\"}', '2023-08-27 15:21:15', '2023-09-21 18:01:32'),
(40, 'facebook', '{\"en\":\"https:\\/\\/www.facebook.com\\/Automobile.apps\"}', '2023-08-27 15:21:15', '2023-08-30 15:46:43'),
(41, 'twitter', '{\"en\":null}', '2023-08-27 15:21:15', '2023-08-30 15:46:43'),
(42, 'instagram', '{\"en\":\"https:\\/\\/www.instagram.com\\/automobile.app\\/\"}', '2023-08-27 15:21:15', '2023-08-30 15:46:43'),
(43, 'linkedin', '{\"en\":\"https:\\/\\/www.linkedin.com\\/company\\/automobile-app\"}', '2023-08-27 15:21:15', '2023-08-30 15:46:43'),
(44, 'snapchat', '{\"en\":null}', '2023-08-27 15:21:15', '2023-08-30 15:46:43'),
(45, 'tiktok', '{\"en\":null}', '2023-08-27 15:21:15', '2023-08-30 15:46:43'),
(46, 'about_section_title', '{\"en\":\"The Most expert in our field\",\"ar\":\"\\u0627\\u0644\\u0627\\u0643\\u062b\\u0631 \\u062e\\u0628\\u0631\\u0647 \\u0641\\u064a \\u0645\\u062c\\u0627\\u0644\\u0646\\u0627\"}', '2023-08-27 15:21:15', '2023-09-21 18:01:32'),
(47, 'about_section_content', '{\"en\":\"We, \\u201cAutomobile\\u201d, provide services for selling guaranteed used cars and new cars in an easy and convenient way, where you can search, sell and buy through our website and our application on your phone, and we cover all regions of the Arab Republic of Egypt.\",\"ar\":\"\\u0646\\u062d\\u0646 \\u201c\\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u201c\\u060c \\u0646\\u0642\\u062f\\u0645 \\u062e\\u062f\\u0645\\u0627\\u062a \\u0628\\u064a\\u0639 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0627\\u0644\\u0645\\u0636\\u0645\\u0648\\u0646\\u0629 \\u0627\\u0644\\u0645\\u0633\\u062a\\u0639\\u0645\\u0644\\u0629 \\u0648\\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0629 \\u0628\\u0637\\u0631\\u064a\\u0642\\u0629 \\u0633\\u0647\\u0644\\u0629 \\u0648 \\u0645\\u0631\\u064a\\u062d\\u0629\\u060c \\u062d\\u064a\\u062b \\u064a\\u0645\\u0643\\u0646\\u0643 \\u0627\\u0644\\u0628\\u062d\\u062b \\u0648\\u0627\\u0644\\u0628\\u064a\\u0639 \\u0648\\u0627\\u0644\\u0634\\u0631\\u0627\\u0621 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0645\\u0648\\u0642\\u0639\\u0646\\u0627 \\u0627\\u0644\\u0625\\u0644\\u0643\\u062a\\u0631\\u0648\\u0646\\u064a \\u0648 \\u062a\\u0637\\u0628\\u064a\\u0642\\u0646\\u0627 \\u0639\\u0644\\u0649 \\u0647\\u0627\\u062a\\u0641\\u0643\\u060c \\u0648\\u0646\\u063a\\u0637\\u064a \\u062c\\u0645\\u064a\\u0639 \\u0645\\u0646\\u0627\\u0637\\u0642 \\u062c\\u0645\\u0647\\u0648\\u0631\\u064a\\u0629 \\u0645\\u0635\\u0631 \\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629 .\"}', '2023-08-27 15:21:15', '2023-09-21 18:01:32'),
(48, 'about_section_img', '{\"en\":\"http:\\/\\/automobile.matrix-clouds.com\\/end-user\\/assets\\/img\\/about\\/01.png\"}', '2023-08-27 15:21:15', '2023-08-27 15:21:15'),
(49, 'show_section_title', '{\"en\":\"Download AutoMobile App For Free\",\"ar\":\"\\u062a\\u062d\\u0645\\u064a\\u0644 \\u062a\\u0637\\u0628\\u064a\\u0642 \\u0627\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0645\\u062c\\u0627\\u0646\\u0627\"}', '2023-08-27 15:21:15', '2023-09-21 18:01:32'),
(50, 'show_section_content', '{\"en\":\"Automobile is your perfect guide to choosing the car that suits you at the best prices in minutes, whether buying or selling, even if you know nothing about the world of cars.\",\"ar\":\"\\u0623\\u0648\\u062a\\u0648\\u0645\\u0628\\u064a\\u0644 \\u0647\\u0648 \\u062f\\u0644\\u064a\\u0644\\u0643 \\u0627\\u0644\\u0623\\u0645\\u062b\\u0644 \\u0644\\u0627\\u062e\\u062a\\u064a\\u0627\\u0631 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0629 \\u0627\\u0644\\u062a\\u064a \\u062a\\u0646\\u0627\\u0633\\u0628\\u0643 \\u0628\\u0623\\u0641\\u0636\\u0644 \\u0627\\u0644\\u0623\\u0633\\u0639\\u0627\\u0631 \\u0641\\u064a \\u062f\\u0642\\u0627\\u0626\\u0642 \\u0633\\u0648\\u0627\\u0621 \\u0628\\u064a\\u0639 \\u0623\\u0648 \\u0634\\u0631\\u0627\\u0621 \\u062d\\u062a\\u0649 \\u0644\\u0648 \\u0643\\u0646\\u062a \\u0644\\u0627 \\u062a\\u0639\\u0631\\u0641 \\u0634\\u064a\\u0626\\u0627\\u064b \\u0641\\u064a \\u0639\\u0627\\u0644\\u0645 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a.\"}', '2023-08-27 15:21:15', '2023-09-21 18:01:32'),
(51, 'show_section_img', '{\"en\":\"http:\\/\\/automobile-egy.com\\/\\/storage\\/842\\/01.png\"}', '2023-08-27 15:21:15', '2023-08-31 18:54:10'),
(52, 'about_footer_content', '{\"en\":\"There are many variation of passages of lorem ipsum available, but the majority suffered.\"}', '2023-08-27 15:21:15', '2023-08-27 15:21:15'),
(53, 'contact_page_title', '{\"en\":\"WRITE US ANY MESSAGE .\"}', '2023-08-27 15:21:15', '2023-08-27 15:21:15'),
(54, 'contact_page_content', '{\"en\":\"We are committed to providing our customers with exceptional service while offering our employees the best training. There are many variations of passages of lorem ipsum is simply free text available in the market, but the majority have suffered time.\"}', '2023-08-27 15:21:15', '2023-08-27 15:21:15'),
(55, 'download_appstore', '{\"en\":\"https:\\/\\/apps.apple.com\\/app\\/automobile-app\\/id6463718722\"}', '2023-09-02 14:25:21', '2023-09-21 18:01:32'),
(56, 'download_playstore', '{\"en\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=com.automobile.app\"}', '2023-09-02 14:25:51', '2023-09-21 18:01:32');

-- --------------------------------------------------------

--
-- Table structure for table `showrooms`
--

CREATE TABLE `showrooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `showroom_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_tax_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `type` enum('showroom','agency') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `showrooms`
--

INSERT INTO `showrooms` (`id`, `owner_name`, `showroom_name`, `description`, `code`, `password`, `fcm_token`, `phone`, `whatsapp`, `end_tax_card`, `address`, `type`, `is_blocked`, `is_approved`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, '{\"en\":\"Sayed\",\"ar\":\"\\u0633\\u064a\\u062f\"}', '{\"en\":\"Hatla2ee\",\"ar\":\"\\u0647\\u062a\\u0644\\u0627\\u0642\\u064a\"}', '{\"en\":\"You will find cars\",\"ar\":\"\\u0647\\u062a\\u0644\\u0627\\u0642\\u064a \\u0644\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a\"}', '1413', '$2y$10$nPvsUyriHM9eV8VuPfd54.tWYc/1nDH9QB.HGZXm8VtHf159h5q3q', NULL, '+201033322618', '+201033322618', '2025-01-01', NULL, 'agency', 1, 0, NULL, NULL, '2023-08-03 14:16:52', '2023-09-07 15:27:36'),
(8, '{\"en\":\"\\u0648\\u0643\\u0627\\u0644\\u0629\",\"ar\":\"tttt\"}', '{\"en\":\"ogency\",\"ar\":\"test\"}', '{\"en\":\"saqdsfawffefegeg\",\"ar\":\"fefefe\"}', '1421', '$2y$10$vy7tfPbVqc/pNFl1RYj/5ueNSGlVEc5DZ9WHpASwg/X1qAw4uFSyy', 'cGDpMw_vT-CWnJ3pmXXH5g:APA91bGvxEm9nbXNMVFogIMWfcTMW172bnyuhmVXGxWgE-ax3EVjFviNzpCUoCks8jqjukxs83BQdLcdLtW2cUZezN073knbD3unDIm3weTJR8scm9WclWkIID4SP5RsNAFL6Y5oJBts', '123456789', '123456789', '2023-08-01', NULL, 'agency', 1, 0, NULL, NULL, '2023-08-04 15:00:59', '2023-09-07 15:27:36'),
(9, '{\"en\":\"test\",\"ar\":\"tttt\"}', '{\"en\":\"test\",\"ar\":\"test\"}', '{\"en\":\"test\",\"ar\":\"\\u062b\\u0628\\u062b\\u0628\\u062b\"}', '1429', '$2y$10$N3eQdwAlN9HzCJnPyAeV7eegviaGuyX9TcUTDKqUiVUtvtM0MZBmO', NULL, '01006449771', '01006449771', '2023-08-07', NULL, 'showroom', 1, 0, NULL, NULL, '2023-08-07 11:04:34', '2023-09-13 12:07:49'),
(10, '{\"en\":\"Ellithy\",\"ar\":\"Ellithy\"}', '{\"en\":\"Ellithy\",\"ar\":\"Ellithy\"}', '{\"en\":\"El-Laithy Auto Group was established in 2008, and it is one of the largest companies for the trade of cars .\",\"ar\":\"\\u062a\\u0623\\u0633\\u0633\\u062a \\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0644\\u064a\\u062b\\u064a \\u0623\\u0648\\u062a\\u0648 \\u062c\\u0631\\u0648\\u0628 \\u0639\\u0627\\u0645 2008\\u0645\\u060c \\u0648\\u0647\\u064a \\u0648\\u0627\\u062d\\u062f\\u0629 \\u0645\\u0646 \\u0623\\u0643\\u0628\\u0631 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0627\\u062a \\u0644\\u062a\\u062c\\u0627\\u0631\\u0629 \\u0627\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a\"}', '1453', '$2y$10$fykNydfdwflcDrousCD.FeLUemFwDEpCkgYXY08SDms3Ii8YIzRpa', 'fSR0qAxgSgmcnehWyTL1Ai:APA91bHFQp_fsfJju9ppbH7OKvsCIqDiyLtwIUNCNrfxOVEVgDvISLjpihMsy8kTkrjoY0GN2jJdgHTJxQuYVNFCuTTP27I54fWXKXDQjBc-Wi82rjiHWeMfA9vGUwO5E5LNET3EsBxB', '01018829405', '01018829405', '2018-01-01', NULL, 'showroom', 1, 0, NULL, NULL, '2023-08-13 12:33:02', '2023-09-21 22:03:28'),
(11, '{\"en\":\"test1\",\"ar\":\"\\u0623\\u062d\\u0645\\u062f \\u0645\\u062d\\u0645\\u062f\"}', '{\"en\":\"ElKersh Cars\",\"ar\":\"\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0627\\u0644\\u0642\\u0631\\u0634\"}', '{\"en\":\"ElKersh Cars\",\"ar\":\"\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0627\\u0644\\u0642\\u0631\\u0634\"}', '1400', '$2y$10$lg9PtfiFBceO9IfbYCS7j.u6bvD.6.6wpYwaRK257uQMgy6SCS5Re', 'cqUsJVDrSXC0JZd0GIGUra:APA91bEQDuvREw_vYouVq0fwac_4WfiZwglHdcl-zul8CesCaBQ-4CNoFqJsdVx7YSCb12kNAoQ_32_1TiUkHjxmaYU8IcxSEpCg6hsyglWGCNhkKVoxd0uj8ITJ2pZqzUI58bPRPhQa', '123456789', '123456789', '2026-05-06', NULL, 'agency', 1, 0, NULL, NULL, '2023-08-13 13:03:52', '2023-09-21 21:12:41'),
(13, '{\"en\":\"Diaa\",\"ar\":\"\\u0636\\u064a\\u0627\\u0621\"}', '{\"en\":\"Diaa Motors\",\"ar\":\"\\u0636\\u064a\\u0627\\u0621 \\u0645\\u0648\\u062a\\u0648\\u0631\\u0632\"}', '{\"en\":\"\\u0627\\u062d\\u062f\\u062b \\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0645\\u0639\\u0631\\u0636 \\u0636\\u064a\\u0627\\u0621 \\u0645\\u0648\\u062a\\u0648\\u0631\\u0632 \\u0644\\u0644\\u0628\\u064a\\u0639 \\u0641\\u064a \\u0645\\u0635\\u0631\\u060c \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0631\\u0642\\u0627\\u0645 \\u0647\\u0648\\u0627\\u062a\\u0641 \\u0648\\u0639\\u0646\\u0627\\u0648\\u064a\\u0646 \\u0627\\u0644\\u0641\\u0631\\u0648\\u0639 \\u0644\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0648\\u0627\\u0644\\u0627\\u0633\\u062a\\u0639\\u0644\\u0627\\u0645\",\"ar\":\"\\u0627\\u062d\\u062f\\u062b \\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0645\\u0639\\u0631\\u0636 \\u0636\\u064a\\u0627\\u0621 \\u0645\\u0648\\u062a\\u0648\\u0631\\u0632 \\u0644\\u0644\\u0628\\u064a\\u0639 \\u0641\\u064a \\u0645\\u0635\\u0631\\u060c \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0631\\u0642\\u0627\\u0645 \\u0647\\u0648\\u0627\\u062a\\u0641 \\u0648\\u0639\\u0646\\u0627\\u0648\\u064a\\u0646 \\u0627\\u0644\\u0641\\u0631\\u0648\\u0639 \\u0644\\u0644\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0648\\u0627\\u0644\\u0627\\u0633\\u062a\\u0639\\u0644\\u0627\\u0645\"}', '1463', '$2y$10$fdcvsPKRKU17XULGuBNN2utaGyCbyXDvMGxcMU0zdayr1j2fucdRa', 'e5kSpeXWSIKUgpwXdrt2vZ:APA91bH9brDIkbk9ZFHrher3CP8DtrEYFX_GFJgqp752t2z0r9MyHthrg8xaTuLSyx6AlrCdphKE_lJJ_YTHb3e5IDKi5b7nRc_qHXUnDUUmfHJQ-RI2OlYsv_I9ruJNjOnn2pLeje9J', '01111111112', '011111111111', '2023-08-24', NULL, 'agency', 1, 0, NULL, NULL, '2023-08-24 11:53:34', '2023-09-21 21:12:42'),
(14, '{\"en\":\"Egyptian Motors\",\"ar\":\"\\u0627\\u0644\\u0645\\u0635\\u0631\\u064a\\u0629 \\u0644\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a\"}', '{\"en\":\"Egyptian Motors\",\"ar\":\"\\u0627\\u0644\\u0645\\u0635\\u0631\\u064a\\u0629 \\u0644\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a\"}', '{\"en\":\"Egyptian Motors\",\"ar\":\"\\u0627\\u0644\\u0645\\u0635\\u0631\\u064a\\u0629 \\u0644\\u0644\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a\"}', '1471', '$2y$10$KseF.0urVIc8WG.h1A.DEemaS6VKtMtMH5vxHvQ9qDsMPewVWs2bq', NULL, '01090080070', '01090080070', '2023-08-01', NULL, 'showroom', 1, 0, NULL, NULL, '2023-09-18 13:30:32', '2023-09-21 21:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"new sports cars 2023\",\"ar\":\"\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u0631\\u064a\\u0627\\u0636\\u064a\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629 2023\"}', NULL, '2023-07-19 13:14:55', '2023-08-06 14:50:56'),
(3, '{\"en\":\"New cars 2023\",\"ar\":\"\\u0633\\u064a\\u0627\\u0631\\u0627\\u062a \\u062c\\u062f\\u064a\\u062f\\u0629 2023\"}', NULL, '2023-08-06 10:28:24', '2023-08-06 10:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `register_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mobile',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_blocked` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `register_from`, `phone`, `is_blocked`, `email_verified_at`, `password`, `fcm_token`, `deleted_at`, `remember_token`, `created_at`, `updated_at`, `city_id`, `district_id`) VALUES
(1, 'user', 'user@admin.com', 'mobile', NULL, '1', NULL, '$2y$10$WLIOzwtWPq.KTCBN4R8mt.sYE5sqWz4N9hC5rA1sYbIPh4MrLE6ZG', NULL, NULL, NULL, '2023-08-27 15:21:15', '2023-09-21 22:05:05', NULL, NULL),
(12, 'please don\'t delete', 'mahmoudsalah@test.com', 'mobile', '01006449771', '1', NULL, '$2y$10$SBP9znLUD.2jYxNB/jQ.1OB.1Kn4AXI7/US.SA7zfLFvlC3dIVuZq', 'f9k0tU9mSNCh5x6jVoJ40P:APA91bEFarvOUSRGpaIzR36O5o6DJ1sde5V1b410PGebaziL8EdPF5OmqjgEHC_yur_Bj-fkNUyJ8wQ91GCgf2vMBvjp5iPtOqaN5kdqBYvMv2LBL5Z0yU8BzfSATNczq4uTo5XxtxjL', NULL, NULL, '2023-08-01 11:47:49', '2023-09-21 22:05:09', NULL, NULL),
(13, 'user1', 'user1@test.com', 'mobile', '01112575801', '1', NULL, '$2y$10$RLCNvZLG3.rWxS6gmnFSVe.uodLvD/yp8aO/Op23G3dQ5qvQ7Amfi', 'cqpp-zUQR7mYLlMiaxFp9-:APA91bHw7wPaWNoQFoCGqdCDGIgdqQC04kUkoyfy86gIn0qoR7d_WHhWf55_-vNBlozU4SB6bu2I2C76r2lTV4DLTs7oA4gZYvy9DUTEOYDTOdOxXa3EeU1_hLr0jSgwd-afNvlIoy3c', NULL, NULL, '2023-08-05 09:42:15', '2023-09-21 22:05:12', NULL, NULL),
(14, 'sayed', 'sayed11@gmail.com', 'mobile', '01018829405', '1', NULL, '$2y$10$t/7RDylZ4qfcGjdqcmPBdO2syTeeV2q0qRjucqk.UAFlxp8Q6S7jq', NULL, NULL, NULL, '2023-08-10 15:40:08', '2023-09-21 22:05:15', NULL, NULL),
(15, 'test', 'test1@gmail.com', 'mobile', '01987654321', '1', NULL, '$2y$10$PdNTqkNAr2apbvRoOcm7hODRMjEqAGKyI/jVMjjV5.dSL1ztOG69S', NULL, NULL, NULL, '2023-08-10 16:15:39', '2023-08-24 16:38:25', NULL, NULL),
(16, 'aya Elsawy', 'ayaalaa8.matrix@gmail.com', 'mobile', '01014141625', '1', NULL, '$2y$10$Zw49i4ToWJNZ7RZ6CrYfSuY3l.JejSsFpzHZcz6JgqH2skKlX4//i', NULL, NULL, NULL, '2023-08-13 12:56:45', '2023-09-21 22:05:19', NULL, NULL),
(17, 'eesayed', 'sayd12@gmail.com', 'mobile', '01023557605', '1', NULL, '$2y$10$dAwZRaBqUAaNhXhcOu8eIuUGRL.iRZElso0iwRAfcMHR7x.RFVGgS', NULL, NULL, NULL, '2023-08-13 18:06:57', '2023-09-21 22:05:22', NULL, NULL),
(18, 'sayedee', 'sayd33@gmail.com', 'mobile', '01054785438', '1', NULL, '$2y$10$p0gIHmpxnzFToKzFpN2tiu6zBZHoP5W9co4iABFNKC3hWW5qi.4g.', NULL, NULL, NULL, '2023-08-13 18:08:36', '2023-08-24 18:18:39', NULL, NULL),
(19, 'testbjhb', 'sss@sss.com', 'mobile', '01006449778', '1', NULL, '$2y$10$6JQhbeROpuafuQafmJ8rCuhaE./HTLjPEj4fQdZLIheAIfdlDsyRi', NULL, NULL, NULL, '2023-08-13 18:09:35', '2023-08-24 16:38:31', NULL, NULL),
(20, 'سيد', 'sayed@gmail.com', 'mobile', '01055993344', '1', NULL, '$2y$10$yiaEEPRSeKcptbqs2UFOSexI2SSpmHVbcyqKWjsVrSXhPN/s8e7PG', 'cz7TSkJhTBW4NZfVhchaJf:APA91bEcd9ZZCCAiUHDcIb5EmSrJZblWuYnQG585iVpMugD4BG4L99BQ_HOymv8OmA6OUULCdRZIPYRVokTV2NWMsbyL2gp3po0UnGEkcrTjcomv3nSecg4l1_MCxajnsnQIKSoPS8zQ', NULL, NULL, '2023-08-14 17:36:39', '2023-09-21 22:04:59', NULL, NULL),
(21, 'salma', 'salmamatrix92@gmail.com', 'mobile', '01148407074', '1', NULL, '$2y$10$beroFxGBY3ufSCCByFCszu8WTfEO2AFebSxvOvNqxHa0q8fudxBhG', NULL, NULL, NULL, '2023-08-24 12:52:53', '2023-09-03 14:45:05', NULL, NULL),
(22, 'please', 'testman@test.com', 'mobile', '01006445798', '1', NULL, '$2y$10$/.BULP3qGMetEC6Mnweev.pumozrsEmY/T7o3uNtXCW9SFQcTNbHe', NULL, NULL, NULL, '2023-08-29 16:27:53', '2023-09-21 22:05:30', NULL, NULL),
(23, 'testman2@test.com', 'testman28@test.com', 'mobile', '0102469977', '1', NULL, '$2y$10$YVE6ppu2pMO9urwthDVVK.ztMbx.OINpw7wPMf5uusCxOQfljH41e', 'dcIHpSGsPi3PDO3HIdXbig:APA91bGRSWH6sHJoLB4lrNWv-4A85lgFbm7JWpS7MrUE5eE82QR5RP2oDDphHA-c-bOiqcbxz37NAHFsD4_1S3uzMGZdewFx8kl2D3oxz0i14_zYhhcWtnQBDP4B4Uu5a_lYsunEuffl', NULL, NULL, '2023-08-30 17:38:52', '2023-09-21 22:05:33', NULL, NULL),
(24, 'testman24444555', 'testman28565@test.com', 'mobile', '0102469999', '1', NULL, '$2y$10$PLPat.ZHkFZfbD/y/IwDGOsVAUxHsQNC7BQuKIJj6QAZQlc01CFsq', 'dcIHpSGsPi3PDO3HIdXbig:APA91bGRSWH6sHJoLB4lrNWv-4A85lgFbm7JWpS7MrUE5eE82QR5RP2oDDphHA-c-bOiqcbxz37NAHFsD4_1S3uzMGZdewFx8kl2D3oxz0i14_zYhhcWtnQBDP4B4Uu5a_lYsunEuffl', NULL, NULL, '2023-08-30 17:39:39', '2023-09-21 22:05:35', NULL, NULL),
(25, 'testman245', 'testman245@test.com', 'mobile', '0102469933', '1', NULL, '$2y$10$Sx5vV1sJ3IHGYtJP9txZoeboG02uNgrSwGmOPx0FeHzgbvoRu7A2e', NULL, NULL, NULL, '2023-09-01 18:12:24', '2023-09-21 22:05:38', NULL, NULL),
(26, 'mahmoud salah', 'mssf032@gmail.com', 'mobile', '01099106281', '1', NULL, '$2y$10$81UObhjoZRMV0k4gpWDQLue2lTq5N9jPUIIDnjTMrd6ZwSAz4rNWq', NULL, NULL, NULL, '2023-09-03 21:19:33', '2023-09-21 22:05:42', NULL, NULL),
(27, 'Aya', 'aya1.test@gmail.com', 'mobile', '01273768603', '0', NULL, '$2y$10$rUcg4tZtIq3a52RENDsUl.qEboZ.NdfS3mF/C98LAs4NseJhJ0v0q', 'eCeqOj22R2-6Vck4ig3CR_:APA91bFA6fs5xyVhbfu_1tb1Mm1C1GHBb1KZfs2rux6dfT0St5EV_QlSNFgVDgMw9yUKXxvSs8BaQCtNQr2Ut95Az8zpFTFVltg4-VOjlhztwMIpw7BsT1uasTu-KvMkrOBgYKdS8fqM', '2023-09-08 21:38:37', NULL, '2023-09-04 15:28:12', '2023-09-08 21:38:37', NULL, NULL),
(28, 'Dev', 'jdl@dev.com', 'mobile', '1010101010', '1', NULL, '$2y$10$FugLMzCGmZtBzs9cgufDmO2WjfOZXtcOSYbI3iENvn3JAT4fbypfm', 'f8Maw0ROyUL7jkjshFAy73:APA91bGHWk52DJ4wCu-OBa76dKWM8juk-0yO_-oP34fvx6TXh8K1Nx0N5fBbvNDv6N0iSct6CaApWdgzkCNyPxKVPMPGK0u_VlwaEZqB2M12yzvFVt6KbA5uhIbX4nFBBfVzE_zCVpgy', NULL, NULL, '2023-09-05 23:02:42', '2023-09-21 22:05:45', NULL, NULL),
(29, 'AAa', 'aya2@gmail.com', 'mobile', '01254578764', '1', NULL, '$2y$10$wqQ/F92SjBjvlzSUBm9whOt4h.CBDl9temEEQiYamNuzw7M61HGo.', 'fAXLeIkqTnil817qIeT9a_:APA91bGkSk5pSwavTpBUG5jm4BO5P8nlcwGbQHAJZdedm079Xok-dGr_bXY8Og-sUTB5D6IQvj4caFjwUu33IPMlUkq2dEYHQqu08lO3UM254CUxqb1y_c1wyrcGV_THB7NmExqLDD6r', NULL, NULL, '2023-09-07 10:24:03', '2023-09-21 22:05:48', NULL, NULL),
(30, 'developer', 'developer@developer.com', 'mobile', '01010101010', '0', NULL, '$2y$10$7Ocj2wqgT0gi0i8OZAsZveLpjgPq332MqqxZvUdGnARxfC6JThWBO', NULL, NULL, NULL, '2023-09-08 21:22:13', '2023-09-21 22:05:58', NULL, NULL),
(31, 'developer ios', 'developer_ios@developer.com', 'mobile', '01011001100', '0', NULL, '$2y$10$tIEbx71Bos1Q4ojXSDJ9CuutcJ9JptrJEOXVH8v3jflT2s0Uho3RW', 'cNYDO8nXpU2FnlWlpy5Pf-:APA91bEhATtqUfOPlhXHMOz3S4ZW54ryNv8gCPVevp3Nrvx53KGH9Dp50fUJh_20xkIAvKtYHn4mw1XPhyLp1YWKTF1VVJHnGLUDWDuYM_idiqfbN6P8lWHL3biMnEFJPt431YvYRORR', NULL, NULL, '2023-09-08 21:42:12', '2023-09-09 04:00:24', NULL, NULL),
(32, 'Hubert', 'Hsokolowski99@gmail.com', 'mobile', '514576272', '0', NULL, '$2y$10$Gy8xOxVLSKBLf7D6z6LRDejgVsbdjLlLAvLMIRK0NBGnoCiCMw472', 'dgH_VPVhzkrNvrbeR_O-4R:APA91bFVi_NLpCwLx8osEhQClma1VUvocE7AHHetmEFZ5a3UPpdGuaNTPZrt2MiIMDImCBK9uonSMhKoTwKldwPuTS7h3ct00UAF6w7Tny7db0LgGjLuTgC7qjS1KAZPe1k7OEGSQnAf', NULL, NULL, '2023-09-09 13:44:25', '2023-09-09 13:44:25', NULL, NULL),
(33, 'Mariia', 'mariadrizhiruk@gmail.com', 'mobile', '0766138226', '0', NULL, '$2y$10$FbqSDzOIcVu8vZeKHzlLU.XwBTLikzplfEceqvgmRqgBuIbp8RUki', 'fFpuUGmfOUy4r-hMBE37Rb:APA91bH2l1MSM4yei9WuiYHDoEjJoyNnbYUM_hSeH4h68E0kHYqnywAm6t_N-Q7fqE6IIPzvZaAVM2EEZ8MZCTSC66JJwws0nWQIkPs_Of_51ml8_33Tdva4Kdf05jk3o9rjKuDjAvuA', NULL, NULL, '2023-09-10 13:01:49', '2023-09-10 13:01:49', NULL, NULL),
(34, 'luis', 'lugubafe@gmail.com', 'mobile', '672314100', '0', NULL, '$2y$10$Q7.NRt6U6tSDPS6/cM6C0uc7L.gV9/m.YprtbQX/lEkY6eD6zmmOy', 'fiOeiXAzJ0hJvO-OZNcZSB:APA91bEE6Qgv_Czc5J-hwxJhP_F7ftC20u-hiNHG4OIp8uxgij0FJoCxmaxXkAVgnAs_icF7-02ZO-MeL4paJ3wjXW9Jhpwt7JSwhXUJEdjwaUNTXw1PoAMByHwpwdyPrpwyiXrg2enN', NULL, NULL, '2023-09-10 22:48:00', '2023-09-10 22:48:00', NULL, NULL),
(35, 'new554', 'new@test.com', 'mobile', '01006649981', '1', NULL, '$2y$10$mS1sVd4iP9C7TCm2ygiLw.8wzWQtA9.Bkb6pt0YncUNZinOhq.Nnq', 'fmEGRB1zTlebaxqUqx5Nyr:APA91bGW8_ypcR47KpNWv1muDlIlFV2c3Ji9MmgFHp0z7eBo9FCPwqH9WXclGnUK7BoUrKd1oANVrPGBRqWIMjgCla59I0S_g4zAQna1PnvR_omjeiX4EcAps2mepkS3vcdR8jfqmdwv', NULL, NULL, '2023-09-10 23:14:00', '2023-09-21 22:06:08', NULL, NULL),
(36, 'Ahmad gul', 'ahmad_gul21@icloud.com', 'mobile', '01773732554', '0', NULL, '$2y$10$Q88j3uRJM0uNUU9TIHY4qeu6sAXETBBB9MdgFYMf./fxDFeQdMX9.', 'dcpItXe_X0a8tkFwcFojdT:APA91bFahaLcA4WKf4ZsaPc6Q7npq59CQ6c5j2qYU88T3p8SUKX8NgFw1hHhZ5jC7VhRZWBYL2iSUQ0ZXULc0sco7khUaCYoVOUuQmSrS5Iw9inJwz0g7lbZJ8AT3oPOf2RPBpJgz_z8', NULL, NULL, '2023-09-10 23:46:44', '2023-09-10 23:46:44', NULL, NULL),
(37, 'alaa elgyar', 'alaaelgyar5@gmail.com', 'mobile', '96656520232', '0', NULL, '$2y$10$TNF1wAHzA8eJ.L5Hznbee.7u4Da6Ap7XPifelbDbAdk8MhaBVPS/.', 'eUdC0jwssEADnZLUtW1k7k:APA91bGr7NRg7a3FucaK82o9l5PiX1qSD5BGGWCh8f0CNRYs05JVOqto1u4LNV-ZM9q27VZ_YaczeEQqwqZFYsMIzL0m5K19prLfldpp-CFrx9uUgyHDMsvMnXEJepI_hM3gw16pfNhP', NULL, NULL, '2023-09-11 16:45:15', '2023-09-11 16:45:15', NULL, NULL),
(38, 'testToday', 'testsite@test.com', 'mobile', '01030509077', '0', NULL, '$2y$10$q.qCaNRIZZvQR/hNI7/7..YmiFaHlDuj97WQj8/QwiBfeXpgGwiy6', NULL, NULL, NULL, '2023-09-11 16:52:17', '2023-09-11 16:53:07', NULL, NULL),
(39, 'Abdelhamid Sherif', 'elshater200800@yahoo.com', 'mobile', '01555858104', '0', NULL, '$2y$10$nmXcauUIUGj.2j9ZFybfleGLmmPE8An.432MgrbMDP.J.zmO7JlQu', 'd_C0R_R070zluxyzTL2G3K:APA91bF328PCknxVV8aYHZzePNpGYltJsecLVOjk83OCTEZIOKvM1BoylTqIxPTRlbMoDtv7baaAD2EdBITcJnQuKB1heZ-BMgT3z0RiMhkBsKMCPsxHPofZSlusG7i02HBR2QEjWo4b', NULL, NULL, '2023-09-11 19:09:34', '2023-09-11 19:09:34', NULL, NULL),
(40, 'Pearl CN Gwamanda', 'gwam@mweb.co.za', 'mobile', '0824526345', '0', NULL, '$2y$10$FFrYJ3kIM0HWzSSubVugqeNAnbi1iwMphASCSqHK92mcNwv/Uyp56', 'c4lMrorIGEgek9WkuGRn5r:APA91bHD5rSokPDHaZYnnX-sQwKfzNFajrMGR7OnfrUMvz_oFYGGRICs2fLWQOOjonM5i4oG6pmRdpeMRKLN76hcNbVznQrXcFylraBO-ko7E0FC5-7sX3c8S0x_OItDUEN1f5r45VYI', NULL, NULL, '2023-09-11 22:01:24', '2023-09-11 22:03:34', NULL, NULL),
(41, 'onalaja abdulquadri', 'onalajaabdulquadri@gmail.com', 'mobile', '07046402405', '0', NULL, '$2y$10$fGR0lKACGYyVa..fzKceWuLkKCpL36n4qlSYkX1v9vj79sSeULmaS', 'ero-A7ludENCqv0UIqkhW6:APA91bFgT5N8pxvHeEjbT7kpoLG8D3mkKIP-BNmAZDj29YWk877ACsq-4aQQdVP4rYaIeFZj8-fRpJLGFeD9Qbztb6rhGuV-5yP_pzB8QGDa3TJaElCdeS59CRIKfzZhWb6sitEqQLno', NULL, NULL, '2023-09-12 10:50:22', '2023-09-12 10:50:22', NULL, NULL),
(42, 'Ahmedhelaly', 'Ahmedhelaly1991@gmail.com', 'mobile', '0590777399', '0', NULL, '$2y$10$p4sS7/r6p4KK/yXLMbahLexjutxomV8i/PAyCUgYcbsPaBJLntOe2', 'eTsDQ9Jl907juhD6cahOJa:APA91bH11uWmKluUDy2Es3MnO8Hq_3MxzH2AxWE42eyM1hbWxiZfkRxC-tZhD1j4hvfJrJeXPQAqM2qy0BJNbHa5ozO9yXHjqJ5qbZPRCeJUrw3vQf12qic0IMIoaYIEGZ52iLvY9g0G', NULL, NULL, '2023-09-12 14:02:12', '2023-09-12 14:02:12', NULL, NULL),
(43, 'Tiago Miguel Pereira Cortez', 'tiago.cortez.87@gmail.com', 'mobile', '914538044', '0', NULL, '$2y$10$Ujq8XENMnO9jdNzFiNpmxum6O.XxGmqost9XIekROy1ZmE00QdA6a', 'fZWdI3QKAUYZpE55KmTgbX:APA91bHMmj2pshXz4hoNmKlOLd43yrU_4C0tZILy9cb1oY1r_FFEXXL90cV4LN-bmiEudHg2czEQHhAd0RMBDlOAQUhrD0cotlnPhSkYrLzr3nioJvg-mEUbRsaKTwaS1zkjFsY00PKZ', NULL, NULL, '2023-09-12 15:01:02', '2023-09-12 15:01:02', NULL, NULL),
(44, 'Mohamed Harpy', 'mohamedharpy04@gmail.com', 'mobile', '00966569054', '0', NULL, '$2y$10$Of.psiVEUmv8XEdBT.uIU.115eDV.7WgkzIP6Mo8MpqmEWGXlLR2.', 'dUFkMtb2T2aOcb8KERWetE:APA91bHBumWm7kwd6t2e-TQPzfWDEO1an7c6Hu-8VraSGq2giki3quacUOYiG-q30YPhJSwa4jFaWlDPkpwr_JZ8aOIySDZUXa-0ad9S-pnddCVzQ1XMQRnIj0nQ8hqZQsXzfpS4ZfoI', NULL, NULL, '2023-09-12 15:15:49', '2023-09-21 22:04:41', NULL, NULL),
(45, 'Ahmed Mohamed', 'wama554@gmail.com', 'mobile', '0507684492', '0', NULL, '$2y$10$5Y7/qci8PdPcNxzFLAg/C.xZk9kX7BMTqYIOjVoZ3hUUCYCzN/GA2', 'cieNRVp5R0i0uxhrn7l9eV:APA91bH8y3kdqYjr9O3pyo0zRbmt7eNihjXqRjZPY7I46uNxDW4KUdB-uE__aMBv4m6-HJIZ0ilj1swjnZX1a_MAfLr-OtXi-oCqQtcJykVebv1NWdoN_gc6nz5LdBU7Hpodj6J7smUx', NULL, NULL, '2023-09-12 15:46:09', '2023-09-21 22:04:29', NULL, NULL),
(46, 'Siaw Theophilus Sakyi', 'theophilussiaw@email.com', 'mobile', '0556674091', '0', NULL, '$2y$10$ItKpqi1E.CENotaeKVLzaeMM9SVHqjufSat5q5bQycUjAOggFvrpG', 'c8VFG7d37Earlg-LzYWJEY:APA91bECMyxU8Wkix2lq0TsmFtUwvkdB5naOyGPjTe-tt1Bq4u7vuw7EGiOajR6NdhN6vKCpOb1IxQ89RYjt2B_dFWFVKHLsJ8AuuzwYo9hc1Aj-7yCuzthVe1HZowfJQwUNMpzECZ05', NULL, NULL, '2023-09-12 20:22:50', '2023-09-21 22:04:47', NULL, NULL),
(47, 'Amelia Jakutowicz', 'aameliajakutowicz@gmail.com', 'mobile', '503878593', '0', NULL, '$2y$10$ZFbj9jmtdkpu.po8.0jpB.xHGLbhEvWHeYMp7EXUdyNowqaREA2nK', 'exRhUtMoMklXmy66Rk6cCF:APA91bHqCd2TYWXH8g_N1QD5kAkFU2yvWpf_hfgCEOTXMdPbPTRjzfKPsfV3rFdhdKUIkOc6bIZ_iTaXFF0xVftRPTYGcSM3omqaWhekJ_VHIC6BLmMYDYz3ruLYzyz5I0A7mfFJO5iW', NULL, NULL, '2023-09-13 11:20:40', '2023-09-21 22:04:51', NULL, NULL),
(48, 'Yaw Kyeremeh Tutu', 'tutuyawkyeremeh@yahoo.com', 'mobile', '0247068188', '1', NULL, '$2y$10$dxGxDfJ3etZ1JqrwFXs9u.tlcg4g9Nv9OTGqzKRTWyHoK6UwvaBRG', 'fReznTmj5UD2gE267FpHjB:APA91bFbUKvB_dnI0EVUT6YczpUvdmbbNQO_cLSBNmPGZWstnTtWySrpj1aweQppnYIL48L0CRjg5et2bEZkD2ONSC3MGlWZ9no6yHIHuFi_Yg8UdQZhYM7JeBvGczEc2gW2Sh1C9fib', NULL, NULL, '2023-09-14 14:25:33', '2023-09-21 22:03:49', NULL, NULL),
(49, 'Harbey', 'dsfsdf@test.com', 'mobile', '01008549981', '1', NULL, '$2y$10$eYZJbGt4GjaUqlAEnzKW.uXdV3sCEKL6B5gytow9KEi347yBqNxCy', NULL, NULL, NULL, '2023-09-17 21:02:09', '2023-09-21 22:03:40', NULL, NULL),
(50, 'sa', 'sa@gmail.com', 'mobile', '01010101012', '1', NULL, '$2y$10$.wSUPCV6ii6xdvF98GlWtu5XMTEMX8d543gFbfzBj0wQb1PpMfuU.', 'cz7TSkJhTBW4NZfVhchaJf:APA91bEcd9ZZCCAiUHDcIb5EmSrJZblWuYnQG585iVpMugD4BG4L99BQ_HOymv8OmA6OUULCdRZIPYRVokTV2NWMsbyL2gp3po0UnGEkcrTjcomv3nSecg4l1_MCxajnsnQIKSoPS8zQ', NULL, NULL, '2023-09-18 12:40:15', '2023-09-21 22:03:37', NULL, NULL),
(51, 'a', 'a@gmail.com', 'mobile', '010000', '1', NULL, '$2y$10$k6Kvx39CKZgvSd2BvipScO6VoxYEOhYzngN0VCsGBzQue1lE/n.7m', NULL, NULL, NULL, '2023-09-21 21:48:45', '2023-09-21 22:03:35', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_showroom_id_foreign` (`showroom_id`),
  ADD KEY `branches_city_id_foreign` (`city_id`),
  ADD KEY `branches_district_id_foreign` (`district_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_brand_id_foreign` (`brand_id`),
  ADD KEY `cars_car_model_id_foreign` (`car_model_id`),
  ADD KEY `cars_car_model_extension_id_foreign` (`car_model_extension_id`),
  ADD KEY `cars_branch_id_foreign` (`branch_id`),
  ADD KEY `cars_city_id_foreign` (`city_id`),
  ADD KEY `cars_district_id_foreign` (`district_id`),
  ADD KEY `cars_request_id_foreign` (`request_id`),
  ADD KEY `cars_color_id_foreign` (`color_id`),
  ADD KEY `cars_car_type_id_foreign` (`car_type_id`);

--
-- Indexes for table `car_models`
--
ALTER TABLE `car_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_models_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `car_model_extensions`
--
ALTER TABLE `car_model_extensions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_model_extensions_car_model_id_foreign` (`car_model_id`);

--
-- Indexes for table `car_model_years`
--
ALTER TABLE `car_model_years`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_model_years_car_model_id_foreign` (`car_model_id`);

--
-- Indexes for table `car_options`
--
ALTER TABLE `car_options`
  ADD KEY `car_options_car_id_foreign` (`car_id`),
  ADD KEY `car_options_feature_option_id_foreign` (`feature_option_id`);

--
-- Indexes for table `car_reports`
--
ALTER TABLE `car_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_reports_car_id_foreign` (`car_id`),
  ADD KEY `car_reports_report_option_id_foreign` (`report_option_id`);

--
-- Indexes for table `car_types`
--
ALTER TABLE `car_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `districts_city_id_foreign` (`city_id`);

--
-- Indexes for table `extension_models`
--
ALTER TABLE `extension_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extension_models_car_model_id_foreign` (`car_model_id`),
  ADD KEY `extension_models_car_model_extension_id_foreign` (`car_model_extension_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`),
  ADD KEY `favorites_car_id_foreign` (`car_id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_options`
--
ALTER TABLE `feature_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feature_options_feature_id_foreign` (`feature_id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id_increment`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_options`
--
ALTER TABLE `report_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_options_report_id_foreign` (`report_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requests_brand_id_foreign` (`brand_id`),
  ADD KEY `requests_car_model_id_foreign` (`car_model_id`),
  ADD KEY `requests_car_model_extension_id_foreign` (`car_model_extension_id`),
  ADD KEY `requests_city_id_foreign` (`city_id`),
  ADD KEY `requests_district_id_foreign` (`district_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `showrooms`
--
ALTER TABLE `showrooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_city_id_foreign` (`city_id`),
  ADD KEY `users_district_id_foreign` (`district_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agencies`
--
ALTER TABLE `agencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `car_models`
--
ALTER TABLE `car_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `car_model_extensions`
--
ALTER TABLE `car_model_extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `car_model_years`
--
ALTER TABLE `car_model_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `car_reports`
--
ALTER TABLE `car_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=706;

--
-- AUTO_INCREMENT for table `car_types`
--
ALTER TABLE `car_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `extension_models`
--
ALTER TABLE `extension_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `feature_options`
--
ALTER TABLE `feature_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=509;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=929;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id_increment` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `report_options`
--
ALTER TABLE `report_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `showrooms`
--
ALTER TABLE `showrooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branches_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branches_showroom_id_foreign` FOREIGN KEY (`showroom_id`) REFERENCES `showrooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `cars_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cars_car_model_extension_id_foreign` FOREIGN KEY (`car_model_extension_id`) REFERENCES `car_model_extensions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cars_car_model_id_foreign` FOREIGN KEY (`car_model_id`) REFERENCES `car_models` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cars_car_type_id_foreign` FOREIGN KEY (`car_type_id`) REFERENCES `car_types` (`id`),
  ADD CONSTRAINT `cars_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `cars_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `cars_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `cars_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `car_models`
--
ALTER TABLE `car_models`
  ADD CONSTRAINT `car_models_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `car_model_extensions`
--
ALTER TABLE `car_model_extensions`
  ADD CONSTRAINT `car_model_extensions_car_model_id_foreign` FOREIGN KEY (`car_model_id`) REFERENCES `car_models` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `car_model_years`
--
ALTER TABLE `car_model_years`
  ADD CONSTRAINT `car_model_years_car_model_id_foreign` FOREIGN KEY (`car_model_id`) REFERENCES `car_models` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `car_options`
--
ALTER TABLE `car_options`
  ADD CONSTRAINT `car_options_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `car_options_feature_option_id_foreign` FOREIGN KEY (`feature_option_id`) REFERENCES `feature_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `car_reports`
--
ALTER TABLE `car_reports`
  ADD CONSTRAINT `car_reports_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `car_reports_report_option_id_foreign` FOREIGN KEY (`report_option_id`) REFERENCES `report_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feature_options`
--
ALTER TABLE `feature_options`
  ADD CONSTRAINT `feature_options_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `report_options`
--
ALTER TABLE `report_options`
  ADD CONSTRAINT `report_options_report_id_foreign` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `requests_car_model_extension_id_foreign` FOREIGN KEY (`car_model_extension_id`) REFERENCES `car_model_extensions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `requests_car_model_id_foreign` FOREIGN KEY (`car_model_id`) REFERENCES `car_models` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `requests_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `requests_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `users_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
