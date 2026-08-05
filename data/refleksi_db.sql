-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 05, 2026 at 07:03 AM
-- Server version: 11.3.2-MariaDB-log
-- PHP Version: 8.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `refleksi_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `resource_type` varchar(50) NOT NULL,
  `resource_id` varchar(100) DEFAULT NULL,
  `old_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `sponsor_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `creative_url` varchar(500) DEFAULT NULL,
  `placement` varchar(50) DEFAULT 'idle_screen',
  `target_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`target_config`)),
  `schedule_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`schedule_config`)),
  `priority` int(11) DEFAULT 0,
  `weight` int(11) DEFAULT 1,
  `status` varchar(20) DEFAULT 'draft',
  `valid_from` datetime DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `sponsor_id`, `name`, `description`, `creative_url`, `placement`, `target_config`, `schedule_config`, `priority`, `weight`, `status`, `valid_from`, `valid_until`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Campaign Updated', NULL, NULL, 'idle_screen', '[]', '[]', 1, 1, 'active', '2026-07-25 00:00:00', '2026-12-31 00:00:00', '2026-07-25 11:46:55', '2026-07-25 11:46:55', '2026-07-25 11:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_plays`
--

CREATE TABLE `campaign_plays` (
  `id` int(10) UNSIGNED NOT NULL,
  `campaign_id` int(10) UNSIGNED NOT NULL,
  `kiosk_id` int(10) UNSIGNED NOT NULL,
  `placement` varchar(50) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `duration_ms` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contexts`
--

CREATE TABLE `contexts` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_activations`
--

CREATE TABLE `device_activations` (
  `id` int(11) UNSIGNED NOT NULL,
  `kiosk_id` int(11) UNSIGNED NOT NULL,
  `activation_code_hash` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `expires_at` datetime NOT NULL,
  `max_uses` int(11) DEFAULT 1,
  `use_count` int(11) DEFAULT 0,
  `used_at` datetime DEFAULT NULL,
  `used_by_fingerprint` varchar(255) DEFAULT NULL,
  `used_by_ip` varchar(45) DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `revoked_by` int(11) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_activations`
--

INSERT INTO `device_activations` (`id`, `kiosk_id`, `activation_code_hash`, `status`, `expires_at`, `max_uses`, `use_count`, `used_at`, `used_by_fingerprint`, `used_by_ip`, `created_by`, `revoked_at`, `revoked_by`, `notes`, `created_at`, `updated_at`) VALUES
(1, 2, '$2y$10$VxGqogx/RrUFFmV0P9J.duRbJ9WaPvPeMgGh1VZzhUt1C6EMdFUSa', 'pending', '2026-07-28 14:15:47', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2026-07-27 14:15:47', '2026-07-27 14:15:47'),
(2, 2, '$2y$10$jJxOGSgBKgXgQ6zzJndQAeAyHO5PIdL/SUKHZWZq39KJp.tphH.fm', 'pending', '2026-07-27 15:38:30', 3, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, '2026-07-27 15:28:30', '2026-07-27 15:28:30'),
(3, 2, '$2y$10$395fXOzRgfedyL9SwOfvD.bseThJCcHktWgcas4L8rABJqzsO38eu', 'pending', '2026-07-27 15:43:50', 3, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, '2026-07-27 15:33:50', '2026-07-27 15:33:50'),
(4, 2, '$2y$10$UK0RhpRTRMVU9wWCHtQJku3fa/ursX6YO7hTJmTUM8Iv9T/oSpHdK', 'pending', '2026-07-27 15:47:34', 3, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, '2026-07-27 15:37:34', '2026-07-27 15:37:34'),
(5, 4, '$2y$10$YquEjJZ8Tbxcwk86Cxjik.46tCScemY9vIKyGPsCHrrCP.j7AMpvu', 'revoked', '2026-07-28 15:38:11', 3, 0, NULL, NULL, NULL, 5, '2026-07-29 06:55:26', 1, NULL, '2026-07-27 15:38:11', '2026-07-29 06:55:26'),
(6, 4, '$2y$10$cqljbJDNsAi1zw/P287.5eKZuZqXM.HRFNqixcQ9LPrx04k/Dzm1S', 'revoked', '2026-07-29 07:01:00', 3, 1, '2026-07-29 06:51:11', 'fp_c784ce7b-ae9b-4957-82aa-927aa757cbdf', '127.0.0.1', 1, '2026-07-29 06:55:26', 1, NULL, '2026-07-29 06:51:00', '2026-07-29 06:55:26'),
(7, 3, '$2y$10$jPl0Ab2N2xg8bD2gIt24eO35wzOqn14wLeuQ2uF7BFFsa5UVyDkfC', 'pending', '2026-07-29 07:01:53', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2026-07-29 06:51:53', '2026-07-29 06:51:53'),
(8, 4, '$2y$10$ixqg/fGgKeB4Pb6VGvDIxefEAP0YBfUr7WArIcciWFKTGwZq/Bvoi', 'revoked', '2026-07-29 07:04:18', 3, 1, '2026-07-29 06:54:23', 'fp_b4e55973-de43-428f-a59f-c2b6c6ed1038', '127.0.0.1', 1, '2026-07-29 06:55:26', 1, NULL, '2026-07-29 06:54:18', '2026-07-29 06:55:26'),
(9, 4, '$2y$10$wsDNmEQ0Npb9AGkqEwaIJu68GdCmtbmJgvPVcV9vatogenWFeGaIi', 'pending', '2026-07-29 07:05:29', 3, 2, '2026-07-29 06:59:10', 'fp_0ca56e34-79f0-4d3f-a8a3-7993b345d78b', '127.0.0.1', 1, NULL, NULL, NULL, '2026-07-29 06:55:29', '2026-07-29 06:59:10'),
(10, 4, '$2y$10$fCtfv9uKCdmKMbeZS85A2Ouy30ozd5ufk9VYwDwiH3NJWR2SHQ6ga', 'used', '2026-07-29 07:11:21', 3, 3, '2026-07-29 07:03:21', 'fp_0ca56e34-79f0-4d3f-a8a3-7993b345d78b', '127.0.0.1', 1, NULL, NULL, NULL, '2026-07-29 07:01:21', '2026-07-29 07:03:21'),
(11, 5, '$2y$10$Vs4ZROBSdu2mDCmoqBXtYuqF4.l3w1Qm0JKuN1bgvs5u681VtSNP.', 'pending', '2026-07-29 12:17:58', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2026-07-29 12:07:58', '2026-07-29 12:07:58'),
(12, 5, '$2y$10$9kh/dy41VYQ7Y49plc9aF./V8yKW.Y95W6zwr8qcxhqTFYw9i9Cxa', 'pending', '2026-07-29 12:20:45', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2026-07-29 12:10:45', '2026-07-29 12:10:45'),
(13, 5, '$2y$10$0WcYbyen6UcaveztGEE3LOn9j.oN1dZSeftp20O/Maz.HqhfoiPBu', 'pending', '2026-07-29 12:25:38', 3, 1, '2026-07-29 12:15:45', '1e1a528e-b1cf-4553-8dbe-f6ac3bd197ca', '127.0.0.1', 1, NULL, NULL, NULL, '2026-07-29 12:15:38', '2026-07-29 12:15:45'),
(14, 4, '$2y$10$I9HgeRPTPf9P46GcP1yqEeWy74nkr5QviAQyAadMone.uqI8X1QSy', 'pending', '2026-07-31 06:55:01', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2026-07-31 06:45:01', '2026-07-31 06:45:01'),
(15, 6, '$2y$10$88tv3F8MHXq36341cDdXI.PzLxdW4G21T3gXoX6zcpeTMVLAQ8gqG', 'revoked', '2026-08-01 06:52:43', 3, 0, NULL, NULL, NULL, 1, '2026-07-31 06:57:03', 1, NULL, '2026-07-31 06:52:43', '2026-07-31 06:57:03'),
(16, 6, '$2y$10$MOdsZcRFHyxpcqmqICGghuhu0uCFAspbGkmB033zIvVkObhkgHPFG', 'revoked', '2026-07-31 07:03:00', 3, 0, NULL, NULL, NULL, 1, '2026-07-31 06:57:03', 1, NULL, '2026-07-31 06:53:00', '2026-07-31 06:57:03'),
(17, 3, '$2y$10$1s9QaMDB/aEl6.BQgs.30ODoAI0ROtsiRE8vkJ03S8qF8ZJ69SwES', 'pending', '2026-07-31 07:05:56', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2026-07-31 06:55:56', '2026-07-31 06:55:56'),
(18, 6, '$2y$10$V31jrSDqk.lWtPrMiOfYF.Gob.GgJvl.5E/qW2fOKyRnL2/D7LeIu', 'pending', '2026-07-31 07:07:05', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2026-07-31 06:57:05', '2026-07-31 06:57:05'),
(19, 4, '$2y$10$23.rWzNlRGswOPqSCUGxDu.40IHvPC2bdhv9U6vPNFxa/D1YdAcr6', 'pending', '2026-07-31 07:08:08', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2026-07-31 06:58:08', '2026-07-31 06:58:08'),
(20, 4, '$2y$10$.ZVioBIBmuk5jCFoBmflM.nB.fv3IBR1/JJpG8a5Q/ZBfnFCvhqVi', 'pending', '2026-07-31 07:23:00', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2026-07-31 07:13:00', '2026-07-31 07:13:00'),
(22, 4, '$2y$10$fpgQyAUr73G94nPiON1jBuBZ9J6/OTol6qGDkwMY7GXDVqIOeHrfG', 'pending', '2026-07-31 15:16:37', 3, 2, '2026-07-31 07:25:16', 'bcff6fa4-bca0-4ed6-9fbd-d00dbc29b832', '192.168.1.34', 1, NULL, NULL, NULL, '2026-07-31 14:16:37', '2026-07-31 07:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED DEFAULT NULL,
  `tenant_id` int(10) UNSIGNED DEFAULT NULL,
  `location_id` int(11) UNSIGNED DEFAULT NULL,
  `donor_name` varchar(100) DEFAULT NULL,
  `campaign_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT 'qris',
  `reference` varchar(100) NOT NULL,
  `qr_data` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `provider_ref` varchar(255) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `xendit_qr_id` varchar(100) DEFAULT NULL,
  `xendit_external_id` varchar(100) DEFAULT NULL,
  `xendit_payment_request_id` varchar(100) DEFAULT NULL,
  `qr_type` varchar(20) DEFAULT NULL,
  `channel_code` varchar(50) DEFAULT NULL,
  `va_number` varchar(100) DEFAULT NULL,
  `bank_code` varchar(50) DEFAULT NULL,
  `payment_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_details`)),
  `expires_at` datetime DEFAULT NULL,
  `failure_code` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `session_id`, `tenant_id`, `location_id`, `donor_name`, `campaign_id`, `amount`, `payment_method`, `reference`, `qr_data`, `status`, `provider_ref`, `paid_at`, `created_at`, `updated_at`, `xendit_qr_id`, `xendit_external_id`, `xendit_payment_request_id`, `qr_type`, `channel_code`, `va_number`, `bank_code`, `payment_details`, `expires_at`, `failure_code`) VALUES
(12, 1, 3, 2, 'Donor', NULL, 5000.00, 'qris', 'DON-20260729-e08f1e50', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-29 12:16:14', '2026-07-29 12:16:14', NULL, 'DON-20260729-e08f1e50', 'pr-73dce063-cc18-41d7-b647-928800c60ff3', 'dynamic', NULL, NULL, NULL, NULL, '2026-07-30 12:16:13', NULL),
(13, 1, 3, 2, 'Donor', NULL, 5000.00, 'qris', 'DON-20260729-905539bb', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-29 12:21:01', '2026-07-29 12:21:01', NULL, 'DON-20260729-905539bb', 'pr-4688f4d5-9010-4d50-b865-5c155f0c064c', 'dynamic', NULL, NULL, NULL, NULL, '2026-07-30 12:21:00', NULL),
(14, 1, 3, 2, 'Donor', NULL, 5000.00, 'qris', 'DON-20260731-14b46458', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 07:25:44', '2026-07-31 07:25:44', NULL, 'DON-20260731-14b46458', 'pr-ad31f39c-4017-4b3b-985c-dd79b701bd25', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 07:25:40', NULL),
(15, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260731-ea5a3cd0', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 07:26:13', '2026-07-31 07:26:13', NULL, 'DON-20260731-ea5a3cd0', 'pr-4c13a0b2-3190-4a16-ac28-56fbfdcd4b3d', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 07:26:12', NULL),
(16, 1, 3, 2, 'Donor', NULL, 10000.00, 'qris', 'DON-20260731-f8457d24', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 07:35:28', '2026-07-31 07:35:28', NULL, 'DON-20260731-f8457d24', 'pr-3c4844c8-56f4-403a-bde7-63e9ceae061d', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 07:35:27', NULL),
(17, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260731-b49ef560', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 07:35:54', '2026-07-31 07:35:54', NULL, 'DON-20260731-b49ef560', 'pr-47345dca-67f3-488a-9219-b1acf715d90d', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 07:35:53', NULL),
(18, 1, 3, 2, 'Donor', NULL, 12888.00, 'qris', 'DON-20260731-cd48ad26', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 07:40:37', '2026-07-31 07:40:37', NULL, 'DON-20260731-cd48ad26', 'pr-687707d1-e3b3-4ba4-b9c5-6250f6038ebd', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 07:40:36', NULL),
(19, 1, 3, 2, 'Donor', NULL, 5000.00, 'qris', 'DON-20260731-dabb5629', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 07:41:39', '2026-07-31 07:41:39', NULL, 'DON-20260731-dabb5629', 'pr-38fed9d9-2bb9-45fe-9d22-b7143a0a1bf1', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 07:41:38', NULL),
(20, 1, 3, 2, 'Donor', NULL, 10000.00, 'qris', 'DON-20260731-ae08bd18', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 07:42:57', '2026-07-31 07:42:57', NULL, 'DON-20260731-ae08bd18', 'pr-53e29ae5-ea42-4cee-9c49-2cea80cd8340', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 07:42:56', NULL),
(21, 1, 3, 2, 'Donor', NULL, 5000.00, 'qris', 'DON-20260731-16353f9e', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 07:47:46', '2026-07-31 07:47:46', NULL, 'DON-20260731-16353f9e', 'pr-85a6d25b-c566-4f54-884c-091a0908a8c3', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 07:47:45', NULL),
(22, 1, 3, 2, 'Donor', NULL, 10000.00, 'qris', 'DON-20260731-38629d81', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 07:51:08', '2026-07-31 07:51:08', NULL, 'DON-20260731-38629d81', 'pr-3285a38b-5931-484f-a87b-1a4e60e2c45b', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 07:51:07', NULL),
(23, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260731-fa3a6d53', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 07:53:59', '2026-07-31 07:53:59', NULL, 'DON-20260731-fa3a6d53', 'pr-90b57e6b-b414-4bdd-9453-eff08e761777', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 07:53:59', NULL),
(24, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260731-66f6652b', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 07:56:54', '2026-07-31 07:56:54', NULL, 'DON-20260731-66f6652b', 'pr-d19c5417-f29e-40e9-86dc-bc8b9223d8eb', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 07:56:53', NULL),
(25, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260731-8ff41ad8', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 09:47:25', '2026-07-31 09:47:25', NULL, 'DON-20260731-8ff41ad8', 'pr-2da4cf62-0e99-478c-859a-5316cd0d104c', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 09:47:24', NULL),
(26, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260731-e0b606cb', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 09:48:07', '2026-07-31 09:48:07', NULL, 'DON-20260731-e0b606cb', 'pr-f3a47ea1-0a9f-44b7-ab3e-3c8546267eb1', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 09:48:07', NULL),
(27, 1, 3, 2, 'Donor', NULL, 5000.00, 'qris', 'DON-20260731-af1d0051', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 10:03:07', '2026-07-31 10:03:07', NULL, 'DON-20260731-af1d0051', 'pr-a2248b8f-eb43-4db5-8012-458a7f1dba3a', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 10:03:06', NULL),
(28, 1, 3, 2, 'Donor', NULL, 5000.00, 'qris', 'DON-20260731-946d6eb7', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 10:05:34', '2026-07-31 10:05:34', NULL, 'DON-20260731-946d6eb7', 'pr-b80ae704-0494-4ac6-93eb-064bf12d7386', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 10:05:33', NULL),
(29, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260731-564637fd', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 10:06:14', '2026-07-31 10:06:14', NULL, 'DON-20260731-564637fd', 'pr-0d613e78-1381-4684-87f2-9a428c31dbb6', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 10:06:13', NULL),
(30, 1, 3, 2, 'Donor', NULL, 10000.00, 'qris', 'DON-20260731-a929c9bb', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 10:12:48', '2026-07-31 10:12:48', NULL, 'DON-20260731-a929c9bb', 'pr-26c3150b-d315-47ff-b94f-b63cf7820203', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 10:12:47', NULL),
(31, 1, 3, 2, 'Donor', NULL, 10000.00, 'qris', 'DON-20260731-4d299866', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 11:05:40', '2026-07-31 11:05:40', NULL, 'DON-20260731-4d299866', 'pr-ce845306-0f2d-4af9-88e9-8858db27513e', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 11:05:39', NULL),
(32, 1, 3, 2, 'Donor', NULL, 5000.00, 'qris', 'DON-20260731-56fe1f38', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 11:08:03', '2026-07-31 11:08:03', NULL, 'DON-20260731-56fe1f38', 'pr-ae9892d9-9087-478b-be94-c7f7a61441f4', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 11:08:02', NULL),
(33, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260731-1195d33c', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 11:15:27', '2026-07-31 11:15:27', NULL, 'DON-20260731-1195d33c', 'pr-18c369d0-86e7-4129-b384-257dcec92031', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 11:15:26', NULL),
(34, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260731-b6306648', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 11:16:47', '2026-07-31 11:16:47', NULL, 'DON-20260731-b6306648', 'pr-a9d473c2-eb45-4107-b3b4-7be3c47d8e18', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 11:16:46', NULL),
(35, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260731-447e9004', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 11:21:23', '2026-07-31 11:21:23', NULL, 'DON-20260731-447e9004', 'pr-296985c9-250b-4f21-aa7f-a2c1cfd30c38', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 11:21:22', NULL),
(36, 1, 3, 2, 'Donor', NULL, 10000.00, 'qris', 'DON-20260731-5bf881c1', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 11:36:31', '2026-07-31 11:36:31', NULL, 'DON-20260731-5bf881c1', 'pr-810c5876-0711-4717-8cc6-3c6b76d1c88a', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 11:36:30', NULL),
(37, 1, 3, 2, 'Donor', NULL, 20000.00, 'qris', 'DON-20260731-044d77ea', 'some-random-qr-string', 'pending', NULL, NULL, '2026-07-31 11:49:16', '2026-07-31 11:49:16', NULL, 'DON-20260731-044d77ea', 'pr-e10b81f1-ef64-4c87-85fe-bd95d14f942c', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-01 11:49:15', NULL),
(38, 1, 3, 2, 'Donor', NULL, 5000.00, 'qris', 'DON-20260803-4d8d3d0e', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 08:17:20', '2026-08-03 08:17:20', NULL, 'DON-20260803-4d8d3d0e', 'pr-38a34ecf-a6e7-430e-a8b9-cc2e64d1723e', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 08:17:17', NULL),
(39, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260803-76709f4f', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 08:21:51', '2026-08-03 08:21:51', NULL, 'DON-20260803-76709f4f', 'pr-ea98cb72-9162-4d98-bb74-fb0e24e064b4', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 08:21:50', NULL),
(40, 1, 3, 2, 'Donor', NULL, 5000.00, 'qris', 'DON-20260803-6f6ed828', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 08:23:36', '2026-08-03 08:23:36', NULL, 'DON-20260803-6f6ed828', 'pr-fd5ec47a-45fe-4a40-9804-68bb6569c822', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 08:23:36', NULL),
(41, 1, 3, 2, 'Donor', NULL, 20000.00, 'qris', 'DON-20260803-bd3e06b7', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 08:42:58', '2026-08-03 08:42:58', NULL, 'DON-20260803-bd3e06b7', 'pr-29bbe435-29a6-459b-8f97-ddf5c9a6b483', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 08:42:58', NULL),
(42, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260803-128b2f22', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 09:02:10', '2026-08-03 09:02:10', NULL, 'DON-20260803-128b2f22', 'pr-78873b5b-ca81-4754-94c1-10d93fc8ac09', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 09:02:09', NULL),
(43, 1, 3, 2, 'Donor', NULL, 10000.00, 'qris', 'DON-20260803-c4904dce', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 09:02:38', '2026-08-03 09:02:38', NULL, 'DON-20260803-c4904dce', 'pr-a71de15e-e7d2-4961-ba16-a6d1721b52e3', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 09:02:38', NULL),
(44, 1, 3, 2, 'Donor', NULL, 20000.00, 'qris', 'DON-20260803-cacaf282', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 09:35:24', '2026-08-03 09:35:24', NULL, 'DON-20260803-cacaf282', 'pr-f2164f40-1756-42d3-9a5e-2e2aa7f605ae', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 09:35:24', NULL),
(45, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260803-0c1a3845', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 09:36:00', '2026-08-03 09:36:00', NULL, 'DON-20260803-0c1a3845', 'pr-8d4291d1-e61d-48d3-8b34-554c05725d21', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 09:36:00', NULL),
(46, 1, 3, 2, 'Donor', NULL, 20000.00, 'qris', 'DON-20260803-07189f8e', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 11:20:42', '2026-08-03 11:20:42', NULL, 'DON-20260803-07189f8e', 'pr-4a316ad2-ed20-49ad-b70e-ede4ce4e5f30', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 11:20:40', NULL),
(47, 1, 3, 2, 'Donor', NULL, 15000.00, 'qris', 'DON-20260803-2a636b4b', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 11:28:35', '2026-08-03 11:28:35', NULL, 'DON-20260803-2a636b4b', 'pr-b2c5d613-4351-4ee3-8316-2394090a143c', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 11:28:34', NULL),
(48, 1, 3, 2, 'Donor', NULL, 5000.00, 'qris', 'DON-20260803-4da424a2', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 11:29:14', '2026-08-03 11:29:14', NULL, 'DON-20260803-4da424a2', 'pr-e28a9035-8985-43f6-bf96-edb6c7c31a6a', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 11:29:13', NULL),
(49, 1, 3, 2, 'Donor', NULL, 20000.00, 'qris', 'DON-20260803-45d30054', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 11:29:41', '2026-08-03 11:29:41', NULL, 'DON-20260803-45d30054', 'pr-6e2fe961-d2e0-46cb-9854-b8902ae4c34c', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 11:29:40', NULL),
(50, 1, 3, 2, 'Donor', NULL, 20000.00, 'qris', 'DON-20260803-954295b1', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 11:30:18', '2026-08-03 11:30:18', NULL, 'DON-20260803-954295b1', 'pr-7871d78e-e13a-4eb8-9b1a-1460a411d858', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 11:30:17', NULL),
(51, 1, 3, 2, 'Donor', NULL, 20000.00, 'qris', 'DON-20260803-88e12a34', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-03 11:45:42', '2026-08-03 11:45:42', NULL, 'DON-20260803-88e12a34', 'pr-ef7fa14b-98bb-4f2f-bec3-9a65e6ad04e7', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-04 11:45:41', NULL),
(52, 1, 3, 2, 'Donor', NULL, 10000.00, 'qris', 'DON-20260804-3a5557b1', 'some-random-qr-string', 'pending', NULL, NULL, '2026-08-04 09:31:43', '2026-08-04 09:31:43', NULL, 'DON-20260804-3a5557b1', 'pr-f7d553b7-f9d6-40d5-b326-86383ba21aca', 'dynamic', NULL, NULL, NULL, NULL, '2026-08-05 09:31:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `emotions`
--

CREATE TABLE `emotions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(10) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(50) NOT NULL DEFAULT 'positif',
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emotions`
--

INSERT INTO `emotions` (`id`, `name`, `icon`, `description`, `category`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(19, 'bahagia', 'smile', 'Bahagia', 'bahagia', 'active', 1, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(20, 'syukur', 'heart', 'Syukur', 'bahagia', 'active', 2, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(21, 'tenang', 'cloud', 'Tenang', 'bahagia', 'active', 3, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(22, 'semangat', 'flame', 'Semangat', 'bahagia', 'active', 4, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(23, 'cinta', 'love', 'Cinta', 'bahagia', 'active', 5, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(24, 'harapan', 'sun', 'Harapan', 'bahagia', 'active', 6, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(25, 'sedih', 'frown', 'Sedih', 'Sedih', 'active', 1, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(26, 'marah', 'angry', 'Marah', 'Marah', 'active', 2, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(27, 'kecewa', 'x-circle', 'Kecewa', 'Sedih', 'active', 3, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(28, 'cemas', 'alert', 'Cemas', 'Cemas', 'active', 4, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(29, 'takut', 'fear', 'Takut', 'Cemas', 'active', 5, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(30, 'lelah', 'tired', 'Lelah', 'Marah', 'active', 6, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(31, 'bingung', 'help', 'Bingung', 'Cemas', 'active', 7, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(32, 'kesepian', 'alone', 'Kesepian', 'Sedih', 'active', 8, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(33, 'bersalah', 'sorry', 'Bersalah', 'Sedih', 'active', 9, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(34, 'malu', 'blush', 'Malu', 'Sedih', 'active', 10, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(35, 'iri', 'jealous', 'Iri', 'Marah', 'active', 11, '2026-07-25 18:06:15', '2026-07-25 18:06:15'),
(36, 'stres', 'stress', 'Stres', 'Cemas', 'active', 12, '2026-07-25 18:06:15', '2026-07-25 18:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `hadiths`
--

CREATE TABLE `hadiths` (
  `id` int(11) UNSIGNED NOT NULL,
  `arabic_text` text DEFAULT NULL,
  `translation` text NOT NULL,
  `book` varchar(100) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `narrator` varchar(255) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'draft',
  `reviewer_id` int(11) UNSIGNED DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hadiths`
--

INSERT INTO `hadiths` (`id`, `arabic_text`, `translation`, `book`, `number`, `narrator`, `grade`, `source`, `tags`, `status`, `reviewer_id`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(2, 'مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلاَ وَصَبٍ وَلاَ هَمٍّ وَلاَ حَزَنٍ وَلاَ أَذًى وَلاَ غَمٍّ حَتَّى الشَّوْكَةِ يُشَاكُهَا إِلاَّ كَفَّرَ اللَّهُ بِهَا مِنْ خَطَايَاهُ', 'Tidaklah seorang muslim tertimpa suatu keletihan, penyakit, kecemasan, kesedihan, gangguan, maupun duka cita—bahkan duri yang menusuknya—melainkan Allah akan menghapus dosa-dosanya dengan sebab itu.', 'Bukhari, Muslim', '5641, 2573', NULL, NULL, 'HR. Bukhari no. 5641 & Muslim no. 2573', 'sedih, pengugur dosa, musibah', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(3, 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَالْعَجْزِ وَالْكَسَلِ', 'Ya Allah, aku berlindung kepada-Mu dari rasa gelisah, sedih, lemah, dan malas.', 'Bukhari', '6369', NULL, NULL, 'HR. Bukhari no. 6369', 'doa, perlindungan, sedih', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(4, 'عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ وَلَيْسَ ذَاكَ لأَحَدٍ إِلاَّ لِلْمُؤْمِنِ إِنْ أَصَابَتْهُ سَرَّاءُ شَكَرَ فَكَانَ خَيْرًا لَهُ وَإِنْ أَصَابَتْهُ ضَرَّاءُ صَبَرَ فَكَانَ خَيْرًا لَهُ', 'Sungguh menakjubkan urusan seorang mukmin, seluruh urusannya adalah baik baginya. Jika ia mendapatkan kesenangan ia bersyukur, maka itu baik baginya. Dan jika ditimpa kesusahan ia bersabar, maka itu baik baginya.', 'Muslim', '2999', NULL, NULL, 'HR. Muslim no. 2999', 'sabar, syukur, mukmin', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(5, 'مَا أَصَابَ أَحَدًا قَطُّ هَمٌّ وَلاَ حَزَنٌ فَقَالَ اللَّهُمَّ إِنِّي عَبْدُكَ وَابْنُ عَبْدِكَ... إِلاَّ أَذْهَبَ اللَّهُ هَمَّهُ وَحُزْنَهُ وَأَبْدَلَهُ مَكَانَهُ فَرَجًا', 'Tidaklah seseorang tertimpa duka cita dan kesedihan lalu membaca doa \'Ya Allah, sesungguhnya aku adalah hamba-Mu...\' melainkan Allah akan menghilangkan duka citanya dan menggantikannya dengan kelapangan.', 'Ahmad, Ibnu Hibban', '3712', NULL, NULL, 'HR. Ahmad no. 3712 & Ibn Hibban', 'doa penawar sedih, kelapangan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(6, 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ لَا إِلَهَ إِلَّا أَنْتَ', 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku. Tiada tuhan selain Engkau.', 'Abu Dawud', '5090', NULL, NULL, 'HR. Abu Dawud no. 5090', 'doa kesusahan, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(7, 'إِنَّمَا الصَّبْرُ عِنْدَ الصَّدْمَةِ الأُولَى', 'Sesungguhnya kesabaran (yang sebenarnya) adalah pada saat pertama kali tertimpa musibah.', 'Bukhari, Muslim', '1283, 926', NULL, NULL, 'HR. Bukhari no. 1283 & Muslim no. 926', 'sabar, musibah, keteguhan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(8, 'مَنْ يُرِدِ اللَّهُ بِهِ خَيْرًا يُصِبْ مِنْهُ', 'Barangsiapa yang dikehendaki kebaikan oleh Allah, maka Dia akan memberinya ujian/musibah.', 'Bukhari', '5645', NULL, NULL, 'HR. Bukhari no. 5645', 'ujian, kebaikan, hikmah', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(9, 'إِنَّ عِظَمَ الْجَزَاءِ مَعَ عِظَمِ الْبَلاَءِ وَإِنَّ اللَّهَ إِذَا أَحَبَّ قَوْمًا ابْتَلاَهُمْ', 'Sesungguhnya besarnya balasan disertai besarnya ujian. Dan sesungguhnya apabila Allah mencintai suatu kaum, Dia akan menguji mereka.', 'Tirmidzi', '2396', NULL, NULL, 'HR. Tirmidzi no. 2396', 'cinta Allah, ujian, pahala', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(10, 'اللهُ اللهُ رَبِّي لَا أُشْرِكُ بِهِ شَيْئًا', 'Allah, Allah adalah Tuhanku, aku tidak mempersekutukan-Nya dengan sesuatu apa pun. (Dibaca saat mengalami kesusahan/kesedihan mendalam).', 'Abu Dawud', '1525', NULL, NULL, 'HR. Abu Dawud no. 1525', 'doa kesusahan, tauhid', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(11, 'إِنَّ العَيْنَ تَدْمَعُ، وَالقَلْبَ يَحْزَنُ، وَلاَ نَقُولُ إِلَّا مَا يَرْضَى رَبُّنَا', 'Mata boleh menangis dan hati boleh bersedih, namun kami tidak mengucapkan kecuali apa yang diridhai oleh Rabb kami.', 'Bukhari', '1303', NULL, NULL, 'HR. Bukhari no. 1303', 'tangisan, kesedihan, ridha', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(12, 'وَاعْلَمْ أَنَّ النَّصْرَ مَعَ الصَّبْرِ وَأَنَّ الْفَرَجَ مَعَ الْكَرْبِ وَأَنَّ مَعَ الْعُسْرِ يُسْرًا', 'Ketahuilah bahwa pertolongan itu bersama kesabaran, kelapangan itu bersama kesusahan, dan kemudahan itu bersama kesulitan.', 'Ahmad', '2803', NULL, NULL, 'HR. Ahmad no. 2803', 'sabar, kemudahan, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(13, 'دَعْوَةُ ذِي النُّونِ إِذْ دَعَا وَهُوَ فِي بَطْنِ الحُوتِ... لَمْ يَدْعُ بِهَا رَجُلٌ مُسْلِمٌ فِي شَيْءٍ قَطُّ إِلاَّ اسْتَجَابَ اللَّهُ لَهُ', 'Doa Dzun Nuun (Nabi Yunus) ketika berdoa di dalam perut ikan... Tidaklah seorang muslim berdoa dengannya dalam suatu masalah melainkan Allah akan mengabulkan doanya.', 'Tirmidzi', '3505', NULL, NULL, 'HR. Tirmidzi no. 3505', 'doa kesusahan, Nabi Yunus, pengabulan doa', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(14, 'لاَ إِلهَ إِلاَّ اللهُ الْعَظِيْمُ الْحَلِيْمُ، لاَ إِلهَ إِلاَّ اللهُ رَبُّ الْعَرْشِ الْعَظِيْمِ', 'Tiada tuhan selain Allah Yang Maha Agung lagi Maha Penyantun. Tiada tuhan selain Allah, Rabb \'Arsy yang agung. (Doa ketika ditimpa kesusahan berat).', 'Bukhari, Muslim', '6345, 2730', NULL, NULL, 'HR. Bukhari no. 6345 & Muslim no. 2730', 'doa kesusahan, kalimat thayyibah', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(15, 'الدُّنْيَا سِجْنُ الْمُؤْمِنِ وَجَنَّةُ الْكَافِرِ', 'Dunia adalah penjara bagi orang mukmin dan surga bagi orang kafir.', 'Muslim', '2956', NULL, NULL, 'HR. Muslim no. 2956', 'dunia, kesabaran, mukmin', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(16, 'مَا يَزَالُ الْبَلاَءُ بِالْمُؤْمِنِ وَالْمُؤْمِنَةِ فِي نَفْسِهِ وَوَلَدِهِ وَمَالِهِ حَتَّى يَلْقَى اللَّهَ وَمَا عَلَيْهِ خَطِيئَةٌ', 'Ujian akan senantiasa menimpa seorang mukmin dan mukminah, pada dirinya, anaknya, dan hartanya, hingga ia berjumpa dengan Allah tanpa membawa dosa sedikit pun.', 'Tirmidzi', '2399', NULL, NULL, 'HR. Tirmidzi no. 2399', 'ujian, pengampunan dosa, kesabaran', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(17, 'مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلاَ وَصَبٍ وَلاَ هَمٍّ وَلاَ حَزَنٍ وَلاَ أَذًى وَلاَ غَمٍّ حَتَّى الشَّوْكَةِ يُشَاكُهَا إِلاَّ كَفَّرَ اللَّهُ بِهَا مِنْ خَطَايَاهُ', 'Tidaklah seorang muslim tertimpa suatu keletihan, penyakit, kecemasan, kesedihan, gangguan, maupun duka cita—bahkan duri yang menusuknya—melainkan Allah akan menghapus dosa-dosanya dengan sebab itu.', 'Bukhari, Muslim', '5641, 2573', NULL, NULL, 'HR. Bukhari no. 5641 & Muslim no. 2573', 'sedih, pengugur dosa, musibah', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(18, 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَالْعَجْزِ وَالْكَسَلِ', 'Ya Allah, aku berlindung kepada-Mu dari rasa gelisah, sedih, lemah, dan malas.', 'Bukhari', '6369', NULL, NULL, 'HR. Bukhari no. 6369', 'doa, perlindungan, sedih', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(19, 'عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ وَلَيْسَ ذَاكَ لأَحَدٍ إِلاَّ لِلْمُؤْمِنِ إِنْ أَصَابَتْهُ سَرَّاءُ شَكَرَ فَكَانَ خَيْرًا لَهُ وَإِنْ أَصَابَتْهُ ضَرَّاءُ صَبَرَ فَكَانَ خَيْرًا لَهُ', 'Sungguh menakjubkan urusan seorang mukmin, seluruh urusannya adalah baik baginya. Jika ia mendapatkan kesenangan ia bersyukur, maka itu baik baginya. Dan jika ditimpa kesusahan ia bersabar, maka itu baik baginya.', 'Muslim', '2999', NULL, NULL, 'HR. Muslim no. 2999', 'sabar, syukur, mukmin', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(20, 'مَا أَصَابَ أَحَدًا قَطُّ هَمٌّ وَلاَ حَزَنٌ فَقَالَ اللَّهُمَّ إِنِّي عَبْدُكَ وَابْنُ عَبْدِكَ... إِلاَّ أَذْهَبَ اللَّهُ هَمَّهُ وَحُزْنَهُ وَأَبْدَلَهُ مَكَانَهُ فَرَجًا', 'Tidaklah seseorang tertimpa duka cita dan kesedihan lalu membaca doa \'Ya Allah, sesungguhnya aku adalah hamba-Mu...\' melainkan Allah akan menghilangkan duka citanya dan menggantikannya dengan kelapangan.', 'Ahmad, Ibnu Hibban', '3712', NULL, NULL, 'HR. Ahmad no. 3712 & Ibn Hibban', 'doa penawar sedih, kelapangan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(21, 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ لَا إِلَهَ إِلَّا أَنْتَ', 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku. Tiada tuhan selain Engkau.', 'Abu Dawud', '5090', NULL, NULL, 'HR. Abu Dawud no. 5090', 'doa kesusahan, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(22, 'إِنَّمَا الصَّبْرُ عِنْدَ الصَّدْمَةِ الأُولَى', 'Sesungguhnya kesabaran (yang sebenarnya) adalah pada saat pertama kali tertimpa musibah.', 'Bukhari, Muslim', '1283, 926', NULL, NULL, 'HR. Bukhari no. 1283 & Muslim no. 926', 'sabar, musibah, keteguhan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(23, 'مَنْ يُرِدِ اللَّهُ بِهِ خَيْرًا يُصِبْ مِنْهُ', 'Barangsiapa yang dikehendaki kebaikan oleh Allah, maka Dia akan memberinya ujian/musibah.', 'Bukhari', '5645', NULL, NULL, 'HR. Bukhari no. 5645', 'ujian, kebaikan, hikmah', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(24, 'إِنَّ عِظَمَ الْجَزَاءِ مَعَ عِظَمِ الْبَلاَءِ وَإِنَّ اللَّهَ إِذَا أَحَبَّ قَوْمًا ابْتَلاَهُمْ', 'Sesungguhnya besarnya balasan disertai besarnya ujian. Dan sesungguhnya apabila Allah mencintai suatu kaum, Dia akan menguji mereka.', 'Tirmidzi', '2396', NULL, NULL, 'HR. Tirmidzi no. 2396', 'cinta Allah, ujian, pahala', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(25, 'اللهُ اللهُ رَبِّي لَا أُشْرِكُ بِهِ شَيْئًا', 'Allah, Allah adalah Tuhanku, aku tidak mempersekutukan-Nya dengan sesuatu apa pun. (Dibaca saat mengalami kesusahan/kesedihan mendalam).', 'Abu Dawud', '1525', NULL, NULL, 'HR. Abu Dawud no. 1525', 'doa kesusahan, tauhid', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(26, 'إِنَّ العَيْنَ تَدْمَعُ، وَالقَلْبَ يَحْزَنُ، وَلاَ نَقُولُ إِلَّا مَا يَرْضَى رَبُّنَا', 'Mata boleh menangis dan hati boleh bersedih, namun kami tidak mengucapkan kecuali apa yang diridhai oleh Rabb kami.', 'Bukhari', '1303', NULL, NULL, 'HR. Bukhari no. 1303', 'tangisan, kesedihan, ridha', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(27, 'وَاعْلَمْ أَنَّ النَّصْرَ مَعَ الصَّبْرِ وَأَنَّ الْفَرَجَ مَعَ الْكَرْبِ وَأَنَّ مَعَ الْعُسْرِ يُسْرًا', 'Ketahuilah bahwa pertolongan itu bersama kesabaran, kelapangan itu bersama kesusahan, dan kemudahan itu bersama kesulitan.', 'Ahmad', '2803', NULL, NULL, 'HR. Ahmad no. 2803', 'sabar, kemudahan, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(28, 'دَعْوَةُ ذِي النُّونِ إِذْ دَعَا وَهُوَ فِي بَطْنِ الحُوتِ... لَمْ يَدْعُ بِهَا رَجُلٌ مُسْلِمٌ فِي شَيْءٍ قَطُّ إِلاَّ اسْتَجَابَ اللَّهُ لَهُ', 'Doa Dzun Nuun (Nabi Yunus) ketika berdoa di dalam perut ikan... Tidaklah seorang muslim berdoa dengannya dalam suatu masalah melainkan Allah akan mengabulkan doanya.', 'Tirmidzi', '3505', NULL, NULL, 'HR. Tirmidzi no. 3505', 'doa kesusahan, Nabi Yunus, pengabulan doa', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(29, 'لاَ إِلهَ إِلاَّ اللهُ الْعَظِيْمُ الْحَلِيْمُ، لاَ إِلهَ إِلاَّ اللهُ رَبُّ الْعَرْشِ الْعَظِيْمِ', 'Tiada tuhan selain Allah Yang Maha Agung lagi Maha Penyantun. Tiada tuhan selain Allah, Rabb \'Arsy yang agung. (Doa ketika ditimpa kesusahan berat).', 'Bukhari, Muslim', '6345, 2730', NULL, NULL, 'HR. Bukhari no. 6345 & Muslim no. 2730', 'doa kesusahan, kalimat thayyibah', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(30, 'الدُّنْيَا سِجْنُ الْمُؤْمِنِ وَجَنَّةُ الْكَافِرِ', 'Dunia adalah penjara bagi orang mukmin dan surga bagi orang kafir.', 'Muslim', '2956', NULL, NULL, 'HR. Muslim no. 2956', 'dunia, kesabaran, mukmin', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(31, 'مَا يَزَالُ الْبَلاَءُ بِالْمُؤْمِنِ وَالْمُؤْمِنَةِ فِي نَفْسِهِ وَوَلَدِهِ وَمَالِهِ حَتَّى يَلْقَى اللَّهَ وَمَا عَلَيْهِ خَطِيئَةٌ', 'Ujian akan senantiasa menimpa seorang mukmin dan mukminah, pada dirinya, anaknya, dan hartanya, hingga ia berjumpa dengan Allah tanpa membawa dosa sedikit pun.', 'Tirmidzi', '2399', NULL, NULL, 'HR. Tirmidzi no. 2399', 'ujian, pengampunan dosa, kesabaran', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(32, 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَالْعَجْزِ وَالْكَسَلِ وَالْبُخْلِ وَالْجُبْنِ وَضَلَعِ الدَّيْنِ وَغَلَبَةِ الرِّجَالِ', 'Ya Allah, aku berlindung kepada-Mu dari rasa cemas/gelisah, sedih, lemah, malas, kikir, penakut, beban utang, dan penguasaan orang lain.', 'Bukhari', '6369', NULL, NULL, 'HR. Bukhari no. 6369', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(33, 'اللَّهُمَّ اسْتُرْ عَوْرَاتِي وَآمِنْ رَوْعَاتِي', 'Ya Allah, tutupilah auratku (kekuranganku) dan amankanlah aku dari rasa takut/kecemasan.', 'Abu Dawud, Ibnu Majah', '5074', NULL, NULL, 'HR. Abu Dawud no. 5074 & Ibn Majah', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(34, 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ لَا إِلَهَ إِلَّا أَنْتَ', 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku. Tiada tuhan selain Engkau.', 'Abu Dawud', '5090', NULL, NULL, 'HR. Abu Dawud no. 5090', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(35, 'اللهُ اللهُ رَبِّي لَا أُشْرِكُ بِهِ شَيْئًا', 'Allah, Allah adalah Tuhanku, aku tidak mempersekutukan-Nya dengan sesuatu apa pun. (Dibaca saat dilanda kecemasan/kesusahan berat).', 'Abu Dawud', '1525', NULL, NULL, 'HR. Abu Dawud no. 1525', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(36, 'لاَ إِلهَ إِلاَّ اللهُ الْعَظِيْمُ الْحَلِيْمُ، لاَ إِلهَ إِلاَّ اللهُ رَبُّ الْعَرْشِ الْعَظِيْمِ، لاَ إِلهَ إِلاَّ اللهُ رَبُّ السَّمَوَاتِ وَرَبُّ الأَرْضِ وَرَبُّ الْعَرْشِ الْكَرِيْمِ', 'Tiada tuhan selain Allah Yang Maha Agung lagi Maha Penyantun... (Doa Rasulullah SAW saat berada dalam keraguan/kesusahan/kecemasan berat).', 'Bukhari, Muslim', '6345, 2730', NULL, NULL, 'HR. Bukhari no. 6345 & Muslim no. 2730', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(37, 'يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ', 'Wahai Yang Mahahidup, Wahai Yang Maha Berdiri Sendiri, dengan rahmat-Mu aku memohon pertolongan.', 'Tirmidzi', '3524', NULL, NULL, 'HR. Tirmidzi no. 3524', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(38, 'مَا أَصَابَ أَحَدًا قَطُّ هَمٌّ وَلاَ حَزَنٌ فَقَالَ اللَّهُمَّ إِنِّي عَبْدُكَ... إِلاَّ أَذْهَبَ اللَّهُ هَمَّهُ وَحُزْنَهُ وَأَبْدَلَهُ مَكَانَهُ فَرَجًا', 'Tidaklah seseorang tertimpa kegelisahan (kecemasan) dan kesedihan lalu membaca doa \'Ya Allah, sesungguhnya aku adalah hamba-Mu...\' melainkan Allah akan menghilangkan kecemasannya dan menggantikannya dengan kelapangan.', 'Ahmad', '3712', NULL, NULL, 'HR. Ahmad no. 3712', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(39, 'كَانَ النَّبِيُّ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ إِذَا حَزَبَهُ أَمْرٌ صَلَّى', 'Nabi SAW apabila ditimpa suatu masalah yang merisaukan/mencemaskan, beliau bergegas mendirikan salat.', 'Abu Dawud', '1319', NULL, NULL, 'HR. Abu Dawud no. 1319', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(40, 'دَعْوَةُ ذِي النُّونِ إِذْ دَعَا وَهُوَ فِي بَطْنِ الحُوتِ... لَمْ يَدْعُ بِهَا رَجُلٌ مُسْلِمٌ فِي شَيْءٍ قَطُّ إِلاَّ اسْتَجَابَ اللَّهُ لَهُ', 'Doa Dzun Nuun (Nabi Yunus) saat di perut ikan... Tidaklah seorang muslim berdoa dengannya dalam keadaan terdesak/cemas melainkan Allah pasti mengabulkannya.', 'Tirmidzi', '3505', NULL, NULL, 'HR. Tirmidzi no. 3505', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(41, 'احْفَظِ اللَّهَ يَحْفَظْكَ، احْفَظِ اللَّهَ تَجِدْهُ تُجَاهَكَ، إِذَا سَأَلْتَ فَاسْأَلِ اللَّهَ، وَإِذَا اسْتَعَنْتَ فَاسْتَعِنْ بِاللَّهِ', 'Jagalah Allah niscaya Dia akan menjagamu... Jika engkau memohon pertolongan, mohonlah kepada Allah.', 'Tirmidzi', '2516', NULL, NULL, 'HR. Tirmidzi no. 2516', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(42, 'وَاعْلَمْ أَنَّ الأُمَّةَ لَوْ اجْتَمَعَتْ عَلَى أَنْ يَنْفَعُوكَ بِشَيْءٍ لَمْ يَنْفَعُوكَ إِلاَّ بِشَيْءٍ قَدْ كَتَبَهُ اللَّهُ لَكَ، وَلَوْ اجْتَمَعُوا عَلَى أَنْ يَضُرُّوكَ بِشَيْءٍ لَمْ يَضُرُّوكَ إِلاَّ بِشَيْءٍ قَدْ كَتَبَهُ اللَّهُ عَلَيْكَ', 'Ketahuilah, sekiranya seluruh umat bersatu untuk memberimu manfaat, mereka tak dapat melakukannya kecuali apa yang telah ditetapkan Allah untukmu. Dan jika mereka bersatu untuk mencelakaimu, mereka tak dapat melakukannya kecuali apa yang telah ditetapkan Allah atasmu.', 'Tirmidzi', '2516', NULL, NULL, 'HR. Tirmidzi no. 2516', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(43, 'إِنَّ عِظَمَ الْجَزَاءِ مَعَ عِظَمِ الْبَلاَءِ', 'Sesungguhnya besarnya balasan (pahala) itu sebanding dengan besarnya ujian/penderitaan.', 'Tirmidzi', '2396', NULL, NULL, 'HR. Tirmidzi no. 2396', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(44, 'مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلاَ وَصَبٍ وَلاَ هَمٍّ وَلاَ حَزَنٍ وَلاَ أَذًى وَلاَ غَمٍّ حَتَّى الشَّوْكَةِ يُشَاكُهَا إِلاَّ كَفَّرَ اللَّهُ بِهَا مِنْ خَطَايَاهُ', 'Tidaklah seorang muslim tertimpa keletihan, penyakit, kecemasan (hamm), kesedihan, gangguan, maupun duka cita melainkan Allah menghapus dosa-dosanya karenanya.', 'Bukhari', '5641', NULL, NULL, 'HR. Bukhari no. 5641', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(45, 'عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ... إِنْ أَصَابَتْهُ ضَرَّاءُ صَبَرَ فَكَانَ خَيْرًا لَهُ', 'Sungguh menakjubkan urusan seorang mukmin... jika ditimpa kesusahan/ancaman dia bersabar, dan itu baik baginya.', 'Muslim', '2999', NULL, NULL, 'HR. Muslim no. 2999', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(46, 'قُلْ آمَنْتُ بِاللَّهِ ثُمَّ اسْتَقِمْ', 'Katakanlah: \'Aku beriman kepada Allah\', kemudian beristiqamahlah (teguhkan pendirianmu).', 'Muslim', '38', NULL, NULL, 'HR. Muslim no. 38', 'cemas', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(47, 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَالْعَجْزِ وَالْكَسَلِ وَالْبُخْلِ وَالْجُبْنِ وَضَلَعِ الدَّيْنِ وَغَلَبَةِ الرِّجَالِ', 'Ya Allah, aku berlindung kepada-Mu dari rasa cemas/gelisah, sedih, lemah, malas, kikir, penakut, beban utang, dan penguasaan orang lain.', 'Bukhari', '6369', NULL, NULL, 'HR. Bukhari no. 6369', 'stres', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(48, 'اللَّهُمَّ اسْتُرْ عَوْرَاتِي وَآمِنْ رَوْعَاتِي', 'Ya Allah, tutupilah auratku (kekuranganku) dan amankanlah aku dari rasa takut/kecemasan.', 'Abu Dawud, Ibnu Majah', '5074', NULL, NULL, 'HR. Abu Dawud no. 5074 & Ibn Majah', 'takut', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(49, 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ لَا إِلَهَ إِلَّا أَنْتَ', 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku. Tiada tuhan selain Engkau.', 'Abu Dawud', '5090', NULL, NULL, 'HR. Abu Dawud no. 5090', 'doa kesusahan, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(50, 'اللهُ اللهُ رَبِّي لَا أُشْرِكُ بِهِ شَيْئًا', 'Allah, Allah adalah Tuhanku, aku tidak mempersekutukan-Nya dengan sesuatu apa pun. (Dibaca saat dilanda kecemasan/kesusahan berat).', 'Abu Dawud', '1525', NULL, NULL, 'HR. Abu Dawud no. 1525', 'doa kesusahan, tauhid', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(51, 'لاَ إِلهَ إِلاَّ اللهُ الْعَظِيْمُ الْحَلِيْمُ، لاَ إِلهَ إِلاَّ اللهُ رَبُّ الْعَرْشِ الْعَظِيْمِ، لاَ إِلهَ إِلاَّ اللهُ رَبُّ السَّمَوَاتِ وَرَبُّ الأَرْضِ وَرَبُّ الْعَرْشِ الْكَرِيْمِ', 'Tiada tuhan selain Allah Yang Maha Agung lagi Maha Penyantun... (Doa Rasulullah SAW saat berada dalam keraguan/kesusahan/kecemasan berat).', 'Bukhari, Muslim', '6345, 2730', NULL, NULL, 'HR. Bukhari no. 6345 & Muslim no. 2730', NULL, 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(52, 'يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ', 'Wahai Yang Mahahidup, Wahai Yang Maha Berdiri Sendiri, dengan rahmat-Mu aku memohon pertolongan.', 'Tirmidzi', '3524', NULL, NULL, 'HR. Tirmidzi no. 3524', 'stres', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(53, 'مَا أَصَابَ أَحَدًا قَطُّ هَمٌّ وَلاَ حَزَنٌ فَقَالَ اللَّهُمَّ إِنِّي عَبْدُكَ... إِلاَّ أَذْهَبَ اللَّهُ هَمَّهُ وَحُزْنَهُ وَأَبْدَلَهُ مَكَانَهُ فَرَجًا', 'Tidaklah seseorang tertimpa kegelisahan (kecemasan) dan kesedihan lalu membaca doa \'Ya Allah, sesungguhnya aku adalah hamba-Mu...\' melainkan Allah akan menghilangkan kecemasannya dan menggantikannya dengan kelapangan.', 'Ahmad', '3712', NULL, NULL, 'HR. Ahmad no. 3712', 'kecewa', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(54, 'كَانَ النَّبِيُّ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ إِذَا حَزَبَهُ أَمْرٌ صَلَّى', 'Nabi SAW apabila ditimpa suatu masalah yang merisaukan/mencemaskan, beliau bergegas mendirikan salat.', 'Abu Dawud', '1319', NULL, NULL, 'HR. Abu Dawud no. 1319', 'stres', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(55, 'دَعْوَةُ ذِي النُّونِ إِذْ دَعَا وَهُوَ فِي بَطْنِ الحُوتِ... لَمْ يَدْعُ بِهَا رَجُلٌ مُسْلِمٌ فِي شَيْءٍ قَطُّ إِلاَّ اسْتَجَابَ اللَّهُ لَهُ', 'Doa Dzun Nuun (Nabi Yunus) saat di perut ikan... Tidaklah seorang muslim berdoa dengannya dalam keadaan terdesak/cemas melainkan Allah pasti mengabulkannya.', 'Tirmidzi', '3505', NULL, NULL, 'HR. Tirmidzi no. 3505', 'doa kesusahan, Nabi Yunus, pengabulan doa', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(56, 'احْفَظِ اللَّهَ يَحْفَظْكَ، احْفَظِ اللَّهَ تَجِدْهُ تُجَاهَكَ، إِذَا سَأَلْتَ فَاسْأَلِ اللَّهَ، وَإِذَا اسْتَعَنْتَ فَاسْتَعِنْ بِاللَّهِ', 'Jagalah Allah niscaya Dia akan menjagamu... Jika engkau memohon pertolongan, mohonlah kepada Allah.', 'Tirmidzi', '2516', NULL, NULL, 'HR. Tirmidzi no. 2516', NULL, 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(57, 'وَاعْلَمْ أَنَّ الأُمَّةَ لَوْ اجْتَمَعَتْ عَلَى أَنْ يَنْفَعُوكَ بِشَيْءٍ لَمْ يَنْفَعُوكَ إِلاَّ بِشَيْءٍ قَدْ كَتَبَهُ اللَّهُ لَكَ، وَلَوْ اجْتَمَعُوا عَلَى أَنْ يَضُرُّوكَ بِشَيْءٍ لَمْ يَضُرُّوكَ إِلاَّ بِشَيْءٍ قَدْ كَتَبَهُ اللَّهُ عَلَيْكَ', 'Ketahuilah, sekiranya seluruh umat bersatu untuk memberimu manfaat, mereka tak dapat melakukannya kecuali apa yang telah ditetapkan Allah untukmu. Dan jika mereka bersatu untuk mencelakaimu, mereka tak dapat melakukannya kecuali apa yang telah ditetapkan Allah atasmu.', 'Tirmidzi', '2516', NULL, NULL, 'HR. Tirmidzi no. 2516', NULL, 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(58, 'إِنَّ عِظَمَ الْجَزَاءِ مَعَ عِظَمِ الْبَلاَءِ', 'Sesungguhnya besarnya balasan (pahala) itu sebanding dengan besarnya ujian/penderitaan.', 'Tirmidzi', '2396', NULL, NULL, 'HR. Tirmidzi no. 2396', 'stres', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(59, 'مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلاَ وَصَبٍ وَلاَ هَمٍّ وَلاَ حَزَنٍ وَلاَ أَذًى وَلاَ غَمٍّ حَتَّى الشَّوْكَةِ يُشَاكُهَا إِلاَّ كَفَّرَ اللَّهُ بِهَا مِنْ خَطَايَاهُ', 'Tidaklah seorang muslim tertimpa keletihan, penyakit, kecemasan (hamm), kesedihan, gangguan, maupun duka cita melainkan Allah menghapus dosa-dosanya karenanya.', 'Bukhari', '5641', NULL, NULL, 'HR. Bukhari no. 5641', 'kecewa', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(60, 'عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ... إِنْ أَصَابَتْهُ ضَرَّاءُ صَبَرَ فَكَانَ خَيْرًا لَهُ', 'Sungguh menakjubkan urusan seorang mukmin... jika ditimpa kesusahan/ancaman dia bersabar, dan itu baik baginya.', 'Muslim', '2999', NULL, NULL, 'HR. Muslim no. 2999', 'kecewa', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(61, 'قُلْ آمَنْتُ بِاللَّهِ ثُمَّ اسْتَقِمْ', 'Katakanlah: \'Aku beriman kepada Allah\', kemudian beristiqamahlah (teguhkan pendirianmu).', 'Muslim', '38', NULL, NULL, 'HR. Muslim no. 38', NULL, 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(62, 'مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلاَ وَصَبٍ وَلاَ هَمٍّ وَلاَ حَزَنٍ وَلاَ أَذًى وَلاَ غَمٍّ حَتَّى الشَّوْكَةِ يُشَاكُهَا إِلاَّ كَفَّرَ اللَّهُ بِهَا مِنْ خَطَايَاهُ', 'Tidaklah seorang muslim tertimpa suatu keletihan (nasab), penyakit, kecemasan, kesedihan, gangguan, maupun duka cita—bahkan duri yang menusuknya—melainkan Allah akan menghapus dosa-dosanya dengan sebab itu.', 'Bukhari, Muslim', '5641, 2573', NULL, NULL, 'HR. Bukhari no. 5641 & Muslim no. 2573', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(63, 'إِنَّ لِرَبِّكَ عَلَيْكَ حَقًّا، وَلِنَفْسِكَ عَلَيْكَ حَقًّا، وَلأَهْلِكَ عَلَيْكَ حَقًّا، فَأَعْطِ كُلَّ ذِي حَقٍّ حَقَّهُ', 'Sesungguhnya Rabbmu memiliki hak atasmu, dirimu (fisikmu) memiliki hak atasmu, dan keluargamu memiliki hak atasmu. Maka berikanlah setiap pemilik hak itu haknya (termasuk hak tubuh untuk beristirahat saat lelah).', 'Bukhari', '1968', NULL, NULL, 'HR. Bukhari no. 1968', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(64, 'إِذَا نَعَسَ أَحَدُكُمْ وَهُوَ يُصَلِّي فَلْيَرْقُدْ حَتَّى يَذْهَبَ عَنْهُ النَّوْمُ', 'Apabila salah seorang di antara kamu mengantuk (karena lelah) ketika salat, hendaklah ia tidur/istirahat terlebih dahulu hingga hilang mengantuknya.', 'Bukhari, Muslim', '212, 786', NULL, NULL, 'HR. Bukhari no. 212 & Muslim no. 786', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(65, 'عَلَيْكُمْ مِنَ الأَعْمَالِ مَا تُطِيقُونَ، فَوَاللَّهِ لاَ يَمَلُّ اللَّهُ حَتَّى تَمَلُّوا', 'Hendaklah kalian beramal sesuai dengan kemampuan kalian. Demi Allah, Allah tidak akan bosan (memberi pahala) sampai kalian sendiri yang bosan/lelah.', 'Bukhari, Muslim', '43, 785', NULL, NULL, 'HR. Bukhari no. 43 & Muslim no. 785', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(66, 'أَحَبُّ الأَعْمَالِ إِلَى اللَّهِ أدْوَمُهَا وَإِنْ قَلَّ', 'Amalan yang paling dicintai oleh Allah adalah amalan yang berkesinambungan (konsisten) meskipun sedikit.', 'Bukhari, Muslim', '6465, 783', NULL, NULL, 'HR. Bukhari no. 6465 & Muslim no. 783', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(67, 'إِنَّ هَذَا الدِّينَ يُسْرٌ، وَلَنْ يُشَادَّ الدِّينَ أَحَدٌ إِلاَّ غَلَبَهُ، فَسَدِّدُوا وَقَارِبُوا', 'Sesungguhnya agama ini mudah. Tidaklah seseorang memaksakan diri dalam agama melainkan ia akan kalah (lelah/lemah). Maka berlakulah lurus dan mendekatlah...', 'Bukhari', '39', NULL, NULL, 'HR. Bukhari no. 39', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(68, 'إِنَّ اللهَ يُحِبُّ إِذَا عَمِلَ أَحَدُكُمْ عَمَلًا أَنْ يُتْقِنَهُ', 'Sesungguhnya Allah menyukai jika salah seorang di antara kalian melakukan suatu pekerjaan, ia melakukannya dengan itqan (profesional/sungguh-sungguh).', 'Thabrani', '897', NULL, NULL, 'HR. Thabrani no. 897', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(69, 'طَلَبُ الْكَسْبِ الْحَلَالِ فَرِيضَةٌ بَعْدَ الْفَرِيضَةِ', 'Mencari rezeki yang halal adalah kewajiban setelah kewajiban (yang utama).', 'Thabrani, Baihaqi', NULL, NULL, NULL, 'HR. Thabrani & Baihaqi', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(70, 'مَنْ أَمْسَى كَالًّا مِنْ عَمَلِ يَدَيْهِ أَمْسَى مَغْفُورًا لَهُ', 'Barangsiapa pada sore hari merasa lelah karena bekerja dengan kedua tangannya (mencari rezeki halal), maka pada sore hari itu ia diampuni dosanya.', 'Thabrani', NULL, NULL, NULL, 'HR. Thabrani (Riwayat dhaif namun populer dalam keutamaan amal)', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(71, 'الْمُؤْمِنُ الْقَوِيُّ خَيْرٌ وَأَحَبُّ إِلَى اللَّهِ مِنَ الْمُؤْمِنِ الضَّعِيفِ وَفِي كُلٍّ خَيْرٌ', 'Mukmin yang kuat lebih baik dan lebih dicintai Allah daripada mukmin yang lemah, walau pada masing-masing ada kebaikan...', 'Muslim', '2664', NULL, NULL, 'HR. Muslim no. 2664', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(72, 'احْرِصْ عَلَى مَا يَنْفَعُكَ وَاسْتَعِنْ بِاللَّهِ وَلاَ تَعْجِزْ', 'Semangatlah terhadap apa yang bermanfaat bagimu, mohonlah pertolongan kepada Allah, dan janganlah merasa lemah/patah semangat.', 'Muslim', '2664', NULL, NULL, 'HR. Muslim no. 2664', 'harapan', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(73, 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْعَجْزِ وَالْكَسَلِ', 'Ya Allah, aku berlindung kepada-Mu dari kelemahan (keletihan yang melumpuhkan) dan kemalasan.', 'Bukhari', '6369', NULL, NULL, 'HR. Bukhari no. 6369', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(74, 'أَلاَ أَدُلُّكُمَا عَلَى مَا هُوَ خَيْرٌ لَكُمَا مِنْ خَادِمٍ؟ إِذَا أَوَيْتُمَا إِلَى فِرَاشِكُمَا فَكَبِّرَا ثَلاَثًا وَثَلاَثِينَ وَسَبِّحَا ثَلاَثًا وَثَلاَثِينَ وَاحْمَدَا ثَلاَثًا وَثَلاَثِينَ', 'Maukah kalian kuajari sesuatu yang lebih baik dari seorang pembantu? Jika kalian hendak tidur, bertakbirlah 33x, bertasbihlah 33x, dan bertahmidlah 33x. (Wasiat Nabi kepada Fatimah & Ali ketika lelah bekerja).', 'Bukhari, Muslim', '3113, 2727', NULL, NULL, 'HR. Bukhari no. 3113 & Muslim no. 2727', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(75, 'إِنَّ لِكُلِّ عَمَلٍ شِرَّةً وَلِكُلِّ شِرَّةٍ فَتْرَةً', 'Sesungguhnya setiap amalan memiliki masa semangat, dan setiap masa semangat memiliki masa futur (titik jenuh/lelah)...', 'Ahmad, Ibnu Hibban', '6725', NULL, NULL, 'HR. Ahmad no. 6725 & Ibn Hibban', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(76, 'أَفْضَلُ الْجِهَادِ أَنْ يُجَاهِدَ الرَّجُلُ نَفْسَهُ وَهَوَاهُ', 'Jihad yang paling utama adalah seseorang yang berjuang melawan dirinya sendiri dan hawa nafsunya.', 'Ibnu Najjar, Al-Albani', NULL, NULL, NULL, 'HR. Ibn Najjar & Al-Albani', 'lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(77, 'بَدَأَ الإِسْلاَمُ غَرِيبًا وَسَيَعُودُ كَمَا بَدَأَ غَرِيبًا فَطُوبَى لِلْغُرَبَاءِ', 'Islam bermula dalam keadaan asing (terasing/sendiri), dan akan kembali asing sebagaimana mulanya. Maka beruntunglah orang-orang yang terasing (al-ghuraba\').', 'Muslim', '145', NULL, NULL, 'HR. Muslim no. 145', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(78, 'أَنَا عِنْدَ ظَنِّ عَبْدِي بِي وَأَنَا مَعَهُ إِذَا ذَكَرَنِي', 'Aku sesuai dengan persangkaan hamba-Ku kepada-Ku, dan Aku bersamanya apabila ia mengingat-Ku.', 'Bukhari, Muslim', '7405, 2675', NULL, NULL, 'HR. Bukhari no. 7405 & Muslim no. 2675', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(79, 'فَإِنْ ذَكَرَنِي فِي نَفْسِهِ ذَكَرْتُهُ فِي نَفْسِي وَإِنْ ذَكَرَنِي فِي مَلإٍ ذَكَرْتُهُ فِي مَلإٍ خَيْرٍ مِنْهُمْ', 'Jika ia mengingat-Ku dalam hatinya (saat sendiri), Aku pun mengingatnya dalam diri-Ku. Dan jika ia mengingat-Ku dalam perkumpulan, Aku mengingatnya dalam perkumpulan yang lebih baik dari mereka.', 'Bukhari', '7405', NULL, NULL, 'HR. Bukhari no. 7405', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(80, 'اللَّهُمَّ آنِسْ وَحْشَتِي فِي قَبْرِي', 'Ya Allah, berilah rasa hangat/hiburan pada kesepianku di dalam kuburku.', 'Al-Dainuri', NULL, NULL, NULL, 'HR. Al-Dainuri & Doa yang masyhur di kalangan ulama', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(81, 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ غَضَبِهِ وَعِقَابِهِ وَشَرِّ عِبَادِهِ وَمِنْ هَمَزَاتِ الشَّيَاطِينِ وَأَنْ يَحْضُرُونِ', 'Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari murka-Nya, siksa-Nya, kejahatan hamba-hamba-Nya, dan dari bisikan setan. (Doa yang diajarkan Rasulullah saat merasa cemas/kesepian di malam hari).', 'Tirmidzi, Abu Dawud', '3528', NULL, NULL, 'HR. Tirmidzi no. 3528 & Abu Dawud', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(82, 'المُؤْمِنُ لِلْمُؤْمِنِ كَالْبُنْيَانِ يَشُدُّ بَعْضُهُ بَعْضًا', 'Seorang mukmin bagi mukmin lainnya adalah bagaikan satu bangunan yang saling menguatkan satu sama lain.', 'Bukhari, Muslim', '481, 2585', NULL, NULL, 'HR. Bukhari no. 481 & Muslim no. 2585', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(83, 'مَثَلُ الْمُؤْمِنِينَ فِي تَوَادِّهِمْ وَتَرَاحُمِهِمْ وَتَعَاطُفِهِمْ مَثَلُ الْجَسَدِ إِذَا اشْتَكَى مِنْهُ عُضْوٌ تَدَاعَى لَهُ سَائِرُ الْجَسَدِ بِالسَّهَرِ وَالْحُمَّى', 'Perumpamaan orang-orang mukmin dalam hal saling mencintai, mengasihi, dan menyayangi adalah bagaikan satu tubuh. Apabila ada salah satu anggota tubuh yang sakit, maka seluruh tubuh ikut merasa tidak bisa tidur dan demam.', 'Muslim', '2586', NULL, NULL, 'HR. Muslim no. 2586', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(84, 'الرَّجُلُ عَلَى دِينِ خَلِيلِهِ فَلْيَنْظُرْ أَحَدُكُمْ مَنْ يُخَالِلُ', 'Seseorang itu tergantung pada agama teman dekatnya. Maka hendaklah salah seorang di antara kalian memperhatikan siapa yang dijadikan teman dekatnya.', 'Abu Dawud, Tirmidzi', '4833', NULL, NULL, 'HR. Abu Dawud no. 4833 & Tirmidzi', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(85, 'إِنَّمَا جُلَسَاءُ الْخَيْرِ وَجُلَسَاءُ السُّوءِ كَحَامِلِ الْمِسْكِ وَنَافِخِ الْكِيرِ', 'Permisalan teman yang baik dan teman yang buruk adalah seperti penjual minyak wangi dan pentiup cerobong tukang besi...', 'Bukhari', '5534', NULL, NULL, 'HR. Bukhari no. 5534', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(86, 'لاَ تَصَاحِبْ إِلاَّ مُؤْمِنًا وَلاَ يَأْكُلْ طَعَامَكَ إِلاَّ تَقِيٌّ', 'Janganlah engkau berteman dekat melainkan dengan orang mukmin, dan janganlah memakan makananmu melainkan orang yang bertakwa.', 'Abu Dawud', '4832', NULL, NULL, 'HR. Abu Dawud no. 4832', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(87, 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ', 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri (sendirian tanpa perlindungan-Mu) walau sekejap mata pun...', 'Abu Dawud', '5090', NULL, NULL, 'HR. Abu Dawud no. 5090', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(88, 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ', 'Ya Allah, aku berlindung kepada-Mu dari rasa cemas dan kesedihan (termasuk duka akibat rasa sepi).', 'Bukhari', '6369', NULL, NULL, 'HR. Bukhari no. 6369', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(89, 'إِنَّ اللَّهَ حَيِيٌّ كَرِيمٌ يَسْتَحْيِي إِذَا رَفَعَ الرَّجُلُ إِلَيْهِ يَدَيْهِ أَنْ يَرُدَّهُمَا صِفْرًا خَائِبَتَيْنِ', 'Sesungguhnya Allah Maha Pemalu lagi Mahamulia. Dia malu jika seorang hamba mengangkat kedua tangannya kepada-Nya, lalu Dia mengembalikannya dalam keadaan kosong/hampa.', 'Tirmidzi', '3556', NULL, NULL, 'HR. Tirmidzi no. 3556', 'harapan', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(90, 'مَا مِنْ مُسْلِمٍ يَدْعُو بِدَعْوَةٍ لَيْسَ فِيهَا إِثْمٌ وَلاَ قَطِيعَةُ رَحِمٍ إِلاَّ أَعْطَاهُ اللَّهُ بِهَا إِحْدَى ثَلاَثٍ', 'Tidak ada seorang muslim pun yang berdoa dengan suatu doa yang tidak mengandung dosa dan tidak memutuskan silaturahmi, melainkan Allah pasti memberinya salah satu dari tiga hal (dikabulkan langsung, disimpan untuk akhirat, atau dijauhkan dari keburukan)...', 'Ahmad', '11133', NULL, NULL, 'HR. Ahmad no. 11133', 'harapan', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(91, 'صَلاَةُ الْجَمَاعَةِ تَفْضُلُ صَلاَةَ الْفَذِّ بِسَبْعٍ وَعِشْرِينَ دَرَجَةً', 'Salat berjamaah itu lebih utama daripada salat sendirian sebanyak 27 derajat.', 'Bukhari, Muslim', '645, 650', NULL, NULL, 'HR. Bukhari no. 645 & Muslim no. 650', 'kesepian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(92, 'لَيْسَ الشَّدِيدُ بِالصُّرَعَةِ، إِنَّمَا الشَّدِيدُ الَّذِي يَمْلِكُ نَفْسَهُ عِنْدَ الْغَضَبِ', 'Orang yang kuat itu bukanlah orang yang jago gulat, melainkan orang yang mampu mengendalikan dirinya saat marah.', 'Bukhari, Muslim', '6114, 2609', NULL, NULL, 'HR. Bukhari no. 6114 & Muslim no. 2609', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(93, 'لاَ تَغْضَبْ، وَلَكَ الْجَنَّةُ', 'Janganlah engkau marah, maka bagimu surga.', 'Thabrani', NULL, NULL, NULL, 'HR. Thabrani (Mu\'jam al-Awsat) & Sahih al-Jami\' no. 7374', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(94, 'لاَ تَغْضَبْ', 'Jangan marah.', 'Bukhari', '6116', NULL, NULL, 'HR. Bukhari no. 6116', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(95, 'إِذَا غَضِبَ أَحَدُكُمْ فَلْيَسْكُتْ', 'Apabila salah seorang di antara kalian marah, hendaklah ia diam.', 'Ahmad', '2137', NULL, NULL, 'HR. Ahmad no. 2137', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(96, 'إِذَا غَضِبَ أَحَدُكُمْ وَهُوَ قَائِمٌ فَلْيَجْلِسْ، فَإِنْ ذَهَبَ عَنْهُ الْغَضَبُ وَإِلاَّ فَلْيَضْطَجِعْ', 'Apabila salah seorang di antara kalian marah dalam keadaan berdiri, hendaklah ia duduk. Jika amarahnya belum hilang, hendaklah ia berbaring.', 'Abu Dawud', '4782', NULL, NULL, 'HR. Abu Dawud no. 4782', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(97, 'إِنَّ الْغَضَبَ مِنَ الشَّيْطَانِ وَإِنَّ الشَّيْطَانَ خُلِقَ مِنَ النَّارِ وَإِنَّمَا تُطْفَأُ النَّارُ بِالْمَاءِ فَإِذَا غَضِبَ أَحَدُكُمْ فَلْيَتَوَضَّأْ', 'Sesungguhnya amarah itu dari setan, dan setan diciptakan dari api. Api hanya dapat dipadamkan dengan air. Maka apabila salah seorang di antara kalian marah, hendaklah ia berwudu.', 'Abu Dawud', '4784', NULL, NULL, 'HR. Abu Dawud no. 4784', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(98, 'إِنِّي لأَعْلَمُ كَلِمَةً لَوْ قَالَهَا لَذَهَبَ عَنْهُ مَا يَجِدُ: أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ', 'Sungguh aku mengetahui satu kalimat yang jika diucapkannya, niscaya akan hilang apa yang dirasakannya (amarah): \'A\'udzu billahi minasysyaithanirrajim\'.', 'Bukhari, Muslim', '6115, 2610', NULL, NULL, 'HR. Bukhari no. 6115 & Muslim no. 2610', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(99, 'مَنْ كَظَمَ غَيْظًا وَهُوَ قَادِرٌ عَلَى أَنْ يُنْفِذَهُ دَعَاهُ اللَّهُ عَزَّ وَجَلَّ عَلَى رُؤُوسِ الْخَلاَئِقِ يَوْمَ الْقِيَامَةِ حَتَّى يُخَيِّرَهُ اللَّهُ مِنَ الْحُورِ الْعِينِ مَا شَاءَ', 'Barangsiapa menahan amarah padahal dia sanggup melampiaskannya, Allah akan memanggilnya di hadapan seluruh makhluk pada hari kiamat dan memberinya kebebasan memilih bidadari yang diinginkannya.', 'Abu Dawud, Tirmidzi', '4777, 2021', NULL, NULL, 'HR. Abu Dawud no. 4777 & Tirmidzi no. 2021', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(100, 'مَا مِنْ جُرْعَةٍ أَعْظَمُ أَجْرًا عِنْدَ اللَّهِ مِنْ جُرْعَةِ غَيْظٍ كَظَمَهَا عَبْدٌ ابْتِغَاءَ وَجْهِ اللَّهِ', 'Tidak ada satu tegukan pun yang lebih besar pahalanya di sisi Allah selain tegukan amarah yang ditahan seorang hamba semata-mata karena mengharap wajah Allah.', 'Ibnu Majah', '4189', NULL, NULL, 'HR. Ibn Majah no. 4189', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(101, 'لاَ يَقْضِيَنَّ حَكَمٌ بَيْنَ اثْنَيْنِ وَهُوَ غَضْبَانُ', 'Janganlah seorang hakim memutuskan hukum antara dua orang dalam keadaan ia sedang marah.', 'Bukhari, Muslim', '7158, 1717', NULL, NULL, 'HR. Bukhari no. 7158 & Muslim no. 1717', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(102, 'لاَ تَدْعُوا عَلَى أَنْفُسِكُمْ وَلاَ تَدْعُوا عَلَى أَوْلاَدِكُمْ وَلاَ تَدْعُوا عَلَى أَمْوَالِكُمْ', 'Janganlah kalian mendoakan keburukan atas diri kalian, anak-anak kalian, maupun harta kalian (saat marah).', 'Muslim', '3009', NULL, NULL, 'HR. Muslim no. 3009', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(103, 'اللَّهُمَّ إِنِّي أَسْأَلُكَ كَلِمَةَ الْحَقِّ فِي الرِّضَا وَالْغَضَبِ', 'Ya Allah, aku memohon kepada-Mu (kemampuan mengucapkan) kalimat yang haq (benar) dalam keadaan ridha maupun marah.', 'An-Nasa\'i', '1305', NULL, NULL, 'HR. An-Nasa\'i no. 1305', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(104, 'أَنَّ رَسُولَ اللَّهِ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ لَمْ يَكُنْ يَغْضَبُ لِنَفْسِهِ، إِلاَّ أَنْ تُنْتَهَكَ حُرُمَاتُ اللَّهِ', 'Rasulullah SAW tidak pernah marah karena urusan pribadinya, kecuali jika batasan-batasan (kehormatan) Allah dilanggar.', 'Bukhari, Muslim', '6126, 2327', NULL, NULL, 'HR. Bukhari no. 6126 & Muslim no. 2327', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(105, 'مَا نَقَصَتْ صَدَقَةٌ مِنْ مَالٍ، وَمَا زَادَ اللَّهُ عَبْدًا بِعَفْوٍ إِلاَّ عِزًّا', 'Sedekah tidak akan mengurangi harta, dan tidaklah Allah menambah bagi seorang hamba yang suka memaafkan (meredam amarah) melainkan kemuliaan.', 'Muslim', '2588', NULL, NULL, 'HR. Muslim no. 2588', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(106, 'إِنَّ اللَّهَ رَفِيقٌ يُحِبُّ الرِّفْقَ، وَيُعْطِي عَلَى الرِّفْقِ مَا لاَ يُعْطِي عَلَى الْعُنْفِ', 'Sesungguhnya Allah Maha Lembut dan menyukai kelembutan. Dia memberikan pada kelembutan apa yang tidak Dia berikan pada kekerasan (amarah).', 'Muslim', '2593', NULL, NULL, 'HR. Muslim no. 2593', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(107, 'مَنْ يُحْرَمِ الرِّفْقَ يُحْرَمِ الْخَيْرَ', 'Barangsiapa dihalangi dari sifat lembut (mudah marah/kasar), maka ia dihalangi dari seluruh kebaikan.', 'Muslim', '2592', NULL, NULL, 'HR. Muslim no. 2592', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(108, 'إِنَّ الرِّفْقَ لاَ يَكُونُ فِي شَيْءٍ إِلاَّ زَانَهُ، وَلاَ يُنْزَعُ مِنْ شَيْءٍ إِلاَّ شَانَهُ', 'Sungguh, kelembutan itu tidaklah ada pada sesuatu melainkan akan menghiasinya, dan tidaklah dicabut dari sesuatu melainkan akan memperburuknya.', 'Muslim', '2594', NULL, NULL, 'HR. Muslim no. 2594', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(109, 'أَلاَ أُخْبِرُكُمْ بِمَنْ يَحْرُمُ عَلَى النَّارِ؟ عَلَى كُلِّ قَرِيبٍ هَيِّنٍ سَهْلٍ', 'Maukah kalian kuingatkan tentang orang yang diharamkan dari api neraka? Yaitu setiap orang yang dekat (ramah), tenang, dan mudah/tidak gampang marah.', 'Tirmidzi', '2488', NULL, NULL, 'HR. Tirmidzi no. 2488', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(110, 'ثَلاَثٌ مُنْجِيَاتٌ: خَشْيَةُ اللَّهِ فِي السِّرِّ وَالْعَلاَنِيَةِ، وَالْعَدْلُ فِي الرِّضَا وَالْغَضَبِ...', 'Tiga hal yang menyelamatkan: takut kepada Allah saat sendiri maupun terang-terangan, dan berlaku adil saat ridha maupun marah...', 'Thabrani', NULL, NULL, NULL, 'HR. Thabrani (Al-Mu\'jam al-Awsat) & Albani', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(111, 'اللَّهُمَّ قِنِي شَرَّ نَفْسِي وَاعْزِمْ لِي عَلَى أَرْشَدِ أَمْرِي', 'Ya Allah, lindungilah aku dari kejahatan diriku (termasuk hawa nafsu dan amarahku) dan mantapkanlah aku pada urusanku yang paling lurus.', 'Ahmad', '19992', NULL, NULL, 'HR. Ahmad no. 19992', 'marah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(112, 'عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ... إِنْ أَصَابَتْهُ سَرَّاءُ شَكَرَ فَكَانَ خَيْرًا لَهُ', 'Sungguh menakjubkan urusan seorang mukmin, seluruh urusannya adalah baik baginya. Jika ia mendapatkan kesenangan/kebahagiaan ia bersyukur, maka itu baik baginya...', 'Muslim', '2999', NULL, NULL, 'HR. Muslim no. 2999', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(113, 'مَنْ أَصْبَحَ مِنْكُمْ آمِنًا فِي سِرْبِهِ، مُعَافًى فِي جَسَدِهِ، عِنْدَهُ قُوتُ يَوْمِهِ، فَكَأَنَّمَا حِيزَتْ لَهُ الدُّنْيَا', 'Barangsiapa di antara kalian merasa aman di tempat tinggalnya, sehat badannya, dan memiliki makanan untuk harinya, maka seolah-olah dunia telah dikumpulkan untuknya (puncak bahagia).', 'Tirmidzi', '2346', NULL, NULL, 'HR. Tirmidzi no. 2346', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(114, 'قَدْ أَفْلَحَ مَنْ أَسْلَمَ وَرُزِقَ كَفَافًا وَقَنَّعَهُ اللَّهُ بِمَا آتَاهُ', 'Sungguh beruntung (bahagia) orang yang telah berserah diri (masuk Islam), diberi rezeki yang cukup, dan dijadikan merasa cukup (qana\'ah) oleh Allah atas apa yang diberikan kepadanya.', 'Muslim', '1054', NULL, NULL, 'HR. Muslim no. 1054', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(115, 'لَيْسَ الْغِنَى عَنْ كَثْرَةِ الْعَرَضِ، وَلَكِنَّ الْغِنَى غِنَى النَّفْسِ', 'Kekayaan (kebahagiaan hakiki) itu bukanlah dengan banyaknya harta benda, melainkan kekayaan itu adalah kaya hati (rasa cukup).', 'Bukhari, Muslim', '6446, 1051', NULL, NULL, 'HR. Bukhari no. 6446 & Muslim no. 1051', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(116, 'لِلصَّائِمِ فَرْحَتَانِ يَفْرَحُهُمَا: إِذَا أَفْطَرَ فَرِحَ، وَإِذَا لَقِيَ رَبَّهُ فَرِحَ بِصَوْمِهِ', 'Bagi orang yang berpuasa ada dua kegembiraan (kebahagiaan) yang dirasakannya: saat ia berbuka ia bergembira, dan saat ia bertemu Tuhannya ia bergembira karena pahala puasanya.', 'Bukhari, Muslim', '1904, 1151', NULL, NULL, 'HR. Bukhari no. 1904 & Muslim no. 1151', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(117, 'تَبَسُّمُكَ فِي وَجْهِ أَخِيكَ لَكَ صَدَقَةٌ', 'Senyummu di hadapan saudaramu adalah sedekah bagimu.', 'Tirmidzi', '1956', NULL, NULL, 'HR. Tirmidzi no. 1956', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(118, 'أَفْضَلُ الأَعْمَالِ إِدْخَالُ السُّرُورِ عَلَى الْمُؤْمِنِ', 'Amalan yang paling utama adalah memasukkan rasa gembira/bahagia ke dalam hati seorang mukmin.', 'Thabrani', NULL, NULL, NULL, 'HR. Thabrani (Al-Mu\'jam al-Awsat) & Albani', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(119, 'أَحَبُّ الأَعْمَالِ إِلَى اللَّهِ سُرُورٌ تُدْخِلُهُ عَلَى مُسْلِمٍ', 'Amalan yang paling dicintai Allah adalah kegembiraan yang engkau masukkan ke dalam diri seorang muslim...', 'Ibnu Abi ad-Dunya', NULL, NULL, NULL, 'HR. Ibn Abi ad-Dunya & As-Silsilah as-Sahihah no. 906', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(120, 'مَنْ كَانَتِ الآخِرَةُ هَمَّهُ جَعَلَ اللَّهُ غِنَاهُ فِي قَلْبِهِ وَجَمَعَ لَهُ شَمْلَهُ وَأَتَتْهُ الدُّنْيَا وَهِيَ رَاغِمَةٌ', 'Barangsiapa yang niat utamanya adalah akhirat, niscaya Allah akan menjadikan kekayaan/kebahagiaan dalam hatinya, menyatukan urusannya, dan dunia akan mendatanginya dalam keadaan tunduk.', 'Tirmidzi', '2465', NULL, NULL, 'HR. Tirmidzi no. 2465', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(121, 'أَرْبَعٌ مِنَ السَّعَادَةِ: الْمَرْأَةُ الصَّالِحَةُ، وَالْمَسْكَنُ الْوَاسِعُ، وَالْجَارُ الصَّالِحُ، وَالْمَرْكَبُ الْهَنِيءُ', 'Empat hal yang termasuk kebahagiaan: istri/pasangan yang saleh, tempat tinggal yang luas, tetangga yang baik, dan kendaraan yang nyaman.', 'Ibnu Hibban', '4032', NULL, NULL, 'HR. Ibn Hibban no. 4032 & Al-Albani', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(122, 'ذَاقَ طَعْمَ الإِيمَانِ مَنْ رَضِيَ بِاللَّهِ رَبًّا وَبِالإِسْلاَمِ دِينًا وَبِمُحَمَّدٍ رَسُولاً', 'Akan merasakan kemanisan (kebahagiaan) iman: orang yang ridha Allah sebagai Rabb-nya, Islam sebagai agamanya, dan Muhammad sebagai Rasul-Nya.', 'Muslim', '34', NULL, NULL, 'HR. Muslim no. 34', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(123, 'ثَلاَثٌ مَنْ كُنَّ فِيهِ وَجَدَ حَلاَوَةَ الإِيمَانِ: أَنْ يَكُونَ اللَّهُ وَرَسُولُهُ أَحَبَّ إِلَيْهِ مِمَّا سِوَاهُمَا...', 'Tiga hal yang apabila ada pada diri seseorang, ia akan merasakan manisnya (kebahagiaan) iman: Allah dan Rasul-Nya lebih ia cintai dari selain keduanya...', 'Bukhari, Muslim', '16, 43', NULL, NULL, 'HR. Bukhari no. 16 & Muslim no. 43', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(124, 'وَجُعِلَتْ قُرَّةُ عَيْنِي فِي الصَّلاَةِ', '...Dan dijadikan puncak kebahagiaan/kesenanganku berada di dalam salat.', 'An-Nasa\'i', '3940', NULL, NULL, 'HR. An-Nasa\'i no. 3940', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(125, 'أَرِحْنَا بِهَا يَا بِلاَلُ', 'Istirahatkanlah kami (buatlah kami bahagia/tenang) dengan salat, wahai Bilal!', 'Abu Dawud', '4985', NULL, NULL, 'HR. Abu Dawud no. 4985', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(126, 'اللَّهُمَّ إِنِّي أَسْأَلُكَ النَّعِيمَ الَّذِي لاَ يَحُولُ وَلاَ يَزُولُ', 'Ya Allah, sesungguhnya aku memohon kepada-Mu kenikmatan (kebahagiaan) yang tidak akan berubah dan tidak akan sirna.', 'An-Nasa\'i, Ahmad', NULL, NULL, NULL, 'HR. An-Nasa\'i (Al-Sunan al-Kubra) & Ahmad', 'bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36');
INSERT INTO `hadiths` (`id`, `arabic_text`, `translation`, `book`, `number`, `narrator`, `grade`, `source`, `tags`, `status`, `reviewer_id`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(127, 'مَا اجْتَمَعَ قَوْمٌ فِي بَيْتٍ مِنْ بُيُوتِ اللَّهِ يَتْلُونَ كِتَابَ اللَّهِ وَيَتَدَارَسُونَهُ بَيْنَهُمْ إِلاَّ نَزَلَتْ عَلَيْهِمُ السَّكِينَةُ وَغَشِيَتْهُمُ الرَّحْمَةُ', 'Tidaklah suatu kaum berkumpul di salah satu rumah Allah membaca Kitabullah dan saling mempelajarinya di antara mereka, melainkan akan turun kepada mereka ketenangan (sakinah) dan diliputi rahmat...', 'Muslim', '2699', NULL, NULL, 'HR. Muslim no. 2699', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(128, 'اقْرَأْ فُلاَنُ فَإِنَّهَا السَّكِينَةُ تَنَزَّلَتْ لِلْقُرْآنِ', 'Bacalah terus wahai fulan, sesungguhnya itu adalah ketenangan (sakinah) yang turun karena (bacaan) Al-Qur\'an.', 'Bukhari, Muslim', '5011, 795', NULL, NULL, 'HR. Bukhari no. 5011 & Muslim no. 795', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(129, 'دَعْ مَا يَرِيبُكَ إِلَى مَا لاَ يَرِيبُكَ فَإِنَّ الصِّدْقَ طُمَأْنِينَةٌ وَإِنَّ الْكَذِبَ رِيبَةٌ', 'Tinggalkanlah apa yang meragukanmu menuju apa yang tidak meragukanmu. Sesungguhnya kejujuran itu membawa ketenangan (tuma\'ninah) dan kedustaan itu membawa keraguan.', 'Tirmidzi', '2518', NULL, NULL, 'HR. Tirmidzi no. 2518', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(130, 'الْبِرُّ مَا اطْمَأَنَّتْ إِلَيْهِ النَّفْسُ وَاطْمَأَنَّ إِلَيْهِ الْقَلْبُ', 'Kebaikan itu adalah apa yang membuat jiwa merasa tenteram dan hati merasa tenang kepadanya...', 'Ahmad, Ad-Darimi', '17742', NULL, NULL, 'HR. Ahmad no. 17742 & Ad-Darimi', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(131, 'إِذَا أُقِيمَتِ الصَّلاَةُ فَلاَ تَأْتُوهَا وَأَنْتُمْ تَسْعَوْنَ وَأْتُوهَا تَمْشُونَ وَعَلَيْكُمُ السَّكِينَةُ', 'Apabila salat telah diiqamahkan, janganlah kalian mendatanginya dengan berlari, tetapi datangilah dengan berjalan biasa dan hendaklah kalian bersikap tenang (sakinah)...', 'Bukhari, Muslim', '908, 602', NULL, NULL, 'HR. Bukhari no. 908 & Muslim no. 602', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(132, 'أَرِحْنَا بِهَا يَا بِلاَلُ', 'Istirahatkanlah kami (buatlah kami tenang/tenteram) dengan salat, wahai Bilal!', 'Abu Dawud', '4985', NULL, NULL, 'HR. Abu Dawud no. 4985', 'stres', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(133, 'وَجُعِلَتْ قُرَّةُ عَيْنِي فِي الصَّلاَةِ', '...Dan dijadikan puncak ketenangan/kesenanganku berada di dalam salat.', 'An-Nasa\'i', '3940', NULL, NULL, 'HR. An-Nasa\'i no. 3940', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(134, 'اللَّهُمَّ أَنْتَ السَّلاَمُ وَمِنْكَ السَّلاَمُ تَبَارَكْتَ يَا ذَا الْجَلاَلِ وَالإِكْرَامِ', 'Ya Allah, Engkau adalah Maha Sejahtera (sumber kedamaian/ketenangan) dan dari-Mulah kesejahteraan...', 'Muslim', '591', NULL, NULL, 'HR. Muslim no. 591', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(135, 'اللَّهُمَّ إِنِّي أَسْأَلُكَ النَّفْسَ الْمُطْمَئِنَّةَ تُؤْمِنُ بِلِقَائِكَ وَتَرْضَى بِقَضَائِكَ وَتَقْنَعُ بِعَطَائِكَ', 'Ya Allah, aku memohon kepada-Mu jiwa yang tenang, yang beriman akan perjumpaan dengan-Mu, ridha atas ketetapan-Mu, dan merasa cukup dengan pemberian-Mu.', 'Thabrani', NULL, NULL, NULL, 'HR. Thabrani (Al-Mu\'jam al-Kabir)', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(136, 'عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ... إِنْ أَصَابَتْهُ سَرَّاءُ شَكَرَ فَكَانَ خَيْرًا لَهُ وَإِنْ أَصَابَتْهُ ضَرَّاءُ صَبَرَ فَكَانَ خَيْرًا لَهُ', 'Sungguh menakjubkan urusan seorang mukmin, seluruh urusannya adalah baik... Jika mendapatkan kesenangan ia bersyukur dan jika ditimpa kesusahan ia bersabar, maka itu baik baginya.', 'Muslim', '2999', NULL, NULL, 'HR. Muslim no. 2999', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(137, 'أَنَا عِنْدَ ظَنِّ عَبْدِي بِي وَأَنَا مَعَهُ إِذَا ذَكَرَنِي', 'Aku sesuai dengan persangkaan hamba-Ku kepada-Ku, dan Aku bersamanya apabila ia mengingat-Ku.', 'Bukhari, Muslim', '7405, 2675', NULL, NULL, 'HR. Bukhari no. 7405 & Muslim no. 2675', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(138, 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ', 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku.', 'Abu Dawud', '5090', NULL, NULL, 'HR. Abu Dawud no. 5090', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(139, 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَالْعَجْزِ وَالْكَسَلِ', 'Ya Allah, aku berlindung kepada-Mu dari rasa cemas, sedih, lemah, dan malas.', 'Bukhari', '6369', NULL, NULL, 'HR. Bukhari no. 6369', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(140, 'مَنْ أَصْبَحَ مِنْكُمْ آمِنًا فِي سِرْبِهِ مُعَافًى فِي جَسَدِهِ عِنْدَهُ قُوتُ يَوْمِهِ فَكَأَنَّمَا حِيزَتْ لَهُ الدُّنْيَا', 'Barangsiapa di antara kalian merasa aman di tempat tinggalnya, sehat badannya, dan memiliki makanan untuk harinya, maka seolah-olah dunia telah dikumpulkan untuknya.', 'Tirmidzi', '2346', NULL, NULL, 'HR. Tirmidzi no. 2346', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(141, 'السَّكِينَةُ تُؤَدَّى فِي السَّلاَمِ', 'Ketenangan itu diwujudkan dalam kedamaian dan kelembutan.', 'Bukhari, Muslim', NULL, NULL, NULL, 'HR. Bukhari (Fi al-Adab) & Muslim', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(142, 'الْمُؤْمِنُ الْقَوِيُّ خَيْرٌ وَأَحَبُّ إِلَى اللَّهِ مِنَ الْمُؤْمِنِ الضَّعِيفِ وَفِي كُلٍّ خَيْرٌ', 'Mukmin yang kuat lebih baik dan lebih dicintai Allah daripada mukmin yang lemah, meskipun pada masing-masing ada kebaikan...', 'Muslim', '2664', NULL, NULL, 'HR. Muslim no. 2664', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(143, 'احْرِصْ عَلَى مَا يَنْفَعُكَ وَاسْتَعِنْ بِاللَّهِ وَلاَ تَعْجِزْ', 'Semangatlah terhadap apa yang bermanfaat bagimu, mohonlah pertolongan kepada Allah, dan janganlah merasa lemah/patah semangat.', 'Muslim', '2664', NULL, NULL, 'HR. Muslim no. 2664', 'lelah', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(144, 'إِنْ قَامَتِ السَّاعَةُ وَبِيَدِ أَحَدِكُمْ فَصِيلَةٌ فَإِنِ اسْتَطَاعَ أَنْ لاَ تَقُومَ حَتَّى يَغْرِسَهَا فَلْيَفْعَلْ', 'Jika hari kiamat telah tiba sedang di tangan salah seorang di antara kalian ada bibit pohon, maka jika ia mampu menanamnya sebelum kiamat terjadi, hendaklah ia menanamnya.', 'Ahmad', '12981', NULL, NULL, 'HR. Ahmad no. 12981 & Al-Bukhari (Al-Adab al-Mufrad)', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(145, 'إِنَّ اللَّهَ يُحِبُّ إِذَا عَمِلَ أَحَدُكُمْ عَمَلًا أَنْ يُتْقِنَهُ', 'Sesungguhnya Allah menyukai jika salah seorang di antara kalian melakukan suatu pekerjaan, ia melakukannya secara itqan (sungguh-sungguh/profesional).', 'Thabrani, Baihaqi', '897', NULL, NULL, 'HR. Thabrani no. 897 & Baihaqi', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(146, 'أَحَبُّ الأَعْمَالِ إِلَى اللَّهِ أدْوَمُهَا وَإِنْ قَلَّ', 'Amalan yang paling dicintai oleh Allah adalah amalan yang berkesinambungan (konsisten) meskipun sedikit.', 'Bukhari, Muslim', '6465, 783', NULL, NULL, 'HR. Bukhari no. 6465 & Muslim no. 783', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(147, 'مَا أَكَلَ أَحَدٌ طَعَامًا قَطُّ خَيْرًا مِنْ أَنْ يَأْكُلَ مِنْ عَمَلِ يَدِهِ', 'Tidak ada seorang pun yang memakan makanan yang lebih baik daripada makan dari hasil kerja tangannya sendiri.', 'Bukhari', '2072', NULL, NULL, 'HR. Bukhari no. 2072', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(148, 'لَأَنْ يَأْخُذَ أَحَدُكُمْ حَبْلَهُ فَيَأْتِيَ بِحُزْمَةِ حَطَبٍ عَلَى ظَهْرِهِ فَيَبِيعَهَا... خَيْرٌ لَهُ مِنْ أَنْ يَسْأَلَ النَّاسَ', 'Sungguh, jika salah seorang di antara kalian mengambil talinya lalu membawa seikat kayu bakar di atas punggungnya kemudian menjualnya... itu lebih baik baginya daripada meminta-minta kepada orang lain...', 'Bukhari, Muslim', '1471', NULL, NULL, 'HR. Bukhari no. 1471 & Muslim', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(149, 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْعَجْزِ وَالْكَسَلِ', 'Ya Allah, aku berlindung kepada-Mu dari kelemahan dan kemalasan.', 'Bukhari', '6369', NULL, NULL, 'HR. Bukhari no. 6369', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(150, 'بَارِكْ لأُمَّتِي فِي بُكُورِهَا', 'Ya Allah, berkahilah umatku pada waktu pagi hari mereka (saat memulai aktivitas dengan semangat).', 'Abu Dawud, Tirmidzi', '2606', NULL, NULL, 'HR. Abu Dawud no. 2606 & Tirmidzi', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(151, 'يَسِّرُوا وَلاَ تُعَسِّرُوا، وَبَشِّرُوا وَلاَ تُنَفِّرُوا', 'Permudahlah dan jangan kamu persulit, berilah kabar gembira (bangkitkan semangat) dan jangan buat mereka lari/putus asa.', 'Bukhari, Muslim', '69, 1734', NULL, NULL, 'HR. Bukhari no. 69 & Muslim no. 1734', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(152, 'مَنْ سَلَكَ طَرِيقًا يَلْتَمِسُ فِيهِ عِلْمًا سَهَّلَ اللَّهُ لَهُ بِهِ طَرِيقًا إِلَى الْجَنَّةِ', 'Barangsiapa menempuh suatu jalan untuk mencari ilmu, maka Allah akan memudahkan jalannya menuju surga.', 'Muslim', '2699', NULL, NULL, 'HR. Muslim no. 2699', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(153, 'طَلَبُ الْعِلْمِ فَرِيضَةٌ عَلَى كُلِّ مُسْلِمٍ', 'Menuntut ilmu itu wajib bagi setiap muslim.', 'Ibnu Majah', '224', NULL, NULL, 'HR. Ibn Majah no. 224', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(154, 'الْيَدُ الْعُلْيَا خَيْرٌ مِنَ الْيَدِ السُّفْلَى', 'Tangan yang di atas (memberi) lebih baik daripada tangan yang di bawah (menerima).', 'Bukhari, Muslim', '1429, 1033', NULL, NULL, 'HR. Bukhari no. 1429 & Muslim no. 1033', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(155, 'سَدِّدُوا وَقَارِبُوا وَأَبْشِرُوا', 'Berlakulah lurus, mendekatlah (kepada kebenaran), dan bergembiralah (peliharalah semangatmu).', 'Bukhari, Muslim', '6467, 2818', NULL, NULL, 'HR. Bukhari no. 6467 & Muslim no. 2818', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(156, 'إِنَّ لِكُلِّ عَمَلٍ شِرَّةً وَلِكُلِّ شِرَّةٍ فَتْرَةً فَمَنْ كَانَتْ فَتْرَتُهُ إِلَى سُنَّتِي فَقَدِ اهْتَدَى', 'Sesungguhnya setiap amalan memiliki masa semangat (puncak pendorong), dan setiap masa semangat memiliki titik jenuh. Barangsiapa yang saat jenuhnya tetap kembali pada sunnahku, maka sungguh ia telah mendapat petunjuk.', 'Ahmad, Ibnu Hibban', '6725', NULL, NULL, 'HR. Ahmad no. 6725 & Ibn Hibban', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(157, 'لاَ يُؤْمِنُ أَحَدُكُمْ حَتَّى يُحِبَّ لأَخِيهِ مَا يُحِبُّ لِنَفْسِهِ', 'Tidak sempurna iman salah seorang di antara kalian hingga ia mencintai untuk saudaranya apa yang ia cintai untuk dirinya sendiri.', 'Bukhari, Muslim', '13, 45', NULL, NULL, 'HR. Bukhari no. 13 & Muslim no. 45', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(158, 'لاَ يُؤْمِنُ أَحَدُكُمْ حَتَّى أَكُونَ أَحَبَّ إِلَيْهِ مِنْ وَالِدِهِ وَوَلَدِهِ وَالنَّاسِ أَجْمَعِينَ', 'Tidak sempurna iman salah seorang di antara kalian sampai aku (Nabi) lebih ia cintai daripada orang tuanya, anaknya, dan seluruh manusia.', 'Bukhari, Muslim', '15, 44', NULL, NULL, 'HR. Bukhari no. 15 & Muslim no. 44', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(159, 'ثَلاَثٌ مَنْ كُنَّ فِيهِ وَجَدَ حَلاَوَةَ الإِيمَانِ: أَنْ يَكُونَ اللَّهُ وَرَسُولُهُ أَحَبَّ إِلَيْهِ مِمَّا سِوَاهُمَا', 'Tiga hal yang jika ada pada diri seseorang, ia akan merasakan manisnya iman: Allah dan Rasul-Nya lebih ia cintai dari segala sesuatu...', 'Bukhari, Muslim', '16, 43', NULL, NULL, 'HR. Bukhari no. 16 & Muslim no. 43', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(160, 'وَالَّذِي نَفْسِي بِيَدِهِ لاَ تَدْخُلُوا الْجَنَّةَ حَتَّى تُؤْمِنُوا وَلاَ تُؤْمِنُوا حَتَّى تَحَابُّوا', 'Demi Allah yang jiwaku di tangan-Nya, kalian tidak akan masuk surga hingga kalian beriman, dan kalian tidak akan beriman hingga kalian saling mencintai.', 'Muslim', '54', NULL, NULL, 'HR. Muslim no. 54', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(161, 'أَفْشُوا السَّلاَمَ بَيْنَكُمْ تَحَابُّوا', 'Sebarkanlah salam di antara kalian, niscaya kalian akan saling mencintai.', 'Muslim', '54', NULL, NULL, 'HR. Muslim no. 54', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(162, 'مَثَلُ الْمُؤْمِنِينَ فِي تَوَادِّهِمْ وَتَرَاحُمِهِمْ وَتَعَاطُفِهِمْ مَثَلُ الْجَسَدِ الْوَاحِدِ', 'Perumpamaan orang-orang beriman dalam saling mencintai, menyayangi, dan mengasihi, bagaikan satu tubuh.', 'Bukhari, Muslim', '6011, 2586', NULL, NULL, 'HR. Bukhari no. 6011 & Muslim no. 2586', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(163, 'أَحَبُّ النَّاسِ إِلَى اللَّهِ أَنْفَعُهُمْ لِلنَّاسِ', 'Manusia yang paling dicintai Allah adalah yang paling bermanfaat bagi manusia lainnya.', 'Thabrani', NULL, NULL, NULL, 'HR. Thabrani (Al-Mu\'jam al-Awsat) no. 6192, dishahihkan Albani', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(164, 'إِذَا أَحَبَّ اللَّهُ عَبْدًا ابْتَلاَهُ، فَإِنْ صَبَرَ اجْتَبَاهُ', 'Apabila Allah mencintai seorang hamba, maka Dia akan mengujinya. Jika ia bersabar, Allah akan memilihnya (meninggikan derajatnya).', 'Tirmidzi', '2398', NULL, NULL, 'HR. Tirmidzi no. 2398 (hasan)', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(165, 'مَنْ أَحَبَّ لِقَاءَ اللَّهِ أَحَبَّ اللَّهُ لِقَاءَهُ', 'Barangsiapa yang senang (cinta) bertemu dengan Allah, maka Allah pun senang (cinta) bertemu dengannya.', 'Bukhari, Muslim', '6507, 2685', NULL, NULL, 'HR. Bukhari no. 6507 & Muslim no. 2685', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(166, 'ثَلاَثٌ مَنْ كُنَّ فِيهِ وَجَدَ حَلاَوَةَ الإِيمَانِ: أَنْ يَكُونَ اللَّهُ وَرَسُولُهُ أَحَبَّ إِلَيْهِ مِمَّا سِوَاهُمَا، وَأَنْ يُحِبَّ الْمَرْءَ لاَ يُحِبُّهُ إِلاَّ لِلَّهِ', 'Tiga hal yang jika ada pada seseorang ia akan merasakan manisnya iman: Allah dan Rasul-Nya lebih ia cintai dari segalanya, dan ia mencintai seseorang hanya karena Allah...', 'Bukhari, Muslim', '16, 43', NULL, NULL, 'HR. Bukhari no. 16 & Muslim no. 43', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(167, 'لَوْ أَنَّ لِي مِثْلَ أُحُدٍ ذَهَبًا لَسَرَّنِي أَنْ لاَ تَمُرَّ عَلَيَّ ثَلاَثُ لَيَالٍ وَعِنْدِي مِنْهُ شَيْءٌ إِلاَّ شَيْءٌ أُرْصِدُهُ لِدَيْنٍ', 'Jika aku memiliki emas sebesar Gunung Uhud, sungguh aku gembira jika tidak ada satu malam pun berlalu melainkan sebagian darinya aku gunakan untuk melunasi utang.', 'Bukhari', '2389', NULL, NULL, 'HR. Bukhari no. 2389', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(168, 'لاَ تَحَاسَدُوا وَلاَ تَبَاغَضُوا وَلاَ تَدَابَرُوا وَكُونُوا عِبَادَ اللَّهِ إِخْوَانًا', 'Janganlah kalian saling hasud (dengki), saling membenci, dan saling membelakangi. Jadilah hamba-hamba Allah yang bersaudara (saling mencintai).', 'Bukhari, Muslim', '6065, 2564', NULL, NULL, 'HR. Bukhari no. 6065 & Muslim no. 2564', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(169, 'أَحَبُّ الأَعْمَالِ إِلَى اللَّهِ أَدْوَمُهَا وَإِنْ قَلَّ', 'Amalan yang paling dicintai Allah adalah yang dilakukan secara kontinu (istiqamah) meskipun sedikit.', 'Bukhari, Muslim', '6464, 783', NULL, NULL, 'HR. Bukhari no. 6464 & Muslim no. 783', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(170, 'إِنَّ اللَّهَ جَمِيلٌ يُحِبُّ الْجَمَالَ', 'Sesungguhnya Allah itu indah (Maha Indah) dan mencintai keindahan.', 'Muslim', '91', NULL, NULL, 'HR. Muslim no. 91', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(171, 'أَحِبَّ حَبِيبَكَ هَوْنًا مَا عَسَى أَنْ يَكُونَ بَغِيضَكَ يَوْمًا مَا', 'Cintailah kekasihmu sewajarnya saja, boleh jadi suatu hari dia akan menjadi musuhmu.', 'Tirmidzi', '1997', NULL, NULL, 'HR. Tirmidzi no. 1997 (hasan)', 'cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(172, 'أَنَا عِنْدَ ظَنِّ عَبْدِي بِي', 'Aku sesuai dengan persangkaan hamba-Ku kepada-Ku (Husnudzon/Harapan).', 'Bukhari, Muslim', '7405, 2675', NULL, NULL, 'HR. Bukhari no. 7405 & Muslim no. 2675', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(173, 'لاَ يَمُوتَنَّ أَحَدُكُمْ إِلاَّ وَهُوَ يُحْسِنُ الظَّنَّ بِاللَّهِ عَزَّ وَجَلَّ', 'Janganlah sekali-kali salah seorang di antara kalian meninggal dunia melainkan dalam keadaan berprasangka baik (penuh harapan) kepada Allah.', 'Muslim', '2877', NULL, NULL, 'HR. Muslim no. 2877', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(174, 'ادْعُوا اللَّهَ وَأَنْتُمْ مُوقِنُونَ بِالإِجَابَةِ', 'Berdoalah kepada Allah dalam keadaan kalian yakin (penuh harapan) akan dikabulkan.', 'Tirmidzi', '3479', NULL, NULL, 'HR. Tirmidzi no. 3479', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(175, 'إِنَّ اللَّهَ حَيِيٌّ كَرِيمٌ يَسْتَحْيِي إِذَا رَفَعَ الرَّجُلُ إِلَيْهِ يَدَيْهِ أَنْ يَرُدَّهُمَا صِفْرًا خَائِبَتَيْنِ', 'Sesungguhnya Allah Maha Pemalu lagi Mahamulia. Dia malu jika seorang hamba mengangkat kedua tangannya kepada-Nya, lalu Dia mengembalikannya dalam keadaan kosong.', 'Tirmidzi', '3556', NULL, NULL, 'HR. Tirmidzi no. 3556', 'kesepian', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(176, 'لَوْ أَنَّكُمْ تَتَوَكَّلُونَ عَلَى اللَّهِ حَقَّ تَوَكُّلِهِ لَرَزَقَكُمْ كَمَا يَرْزُقُ الطَّيْرَ', 'Seandainya kalian bertawakal kepada Allah dengan sungguh-sungguh tawakal, niscaya Allah akan memberi kalian rezeki sebagaimana Dia memberi rezeki kepada burung...', 'Tirmidzi', '2344', NULL, NULL, 'HR. Tirmidzi no. 2344', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(177, 'يَسِّرُوا وَلاَ تُعَسِّرُوا، وَبَشِّرُوا وَلاَ تُنَفِّرُوا', 'Permudahlah dan jangan kamu persulit, berilah kabar gembira (bangkitkan harapan) dan jangan buat mereka lari/putus asa.', 'Bukhari, Muslim', '69, 1734', NULL, NULL, 'HR. Bukhari no. 69 & Muslim no. 1734', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(178, 'احْرِصْ عَلَى مَا يَنْفَعُكَ وَاسْتَعِنْ بِاللَّهِ وَلاَ تَعْجِزْ', 'Semangatlah terhadap apa yang bermanfaat bagimu, mohonlah pertolongan kepada Allah, dan janganlah merasa lemah/patah semangat.', 'Muslim', '2664', NULL, NULL, 'HR. Muslim no. 2664', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(179, 'وَاعْلَمْ أَنَّ النَّصْرَ مَعَ الصَّبْرِ وَأَنَّ الْفَرَجَ مَعَ الْكَرْبِ وَأَنَّ مَعَ الْعُسْرِ يُسْرًا', 'Ketahuilah bahwa pertolongan itu bersama kesabaran, kelapangan itu bersama kesusahan, dan kemudahan itu bersama kesulitan.', 'Ahmad', '2803', NULL, NULL, 'HR. Ahmad no. 2803', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(180, 'لاَ طِيَرَةَ وَخَيْرُهَا الْفَأْلُ... الكَلِمَةُ الصَّالِحَةُ', 'Tidak ada anggapan sial (tiyarah), dan yang terbaik adalah al-fa\'l (prakiraan baik/optimisme), yaitu kata-kata yang baik.', 'Bukhari, Muslim', '5754, 2223', NULL, NULL, 'HR. Bukhari no. 5754 & Muslim no. 2223', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(181, 'مَا مِنْ مُسْلِمٍ يَدْعُو بِدَعْوَةٍ لَيْسَ فِيهَا إِثْمٌ وَلاَ قَطِيعَةُ رَحِمٍ إِلاَّ أَعْطَاهُ اللَّهُ بِهَا إِحْدَى ثَلاَثٍ', 'Tidak ada seorang muslim pun yang berdoa... melainkan Allah pasti memberinya salah satu dari tiga hal (dikabulkan langsung, disimpan di akhirat, atau dijauhkan dari keburukan).', 'Ahmad', '11133', NULL, NULL, 'HR. Ahmad no. 11133', 'kesepian', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(182, 'إِنَّ الرَّحْمَةَ غَلَبَتِ الْغَضَبَ', 'Sesungguhnya rahmat-Ku mendahului/mengalahkan murka-Ku.', 'Bukhari, Muslim', '7553, 2751', NULL, NULL, 'HR. Bukhari no. 7553 & Muslim no. 2751', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(183, 'لَلَّهُ أَرْحَمُ بِعِبَادِهِ مِنْ هَذِهِ بِوَلَدِهَا', 'Sungguh, Allah lebih menyayangi hamba-hamba-Nya daripada ibu ini menyayangi anaknya.', 'Bukhari, Muslim', '5999, 2754', NULL, NULL, 'HR. Bukhari no. 5999 & Muslim no. 2754', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(184, 'جَعَلَ اللَّهُ الرَّحْمَةَ مِائَةَ جُزْءٍ فَأَمْسَكَ عِنْدَهُ تِسْعَةً وَتِسْعِينَ جُزْءًا وَأَنْزَلَ فِي الأَرْضِ جُزْءًا وَاحِدًا', 'Allah menjadikan rahmat itu seratus bagian. Dia menahan 99 bagian di sisi-Nya dan menurunkan satu bagian ke bumi...', 'Bukhari, Muslim', '6000, 2752', NULL, NULL, 'HR. Bukhari no. 6000 & Muslim no. 2752', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(185, 'يَا ابْنَ آدَمَ إِنَّكَ مَا دَعَوْتَنِي وَرَجَوْتَنِي غَفَرْتُ لَكَ عَلَى مَا كَانَ مِنْكَ وَلاَ أُبَالِي', 'Wahai anak Adam, sesungguhnya selagi engkau berdoa kepada-Ku dan mengharapkan-Ku, Aku akan mengampunimu atas dosa apa pun yang ada padamu.', 'Tirmidzi', '3540', NULL, NULL, 'HR. Tirmidzi no. 3540', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(186, 'سَدِّدُوا وَقَارِبُوا وَأَبْشِرُوا', 'Berlakulah lurus, mendekatlah (kepada kebenaran), dan bergembiralah (peliharalah harapanmu).', 'Bukhari, Muslim', '6467, 2818', NULL, NULL, 'HR. Bukhari no. 6467 & Muslim no. 2818', 'semangat', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(187, 'اللَّهُمَّ اسْتُرْ عَوْرَاتِي وَآمِنْ رَوْعَاتِي', 'Ya Allah, tutupilah auratku (kekuranganku) dan amankanlah aku dari rasa takut/kecemasan.', 'Abu Dawud, Ibnu Majah', '5074', NULL, NULL, 'HR. Abu Dawud no. 5074 & Ibn Majah', NULL, 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(188, 'لاَ يَمُوتَنَّ أَحَدُكُمْ إِلاَّ وَهُوَ يُحْسِنُ الظَّنَّ بِاللَّهِ عَزَّ وَجَلَّ', 'Janganlah sekali-kali salah seorang di antara kalian meninggal dunia melainkan dalam keadaan berprasangka baik kepada Allah (menghilangkan takut yang berlebih).', 'Muslim', '2877', NULL, NULL, 'HR. Muslim no. 2877', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(189, 'رَجُلٌ ذَكَرَ اللَّهَ خَالِيًا فَفَاضَتْ عَيْنَاهُ', '...(Termasuk 7 golongan yang dinaungi Allah) yaitu seseorang yang mengingat Allah dalam keadaan sunyi lalu kedua matanya meneteskan air mata (karena takut).', 'Bukhari, Muslim', '660, 1031', NULL, NULL, 'HR. Bukhari no. 660 & Muslim no. 1031', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(190, 'عَيْنَانِ لاَ تَمَسُّهُمَا النَّارُ: عَيْنٌ بَكَتْ مِنْ خَشْيَةِ اللَّهِ...', 'Dua mata yang tidak akan tersentuh api neraka: mata yang menangis karena takut kepada Allah dan mata yang berjaga di jalan Allah.', 'Tirmidzi', '1639', NULL, NULL, 'HR. Tirmidzi no. 1639', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(191, 'لاَ يَلِجُ النَّارَ رَجُلٌ بَكَى مِنْ خَشْيَةِ اللَّهِ حَتَّى يَعُودَ اللَّبَنُ فِي الثَّدْيِ', 'Tidak akan masuk neraka seseorang yang menangis karena takut kepada Allah hingga air susu kembali ke dalam teteknya...', 'Tirmidzi, An-Nasa\'i', '1633', NULL, NULL, 'HR. Tirmidzi no. 1633 & An-Nasa\'i', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(192, 'لَوْ تَعْلَمُونَ مَا أَعْلَمُ لَضَحِكْتُمْ قَلِيلاً وَلَبَكَيْتُمْ كَثِيرًا', 'Seandainya kalian mengetahui apa yang aku ketahui, niscaya kalian akan sedikit tertawa dan banyak menangis (karena takut kepada Allah).', 'Bukhari, Muslim', '6485, 2359', NULL, NULL, 'HR. Bukhari no. 6485 & Muslim no. 2359', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(193, 'نُصِرْتُ بِالرُّعْبِ مَسِيرَةَ شَهْرٍ', 'Aku ditolong oleh Allah dengan ditanamkannya rasa takut (ke dalam hati musuh) dari jarak perjalanan satu bulan.', 'Bukhari, Muslim', '335, 521', NULL, NULL, 'HR. Bukhari no. 335 & Muslim no. 521', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(194, 'وَعِزَّتِي لاَ أَجْمَعُ عَلَى عَبْدِي خَوْفَيْنِ وَلاَ أَجْمَعُ لَهُ أَمْنَيْنِ', '(Allah berfirman): Demi kemuliaan-Ku, Aku tidak akan menggabungkan dua rasa takut dan dua rasa aman pada hamba-Ku. Jika ia takut kepada-Ku di dunia, Aku amankan dia di akhirat...', 'Ibn Hibban, Al-Bazzar', NULL, NULL, NULL, 'HR. Ibn Hibban & Al-Bazzar', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(195, 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْجُبْنِ', 'Ya Allah, aku berlindung kepada-Mu dari sifat penakut.', 'Bukhari', '2822', NULL, NULL, 'HR. Bukhari no. 2822', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(196, 'اللَّهُمَّ اقْسِمْ لَنَا مِنْ خَشْيَتِكَ مَا تَحُولُ بِهِ بَيْنَنَا وَبَيْنَ مَعَاصِيكَ', 'Ya Allah, bagikanlah untuk kami rasa takut kepada-Mu yang dapat menghalangi kami dari berbuat maksiat kepada-Mu...', 'Tirmidzi', '3502', NULL, NULL, 'HR. Tirmidzi no. 3502', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(197, 'مَنْ خَافَ أَدْلَجَ وَمَنْ أَدْلَجَ بَلَغَ الْمَنْزِلَ أَلَا إِنَّ سِلْعَةَ اللَّهِ غَالِيَةٌ أَلَا إِنَّ سِلْعَةَ اللَّهِ الْجَنَّةُ', 'Barangsiapa yang takut (terlambat), ia akan berjalan di awal malam. Dan barangsiapa berjalan awal malam, ia akan sampai ke tujuan. Ingatlah, barang dagangan Allah itu mahal, ingatlah bahwa barang dagangan Allah adalah surga.', 'Tirmidzi', '2450', NULL, NULL, 'HR. Tirmidzi no. 2450', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(198, 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ غَضَبِهِ وَعِقَابِهِ وَشَرِّ عِبَادِهِ وَمِنْ هَمَزَاتِ الشَّيَاطِينِ', 'Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari murka-Nya, siksa-Nya, kejahatan hamba-hamba-Nya, dan bisikan setan.', 'Tirmidzi, Abu Dawud', '3528', NULL, NULL, 'HR. Tirmidzi no. 3528 & Abu Dawud', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(199, 'إِنِّي أَرَى مَا لاَ تَرَوْنَ وَأَسْمَعُ مَا لاَ تَسْمَعُونَ أَطَّتِ السَّمَاءُ... وَاللَّهِ لَوْ تَعْلَمُونَ مَا أَعْلَمُ...', 'Aku melihat apa yang tidak kalian lihat dan mendengar apa yang tidak kalian dengar. Langit merintih... Demi Allah, seandainya kalian tahu apa yang aku tahu...', 'Tirmidzi', '2312', NULL, NULL, 'HR. Tirmidzi no. 2312', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(200, 'إِذَا خَافَ الْقَوْمَ قَالَ: اللَّهُمَّ إِنَّا نَجْعَلُكَ فِي نُحُورِهِمْ وَنَعُوذُ بِكَ مِنْ شُرُورِهِمْ', 'Nabi SAW apabila takut kepada suatu kaum/kelompok, beliau berdoa: \'Ya Allah, sesungguhnya kami menjadikan Engkau di leher-leher mereka dan kami berlindung kepada-Mu dari kejahatan mereka.\'', 'Abu Dawud', '1537', NULL, NULL, 'HR. Abu Dawud no. 1537', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(201, 'الْمُؤْمِنُ بَيْنَ مَخَافَتَيْنِ: بَيْنَ أَجَلٍ قَدْ مَضَى لاَ يَدْرِي مَا اللَّهُ صَانِعٌ فِيهِ وَبَيْنَ أَجَلٍ قَدْ بَقِيَ...', 'Seorang mukmin itu berada di antara dua rasa takut: antara ajal yang telah lalu yang ia tidak tahu apa yang Allah lakukan padanya, dan antara ajal yang tersisa...', 'Baihaqi', NULL, NULL, NULL, 'HR. Baihaqi (Shu\'ab al-Iman)', 'takut', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(202, 'دَعْ مَا يَرِيبُكَ إِلَى مَا لاَ يَرِيبُكَ', 'Tinggalkanlah apa yang meragukanmu (membuatmu bingung) menuju apa yang tidak meragukanmu.', 'Tirmidzi, An-Nasa\'i', '2518', NULL, NULL, 'HR. Tirmidzi no. 2518 & An-Nasa\'i', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(203, 'اسْتَفْتِ قَلْبَكَ، الْبِرُّ مَا اطْمَأَنَّتْ إِلَيْهِ النَّفْسُ وَاطْمَأَنَّ إِلَيْهِ الْقَلْبُ، وَالإِثْمُ مَا حَاكَ فِي النَّفْسِ وَتَرَدَّدَ فِي الصَّدْرِ', 'Mintalah fatwa pada hatimu. Kebaikan itu adalah apa yang membuat jiwa dan hati merasa tenang kepadanya, sedangkan dosa adalah apa yang meragukan/mengganjal dalam jiwa dan berbolak-balik dalam dada...', 'Ahmad', '17742', NULL, NULL, 'HR. Ahmad no. 17742', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(204, 'إِنَّ الحَلاَلَ بَيِّنٌ وَإِنَّ الحَرَامَ بَيِّنٌ وَبَيْنَهُمَا أُمُورٌ مُشْتَبِهَاتٌ لاَ يَعْلَمُهُنَّ كَثِيرٌ مِنَ النَّاسِ', 'Sesungguhnya yang halal itu jelas dan yang haram itu jelas, dan di antara keduanya ada perkara-perkara samar (subhat/membingungkan) yang tidak diketahui oleh kebanyakan manusia...', 'Bukhari, Muslim', '52, 1599', NULL, NULL, 'HR. Bukhari no. 52 & Muslim no. 1599', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(205, 'كَانَ رَسُولُ اللَّهِ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ يُعَلِّمُنَا الاِسْتِخَارَةَ فِي الأُمُورِ كُلِّهَا', 'Rasulullah SAW mengajari kami salat Istikharah (memohon petunjuk saat bingung memilih) dalam segala urusan.', 'Bukhari', '1162', NULL, NULL, 'HR. Bukhari no. 1162', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(206, 'اللَّهُمَّ إِنِّي أَسْتَخِيرُكَ بِعِلْمِكَ وَأَسْتَقْدِرُكَ بِقُدْرَتِكَ وَأَسْأَلُكَ مِنْ فَضْلِكَ الْعَظِيمِ', 'Ya Allah, sesungguhnya aku memohon pilihan yang baik dengan ilmu-Mu, memohon takdir yang baik dengan kuasa-Mu... (Doa Istikharah).', 'Bukhari', '1162', NULL, NULL, 'HR. Bukhari no. 1162', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(207, 'يَا مُقَلِّبَ الْقُلُوبِ ثَبِّتْ قَلْبِي عَلَى دِينِكَ', 'Wahai Dzat yang membolak-balikkan hati, teguhkanlah hatiku di atas agama-Mu.', 'Tirmidzi', '2140', NULL, NULL, 'HR. Tirmidzi no. 2140', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(208, 'اللَّهُمَّ اهْدِنِي وَسَدِّدْنِي', 'Ya Allah, berilah aku petunjuk dan luruskanlah jalanku.', 'Muslim', '2725', NULL, NULL, 'HR. Muslim no. 2725', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(209, 'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْهُدَى وَالتُّقَى وَالْعَفَافَ وَالْغِنَى', 'Ya Allah, aku memohon kepada-Mu petunjuk (hidayah), ketakwaan, kesucian diri, dan kecukupan.', 'Muslim', '2721', NULL, NULL, 'HR. Muslim no. 2721', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(210, 'اللَّهُمَّ أَرِنَا الْحَقَّ حَقًّا وَارْزُقْنَا اتِّبَاعَهُ وَأَرِنَا الْبَاطِلَ بَاطِلًا وَارْزُقْنَا اجْتِنَابَهُ', 'Ya Allah, perlihatkanlah kepada kami kebenaran sebagai kebenaran dan berilah kami kemampuan untuk mengikutinya, serta perlihatkanlah kebatilan sebagai kebatilan dan berilah kami kemampuan untuk menjauhinya.', 'Ulama', NULL, NULL, NULL, 'HR. Al-Ghazali (Ihya Ulumuddin) & populer di kalangan ulama', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(211, 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ', 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku.', 'Abu Dawud', '5090', NULL, NULL, 'HR. Abu Dawud no. 5090', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(212, 'تَرَكْتُ فِيكُمْ أَمْرَيْنِ لَنْ تَضِلُّوا مَا تَمَسَّكْتُمْ بِهِمَا: كِتَابَ اللَّهِ وَسُنَّةَ نَبِيِّهِ', 'Aku tinggalkan untuk kalian dua perkara yang kalian tidak akan sesat/bingung selama-lamanya jika berpegang teguh pada keduanya: Kitab Allah dan Sunnah Nabi-Nya.', 'Malik', '1661', NULL, NULL, 'HR. Malik (Muwatta no. 1661)', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(213, 'إِنَّ اللَّهَ لاَ يَقْبِضُ الْعِلْمَ انْتِزَاعًا... وَلَكِنْ يَقْبِضُ الْعِلْمَ بِقَبْضِ الْعُلَمَاءِ حَتَّى إِذَا لَمْ يُبْقِ عَالِمًا اتَّخَذَ النَّاسُ رُؤُوسًا جُهَّالاً فَسُئِلُوا فَأَفْتَوْا بِغَيْرِ عِلْمٍ فَضَلُّوا وَأَضَلُّوا', '...sehingga apabila tidak tersisa orang alim, manusia mengangkat pemimpin yang bodoh. Lalu mereka ditanya dan memberi fatwa tanpa ilmu, sehingga mereka sesat dan menyesatkan.', 'Bukhari, Muslim', '100', NULL, NULL, 'HR. Bukhari no. 100 & Muslim', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(214, 'مَنْ يُرِدِ اللَّهُ بِهِ خَيْرًا يُفَقِّهْهُ فِي الدِّينِ', 'Barangsiapa yang dikehendaki kebaikan oleh Allah, maka Dia akan memahamkannya dalam urusan agama.', 'Bukhari, Muslim', '71', NULL, NULL, 'HR. Bukhari no. 71 & Muslim', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(215, 'سِيَاهُ الشَّيْطَانِ يَأْتِي أَحَدَكُمْ فَيَقُولُ مَنْ خَلَقَ كَذَا مَنْ خَلَقَ كَذَا حَتَّى يَقُولَ مَنْ خَلَقَ رَبَّكَ فَإِذَا بَلَغَهُ فَلْيَسْتَعِذْ بِاللَّهِ وَلْيَنْتَهِ', 'Setan mendatangi salah seorang dari kalian lalu bertanya: \'Siapa yang menciptakan ini? Siapa yang menciptakan itu?\' Hingga bertanya: \'Siapa yang menciptakan Tuhanmu?\' Jika sampai demikian, hendaklah ia memohon perlindungan kepada Allah dan menyudahinya.', 'Bukhari, Muslim', '3276', NULL, NULL, 'HR. Bukhari no. 3276 & Muslim', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(216, 'إِنَّ اللَّهَ كَتَبَ الإِحْسَانَ عَلَى كُلِّ شَيْءٍ', 'Sesungguhnya Allah mewajibkan berbuat baik (termasuk bersikap bijak dan tidak membuat bingung) dalam segala hal...', 'Muslim', '1955', NULL, NULL, 'HR. Muslim no. 1955', 'bingung', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(217, 'الإِثْمُ مَا حَاكَ فِي صَدْرِكَ وَكَرِهْتَ أَنْ يَطَّلِعَ عَلَيْهِ النَّاسُ', 'Dosa adalah apa yang meragukan/mengganjal (menimbulkan rasa bersalah) di dalam dadamu dan engkau benci jika hal itu diketahui oleh orang lain.', 'Muslim', '2553', NULL, NULL, 'HR. Muslim no. 2553', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(218, 'النَّدَمُ تَوْبَةٌ', 'Penyesalan (rasa bersalah atas dosa) adalah hakikat dari tobat.', 'Ibn Majah, Ahmad', '4252', NULL, NULL, 'HR. Ibn Majah no. 4252 & Ahmad', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(219, 'التَّائِبُ مِنَ الذَّنْبِ كَمَنْ لاَ ذَنْبَ لَهُ', 'Orang yang bertobat dari dosanya adalah seperti orang yang tidak memiliki dosa sama sekali.', 'Ibn Majah', '4250', NULL, NULL, 'HR. Ibn Majah no. 4250', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(220, 'كُلُّ ابْنِ آدَمَ خَطَّاءٌ وَخَيْرُ الْخَطَّائِينَ التَّوَّابُونَ', 'Setiap anak Adam pasti sering berbuat salah/dosa, dan sebaik-baik orang yang berbuat salah adalah mereka yang bertobat.', 'Tirmidzi, Ibn Majah', '2499', NULL, NULL, 'HR. Tirmidzi no. 2499 & Ibn Majah', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(221, 'يَا ابْنَ آدَمَ إِنَّكَ مَا دَعَوْتَنِي وَرَجَوْتَنِي غَفَرْتُ لَكَ عَلَى مَا كَانَ مِنْكَ وَلاَ أُبَالِي', 'Wahai anak Adam, sesungguhnya selagi engkau berdoa kepada-Ku dan mengharapkan-Ku, Aku akan mengampunimu atas dosa apa pun yang ada padamu dan Aku tidak peduli.', 'Tirmidzi', '3540', NULL, NULL, 'HR. Tirmidzi no. 3540', 'harapan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(222, 'يَا ابْنَ آدَمَ لَوْ بَلَغَتْ ذُنُوبُكَ عَنَانَ السَّمَاءِ ثُمَّ اسْتَغْفَرْتَنِي غَفَرْتُ لَكَ', 'Wahai anak Adam, seandainya dosa-dosamu menumpuk setinggi langit kemudian engkau memohon ampunan kepada-Ku, niscaya Aku ampuni engkau.', 'Tirmidzi', '3540', NULL, NULL, 'HR. Tirmidzi no. 3540', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(223, 'لَلَّهُ أَشَدُّ فَرَحًا بِتَوْبَةِ عَبْدِهِ حِينَ يَتُوبُ إِلَيْهِ مِنْ أَحَدِكُمْ كَانَ عَلَى رَاحِلَتِهِ بِأَرْضٍ فَلاَةٍ فَأَضَلَّتْهُ...', 'Sungguh, Allah lebih gembira dengan tobat hamba-Nya daripada kegembiraan seseorang yang kehilangan untanya di padang pasir lalu menemukannya kembali...', 'Bukhari, Muslim', '6309, 2747', NULL, NULL, 'HR. Bukhari no. 6309 & Muslim no. 2747', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(224, 'إِنَّ اللَّهَ يَبْسُطُ يَدَهُ بِاللَّيْلِ لِيَتُوبَ مُسِيءُ النَّهَارِ وَيَبْسُطُ يَدَهُ بِالنَّهَارِ لِيَتُوبَ مُسِيءُ اللَّيْلِ', 'Sesungguhnya Allah membentangkan tangan-Nya pada malam hari untuk menerima tobat orang yang berbuat dosa di siang hari, dan membentangkan tangan-Nya pada siang hari untuk menerima tobat orang yang berbuat dosa di malam hari...', 'Muslim', '2759', NULL, NULL, 'HR. Muslim no. 2759', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(225, 'سَيِّدُ الاِسْتِغْفَارِ: اللَّهُمَّ أَنْتَ رَبِّي لاَ إِلَهَ إِلاَّ أَنْتَ خَلَقْتَنِي وَأَنَا عَبْدُكَ... أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ وَأَبُوءُ بِذَنْبِي فَاغْفِرْ لِي', 'Pimpinan istighfar: \'Ya Allah, Engkau adalah Tuhanku... Aku mengakui nikmat-Mu kepadaku dan aku mengakui dosaku (rasa bersalahku), maka ampunilah aku...\'', 'Bukhari', '6306', NULL, NULL, 'HR. Bukhari no. 6306', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(226, 'مَا مِنْ عَبْدٍ يُذْنِبُ ذَنْبًا فَيُحْسِنُ الطُّهُورَ ثُمَّ يَقُومُ فَيُصَلِّي رَكْعَتَيْنِ ثُمَّ يَسْتَغْفِرُ اللَّهَ إِلاَّ غَفَرَ اللَّهُ لَهُ', 'Tidak ada seorang hamba pun yang berbuat dosa, lalu ia berwudu dengan baik kemudian bangkit shalat dua rakaat lalu memohon ampunan kepada Allah, melainkan Allah pasti mengampuninya.', 'Abu Dawud, Tirmidzi', '1521', NULL, NULL, 'HR. Abu Dawud no. 1521 & Tirmidzi', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(227, 'وَأَتْبِعِ السَّيِّئَةَ الْحَسَنَةَ تَمْحُهَا، وَخَالِقِ النَّاسَ بِخُلُقٍ حَسَنٍ', '...Dan iringilah perbuatan buruk (yang menimbulkan rasa bersalah) dengan perbuatan baik, niscaya kebaikan itu akan menghapusnya, serta berakhlaklah kepada manusia dengan akhlak yang baik.', 'Tirmidzi', '1987', NULL, NULL, 'HR. Tirmidzi no. 1987', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(228, 'لَوْ لَمْ تُذْنِبُوا لَذَهَبَ اللَّهُ بِكُمْ وَلَجَاءَ بِقَوْمٍ يُذْنِبُونَ فَيَسْتَغْفِرُونَ اللَّهَ فَيَغْفِرُ لَهُمْ', 'Seandainya kalian tidak pernah berbuat dosa, niscaya Allah akan memusnahkan kalian dan menggantikan dengan kaum yang berbuat dosa lalu mereka memohon ampunan kepada Allah, dan Allah pun mengampuni mereka.', 'Muslim', '2749', NULL, NULL, 'HR. Muslim no. 2749', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(229, 'إِنَّ الْمُؤْمِنَ يَرَى ذُنُوبَهُ كَأَنَّهُ قَاعِدٌ تَحْتَ جَبَلٍ يَخَافُ أَنْ يَقَعَ عَلَيْهِ', 'Sesungguhnya seorang mukmin melihat dosa-dosanya (merasakan beban bersalah) seolah-olah ia duduk di bawah gunung yang ia takuti akan menimpanya...', 'Bukhari', '6308', NULL, NULL, 'HR. Bukhari no. 6308', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(230, 'إِنَّ عَبْدًا أَذْنَبَ ذَنْبًا فَقَالَ رَبِّ أَذْنَبْتُ فَاغْفِرْ لِي... قَالَ اللَّهُ: عَلِمَ عَبْدِي أَنَّ لَهُ رَبًّا يَغْفِرُ الذَّنْبَ... قَدْ غَفَرْتُ لِعَبْدِي', 'Seorang hamba berbuat dosa lalu berdoa: \'Ya Tuhan, aku telah berbuat dosa, ampunilah aku.\' Allah berfirman: \'Hamba-Ku tahu bahwa ia memiliki Tuhan yang mengampuni dosa... Sungguh Aku telah mengampuni hamba-Ku.\'', 'Bukhari, Muslim', '7507', NULL, NULL, 'HR. Bukhari no. 7507 & Muslim', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(231, 'مَنْ لَزِمَ الاِسْتِغْفَارَ جَعَلَ اللَّهُ لَهُ مِنْ كُلِّ ضِيقٍ مَخْرَجًا وَمِنْ كُلِّ هَمٍّ فَرَجًا', 'Barangsiapa melazimkan (merutinkan) istighfar, niscaya Allah jadikan baginya jalan keluar dari setiap kesempitan dan kelapangan dari setiap duka cita/rasa bersalah.', 'Abu Dawud', '1518', NULL, NULL, 'HR. Abu Dawud no. 1518', 'bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(232, 'الإِيمَانُ بِضْعٌ وَسَبْعُونَ أَوْ بِضْعٌ وَسِتُّونَ شُعْبَةً، فَأَفْضَلُهَا قَوْلُ لاَ إِلَهَ إِلاَّ اللَّهُ، وَأَدْنَاهَا إِمَاطَةُ الأَذَى عَنِ الطَّرِيقِ، وَالْحَيَاءُ شُعْبَةٌ مِنَ الإِيمَانِ', 'Iman itu ada 70 atau 60 sekian cabang. Yang paling utama adalah ucapan \'Laa ilaaha illallah\' dan yang paling rendah adalah menyingkirkan gangguan dari jalan. Dan malu adalah salah satu cabang dari iman.', 'Bukhari, Muslim', '9, 35', NULL, NULL, 'HR. Bukhari no. 9 & Muslim no. 35', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(233, 'الْحَيَاءُ لاَ يَأْتِي إِلاَّ بِخَيْرٍ', 'Malu itu tidak mendatangkan sesuatu melainkan kebaikan.', 'Bukhari, Muslim', '6117, 37', NULL, NULL, 'HR. Bukhari no. 6117 & Muslim no. 37', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(234, 'الْحَيَاءُ كُلُّهُ خَيْرٌ', 'Malu itu seluruhnya adalah kebaikan.', 'Muslim', '37', NULL, NULL, 'HR. Muslim no. 37', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(235, 'إِنَّ مِمَّا أَدْرَكَ النَّاسُ مِنْ كَلاَمِ النُّبُوَّةِ الأُولَى: إِذَا لَمْ تَسْتَحْيِ فَاصْنَعْ مَا شِئْتَ', 'Sesungguhnya di antara ajaran yang didapatkan manusia dari perkataan nabi-nabi terdahulu adalah: \'Jika engkau tidak malu, maka berbuatlah sesukamu.\'', 'Bukhari', '3483', NULL, NULL, 'HR. Bukhari no. 3483', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(236, 'الْحَيَاءُ مِنَ الإِيمَانِ، وَالإِيمَانُ فِي الْجَنَّةِ، وَالْبَذَاءُ مِنَ الْجَفَاءِ، وَالْجَفَاءُ فِي النَّارِ', 'Malu itu bagian dari iman, dan iman itu tempatnya di surga. Sedangkan perkataan/perbuatan kotor (kebalikan malu) adalah bagian dari tabiat yang kasar, dan tabiat kasar tempatnya di neraka.', 'Tirmidzi, Ahmad', '2009', NULL, NULL, 'HR. Tirmidzi no. 2009 & Ahmad', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(237, 'إِنَّ اللَّهَ حَيِيٌّ سِتِّيرٌ يُحِبُّ الْحَيَاءَ وَالسَّتْرَ، فَإِذَا اغْتَسَلَ أَحَدُكُمْ فَلْيَسْتَتِرْ', 'Sesungguhnya Allah Maha Pemalu lagi Maha Menutup (aib/aurat). Dia menyukai rasa malu dan tutupan. Maka apabila salah seorang dari kalian mandi, hendaklah ia menutup diri.', 'Abu Dawud, An-Nasa\'i', '4012', NULL, NULL, 'HR. Abu Dawud no. 4012 & An-Nasa\'i', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(238, 'إِنَّ لِكُلِّ دِينٍ خُلُقًا، وَخُلُقُ الإِسْلاَمِ الْحَيَاءُ', 'Sesungguhnya setiap agama memiliki akhlak (ciri khas), dan akhlak Islam adalah rasa malu.', 'Ibn Majah, Malik', '4181', NULL, NULL, 'HR. Ibn Majah no. 4181 & Malik', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(239, 'اسْتَحْيُوا مِنَ اللَّهِ حَقَّ الحَيَاءِ... مَنْ اسْتَحْيَا مِنَ اللَّهِ حَقَّ الحَيَاءِ فَلْيَحْفَظِ الرَّأْسَ وَمَا وَعَى، وَالْبَطْنَ وَمَا حَوَى', 'Malulah kepada Allah dengan sebenar-benar malu. Siapa yang malu kepada Allah dengan sebenar-benarnya, hendaklah ia menjaga kepala dan apa yang dipikirkannya, serta menjaga perut dan apa yang dimasukkannya...', 'Tirmidzi', '2458', NULL, NULL, 'HR. Tirmidzi no. 2458', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(240, 'كَانَ النَّبِيُّ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ أَشَدَّ حَيَاءً مِنَ الْعَذْرَاءِ فِي خِدْرِهَا', 'Nabi SAW adalah orang yang jauh lebih pemalu daripada gadis perawan di dalam pingitannya.', 'Bukhari, Muslim', '6102, 2320', NULL, NULL, 'HR. Bukhari no. 6102 & Muslim no. 2320', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(241, 'أَلاَ أَسْتَحْيِي مِنْ رَجُلٍ تَسْتَحْيِي مِنْهُ الْمَلاَئِكَةُ', '(Mengenai Utsman bin Affan) Rasulullah SAW bersabda: \'Apakah aku tidak malu kepada seorang laki-laki yang para malaikat saja malu kepadanya?\'', 'Muslim', '2401', NULL, NULL, 'HR. Muslim no. 2401', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(242, 'الْحَيَاءُ وَالإِيمَانُ قُرَنَاءُ جَمِيعًا، فَإِذَا رُفِعَ أَحَدُهُمَا رُفِعَ الآخَرُ', 'Malu dan iman itu adalah dua hal yang selalu bergandengan bersama. Jika salah satunya diangkat/hilang, maka hilang pula yang lainnya.', 'Al-Hakim', NULL, NULL, NULL, 'HR. Al-Hakim (Al-Mustadrak) & Al-Albani', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(243, 'مَا كَانَ الْفُحْشُ فِي شَيْءٍ إِلاَّ شَانَهُ، وَمَا كَانَ الْحَيَاءُ فِي شَيْءٍ إِلاَّ زَانَهُ', 'Tidaklah kekejian/kekasaran berada pada sesuatu melainkan akan memperburuknya, dan tidaklah rasa malu berada pada sesuatu melainkan akan menghiasinya.', 'Tirmidzi, Ibn Majah', '1974', NULL, NULL, 'HR. Tirmidzi no. 1974 & Ibn Majah', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(244, 'دَعْهُ فَإِنَّ الْحَيَاءَ مِنَ الإِيمَانِ', 'Nabi SAW melewati seorang Anshar yang sedang menasihati (menegur) saudaranya karena sifat pemalunya. Maka Rasulullah SAW bersabda: \'Biarkanlah dia, karena sesungguhnya malu itu bagian dari iman.\'', 'Bukhari, Muslim', '24, 36', NULL, NULL, 'HR. Bukhari no. 24 & Muslim no. 36', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(245, 'احْفَظْ عَوْرَتَكَ إِلاَّ مِنْ زَوْجَتِكَ أَوْ مَا مَلَكَتْ يَمِينُكَ', 'Jagalah auratmu kecuali terhadap istrimu atau hamba sahaya yang engkau miliki.', 'Abu Dawud, Tirmidzi', '4017', NULL, NULL, 'HR. Abu Dawud no. 4017 & Tirmidzi', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(246, 'فَاللَّهُ أَحَقُّ أَنْ يُسْتَحْيَا مِنْهُ مِنَ النَّاسِ', '...Maka Allah lebih berhak untuk engkau merasa malu kepada-Nya daripada kepada manusia.', 'Abu Dawud, Tirmidzi', '4017', NULL, NULL, 'HR. Abu Dawud no. 4017 & Tirmidzi', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(247, 'قَدْ أَفْلَحَ مَنْ أَسْلَمَ وَرُزِقَ كَفَافًا وَقَنَّعَهُ اللَّهُ بِمَا آتَاهُ', 'Sungguh beruntung orang yang berserah diri (masuk Islam), diberi rezeki yang cukup, dan dijadikan merasa cukup (serta malu meminta-minta) oleh Allah atas apa yang diberikan kepadanya.', 'Muslim', '1054', NULL, NULL, 'HR. Muslim no. 1054', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(248, 'وَمَنْ يَسْتَعْفِفْ يُعِفَّهُ اللَّهُ، وَمَنْ يَسْتَغْنِ يُغْنِهِ اللَّهُ', 'Barangsiapa yang berusaha menjaga kesucian dirinya (karena malu meminta-minta), maka Allah akan menjaganya. Dan barangsiapa yang merasa cukup, maka Allah akan mencukupkannya.', 'Bukhari, Muslim', '1427', NULL, NULL, 'HR. Bukhari no. 1427 & Muslim', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(249, 'مَا يَزَالُ الرَّجُلُ يَسْأَلُ النَّاسَ حَتَّى يَأْتِيَ يَوْمَ الْقِيَامَةِ لَيْسَ فِي وَجْهِهِ مُزْعَةُ لَحْمٍ', 'Seseorang yang terus-menerus meminta-minta kepada manusia (tanpa rasa malu), ia akan datang pada hari kiamat dalam keadaan tidak ada sepotong daging pun di wajahnya.', 'Bukhari, Muslim', '1474', NULL, NULL, 'HR. Bukhari no. 1474 & Muslim', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(250, 'لَيْسَ الْمِسْكِينُ الَّذِي يَطُوفُ عَلَى النَّاسِ تَرُدُّهُ اللُّقْمَةُ وَاللُّقْمَتَانِ... وَلَكِنَّ الْمِسْكِينَ الَّذِي لاَ يَجِدُ غِنًى... وَلاَ يَسْأَلُ النَّاسَ شَيْئًا', 'Bukanlah orang miskin (sejati) itu orang yang berkeliling meminta-minta... Tetapi orang miskin sejati adalah orang yang tidak memiliki kecukupan, namun ia malu dan tidak meminta-minta kepada manusia.', 'Bukhari, Muslim', '1479', NULL, NULL, 'HR. Bukhari no. 1479 & Muslim', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(251, 'كُلُّ أُمَّتِي مُعَافًى إِلاَّ الْمُجَاهِرِينَ', 'Setiap umatku akan diampuni dosanya kecuali al-mujahirun (orang yang terang-terangan berbuat dosa tanpa rasa malu)...', 'Bukhari, Muslim', '6069, 2990', NULL, NULL, 'HR. Bukhari no. 6069 & Muslim no. 2990', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(252, 'إِنَّ اللَّهَ حَيِيٌّ كَرِيمٌ يَسْتَحْيِي إِذَا رَفَعَ الرَّجُلُ إِلَيْهِ يَدَيْهِ أَنْ يَرُدَّهُمَا صِفْرًا خَائِبَتَيْنِ', 'Sesungguhnya Allah Maha Pemalu lagi Mahamulia. Dia malu jika seorang hamba mengangkat kedua tangannya kepada-Nya, lalu Dia mengembalikannya dalam keadaan kosong/kecewa.', 'Tirmidzi, Abu Dawud', '3556', NULL, NULL, 'HR. Tirmidzi no. 3556 & Abu Dawud', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(253, 'أَرْبَعٌ مِنْ سُنَنِ الْمُرْسَلِينَ: الْحَيَاءُ، وَالتَّعَطُّرُ، وَالسِّوَاكُ، وَالنِّكَاحُ', 'Empat hal yang termasuk sunnah para Rasul: memiliki rasa malu, memakai minyak wangi, bersiwak, dan menikah.', 'Tirmidzi', '1080', NULL, NULL, 'HR. Tirmidzi no. 1080', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(254, 'إِيَّاكُمْ وَالْعُرْيَ، فَإِنَّ مَعَكُمْ مَنْ لاَ يُفَارِقُكُمْ إِلاَّ عِنْدَ الْغَائِطِ وَحِينَ يُفْضِي الرَّجُلُ إِلَى أَهْلِهِ، فَاسْتَحْيُوهُمْ وَأَكْرِمُوهُمْ', 'Jauhilah oleh kalian bertelanjang (tanpa busana), karena bersama kalian ada (malaikat) yang tidak pernah berpisah dengan kalian kecuali saat buang air dan ketika bersetubuh. Maka malulah kepada mereka dan hormatilah mereka.', 'Tirmidzi', '2800', NULL, NULL, 'HR. Tirmidzi no. 2800', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(255, 'لاَ يَنْظُرُ الرَّجُلُ إِلَى عَوْرَةِ الرَّجُلِ وَلاَ الْمَرْأَةُ إِلَى عَوْرَةِ الْمَرْأَةِ', 'Janganlah seorang laki-laki melihat aurat laki-laki lain, dan jangan pula seorang wanita melihat aurat wanita lain.', 'Muslim', '338', NULL, NULL, 'HR. Muslim no. 338', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04');
INSERT INTO `hadiths` (`id`, `arabic_text`, `translation`, `book`, `number`, `narrator`, `grade`, `source`, `tags`, `status`, `reviewer_id`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(256, 'الْبِرُّ حُسْنُ الْخُلُقِ، وَالإِثْمُ مَا حَاكَ فِي صَدْرِكَ وَكَرِهْتَ أَنْ يَطَّلِعَ عَلَيْهِ النَّاسُ', 'Kebaikan itu adalah akhlak yang baik, sedangkan dosa adalah apa yang meragukan/mengganjal dalam dadamu dan engkau benci (malu) jika hal itu diketahui oleh manusia.', 'Muslim', '2553', NULL, NULL, 'HR. Muslim no. 2553', 'malu', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(257, 'إِيَّاكُمْ وَالْحَسَدَ، فَإِنَّ الْحَسَدَ يَأْكُلُ الْحَسَنَاتِ كَمَا تَأْكُلُ النَّارُ الْحَطَبَ', 'Jauhilah oleh kalian sifat hasad (dengki), karena sesungguhnya hasad itu memakan kebaikan-kebaikan sebagaimana api memakan kayu bakar.', 'Abu Dawud', '4903', NULL, NULL, 'HR. Abu Dawud no. 4903', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(258, 'لاَ تَبَاغَضُوا، وَلاَ تَحَاسَدُوا، وَلاَ تَدَابَرُوا، وَكُونُوا عِبَادَ اللَّهِ إِخْوَانًا', 'Janganlah kalian saling membenci, janganlah saling dengki, dan janganlah saling membelakangi. Jadilah kalian hamba-hamba Allah yang bersaudara.', 'Bukhari, Muslim', '6065, 2559', NULL, NULL, 'HR. Bukhari no. 6065 & Muslim no. 2559', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(259, 'لاَ تَحَاسَدُوا، وَلاَ تَنَاجَشُوا، وَلاَ تَبَاغَضُوا، وَلاَ تَدَابَرُوا', 'Janganlah kalian saling dengki, jangan saling menaikkan penawaran (untuk menipu), jangan saling membenci, dan jangan saling membelakangi...', 'Muslim', '2564', NULL, NULL, 'HR. Muslim no. 2564', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(260, 'لاَ حَسَدَ إِلاَّ فِي اثْنَتَيْنِ: رَجُلٌ آتَاهُ اللَّهُ المَالَ فَسُلِّطَ عَلَى هَلَكَتِهِ فِي الحَقِّ، وَرَجُلٌ آتَاهُ اللَّهُ الحِكْمَةَ فَهُوَ يَقْضِي بِهَا وَيُعَلِّمُهَا', 'Tidak boleh iri (ghibthah) kecuali pada dua hal: seseorang yang diberi harta oleh Allah lalu ia habiskan di jalan kebenaran, dan seseorang yang diberi hikmah (ilmu) lalu ia mengamalkan dan mengajarkannya.', 'Bukhari, Muslim', '73, 816', NULL, NULL, 'HR. Bukhari no. 73 & Muslim no. 816', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(261, 'دَبَّ إِلَيْكُمْ دَاءُ الأُمَمِ قَبْلَكُمُ: الْحَسَدُ وَالْبَغْضَاءُ، هِيَ الْحَالِقَةُ', 'Telah merayap kepada kalian penyakit umat-umat sebelum kalian: yaitu iri dengki dan kebencian. Itulah pemotong (pengikis agama).', 'Tirmidzi, Ahmad', '2510', NULL, NULL, 'HR. Tirmidzi no. 2510 & Ahmad', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(262, 'الْعَيْنُ حَقٌّ، وَلَوْ كَانَ شَيْءٌ سَابَقَ الْقَدَرَ سَبَقَتْهُ الْعَيْنُ', 'Penyakit \'Ain (akibat pandangan dengki/takjub tanpa mendoakan) itu nyata. Seandainya ada sesuatu yang dapat mendahului takdir, niscaya \'ain-lah yang mendahuluinya.', 'Muslim', '2188', NULL, NULL, 'HR. Muslim no. 2188', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(263, 'إِذَا رَأَى أَحَدُكُمْ مِنْ أَخِيهِ مَا يُعْجِبُهُ فَلْيَدْعُ لَهُ بِالْبَرَكَةِ', 'Jika salah seorang dari kalian melihat sesuatu yang menakjubkan pada saudaranya, hendaklah ia mendoakan keberkahan untuknya (agar terhindar dari ain/hasad).', 'Ibn Majah, Malik', '3509', NULL, NULL, 'HR. Ibn Majah no. 3509 & Malik', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(264, 'لاَ يَجْتَمِعَانِ فِي جَوْفِ عَبْدٍ: الإِيمَانُ وَالْحَسَدُ', 'Tidak akan berkumpul di dalam dada seorang hamba: keimanan dan rasa dengki (hasad).', 'An-Nasa\'i, Ibn Hibban', '3109', NULL, NULL, 'HR. An-Nasa\'i no. 3109 & Ibn Hibban', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(265, 'لاَ يَزَالُ النَّاسُ بِخَيْرٍ مَا لَمْ يَتَحَاسَدُوا', 'Manusia akan senantiasa berada dalam kebaikan selama mereka tidak saling mendengki.', 'Thabrani', NULL, NULL, NULL, 'HR. Thabrani (Al-Mu\'jam al-Kabir) & Al-Albani', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(266, 'يَطْلُعُ عَلَيْكُمُ الآنَ رَجُلٌ مِنْ أَهْلِ الْجَنَّةِ... (قَالَ: لاَ أَجِدُ فِي نَفْسِي لأَحَدٍ مِنَ الْمُسْلِمِينَ غِشًّا وَلاَ حَسَدًا)', 'Nabi bersabda: \'Akan muncul penghuni surga.\' (Lelaki Anshar itu berkata): \'Aku tidak mendapati dalam diriku rasa iri/dengki atau kecurangan kepada seorang pun dari kaum muslimin.\'', 'Ahmad', '12697', NULL, NULL, 'HR. Ahmad no. 12697', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(267, 'كُلُّ ذِي نِعْمَةٍ مَحْسُودٌ', 'Setiap orang yang memiliki nikmat pasti ada yang mendengki (iri).', 'Thabrani, Abu Nu\'aim', NULL, NULL, NULL, 'HR. Thabrani & Abu Nu\'aim', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(268, 'اسْتَعِينُوا عَلَى إِنْجَاحِ الْحَوَائِجِ بِالْكِتْمَانِ، فَإِنَّ كُلَّ ذِي نِعْمَةٍ مَحْسُودٌ', 'Minta tolonglah dalam menyelesaikan hajat-hajatmu dengan menyembunyikannya (merahasiakannya), karena setiap orang yang mendapat nikmat pasti ada yang iri.', 'Thabrani', NULL, NULL, NULL, 'HR. Thabrani (Al-Mu\'jam al-Kabir) & Al-Albani', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(269, 'الْمُؤْمِنُ يَغْبِطُ وَالْمُنَافِقُ يَحْسُدُ', 'Seorang mukmin itu merasa ghibthah (ingin seperti orang lain dalam kebaikan tanpa mengharap nikmatnya hilang), sedangkan orang munafik itu merasa hasad (dengki).', 'Ibn Abi ad-Dunya', NULL, NULL, NULL, 'HR. Ibn Abi ad-Dunya (Fi ash-Shamt)', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(270, 'أَفْضَلُ النَّاسِ: كُلُّ مَخْمُومِ الْقَلْبِ، صَدُوقِ اللِّسَانِ... هُوَ التَّقِيُّ النَّقِيُّ، لاَ إِثْمَ فِيهِ وَلاَ بَغْيَ وَلاَ غِلَّ وَلاَ حَسَدَ', 'Manusia paling utama adalah yang bersih hatinya dan jujur lisannya... Yaitu yang bertakwa, bersih, tidak ada dosa, tidak berbuat zalim, tidak ada dendam, dan tidak ada rasa dengki.', 'Ibn Majah', '4216', NULL, NULL, 'HR. Ibn Majah no. 4216', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(271, 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّةِ مِنْ كُلِّ شَيْطَانٍ وَهَامَّةٍ وَمِنْ كُلِّ عَيْنٍ لاَمَّةٍ', 'Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari setiap setan, binatang berbisa, dan dari setiap mata pendengki yang menyakiti (\'ain).', 'Bukhari', '3371', NULL, NULL, 'HR. Bukhari no. 3371', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(272, 'بِسْمِ اللَّهِ أَرْقِيكَ، مِنْ كُلِّ شَيْءٍ يُؤْذِيكَ، مِنْ شَرِّ كُلِّ نَفْسٍ أَوْ عَيْنِ حَاسِدٍ، اللَّهُ يَشْفِيكَ', 'Dengan nama Allah aku meruqyahmu, dari segala sesuatu yang menyakitimu, dari kejahatan setiap jiwa atau mata orang yang dengki, semoga Allah menyembuhkanmu.', 'Muslim', '2186', NULL, NULL, 'HR. Muslim no. 2186', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(273, 'ثَلاَثٌ لاَ يُغَلُّ عَلَيْهِنَّ قَلْبُ مُسْلِمٍ: إِخْلاَصُ الْعَمَلِ لِلَّهِ، وَمُنَاصَحَةُ أُولِي الأَمْرِ، وَلُزُومُ جَمَاعَةِ الْمُسْلِمِينَ', 'Tiga hal yang tidak akan membuat hati seorang muslim menjadi dengki/dendam: mengikhlaskan amal karena Allah, memberi nasihat kepada pemimpin, dan komitmen pada jamaah kaum muslimin.', 'Tirmidzi, Ibn Majah', '2658', NULL, NULL, 'HR. Tirmidzi no. 2658 & Ibn Majah', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(274, 'لاَ يَكُونُ الْمُؤْمِنُ لَعَّانًا وَلاَ طَعَّانًا وَلاَ فَاحِشًا وَلاَ بَذِيئًا', 'Seorang mukmin bukanlah orang yang suka melaknat, suka mencela, berkata kotor, dan bersikap kasar (akibat hasad).', 'Tirmidzi', '1977', NULL, NULL, 'HR. Tirmidzi no. 1977', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(275, 'انْظُرُوا إِلَى مَنْ هُوَ أَسْفَلَ مِنْكُمْ وَلاَ تَنْظُرُوا إِلَى مَنْ هُوَ فَوْقَكُمْ فَهُوَ أَجْدَرُ أَنْ لاَ تَزْدَرُوا نِعْمَةَ اللَّهِ', 'Lihatlah orang yang berada di bawahmu dan jangan melihat orang yang berada di atasmu, karena hal itu lebih layak agar kalian tidak meremehkan nikmat Allah (dan terhindar dari iri).', 'Muslim', '2963', NULL, NULL, 'HR. Muslim no. 2963', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(276, 'اللَّهُمَّ آتِ نَفْسِي تَقْوَاهَا، وَزَكِّهَا أَنْتَ خَيْرُ مَنْ زَكَّاهَا، أَنْتَ وَلِيُّهَا وَمَوْلاَهَا', 'Ya Allah, berikanlah ketakwaan pada jiwaku dan sucikanlah ia (dari dengki), Engkaulah sebaik-baik yang menyucikannya, Engkau Pelindung dan Penolongnya.', 'Muslim', '2722', NULL, NULL, 'HR. Muslim no. 2722', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(277, 'اللَّهُمَّ اهْدِ قَلْبِي، وَاسْلُلْ سَخِيمَةَ صَدْرِي', 'Ya Allah, berilah petunjuk pada hatiku, dan cabutlah/bersihkanlah kedengkian serta kotoran dari dadaku.', 'Abu Dawud, Tirmidzi', '1510', NULL, NULL, 'HR. Abu Dawud no. 1510 & Tirmidzi', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(278, 'إِنَّمَا الأَعْمَالُ بِالنِّيَّاتِ', 'Sesungguhnya setiap amalan bergantung pada niatnya...', 'Bukhari, Muslim', '1, 1907', NULL, NULL, 'HR. Bukhari no. 1 & Muslim no. 1907', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(279, 'الْمُسْلِمُ مَنْ سَلِمَ الْمُسْلِمُونَ مِنْ لِسَانِهِ وَيَدِهِ', 'Seorang muslim sejati adalah yang orang muslim lainnya selamat dari gangguan lisan dan tangannya (termasuk dampak iri).', 'Bukhari, Muslim', '10, 40', NULL, NULL, 'HR. Bukhari no. 10 & Muslim no. 40', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(280, 'انْصُرْ أَخَاكَ ظَالِمًا أَوْ مَظْلُومًا', 'Tolonglah saudaramu baik yang melakukan zalim (mencegahnya dari dengki/zalim) maupun yang dizalimi.', 'Bukhari', '2444', NULL, NULL, 'HR. Bukhari no. 2444', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(281, 'صَوْمُ شَهْرِ الصَّبْرِ وَثَلاَثَةِ أَيَّامٍ مِنْ كُلِّ شَهْرٍ يُذْهِبْنَ وَحَرَ الصَّدْرِ', 'Puasa bulan sabar (Ramadhan) dan tiga hari setiap bulan (Ayyamul Bidh) dapat menghilangkan kedengkian/kotoran dada.', 'An-Nasa\'i, Ahmad', '2386', NULL, NULL, 'HR. An-Nasa\'i no. 2386 & Ahmad', 'iri', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(282, 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَالْعَجْزِ وَالْكَسَلِ وَالْبُخْلِ وَالْجُبْنِ وَضَلَعِ الدَّيْنِ وَغَلَبَةِ الرِّجَالِ', 'Ya Allah, aku berlindung kepada-Mu dari rasa cemas (stres masa depan), sedih, lemah, malas, kikir, penakut, beban utang, dan penguasaan/tekanan orang lain.', 'Bukhari', '6369', NULL, NULL, 'HR. Bukhari no. 6369', NULL, 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(283, 'مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلاَ وَصَبٍ وَلاَ هَمٍّ وَلاَ حَزَنٍ وَلاَ أَذًى وَلاَ غَمٍّ حَتَّى الشَّوْكَةِ يُشَاكُهَا إِلاَّ كَفَّرَ اللَّهُ بِهَا مِنْ خَطَايَاهُ', 'Tidaklah seorang muslim tertimpa suatu keletihan, penyakit, kecemasan (stres), kesedihan, gangguan, maupun duka cita melainkan Allah akan menghapus dosa-dosanya karenanya.', 'Bukhari, Muslim', '5641, 2573', NULL, NULL, 'HR. Bukhari no. 5641 & Muslim no. 2573', 'sedih, pengugur dosa, musibah', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(284, 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ لَا إِلَهَ إِلَّا أَنْتَ', 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku. Tiada tuhan selain Engkau.', 'Abu Dawud', '5090', NULL, NULL, 'HR. Abu Dawud no. 5090', 'stres', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(285, 'مَا أَصَابَ أَحَدًا قَطُّ هَمٌّ وَلاَ حَزَنٌ فَقَالَ اللَّهُمَّ إِنِّي عَبْدُكَ... إِلاَّ أَذْهَبَ اللَّهُ هَمَّهُ وَحُزْنَهُ وَأَبْدَلَهُ مَكَانَهُ فَرَجًا', 'Tidaklah seseorang tertimpa duka cita/stres lalu membaca doa \'Ya Allah, sesungguhnya aku adalah hamba-Mu...\' melainkan Allah akan menghilangkan kecemasannya dan menggantikannya dengan kelapangan.', 'Ahmad, Ibn Hibban', '3712', NULL, NULL, 'HR. Ahmad no. 3712 & Ibn Hibban', 'stres', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(286, 'كَانَ النَّبِيُّ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ إِذَا حَزَبَهُ أَمْرٌ صَلَّى', 'Nabi SAW apabila ditimpa suatu masalah yang merisaukan/memberatkan (stres), beliau bergegas mendirikan salat.', 'Abu Dawud', '1319', NULL, NULL, 'HR. Abu Dawud no. 1319', NULL, 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(287, 'أَرِحْنَا بِهَا يَا بِلاَلُ', 'Istirahatkanlah kami (buatlah kami tenang dari stres) dengan salat, wahai Bilal!', 'Abu Dawud', '4985', NULL, NULL, 'HR. Abu Dawud no. 4985', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(288, 'لاَ إِلَهَ إِلاَّ اللهُ الْعَظِيْمُ الْحَلِيْمُ، لاَ إِلَهَ إِلاَّ اللهُ رَبُّ الْعَرْشِ الْعَظِيْمِ', 'Tiada tuhan selain Allah Yang Maha Agung lagi Maha Penyantun. Tiada tuhan selain Allah, Rabb \'Arsy yang agung. (Doa Rasulullah saat menghadapi kesulitan/tekanan berat).', 'Bukhari, Muslim', '6345, 2730', NULL, NULL, 'HR. Bukhari no. 6345 & Muslim no. 2730', 'stres', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(289, 'يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ', 'Wahai Yang Mahahidup, Wahai Yang Maha Berdiri Sendiri, dengan rahmat-Mu aku memohon pertolongan.', 'Tirmidzi', '3524', NULL, NULL, 'HR. Tirmidzi no. 3524', NULL, 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(290, 'اللهُ اللهُ رَبِّي لَا أُشْرِكُ بِهِ شَيْئًا', 'Allah, Allah adalah Tuhanku, aku tidak mempersekutukan-Nya dengan sesuatu apa pun. (Dibaca saat mengalami tekanan jiwa/stres).', 'Abu Dawud', '1525', NULL, NULL, 'HR. Abu Dawud no. 1525', 'stres', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(291, 'وَاعْلَمْ أَنَّ النَّصْرَ مَعَ الصَّبْرِ وَأَنَّ الْفَرَجَ مَعَ الْكَرْبِ وَأَنَّ مَعَ الْعُسْرِ يُسْرًا', 'Ketahuilah bahwa pertolongan itu bersama kesabaran, kelapangan itu bersama kesusahan, dan kemudahan itu bersama kesulitan.', 'Ahmad', '2803', NULL, NULL, 'HR. Ahmad no. 2803', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(292, 'مَنْ لَزِمَ الاِسْتِغْفَارَ جَعَلَ اللَّهُ لَهُ مِنْ كُلِّ ضِيقٍ مَخْرَجًا وَمِنْ كُلِّ هَمٍّ فَرَجًا', 'Barangsiapa merutinkan istighfar, niscaya Allah jadikan baginya jalan keluar dari setiap kesempitan dan kelapangan dari setiap duka cita/stres.', 'Abu Dawud', '1518', NULL, NULL, 'HR. Abu Dawud no. 1518', 'stres', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(293, 'عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ... إِنْ أَصَابَتْهُ ضَرَّاءُ صَبَرَ فَكَانَ خَيْرًا لَهُ', 'Sungguh menakjubkan urusan seorang mukmin... jika ditimpa kesusahan/tekanan dia bersabar, dan itu baik baginya.', 'Muslim', '2999', NULL, NULL, 'HR. Muslim no. 2999', 'stres', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(294, 'إِنَّ عِظَمَ الْجَزَاءِ مَعَ عِظَمِ الْبَلاَءِ', 'Sesungguhnya besarnya balasan (pahala) itu sebanding dengan besarnya ujian/penderitaan.', 'Tirmidzi', '2396', NULL, NULL, 'HR. Tirmidzi no. 2396', NULL, 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(295, 'إِنَّ لِرَبِّكَ عَلَيْكَ حَقًّا، وَلِنَفْسِكَ عَلَيْكَ حَقًّا', '...Sesungguhnya Rabbmu memiliki hak atasmu, dan dirimu (kesehatan mental & fisikmu) memiliki hak atasmu. Maka berikanlah haknya.', 'Bukhari', '1968', NULL, NULL, 'HR. Bukhari no. 1968', 'stres', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(296, 'احْرِصْ عَلَى مَا يَنْفَعُكَ وَاسْتَعِنْ بِاللَّهِ وَلاَ تَعْجِزْ', 'Semangatlah terhadap apa yang bermanfaat bagimu, mohonlah pertolongan kepada Allah, dan janganlah merasa lemah/patah semangat.', 'Muslim', '2664', NULL, NULL, 'HR. Muslim no. 2664', 'stres', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(297, 'عَجَبًا لأَمْرِ الْمُؤْمِنِ إِنَّ أَمْرَهُ كُلَّهُ خَيْرٌ... إِنْ أَصَابَتْهُ ضَرَّاءُ صَبَرَ فَكَانَ خَيْرًا لَهُ', 'Sungguh menakjubkan urusan seorang mukmin, seluruh urusannya adalah baik baginya. Jika ia mendapatkan kesenangan ia bersyukur, maka itu baik baginya. Dan jika ditimpa kesusahan (kekecewaan) ia bersabar, maka itu baik baginya.', 'Muslim', '2999', NULL, NULL, 'HR. Muslim no. 2999', NULL, 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(298, 'مَا أَصَابَ الْمُسْلِمَ مِنْ نَصَبٍ وَلاَ وَصَبٍ وَلاَ هَمٍّ وَلاَ حَزَنٍ وَلاَ أَذًى وَلاَ غَمٍّ حَتَّى الشَّوْكَةِ يُشَاكُهَا إِلاَّ كَفَّرَ اللَّهُ بِهَا مِنْ خَطَايَاهُ', 'Tidaklah seorang muslim tertimpa suatu keletihan, penyakit, kecemasan, kesedihan, gangguan, maupun duka cita/kekecewaan melainkan Allah akan menghapus dosa-dosanya dengan sebab itu.', 'Bukhari, Muslim', '5641, 2573', NULL, NULL, 'HR. Bukhari no. 5641 & Muslim no. 2573', 'stres', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(299, 'احْرِصْ عَلَى مَا يَنْفَعُكَ وَاسْتَعِنْ بِاللَّهِ وَلاَ تَعْجِزْ، وَإِنْ أَصَابَكَ شَيْءٌ فَلاَ تَقُلْ لَوْ أَنِّي فَعَلْتُ كَانَ كَذَا وَكَذَا، وَلَكِنْ قُلْ قَدَرُ اللَّهِ وَمَا شَاءَ فَعَلَ', 'Semangatlah terhadap apa yang bermanfaat bagimu, mohonlah pertolongan kepada Allah, dan jangan lemah. Jika sesuatu menimpamu (membuatmu kecewa), jangan katakan \'Seandainya aku melakukan ini...\', melainkan katakanlah \'Ini takdir Allah, dan apa yang Dia kehendaki pasti terjadi\'.', 'Muslim', '2664', NULL, NULL, 'HR. Muslim no. 2664', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(300, 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَالْعَجْزِ وَالْكَسَلِ', 'Ya Allah, aku berlindung kepada-Mu dari rasa cemas, sedih/kecewa, lemah, dan malas.', 'Bukhari', '6369', NULL, NULL, 'HR. Bukhari no. 6369', 'doa, perlindungan, sedih', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(301, 'مَا أَصَابَ أَحَدًا قَطُّ هَمٌّ وَلاَ حَزَنٌ فَقَالَ اللَّهُمَّ إِنِّي عَبْدُكَ... إِلاَّ أَذْهَبَ اللَّهُ هَمَّهُ وَحُزْنَهُ وَأَبْدَلَهُ مَكَانَهُ فَرَجًا', 'Tidaklah seseorang tertimpa duka cita dan kekecewaan lalu membaca doa \'Ya Allah, sesungguhnya aku adalah hamba-Mu...\' melainkan Allah akan menghilangkan duka citanya dan menggantikannya dengan kelapangan.', 'Ahmad, Ibn Hibban', '3712', NULL, NULL, 'HR. Ahmad no. 3712 & Ibn Hibban', NULL, 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(302, 'اللَّهُمَّ أْجُرْنِي فِي مُصِيبَتِي وَأَخْلِفْ لِي خَيْرًا مِنْهَا', 'Ya Allah, berilah aku pahala dalam musibah/kekecewaanku ini dan gantikanlah bagiku dengan yang lebih baik daripadanya.', 'Muslim', '918', NULL, NULL, 'HR. Muslim no. 918', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(303, 'إِنَّمَا الصَّبْرُ عِنْدَ الصَّدْمَةِ الأُولَى', 'Sesungguhnya kesabaran (yang sebenarnya) adalah pada saat pertama kali tertimpa musibah/kekecewaan.', 'Bukhari, Muslim', '1283, 926', NULL, NULL, 'HR. Bukhari no. 1283 & Muslim no. 926', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(304, 'وَاعْلَمْ أَنَّ مَا أَخْطَأَكَ لَمْ يَكُنْ لِيُصِيبَكَ، وَمَا أَصَابَكَ لَمْ يَكُنْ لِيُخْطِئَكَ', 'Dan ketahuilah bahwa apa yang luput darimu (membuatmu kecewa) tidak akan menimpamu, dan apa yang menimpamu tidak akan luput darimu.', 'Tirmidzi', '2516', NULL, NULL, 'HR. Tirmidzi no. 2516', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(305, 'وَاعْلَمْ أَنَّ النَّصْرَ مَعَ الصَّبْرِ وَأَنَّ الْفَرَجَ مَعَ الْكَرْبِ وَأَنَّ مَعَ الْعُسْرِ يُسْرًا', 'Ketahuilah bahwa pertolongan itu bersama kesabaran, kelapangan itu bersama kesusahan, dan kemudahan itu bersama kesulitan.', 'Ahmad', '2803', NULL, NULL, 'HR. Ahmad no. 2803', 'sabar, kemudahan, pertolongan', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(306, 'مَنْ يُرِدِ اللَّهُ بِهِ خَيْرًا يُصِبْ مِنْهُ', 'Barangsiapa yang dikehendaki kebaikan oleh Allah, maka Dia akan memberinya ujian/musibah (kekecewaan fana).', 'Bukhari', '5645', NULL, NULL, 'HR. Bukhari no. 5645', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(307, 'إِنَّ عِظَمَ الْجَزَاءِ مَعَ عِظَمِ الْبَلاَءِ وَإِنَّ اللَّهَ إِذَا أَحَبَّ قَوْمًا ابْتَلاَهُمْ', 'Sesungguhnya besarnya balasan disertai besarnya ujian. Dan sesungguhnya apabila Allah mencintai suatu kaum, Dia akan menguji mereka.', 'Tirmidzi', '2396', NULL, NULL, 'HR. Tirmidzi no. 2396', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(308, 'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ وَأَصْلِحْ لِي شَأْنِي كُلَّهُ', 'Ya Allah, rahmat-Mu yang aku harapkan, maka janganlah Engkau serahkan aku kepada diriku sendiri walau sekejap mata pun, dan perbaikilah seluruh urusanku.', 'Abu Dawud', '5090', NULL, NULL, 'HR. Abu Dawud no. 5090', 'tenang', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(309, 'إِنَّ العَيْنَ تَدْمَعُ، وَالقَلْبَ يَحْزَنُ، وَلاَ نَقُولُ إِلَّا مَا يَرْضَى رَبُّنَا', 'Mata boleh menangis dan hati boleh bersedih (kecewa), namun kami tidak mengucapkan kecuali apa yang diridhai oleh Rabb kami.', 'Bukhari', '1303', NULL, NULL, 'HR. Bukhari no. 1303', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(310, 'اللَّهُمَّ رَضِّنِي بِمَا قَضَيْتَ وَبَارِكْ لِي فِيمَا قُدِّرَ حَتَّى لاَ أُحِبَّ تعْجِيلَ مَا أَخَّرْتَ وَلاَ تَأْخِيرَ مَا عَجَّلْتَ', 'Ya Allah, jadikanlah aku ridha dengan apa yang telah Engkau tetapkan dan berkahilah bagiku apa yang telah Engkau takdirkan, sehingga aku tidak ingin menyegerakan apa yang Engkau tangguhkan dan menangguhkan apa yang Engkau segerakan.', 'Ibn al-Suni, Al-Tabarani', '-', NULL, NULL, 'HR. Ibn al-Suni & Al-Tabarani', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(311, 'ارْضَ بِمَا قَسَمَ اللَّهُ لَكَ تَكُنْ أَغْنَى النَّاسِ', 'Ridhalah terhadap apa yang telah Allah bagikan untukmu, niscaya engkau akan menjadi orang yang paling kaya (paling tidak pernah kecewa).', 'Tirmidzi', '2305', NULL, NULL, 'HR. Tirmidzi no. 2305', 'kecewa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `kiosks`
--

CREATE TABLE `kiosks` (
  `id` int(11) UNSIGNED NOT NULL,
  `location_id` int(11) UNSIGNED NOT NULL,
  `tenant_id` int(11) UNSIGNED NOT NULL,
  `kiosk_code` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `platform` varchar(50) DEFAULT 'web',
  `printer_model` varchar(100) DEFAULT NULL,
  `printer_type` varchar(50) DEFAULT 'thermal_80mm',
  `screen_size` varchar(20) DEFAULT NULL,
  `donation_mode` varchar(50) DEFAULT 'optional',
  `sponsor_enabled` tinyint(1) DEFAULT 0,
  `device_id` varchar(255) DEFAULT NULL,
  `device_fingerprint` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `os_version` varchar(100) DEFAULT NULL,
  `configuration_version` int(11) UNSIGNED DEFAULT 1,
  `content_manifest_version` int(11) UNSIGNED DEFAULT 1,
  `activated_at` datetime DEFAULT NULL,
  `deactivated_at` datetime DEFAULT NULL,
  `device_secret_hash` varchar(255) NOT NULL,
  `app_version` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `printer_status` varchar(20) NOT NULL DEFAULT 'unknown',
  `last_seen` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kiosks`
--

INSERT INTO `kiosks` (`id`, `location_id`, `tenant_id`, `kiosk_code`, `name`, `platform`, `printer_model`, `printer_type`, `screen_size`, `donation_mode`, `sponsor_enabled`, `device_id`, `device_fingerprint`, `ip_address`, `os_version`, `configuration_version`, `content_manifest_version`, `activated_at`, `deactivated_at`, `device_secret_hash`, `app_version`, `status`, `printer_status`, `last_seen`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'KSK-TEST-001', NULL, 'web', NULL, 'thermal_80mm', NULL, 'optional', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '$2y$10$2lCCltCGKIwZBK8W5Xn.VOPgzlWpHagz9.uHUYLzpiPXy.jRgRfva', '1.0.0', 'active', 'unknown', NULL, '2026-07-25 11:46:51', '2026-07-25 11:46:51', '2026-07-25 11:46:51'),
(2, 4, 3, 'KSK-811A7C', 'windows_electron Kiosk #1', 'Web', NULL, 'thermal_80mm', NULL, 'optional', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '$2y$10$TFfrDrrVdofNNDoH.7oTUeDElqzwCJ6450k1nOG0EfUAsyqD7L6fy', NULL, 'inactive', 'unknown', NULL, '2026-07-27 14:15:47', '2026-07-29 06:52:14', NULL),
(3, 4, 3, 'KSK-832221', 'masjid raya', 'android', NULL, 'thermal_80mm', NULL, 'custom', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '$2y$10$Eu9D6SmD7EQeLyp4jlkyeeE3F5y3nIjyRhTQl2Nu77CC0qQyjYssK', '1.0.0', 'active', 'unknown', NULL, '2026-07-27 15:33:24', '2026-07-27 15:38:54', NULL),
(4, 2, 3, 'KSK-502C50', 'android Kiosk #1', 'web', NULL, 'thermal_80mm', NULL, 'optional', 1, 'Akumerasa Kiosk localhost', 'bcff6fa4-bca0-4ed6-9fbd-d00dbc29b832', NULL, NULL, 1, 1, '2026-07-31 07:25:16', NULL, '$2y$10$CXd15qCs3VGyCn39obOhJ.Iciy2.t1BDkCvmXWSS3D5zTD2Mc.RAi', NULL, 'active', 'unknown', NULL, '2026-07-27 15:38:11', '2026-07-31 07:25:16', NULL),
(5, 2, 3, 'KSK-AM-1111', 'DEPAN_MASJID', 'web', NULL, 'thermal_80mm', NULL, 'optional', 0, 'Akumerasa Kiosk localhost', '1e1a528e-b1cf-4553-8dbe-f6ac3bd197ca', NULL, NULL, 1, 1, '2026-07-29 12:15:45', NULL, '$2y$10$Kcl.BvPgw9EuvoDsrb8xdO6weNFAl.VafYU1TPgdQv7lodEGyfOii', '1.0.0', 'active', 'unknown', NULL, '2026-07-29 12:07:31', '2026-07-29 12:15:45', NULL),
(6, 0, 3, 'KSK-C77907', 'android Kiosk #1', 'android', NULL, 'thermal_80mm', NULL, 'optional', 1, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '$2y$10$2sFFdpVOjqw5tM0r6eraS.cj7ZHkDudc5nTlon0zfqFSJpEMdW7D2', NULL, 'inactive', 'unknown', NULL, '2026-07-31 06:52:43', '2026-07-31 06:56:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kiosk_heartbeats`
--

CREATE TABLE `kiosk_heartbeats` (
  `id` int(10) UNSIGNED NOT NULL,
  `kiosk_id` int(10) UNSIGNED NOT NULL,
  `storage_used` int(11) DEFAULT NULL,
  `network_status` varchar(20) DEFAULT 'online',
  `printer_state` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kiosk_requests`
--

CREATE TABLE `kiosk_requests` (
  `id` int(11) UNSIGNED NOT NULL,
  `request_number` varchar(30) NOT NULL,
  `tenant_id` int(11) UNSIGNED NOT NULL,
  `location_id` int(11) UNSIGNED DEFAULT NULL,
  `requested_by` int(11) UNSIGNED NOT NULL,
  `request_type` varchar(20) DEFAULT 'new',
  `platform` varchar(50) DEFAULT 'windows_electron',
  `printer_type` varchar(50) DEFAULT 'thermal_80mm',
  `quantity` int(11) UNSIGNED DEFAULT 1,
  `donation_mode` varchar(50) DEFAULT 'optional',
  `sponsor_enabled` tinyint(1) DEFAULT 0,
  `priority` varchar(20) DEFAULT 'normal',
  `status` varchar(20) DEFAULT 'draft',
  `admin_notes` text DEFAULT NULL,
  `reviewed_by` int(11) UNSIGNED DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL,
  `kiosk_id` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kiosk_requests`
--

INSERT INTO `kiosk_requests` (`id`, `request_number`, `tenant_id`, `location_id`, `requested_by`, `request_type`, `platform`, `printer_type`, `quantity`, `donation_mode`, `sponsor_enabled`, `priority`, `status`, `admin_notes`, `reviewed_by`, `reviewed_at`, `approved_at`, `fulfilled_at`, `kiosk_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'KR-202607-001', 3, 2, 5, 'new', 'android', 'thermal_80mm', 1, 'mandatory', 1, 'normal', 'approved', NULL, 5, '2026-07-27 15:38:11', '2026-07-27 15:38:11', '2026-07-27 15:38:11', 4, '2026-07-27 13:22:09', '2026-07-27 15:38:11', NULL),
(2, 'KR-202607-002', 4, 3, 1, 'new', 'windows_electron', 'thermal_80mm', 1, 'optional', 0, 'normal', 'approved', NULL, 1, '2026-07-27 14:15:47', '2026-07-27 14:15:47', '2026-07-27 14:15:47', 2, '2026-07-27 14:15:39', '2026-07-27 14:15:47', NULL),
(4, 'KR-202607-003', 3, 0, 1, 'new', 'android', 'thermal_80mm', 1, 'optional', 1, 'normal', 'approved', NULL, 1, '2026-07-31 06:52:43', '2026-07-31 06:52:43', '2026-07-31 06:52:43', 6, '2026-07-31 06:52:40', '2026-07-31 06:52:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kiosk_tokens`
--

CREATE TABLE `kiosk_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `kiosk_id` int(10) UNSIGNED NOT NULL,
  `token_hash` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kiosk_tokens`
--

INSERT INTO `kiosk_tokens` (`id`, `kiosk_id`, `token_hash`, `expires_at`, `revoked_at`, `created_at`) VALUES
(1, 4, '35ccdf5c3b9ace257916ceb37973363819012589919e25e04b72948d96102269', '2026-08-28 06:51:11', NULL, '2026-07-29 06:51:11'),
(2, 4, '58f13dc86cbe6660f76aa77b6acef3c43ad9f618e9cd46a89abde1f6c0a9731f', '2026-08-28 06:54:23', NULL, '2026-07-29 06:54:23'),
(3, 4, '499075ef1b62b125a77ece3ca8d654f3c5153621d6af2d51d5086d7ceb6f4e4f', '2026-08-28 06:56:34', NULL, '2026-07-29 06:56:34'),
(4, 4, 'b5acc8ef2fcd685f9e9c6b18e193862ba8be513e5d84ccfedeb7e3a7d69b1937', '2026-08-28 06:59:10', NULL, '2026-07-29 06:59:10'),
(5, 4, '570c0863c6f77e2b23c362bfac01146bb899a8b3890b7adada3f20156c982904', '2026-08-28 07:01:28', NULL, '2026-07-29 07:01:28'),
(6, 4, '82c3dbd5def7451e3f5dcba56de0c6be21fe935b6699868398f77a67ca4748b4', '2026-08-28 07:01:58', NULL, '2026-07-29 07:01:58'),
(7, 4, '1b8272067db05036642e0247ab53b6e038c3c95af682b2fffaa03230522978d2', '2026-08-28 07:03:21', NULL, '2026-07-29 07:03:21'),
(8, 5, '2a556b8ff5e8106b6e8c0856a46dea4ab5516b0611bed43306f1902fafc06122', '2026-08-28 12:15:45', NULL, '2026-07-29 12:15:45'),
(9, 4, '6199852980fede87e0392efcbb9bd9a36e9da93f8dd5ec4345a2744749cdcb81', '2027-07-31 07:16:51', NULL, '2026-07-31 07:16:51'),
(10, 4, 'b012947e75c40a466152226902d96c041e02eeebaca8e3f1df0b4926bb124fa1', '2027-07-31 07:25:16', NULL, '2026-07-31 07:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `tenant_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT 'masjid',
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT 'Asia/Jakarta',
  `country` char(2) DEFAULT 'ID',
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `logo_url` varchar(500) DEFAULT NULL,
  `cover_url` varchar(500) DEFAULT NULL,
  `maps_url` varchar(500) DEFAULT NULL,
  `operational_hours` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`operational_hours`)),
  `facilities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`facilities`)),
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `submitted_at` datetime DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `reviewed_by` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `code`, `tenant_id`, `name`, `type`, `address`, `city`, `province`, `district`, `postal_code`, `timezone`, `country`, `contact_name`, `contact_phone`, `contact_email`, `logo_url`, `cover_url`, `maps_url`, `operational_hours`, `facilities`, `latitude`, `longitude`, `status`, `submitted_at`, `reviewed_at`, `reviewed_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 1, 'Masjid Updated', 'masjid', 'Jl. Test No.1', 'Jakarta', 'DKI Jakarta', NULL, NULL, 'Asia/Jakarta', 'ID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL, NULL, '2026-07-25 11:46:50', '2026-07-25 11:46:50', '2026-07-25 11:46:50'),
(2, 'LOC-151107', 3, 'Masjid Nurul Imana', 'Masjid', 'Jl Raya hankam munjul, cipayung', 'Jakarta', 'DKI Jakarta', 'Cipayung', '', 'Asia/Jakarta', 'ID', 'bambanag', '081212121212121', '', NULL, NULL, '', NULL, NULL, NULL, NULL, 'active', NULL, NULL, NULL, '2026-07-27 13:22:09', '2026-07-27 15:30:32', NULL),
(3, 'LOC-424243', 4, 'Lokasi Test', 'Masjid', 'Jl Lokasi No 1', 'Jakarta', 'DKI Jakarta', 'Menteng', '10310', 'Asia/Jakarta', 'ID', 'Budi', '08123456789', '', NULL, NULL, '', NULL, NULL, NULL, NULL, 'active', NULL, NULL, NULL, '2026-07-27 14:15:22', '2026-07-27 15:30:26', '2026-07-27 15:32:02'),
(4, 'LOC-CCB7E7', 3, 'masjid raya', 'masjid', 'Jl bangka ', 'Jakarta', 'DKI Jakarta', '', '', 'Asia/Jakarta', 'ID', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, 'active', NULL, NULL, NULL, '2026-07-27 15:31:47', '2026-07-27 15:31:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2026-07-24-000001', 'Database\\Migrations\\CreateUsersTable', 'default', 'App', 1784911190, 1),
(2, '2026-07-24-000002', 'Database\\Migrations\\CreateTenantsTable', 'default', 'App', 1784911190, 1),
(3, '2026-07-24-000003', 'Database\\Migrations\\CreateLocationsTable', 'default', 'App', 1784911190, 1),
(4, '2026-07-24-000004', 'Database\\Migrations\\CreateKiosksTable', 'default', 'App', 1784911190, 1),
(5, '2026-07-24-000005', 'Database\\Migrations\\CreateContentTables', 'default', 'App', 1784911190, 1),
(6, '2026-07-24-000006', 'Database\\Migrations\\CreateReflectionTables', 'default', 'App', 1784911190, 1),
(7, '2026-07-24-000007', 'Database\\Migrations\\CreateDonationTables', 'default', 'App', 1784911190, 1),
(8, '2026-07-24-000008', 'Database\\Migrations\\CreateCampaignTables', 'default', 'App', 1784911190, 1),
(9, '2026-07-24-000009', 'Database\\Migrations\\CreateAuditTables', 'default', 'App', 1784911190, 1),
(10, '2026-07-24-000010', 'Database\\Migrations\\AddXenditToDonations', 'default', 'App', 1784911190, 1),
(11, '2026-07-24-000011', 'Database\\Migrations\\AddTenantDonorCampaignToDonations', 'default', 'App', 1784911190, 1),
(12, '2026-07-24-000012', 'Database\\Migrations\\ExtendTenantsTable', 'default', 'App', 1784911190, 1),
(13, '2026-07-24-000013', 'Database\\Migrations\\ExtendLocationsTable', 'default', 'App', 1784911190, 1),
(14, '2026-07-24-000014', 'Database\\Migrations\\ExtendKiosksTable', 'default', 'App', 1784911190, 1),
(15, '2026-07-24-000015', 'Database\\Migrations\\CreateDeviceActivationsTable', 'default', 'App', 1784911190, 1),
(16, '2026-07-24-000016', 'Database\\Migrations\\CreateKioskRequestsTable', 'default', 'App', 1784911190, 1),
(17, '2026-07-24-000017', 'Database\\Migrations\\CreateUserRoleAssignmentsTable', 'default', 'App', 1784911190, 1),
(18, '2026-07-24-000018', 'Database\\Migrations\\AddReflectionContentTagsAndDonationLocation', 'default', 'App', 1785325369, 2),
(19, '2026-07-29-000018', 'Database\\Migrations\\AddReflectionContentTagsAndDonationLocation', 'default', 'App', 1785325603, 3),
(20, '2026-07-25-100000', 'Database\\Migrations\\AddXenditToDonations', 'default', 'App', 1785909678, 4),
(21, '2026-07-25-100001', 'Database\\Migrations\\AddTenantDonorCampaignToDonations', 'default', 'App', 1785909678, 4),
(22, '2026-07-25-100002', 'Database\\Migrations\\ExtendTenantsTable', 'default', 'App', 1785909678, 4),
(23, '2026-07-25-100003', 'Database\\Migrations\\ExtendLocationsTable', 'default', 'App', 1785909678, 4),
(24, '2026-07-25-100004', 'Database\\Migrations\\ExtendKiosksTable', 'default', 'App', 1785909678, 4),
(25, '2026-07-25-100005', 'Database\\Migrations\\CreateDeviceActivationsTable', 'default', 'App', 1785909678, 4),
(26, '2026-07-25-100006', 'Database\\Migrations\\CreateKioskRequestsTable', 'default', 'App', 1785909678, 4),
(27, '2026-07-25-100007', 'Database\\Migrations\\CreateUserRoleAssignmentsTable', 'default', 'App', 1785909678, 4);

-- --------------------------------------------------------

--
-- Table structure for table `payment_webhooks`
--

CREATE TABLE `payment_webhooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `donation_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(50) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `signature` varchar(255) DEFAULT NULL,
  `processed_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_webhooks`
--

INSERT INTO `payment_webhooks` (`id`, `donation_id`, `provider`, `payload`, `signature`, `processed_at`, `created_at`) VALUES
(1, 2, 'xendit', '{\"event\":\"payment.succeeded\",\"data\":{\"id\":\"pr-eef0d16b-f774-4e60-8ffc-b9f5013cb733\",\"reference_id\":\"DON-20260725-c87784c3\",\"status\":\"SUCCEEDED\",\"amount\":15000,\"payment_method\":{\"type\":\"QR_CODE\",\"qr_code\":{\"channel_code\":\"QRIS\"}}}}', 'JhMhTIus9m9V3fss7zF6tweSYVdwsfhu6swgMh7lJd6v23or', '2026-07-25 12:38:50', '2026-07-25 12:38:50');

-- --------------------------------------------------------

--
-- Table structure for table `print_jobs`
--

CREATE TABLE `print_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `result_id` int(10) UNSIGNED NOT NULL,
  `kiosk_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `retry_count` int(11) DEFAULT 0,
  `error_message` text DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quran_verses`
--

CREATE TABLE `quran_verses` (
  `id` int(11) UNSIGNED NOT NULL,
  `surah` int(3) NOT NULL,
  `ayat_number` int(3) NOT NULL,
  `arabic_text` text NOT NULL,
  `translation` text DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'draft',
  `reviewer_id` int(11) UNSIGNED DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quran_verses`
--

INSERT INTO `quran_verses` (`id`, `surah`, `ayat_number`, `arabic_text`, `translation`, `source`, `tags`, `status`, `reviewer_id`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(3, 9, 40, 'لاَ تَحْزَنْ إِنَّ اللَّهَ مَعَنَا', 'Janganlah engkau berduka cita, sesungguhnya Allah bersama kita.', 'Al-Qur\'an', 'sedih, pertolongan Allah, penenang hati', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(4, 3, 139, 'وَلَا تَهِنُوا وَلَا تَحْزَنُوا وَأَنْتُمُ الْأَعْلَوْنَ إِنْ كُنْتُمْ مُؤْمِنِينَ', 'Janganlah kamu (merasa) lemah, dan jangan (pula) bersedih hati, padahal kamu pun orang-orang yang paling tinggi (derajatnya), jika kamu orang-orang yang beriman.', 'Al-Qur\'an', 'sedih, motivasi, kesabaran', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(5, 12, 86, 'قَالَ إِنَّمَا أَشْكُو بَثِّي وَحُزْنِي إِلَى اللَّهِ', 'Dia (Yakub) menjawab: \'Sesungguhnya hanyalah kepada Allah aku mengadukan kesusahan dan kesedihanku.\'', 'Al-Qur\'an', 'sedih, doa, mengadu kepada Allah', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(6, 12, 84, 'وَتَوَلَّىٰ عَنْهُمْ وَقَالَ يَا أَسَفَىٰ عَلَىٰ يُوسُفَ وَابْيَضَّتْ عَيْنَاهُ مِنَ الْحُزْنِ فَهُوَ كَظِيمٌ', 'Dan dia (Yakub) berpaling dari mereka seraya berkata: \'Aduhai duka citaku terhadap Yusuf,\' dan kedua matanya menjadi putih karena kesedihan dan dia menahan amarahnya.', 'Al-Qur\'an', 'sedih, kerinduan, kehilangan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(7, 10, 62, 'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Ingatlah, sesungguhnya wali-wali Allah itu tidak ada kekhawatiran terhadap mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, ketenangan, wali Allah', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(8, 10, 65, 'وَلَا يَحْزُنْكَ قَوْلُهُمْ ۘ إِنَّ الْعِزَّةَ لِلَّهِ جَمِيعًا', 'Dan janganlah engkau (Muhammad) sedih oleh perkataan mereka. Sesungguhnya kemuliaan itu semuanya milik Allah.', 'Al-Qur\'an', 'sedih, prasangka, perlindungan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(9, 16, 127, 'وَاصْبِرْ وَمَا صَبْرُكَ إِلَّا بِاللَّهِ ۚ وَلَا تَحْزَنْ عَلَيْهِمْ وَلَا تَكُ فِي ضَيْقٍ مِمَّا يَمْكُرُونَ', 'Bersabarlah (hai Muhammad) dan tiadalah kesabaranmu itu melainkan dengan pertolongan Allah dan janganlah kamu bersedih hati terhadap mereka.', 'Al-Qur\'an', 'sabar, sedih, tawakal', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(10, 28, 7, 'وَلَا تَخَافِي وَلَا تَحْزَنِي ۖ إِنَّا رَادُّوهُ إِلَيْكِ وَجَاعِلُوهُ مِنَ الْمُرْسَلِينَ', '...Dan janganlah engkau takut dan janganlah (pula) bersedih hati, karena sesungguhnya Kami akan mengembalikannya kepadamu...', 'Al-Qur\'an', 'sedih, rasa takut, janji Allah', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(11, 28, 13, 'فَرَدَدْنَاهُ إِلَىٰ أُمِّهِ كَيْ تَقَرَّ عَيْنُهَا وَلَا تَحْزَنَ', 'Maka Kami kembalikan dia (Musa) kepada ibunya, agar senang hatinya dan tidak bersedih hati...', 'Al-Qur\'an', 'sedih, kegembiraan, jawaban doa', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(12, 15, 88, 'وَلَا تَمُدَّنَّ عَيْنَيْكَ إِلَىٰ مَا مَتَّعْنَا بِهِ أَزْوَاجًا مِنْهُمْ وَلَا تَحْزَنْ عَلَيْهِمْ', 'Jangan sekali-kali engkau menujukan pandanganmu kepada kenikmatan yang telah Kami berikan kepada beberapa golongan di antara mereka dan jangan engkau bersedih hati terhadap mereka...', 'Al-Qur\'an', 'sedih, qana\'ah, ketenangan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(13, 2, 38, 'فَمَنْ تَبِعَ هُدَايَ فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', '...Barangsiapa mengikuti petunjuk-Ku, tidak ada kekhawatiran atas mereka, dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, petunjuk, hidayah', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(14, 2, 112, 'بَلَىٰ مَنْ أَسْلَمَ وَجْهَهُ لِلَّهِ وَهُوَ مُحْسِنٌ فَلَهُ أَجْرُهُ عِنْدَ رَبِّهِ وَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Tidak! Barangsiapa menyerahkan diri kepada Allah, sedang dia berbuat baik, maka dia mendapat pahala di sisi Tuhannya dan tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, keikhlasan, pahala', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(15, 2, 262, 'الَّذِينَ يُنْفِقُونَ أَمْوَالَهُمْ فِي سَبِيلِ اللَّهِ ثُمَّ لَا يُتْبِعُونَ مَا أَنْفَقُوا مَنًّا وَلَا أَذًى ۙ لَهُمْ أَجْرُهُمْ عِنْدَ رَبِّهِمْ وَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Orang-orang yang menginfakkan hartanya di jalan Allah, kemudian tidak mengiringi apa yang diinfakkannya itu dengan menyebut-nyebutnya dan menyakiti perasaan, mereka mendapat pahala di sisi Tuhan mereka. Tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, sedekah, ketenangan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(16, 2, 274, 'الَّذِينَ يُنْفِقُونَ أَمْوَالَهُمْ بِاللَّيْلِ وَالنَّهَارِ سِرًّا وَعَلَانِيَةً فَلَهُمْ أَجْرُهُمْ عِنْدَ رَبِّهِمْ وَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Orang-orang yang menginfakkan hartanya malam dan siang hari secara tersembunyi maupun terang-terangan, mereka mendapat pahala di sisi Tuhannya. Tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, infak, ketenteraman', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(17, 2, 277, 'إِنَّ الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ وَأَقَامُوا الصَّلَاةَ وَآتَوُا الزَّكَاةَ لَهُمْ أَجْرُهُمْ عِنْدَ رَبِّهِمْ وَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Sungguh, orang-orang yang beriman, mengerjakan kebajikan, melaksanakan salat dan menunaikan zakat, mereka mendapat pahala di sisi Tuhannya. Tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, iman, amal saleh', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(18, 5, 69, 'مَنْ آمَنَ بِاللَّهِ وَالْيَوْمِ الْآخِرِ وَعَمِلَ صَالِحًا فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', '...Barangsiapa beriman kepada Allah, hari kemudian dan berbuat kebajikan, maka tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, iman, ketenangan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(19, 6, 33, 'قَدْ نَعْلَمُ إِنَّهُ لَيَحْزُنُكَ الَّذِي يَقُولُونَ ۖ فَإِنَّهُمْ لَا يُكَذِّبُونَكَ', 'Sungguh, Kami mengetahui bahwa apa yang mereka katakan itu menyedihkan hatimu, (maka janganlah berduka cita) karena sebenarnya mereka bukan mendustakan engkau...', 'Al-Qur\'an', 'sedih, empati, penawar luka', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(20, 6, 48, 'فَمَنْ آمَنَ وَأَصْلَحَ فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', '...Barangsiapa beriman dan mengadakan perbaikan, maka tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, perbaikan diri, ketenangan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(21, 7, 35, 'فَمَنِ اتَّقَىٰ وَأَصْلَحَ فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', '...Barangsiapa bertakwa dan mengadakan perbaikan, tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, takwa, kedamaian', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(22, 41, 30, 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا', 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka dengan mengatakan: \'Janganlah kamu takut dan janganlah merasa sedih...\'', 'Al-Qur\'an', 'sedih, istiqamah, kabar gembira', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(23, 35, 34, 'وَقَالُوا الْحَمْدُ لِلَّهِ الَّذِي أَذْهَبَ عَنَّا الْحَزَنَ ۖ إِنَّ رَبَّنَا لَغَفُورٌ شَكُورٌ', 'Dan mereka berkata: \'Segala puji bagi Allah yang telah menghilangkan duka cita dari kami. Sesungguhnya Tuhan kami benar-benar Maha Pengampun lagi Maha Mensyukuri.\'', 'Al-Qur\'an', 'sedih, duka cita, surga', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(24, 94, 5, 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Maka sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'kesulitan, kemudahan, optimisme', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(25, 94, 6, 'إِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'kesulitan, kemudahan, janji Allah', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(26, 2, 153, 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ', 'Wahai orang-orang yang beriman! Mohonlah pertolongan (kepada Allah) dengan sabar dan salat. Sungguh, Allah beserta orang-orang yang sabar.', 'Al-Qur\'an', 'sabar, salat, kesusahan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(27, 2, 155, 'وَلَنَبْلُوَنَّكُمْ بِشَيْءٍ مِنَ الْخَوْفِ وَالْجُوعِ وَنَقْصٍ مِنَ الْأَمْوَالِ وَالْأَنْفُسِ وَالثَّمَرَاتِ ۗ وَبَشِّرِ الصَّابِرِينَ', 'Dan Kami pasti akan menguji kamu dengan sedikit ketakutan, kelaparan, kekurangan harta, jiwa, dan buah-buahan. Dan sampaikanlah kabar gembira kepada orang-orang yang sabar.', 'Al-Qur\'an', 'ujian, musibah, sabar', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(28, 2, 156, 'الَّذِينَ إِذَا أَصَابَتْهُمْ مُصِيبَةٌ قَالُوا إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ', '(yaitu) orang-orang yang apabila ditimpa musibah, mereka berkata: \'Inna lillahi wa inna ilaihi raji\'un\' (Sesungguhnya kami milik Allah dan kepada-Nyalah kami kembali).', 'Al-Qur\'an', 'musibah, keikhlosan, istirja', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(29, 2, 286, 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا', 'Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya.', 'Al-Qur\'an', 'ujian, beban, kemudahan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(30, 65, 7, 'سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا', 'Allah kelak akan memberikan kelapangan setelah kesempitan.', 'Al-Qur\'an', 'harapan, kesempitan, kelapangan', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(31, 93, 3, 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ', 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.', 'Al-Qur\'an', 'penenang, kasih sayang, kesepian', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(32, 21, 87, 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ', 'Maka dia berdoa dalam keadaan yang sangat gelap: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'', 'Al-Qur\'an', 'doa, kesusahan, taubat', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(33, 3, 153, 'لِكَيْ لَا تَحْزَنُوا عَلَىٰ مَا فَاتَكُمْ وَلَا مَا أَصَابَكُمْ', '...agar kamu tidak bersedih hati terhadap apa yang luput dari kamu dan terhadap apa yang menimpa kamu...', 'Al-Qur\'an', 'sedih, takdir, ikhlas', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(34, 57, 23, 'لِكَيْ لَا تَأْسَوْا عَلَىٰ مَا فَاتَكُمْ وَلَا تَفْرَحُوا بِمَا آتَاكُمْ', 'Agar kamu tidak bersedih hati terhadap apa yang luput dari kamu, dan jangan pula terlalu bergembira terhadap apa yang diberikan-Nya kepadamu...', 'Al-Qur\'an', 'sedih, lapang dada, qada dan qadar', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(35, 13, 28, 'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ', 'Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.', 'Al-Qur\'an', 'zikir, penenang hati, gelisah', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(36, 12, 87, 'وَلَا تَيْأَسُوا مِنْ رَوْحِ اللَّهِ ۖ إِنَّهُ لَا يَيْأَسُ مِنْ رَوْحِ اللَّهِ إِلَّا الْقَوْمُ الْكَافِرُونَ', '...dan jangan kamu berputus asa dari rahmat Allah. Sesungguhnya yang berputus asa dari rahmat Allah, hanyalah kaum yang kafir.', 'Al-Qur\'an', 'harapan, jangan putus asa, rahmat', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(37, 39, 53, 'قُلْ يَا عِبَادِيَ الَّذِينَ أَسْرَفُوا عَلَىٰ أَنْفُسِهِمْ لَا تَقْنَطُوا مِنْ رَحْمَةِ اللَّهِ', 'Katakanlah: \'Wahai hamba-hamba-Ku yang melampaui batas terhadap diri mereka sendiri, janganlah kamu berputus asa dari rahmat Allah...\'', 'Al-Qur\'an', 'rahmat, ampunan, penghibur', 'approved', NULL, NULL, '2026-07-29 09:43:05', '2026-07-29 09:43:05'),
(38, 9, 40, 'لاَ تَحْزَنْ إِنَّ اللَّهَ مَعَنَا', 'Janganlah engkau berduka cita, sesungguhnya Allah bersama kita.', 'Al-Qur\'an', 'sedih, pertolongan Allah, penenang hati', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(39, 3, 139, 'وَلَا تَهِنُوا وَلَا تَحْزَنُوا وَأَنْتُمُ الْأَعْلَوْنَ إِنْ كُنْتُمْ مُؤْمِنِينَ', 'Janganlah kamu (merasa) lemah, dan jangan (pula) bersedih hati, padahal kamu pun orang-orang yang paling tinggi (derajatnya), jika kamu orang-orang yang beriman.', 'Al-Qur\'an', 'sedih, motivasi, kesabaran', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(40, 12, 86, 'قَالَ إِنَّمَا أَشْكُو بَثِّي وَحُزْنِي إِلَى اللَّهِ', 'Dia (Yakub) menjawab: \'Sesungguhnya hanyalah kepada Allah aku mengadukan kesusahan dan kesedihanku.\'', 'Al-Qur\'an', 'sedih, doa, mengadu kepada Allah', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(41, 12, 84, 'وَتَوَلَّىٰ عَنْهُمْ وَقَالَ يَا أَسَفَىٰ عَلَىٰ يُوسُفَ وَابْيَضَّتْ عَيْنَاهُ مِنَ الْحُزْنِ فَهُوَ كَظِيمٌ', 'Dan dia (Yakub) berpaling dari mereka seraya berkata: \'Aduhai duka citaku terhadap Yusuf,\' dan kedua matanya menjadi putih karena kesedihan dan dia menahan amarahnya.', 'Al-Qur\'an', 'sedih, kerinduan, kehilangan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(42, 10, 62, 'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Ingatlah, sesungguhnya wali-wali Allah itu tidak ada kekhawatiran terhadap mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, ketenangan, wali Allah', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(43, 10, 65, 'وَلَا يَحْزُنْكَ قَوْلُهُمْ ۘ إِنَّ الْعِزَّةَ لِلَّهِ جَمِيعًا', 'Dan janganlah engkau (Muhammad) sedih oleh perkataan mereka. Sesungguhnya kemuliaan itu semuanya milik Allah.', 'Al-Qur\'an', 'sedih, prasangka, perlindungan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(44, 16, 127, 'وَاصْبِرْ وَمَا صَبْرُكَ إِلَّا بِاللَّهِ ۚ وَلَا تَحْزَنْ عَلَيْهِمْ وَلَا تَكُ فِي ضَيْقٍ مِمَّا يَمْكُرُونَ', 'Bersabarlah (hai Muhammad) dan tiadalah kesabaranmu itu melainkan dengan pertolongan Allah dan janganlah kamu bersedih hati terhadap mereka.', 'Al-Qur\'an', 'sabar, sedih, tawakal', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(45, 28, 7, 'وَلَا تَخَافِي وَلَا تَحْزَنِي ۖ إِنَّا رَادُّوهُ إِلَيْكِ وَجَاعِلُوهُ مِنَ الْمُرْسَلِينَ', '...Dan janganlah engkau takut dan janganlah (pula) bersedih hati, karena sesungguhnya Kami akan mengembalikannya kepadamu...', 'Al-Qur\'an', 'sedih, rasa takut, janji Allah', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(46, 28, 13, 'فَرَدَدْنَاهُ إِلَىٰ أُمِّهِ كَيْ تَقَرَّ عَيْنُهَا وَلَا تَحْزَنَ', 'Maka Kami kembalikan dia (Musa) kepada ibunya, agar senang hatinya dan tidak bersedih hati...', 'Al-Qur\'an', 'sedih, kegembiraan, jawaban doa', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(47, 15, 88, 'وَلَا تَمُدَّنَّ عَيْنَيْكَ إِلَىٰ مَا مَتَّعْنَا بِهِ أَزْوَاجًا مِنْهُمْ وَلَا تَحْزَنْ عَلَيْهِمْ', 'Jangan sekali-kali engkau menujukan pandanganmu kepada kenikmatan yang telah Kami berikan kepada beberapa golongan di antara mereka dan jangan engkau bersedih hati terhadap mereka...', 'Al-Qur\'an', 'sedih, qana\'ah, ketenangan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(48, 2, 38, 'فَمَنْ تَبِعَ هُدَايَ فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', '...Barangsiapa mengikuti petunjuk-Ku, tidak ada kekhawatiran atas mereka, dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, petunjuk, hidayah', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(49, 2, 112, 'بَلَىٰ مَنْ أَسْلَمَ وَجْهَهُ لِلَّهِ وَهُوَ مُحْسِنٌ فَلَهُ أَجْرُهُ عِنْدَ رَبِّهِ وَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Tidak! Barangsiapa menyerahkan diri kepada Allah, sedang dia berbuat baik, maka dia mendapat pahala di sisi Tuhannya dan tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, keikhlasan, pahala', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(50, 2, 262, 'الَّذِينَ يُنْفِقُونَ أَمْوَالَهُمْ فِي سَبِيلِ اللَّهِ ثُمَّ لَا يُتْبِعُونَ مَا أَنْفَقُوا مَنًّا وَلَا أَذًى ۙ لَهُمْ أَجْرُهُمْ عِنْدَ رَبِّهِمْ وَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Orang-orang yang menginfakkan hartanya di jalan Allah, kemudian tidak mengiringi apa yang diinfakkannya itu dengan menyebut-nyebutnya dan menyakiti perasaan, mereka mendapat pahala di sisi Tuhan mereka. Tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, sedekah, ketenangan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(51, 2, 274, 'الَّذِينَ يُنْفِقُونَ أَمْوَالَهُمْ بِاللَّيْلِ وَالنَّهَارِ سِرًّا وَعَلَانِيَةً فَلَهُمْ أَجْرُهُمْ عِنْدَ رَبِّهِمْ وَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Orang-orang yang menginfakkan hartanya malam dan siang hari secara tersembunyi maupun terang-terangan, mereka mendapat pahala di sisi Tuhannya. Tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, infak, ketenteraman', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(52, 2, 277, 'إِنَّ الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ وَأَقَامُوا الصَّلَاةَ وَآتَوُا الزَّكَاةَ لَهُمْ أَجْرُهُمْ عِنْدَ رَبِّهِمْ وَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Sungguh, orang-orang yang beriman, mengerjakan kebajikan, melaksanakan salat dan menunaikan zakat, mereka mendapat pahala di sisi Tuhannya. Tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, iman, amal saleh', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(53, 5, 69, 'مَنْ آمَنَ بِاللَّهِ وَالْيَوْمِ الْآخِرِ وَعَمِلَ صَالِحًا فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', '...Barangsiapa beriman kepada Allah, hari kemudian dan berbuat kebajikan, maka tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, iman, ketenangan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(54, 6, 33, 'قَدْ نَعْلَمُ إِنَّهُ لَيَحْزُنُكَ الَّذِي يَقُولُونَ ۖ فَإِنَّهُمْ لَا يُكَذِّبُونَكَ', 'Sungguh, Kami mengetahui bahwa apa yang mereka katakan itu menyedihkan hatimu, (maka janganlah berduka cita) karena sebenarnya mereka bukan mendustakan engkau...', 'Al-Qur\'an', 'sedih, empati, penawar luka', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(55, 6, 48, 'فَمَنْ آمَنَ وَأَصْلَحَ فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', '...Barangsiapa beriman dan mengadakan perbaikan, maka tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, perbaikan diri, ketenangan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(56, 7, 35, 'فَمَنِ اتَّقَىٰ وَأَصْلَحَ فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', '...Barangsiapa bertakwa dan mengadakan perbaikan, tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'sedih, takwa, kedamaian', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(57, 41, 30, 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا', 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka dengan mengatakan: \'Janganlah kamu takut dan janganlah merasa sedih...\'', 'Al-Qur\'an', 'sedih, istiqamah, kabar gembira', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(58, 35, 34, 'وَقَالُوا الْحَمْدُ لِلَّهِ الَّذِي أَذْهَبَ عَنَّا الْحَزَنَ ۖ إِنَّ رَبَّنَا لَغَفُورٌ شَكُورٌ', 'Dan mereka berkata: \'Segala puji bagi Allah yang telah menghilangkan duka cita dari kami. Sesungguhnya Tuhan kami benar-benar Maha Pengampun lagi Maha Mensyukuri.\'', 'Al-Qur\'an', 'sedih, duka cita, surga', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(59, 94, 5, 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Maka sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'kesulitan, kemudahan, optimisme', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(60, 94, 6, 'إِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'kesulitan, kemudahan, janji Allah', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(61, 2, 153, 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ', 'Wahai orang-orang yang beriman! Mohonlah pertolongan (kepada Allah) dengan sabar dan salat. Sungguh, Allah beserta orang-orang yang sabar.', 'Al-Qur\'an', 'sabar, salat, kesusahan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(62, 2, 155, 'وَلَنَبْلُوَنَّكُمْ بِشَيْءٍ مِنَ الْخَوْفِ وَالْجُوعِ وَنَقْصٍ مِنَ الْأَمْوَالِ وَالْأَنْفُسِ وَالثَّمَرَاتِ ۗ وَبَشِّرِ الصَّابِرِينَ', 'Dan Kami pasti akan menguji kamu dengan sedikit ketakutan, kelaparan, kekurangan harta, jiwa, dan buah-buahan. Dan sampaikanlah kabar gembira kepada orang-orang yang sabar.', 'Al-Qur\'an', 'ujian, musibah, sabar', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(63, 2, 156, 'الَّذِينَ إِذَا أَصَابَتْهُمْ مُصِيبَةٌ قَالُوا إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ', '(yaitu) orang-orang yang apabila ditimpa musibah, mereka berkata: \'Inna lillahi wa inna ilaihi raji\'un\' (Sesungguhnya kami milik Allah dan kepada-Nyalah kami kembali).', 'Al-Qur\'an', 'musibah, keikhlosan, istirja', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(64, 2, 286, 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا', 'Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya.', 'Al-Qur\'an', 'ujian, beban, kemudahan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(65, 65, 7, 'سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا', 'Allah kelak akan memberikan kelapangan setelah kesempitan.', 'Al-Qur\'an', 'harapan, kesempitan, kelapangan', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(66, 93, 3, 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ', 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.', 'Al-Qur\'an', 'penenang, kasih sayang, kesepian', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(67, 21, 87, 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ', 'Maka dia berdoa dalam keadaan yang sangat gelap: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'', 'Al-Qur\'an', 'doa, kesusahan, taubat', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(68, 3, 153, 'لِكَيْ لَا تَحْزَنُوا عَلَىٰ مَا فَاتَكُمْ وَلَا مَا أَصَابَكُمْ', '...agar kamu tidak bersedih hati terhadap apa yang luput dari kamu dan terhadap apa yang menimpa kamu...', 'Al-Qur\'an', 'sedih, takdir, ikhlas', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(69, 57, 23, 'لِكَيْ لَا تَأْسَوْا عَلَىٰ مَا فَاتَكُمْ وَلَا تَفْرَحُوا بِمَا آتَاكُمْ', 'Agar kamu tidak bersedih hati terhadap apa yang luput dari kamu, dan jangan pula terlalu bergembira terhadap apa yang diberikan-Nya kepadamu...', 'Al-Qur\'an', 'sedih, lapang dada, qada dan qadar', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(70, 13, 28, 'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ', 'Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.', 'Al-Qur\'an', 'zikir, penenang hati, gelisah', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(71, 12, 87, 'وَلَا تَيْأَسُوا مِنْ رَوْحِ اللَّهِ ۖ إِنَّهُ لَا يَيْأَسُ مِنْ رَوْحِ اللَّهِ إِلَّا الْقَوْمُ الْكَافِرُونَ', '...dan jangan kamu berputus asa dari rahmat Allah. Sesungguhnya yang berputus asa dari rahmat Allah, hanyalah kaum yang kafir.', 'Al-Qur\'an', 'harapan, jangan putus asa, rahmat', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(72, 39, 53, 'قُلْ يَا عِبَادِيَ الَّذِينَ أَسْرَفُوا عَلَىٰ أَنْفُسِهِمْ لَا تَقْنَطُوا مِنْ رَحْمَةِ اللَّهِ', 'Katakanlah: \'Wahai hamba-hamba-Ku yang melampaui batas terhadap diri mereka sendiri, janganlah kamu berputus asa dari rahmat Allah...\'', 'Al-Qur\'an', 'rahmat, ampunan, penghibur', 'approved', NULL, NULL, '2026-07-29 09:43:19', '2026-07-29 09:43:19'),
(73, 13, 28, 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ', '(yaitu) orang-orang yang beriman dan hati mereka menjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.', 'Al-Qur\'an', 'cemas, zikir, penenang hati', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(74, 48, 4, 'هُوَ الَّذِي أَنْزَلَ السَّكِينَةَ فِي قُلُوبِ الْمُؤْمِنِينَ لِيَزْدَادُوا إِيمَانًا مَعَ إِيمَانِهِمْ', 'Dialah yang telah menurunkan ketenangan ke dalam hati orang-orang mukmin untuk menambah iman atas iman mereka (yang telah ada).', 'Al-Qur\'an', 'cemas, ketenangan, sakinah', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(75, 9, 40, 'إِلَّا تَنْصُرُوهُ فَقَدْ نَصَرَهُ اللَّهُ إِذْ أَخْرَجَهُ الَّذِينَ كَفَرُوا ثَانِيَ اثْنَيْنِ إِذْ هُمَا فِي الْغَارِ إِذْ يَقُولُ لِصَاحِبِهِ لَا تَحْزَنْ إِنَّ اللَّهَ مَعَنَا ۖ فَأَنْزَلَ اللَّهُ سَكِينَتَهُ عَلَيْهِ', '...ketika dia berkata kepada sahabatnya, \'Janganlah engkau berduka cita, sesungguhnya Allah bersama kita.\' Maka Allah menurunkan ketenangan-Nya kepadanya...', 'Al-Qur\'an', 'cemas, takut, kebersamaan Allah', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(76, 20, 45, 'قَالَا رَبَّنَا إِنَّنَا نَخَافُ أَنْ يَفْرُطَ عَلَيْنَا أَوْ أَنْ يَطْغَىٰ', 'Keduanya berkata: \'Ya Tuhan kami, sungguh kami takut dia (Firaun) akan segera menyiksa kami atau bertindak melampaui batas.\'', 'Al-Qur\'an', 'cemas, rasa takut, mengadu', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(77, 20, 46, 'قَالَ لَا تَخَافَا ۖ إِنَّنِي مَعَكُمَا أَسْمَعُ وَأَرَىٰ', 'Dia (Allah) berfirman: \'Janganlah kamu berdua takut, sesungguhnya Aku bersama kamu berdua, Aku mendengar dan melihat.\'', 'Al-Qur\'an', 'cemas, rasa takut, perlindungan Allah', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(78, 20, 67, 'فَأَوْجَسَ فِي نَفْسِهِ خِيفَةً مُوسَىٰ', 'Maka Musa merasa takut dalam hatinya.', 'Al-Qur\'an', 'cemas, takut, manusiawi', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(79, 20, 68, 'قُلْنَا لَا تَخَفْ إِنَّكَ أَنْتَ الْأَعْلَىٰ', 'Kami berfirman: \'Jangan takut! Sungguh, engkaulah yang unggul (menang).\'', 'Al-Qur\'an', 'cemas, penguat hati, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(80, 28, 10, 'وَأَصْبَحَ فُؤَادُ أُمِّ مُوسَىٰ فَارِغًا ۖ إِنْ كَادَتْ لَتُبْدِي بِهِ لَوْلَا أَنْ رَبَطْنَا عَلَىٰ قَلْبِهَا لِتَكُونَ مِنَ الْمُؤْمِنِينَ', 'Dan hati ibu Musa menjadi kosong (karena cemas). Sungguh, hampir saja dia menyatakan rahasia tentang Musa, seandainya tidak Kami teguhkan hatinya agar dia termasuk orang-orang yang beriman.', 'Al-Qur\'an', 'cemas, kekhawatiran, keteguhan hati', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(81, 10, 62, 'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Ingatlah, sesungguhnya wali-wali Allah itu tidak ada kekhawatiran/rasa takut terhadap mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'cemas, wali Allah, kedamaian', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(82, 2, 38, 'فَمَنْ تَبِعَ هُدَايَ فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', '...Barangsiapa mengikuti petunjuk-Ku, tidak ada rasa takut (cemas) atas mereka, dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'cemas, petunjuk Allah, kedamaian', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(83, 70, 19, 'إِنَّ الْإِنْسَانَ خُلِقَ هَلُوعًا', 'Sungguh, manusia diciptakan bersifat keluh kesah lagi kikir.', 'Al-Qur\'an', 'cemas, gelisah, sifat manusia', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(84, 70, 20, 'إِذَا مَسَّهُ الشَّرُّ جَزُوعًا', 'Apabila dia ditimpa kesusahan dia berselisih/gelisah (cemas).', 'Al-Qur\'an', 'cemas, gelisah, kesusahan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(85, 70, 22, 'إِلَّا الْمُصَلِّينَ', 'kecuali orang-orang yang melaksanakan salat,', 'Al-Qur\'an', 'cemas, penawar gelisah, salat', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(86, 21, 87, 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ', 'Maka dia (Yunus) berdoa dalam kegelapan yang berlapis-lapis: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'', 'Al-Qur\'an', 'cemas, doa kesesakan, Nabi Yunus', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(87, 21, 88, 'فَاسْتَجَبْنَا لَهُ وَنَجَّيْنَاهُ مِنَ الْغَمِّ ۚ وَكَذَٰلِكَ نُنْجِي الْمُؤْمِنِينَ', 'Maka Kami kabulkan doanya dan Kami selamatkan dia dari duka cita/kecemasan. Dan demikianlah Kami menyelamatkan orang-orang yang beriman.', 'Al-Qur\'an', 'cemas, penderitaan, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(88, 106, 4, 'الَّذِي أَطْعَمَهُمْ مِنْ جُوعٍ وَآمَنَهُمْ مِنْ خَوْفٍ', 'Yang telah memberi makanan kepada mereka untuk menghilangkan lapar dan mengamankan mereka dari rasa takut (kecemasan).', 'Al-Qur\'an', 'cemas, rasa aman, rezeki', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(89, 33, 10, 'إِذْ جَاءُوكُمْ مِنْ فَوْقِكُمْ وَمِنْ أَسْفَلَ مِنْكُمْ وَإِذْ زَاغَتِ الْأَبْصَارُ وَبَلَغَتِ الْقُلُوبُ الْحَنَاجِرَ', 'Ketika mereka datang kepadamu dari atas dan dari bawahmu, dan ketika penglihatanmu terpana dan hatimu menyesak sampai ke tenggorokan (sangat cemas)...', 'Al-Qur\'an', 'cemas, ujian berat, ketakutan hebat', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(90, 33, 11, 'هُنَالِكَ ابْتُلِيَ الْمُؤْمِنُونَ وَزُلْزِلُوا زِلْزَالًا شَدِيدًا', 'Di situlah diuji orang-orang mukmin dan digoncangkan (hatinya) dengan goncangan yang dahsyat.', 'Al-Qur\'an', 'cemas, ujian, kepanikan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(91, 3, 173, 'الَّذِينَ قَالَ لَهُمُ النَّاسُ إِنَّ النَّاسَ قَدْ جَمَعُوا لَكُمْ فَاخْشَوْهُمْ فَزَادَهُمْ إِيمَانًا وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', '(Yaitu) orang-orang (yang menaati Allah dan Rasul) yang ketika ada orang-orang mengatakan: \'Orang-orang telah mengumpulkan pasukan untuk menyerang kamu, karena itu takutlah kepada mereka,\' ternyata ucapan itu menambah iman mereka dan mereka menjawab: \'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.\'', 'Al-Qur\'an', 'cemas, tawakal, penentram jiwa', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(92, 3, 174, 'فَانْقَلَبُوا بِنِعْمَةٍ مِنَ اللَّهِ وَفَضْلٍ لَمْ يَمْسَسْهُمْ سُوءٌ', 'Maka mereka kembali dengan nikmat dan karunia yang besar dari Allah, mereka tidak ditimpa suatu bencana pun...', 'Al-Qur\'an', 'cemas, rasa aman, perlindungan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(93, 41, 30, 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا وَأَبْشِرُوا بِالْجَنَّةِ الَّتِي كُنْتُمْ تُوعَدُونَ', 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih...\'', 'Al-Qur\'an', 'cemas, ketenangan, malaikat', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(94, 2, 153, 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ', 'Wahai orang-orang yang beriman! Mohonlah pertolongan (kepada Allah) dengan sabar dan salat. Sungguh, Allah beserta orang-orang yang sabar.', 'Al-Qur\'an', 'cemas, salat, solusi', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(95, 94, 5, 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Maka sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'cemas, kemudahan, harapan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(96, 94, 6, 'إِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'cemas, kepastian, kelapangan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(97, 65, 2, 'وَمَنْ يَتَّقِ اللَّهَ يَجْعَلْ لَهُ مَخْرَجًا', '...Barangsiapa bertakwalah kepada Allah niscaya Dia akan membukakan jalan keluar baginya.', 'Al-Qur\'an', 'cemas, jalan keluar, takwa', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(98, 65, 3, 'وَيَرْزُقْهُ مِنْ حَيْثُ لَا يَحْتَسِبُ ۚ وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ', 'Dan Dia memberinya rezeki dari arah yang tidak disangka-sangkanya. Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.', 'Al-Qur\'an', 'cemas, masa depan, tawakal', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(99, 93, 3, 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ', 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.', 'Al-Qur\'an', 'cemas, rasa terasing, penguatan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(100, 93, 4, 'وَلَلْآخِرَةُ خَيْرٌ لَكَ مِنَ الْأُولَىٰ', 'Dan sungguh, yang kemudian itu lebih baik bagimu daripada yang permulaan.', 'Al-Qur\'an', 'cemas, masa depan, optimisme', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(101, 2, 286, 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا', 'Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya.', 'Al-Qur\'an', 'cemas, tekanan hidup, batas kemampuan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(102, 16, 106, 'إِلَّا مَنْ أُكْرِهَ وَقَلْبُهُ مُطْمَئِنٌّ بِالْإِيمَانِ', '...kecuali orang yang dipaksa melakukan kufr sedangkan hatinya tetap tenang dalam beriman...', 'Al-Qur\'an', 'cemas, tekanan, ketenangan iman', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(103, 8, 11, 'إِذْ يُغَشِّيكُمُ النُّعَاسَ أَمَنَةً مِنْهُ وَيُنَزِّلُ عَلَيْكُمْ مِنَ السَّمَاءِ مَاءً لِيُطَهِّرَكُمْ بِهِ وَيُذْهِبَ عَنْكُمْ رِجْزَ الشَّيْطَانِ وَلِيَرْبِطَ عَلَىٰ قُلُوبِكُمْ وَيُثَبِّتَ بِهِ الْأَقْدَامَ', '(Ingatlah) ketika Allah membuat kamu mengantuk untuk memberi ketenangan dari-Nya, dan menurunkan air dari langit kepadamu untuk menyucikan kamu... dan meneguhkan hatimu...', 'Al-Qur\'an', 'cemas, ketenangan, perlindungan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(104, 26, 61, 'فَلَمَّا تَرَاءَى الْجَمْعَانِ قَالَ أَصْحَابُ مُوسَىٰ إِنَّا لَمُدْرَكُونَ', 'Maka ketika kedua golongan itu saling melihat, berkatalah pengikut-pengikut Musa: \'Kita benar-benar akan tersusul!\'', 'Al-Qur\'an', 'cemas, kepanikan, kepungan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(105, 26, 62, 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ', 'Dia (Musa) menjawab: \'Sekali-kali tidak akan tersusul! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'', 'Al-Qur\'an', 'cemas, keyakinan, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(106, 12, 67, 'وَقَالَ يَا بَنِيَّ لَا تَدْخُلُوا مِنْ بَابٍ وَاحِدٍ وَادْخُلُوا مِنْ أَبْوَابٍ مُتَفَرِّقَةٍ ۖ وَمَا أُغْنِي عَنْكُمْ مِنَ اللَّهِ مِنْ شَيْءٍ ۖ إِنِ الْحُكْمُ إِلَّا لِلَّهِ ۖ عَلَيْهِ تَوَكَّلْتُ', 'Dan dia (Yakub) berkata: \'Wahai anak-anakku! Janganlah kamu masuk dari satu pintu gerbang, masuklah dari pintu-pintu gerbang yang berbeda-beda... Kepada-Nyalah aku bertawakal.\'', 'Al-Qur\'an', 'cemas, ikhtiar, tawakal', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(107, 39, 36, 'أَلَيْسَ اللَّهُ بِكَافٍ عَبْدَهُ ۖ وَيُخَوِّفُونَكَ بِالَّذِينَ مِنْ دُونِهِ', 'Bukankah Allah yang mencukupi hamba-Nya? Sedang mereka menakut-nakutimu dengan (penyembahan) selain Allah?', 'Al-Qur\'an', 'cemas, kecukupan, perlindungan', 'approved', NULL, NULL, '2026-07-29 09:50:17', '2026-07-29 09:50:17'),
(108, 13, 28, 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ', '(yaitu) orang-orang yang beriman dan hati mereka menjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.', 'Al-Qur\'an', 'cemas, zikir, penenang hati', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(109, 48, 4, 'هُوَ الَّذِي أَنْزَلَ السَّكِينَةَ فِي قُلُوبِ الْمُؤْمِنِينَ لِيَزْدَادُوا إِيمَانًا مَعَ إِيمَانِهِمْ', 'Dialah yang telah menurunkan ketenangan ke dalam hati orang-orang mukmin untuk menambah iman atas iman mereka (yang telah ada).', 'Al-Qur\'an', 'cemas, ketenangan, sakinah', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(110, 9, 40, 'إِلَّا تَنْصُرُوهُ فَقَدْ نَصَرَهُ اللَّهُ إِذْ أَخْرَجَهُ الَّذِينَ كَفَرُوا ثَانِيَ اثْنَيْنِ إِذْ هُمَا فِي الْغَارِ إِذْ يَقُولُ لِصَاحِبِهِ لَا تَحْزَنْ إِنَّ اللَّهَ مَعَنَا ۖ فَأَنْزَلَ اللَّهُ سَكِينَتَهُ عَلَيْهِ', '...ketika dia berkata kepada sahabatnya, \'Janganlah engkau berduka cita, sesungguhnya Allah bersama kita.\' Maka Allah menurunkan ketenangan-Nya kepadanya...', 'Al-Qur\'an', 'cemas, takut, kebersamaan Allah', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(111, 20, 45, 'قَالَا رَبَّنَا إِنَّنَا نَخَافُ أَنْ يَفْرُطَ عَلَيْنَا أَوْ أَنْ يَطْغَىٰ', 'Keduanya berkata: \'Ya Tuhan kami, sungguh kami takut dia (Firaun) akan segera menyiksa kami atau bertindak melampaui batas.\'', 'Al-Qur\'an', 'cemas, rasa takut, mengadu', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(112, 20, 46, 'قَالَ لَا تَخَافَا ۖ إِنَّنِي مَعَكُمَا أَسْمَعُ وَأَرَىٰ', 'Dia (Allah) berfirman: \'Janganlah kamu berdua takut, sesungguhnya Aku bersama kamu berdua, Aku mendengar dan melihat.\'', 'Al-Qur\'an', 'cemas, rasa takut, perlindungan Allah', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(113, 20, 67, 'فَأَوْجَسَ فِي نَفْسِهِ خِيفَةً مُوسَىٰ', 'Maka Musa merasa takut dalam hatinya.', 'Al-Qur\'an', 'cemas, takut, manusiawi', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(114, 20, 68, 'قُلْنَا لَا تَخَفْ إِنَّكَ أَنْتَ الْأَعْلَىٰ', 'Kami berfirman: \'Jangan takut! Sungguh, engkaulah yang unggul (menang).\'', 'Al-Qur\'an', 'cemas, penguat hati, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(115, 28, 10, 'وَأَصْبَحَ فُؤَادُ أُمِّ مُوسَىٰ فَارِغًا ۖ إِنْ كَادَتْ لَتُبْدِي بِهِ لَوْلَا أَنْ رَبَطْنَا عَلَىٰ قَلْبِهَا لِتَكُونَ مِنَ الْمُؤْمِنِينَ', 'Dan hati ibu Musa menjadi kosong (karena cemas). Sungguh, hampir saja dia menyatakan rahasia tentang Musa, seandainya tidak Kami teguhkan hatinya agar dia termasuk orang-orang yang beriman.', 'Al-Qur\'an', 'cemas, kekhawatiran, keteguhan hati', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(116, 10, 62, 'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Ingatlah, sesungguhnya wali-wali Allah itu tidak ada kekhawatiran/rasa takut terhadap mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'cemas, wali Allah, kedamaian', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(117, 2, 38, 'فَمَنْ تَبِعَ هُدَايَ فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', '...Barangsiapa mengikuti petunjuk-Ku, tidak ada rasa takut (cemas) atas mereka, dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'cemas, petunjuk Allah, kedamaian', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(118, 70, 19, 'إِنَّ الْإِنْسَانَ خُلِقَ هَلُوعًا', 'Sungguh, manusia diciptakan bersifat keluh kesah lagi kikir.', 'Al-Qur\'an', 'cemas, gelisah, sifat manusia', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(119, 70, 20, 'إِذَا مَسَّهُ الشَّرُّ جَزُوعًا', 'Apabila dia ditimpa kesusahan dia berselisih/gelisah (cemas).', 'Al-Qur\'an', 'cemas, gelisah, kesusahan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(120, 70, 22, 'إِلَّا الْمُصَلِّينَ', 'kecuali orang-orang yang melaksanakan salat,', 'Al-Qur\'an', 'cemas, penawar gelisah, salat', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(121, 21, 87, 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ', 'Maka dia (Yunus) berdoa dalam kegelapan yang berlapis-lapis: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'', 'Al-Qur\'an', 'cemas, doa kesesakan, Nabi Yunus', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(122, 21, 88, 'فَاسْتَجَبْنَا لَهُ وَنَجَّيْنَاهُ مِنَ الْغَمِّ ۚ وَكَذَٰلِكَ نُنْجِي الْمُؤْمِنِينَ', 'Maka Kami kabulkan doanya dan Kami selamatkan dia dari duka cita/kecemasan. Dan demikianlah Kami menyelamatkan orang-orang yang beriman.', 'Al-Qur\'an', 'cemas, penderitaan, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(123, 106, 4, 'الَّذِي أَطْعَمَهُمْ مِنْ جُوعٍ وَآمَنَهُمْ مِنْ خَوْفٍ', 'Yang telah memberi makanan kepada mereka untuk menghilangkan lapar dan mengamankan mereka dari rasa takut (kecemasan).', 'Al-Qur\'an', 'cemas, rasa aman, rezeki', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(124, 33, 10, 'إِذْ جَاءُوكُمْ مِنْ فَوْقِكُمْ وَمِنْ أَسْفَلَ مِنْكُمْ وَإِذْ زَاغَتِ الْأَبْصَارُ وَبَلَغَتِ الْقُلُوبُ الْحَنَاجِرَ', 'Ketika mereka datang kepadamu dari atas dan dari bawahmu, dan ketika penglihatanmu terpana dan hatimu menyesak sampai ke tenggorokan (sangat cemas)...', 'Al-Qur\'an', 'cemas, ujian berat, ketakutan hebat', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(125, 33, 11, 'هُنَالِكَ ابْتُلِيَ الْمُؤْمِنُونَ وَزُلْزِلُوا زِلْزَالًا شَدِيدًا', 'Di situlah diuji orang-orang mukmin dan digoncangkan (hatinya) dengan goncangan yang dahsyat.', 'Al-Qur\'an', 'cemas, ujian, kepanikan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(126, 3, 173, 'الَّذِينَ قَالَ لَهُمُ النَّاسُ إِنَّ النَّاسَ قَدْ جَمَعُوا لَكُمْ فَاخْشَوْهُمْ فَزَادَهُمْ إِيمَانًا وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', '(Yaitu) orang-orang (yang menaati Allah dan Rasul) yang ketika ada orang-orang mengatakan: \'Orang-orang telah mengumpulkan pasukan untuk menyerang kamu, karena itu takutlah kepada mereka,\' ternyata ucapan itu menambah iman mereka dan mereka menjawab: \'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.\'', 'Al-Qur\'an', 'cemas, tawakal, penentram jiwa', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(127, 3, 174, 'فَانْقَلَبُوا بِنِعْمَةٍ مِنَ اللَّهِ وَفَضْلٍ لَمْ يَمْسَسْهُمْ سُوءٌ', 'Maka mereka kembali dengan nikmat dan karunia yang besar dari Allah, mereka tidak ditimpa suatu bencana pun...', 'Al-Qur\'an', 'cemas, rasa aman, perlindungan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(128, 41, 30, 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا وَأَبْشِرُوا بِالْجَنَّةِ الَّتِي كُنْتُمْ تُوعَدُونَ', 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih...\'', 'Al-Qur\'an', 'cemas, ketenangan, malaikat', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(129, 2, 153, 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ', 'Wahai orang-orang yang beriman! Mohonlah pertolongan (kepada Allah) dengan sabar dan salat. Sungguh, Allah beserta orang-orang yang sabar.', 'Al-Qur\'an', 'cemas, salat, solusi', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(130, 94, 5, 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Maka sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'cemas, kemudahan, harapan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(131, 94, 6, 'إِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'cemas, kepastian, kelapangan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(132, 65, 2, 'وَمَنْ يَتَّقِ اللَّهَ يَجْعَلْ لَهُ مَخْرَجًا', '...Barangsiapa bertakwalah kepada Allah niscaya Dia akan membukakan jalan keluar baginya.', 'Al-Qur\'an', 'cemas, jalan keluar, takwa', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(133, 65, 3, 'وَيَرْزُقْهُ مِنْ حَيْثُ لَا يَحْتَسِبُ ۚ وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ', 'Dan Dia memberinya rezeki dari arah yang tidak disangka-sangkanya. Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.', 'Al-Qur\'an', 'cemas, masa depan, tawakal', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(134, 93, 3, 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ', 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.', 'Al-Qur\'an', 'cemas, rasa terasing, penguatan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(135, 93, 4, 'وَلَلْآخِرَةُ خَيْرٌ لَكَ مِنَ الْأُولَىٰ', 'Dan sungguh, yang kemudian itu lebih baik bagimu daripada yang permulaan.', 'Al-Qur\'an', 'cemas, masa depan, optimisme', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(136, 2, 286, 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا', 'Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya.', 'Al-Qur\'an', 'cemas, tekanan hidup, batas kemampuan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(137, 16, 106, 'إِلَّا مَنْ أُكْرِهَ وَقَلْبُهُ مُطْمَئِنٌّ بِالْإِيمَانِ', '...kecuali orang yang dipaksa melakukan kufr sedangkan hatinya tetap tenang dalam beriman...', 'Al-Qur\'an', 'cemas, tekanan, ketenangan iman', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(138, 8, 11, 'إِذْ يُغَشِّيكُمُ النُّعَاسَ أَمَنَةً مِنْهُ وَيُنَزِّلُ عَلَيْكُمْ مِنَ السَّمَاءِ مَاءً لِيُطَهِّرَكُمْ بِهِ وَيُذْهِبَ عَنْكُمْ رِجْزَ الشَّيْطَانِ وَلِيَرْبِطَ عَلَىٰ قُلُوبِكُمْ وَيُثَبِّتَ بِهِ الْأَقْدَامَ', '(Ingatlah) ketika Allah membuat kamu mengantuk untuk memberi ketenangan dari-Nya, dan menurunkan air dari langit kepadamu untuk menyucikan kamu... dan meneguhkan hatimu...', 'Al-Qur\'an', 'cemas, ketenangan, perlindungan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(139, 26, 61, 'فَلَمَّا تَرَاءَى الْجَمْعَانِ قَالَ أَصْحَابُ مُوسَىٰ إِنَّا لَمُدْرَكُونَ', 'Maka ketika kedua golongan itu saling melihat, berkatalah pengikut-pengikut Musa: \'Kita benar-benar akan tersusul!\'', 'Al-Qur\'an', 'cemas, kepanikan, kepungan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(140, 26, 62, 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ', 'Dia (Musa) menjawab: \'Sekali-kali tidak akan tersusul! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'', 'Al-Qur\'an', 'cemas, keyakinan, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(141, 12, 67, 'وَقَالَ يَا بَنِيَّ لَا تَدْخُلُوا مِنْ بَابٍ وَاحِدٍ وَادْخُلُوا مِنْ أَبْوَابٍ مُتَفَرِّقَةٍ ۖ وَمَا أُغْنِي عَنْكُمْ مِنَ اللَّهِ مِنْ شَيْءٍ ۖ إِنِ الْحُكْمُ إِلَّا لِلَّهِ ۖ عَلَيْهِ تَوَكَّلْتُ', 'Dan dia (Yakub) berkata: \'Wahai anak-anakku! Janganlah kamu masuk dari satu pintu gerbang, masuklah dari pintu-pintu gerbang yang berbeda-beda... Kepada-Nyalah aku bertawakal.\'', 'Al-Qur\'an', 'cemas, ikhtiar, tawakal', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(142, 39, 36, 'أَلَيْسَ اللَّهُ بِكَافٍ عَبْدَهُ ۖ وَيُخَوِّفُونَكَ بِالَّذِينَ مِنْ دُونِهِ', 'Bukankah Allah yang mencukupi hamba-Nya? Sedang mereka menakut-nakutimu dengan (penyembahan) selain Allah?', 'Al-Qur\'an', 'cemas, kecukupan, perlindungan', 'approved', NULL, NULL, '2026-07-29 09:50:21', '2026-07-29 09:50:21'),
(143, 94, 7, 'فَإِذَا فَرَغْتَ فَانْصَبْ', 'Maka apabila engkau telah selesai (dari suatu urusan), tetaplah bekerja keras (untuk urusan yang lain).', 'Al-Qur\'an', 'lelah, kerja keras, perjuangan', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(144, 94, 8, 'وَإِلَىٰ رَبِّكَ فَارْغَبْ', 'Dan hanya kepada Tuhanmulah engkau berharap.', 'Al-Qur\'an', 'lelah, harapan, tawakal', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(145, 90, 4, 'لَقَدْ خَلَقْنَا الْإِنْسَانَ فِي كَبَدٍ', 'Sungguh, Kami telah menciptakan manusia berada dalam susah payah (keletihan).', 'Al-Qur\'an', 'lelah, hakikat hidup, susah payah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53');
INSERT INTO `quran_verses` (`id`, `surah`, `ayat_number`, `arabic_text`, `translation`, `source`, `tags`, `status`, `reviewer_id`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(146, 18, 62, 'فَلَمَّا جَاوَزَا قَالَ لِفَتَاهُ آتِنَا غَدَاءَنَا لَقَدْ لَقِينَا مِنْ سَفَرِنَا هَٰذَا نَصَبًا', 'Maka ketika mereka telah berjalan lebih jauh, berkatalah Musa kepada pembantunya: \'Bawalah kemari makanan kita; sungguh kita telah merasa sangat letih karena perjalanan kita ini.\'', 'Al-Qur\'an', 'lelah, letih fisik, perjalanan', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(147, 9, 120, 'ذَٰلِكَ بِأَنَّهُمْ لَا يُصِيبُهُمْ ظَمَأٌ وَلَا نَصَبٌ وَلَا مَخْمَصَةٌ فِي سَبِيلِ اللَّهِ... إِلَّا كُتِبَ لَهُمْ بِهِ عَمَلٌ صَالِحٌ', 'Yang demikian itu karena mereka tidak ditimpa kehausan, keletihan, dan kelaparan di jalan Allah... melainkan dituliskan bagi mereka sebagai suatu amal saleh.', 'Al-Qur\'an', 'lelah, pahala, perjuangan di jalan Allah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(148, 35, 35, 'الَّذِي أَحَلَّنَا دَارَ الْمُقَامَةِ مِنْ فَضْلِهِ لَا يَمَسُّنَا فِيهَا نَصَبٌ وَلَا يَمَسُّنَا فِيهَا لُغُوبٌ', 'Yang dengan karunia-Nya menempatkan kami dalam tempat yang kekal (surga); di dalamnya kami tidak merasa lelah dan tidak pula merasa lesu.', 'Al-Qur\'an', 'lelah, surga, tempat istirahat abadi', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(149, 50, 38, 'وَلَقَدْ خَلَقْنَا السَّمَاوَاتِ وَالْأَرْضَ وَمَا بَيْنَهُمَا فِي سِتَّةِ أَيَّامٍ وَمَا مَسَّنَا مِنْ لُغُوبٍ', 'Dan sungguh, Kami telah menciptakan langit dan bumi dan apa yang ada di antara keduanya dalam enam masa, dan Kami tidak ditimpa keletihan sedikit pun.', 'Al-Qur\'an', 'kuasa Allah, tidak lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(150, 78, 9, 'وَجَعَلْنَا نَوْمَكُمْ سُبَاتًا', 'Dan Kami jadikan tidurmu untuk istirahat.', 'Al-Qur\'an', 'lelah, tidur, istirahat', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(151, 78, 10, 'وَجَعَلْنَا اللَّيْلَ لِبَاسًا', 'Dan Kami jadikan malam sebagai pakaian (penutup).', 'Al-Qur\'an', 'lelah, malam, ketenangan', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(152, 25, 47, 'وَهُوَ الَّذِي جَعَلَ لَكُمُ اللَّيْلَ لِبَاسًا وَالنَّوْمَ سُبَاتًا وَجَعَلَ النَّهَارَ نُشُورًا', 'Dialah yang menjadikan malam untukmu (sebagai) pakaian, dan tidur untuk istirahat, dan Dia menjadikan siang untuk bangkit berusaha.', 'Al-Qur\'an', 'lelah, istirahat, kerja', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(153, 28, 73, 'وَمِنْ رَحْمَتِهِ جَعَلَ لَكُمُ اللَّيْلَ وَالنَّهَارَ لِتَسْكُنُوا فِيهِ وَلِتَبْتَغُوا مِنْ فَضْلِهِ وَلَعَلَّكُمْ تَشْكُرُونَ', 'Dan adalah karena rahmat-Nya, Dia jadikan untukmu malam dan siang, agar kamu beristirahat pada malam hari dan agar kamu mencari sebagian dari karunia-Nya (pada siang hari)...', 'Al-Qur\'an', 'lelah, rahmat Allah, ritme hidup', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(154, 2, 286, 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا', 'Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya.', 'Al-Qur\'an', 'lelah, beban hidup, batas kemampuan', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(155, 94, 5, 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Maka sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'lelah, kesulitan, solusi', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(156, 94, 6, 'إِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'lelah, janji Allah, kelapangan', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(157, 29, 69, 'وَالَّذِينَ جَاهَدُوا فِينَا لَنَهْدِيَنَّهُمْ سُبُلَنَا ۚ وَإِنَّ اللَّهَ لَمَعَ الْمُحْسِنِينَ', 'Dan orang-orang yang berjihad (bersungguh-sungguh/mencurahkan tenaga) untuk (mencari keridhaan) Kami, sungguh Kami akan tunjukkan kepada mereka jalan-jalan Kami...', 'Al-Qur\'an', 'lelah, kesungguhan, petunjuk', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(158, 3, 142, 'أَمْ حَسِبْتُمْ أَنْ تَدْخُلُوا الْجَنَّةَ وَلَمَّا يَعْلَمِ اللَّهُ الَّذِينَ جَاهَدُوا مِنْكُمْ وَيَعْلَمَ الصَّابِرِينَ', 'Apakah kamu mengira bahwa kamu akan masuk surga, padahal belum nyata bagi Allah orang-orang yang berjihad di antara kamu dan belum nyata orang-orang yang sabar.', 'Al-Qur\'an', 'lelah, perjuangan, surga', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(159, 2, 214, 'أَمْ حَسِبْتُمْ أَنْ تَدْخُلُوا الْجَنَّةَ وَلَمَّا يَأْتِكُمْ مَثَلُ الَّذِينَ خَلَوْا مِنْ قَبْلِكُمْ ۖ مَسَّتْهُمُ الْبَأْسَاءُ وَالضَّرَّاءُ وَزُلْزِلُوا', 'Apakah kamu mengira bahwa kamu akan masuk surga, padahal belum datang kepadamu (cobaan) seperti orang-orang terdahulu sebelum kamu? Mereka ditimpa kemelaratan, penderitaan dan digoncangkan...', 'Al-Qur\'an', 'lelah, ujian berat, kesabaran', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(160, 2, 153, 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ', 'Wahai orang-orang yang beriman! Mohonlah pertolongan (kepada Allah) dengan sabar dan salat. Sungguh, Allah beserta orang-orang yang sabar.', 'Al-Qur\'an', 'lelah, pemulihan, salat dan sabar', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(161, 53, 39, 'وَأَنْ لَيْسَ لِلْإِنْسَانِ إِلَّا مَا سَعَىٰ', 'Dan bahwa manusia hanya memperoleh apa yang telah diusahakannya.', 'Al-Qur\'an', 'lelah, usaha, hasil', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(162, 53, 40, 'وَأَنَّ سَعْيَهُ سَوْفَ يُرَىٰ', 'Dan bahwa usahanya itu kelak akan diperlihatkan (kepadanya).', 'Al-Qur\'an', 'lelah, balasan usaha, keadilan', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(163, 88, 3, 'عَامِلَةٌ نَاصِبَةٌ', 'Bekerja keras lagi kepayahan (di dunia, namun rugi di akhirat jika tanpa iman).', 'Al-Qur\'an', 'lelah, kerja keras, peringatan', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(164, 88, 8, 'وُجُوهٌ يَوْمَئِذٍ نَاعِمَةٌ', 'Pada hari itu banyak wajah yang berseri-seri,', 'Al-Qur\'an', 'lelah, kebahagiaan akhirat', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(165, 88, 9, 'لِسَعْيِهَا رَاضِيَةٌ', 'merasa puas karena usahanya (yang telah melelahkannya di dunia).', 'Al-Qur\'an', 'lelah, kepuasan usaha, pahala', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(166, 46, 35, 'فَاصْبِرْ كَمَا صَبَرَ أُولُو الْعَزْمِ مِنَ الرُّسُلِ', 'Maka bersabarlah engkau (Muhammad) sebagaimana kesabaran rasul-rasul yang memiliki keteguhan hati...', 'Al-Qur\'an', 'lelah, keteguhan, teladan rasul', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(167, 3, 200, 'يَا أَيُّهَا الَّذِينَ آمَنُوا اصْبِرُوا وَصَابِرُوا وَرَابِطُوا وَاتَّقُوا اللَّهَ لَعَلَّكُمْ تُفْلِحُونَ', 'Wahai orang-orang yang beriman! Bersabarlah kamu dan tingkatkanlah kesabaranmu dan tetaplah bersiap-siap dan bertakwalah kepada Allah agar kamu beruntung.', 'Al-Qur\'an', 'lelah, daya tahan, kemenangan', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(168, 65, 7, 'لِيُنْفِقْ ذُو سَعَةٍ مِنْ سَعَتِهِ ۖ وَمَنْ قُدِرَ عَلَيْهِ رِزْقُهُ فَلْيُنْفِقْ مِمَّا آتَاهُ اللَّهُ ۚ لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا مَا آتَاهَا ۚ سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا', '...Allah tidak membebani seseorang melainkan sesuai dengan apa yang diberikan Allah kepadanya. Allah kelak akan memberikan kelapangan setelah kesempitan.', 'Al-Qur\'an', 'lelah, kelapangan, kadar beban', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(169, 13, 28, 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ', '(yaitu) orang-orang yang beriman dan hati mereka menjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.', 'Al-Qur\'an', 'lelah jiwa, ketenangan, zikir', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(170, 2, 255, 'لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ', '...Tidak mengantuk dan tidak tidur...', 'Al-Qur\'an', 'keagungan Allah, tidak pernah lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(171, 41, 38, 'فَإِنِ اسْتَكْبَرُوا فَالَّذِينَ عِنْدَ رَبِّكَ يُسَبِّحُونَ لَهُ بِاللَّيْلِ وَالنَّهَارِ وَهُمْ لَا يَسْأَمُونَ', 'Jika mereka menyombongkan diri, maka mereka (malaikat) yang di sisi Tuhanmu bertasbih kepada-Nya malam dan siang hari, sedang mereka tidak pernah merasa jemu/lelah.', 'Al-Qur\'an', 'malaikat, ibadah, tidak lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(172, 21, 19, 'وَمَنْ عِنْدَهُ لَا يَسْتَكْبِرُونَ عَنْ عِبَادَتِهِ وَلَا يَسْتَحْسِرُونَ', '...Dan malaikat-malaikat yang di sisi-Nya, mereka tidak merasa angkuh untuk menyembah-Nya dan tidak pula merasa letih.', 'Al-Qur\'an', 'tidak letih, malaikat, ibadah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(173, 21, 20, 'يُسَبِّحُونَ اللَّيْلَ وَالنَّهَارَ لَا يَفْتُرُونَ', 'Mereka bertasbih malam dan siang tiada henti-hentinya (tanpa lelah).', 'Al-Qur\'an', 'konsistensi, bertasbih, tanpa lelah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(174, 20, 2, 'مَا أَنْزَلْنَا عَلَيْكَ الْقُرْآنَ لِتَشْقَىٰ', 'Kami tidak menurunkan Al-Qur\'an ini kepadamu (Muhammad) agar engkau menjadi susah/kepayahan.', 'Al-Qur\'an', 'lelah, kemudahan agama, Al-Qur\'an', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(175, 22, 78, 'وَمَا جَعَلَ عَلَيْكُمْ فِي الدِّينِ مِنْ حَرَجٍ', '...dan Dia tidak menjadikan kamu merasa keberatan/kesukaran dalam agama...', 'Al-Qur\'an', 'lelah, kemudahan, syariat', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(176, 4, 104, 'إِنْ تَكُونُوا تَأْلَمُونَ فَإِنَّهُمْ يَأْلَمُونَ كَمَا تَأْلَمُونَ ۖ وَتَرْجُونَ مِنَ اللَّهِ مَا لَا يَرْجُونَ', '...Jika kamu menderita kesakitan/keletihan, maka sesungguhnya mereka pun menderita kesakitan (pula), sebagaimana kamu menderitanya, sedang kamu mengharapkan dari Allah apa yang tidak mereka harapkan...', 'Al-Qur\'an', 'lelah, pengorbanan, harapan pahala', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(177, 16, 7, 'وَتَحْمِلُ أَثْقَالَكُمْ إِلَىٰ بَلَدٍ لَمْ تَكُونُوا بَالِغِيهِ إِلَّا بِشِقِّ الْأَنْفُسِ', 'Dan ia (hewan ternak) mengangkut beban-bebanmu ke suatu negeri yang kamu tidak sanggup sampaikannya, melainkan dengan kesukaran yang memayahkan diri...', 'Al-Qur\'an', 'lelah, perjalanan, nikmat Allah', 'approved', NULL, NULL, '2026-07-29 09:53:53', '2026-07-29 09:53:53'),
(178, 14, 7, 'وَإِذْ تَأَذَّنَ رَبُّكُمْ لَئِنْ شَكَرْتُمْ لَأَزِيدَنَّكُمْ ۖ وَلَئِنْ كَفَرْتُمْ إِنَّ عَذَابِي لَشَدِيدٌ', 'Ingatlah ketika Tuhanmu memaklumkan, jika kamu bersyukur, Niscaya Kami akan menambah nikmat kepadamu, tetapi jika kamu mengingkari, sungguh azab-Ku sangat berat.', 'Al-Qur\'an', 'syukur, penambahan nikmat, janji Allah', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(179, 2, 152, 'فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُوا لِي وَلَا تَكْفُرُونِ', 'Ingatlah kepada-Ku, Niscaya Aku ingat kepadamu. Bersyukurlah kepada-Ku dan janganlah kamu ingkar.', 'Al-Qur\'an', 'syukur, zikir, perintah bersyukur', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(180, 2, 172, 'يَا أَيُّهَا الَّذِينَ آمَنُوا كُلُوا مِنْ طَيِّبَاتِ مَا رَزَقْنَاكُمْ وَاشْكُرُوا لِلَّهِ إِنْ كُنْتُمْ إِيَّاهُ تَعْبُدُونَ', 'Wahai orang-orang yang beriman, makanlah dari rezeki yang baik yang Kami berikan kepadamu dan bersyukurlah kepada Allah jika kamu hanya menyembah kepada-Nya.', 'Al-Qur\'an', 'syukur, rezeki, ibadah', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(181, 31, 12, 'وَلَقَدْ آتَيْنَا لُقْمَانَ الْحِكْمَةَ أَنِ اشْكُرْ لِلَّهِ ۚ وَمَنْ يَشْكُرْ فَإِنَّمَا يَشْكُرُ لِنَفْسِهِ ۖ وَمَنْ كَفَرَ فَإِنَّ اللَّهَ غَنِيٌّ حَمِيدٌ', 'Sungguh, Kami telah memberikan hikmah kepada Luqman, yaitu bersyukurlah kepada Allah. Barangsiapa bersyukur, sesungguhnya dia bersyukur untuk dirinya sendiri.', 'Al-Qur\'an', 'syukur, hikmah, manfaat syukur', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(182, 16, 78, 'وَاللَّهُ أَخْرَجَكُمْ مِنْ بُطُونِ أُمَّهَاتِكُمْ لَا تَعْلَمُونَ شَيْئًا وَجَعَلَ لَكُمُ السَّمْعَ وَالْأَبْصَارَ وَالْأَفْئِدَةَ ۙ لَعَلَّكُمْ تَشْكُرُونَ', 'Allah mengeluarkan kamu dari perut ibumu dalam keadaan tidak mengetahui sesuatu pun, dan Dia memberimu pendengaran, penglihatan, dan hati agar kamu bersyukur.', 'Al-Qur\'an', 'syukur, nikmat penciptaan, panca indra', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(183, 16, 114, 'فَكُلُوا مِمَّا رَزَقَكُمُ اللَّهُ حَلَالًا طَيِّبًا وَاشْكُرُوا نِعْمَتَ اللَّهِ إِنْ كُنْتُمْ إِيَّاهُ تَعْبُدُونَ', 'Makanlah rezeki yang halal lagi baik yang telah Allah berikan kepadamu, dan syukurilah nikmat Allah jika kamu hanya menyembah kepada-Nya.', 'Al-Qur\'an', 'syukur, rezeki halal, ibadah', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(184, 16, 53, 'وَمَا بِكُمْ مِنْ نِعْمَةٍ فَمِنَ اللَّهِ ۖ ثُمَّ إِذَا مَسَّكُمُ الضُّرُّ فَإِلَيْهِ تَجْأَرُونَ', 'Segala nikmat yang ada padamu adalah dari Allah, kemudian apabila kamu ditimpa kesusahan, hanya kepada-Nyalah kamu memohon pertolongan.', 'Al-Qur\'an', 'syukur, sumber nikmat, pengakuan', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(185, 55, 13, 'فَبِأَيِّ آلَاءِ رَبِّكُمَا تُكَذِّبَانِ', 'Maka nikmat Tuhanmu yang manakah yang kamu dustakan?', 'Al-Qur\'an', 'syukur, nikmat Allah, pengingat', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(186, 93, 11, 'وَأَمَّا بِنِعْمَةِ رَبِّكَ فَحَدِّثْ', 'Dan terhadap nikmat Tuhanmu, hendaklah engkau nyatakan (dengan bersyukur).', 'Al-Qur\'an', 'syukur, tahadduts bin ni\'mah, pernyataan nikmat', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(187, 27, 40, 'هَٰذَا مِنْ فَضْلِ رَبِّي لِيَبْلُوَنِي أَأَشْكُرُ أَمْ أَكْفُرُ ۖ وَمَنْ شَكَرَ فَإِنَّمَا يَشْكُرُ لِنَفْسِهِ', 'Ini termasuk karunia Tuhanku untuk mengujiku, apakah aku bersyukur atau ingkar. Barangsiapa bersyukur, sesungguhnya dia bersyukur untuk kebaikan dirinya sendiri.', 'Al-Qur\'an', 'syukur, ujian karunia, Nabi Sulaiman', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(188, 39, 7, 'إِنْ تَكْفُرُوا فَإِنَّ اللَّهَ غَنِيٌّ عَنْكُمْ ۖ وَلَا يَرْضَىٰ لِعِبَادِهِ الْكُفْرَ ۖ وَإِنْ تَشْكُرُوا يَرْضَهُ لَكُمْ', 'Jika kamu ingkar, sesungguhnya Allah Mahakaya atasmu. Dia tidak meridhai keingkaran hamba-Nya, dan jika kamu bersyukur, Dia meridhai kesyukuranmu itu.', 'Al-Qur\'an', 'syukur, ridha Allah, pilihan hamba', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(189, 3, 144, 'وَسَيَجْزِي اللَّهُ الشَّاكِرِينَ', 'Dan Allah akan memberi balasan kepada orang-orang yang bersyukur.', 'Al-Qur\'an', 'syukur, pahala, balasan Allah', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(190, 3, 145, 'وَمَنْ يُرِدْ ثَوَابَ الْآخِرَةِ نُؤْتِهِ مِنْهَا ۚ وَسَنَجْزِي الشَّاكِرِينَ', 'Barangsiapa menghendaki pahala akhirat, Kami berikan kepadanya. Kami akan memberi balasan kepada orang-orang yang bersyukur.', 'Al-Qur\'an', 'syukur, pahala akhirat, balasan', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(191, 4, 147, 'مَا يَفْعَلُ اللَّهُ بِعَذَابِكُمْ إِنْ شَكَرْتُمْ وَآمَنْتُمْ ۚ وَكَانَ اللَّهُ شَاكِرًا عَلِيمًا', 'Allah tidak akan menyiksamu jika kamu bersyukur dan beriman. Allah Maha Mensyukuri lagi Maha Mengetahui.', 'Al-Qur\'an', 'syukur, keselamatan, iman', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(192, 35, 30, 'لِيُوَفِّيَهُمْ أُجُورَهُمْ وَيَزِيدَهُمْ مِنْ فَضْلِهِ ۚ إِنَّهُ غَفُورٌ شَكُورٌ', 'Agar Allah menyempurnakan pahala mereka dan menambah karunia-Nya. Sesungguhnya Allah Maha Pengampun lagi Maha Mensyukuri.', 'Al-Qur\'an', 'syukur, karunia, Asmaul Husna', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(193, 35, 34, 'وَقَالُوا الْحَمْدُ لِلَّهِ الَّذِي أَذْهَبَ عَنَّا الْحَزَنَ ۖ إِنَّ رَبَّنَا لَغَفُورٌ شَكُورٌ', 'Mereka berkata, Segala puji bagi Allah yang telah menghilangkan duka cita dari kami. Sesungguhnya Tuhan kami Maha Pengampun lagi Maha Mensyukuri.', 'Al-Qur\'an', 'syukur, pujian, surga', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(194, 64, 17, 'إِنْ تُقْرِضُوا اللَّهَ قَرْضًا حَسَنًا يُضَاعِفْهُ لَكُمْ وَيَغْفِرْ لَكُمْ ۚ وَاللَّهُ شَكُورٌ حَلِيمٌ', 'Jika kamu meminjamkan kepada Allah pinjaman yang baik, Niscaya Dia melipatgandakan balasannya dan mengampunimu. Allah Maha Mensyukuri lagi Maha Penyantun.', 'Al-Qur\'an', 'syukur, sedekah, kelipatan pahala', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(195, 42, 23, 'وَمَنْ يَقْتَرِفْ حَسَنَةً نَزِدْ لَهُ فِيهَا حُسْنًا ۚ إِنَّ اللَّهَ غَفُورٌ شَكُورٌ', 'Siapa yang mengerjakan kebaikan, Kami tambahkan kebaikan baginya. Sesungguhnya Allah Maha Pengampun lagi Maha Mensyukuri.', 'Al-Qur\'an', 'syukur, kebaikan, penambahan pahala', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(196, 100, 6, 'إِنَّ الْإِنْسَانَ لِرَبِّهِ لَكَنُودٌ', 'Sesungguhnya manusia itu sangat ingkar (tidak bersyukur) kepada Tuhannya.', 'Al-Qur\'an', 'syukur, kelalaian manusia', 'approved', NULL, NULL, '2026-07-29 09:56:20', '2026-07-29 09:56:20'),
(197, 9, 40, 'لاَ تَحْزَنْ إِنَّ اللَّهَ مَعَنَا', 'Janganlah engkau berduka cita, sesungguhnya Allah bersama kita.', 'Al-Qur\'an', 'kesepian, pertolongan Allah, penenang hati', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(198, 50, 16, 'وَنَحْنُ أَقْرَبُ إِلَيْهِ مِنْ حَبْلِ الْوَرِيدِ', 'Dan Kami lebih dekat kepadanya daripada urat lehernya sendiri.', 'Al-Qur\'an', 'kesepian, kedekatan Allah, penentram jiwa', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(199, 2, 186, 'وَإِذَا سَأَلَكَ عِبَادِي عَنِّي فَإِنِّي قَرِيبٌ ۖ أُجِيبُ دَعْوَةَ الدَّاعِ إِذَا دَعَانِ', 'Dan apabila hamba-hamba-Ku bertanya kepadamu tentang Aku, maka (jawablah), bahwasanya Aku adalah dekat. Aku mengabulkan permohonan orang yang berdoa apabila ia berdoa kepada-Ku...', 'Al-Qur\'an', 'kesepian, kedekatan Allah, doa', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(200, 93, 3, 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ', 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.', 'Al-Qur\'an', 'kesepian, merasa ditinggalkan, kasih sayang Allah', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(201, 21, 89, 'وَزَكَرِيَّا إِذْ نَادَىٰ رَبَّهُ رَبِّ لَا تَذَرْنِي فَرْدًا وَأَنْتَ خَيْرُ الْوَارِثِينَ', 'Dan (ingatlah kisah) Zakaria, ketika dia berdoa kepada Tuhannya: \'Ya Tuhanku, janganlah Engkau biarkan aku hidup seorang diri (tanpa keturunan) dan Engkaulah Ahli Waris yang paling baik.\'', 'Al-Qur\'an', 'kesepian, Nabi Zakaria, doa mohon teman', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(202, 12, 86, 'قَالَ إِنَّمَا أَشْكُو بَثِّي وَحُزْنِي إِلَى اللَّهِ', 'Dia (Yakub) menjawab: \'Sesungguhnya hanyalah kepada Allah aku mengadukan kesusahan dan kesedihanku...\'', 'Al-Qur\'an', 'kesepian, mengadu kepada Allah, Nabi Yakub', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(203, 20, 46, 'قَالَ لَا تَخَافَا ۖ إِنَّنِي مَعَكُمَا أَسْمَعُ وَأَرَىٰ', 'Dia (Allah) berfirman: \'Janganlah kamu berdua takut, sesungguhnya Aku bersama kamu berdua, Aku mendengar dan melihat.\'', 'Al-Qur\'an', 'kesepian, kebersamaan Allah, penentram', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(204, 57, 4, 'وَهُوَ مَعَكُمْ أَيْنَ مَا كُنْتُمْ ۚ وَاللَّهُ بِمَا تَعْمَلُونَ بَصِيرٌ', 'Dan Dia bersama kamu di mana saja kamu berada. Dan Allah Maha Melihat apa yang kamu kerjakan.', 'Al-Qur\'an', 'kesepian, kebersamaan Allah, pengawasan', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(205, 58, 7, 'مَا يَكُونُ مِنْ نَجْوَىٰ ثَلَاثَةٍ إِلَّا هُوَ رَابِعُهُمْ وَلَا خَمْسَةٍ إِلَّا هُوَ سَادِسُهُمْ وَلَا أَدْنَىٰ مِنْ ذَٰلِكَ وَلَا أَكْثَرَ إِلَّا هُوَ مَعَهُمْ أَيْنَ مَا كَانُوا', 'Tidak ada pembicaraan rahasia antara tiga orang, melainkan Dialah yang keempatnya. Dan tidak ada (pembicaraan antara) lima orang, melainkan Dialah yang keenamnya. Dan tidak ada yang kurang dari itu atau lebih banyak, melainkan Dia pasti ada bersama mereka di mana pun mereka berada...', 'Al-Qur\'an', 'kesepian, tidak sendirian, hadirnya Allah', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(206, 13, 28, 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ', '(yaitu) orang-orang yang beriman dan hati mereka menjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.', 'Al-Qur\'an', 'kesepian, zikir, ketenangan hati', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(207, 94, 8, 'وَإِلَىٰ رَبِّكَ فَارْغَبْ', 'Dan hanya kepada Tuhanmulah engkau berharap.', 'Al-Qur\'an', 'kesepian, sandaran jiwa, harapan', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(208, 3, 173, 'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', 'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.', 'Al-Qur\'an', 'kesepian, kecukupan, tawakal', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(209, 39, 36, 'أَلَيْسَ اللَّهُ بِكَافٍ عَبْدَهُ', 'Bukankah Allah yang mencukupi hamba-Nya?', 'Al-Qur\'an', 'kesepian, kecukupan, penenang', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(210, 65, 3, 'وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ', 'Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.', 'Al-Qur\'an', 'kesepian, tawakal, kecukupan', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(211, 9, 129, 'فَإِنْ تَوَلَّوْا فَقُلْ حَسْبِيَ اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ ۖ عَلَيْهِ تَوَكَّلْتُ ۖ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ', 'Maka jika mereka berpaling (meninggalkanmu), katakanlah: \'Cukuplah Allah bagiku; tidak ada tuhan selain Dia. Hanya kepada-Nya aku bertawakal, dan Dia adalah Tuhan yang memiliki \'Arsy yang agung.\'', 'Al-Qur\'an', 'kesepian, ditinggalkan, tawakal', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(212, 21, 87, 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ', 'Maka dia (Yunus) berdoa dalam kegelapan yang berlapis-lapis: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'', 'Al-Qur\'an', 'kesepian, krisis jiwa, Nabi Yunus', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(213, 21, 88, 'فَاسْتَجَبْنَا لَهُ وَنَجَّيْنَاهُ مِنَ الْغَمِّ ۚ وَكَذَٰلِكَ نُنْجِي الْمُؤْمِنِينَ', 'Maka Kami kabulkan doanya dan Kami selamatkan dia dari duka cita/kesesakan. Dan demikianlah Kami menyelamatkan orang-orang yang beriman.', 'Al-Qur\'an', 'kesepian, penyelamatan, penderitaan', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(214, 28, 24, 'رَبِّ إِنِّي لِمَا أَنْزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ', '(Musa berdoa): \'Ya Tuhanku, sesungguhnya aku sangat memerlukan sesuatu kebaikan (kebutuhan) yang Engkau turunkan kepadaku.\'', 'Al-Qur\'an', 'kesepian, Nabi Musa, pengaduan', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(215, 26, 62, 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ', 'Dia (Musa) menjawab: \'Sekali-kali tidak! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'', 'Al-Qur\'an', 'kesepian, keyakinan, pendampingan Allah', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(216, 28, 10, 'وَأَصْبَحَ فُؤَادُ أُمِّ مُوسَىٰ فَارِغًا ۖ إِنْ كَادَتْ لَتُبْدِي بِهِ لَوْلَا أَنْ رَبَطْنَا عَلَىٰ قَلْبِهَا', 'Dan hati ibu Musa menjadi hampa (merasa sangat kehilangan). Sungguh, hampir saja dia menyatakan rahasia tentang Musa, seandainya tidak Kami teguhkan hatinya...', 'Al-Qur\'an', 'kesepian, kehampaan hati, peneguh jiwa', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(217, 8, 63, 'وَأَلَّفَ بَيْنَ قُلُوبِهِمْ ۚ لَوْ أَنْفَقْتَ مَا فِي الْأَرْضِ جَمِيعًا مَا أَلَّفْتَ بَيْنَ قُلُوبِهِمْ وَلَٰكِنَّ اللَّهَ أَلَّفَ بَيْنَهُمْ', 'Dan Dialah yang mempersatukan hati mereka (orang-orang yang beriman). Walaupun engkau menginfakkan semua yang ada di bumi, niscaya engkau tidak dapat mempersatukan hati mereka, tetapi Allah telah mempersatukan hati mereka...', 'Al-Qur\'an', 'kesepian, kehangatan ukhuwah, pemersatu hati', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(218, 49, 10, 'إِنَّمَا الْمُؤْمِنُونَ إِخْوَةٌ', 'Orang-orang beriman itu sesungguhnya bersaudara...', 'Al-Qur\'an', 'kesepian, persaudaraan, ukhuwah', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(219, 41, 30, 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا', 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih...\'', 'Al-Qur\'an', 'kesepian, malaikat, penenang', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(220, 10, 62, 'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Ingatlah, sesungguhnya wali-wali Allah itu tidak ada kekhawatiran/rasa takut terhadap mereka dan tidak (pula) mereka merasa sedih.', 'Al-Qur\'an', 'kesepian, wali Allah, kedamaian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(221, 6, 33, 'قَدْ نَعْلَمُ إِنَّهُ لَيَحْزُنُكَ الَّذِي يَقُولُونَ', 'Sungguh, Kami mengetahui bahwa apa yang mereka katakan itu menyedihkan (dan memojokkan) hatimu...', 'Al-Qur\'an', 'kesepian, empati Allah, penguat Nabi', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(222, 15, 97, 'وَلَقَدْ نَعْلَمُ أَنَّكَ يَضِيقُ صَدْرُكَ بِمَا يَقُولُونَ', 'Dan sungguh, Kami mengetahui bahwa dadamu menjadi sempit (merasa tertekan/terasing) disebabkan apa yang mereka katakan.', 'Al-Qur\'an', 'kesepian, penyempitan dada, pengakuan Allah', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(223, 15, 98, 'فَسَبِّحْ بِحَمْدِ رَبِّكَ وَكُنْ مِنَ السَّاجِدِينَ', 'Maka bertasbihlah dengan memuji Tuhanmu dan jadilah engkau di antara orang-orang yang bersujud (salat).', 'Al-Qur\'an', 'kesepian, solusi kesepian, tasbih dan sujud', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(224, 15, 99, 'وَاعْبُدْ رَبَّكَ حَتَّىٰ يَأْتِيَكَ الْيَقِينُ', 'Dan sembahlah Tuhanmu sampai datang kepadamu yang diyakini (ajal).', 'Al-Qur\'an', 'kesepian, istiqamah, ibadah', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(225, 4, 45, 'وَكَفَىٰ بِاللَّهِ وَلِيًّا وَكَفَىٰ بِاللَّهِ نَصِيرًا', 'Dan cukuplah Allah menjadi Pelindung, dan cukuplah Allah menjadi Penolong (bagimu).', 'Al-Qur\'an', 'kesepian, pelindung sejati, pertolongan', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(226, 11, 113, 'وَمَا لَكُمْ مِنْ دُونِ اللَّهِ مِنْ أَوْلِيَاءَ ثُمَّ لَا تُنْصَرُونَ', '...Dan kamu tidak mempunyai seorang pelindung pun selain Allah, kemudian kamu tidak akan diberi pertolongan.', 'Al-Qur\'an', 'kesepian, pelindung sejati, penyerahan', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(227, 29, 22, 'وَمَا لَكُمْ مِنْ دُونِ اللَّهِ مِنْ وَلِيٍّ وَلَا نَصِيرٍ', '...Dan kamu tidak memperoleh seorang pelindung dan tidak (pula) seorang penolong selain Allah.', 'Al-Qur\'an', 'kesepian, ketauhidan, penyandaran diri', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(228, 2, 257, 'اللَّهُ وَلِيُّ الَّذِينَ آمَنُوا يُخْرِجُهُمْ مِنَ الظُّلُمَاتِ إِلَى النُّورِ', 'Allah adalah Pelindung orang-orang yang beriman; Dia mengeluarkan mereka dari kegelapan (kegelisahan/kesepian) kepada cahaya (terang)...', 'Al-Qur\'an', 'kesepian, kegelapan jiwa, pencerahan', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(229, 25, 74, 'رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ', 'Ya Tuhan kami, anugerahkanlah kepada kami pasangan kami dan keturunan kami sebagai penyenang hati (penghilang sepi)...', 'Al-Qur\'an', 'kesepian, doa pasangan, penyenang hati', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(230, 30, 21, 'وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُمْ مِنْ أَنْفُسِكُمْ أَزْوَاجًا لِتَسْكُنُوا إِلَيْهَا وَجَعَلَ بَيْنَكُمْ مَوَدَّةً وَرَحْمَةً', 'Dan di antara tanda-tanda kekuasaan-Nya ialah Dia menciptakan untukmu pasangan dari jenismu sendiri, supaya kamu cenderung dan merasa tenteram kepadanya, dan dijadikan-Nya di antaramu rasa kasih dan sayang...', 'Al-Qur\'an', 'kesepian, ketenangan, kasih sayang', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(231, 4, 1, 'يَا أَيُّهَا النَّاسُ اتَّقُوا رَبَّكُمُ الَّذِي خَلَقَكُمْ مِنْ نَفْسٍ وَاحِدَةٍ وَخَلَقَ مِنْهَا زَوْجَهَا', 'Wahai manusia! Bertakwalah kepada Tuhanmu yang telah menciptakan kamu dari diri yang satu (Adam), dan darinya Allah menciptakan pasangannya...', 'Al-Qur\'an', 'kesepian, penciptaan, ketiadaan kesendirian', 'approved', NULL, NULL, '2026-07-29 09:58:37', '2026-07-29 09:58:37'),
(232, 3, 134, 'الَّذِينَ يُنْفِقُونَ فِي السَّرَّاءِ وَالضَّرَّاءِ وَالْكَاظِمِينَ الْغَيْظَ وَالْعَافِينَ عَنِ النَّاسِ ۗ وَاللَّهُ يُحِبُّ الْمُحْسِنِينَ', '(yaitu) orang-orang yang menginfakkan (hartanya), baik di waktu lapang maupun sempit, dan orang-orang yang menahan amarahnya dan memaafkan (kesalahan) orang lain. Dan Allah menyukai orang-orang yang berbuat kebaikan.', 'Al-Qur\'an', 'marah, menahan amarah, memaafkan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(233, 3, 159, 'فَبِمَا رَحْمَةٍ مِنَ اللَّهِ لِنْتَ لَهُمْ ۖ وَلَوْ كُنْتَ فَظًّا غَلِيظَ الْقَلْبِ لَانْفَضُّوا مِنْ حَوْلِكَ', 'Maka berkat rahmat Allah engkau (Muhammad) berlaku lemah lembut terhadap mereka. Sekiranya engkau bersikap keras dan berhati kasar (mudah marah), tentulah mereka menjauhkan diri dari sekitarmu.', 'Al-Qur\'an', 'marah, lemah lembut, adab', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(234, 42, 37, 'وَالَّذِينَ يَجْتَنِبُونَ كَبَائِرَ الْإِثْمِ وَالْفَوَاحِشَ وَإِذَا مَا غَضِبُوا هُمْ يَغْفِرُونَ', 'Dan (juga bagi) orang-orang yang menjauhi dosa-dosa besar dan perbuatan-perbuatan keji, dan apabila mereka marah mereka memberi maaf.', 'Al-Qur\'an', 'marah, ampunan, memaafkan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(235, 42, 40, 'وَجَزَاءُ سَيِّئَةٍ سَيِّئَةٌ مِثْلُهَا ۖ فَمَنْ عَفَا وَأَصْلَحَ فَأَجْرُهُ عَلَى اللَّهِ', 'Dan balasan suatu kejahatan adalah kejahatan yang serupa, maka barangsiapa memaafkan dan berbuat baik maka pahalanya atas (tanggungan) Allah.', 'Al-Qur\'an', 'marah, balasan, memaafkan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(236, 41, 34, 'وَلَا تَسْتَوِي الْحَسَنَةُ وَلَا السَّيِّئَةُ ۚ ادْفَعْ بِالَّتِي هِيَ أَحْسَنُ فَإِذَا الَّذِي بَيْنَكَ وَبَيْنَهُ عَدَاوَةٌ كَأَنَّهُ وَلِيٌّ حَمِيمٌ', 'Dan tidak sama kebaikan dengan kejahatan. Tolaklah (kejahatan itu) dengan cara yang lebih baik, sehingga orang yang ada rasa permusuhan antara engkau dan dia akan seperti teman yang setia.', 'Al-Qur\'an', 'marah, meredam emosi, kebaikan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(237, 7, 150, 'وَلَمَّا رَجَعَ مُوسَىٰ إِلَىٰ قَوْمِهِ غَضْبَانَ أَسِفًا قَالَ بِئْسَمَا خَلَفْتُمُونِي مِنْ بَعْدِي', 'Dan ketika Musa telah kembali kepada kaumnya, dengan marah dan sedih hati berkatalah dia: \'Alangkah buruknya perbuatan yang kamu kerjakan sesudah kepergianku!\'', 'Al-Qur\'an', 'marah, Nabi Musa, emosi manusiawi', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(238, 7, 154, 'وَلَمَّا سَكَتَ عَنْ مُوسَى الْغَضَبُ أَخَذَ الْأَلْوَاحَ', 'Dan setelah amarah Musa mereda, diambilnya (kembali) luh-luh (Taurat) itu...', 'Al-Qur\'an', 'marah, reda amarah, Nabi Musa', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(239, 7, 199, 'خُذِ الْعَفْوَ وَأْمُرْ بِالْعُرْفِ وَأَعْرِضْ عَنِ الْجَاهِلِينَ', 'Jadilah pemaaf dan suruhlah orang mengerjakan yang makruf, serta jangan pedulikan orang-orang yang bodoh.', 'Al-Qur\'an', 'marah, pemaaf, kesabaran', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(240, 7, 200, 'وَإِمَّا يَنْزَغَنَّكَ مِنَ الشَّيْطَانِ نَزْغٌ فَاسْتَعِذْ بِاللَّهِ ۚ إِنَّهُ سَمِيعٌ عَلِيمٌ', 'Dan jika setan datang menggodamu dengan suatu godaan (termasuk emosi/amarah), maka mohonlah perlindungan kepada Allah. Sungguh, Dia Maha Mendengar lagi Maha Mengetahui.', 'Al-Qur\'an', 'marah, godaan setan, ta\'awwudz', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(241, 21, 87, 'وَذَا النُّونِ إِذْ ذَهَبَ مُغَاضِبًا فَظَنَّ أَنْ لَنْ نَقْدِرَ عَلَيْهِ', 'Dan (ingatlah kisah) Dzun Nuun (Yunus), ketika dia pergi dalam keadaan marah, lalu dia menyangka bahwa Kami tidak akan menyulitkannya...', 'Al-Qur\'an', 'marah, Nabi Yunus, pelajaran amarah', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(242, 9, 15, 'وَيُذْهِبْ غَيْظَ قُلُوبِهِمْ ۗ وَيَتُوبُ اللَّهُ عَلَىٰ مَنْ يَشَاءُ', 'Dan menghilangkan kemarahan hati orang-orang yang beriman. Dan Allah menerima taubat orang yang dikehendaki-Nya...', 'Al-Qur\'an', 'marah, penawar amarah, ketenangan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(243, 48, 26, 'إِذْ جَعَلَ الَّذِينَ كَفَرُوا فِي قُلُوبِهِمُ الْحَمِيَّةَ حَمِيَّةَ الْجَاهِلِيَّةِ فَأَنْزَلَ اللَّهِ سَكِينَتَهُ عَلَىٰ رَسُولِهِ', 'Ketika orang-orang yang kafir menanamkan dalam hati mereka kesombongan (yaitu) kesombongan jahiliyah, lalu Allah menurunkan ketenangan kepada Rasul-Nya...', 'Al-Qur\'an', 'marah, emosi jahiliyah, ketenangan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(244, 20, 86, 'فَرَجَعَ مُوسَىٰ إِلَىٰ قَوْمِهِ غَضْبَانَ أَسِفًا', 'Kemudian Musa kembali kepada kaumnya dengan marah dan sedih hati...', 'Al-Qur\'an', 'marah, kekecewaan, Nabi Musa', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(245, 33, 25, 'وَرَدَّ اللَّهُ الَّذِينَ كَفَرُوا بِغَيْظِهِمْ لَمْ يَنَالُوا خَيْرًا', 'Dan Allah menghalau orang-orang kafir itu yang keadaan hatinya penuh kejengkelan (kemarahan), mereka tidak memperoleh keuntungan apa pun...', 'Al-Qur\'an', 'marah, kejengkelan musuh, perlindungan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(246, 5, 8, 'وَلَا يَجْرِمَنَّكُمْ شَنَآنُ قَوْمٍ عَلَىٰ أَلَّا تَعْدِلُوا ۚ اعْدِلُوا هُوَ أَقْرَبُ لِلتَّقْوَىٰ', '...Dan janganlah kebencian/kemarahanmu terhadap suatu kaum, mendorong kamu untuk berlaku tidak adil. Berlaku adillah, karena adil itu lebih dekat kepada takwa...', 'Al-Qur\'an', 'marah, benci, keadilan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(247, 25, 63, 'وَعِبَادُ الرَّحْمَٰنِ الَّذِينَ يَمْشُونَ عَلَى الْأَرْضِ هَوْنًا وَإِذَا خَاطَبَهُمُ الْجَاهِلُونَ قَالُوا سَلَامًا', 'Adapun hamba-hamba Tuhan Yang Maha Pengasih itu adalah orang-orang yang berjalan di bumi dengan rendah hati dan apabila orang-orang bodoh menyapa mereka (dengan kata-kata menghina), mereka mengucapkan \'selamat\'.', 'Al-Qur\'an', 'marah, kesabaran, meredam emosi', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(248, 31, 18, 'وَلَا تُصَعِّرْ خَدَّكَ لِلنَّاسِ وَلَا تَمْشِ فِي الْأَرْضِ مَرَحًا', 'Dan janganlah kamu memalingkan mukamu dari manusia (karena sombong/marah) dan janganlah berjalan di bumi dengan angkuh...', 'Al-Qur\'an', 'marah, adab, kesombongan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(249, 16, 126, 'وَإِنْ عَاقَبْتُمْ فَعَاقِبُوا بِمِثْلِ مَا عُوقِبْتُمْ بِهِ ۖ وَلَئِنْ صَبَرْتُمْ لَهُوَ خَيْرٌ لِلصَّابِرِينَ', 'Dan jika kamu membalas, maka balaslah dengan yang serupa dengan siksaan yang ditimpakan kepadamu. Tetapi jika kamu bersabar, sungguh itu lebih baik bagi orang-orang yang sabar.', 'Al-Qur\'an', 'marah, amarah, balasan adil, sabar', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(250, 64, 14, 'وَإِنْ تَعْفُوا وَتَصْفَحُوا وَتَغْفِرُوا فَإِنَّ اللَّهَ غَفُورٌ رَحِيمٌ', '...Dan jika kamu memaafkan dan kamu santuni serta ampunkan (kesalahan mereka), maka sungguh, Allah Maha Pengampun lagi Maha Penyayang.', 'Al-Qur\'an', 'marah, lapang dada, memaafkan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(251, 2, 109, 'فَاعْفُوا وَاصْفَحُوا حَتَّىٰ يَأْتِيَ اللَّهُ بِأَمْرِهِ', '...Maka maafkanlah dan lapangkanlah dada (jangan menuruti amarah) sampai Allah mendatangkan perintah-Nya...', 'Al-Qur\'an', 'marah, lapang dada, kesabaran', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(252, 24, 22, 'وَلْيَعْفُوا وَلْيَصْفَحُوا ۗ أَلَا تُحِبُّونَ أَنْ يَغْفِرَ اللَّهُ لَكُمْ', '...dan hendaklah mereka memaafkan dan berlapang dada. Apakah kamu tidak suka bahwa Allah mengampunimu?', 'Al-Qur\'an', 'marah, ampunan Allah, memaafkan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(253, 5, 13, 'فَاعْفُ عَنْهُمْ وَاصْفَحْ ۚ إِنَّ اللَّهَ يُحِبُّ الْمُحْسِنِينَ', '...Maka maafkanlah mereka dan biarkanlah mereka, sesungguhnya Allah menyukai orang-orang yang berbuat baik.', 'Al-Qur\'an', 'marah, memaafkan, ihsan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(254, 15, 85, 'فَاصْفَحِ الصَّفْحَ الْجَمِيلَ', 'Maka maafkanlah (mereka) dengan cara yang baik.', 'Al-Qur\'an', 'marah, maaf yang indah, sabar', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(255, 2, 263, 'قَوْلٌ مَعْرُوفٌ وَمَغْفِرَةٌ خَيْرٌ مِنْ صَدَقَةٍ يَتْبَعُهَا أَذًى', 'Perkataan yang baik dan pemberian maaf lebih baik daripada sedekah yang diiringi tindakan yang menyakiti...', 'Al-Qur\'an', 'marah, tutur kata baik, memaafkan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(256, 68, 48, 'فَاصْبِرْ لِحُكْمِ رَبِّكَ وَلَا تَكُنْ كَصَاحِبِ الْحُوتِ إِذْ نَادَىٰ وَهُوَ مَكْظُومٌ', 'Maka bersabarlah engkau (Muhammad) terhadap ketetapan Tuhanmu, dan janganlah engkau seperti orang yang berada dalam (perut) ikan (Yunus) ketika dia berdoa dengan hati penuh duka/amarah yang tertahan.', 'Al-Qur\'an', 'marah, menahan amarah, Nabi Yunus', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(257, 3, 155, 'إِنَّمَا اسْتَزَلَّهُمُ الشَّيْطَانُ بِبَعْضِ مَا كَسَبُوا', '...Sesungguhnya mereka digelincirkan oleh setan (termasuk emosi tak terkontrol), disebabkan sebagian kesalahan yang telah mereka perbuat...', 'Al-Qur\'an', 'marah, godaan setan, kelemahan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(258, 17, 53, 'وَقُلْ لِعِبَادِي يَقُولُوا الَّتِي هِيَ أَحْسَنُ ۚ إِنَّ الشَّيْطَانَ يَنْزَغُ بَيْنَهُمْ', 'Dan katakanlah kepada hamba-hamba-Ku: \'Hendaklah mereka mengucapkan perkataan yang lebih baik (benar). Sungguh, setan itu selalu menimbulkan perselisihan di antara mereka...\'', 'Al-Qur\'an', 'marah, adab berbicara, godaan setan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(259, 20, 44, 'فَقُولَا لَهُ قَوْلًا لَيِّنًا لَعَلَّهُ يَتَذَكَّرُ أَوْ يَخْشَىٰ', 'Maka berbicaralah kamu berdua kepadanya (Firaun) dengan kata-kata yang lemah lembut, mudah-mudahan dia sadar atau takut.', 'Al-Qur\'an', 'marah, kata-kata lembut, kontrol emosi', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(260, 28, 15, 'فَوَكَزَهُ مُوسَىٰ فَقَضَىٰ عَلَيْهِ ۖ قَالَ هَٰذَا مِنْ عَمَلِ الشَّيْطَانِ', '...Maka Musa meninjunya, dan matilah musuhnya itu. Musa berkata: \'Ini adalah perbuatan setan (impulsif/amarah)...\'', 'Al-Qur\'an', 'marah, akibat emosi, perbuatan setan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(261, 12, 100, 'مِنْ بَعْدِ أَنْ نَزَغَ الشَّيْطَانُ بَيْنِي وَبَيْنَ إِخْوَتِي', '...setelah setan merusak (hubungan/merangsang amarah) antara aku dan saudara-saudaraku...', 'Al-Qur\'an', 'marah, adu domba, perpecahan', 'approved', NULL, NULL, '2026-07-29 10:04:47', '2026-07-29 10:04:47'),
(262, 10, 58, 'قُلْ بِفَضْلِ اللَّهِ وَبِرَحْمَتِهِ فَبِذَٰلِكَ فَلْيَفْرَحُوا هُوَ خَيْرٌ مِمَّا يَجْمَعُونَ', 'Katakanlah (Muhammad): \'Dengan karunia Allah dan rahmat-Nya, hendaklah dengan itu mereka bergembira. Itu lebih baik daripada apa yang mereka kumpulkan.\'', 'Al-Qur\'an', 'bahagia, rahmat Allah, karunia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(263, 3, 170, 'فَرِحِينَ بِمَا آتَاهُمُ اللَّهُ مِنْ فَضْلِهِ وَيَسْتَبْشِرُونَ بِالَّذِينَ لَمْ يَلْحَقُوا بِهِمْ مِنْ خَلْفِهِمْ', 'Mereka bergembira dengan karunia yang diberikan Allah kepada mereka, dan bergirang hati terhadap orang-orang yang masih tinggal di belakang yang belum menyusul mereka...', 'Al-Qur\'an', 'bahagia, kegembiraan, karunia Allah', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(264, 30, 4, 'وَيَوْمَئِذٍ يَفْرَحُ الْمُؤْمِنُونَ بِنَصْرِ اللَّهِ', '...Dan pada hari itu bergembiralah orang-orang yang beriman karena pertolongan Allah.', 'Al-Qur\'an', 'bahagia, pertolongan Allah, kemenangan', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(265, 83, 22, 'إِنَّ الْأَبْرَارَ لَفِي نَعِيمٍ', 'Sesungguhnya orang-orang yang berbakti benar-benar berada dalam (surga yang penuh) kenikmatan.', 'Al-Qur\'an', 'bahagia, kenikmatan, surga', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(266, 83, 24, 'تَعْرِفُ فِي وُجُوهِهِمْ نَضْرَةَ النَّعِيمِ', 'Engkau dapat mengenali pada wajah mereka kesenangan hidup yang penuh kenikmatan.', 'Al-Qur\'an', 'bahagia, wajah berseri, kenikmatan', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(267, 88, 8, 'وُجُوهٌ يَوْمَئِذٍ نَاعِمَةٌ', 'Pada hari itu banyak wajah yang berseri-seri,', 'Al-Qur\'an', 'bahagia, wajah berseri, kebahagiaan akhirat', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(268, 88, 9, 'لِسَعْيِهَا رَاضِيَةٌ', 'merasa puas/bahagia karena usahanya,', 'Al-Qur\'an', 'bahagia, kepuasan, balasan amal', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(269, 75, 22, 'وُجُوهٌ يَوْمَئِذٍ نَاضِرَةٌ', 'Wajah-wajah (orang mukmin) pada hari itu berseri-seri,', 'Al-Qur\'an', 'bahagia, kebahagiaan, kenikmatan melihat Allah', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(270, 75, 23, 'إِلَىٰ رَبِّهَا نَاظِرَةٌ', 'memandang kepada Tuhannya.', 'Al-Qur\'an', 'bahagia, nikmat tertinggi, melihat Allah', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(271, 13, 29, 'الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ طُوبَىٰ لَهُمْ وَحُسْنُ مَآبٍ', 'Orang-orang yang beriman dan mengerjakan kebajikan, kebahagiaan (kebajikan/kebahagiaan abadi) bagi mereka dan tempat kembali yang baik.', 'Al-Qur\'an', 'bahagia, kebahagiaan abadi, amal saleh', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(272, 11, 105, 'يَوْمَ يَأْتِ لَا تَكَلَّمُ نَفْسٌ إِلَّا بِإِذْنِهِ ۚ فَمِنْهُمْ شَقِيٌّ وَسَعِيدٌ', 'Ketika hari itu datang, tidak seorang pun yang berbicara melainkan dengan izin-Nya; maka di antara mereka ada yang celaka dan ada yang bahagia.', 'Al-Qur\'an', 'bahagia, sa\'id, akhirat', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(273, 11, 108, 'وَأَمَّا الَّذِينَ سُعِدُوا فَفِي الْجَنَّةِ خَالِدِينَ فِيهَا', 'Adapun orang-orang yang berbahagia, maka tempatnya di dalam surga; mereka kekal di dalamnya...', 'Al-Qur\'an', 'bahagia, surga, kekal', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(274, 94, 1, 'أَلَمْ نَشْرَحْ لَكَ صَدْرَكَ', 'Bukankah Kami telah melapangkan dadamu (Muhammad)?', 'Al-Qur\'an', 'bahagia, lapang dada, ketenangan', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(275, 93, 5, 'وَلَسَوْفَ يُعْطِيكَ رَبُّكَ فَتَرْضَىٰ', 'Dan sungguh, kelak Tuhanmu pasti memberikan karunia-Nya kepadamu, sehingga engkau menjadi puas (bahagia).', 'Al-Qur\'an', 'bahagia, kepuasan, janji Allah', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(276, 13, 28, 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ', '(yaitu) orang-orang yang beriman dan hati mereka menjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram (bahagia).', 'Al-Qur\'an', 'bahagia, ketenangan hati, zikir', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(277, 16, 97, 'مَنْ عَمِلَ صَالِحًا مِنْ ذَكَرٍ أَوْ أُنْثَىٰ وَهُوَ مُؤْمِنٌ فَلَنُحْيِيَنَّهُ حَيَاةً طَيِّبَةً', 'Barangsiapa mengerjakan kebajikan, baik laki-laki maupun perempuan dalam keadaan beriman, maka sungguh akan Kami berikan kepadanya kehidupan yang baik (bahagia)...', 'Al-Qur\'an', 'bahagia, kehidupan yang baik, amal saleh', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(278, 20, 123, 'فَمَنِ اتَّبَعَ هُدَايَ فَلَا يَضِلُّ وَلَا يَشْقَىٰ', '...Lalu barangsiapa mengikuti petunjuk-Ku, dia tidak akan sesat dan tidak akan celaka (akan berbahagia).', 'Al-Qur\'an', 'bahagia, petunjuk Allah, jauh dari celaka', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(279, 28, 13, 'فَرَدَدْنَاهُ إِلَىٰ أُمِّهِ كَيْ تَقَرَّ عَيْنُهَا وَلَا تَحْزَنَ', 'Maka Kami kembalikan dia (Musa) kepada ibunya, agar senang/bahagia hatinya dan tidak bersedih...', 'Al-Qur\'an', 'bahagia, penenang hati, kebahagiaan keluarga', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(280, 19, 96, 'إِنَّ الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ سَيَجْعَلُ لَهُمُ الرَّحْمَٰنُ وُدًّا', 'Sungguh, orang-orang yang beriman dan beramal saleh, kelak Allah Yang Maha Pengasih akan menanamkan rasa kasih sayang (kebahagiaan) dalam hati mereka.', 'Al-Qur\'an', 'bahagia, kasih sayang, cinta Allah', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(281, 48, 4, 'هُوَ الَّذِي أَنْزَلَ السَّكِينَةَ فِي قُلُوبِ الْمُؤْمِنِينَ لِيَزْدَادُوا إِيمَانًا مَعَ إِيمَانِهِمْ', 'Dialah yang telah menurunkan ketenangan (sakinah) ke dalam hati orang-orang mukmin...', 'Al-Qur\'an', 'bahagia, ketenangan, sakinah', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(282, 41, 30, 'أَلَّا تَخَافُوا وَلَا تَحْزَنُوا وَأَبْشِرُوا بِالْجَنَّةِ الَّتِي كُنْتُمْ تُوعَدُونَ', '...\'Janganlah kamu takut dan janganlah merasa sedih; dan bergembiralah dengan surga yang telah dijanjikan kepadamu.\'', 'Al-Qur\'an', 'bahagia, kabar gembira, surga', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(283, 36, 55, 'إِنَّ أَصْحَابَ الْجَنَّةِ الْيَوْمَ فِي شُغُلٍ فَاكِهُونَ', 'Sesungguhnya penghuni surga pada hari itu bersenang-senang dalam kesibukan (yang membahagiakan).', 'Al-Qur\'an', 'bahagia, kenikmatan surga, kegembiraan', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(284, 83, 34, 'فَالْيَوْمَ الَّذِينَ آمَنُوا مِنَ الْكُفَّارِ يَضْحَكُونَ', 'Maka pada hari ini, orang-orang yang beriman tertawa (bahagia) atas orang-orang kafir.', 'Al-Qur\'an', 'bahagia, kebahagiaan hakiki, kemenangan', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(285, 21, 103, 'لَا يَحْزُنُهُمُ الْفَزَعُ الْأَكْبَرُ وَتَتَلَقَّاهُمُ الْمَلَائِكَةُ هَٰذَا يَوْمُكُمُ الَّذِي كُنْتُمْ تُوعَدُونَ', 'Mereka tidak didegupkan oleh kejutan yang dahsyat (hari kiamat), dan mereka disambut oleh para malaikat: \'Inilah harimu yang telah dijanjikan kepadamu.\'', 'Al-Qur\'an', 'bahagia, rasa aman, janji Allah', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(286, 52, 18, 'فَاكِهِينَ بِمَا آتَاهُمْ رَبُّهُمْ وَوَقَاهُمْ رَبُّهُمْ عَذَابَ الْجَحِيمِ', 'Mereka bersenang-senang (bahagia) dengan apa yang diberikan Tuhan kepada mereka; dan Tuhan memelihara mereka dari azab neraka.', 'Al-Qur\'an', 'bahagia, kegembiraan surga, perlindungan', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(287, 76, 11, 'فَوَقَاهُمُ اللَّهُ شَرَّ ذَٰلِكَ الْيَوْمِ وَلَقَّاهُمْ نَضْرَةً وَسُرُورًا', 'Maka Allah melindungi mereka dari kesusahan hari itu, dan memberikan kepada mereka kecerahan (wajah) dan kegembiraan hati.', 'Al-Qur\'an', 'bahagia, kegembiraan hati, kecerahan', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(288, 84, 9, 'وَيَنْقَلِبُ إِلَىٰ أَهْلِهِ مَسْرُورًا', 'dan dia akan kembali kepada keluarganya (yang sama-sama beriman) dengan gembira (bahagia).', 'Al-Qur\'an', 'bahagia, kegembiraan, hisab mudah', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(289, 27, 19, 'فَتَبَسَّمَ ضَاحِكًا مِنْ قَوْلِهَا', 'Maka dia (Sulaiman) tersenyum tertawa karena (mendengar) perkataan semut itu...', 'Al-Qur\'an', 'bahagia, senyuman, Nabi Sulaiman', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(290, 10, 62, 'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Ingatlah, sesungguhnya wali-wali Allah itu tidak ada kekhawatiran terhadap mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'bahagia, kedamaian jiwa, wali Allah', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(291, 10, 63, 'الَّذِينَ آمَنُوا وَكَانُوا يَتَّقُونَ', '(Yaitu) orang-orang yang beriman dan selalu bertakwa.', 'Al-Qur\'an', 'bahagia, iman dan takwa, kunci bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(292, 10, 64, 'لَهُمُ الْبُشْرَىٰ فِي الْحَيَاةِ الدُّنْيَا وَفِي الْآخِرَةِ', 'Bagi mereka berita gembira di dalam kehidupan dunia dan di akhirat...', 'Al-Qur\'an', 'bahagia, kabar gembira, dunia akhirat', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36');
INSERT INTO `quran_verses` (`id`, `surah`, `ayat_number`, `arabic_text`, `translation`, `source`, `tags`, `status`, `reviewer_id`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(293, 25, 74, 'رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ', 'Ya Tuhan kami, anugerahkanlah kepada kami pasangan kami dan keturunan kami sebagai penyenang hati (kebahagiaan)...', 'Al-Qur\'an', 'bahagia, penyenang hati, keluarga bahagia', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(294, 30, 21, 'وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُمْ مِنْ أَنْفُسِكُمْ أَزْوَاجًا لِتَسْكُنُوا إِلَيْهَا وَجَعَلَ بَيْنَكُمْ مَوَدَّةً وَرَحْمَةً', 'Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu merasa tenteram/bahagia kepadanya...', 'Al-Qur\'an', 'bahagia, ketenteraman, pernikahan', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(295, 55, 60, 'هَلْ جَزَاءُ الْإِحْسَانِ إِلَّا الْإِحْسَانُ', 'Tidak ada balasan untuk kebaikan selain kebaikan (yang membahagiakan) pula.', 'Al-Qur\'an', 'bahagia, balasan ihsan, kebaikan', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(296, 65, 7, 'سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا', 'Allah kelak akan memberikan kelapangan (kebahagiaan) setelah kesempitan.', 'Al-Qur\'an', 'bahagia, kelapangan, kemudahan', 'approved', NULL, NULL, '2026-07-29 10:08:36', '2026-07-29 10:08:36'),
(297, 13, 28, 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ', '(Yaitu) orang-orang yang beriman dan hati mereka menjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.', 'Al-Qur\'an', 'tenang, tuma\'ninah, zikir, ketenangan hati', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(298, 48, 4, 'هُوَ الَّذِي أَنْزَلَ السَّكِينَةَ فِي قُلُوبِ الْمُؤْمِنِينَ لِيَزْدَادُوا إِيمَانًا مَعَ إِيمَانِهِمْ', 'Dialah yang telah menurunkan ketenangan ke dalam hati orang-orang mukmin untuk menambah iman atas iman mereka (yang telah ada).', 'Al-Qur\'an', 'tenang, sakinah, iman, ketenangan jiwa', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(299, 48, 18, 'لَقَدْ رَضِيَ اللَّهُ عَنِ الْمُؤْمِنِينَ إِذْ يُبَايِعُونَكَ تَحْتَ الشَّجَرَةِ فَعَلِمَ مَا فِي قُلُوبِهِمْ فَأَنْزَلَ السَّكِينَةَ عَلَيْهِمْ', 'Sungguh, Allah telah ridha terhadap orang-orang mukmin ketika mereka berjanji setia kepadamu di bawah pohon, Dia mengetahui apa yang ada dalam hati mereka lalu Dia menurunkan ketenangan atas mereka...', 'Al-Qur\'an', 'tenang, sakinah, ridha Allah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(300, 48, 26, 'فَأَنْزَلَ اللَّهُ سَكِينَتَهُ عَلَىٰ رَسُولِهِ وَعَلَى الْمُؤْمِنِينَ وَأَلْزَمَهُمْ كَلِمَةَ التَّقْوَىٰ', '...Maka Allah menurunkan ketenangan kepada Rasul-Nya dan kepada orang-orang mukmin, dan menetapkan bagi mereka kalimat takwa...', 'Al-Qur\'an', 'tenang, sakinah, pertolongan Allah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(301, 9, 26, 'ثُمَّ أَنْزَلَ اللَّهُ سَكِينَتَهُ عَلَىٰ رَسُولِهِ وَعَلَى الْمُؤْمِنِينَ وَأَنْزَلَ جُنُودًا لَمْ تَرَوْهَا', 'Kemudian Allah menurunkan ketenangan kepada Rasul-Nya dan kepada orang-orang yang beriman, dan Dia menurunkan pasukan yang tidak kamu lihat...', 'Al-Qur\'an', 'tenang, sakinah, pertolongan', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(302, 9, 40, 'إِذْ يَقُولُ لِصَاحِبِهِ لَا تَحْزَنْ إِنَّ اللَّهَ مَعَنَا ۖ فَأَنْزَلَ اللَّهُ سَكِينَتَهُ عَلَيْهِ', '...ketika dia berkata kepada sahabatnya, \'Janganlah engkau berduka cita, sesungguhnya Allah bersama kita.\' Maka Allah menurunkan ketenangan-Nya kepadanya...', 'Al-Qur\'an', 'tenang, sakinah, pendampingan Allah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(303, 2, 248, 'إِنَّ آيَةَ مُلْكِهِ أَنْ يَأْتِيَكُمُ التَّابُوتُ فِيهِ سَكِينَةٌ مِنْ رَبِّكُمْ', 'Dan nabi mereka berkata kepada mereka, \'Sesungguhnya tanda kerajaannya ialah datangnya Tabut kepadamu, yang di dalamnya terdapat ketenangan dari Tuhanmu...\'', 'Al-Qur\'an', 'tenang, sakinah, tanda kekuasaan', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(304, 89, 27, 'يَا أَيَّتُهَا النَّفْسُ الْمُطْمَئِنَّةُ', 'Wahai jiwa yang tenang!', 'Al-Qur\'an', 'tenang, jiwa tenang, mutma\'innah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(305, 89, 28, 'ارْجِعِي إِلَىٰ رَبِّكِ رَاضِيَةً مَرْضِيَّةً', 'Kembalilah kepada Tuhanmu dengan hati yang ridha dan diridhai-Nya.', 'Al-Qur\'an', 'tenang, kedamaian, ridha Allah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(306, 89, 29, 'فَادْخُلِي فِي عِبَادِي', 'Maka masuklah ke dalam golongan hamba-hamba-Ku,', 'Al-Qur\'an', 'tenang, hamba Allah, kedamaian', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(307, 89, 30, 'وَادْخُلِي جَنَّتِي', 'dan masuklah ke dalam surga-Ku.', 'Al-Qur\'an', 'tenang, surga, puncak ketenangan', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(308, 94, 1, 'أَلَمْ نَشْرَحْ لَكَ صَدْرَكَ', 'Bukankah Kami telah melapangkan dadamu (Muhammad)?', 'Al-Qur\'an', 'tenang, lapang dada, kelegaan', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(309, 30, 21, 'وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُمْ مِنْ أَنْفُسِكُمْ أَزْوَاجًا لِتَسْكُنُوا إِلَيْهَا', 'Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu merasa tenteram/tenang kepadanya...', 'Al-Qur\'an', 'tenang, ketenteraman, pasangan', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(310, 2, 186, 'وَإِذَا سَأَلَكَ عِبَادِي عَنِّي فَإِنِّي قَرِيبٌ ۖ أُجِيبُ دَعْوَةَ الدَّاعِ إِذَا دَعَانِ', 'Dan apabila hamba-hamba-Ku bertanya kepadamu tentang Aku, maka bahwasanya Aku adalah dekat. Aku mengabulkan permohonan orang yang berdoa apabila ia berdoa kepada-Ku...', 'Al-Qur\'an', 'tenang, kedekatan Allah, doa', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(311, 10, 62, 'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Ingatlah, sesungguhnya wali-wali Allah itu tidak ada kekhawatiran terhadap mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'tenang, bebas cemas, wali Allah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(312, 16, 106, 'إِلَّا مَنْ أُكْرِهَ وَقَلْبُهُ مُطْمَئِنٌّ بِالْإِيمَانِ', '...kecuali orang yang dipaksa melakukan kufr sedangkan hatinya tetap tenang dalam beriman...', 'Al-Qur\'an', 'tenang, keteguhan iman, tuma\'ninah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(313, 8, 10, 'وَمَا جَعَلَهُ اللَّهُ إِلَّا بُشْرَىٰ وَلِتَطْمَئِنَّ بِهِ قُلُوبُكُمْ', 'Dan tidaklah Allah menjadikannya melainkan sebagai kabar gembira dan agar hatimu menjadi tenteram dengannya...', 'Al-Qur\'an', 'tenang, kabar gembira, tenteram', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(314, 3, 126, 'وَمَا جَعَلَهُ اللَّهُ إِلَّا بُشْرَىٰ لَكُمْ وَلِتَطْمَئِنَّ قُلُوبُكُمْ بِهِ', 'Dan tidaklah Allah menjadikannya melainkan sebagai kabar gembira bagi kamu, dan agar hatimu tenteram karenanya...', 'Al-Qur\'an', 'tenang, ketenteraman hati, janji Allah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(315, 8, 11, 'إِذْ يُغَشِّيكُمُ النُّعَاسَ أَمَنَةً مِنْهُ... وَلِيَرْبِطَ عَلَىٰ قُلُوبِكُمْ وَيُثَبِّتَ بِهِ الْأَقْدَامَ', '(Ingatlah) ketika Allah membuat kamu mengantuk untuk memberi ketenangan dari-Nya... dan untuk meneguhkan hatimu serta memperkuat pendirianmu.', 'Al-Qur\'an', 'tenang, rasa aman, peneguh hati', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(316, 20, 46, 'قَالَ لَا تَخَافَا ۖ إِنَّنِي مَعَكُمَا أَسْمَعُ وَأَرَىٰ', 'Dia (Allah) berfirman: \'Janganlah kamu berdua takut, sesungguhnya Aku bersama kamu berdua, Aku mendengar dan melihat.\'', 'Al-Qur\'an', 'tenang, kedamaian, perlindungan Allah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(317, 28, 10, 'لَوْلَا أَنْ رَبَطْنَا عَلَىٰ قَلْبِهَا لِتَكُونَ مِنَ الْمُؤْمِنِينَ', '...seandainya tidak Kami teguhkan hatinya (ibu Musa), agar dia termasuk orang-orang yang beriman (lagi tenang).', 'Al-Qur\'an', 'tenang, keteguhan batin, rahmat', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(318, 41, 30, 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا', 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih...\'', 'Al-Qur\'an', 'tenang, kabar malaikat, istiqamah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(319, 6, 82, 'الَّذِينَ آمَنُوا وَلَمْ يَلْبِسُوا إِيمَانَهُمْ بِظُلْمٍ أُولَٰئِكَ لَهُمُ الْأَمْنُ وَهُمْ مُهْتَدُونَ', 'Orang-orang yang beriman dan tidak mencampuradukkan iman mereka dengan kezaliman (syirik), mereka itulah yang mendapat rasa aman (ketenangan) dan mereka itulah orang-orang yang mendapat petunjuk.', 'Al-Qur\'an', 'tenang, rasa aman, tauhid', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(320, 106, 4, 'الَّذِي أَطْعَمَهُمْ مِنْ جُوعٍ وَآمَنَهُمْ مِنْ خَوْفٍ', 'Yang telah memberi makanan kepada mereka untuk menghilangkan lapar dan mengamankan mereka dari rasa takut.', 'Al-Qur\'an', 'tenang, rasa aman, nikmat Allah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(321, 16, 112, 'وَضَرَبَ اللَّهُ مَثَلًا قَرْيَةً كَانَتْ آمِنَةً مُطْمَئِنَّةً يَأْتِيهَا رِزْقُهَا رَغَدًا مِنْ كُلِّ مَكَانٍ', 'Dan Allah telah membuat suatu perumpamaan (dengan) sebuah negeri yang dahulunya aman lagi tenteram, rezekinya datang kepadanya melimpah ruah dari segenap tempat...', 'Al-Qur\'an', 'tenang, negeri tenteram, rezeki', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(322, 28, 73, 'وَمِنْ رَحْمَتِهِ جَعَلَ لَكُمُ اللَّيْلَ وَالنَّهَارَ لِتَسْكُنُوا فِيهِ', 'Dan adalah karena rahmat-Nya, Dia jadikan untukmu malam dan siang, agar kamu beristirahat/tenang pada malam hari...', 'Al-Qur\'an', 'tenang, istirahat, rahmat Allah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(323, 10, 67, 'هُوَ الَّذِي جَعَلَ لَكُمُ اللَّيْلَ لِتَسْكُنُوا فِيهِ وَالنَّهَارَ مُبْصِرًا', 'Dialah yang menjadikan malam bagimu supaya kamu beristirahat (tenang) padanya dan menjadikan siang terang benderang...', 'Al-Qur\'an', 'tenang, kedamaian malam, hikmah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(324, 40, 61, 'اللَّهُ الَّذِي جَعَلَ لَكُمُ اللَّيْلَ لِتَسْكُنُوا فِيهِ وَالنَّهَارَ مُبْصِرًا', 'Allah-lah yang menjadikan malam untukmu supaya kamu beristirahat (tenang) padanya dan menjadikan siang terang benderang...', 'Al-Qur\'an', 'tenang, waktu tenang, kuasa Allah', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(325, 6, 96, 'فَالِقُ الْإِصْبَاحِ وَجَعَلَ اللَّيْلَ سَكَنًا', 'Dia menyingsingkan pagi dan menjadikan malam untuk beristirahat/ketenangan...', 'Al-Qur\'an', 'tenang, ketenangan malam, tanda alam', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(326, 9, 103, 'وَصَلِّ عَلَيْهِمْ ۖ إِنَّ صَلَاتَكَ سَكَنٌ لَهُمْ', '...Dan mendoakanlah untuk mereka. Sesungguhnya doa kamu itu (menjadi) ketenangan jiwa bagi mereka...', 'Al-Qur\'an', 'tenang, doa rasul, ketenangan jiwa', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(327, 2, 260, 'قَالَ أَوَلَمْ تُؤْمِنْ ۖ قَالَ بَلَىٰ وَلَٰكِنْ لِيَطْمَئِنَّ قَلْبِي', 'Allah berfirman: \'Belum yakinkah engkau?\' Ibrahim menjawab: \'Aku telah meyakininya, akan tetapi agar hatiku menjadi tenang (mantap).\'', 'Al-Qur\'an', 'tenang, ketenangan keyakinan, Nabi Ibrahim', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(328, 3, 173, 'الَّذِينَ قَالَ لَهُمُ النَّاسُ إِنَّ النَّاسَ قَدْ جَمَعُوا لَكُمْ فَاخْشَوْهُمْ فَزَادَهُمْ إِيمَانًا وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', '...dan mereka menjawab: \'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.\'', 'Al-Qur\'an', 'tenang, tawakal, penentram batin', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(329, 26, 62, 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ', 'Dia (Musa) menjawab: \'Sekali-kali tidak! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'', 'Al-Qur\'an', 'tenang, keyakinan, pertolongan', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(330, 93, 3, 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ', 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.', 'Al-Qur\'an', 'tenang, penghibur, kasih sayang', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(331, 94, 5, 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Maka sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'tenang, kemudahan, harapan', 'approved', NULL, NULL, '2026-07-29 10:10:08', '2026-07-29 10:10:08'),
(332, 94, 7, 'فَإِذَا فَرَغْتَ فَانْصَبْ', 'Maka apabila engkau telah selesai (dari suatu urusan), tetaplah bekerja keras (untuk urusan yang lain).', 'Al-Qur\'an', 'semangat, kerja keras, produktivitas', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(333, 94, 8, 'وَإِلَىٰ رَبِّكَ فَارْغَبْ', 'Dan hanya kepada Tuhanmulah engkau berharap.', 'Al-Qur\'an', 'semangat, harapan, niat', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(334, 3, 139, 'وَلَا تَهِنُوا وَلَا تَحْزَنُوا وَأَنْتُمُ الْأَعْلَوْنَ إِنْ كُنْتُمْ مُؤْمِنِينَ', 'Janganlah kamu (merasa) lemah, dan jangan (pula) bersedih hati, padahal kamu pun orang-orang yang paling tinggi (derajatnya), jika kamu orang-orang yang beriman.', 'Al-Qur\'an', 'semangat, pantang menyerah, optimisme', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(335, 29, 69, 'وَالَّذِينَ جَاهَدُوا فِينَا لَنَهْدِيَنَّهُمْ سُبُلَنَا ۚ وَإِنَّ اللَّهَ لَمَعَ الْمُحْسِنِينَ', 'Dan orang-orang yang berjihad (bersungguh-sungguh) untuk (mencari keridhaan) Kami, sungguh Kami akan tunjukkan kepada mereka jalan-jalan Kami...', 'Al-Qur\'an', 'semangat, kesungguhan, petunjuk', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(336, 2, 148, 'فَاسْتَبِقُوا الْخَيْرَاتِ', 'Maka berlomba-lombalah kamu dalam berbuat kebaikan.', 'Al-Qur\'an', 'semangat, berlomba dalam kebaikan, motivasi', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(337, 5, 48, 'فَاسْتَبِقُوا الْخَيْرَاتِ ۚ إِلَى اللَّهِ مَرْجِعُكُمْ جَمِيعًا', '...Maka berlomba-lombalah berbuat kebaikan. Hanya kepada Allah kamu semua kembali...', 'Al-Qur\'an', 'semangat, kompetisi positif, kebaikan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(338, 83, 26, 'وَفِي ذَٰلِكَ فَلْيَتَنَافَسِ الْمُتَنَافِسُونَ', '...Dan untuk yang demikian itu hendaknya orang berlomba-lomba.', 'Al-Qur\'an', 'semangat, amalan akhirat, motivasi tinggi', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(339, 57, 21, 'سَابِقُوا إِلَىٰ مَغْفِرَةٍ مِنْ رَبِّكُمْ وَجَنَّةٍ عَرْضُهَا كَعَرْضِ السَّمَاءِ وَالْأَرْضِ', 'Berlomba-lombalah kamu untuk mendapatkan ampunan dari Tuhanmu dan surga yang luasnya seluas langit dan bumi...', 'Al-Qur\'an', 'semangat, pengampunan, perjuangan surga', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(340, 3, 133, 'وَسَارِعُوا إِلَىٰ مَغْفِرَةٍ مِنْ رَبِّكُمْ وَجَنَّةٍ عَرْضُهَا السَّمَاوَاتُ وَالْأَرْضُ', 'Dan bersegeralah kamu mencari ampunan dari Tuhanmu dan mendapatkan surga yang luasnya seluas langit dan bumi...', 'Al-Qur\'an', 'semangat, bersegera, kebaikan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(341, 13, 11, 'إِنَّ اللَّهَ لَا يُغَيِّرُ مَا بِقَوْمٍ حَتَّىٰ يُغَيِّرُوا مَا بِأَنْفُسِهِمْ', '...Sesungguhnya Allah tidak akan mengubah keadaan suatu kaum sebelum mereka mengubah keadaan diri mereka sendiri...', 'Al-Qur\'an', 'semangat, perubahan, ikhtiar', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(342, 53, 39, 'وَأَنْ لَيْسَ لِلْإِنْسَانِ إِلَّا مَا سَعَىٰ', 'Dan bahwa manusia hanya memperoleh apa yang telah diusahakannya.', 'Al-Qur\'an', 'semangat, usaha, etos kerja', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(343, 53, 40, 'وَأَنَّ سَعْيَهُ سَوْفَ يُرَىٰ', 'Dan bahwa usahanya itu kelak akan diperlihatkan (kepadanya).', 'Al-Qur\'an', 'semangat, hasil kerja, apresiasi', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(344, 9, 105, 'وَقُلِ اعْمَلُوا فَسَيَرَى اللَّهُ عَمَلَكُمْ وَرَسُولُهُ وَالْمُؤْمِنُونَ', 'Dan katakanlah: \'Bekerjalah kamu, maka Allah akan melihat pekerjaanmu, begitu juga Rasul-Nya dan orang-orang mukmin...\'', 'Al-Qur\'an', 'semangat, etos kerja, amal nyata', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(345, 67, 15, 'هُوَ الَّذِي جَعَلَ لَكُمُ الْأَرْضَ ذَلُولًا فَامْشُوا فِي مَنَاكِبِهَا وَكُلُوا مِنْ رِزْقِهِ', 'Dialah yang menjadikan bumi untuk kamu yang mudah dijelajahi, maka jelajahilah di segala penjurunya dan makanlah sebagian dari rezeki-Nya...', 'Al-Qur\'an', 'semangat, mencari rezeki, ekplorasi', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(346, 62, 10, 'فَإِذَا قُضِيَتِ الصَّلَاةُ فَانْتَشِرُوا فِي الْأَرْضِ وَابْتَغُوا مِنْ فَضْلِ اللَّهِ', 'Apabila salat telah dilaksanakan, maka bertebaranlah kamu di bumi; carilah karunia Allah...', 'Al-Qur\'an', 'semangat, etos kerja, keseimbangan hidup', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(347, 3, 159, 'فَإِذَا عَزَمْتَ فَتَوَكَّلْ عَلَى اللَّهِ ۚ إِنَّ اللَّهَ يُحِبُّ الْمُتَوَكِّلِينَ', '...Kemudian, apabila engkau telah membulatkan tekad, maka bertawakallah kepada Allah. Sungguh, Allah mencintai orang-orang yang bertawakal.', 'Al-Qur\'an', 'semangat, tekad bulat, tawakal', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(348, 22, 78, 'وَجَاهِدُوا فِي اللَّهِ حَقَّ جِهَادِهِ', 'Dan berjihadlah (berjuanglah) kamu di jalan Allah dengan jihad yang sebenar-benarnya...', 'Al-Qur\'an', 'semangat, perjuangan, kesungguhan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(349, 9, 41, 'انْفِرُوا خِفَافًا وَثِقَالًا وَجَاهِدُوا بِأَمْوَالِكُمْ وَأَنْفُسِكُمْ فِي سَبِيلِ اللَّهِ', 'Berangkatlah kamu baik dalam keadaan merasa ringan maupun berat, dan berjihadlah dengan harta dan jiwamu di jalan Allah...', 'Al-Qur\'an', 'semangat, pengorbanan, penggerak diri', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(350, 12, 87, 'وَلَا تَيْأَسُوا مِنْ رَوْحِ اللَّهِ ۖ إِنَّهُ لَا يَيْأَسُ مِنْ رَوْحِ اللَّهِ إِلَّا الْقَوْمُ الْكَافِرُونَ', '...dan jangan kamu berputus asa dari rahmat Allah. Sesungguhnya yang berputus asa dari rahmat Allah, hanyalah kaum yang kafir.', 'Al-Qur\'an', 'semangat, pantang putus asa, optimisme', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(351, 39, 53, 'قُلْ يَا عِبَادِيَ الَّذِينَ أَسْرَفُوا عَلَىٰ أَنْفُسِهِمْ لَا تَقْنَطُوا مِنْ رَحْمَةِ اللَّهِ', 'Katakanlah: \'Wahai hamba-hamba-Ku yang melampaui batas terhadap diri mereka sendiri, janganlah kamu berputus asa dari rahmat Allah...\'', 'Al-Qur\'an', 'semangat, harapan, kebangkitan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(352, 28, 77, 'وَابْتَغِ فِيمَا آتَاكَ اللَّهُ الدَّارَ الْآخِرَةَ ۖ وَلَا تَنْسَ نَصِيبَكَ مِنَ الدُّنْيَا', 'Dan carilah pada apa yang telah dianugerahkan Allah kepadamu (kebahagiaan) negeri akhirat, dan janganlah kamu melupakan bagianmu dari (kenikmatan) dunia...', 'Al-Qur\'an', 'semangat, keseimbangan, produktivitas', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(353, 21, 90, 'إِنَّهُمْ كَانُوا يُسَارِعُونَ فِي الْخَيْرَاتِ وَيَدْعُونَنَا رَغَبًا وَرَهَبًا', '...Sungguh, mereka selalu bersegera dalam (mengerjakan) kebaikan-kebaikan, dan mereka berdoa kepada Kami dengan penuh harapan dan rasa takut...', 'Al-Qur\'an', 'semangat, bersegera, kebaikan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(354, 23, 61, 'أُولَٰئِكَ يُسَارِعُونَ فِي الْخَيْرَاتِ وَهُمْ لَهَا سَابِقُونَ', 'merekalah orang-orang yang bersegera dalam kebaikan-kebaikan, dan merekalah yang paling dahulu mendapatkannya.', 'Al-Qur\'an', 'semangat, pelopor kebaikan, kesungguhan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(355, 61, 4, 'إِنَّ اللَّهَ يُحِبُّ الَّذِينَ يُقَاتِلُونَ فِي سَبِيلِهِ صَفًّا كَأَنَّهُمْ بُنْيَانٌ مَرْصُوصٌ', 'Sesungguhnya Allah mencintai orang-orang yang berperang di jalan-Nya dalam barisan yang teratur seakan-akan mereka seperti suatu bangunan yang tersusun kokoh.', 'Al-Qur\'an', 'semangat, kekompakan, disiplin', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(356, 47, 35, 'فَلَا تَهِنُوا وَتَدْعُوا إِلَى السَّلْمِ وَأَنْتُمُ الْأَعْلَوْنَ وَاللَّهُ مَعَكُمْ وَلَنْ يَتِرَكُمْ أَعْمَالَكُمْ', 'Maka janganlah kamu lemah dan mengajak damai karena takut, padahal kamulah yang unggul dan Allah pun bersamamu dan Dia tidak akan mengurangi pahala amal-amalmu.', 'Al-Qur\'an', 'semangat, keteguhan, motivasi', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(357, 48, 29, 'مُحَمَّدٌ رَسُولُ اللَّهِ ۚ وَالَّذِينَ مَعَهُ أَشِدَّاءُ عَلَى الْكُفَّارِ رُحَمَاءُ بَيْنَهُمْ', 'Muhammad adalah utusan Allah dan orang-orang yang bersama dengan dia bersikap keras terhadap orang-orang kafir, tetapi berkasih sayang sesama mereka...', 'Al-Qur\'an', 'semangat, karakter tegas, ukhuwah', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(358, 2, 249, 'كَمْ مِنْ فِئَةٍ قَلِيلَةٍ غَلَبَتْ فِئَةً كَثِيرَةً بِإِذْنِ اللَّهِ ۗ وَاللَّهُ مَعَ الصَّابِرِينَ', '...\'Berapa banyak terjadi golongan yang sedikit dapat mengalahkan golongan yang banyak dengan izin Allah? Dan Allah beserta orang-orang yang sabar.\'', 'Al-Qur\'an', 'semangat, optimisme, keyakinan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(359, 8, 65, 'يَا أَيُّهَا النَّبِيُّ حَرِّضِ الْمُؤْمِنِينَ عَلَى الْقِتَالِ', 'Wahai Nabi (Muhammad)! Kobarkanlah semangat orang-orang beriman untuk berperang...', 'Al-Qur\'an', 'semangat, pengobar semangat, motivasi pimpinan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(360, 4, 84, 'فَقَاتِلْ فِي سَبِيلِ اللَّهِ لَا تُكَلَّفُ إِلَّا نَفْسَكَ ۚ وَحَرِّضِ الْمُؤْمِنِينَ', 'Maka berperanglah engkau di jalan Allah, engkau tidak dibebani melainkan atas dirimu sendiri. Dan kobarkanlah semangat orang-orang beriman...', 'Al-Qur\'an', 'semangat, kepemimpinan, daya juang', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(361, 3, 146, 'فَمَا وَهَنُوا لِمَا أَصَابَهُمْ فِي سَبِيلِ اللَّهِ وَمَا ضَعُفُوا وَمَا اسْتَكَانُوا ۗ وَاللَّهُ يُحِبُّ الصَّابِرِينَ', '...mereka tidak menjadi lemah karena bencana yang menimpa mereka di jalan Allah, tidak lesu dan tidak (pula) menyerah. Dan Allah menyukai orang-orang yang sabar.', 'Al-Qur\'an', 'semangat, daya tahan, tidak menyerah', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(362, 3, 200, 'يَا أَيُّهَا الَّذِينَ آمَنُوا اصْبِرُوا وَصَابِرُوا وَرَابِطُوا وَاتَّقُوا اللَّهَ لَعَلَّكُمْ تُفْلِحُونَ', 'Wahai orang-orang yang beriman! Bersabarlah kamu dan tingkatkanlah kesabaranmu dan tetaplah bersiap-siap, dan bertakwalah kepada Allah agar kamu beruntung.', 'Al-Qur\'an', 'semangat, daya tahan, kesiapan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(363, 39, 10, 'إِنَّمَا يُوَفَّى الصَّابِرُونَ أَجْرَهُمْ بِغَيْرِ حِسَابٍ', '...Sesungguhnya hanya orang-orang yang bersabarlah yang disempurnakan pahala mereka tanpa batas.', 'Al-Qur\'an', 'semangat, kesabaran, balasan tanpa batas', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(364, 93, 4, 'وَلَلْآخِرَةُ خَيْرٌ لَكَ مِنَ الْأُولَىٰ', 'Dan sungguh, yang kemudian itu lebih baik bagimu daripada yang permulaan.', 'Al-Qur\'an', 'semangat, visi masa depan, optimisme', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(365, 11, 112, 'فَاسْتَقِمْ كَمَا أُمِرْتَ وَمَنْ تَابَ مَعَكَ', 'Maka tetaplah engkau (di jalan yang benar), sebagaimana diperintahkan kepadamu dan (juga) orang yang telah bertobat bersamamu...', 'Al-Qur\'an', 'semangat, istiqamah, keteguhan', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(366, 41, 30, 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا', 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka...', 'Al-Qur\'an', 'semangat, konsistensi, kabar gembira', 'approved', NULL, NULL, '2026-07-29 10:11:41', '2026-07-29 10:11:41'),
(367, 30, 21, 'وَمِنْ آيَاتِهِ أَنْ خَلَقَ لَكُمْ مِنْ أَنْفُسِكُمْ أَزْوَاجًا لِتَسْكُنُوا إِلَيْهَا وَجَعَلَ بَيْنَكُمْ مَوَدَّةً وَرَحْمَةً', 'Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan pasangan-pasangan untukmu dari jenismu sendiri, agar kamu merasa tenteram kepadanya, dan Dia menjadikan di antaramu rasa kasih dan sayang...', 'Al-Qur\'an', 'cinta, mawaddah, rahmah, pernikahan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(368, 2, 165, 'وَالَّذِينَ آمَنُوا أَشَدُّ حُبًّا لِلَّهِ', '...Adapun orang-orang yang beriman sangat besar cintanya kepada Allah...', 'Al-Qur\'an', 'cinta Allah, keimanan, ketauhidan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(369, 3, 31, 'قُلْ إِنْ كُنْتُمْ تُحِبُّونَ اللَّهَ فَاتَّبِعُونِي يُحْبِبْكُمُ اللَّهُ وَيَغْفِرْ لَكُمْ ذُنُوبَكُمْ', 'Katakanlah (Muhammad): Jika kamu mencintai Allah, ikutilah aku, niscaya Allah mencintaimu dan mengampuni dosa-dosamu...', 'Al-Qur\'an', 'cinta Allah, mahabah, iktiba rasul', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(370, 5, 54, 'فَسَوْفَ يَأْتِي اللَّهُ بِقَوْمٍ يُحِبُّهُمْ وَيُحِبُّونَهُ', '...Maka kelak Allah akan mendatangkan suatu kaum yang Dia mencintai mereka dan mereka pun mencintai-Nya...', 'Al-Qur\'an', 'cinta timbal balik, mahabah, keimanan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(371, 20, 39, 'وَأَلْقَيْتُ عَلَيْكَ مَهَبَّةً مِنِّي وَلِتُصْنَعَ عَلَىٰ عَيْنِي', '...Dan Aku telah melimpahkan kepadamu rasa kasih sayang yang datang dari-Ku; dan agar engkau diasuh di bawah pengawasan-Ku.', 'Al-Qur\'an', 'cinta, kasih sayang Allah, Nabi Musa', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(372, 19, 96, 'إِنَّ الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ سَيَجْعَلُ لَهُمُ الرَّحْمَٰنُ وُدًّا', 'Sungguh, orang-orang yang beriman dan beramal saleh, kelak Allah Yang Maha Pengasih akan menanamkan rasa kasih sayang (dalam hati mereka).', 'Al-Qur\'an', 'cinta, kasih sayang, amalan saleh', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(373, 8, 63, 'وَأَلَّفَ بَيْنَ قُلُوبِهِمْ ۚ لَوْ أَنْفَقْتَ مَا فِي الْأَرْضِ جَمِيعًا مَا أَلَّفْتَ بَيْنَ قُلُوبِهِمْ وَلَٰكِنَّ اللَّهَ أَلَّفَ بَيْنَهُمْ', 'Dan Dialah yang mempersatukan hati mereka (orang beriman). Walaupun engkau menginfakkan semua yang ada di bumi, niscaya engkau tidak dapat mempersatukan hati mereka, tetapi Allah telah mempersatukan hati mereka...', 'Al-Qur\'an', 'cinta, ikatan hati, ukhuwah', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(374, 49, 7, 'وَلَٰكِنَّ اللَّهَ حَبَّبَ إِلَيْكُمُ الْإِيمَانَ وَزَيَّنَهُ فِي قُلُوبِكُمْ', '...Tetapi Allah menjadikan kamu cinta kepada keimanan dan menjadikan (iman) itu indah dalam hatimu...', 'Al-Qur\'an', 'cinta keimanan, hidayah, keindahan iman', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(375, 9, 24, 'قُلْ إِنْ كَانَ آبَاؤُكُمْ وَأَبْنَاؤُكُمْ وَإِخْوَانُكُمْ وَأَزْوَاجُكُمْ... أَحَبَّ إِلَيْكُمْ مِنَ اللَّهِ وَرَسُولِهِ وَجِهَادٍ فِي سَبِيلِهِ فَتَرَبَّصُوا', 'Katakanlah: Jika bapak-bapakmu, anak-anakmu, saudara-saudaramu, istri-istrimu... lebih kamu cintai daripada Allah dan Rasul-Nya dan daripada berjihad di jalan-Nya, maka tunggulah sampai Allah mendatangkan keputusan-Nya...', 'Al-Qur\'an', 'prioritas cinta, cinta Allah dan Rasul, ujian cinta', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(376, 2, 222, 'إِنَّ اللَّهَ يُحِبُّ التَّوَّابِينَ وَيُحِبُّ الْمُتَطَهِّرِينَ', '...Sesungguhnya Allah menyukai/mencintai orang-orang yang bertobat dan menyukai orang-orang yang menyucikan diri.', 'Al-Qur\'an', 'cinta Allah, taubat, kesucian', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(377, 3, 134, 'وَالْكَاظِمِينَ الْغَيْظَ وَالْعَافِينَ عَنِ النَّاسِ ۗ وَاللَّهُ يُحِبُّ الْمُحْسِنِينَ', '...dan orang-orang yang menahan amarahnya dan memaafkan (kesalahan) orang lain. Dan Allah menyukai/mencintai orang-orang yang berbuat kebaikan.', 'Al-Qur\'an', 'cinta Allah, ihsan, menahan amarah', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(378, 3, 146, 'وَاللَّهُ يُحِبُّ الصَّابِرِينَ', '...Dan Allah menyukai/mencintai orang-orang yang sabar.', 'Al-Qur\'an', 'cinta Allah, kesabaran, ujian', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(379, 3, 159, 'إِنَّ اللَّهَ يُحِبُّ الْمُتَوَكِّلِينَ', '...Sungguh, Allah menyukai/mencintai orang-orang yang bertawakal.', 'Al-Qur\'an', 'cinta Allah, tawakal, kepasrahan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(380, 5, 42, 'إِنَّ اللَّهَ يُحِبُّ الْمُقْسِطِينَ', '...Sesungguhnya Allah menyukai/mencintai orang-orang yang berlaku adil.', 'Al-Qur\'an', 'cinta Allah, keadilan, kejujuran', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(381, 49, 9, 'وَأَقْسِطُوا ۖ إِنَّ اللَّهَ يُحِبُّ الْمُقْسِطِينَ', '...Dan berlaku adillah. Sungguh, Allah mencintai orang-orang yang berlaku adil.', 'Al-Qur\'an', 'cinta Allah, keadilan, kedamaian', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(382, 9, 4, 'إِنَّ اللَّهَ يُحِبُّ الْمُتَّقِينَ', '...Sesungguhnya Allah menyukai/mencintai orang-orang yang bertakwa.', 'Al-Qur\'an', 'cinta Allah, takwa, ketaatan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(383, 61, 4, 'إِنَّ اللَّهَ يُحِبُّ الَّذِينَ يُقَاتِلُونَ فِي سَبِيلِهِ صَفًّا كَأَنَّهُمْ بُنْيَانٌ مَرْصُوصٌ', 'Sesungguhnya Allah mencintai orang-orang yang berperang di jalan-Nya dalam barisan yang teratur seakan-akan mereka seperti suatu bangunan yang tersusun kokoh.', 'Al-Qur\'an', 'cinta Allah, perjuangan, persatuan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(384, 2, 195, 'وَأَحْسِنُوا ۛ إِنَّ اللَّهَ يُحِبُّ الْمُحْسِنِينَ', '...Dan berbuat baiklah, karena sesungguhnya Allah menyukai/mencintai orang-orang yang berbuat baik.', 'Al-Qur\'an', 'cinta Allah, ihsan, kebaikan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(385, 12, 30, 'قَدْ شَغَفَهَا حُبًّا ۖ إِنَّا لَنَرَاهَا فِي ضَلَالٍ مُبِينٍ', '...Sesungguhnya cintanya kepada Yusuf itu sangat mendalam. Sungguh, kami memandangnya dalam kesesatan yang nyata.', 'Al-Qur\'an', 'cinta, Zulaikha dan Yusuf, emosi manusia', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(386, 2, 177, 'وَآتَى الْمَالَ عَلَىٰ حُبِّهِ ذَوِي الْقُرْبَىٰ وَالْيَتَامَىٰ وَالْمَسَاكِينَ', '...dan memberikan harta yang dicintainya kepada kerabat, anak-anak yatim, orang-orang miskin...', 'Al-Qur\'an', 'cinta harta, kedermawanan, infak', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(387, 3, 92, 'لَنْ تَنَالُوا الْبِرَّ حَتَّىٰ تُنْفِقُوا مِمَّا تُحِبُّونَ', 'Kamu tidak akan memperoleh kebajikan (yang sempurna) sebelum kamu menginfakkan sebagian harta yang kamu cintai...', 'Al-Qur\'an', 'cinta harta, keikhlasan, pengorbanan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(388, 3, 14, 'زُيِّنَ لِلنَّاسِ حُبُّ الشَّهَوَاتِ مِنَ النِّسَاءِ وَالْبَنِينَ وَالْقَنَاطِيرِ الْمُقَنْطَرَةِ', 'Dijadikan terasa indah dalam pandangan manusia cinta kepada apa-apa yang diingini, yaitu: wanita-wanita, anak-anak, harta yang banyak...', 'Al-Qur\'an', 'cinta dunia, syahwat, ujian hidup', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(389, 89, 20, 'وَتُحِبُّونَ الْمَالَ حُبًّا جَمًّا', 'Dan kamu mencintai harta dengan kecintaan yang berlebihan.', 'Al-Qur\'an', 'cinta harta, peringatan, kecintaan berlebih', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(390, 100, 8, 'وَإِنَّهُ لِحُبِّ الْخَيْرِ لَشَدِيدٌ', 'Dan sesungguhnya cintanya kepada harta benar-benar berlebihan.', 'Al-Qur\'an', 'cinta harta, sifat manusia, evaluasi diri', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(391, 76, 8, 'وَيُطْعِمُونَ الطَّعَامَ عَلَىٰ حُبِّهِ مِسْكِينًا وَيَتِيمًا وَأَسِيرًا', 'Dan mereka memberikan makanan yang disukainya kepada orang miskin, anak yatim dan orang yang ditawan,', 'Al-Qur\'an', 'cinta sesama, empati, keikhlasan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(392, 59, 9, 'يُحِبُّونَ مَنْ هَاجَرَ إِلَيْهِمْ وَلَا يَجِدُونَ فِي صُدُورِهِمْ حَاجَةً مِمَّا أُوتُوا', '...Mencintai orang yang berhijrah kepada mereka. Dan mereka tiada menaruh keinginan dalam hati mereka terhadap apa-apa yang diberikan...', 'Al-Qur\'an', 'cinta Anshar dan Muhajirin, ukhuwah, kepedulian', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(393, 61, 13, 'وَأُخْرَىٰ تُحِبُّونَهَا ۖ نَصْرٌ مِنَ اللَّهِ وَفَتْحٌ قَرِيبٌ', 'Dan (ada lagi karunia lain) yang kamu sukai/cintai (yaitu) pertolongan dari Allah dan kemenangan yang dekat...', 'Al-Qur\'an', 'cinta pertolongan, kabar gembira, kemenangan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(394, 4, 107, 'إِنَّ اللَّهَ لَا يُحِبُّ مَنْ كَانَ خَوَّانًا أَثِيمًا', '...Sesungguhnya Allah tidak menyukai/mencintai orang-orang yang selalu berkhianat lagi bergelimang dosa.', 'Al-Qur\'an', 'tidak dicintai Allah, pengkhianatan, dosa', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(395, 28, 56, 'إِنَّكَ لَا تَهْدِي مَنْ أَحْبَبْتَ وَلَٰكِنَّ اللَّهَ يَهْدِي مَنْ يَشَاءُ', 'Sungguh, engkau (Muhammad) tidak akan dapat memberi petunjuk kepada orang yang engkau cintai, tetapi Allah memberi petunjuk kepada orang yang Dia kehendaki...', 'Al-Qur\'an', 'cinta manusia, hidayah, Rasulullah', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(396, 42, 23, 'قُلْ لَا أَسْأَلُكُمْ عَلَيْهِ أَجْرًا إِلَّا الْمَوَدَّةَ فِي الْقُرْبَىٰ', '...Katakanlah (Muhammad): Aku tidak meminta kepadamu sesuatu imbalan pun atas seruanku kecuali rasa kasih sayang dalam kekeluargaan.', 'Al-Qur\'an', 'cinta kerabat, mawaddah, kasih sayang', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(397, 60, 7, 'عَسَى اللَّهُ أَنْ يَجْعَلَ بَيْنَكُمْ وَبَيْنَ الَّذِينَ عَادَيْتُمْ مِنْهُمْ مَوَدَّةً', 'Mudah-mudahan Allah menimbulkan rasa kasih sayang di antara kamu dengan orang-orang yang pernah kamu musuhi di antara mereka...', 'Al-Qur\'an', 'cinta, rekonsiliasi, kedamaian', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(398, 7, 79, 'وَنَصَحْتُ لَكُمْ وَلَٰكِنْ لَا تُحِبُّونَ النَّاصِحِينَ', '...dan aku telah memberi nasihat kepadamu, tetapi kamu tidak menyukai/mencintai orang-orang yang memberi nasihat.', 'Al-Qur\'an', 'cinta nasihat, kebaikan, penyesalan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(399, 4, 128, 'وَالصُّلْحُ خَيْرٌ ۗ وَأُحْضِرَتِ الْأَنْفُسُ الشُّحَّ', '...dan perdamaian itu lebih baik (bagi suami istri), walaupun manusia itu menurut tabiatnya kikir...', 'Al-Qur\'an', 'cinta suami istri, perdamaian, ikatan perkawinan', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(400, 30, 54, 'اللَّهُ الَّذِي خَلَقَكُمْ مِنْ ضَعْفٍ ثُمَّ جَعَلَ مِنْ بَعْدِ ضَعْفٍ قُوَّةً', 'Allah-lah yang menciptakan kamu dari keadaan lemah, kemudian Dia menjadikan (bagimu) sesudah keadaan lemah itu menjadi kuat...', 'Al-Qur\'an', 'cinta kehidupan, fase manusia, rahmat', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(401, 2, 216, 'وَعَسَىٰ أَنْ تُحِبُّوا شَيْئًا وَهُوَ شَرٌّ لَكُمْ ۗ وَاللَّهُ يَعْلَمُ وَأَنْتُمْ لَا تَعْلَمُونَ', '...dan boleh jadi kamu menyukai sesuatu, padahal itu buruk bagimu. Allah mengetahui, sedang kamu tidak mengetahui.', 'Al-Qur\'an', 'perspektif cinta, takdir, hikmah Allah', 'approved', NULL, NULL, '2026-07-29 10:15:58', '2026-07-29 10:15:58'),
(402, 39, 53, 'قُلْ يَا عِبَادِيَ الَّذِينَ أَسْرَفُوا عَلَىٰ أَنْفُسِهِمْ لَا تَقْنَطُوا مِنْ رَحْمَةِ اللَّهِ ۚ إِنَّ اللَّهَ يَغْفِرُ الذُّنُوبَ جَمِيعًا', 'Katakanlah: \'Wahai hamba-hamba-Ku yang melampaui batas terhadap diri mereka sendiri, janganlah kamu berputus asa dari rahmat Allah. Sesungguhnya Allah mengampuni dosa-dosa semuanya...\'', 'Al-Qur\'an', 'harapan, rahmat Allah, ampuan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(403, 12, 87, 'وَلَا تَيْأَسُوا مِنْ رَوْحِ اللَّهِ ۖ إِنَّهُ لَا يَيْأَسُ مِنْ رَوْحِ اللَّهِ إِلَّا الْقَوْمُ الْكَافِرُونَ', '...dan jangan kamu berputus asa dari rahmat Allah. Sesungguhnya yang berputus asa dari rahmat Allah, hanyalah kaum yang kafir.', 'Al-Qur\'an', 'harapan, pantang putus asa, optimisme', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(404, 94, 5, 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Maka sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'harapan, kemudahan, kelapangan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(405, 94, 6, 'إِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'harapan, janji Allah, kelapangan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(406, 94, 8, 'وَإِلَىٰ رَبِّكَ فَارْغَبْ', 'Dan hanya kepada Tuhanmulah engkau berharap.', 'Al-Qur\'an', 'harapan, sandaran jiwa, raja\'', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(407, 15, 56, 'قَالَ وَمَنْ يَقْنَطُ مِنْ رَحْمَةِ رَبِّهِ إِلَّا الضَّالُّونَ', 'Dia (Ibrahim) berkata: \'Tidak ada yang berputus asa dari rahmat Tuhannya, melainkan orang-orang yang sesat.\'', 'Al-Qur\'an', 'harapan, rahmat Allah, Nabi Ibrahim', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(408, 65, 2, 'وَمَنْ يَتَّقِ اللَّهَ يَجْعَلْ لَهُ مَخْرَجًا', '...Barangsiapa bertakwa kepada Allah niscaya Dia akan membukakan jalan keluar baginya.', 'Al-Qur\'an', 'harapan, jalan keluar, takwa', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(409, 65, 3, 'وَيَرْزُقْهُ مِنْ حَيْثُ لَا يَحْتَسِبُ ۚ وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ', 'Dan Dia memberinya rezeki dari arah yang tidak disangka-sangkanya. Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.', 'Al-Qur\'an', 'harapan, rezeki tak terduga, tawakal', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(410, 65, 7, 'سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا', 'Allah kelak akan memberikan kelapangan setelah kesempitan.', 'Al-Qur\'an', 'harapan, kesempitan, kelapangan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(411, 2, 186, 'وَإِذَا سَأَلَكَ عِبَادِي عَنِّي فَإِنِّي قَرِيبٌ ۖ أُجِيبُ دَعْوَةَ الدَّاعِ إِذَا دَعَانِ', 'Dan apabila hamba-hamba-Ku bertanya kepadamu tentang Aku, maka bahwasanya Aku adalah dekat. Aku mengabulkan permohonan orang yang berdoa apabila ia berdoa kepada-Ku...', 'Al-Qur\'an', 'harapan, doa, kedekatan Allah', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(412, 2, 218, 'إِنَّ الَّذِينَ آمَنُوا وَالَّذِينَ هَاجَرُوا وَجَاهَدُوا فِي سَبِيلِ اللَّهِ أُولَٰئِكَ يَرْجُونَ رَحْمَتَ اللَّهِ', 'Sesungguhnya orang-orang yang beriman, orang-orang yang berhijrah dan berjihad di jalan Allah, mereka itu mengharapkan rahmat Allah...', 'Al-Qur\'an', 'harapan, raja\', rahmat Allah', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(413, 18, 110, 'فَمَنْ كَانَ يَرْجُو لِقَاءَ رَبِّهِ فَلْيَعْمَلْ عَمَلًا صَالِحًا وَلَا يُشْرِكْ بِعِبَادَةِ رَبِّهِ أَحَدًا', '...Barangsiapa mengharap perjumpaan dengan Tuhannya, maka hendaklah dia mengerjakan kebajikan dan janganlah mempersekutukan seorang pun dalam beribadah kepada Tuhannya.', 'Al-Qur\'an', 'harapan, perjumpaan Allah, amal saleh', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(414, 93, 3, 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ', 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.', 'Al-Qur\'an', 'harapan, kasih sayang Allah, penguat batin', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(415, 93, 4, 'وَلَلْآخِرَةُ خَيْرٌ لَكَ مِنَ الْأُولَىٰ', 'Dan sungguh, yang kemudian itu lebih baik bagimu daripada yang permulaan.', 'Al-Qur\'an', 'harapan, optimisme, masa depan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(416, 93, 5, 'وَلَسَوْفَ يُعْطِيكَ رَبُّكَ فَتَرْضَىٰ', 'Dan sungguh, kelak Tuhanmu pasti memberikan karunia-Nya kepadamu, sehingga engkau menjadi puas.', 'Al-Qur\'an', 'harapan, janji Allah, kepuasan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(417, 21, 87, 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ', 'Maka dia (Yunus) berdoa dalam kegelapan: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'', 'Al-Qur\'an', 'harapan, doa terdesak, Nabi Yunus', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(418, 21, 88, 'فَاسْتَجَبْنَا لَهُ وَنَجَّيْنَاهُ مِنَ الْغَمِّ ۚ وَكَذَٰلِكَ نُنْجِي الْمُؤْمِنِينَ', 'Maka Kami kabulkan doanya dan Kami selamatkan dia dari duka cita. Dan demikianlah Kami menyelamatkan orang-orang yang beriman.', 'Al-Qur\'an', 'harapan, pengabulan doa, pertolongan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(419, 21, 89, 'وَزَكَرِيَّا إِذْ نَادَىٰ رَبَّهُ رَبِّ لَا تَذَرْنِي فَرْدًا وَأَنْتَ خَيْرُ الْوَارِثِينَ', 'Dan (ingatlah kisah) Zakaria, ketika dia berdoa kepada Tuhannya: \'Ya Tuhanku, janganlah Engkau biarkan aku hidup seorang diri...\'', 'Al-Qur\'an', 'harapan, doa, Nabi Zakaria', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(420, 21, 90, 'فَاسْتَجَبْنَا لَهُ وَوَهَبْنَا لَهُ يَحْيَىٰ... إِنَّهُمْ كَانُوا يُسَارِعُونَ فِي الْخَيْرَاتِ وَيَدْعُونَنَا رَغَبًا وَرَهَبًا', 'Maka Kami kabulkan doanya dan Kami anugerahkan kepadanya Yahya... Sungguh, mereka selalu berdoa kepada Kami dengan penuh harapan dan rasa takut...', 'Al-Qur\'an', 'harapan, raghab, karunia', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(421, 21, 83, 'وَأَيُّوبَ إِذْ نَادَىٰ رَبَّهُ أَنِّي مَسَّنِيَ الضُّرُّ وَأَنْتَ أَرْحَمُ الرَّاحِمِينَ', 'Dan (ingatlah kisah) Ayub, ketika dia berdoa kepada Tuhannya: \'(Ya Tuhanku), sungguh, aku telah ditimpa penyakit, padahal Engkau Tuhan Yang Maha Penyayang...\'', 'Al-Qur\'an', 'harapan, kesembuhan, Nabi Ayub', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(422, 21, 84, 'فَاسْتَجَبْنَا لَهُ فَكَشَفْنَا مَا بِهِ مِنْ ضُرٍّ', 'Maka Kami kabulkan doanya, lalu Kami lenyapkan penyakit yang ada padanya...', 'Al-Qur\'an', 'harapan, pemulihan, rahmat', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(423, 28, 24, 'رَبِّ إِنِّي لِمَا أَنْزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ', '(Musa berdoa): \'Ya Tuhanku, sesungguhnya aku sangat memerlukan sesuatu kebaikan yang Engkau turunkan kepadaku.\'', 'Al-Qur\'an', 'harapan, rezeki, Nabi Musa', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(424, 26, 62, 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ', 'Dia (Musa) menjawab: \'Sekali-kali tidak! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'', 'Al-Qur\'an', 'harapan, pertolongan, keteguhan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(425, 3, 173, 'وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', '...dan mereka menjawab: \'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.\'', 'Al-Qur\'an', 'harapan, tawakal, pertolongan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(426, 3, 174, 'فَانْقَلَبُوا بِنِعْمَةٍ مِنَ اللَّهِ وَفَضْلٍ لَمْ يَمْسَسْهُمْ سُوءٌ', 'Maka mereka kembali dengan nikmat dan karunia yang besar dari Allah, mereka tidak ditimpa suatu bencana pun...', 'Al-Qur\'an', 'harapan, hasil tawakal, perlindungan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(427, 7, 156, 'وَرَحْمَتِي وَسِعَتْ كُلَّ شَيْءٍ', '...dan rahmat-Ku meliputi segala sesuatu...', 'Al-Qur\'an', 'harapan, rahmat Allah, keluasan karunia', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(428, 29, 5, 'مَنْ كَانَ يَرْجُو لِقَاءَ اللَّهِ فَإِنَّ أَجَلَ اللَّهِ لَآتٍ ۚ وَهُوَ السَّمِيعُ الْعَلِيمُ', 'Barangsiapa mengharap perjumpaan dengan Allah, maka sesungguhnya waktu (yang dijanjikan) Allah itu pasti datang...', 'Al-Qur\'an', 'harapan, janji Allah, akhirat', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(429, 33, 21, 'لَقَدْ كَانَ لَكُمْ فِي رَسُولِ اللَّهِ أُسْوَةٌ حَسَنَةٌ لِمَنْ كَانَ يَرْجُو اللَّهَ وَالْيَوْمَ الْآخِرَ', 'Sungguh, telah ada pada (diri) Rasulullah itu suri teladan yang baik bagimu (yaitu) bagi orang yang mengharap (rahmat) Allah dan (kedatangan) hari kiamat...', 'Al-Qur\'an', 'harapan, teladan rasul, keteladanan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(430, 60, 6, 'لَقَدْ كَانَ لَكُمْ فِيهِمْ أُسْوَةٌ حَسَنَةٌ لِمَنْ كَانَ يَرْجُو اللَّهَ وَالْيَوْمَ الْآخِرَ', 'Sungguh, pada mereka itu (Ibrahim dan pengikutnya) terdapat suri teladan yang baik bagimu; (yaitu) bagi orang yang mengharap (pahala) Allah dan (keselamatan) hari kemudian...', 'Al-Qur\'an', 'harapan, teladan, kesuksesan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(431, 29, 69, 'وَالَّذِينَ جَاهَدُوا فِينَا لَنَهْدِيَنَّهُمْ سُبُلَنَا', 'Dan orang-orang yang berjihad (bersungguh-sungguh) untuk (mencari keridhaan) Kami, sungguh Kami akan tunjukkan kepada mereka jalan-jalan Kami...', 'Al-Qur\'an', 'harapan, petunjuk, kesungguhan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(432, 41, 30, 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا وَأَبْشِرُوا بِالْجَنَّةِ', 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih; dan bergembiralah dengan surga...\'', 'Al-Qur\'an', 'harapan, kabar gembira, surga', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(433, 32, 16, 'تَتَجَافَىٰ جُنُوبُهُمْ عَنِ الْمَضَاجِعِ يَدْعُونَ رَبَّهُمْ خَوْفًا وَطَمَعًا', 'Lambung mereka jauh dari tempat tidurnya, mereka berdoa kepada Tuhannya dengan rasa takut dan penuh harapan...', 'Al-Qur\'an', 'harapan, thama\', doa malam', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(434, 7, 56, 'وَادْعُوهُ خَوْفًا وَطَمَعًا ۚ إِنَّ رَحْمَتَ اللَّهِ قَرِيبٌ مِنَ الْمُحْسِنِينَ', '...dan berdoalah kepada-Nya dengan rasa takut dan harapan. Sesungguhnya rahmat Allah sangat dekat kepada orang-orang yang berbuat baik.', 'Al-Qur\'an', 'harapan, rahmat dekat, ihsan', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(435, 10, 58, 'قُلْ بِفَضْلِ اللَّهِ وَبِرَحْمَتِهِ فَبِذَٰلِكَ فَلْيَفْرَحُوا', 'Katakanlah (Muhammad): \'Dengan karunia Allah dan rahmat-Nya, hendaklah dengan itu mereka bergembira...\'', 'Al-Qur\'an', 'harapan, kegembiraan, karunia', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(436, 4, 104, 'وَتَرْجُونَ مِنَ اللَّهِ مَا لَا يَرْجُونَ', '...sedang kamu mengharapkan dari Allah apa yang tidak mereka harapkan...', 'Al-Qur\'an', 'harapan, keunggulan mukmin, pahala', 'approved', NULL, NULL, '2026-07-29 10:17:28', '2026-07-29 10:17:28'),
(437, 2, 155, 'وَلَنَبْلُوَنَّكُمْ بِشَيْءٍ مِنَ الْخَوْفِ وَالْجُوعِ وَنَقْصٍ مِنَ الْأَمْوَالِ وَالْأَنْفُسِ وَالثَّمَرَاتِ ۗ وَبَشِّرِ الصَّابِرِينَ', 'Dan Kami pasti akan menguji kamu dengan sedikit ketakutan, kelaparan, kekurangan harta, jiwa, dan buah-buahan. Dan sampaikanlah kabar gembira kepada orang-orang yang sabar.', 'Al-Qur\'an', 'takut, ujian hidup, musibah, sabar', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(438, 10, 62, 'أَلَا إِنَّ أَوْلِيَاءَ اللَّهِ لَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', 'Ingatlah, sesungguhnya wali-wali Allah itu tidak ada rasa takut pada mereka dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'takut, wali Allah, rasa aman, kedamaian', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(439, 2, 38, 'فَمَنْ تَبِعَ هُدَايَ فَلَا خَوْفٌ عَلَيْهِمْ وَلَا هُمْ يَحْزَنُونَ', '...Barangsiapa mengikuti petunjuk-Ku, tidak ada rasa takut atas mereka, dan tidak (pula) mereka bersedih hati.', 'Al-Qur\'an', 'takut, petunjuk Allah, hidayah', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(440, 20, 46, 'قَالَ لَا تَخَافَا ۖ إِنَّنِي مَعَكُمَا أَسْمَعُ وَأَرَىٰ', 'Dia (Allah) berfirman: \'Janganlah kamu berdua takut, sesungguhnya Aku bersama kamu berdua, Aku mendengar dan melihat.\'', 'Al-Qur\'an', 'takut, kebersamaan Allah, perlindungan', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(441, 20, 67, 'فَأَوْجَسَ فِي نَفْسِهِ خِيفَةً مُوسَىٰ', 'Maka Musa merasa takut dalam hatinya.', 'Al-Qur\'an', 'takut, Nabi Musa, emosi manusiawi', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07');
INSERT INTO `quran_verses` (`id`, `surah`, `ayat_number`, `arabic_text`, `translation`, `source`, `tags`, `status`, `reviewer_id`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(442, 20, 68, 'قُلْنَا لَا تَخَفْ إِنَّكَ أَنْتَ الْأَعْلَىٰ', 'Kami berfirman: \'Jangan takut! Sungguh, engkaulah yang unggul (menang).\'', 'Al-Qur\'an', 'takut, penguat hati, pertolongan', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(443, 28, 18, 'فَأَصْبَحَ فِي الْمَدِينَةِ خَائِفًا يَتَرَقَّبُ', 'Karena itu, dia (Musa) menjadi merasa takut di kota itu seraya waspada...', 'Al-Qur\'an', 'takut, kewaspadaan, Nabi Musa', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(444, 28, 21, 'فَخَرَجَ مِنْهَا خَائِفًا يَتَرَقَّبُ ۖ قَالَ رَبِّ نَجِّنِي مِنَ الْقَوْمِ الظَّالِمِينَ', 'Maka dia (Musa) lari meninggalkan kota itu dengan rasa takut dan waspada, seraya berdoa: \'Ya Tuhanku, selamatkanlah aku dari orang-orang yang zalim.\'', 'Al-Qur\'an', 'takut, doa keselamatan, Nabi Musa', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(445, 28, 25, 'فَلَمَّا جَاءَهُ وَقَصَّ عَلَيْهِ الْقَصَصَ قَالَ لَا تَخَفْ ۖ نَجَوْتَ مِنَ الْقَوْمِ الظَّالِمِينَ', '...Maka ketika dia (Musa) mendatangi ayahnya (Syuaib) dan menceritakan kepadanya kisah tentang dirinya, dia berkata: \'Janganlah engkau takut! Engkau telah selamat dari orang-orang yang zalim itu.\'', 'Al-Qur\'an', 'takut, penenteram jiwa, keselamatan', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(446, 28, 31, 'يَا مُوسَىٰ أَقْبِلْ وَلَا تَخَفْ ۖ إِنَّكَ مِنَ الْآمِنِينَ', '(Dia difirmankan): \'Wahai Musa! Kemarilah dan janganlah takut. Sesungguhnya engkau termasuk orang-orang yang aman.\'', 'Al-Qur\'an', 'takut, rasa aman, pertolongan', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(447, 28, 7, 'وَلَا تَخَافِي وَلَا تَحْزَنِي ۖ إِنَّا رَادُّوهُ إِلَيْكِ وَجَاعِلُوهُ مِنَ الْمُرْسَلِينَ', '...Dan janganlah engkau takut dan janganlah (pula) bersedih hati, karena sesungguhnya Kami akan mengembalikannya kepadamu...', 'Al-Qur\'an', 'takut, ibu Musa, janji Allah', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(448, 106, 4, 'الَّذِي أَطْعَمَهُمْ مِنْ جُوعٍ وَآمَنَهُمْ مِنْ خَوْفٍ', 'Yang telah memberi makanan kepada mereka untuk menghilangkan lapar dan mengamankan mereka dari rasa takut.', 'Al-Qur\'an', 'takut, rasa aman, nikmat Allah', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(449, 3, 173, 'الَّذِينَ قَالَ لَهُمُ النَّاسُ إِنَّ النَّاسَ قَدْ جَمَعُوا لَكُمْ فَاخْشَوْهُمْ فَزَادَهُمْ إِيمَانًا وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', '(Yaitu) orang-orang yang ketika ada orang-orang mengatakan: \'Sesungguhnya orang-orang telah mengumpulkan pasukan untuk menyerang kamu, karena itu takutlah kepada mereka,\' ternyata ucapan itu menambah iman mereka dan mereka menjawab: \'Cukuplah Allah menjadi Penolong kami...\'', 'Al-Qur\'an', 'takut, ancaman musuh, tawakal', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(450, 3, 175, 'إِنَّمَا ذَٰلِكُمُ الشَّيْطَانُ يُخَوِّفُ أَوْلِيَاءَهُ فَلَا تَخَافُوهُمْ وَخَافُونِ إِنْ كُنْتُمْ مُؤْمِنِينَ', 'Sesungguhnya mereka itu hanyalah setan yang menakut-nakuti kamu dengan teman-teman setianya, karena itu janganlah kamu takut kepada mereka, tetapi takutlah kepada-Ku, jika kamu orang-orang beriman.', 'Al-Qur\'an', 'takut, godaan setan, takut kepada Allah', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(451, 33, 10, 'إِذْ جَاءُوكُمْ مِنْ فَوْقِكُمْ وَمِنْ أَسْفَلَ مِنْكُمْ وَإِذْ زَاغَتِ الْأَبْصَارُ وَبَلَغَتِ الْقُلُوبُ الْحَنَاجِرَ', 'Ketika mereka datang kepadamu dari atas dan dari bawahmu, dan ketika penglihatanmu terpana dan hatimu menyesak sampai ke tenggorokan (sangat takut)...', 'Al-Qur\'an', 'takut, kepanikan, perang ahzab', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(452, 33, 39, 'الَّذِينَ يُبَلِّغُونَ رِسَالَاتِ اللَّهِ وَيَخْشَوْنَهُ وَلَا يَخْشَوْنَ أَحَدًا إِلَّا اللَّهَ', '(yaitu) orang-orang yang menyampaikan risalah-risalah Allah, mereka takut kepada-Nya dan tidak merasa takut kepada siapa pun selain kepada Allah...', 'Al-Qur\'an', 'takut, keteguhan, khasyyah', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(453, 35, 28, 'إِنَّمَا يَخْشَى اللَّهَ مِنْ عِبَادِهِ الْعُلَمَاءُ', '...Di antara hamba-hamba Allah yang takut kepada-Nya, hanyalah para ulama (orang-orang yang berilmu)...', 'Al-Qur\'an', 'takut, khasyyah, ilmu', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(454, 13, 21, 'وَالَّذِينَ يَصِلُونَ مَا أَمَرَ اللَّهُ بِهِ أَنْ يُوصَلَ وَيَخْشَوْنَ رَبَّهُمْ وَيَخَافُونَ سُوءَ الْحِسَابِ', 'dan orang-orang yang menghubungkan apa yang diperintahkan Allah agar dihubungkan, dan mereka takut kepada Tuhannya serta takut kepada hisab yang buruk.', 'Al-Qur\'an', 'takut, silaturahmi, hari hisab', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(455, 39, 23, 'تَقْشَعِرُّ مِنْهُ جُلُودُ الَّذِينَ يَخْشَوْنَ رَبَّهُمْ ثُمَّ تَلِينُ جُلُودُهُمْ وَقُلُوبُهُمْ إِلَىٰ ذِكْرِ اللَّهِ', '...gemetar karenanya kulit orang-orang yang takut kepada Tuhannya, kemudian menjadi tenang kulit dan hati mereka ketika mengingat Allah...', 'Al-Qur\'an', 'takut, Al-Qur\'an, ketenangan zikir', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(456, 21, 49, 'الَّذِينَ يَخْشَوْنَ رَبَّهُمْ بِالْغَيْبِ وَهُمْ مِنَ السَّاعَةِ مُشْفِقُونَ', '(yaitu) orang-orang yang takut kepada Tuhannya (yang tidak terlihat oleh) mereka, dan mereka merasa takut akan tibanya hari kiamat.', 'Al-Qur\'an', 'takut, keimanan ghaib, hari kiamat', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(457, 67, 12, 'إِنَّ الَّذِينَ يَخْشَوْنَ رَبَّهُمْ بِالْغَيْبِ لَهُمْ مَغْفِرَةٌ وَأَجْرٌ كَبِيرٌ', 'Sesungguhnya orang-orang yang takut kepada Tuhannya yang tidak terlihat oleh mereka, mereka memperoleh ampunan dan pahala yang besar.', 'Al-Qur\'an', 'takut, ampunan, pahala', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(458, 50, 33, 'مَنْ خَشِيَ الرَّحْمَٰنَ بِالْغَيْبِ وَجَاءَ بِقَلْبٍ مُنِيبٍ', '(Yaitu) orang yang takut kepada Tuhan Yang Maha Pengasih tanpa melihat-Nya dan dia datang dengan hati yang bertobat,', 'Al-Qur\'an', 'takut, taubat, hati munib', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(459, 79, 40, 'وَأَمَّا مَنْ خَافَ مَقَامَ رَبِّهِ وَنَهَى النَّفْسَ عَنِ الْهَوَىٰ', 'Dan adapun orang-orang yang takut kepada kebesaran Tuhannya dan menahan diri dari (keinginan) hawa nafsunya,', 'Al-Qur\'an', 'takut, hawa nafsu, kontrol diri', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(460, 79, 41, 'فَإِنَّ الْجَنَّةَ هِيَ الْمَأْوَىٰ', 'maka sungguh, surgalah tempat tinggal(nya).', 'Al-Qur\'an', 'takut, surga, balasan', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(461, 55, 46, 'وَلِمَنْ خَافَ مَقَامَ رَبِّهِ جَنَّتَانِ', 'Dan bagi orang yang takut akan saat menghadap Tuhannya ada dua surga.', 'Al-Qur\'an', 'takut, surga, keagungan Allah', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(462, 14, 14, 'ذَٰلِكَ لِمَنْ خَافَ مَقَامِي وَخَافَ وَعِيدِ', '...Yang demikian itu (adalah untuk) orang-orang yang takut akan menghadap kepada-Ku dan takut akan ancaman-Ku.', 'Al-Qur\'an', 'takut, ancaman Allah, akhirat', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(463, 76, 10, 'إِنَّا نَخَافُ مِنْ رَبِّنَا يَوْمًا عَبُوسًا قَمْطَرِيرًا', 'Sungguh, kami takut akan (azab) Tuhan kami pada hari ketika orang-orang bermuka masam penuh kesulitan.', 'Al-Qur\'an', 'takut, hari kiamat, azab', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(464, 76, 11, 'فَوَقَاهُمُ اللَّهُ شَرَّ ذَٰلِكَ الْيَوْمِ وَلَقَّاهُمْ نَضْرَةً وَسُرُورًا', 'Maka Allah melindungi mereka dari kesusahan hari itu, dan memberikan kepada mereka kecerahan (wajah) dan kegembiraan hati.', 'Al-Qur\'an', 'takut, perlindungan Allah, kebahagiaan', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(465, 24, 37, 'يَخَافُونَ يَوْمًا تَتَقَلَّبُ فِيهِ الْقُلُوبُ وَالْأَبْصَارُ', '...mereka takut pada suatu hari yang (pada hari itu) hati dan penglihatan menjadi guncang (kiamat).', 'Al-Qur\'an', 'takut, kiamat, ibadah', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(466, 32, 16, 'تَتَجَافَىٰ جُنُوبُهُمْ عَنِ الْمَضَاجِعِ يَدْعُونَ رَبَّهُمْ خَوْفًا وَطَمَعًا', 'Lambung mereka jauh dari tempat tidurnya, mereka berdoa kepada Tuhannya dengan rasa takut dan penuh harapan...', 'Al-Qur\'an', 'takut, harapan, tahajud', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(467, 7, 56, 'وَادْعُوهُ خَوْفًا وَطَمَعًا ۚ إِنَّ رَحْمَتَ اللَّهِ قَرِيبٌ مِنَ الْمُحْسِنِينَ', '...dan berdoalah kepada-Nya dengan rasa takut dan harapan. Sesungguhnya rahmat Allah sangat dekat kepada orang-orang yang berbuat baik.', 'Al-Qur\'an', 'takut, doa, rahmat Allah', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(468, 21, 90, 'إِنَّهُمْ كَانُوا يُسَارِعُونَ فِي الْخَيْرَاتِ وَيَدْعُونَنَا رَغَبًا وَرَهَبًا', '...Sungguh, mereka selalu bersegera dalam (mengerjakan) kebaikan-kebaikan, dan mereka berdoa kepada Kami dengan penuh harapan dan rasa takut...', 'Al-Qur\'an', 'takut, rahba, motivasi kebaikan', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(469, 59, 13, 'لَأَنْتُمْ أَشَدُّ رَهْبَةً فِي صُدُورِهِمْ مِنَ اللَّهِ', 'Sesungguhnya dalam dada mereka, kamu (orang Islam) lebih ditakuti daripada Allah...', 'Al-Qur\'an', 'takut, pemahaman salah, kemunafikan', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(470, 41, 30, 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا', 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih...\'', 'Al-Qur\'an', 'takut, istiqamah, kabar malaikat', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(471, 16, 112, 'فَأَذَاقَهَا اللَّهُ لِبَاسَ الْجُوعِ وَالْخَوْفِ بِمَا كَانُوا يَصْنَعُونَ', '...maka Allah menimpa kepada mereka bencana kelaparan dan ketakutan, disebabkan apa yang mereka perbuat.', 'Al-Qur\'an', 'takut, kufur nikmat, balasan', 'approved', NULL, NULL, '2026-07-29 10:21:07', '2026-07-29 10:21:07'),
(472, 2, 2, 'ذَٰلِكَ الْكِتَابُ لَا رَيْبَ ۛ فِيهِ ۛ هُدًى لِلْمُتَّقِينَ', 'Kitab (Al-Qur\'an) ini tidak ada keraguan padanya; petunjuk bagi mereka yang bertakwa.', 'Al-Qur\'an', 'bingung, ragu, petunjuk, Al-Qur\'an', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(473, 2, 15, 'اللَّهُ يَسْتَهْزِئُ بِهِمْ وَيَمُدُّهُمْ فِي طُغْيَانِهِمْ يَعْمَهُونَ', 'Allah akan memperolok-olokkan mereka dan membiarkan mereka terombang-ambing dalam kesesatan mereka.', 'Al-Qur\'an', 'bingung, terombang-ambing, kesesatan', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(474, 2, 19, 'أَوْ كَصَيِّبٍ مِنَ السَّمَاءِ فِيهِ ظُلُمَاتٌ وَرَعْدٌ وَبَرْقٌ يَجْعَلُونَ أَصَابِعَهُمْ فِي آذَانِهِمْ مِنَ الصَّوَاعِقِ حَذَرَ الْمَوْتِ', 'Atau seperti (orang yang ditimpa) hujan lebat dari langit, yang disertai kegelapan, petir, dan kilat. Mereka menyumbat telinga dengan jari-jarinya karena (mendengar) suara petir, sebab takut mati...', 'Al-Qur\'an', 'bingung, kegelapan, kepanikan', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(475, 2, 20, 'يَكَادُ الْبَرْقُ يَخْطَفُ أَبْصَارَهُمْ ۖ كُلَّمَا أَضَاءَ لَهُمْ مَشَوْا فِيهِ وَإِذَا أَظْلَمَ عَلَيْهِمْ قَامُوا', 'Hampir-hampir kilat itu menyambar penglihatan mereka. Setiap kali (kilat itu) menyinari, mereka berjalan di bawah sinar itu, dan apabila gelap menerpa mereka, mereka berhenti...', 'Al-Qur\'an', 'bingung, kebimbangan, petunjuk sementara', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(476, 4, 143, 'مُذَبْذَبِينَ بَيْنَ ذَٰلِكَ لَا إِلَىٰ هَٰؤُلَاءِ وَلَا إِلَىٰ هَٰؤُلَاءِ ۚ وَمَنْ يُضْلِلِ اللَّهُ فَلَنْ تَجِدَ لَهُ سَبِيلًا', 'Mereka dalam keadaan ragu-ragu (bingung) antara yang demikian (iman atau kafir); tidak masuk kepada golongan ini dan tidak (pula) kepada golongan itu...', 'Al-Qur\'an', 'bingung, ragu, kemunafikan, kebimbangan', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(477, 22, 55, 'وَلَا يَزَالُ الَّذِينَ كَفَرُوا فِي مِرْيَةٍ مِنْهُ حَتَّىٰ تَأْتِيَهُمُ السَّاعَةُ بَغْتَةً', 'Dan orang-orang kafir itu senantiasa berada dalam keraguan tentangnya (Al-Qur\'an), hingga datang kepada mereka hari kiamat secara mendadak...', 'Al-Qur\'an', 'bingung, ragu, kesesatan', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(478, 6, 71, 'كَالَّذِي اسْتَهْوَتْهُ الشَّيَاطِينُ فِي الْأَرْضِ حَيْرَانَ لَهُ أَصْحَابٌ يَدْعُونَهُ إِلَى الْهُدَى ائْتِنَا', '...seperti orang yang telah disesatkan oleh setan di bumi dalam keadaan bingung; dia mempunyai kawan-kawan yang memanggilnya kepada petunjuk (dengan mengatakan): \'Kemarilah kepada kami\'...', 'Al-Qur\'an', 'bingung, hairan, disesatkan setan', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(479, 18, 10, 'إِذْ أَوَى الْفِتْيَةُ إِلَى الْكَهْفِ فَقَالُوا رَبَّنَا آتِنَا مِنْ لَدُنْكَ رَحْمَةً وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا', '(Ingatlah) ketika pemuda-pemuda itu berlindung ke dalam gua lalu mereka berdoa: \'Ya Tuhan kami, berikanlah rahmat kepada kami dari sisi-Mu dan sempurnakanlah petunjuk yang lurus bagi kami dalam urusan kami.\'', 'Al-Qur\'an', 'bingung, petunjuk, Ashabul Kahfi, doa', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(480, 93, 7, 'وَوَجَدَكَ ضَالًّا فَهَدَىٰ', 'Dan Dia mendapatimu sebagai seorang yang bingung (belum mengetahui syariat), lalu Dia memberikan petunjuk.', 'Al-Qur\'an', 'bingung, hidayah, Nabi Muhammad', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(481, 27, 63, 'أَمَّنْ يَهْدِيكُمْ فِي ظُلُمَاتِ الْبَرِّ وَالْبَحْرِ', 'Bukankah Dia (Allah) yang memberi petunjuk kepada kamu dalam kegelapan di darat dan laut...', 'Al-Qur\'an', 'bingung, kegelapan, petunjuk Allah', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(482, 6, 122, 'أَوَمَنْ كَانَ مَيْتًا فَأَحْيَيْنَاهُ وَجَعَلْنَا لَهُ نُورًا يَمْشِي بِهِ فِي النَّاسِ كَمَنْ مَثَلُهُ فِي الظُّلُمَاتِ لَيْسَ بِخَارِجٍ مِنْهَا', 'Dan apakah orang yang sudah mati lalu Kami hidupkan dan Kami beri cahaya yang terang, yang dengan cahaya itu dia dapat berjalan di tengah-tengah masyarakat manusia, serupa dengan orang yang berada dalam kegelapan yang tidak dapat keluar darinya?', 'Al-Qur\'an', 'bingung, cahaya, kegelapan, hidayah', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(483, 20, 25, 'قَالَ رَبِّ اشْرَحْ لِي صَدْرِي', 'Dia (Musa) berkata: \'Ya Tuhanku, lapangkanlah dadaku,\'', 'Al-Qur\'an', 'bingung, lapang dada, Nabi Musa, kelapangan', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(484, 20, 26, 'وَيَسِّرْ لِي أَمْرِي', 'dan mudahkanlah untukku urusanku,', 'Al-Qur\'an', 'bingung, kemudahan urusan, doa', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(485, 20, 27, 'وَاحْلُلْ عُقْدَةً مِنْ لِسَانِي', 'dan lepaskanlah kekakuan dari lidahku,', 'Al-Qur\'an', 'bingung, kelancaran komunikasi, doa', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(486, 20, 28, 'يَفْقَهُوا قَوْلِي', 'agar mereka mengerti perkataanku.', 'Al-Qur\'an', 'bingung, kejelasan, kepahaman', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(487, 1, 6, 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ', 'Tunjukilah kami jalan yang lurus,', 'Al-Qur\'an', 'bingung, petunjuk, jalan lurus', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(488, 2, 256, 'قَدْ تَبَيَّنَ الرُّشْدُ مِنَ الْغَيِّ', '...Sungguh, telah jelas (perbedaan) antara jalan yang benar dengan jalan yang sesat...', 'Al-Qur\'an', 'bingung, kejelasan, kebajikan', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(489, 2, 282, 'وَاتَّقُوا اللَّهَ ۖ وَيُعَلِّمُكُمُ اللَّهُ', '...Dan bertakwalah kepada Allah, Allah memberikan pengajaran kepadamu...', 'Al-Qur\'an', 'bingung, takwa, ilmu, bimbingan', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(490, 8, 29, 'يَا أَيُّهَا الَّذِينَ آمَنُوا إِنْ تَتَّقُوا اللَّهَ يَجْعَلْ لَكُمْ فُرْقَانًا', 'Wahai orang-orang yang beriman! Jika kamu bertakwa kepada Allah, niscaya Dia akan memberikan furqan (kemampuan membedakan hak dan batil) kepadamu...', 'Al-Qur\'an', 'bingung, furqan, kejelasan, takwa', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(491, 65, 2, 'وَمَنْ يَتَّقِ اللَّهَ يَجْعَلْ لَهُ مَخْرَجًا', '...Barangsiapa bertakwa kepada Allah niscaya Dia akan membukakan jalan keluar baginya.', 'Al-Qur\'an', 'bingung, jalan keluar, takwa', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(492, 24, 35, 'اللَّهُ نُورُ السَّمَاوَاتِ وَالْأَرْضِ ۚ مَثَلُ نُورِهِ كَمِشْكَاةٍ فِيهَا مِصْبَاحٌ', 'Allah (pemberi) cahaya (kepada) langit dan bumi. Perumpamaan cahaya-Nya adalah seperti sebuah lubang yang tidak tembus, yang di dalamnya ada pelita besar...', 'Al-Qur\'an', 'bingung, cahaya Allah, pencerahan', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(493, 24, 40, 'أَوْ كَظُلُمَاتٍ فِي بَحْرٍ لُجِّيٍّ يَغْشَاهُ مَوْجٌ مِنْ فَوْقِهِ مَوْجٌ... وَمَنْ لَمْ يَجْعَلِ اللَّهُ لَهُ نُورًا فَمَا لَهُ مِنْ نُورٍ', 'Atau (keadaan orang-orang kafir) seperti gelap gulita di lautan yang dalam, yang diliputi oleh gelombang... Barangsiapa tidak diberi cahaya oleh Allah, tidaklah dia mempunyai cahaya sedikit pun.', 'Al-Qur\'an', 'bingung, kegelapan berlapis, tanpa petunjuk', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(494, 16, 43, 'فَاسْأَلُوا أَهْلَ الذِّكْرِ إِنْ كُنْتُمْ لَا تَعْلَمُونَ', '...Maka bertanyalah kepada orang yang mempunyai pengetahuan jika kamu tidak mengetahui.', 'Al-Qur\'an', 'bingung, bertanya, solusi, ilmu', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(495, 21, 7, 'فَاسْأَلُوا أَهْلَ الذِّكْرِ إِنْ كُنْتُمْ لَا تَعْلَمُونَ', '...Maka tanyakanlah kepada orang-orang yang berilmu, jika kamu tidak mengetahui.', 'Al-Qur\'an', 'bingung, bertanya, kejelasan', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(496, 3, 8, 'رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِنْ لَدُنْكَ رَحْمَةً', '(Mereka berdoa): \'Ya Tuhan kami, janganlah Engkau jadikan hati kami berpaling setelah Engkau beri petunjuk kepada kami, dan karuniakanlah kepada kami rahmat dari sisi-Mu...\'', 'Al-Qur\'an', 'bingung, keraguan, doa ketetapan hati', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(497, 22, 46, 'فَإِنَّهَا لَا تَعْمَى الْأَبْصَارُ وَلَٰكِنْ تَعْمَى الْقُلُوبُ الَّتِي فِي الصُّدُورِ', '...sebenarnya bukan mata itu yang buta, tetapi yang buta ialah hati yang di dalam dada.', 'Al-Qur\'an', 'bingung, kebutaan hati, kebingungan batin', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(498, 10, 32, 'فَذَٰلِكُمُ اللَّهُ رَبُّكُمُ الْحَقُّ ۖ فَمَاذَا بَعْدَ الْحَقِّ إِلَّا الضَّلَالُ', 'Maka itulah Allah, Tuhan kamu yang sebenarnya; maka tidak ada sesudah kebenaran itu melainkan kesesatan...', 'Al-Qur\'an', 'bingung, kebenaran, kesesatan', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(499, 6, 125, 'فَمَنْ يُرِدِ اللَّهُ أَنْ يَهْدِيَهُ يَشْرَحْ صَدْرَهُ لِلْإِسْلَامِ', 'Barangsiapa dikehendaki Allah akan mendapat petunjuk, Dia akan melapangkan dadanya untuk (menerima) Islam...', 'Al-Qur\'an', 'bingung, kelapangan dada, hidayah', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(500, 4, 175, 'فَأَمَّا الَّذِينَ آمَنُوا بِاللَّهِ وَاعْتَصَمُوا بِهِ فَسَيُدْخِلُهُمْ فِي رَحْمَةٍ مِنْهُ وَفَضْلٍ وَيَهْدِيهِمْ إِلَيْهِ صِرَاطًا مُسْتَقِيمًا', 'Adapun orang-orang yang beriman kepada Allah dan berpegang teguh kepada (agama)-Nya, maka Allah akan memasukkan mereka ke dalam rahmat dan karunia dari-Nya, dan menunjuki mereka jalan yang lurus kepada-Nya.', 'Al-Qur\'an', 'bingung, pegangan hidup, jalan lurus', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(501, 26, 62, 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ', 'Dia (Musa) menjawab: \'Sekali-kali tidak! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'', 'Al-Qur\'an', 'bingung, kepungan, petunjuk Allah', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(502, 17, 85, 'وَيَسْأَلُونَكَ عَنِ الرُّوحِ ۖ قُلِ الرُّوحُ مِنْ أَمْرِ رَبِّي وَمَا أُوتِيتُمْ مِنَ الْعِلْمِ إِلَّا قَلِيلًا', 'Dan mereka bertanya kepadamu tentang roh. Katakanlah: \'Roh itu termasuk urusan Tuhanku, dan kamu tidak diberi pengetahuan melainkan sedikit.\'', 'Al-Qur\'an', 'bingung, keterbatasan manusia, rahasia Allah', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(503, 18, 24, 'وَاذْكُرْ رَبَّكَ إِذَا نَسِيتَ وَقُلْ عَسَىٰ أَنْ يَهْدِيَنِ رَبِّي لِأَقْرَبَ مِنْ هَٰذَا رَشَدًا', '...Dan ingatlah kepada Tuhanmu jika engkau lupa dan katakanlah: \'Mudah-mudahan Tuhanku akan memberi petunjuk kepada yang lebih dekat kebenarannya daripada ini.\'', 'Al-Qur\'an', 'bingung, lupa, petunjuk, doa', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(504, 28, 22, 'وَلَمَّا تَوَجَّهَ تِلْقَاءَ مَدْيَنَ قَالَ عَسَىٰ رَبِّي أَنْ يَهْدِيَنِي سَوَاءَ السَّبِيلِ', 'Dan ketika dia (Musa) menuju ke arah negeri Madyan dia berkata: \'Mudah-mudahan Tuhanku memimpin aku ke jalan yang benar.\'', 'Al-Qur\'an', 'bingung, arah hidup, Nabi Musa, doa', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(505, 42, 52, 'مَا كُنْتَ تَدْرِي مَا الْكِتَابُ وَلَا الْإِيمَانُ وَلَٰكِنْ جَعَلْنَاهُ نُورًا نَهْدِي بِهِ مَنْ نَشَاءُ', '...Sebelumnya engkau tidak mengetahui apakah Kitab (Al-Qur\'an) dan apakah iman itu, tetapi Kami jadikan Al-Qur\'an itu cahaya, yang Kami beri petunjuk dengannya siapa yang Kami kehendaki...', 'Al-Qur\'an', 'bingung, cahaya Al-Qur\'an, hidayah', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(506, 39, 23, 'اللَّهُ نَزَّلَ أَحْسَنَ الْحَدِيثِ كِتَابًا مُتَشَابِهًا مَثَانِيَ تَقْشَعِرُّ مِنْهُ جُلُودُ الَّذِينَ يَخْشَوْنَ رَبَّهُمْ', 'Allah telah menurunkan perkataan yang paling baik (yaitu) Al-Qur\'an yang serupa (ayat-ayatnya) lagi berulang-ulang...', 'Al-Qur\'an', 'bingung, penentram, Al-Qur\'an', 'approved', NULL, NULL, '2026-07-29 10:23:36', '2026-07-29 10:23:36'),
(507, 39, 53, 'قُلْ يَا عِبَادِيَ الَّذِينَ أَسْرَفُوا عَلَىٰ أَنْفُسِهِمْ لَا تَقْنَطُوا مِنْ رَحْمَةِ اللَّهِ ۚ إِنَّ اللَّهَ يَغْفِرُ الذُّنُوبَ جَمِيعًا ۚ إِنَّهُ هُوَ الْغَفُورُ الرَّحِيمُ', 'Katakanlah: \'Wahai hamba-hamba-Ku yang melampaui batas terhadap diri mereka sendiri, janganlah kamu berputus asa dari rahmat Allah. Sesungguhnya Allah mengampuni dosa-dosa semuanya. Sungguh, Dialah Yang Maha Pengampun lagi Maha Penyayang.\'', 'Al-Qur\'an', 'perasaan bersalah, ampunan dosa, rahmat Allah, taubat', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(508, 3, 135, 'وَالَّذِينَ إِذَا فَعَلُوا فَاحِشَةً أَوْ ظَلَمُوا أَنْفُسَهُمْ ذَكَرُوا اللَّهَ فَاسْتَغْفَرُوا لِذُنُوبِهِمْ وَمَنْ يَغْفِرُ الذُّنُوبَ إِلَّا اللَّهُ', 'Dan (juga) orang-orang yang apabila mengerjakan perbuatan keji atau menzalimi diri sendiri, mereka segera ingat Allah, lalu memohon ampunan atas dosa-dosa mereka. Dan siapa lagi yang dapat mengampuni dosa selain Allah?', 'Al-Qur\'an', 'perasaan bersalah, kesadaran dosa, istighfar', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(509, 4, 110, 'وَمَنْ يَعْمَلْ سُوءًا أَوْ يَظْلِمْ نَفْسَهُ ثُمَّ يَسْتَغْفِرِ اللَّهَ يَجِدِ اللَّهَ غَفُورًا رَحِيمًا', 'Dan barangsiapa mengerjakan kejahatan atau menzalimi dirinya sendiri, kemudian dia memohon ampunan kepada Allah, niscaya dia akan mendapati Allah Maha Pengampun lagi Maha Penyayang.', 'Al-Qur\'an', 'perasaan bersalah, istighfar, kasih sayang Allah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(510, 7, 23, 'قَالَا رَبَّنَا ظَلَمْنَا أَنْفُسَنَا وَإِنْ لَمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ', 'Keduanya berdoa: \'Ya Tuhan kami, kami telah menzalimi diri kami sendiri. Jika Engkau tidak mengampuni kami dan memberi rahmat kepada kami, niscaya kami termasuk orang-orang yang rugi.\'', 'Al-Qur\'an', 'perasaan bersalah, penyesalan, Nabi Adam, doa ampunan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(511, 28, 16, 'قَالَ رَبِّ إِنِّي ظَلَمْتُ نَفْسِي فَاغْفِرْ لِي فَغَفَرَ لَهُ ۚ إِنَّهُ هُوَ الْغَفُورُ الرَّحِيمُ', 'Dia (Musa) berdoa: \'Ya Tuhanku, sungguh aku telah menzalimi diriku sendiri, maka ampunilah aku.\' Maka Allah mengampuninya. Sungguh, Dialah Yang Maha Pengampun lagi Maha Penyayang.', 'Al-Qur\'an', 'perasaan bersalah, Nabi Musa, pengakuan dosa', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(512, 21, 87, 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ', 'Maka dia (Yunus) berdoa dalam kegelapan yang berlapis-lapis: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'', 'Al-Qur\'an', 'perasaan bersalah, penyesalan, Nabi Yunus, doa taubat', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(513, 66, 8, 'يَا أَيُّهَا الَّذِينَ آمَنُوا تُوبُوا إِلَى اللَّهِ تَوْبَةً نَصُوحًا عَسَىٰ رَبُّكُمْ أَنْ يُكَفِّرَ عَنْكُمْ سَيِّئَاتِكُمْ', 'Wahai orang-orang yang beriman! Bertobatlah kepada Allah dengan tobat yang semurni-murninya (nasuha), mudah-mudahan Tuhanmu akan menghapus kesalahan-kesalahanmu...', 'Al-Qur\'an', 'perasaan bersalah, taubat nasuha, penghapus dosa', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(514, 25, 70, 'إِلَّا مَنْ تَابَ وَآمَنَ وَعَمِلَ عَمَلًا صَالِحًا فَأُولَٰئِكَ يُبَدِّلُ اللَّهُ سَيِّئَاتِهِمْ حَسَنَاتٍ', 'Kecuali orang-orang yang bertobat, beriman, dan mengerjakan kebajikan; maka kejahatan mereka diganti Allah dengan kebaikan...', 'Al-Qur\'an', 'perasaan bersalah, penyesalan, transformasi dosa', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(515, 2, 222, 'إِنَّ اللَّهَ يُحِبُّ التَّوَّابِينَ وَيُحِبُّ الْمُتَطَهِّرِينَ', '...Sesungguhnya Allah menyukai orang-orang yang bertobat dan menyukai orang-orang yang menyucikan diri.', 'Al-Qur\'an', 'perasaan bersalah, kecintaan Allah, taubat', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(516, 4, 17, 'إِنَّمَا التَّوْبَةُ عَلَى اللَّهِ لِلَّذِينَ يَعْمَلُونَ السُّوءَ بِجَهَالَةٍ ثُمَّ يَتُوبُونَ مِنْ قَرِيبٍ', 'Sesungguhnya bertobat kepada Allah itu hanya bagi orang-orang yang membuat kejahatan karena kebodohan, kemudian mereka segera bertobat...', 'Al-Qur\'an', 'perasaan bersalah, kembalinya hamba, kesegeraan taubat', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(517, 11, 114, 'إِنَّ الْحَسَنَاتِ يُذْهِبْنَ السَّيِّئَاتِ ۚ ذَٰلِكَ ذِكْرَىٰ لِلذَّاكِرِينَ', '...Sesungguhnya perbuatan-perbuatan baik itu menghapus kesalahan-kesalahan (perbuatan buruk). Itulah pengingat bagi orang-orang yang ingat.', 'Al-Qur\'an', 'perasaan bersalah, penebusan dosa, amal kebaikan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(518, 40, 3, 'غَافِرِ الذَّنْبِ وَقَابِلِ التَّوْبِ شَدِيدِ الْعِقَابِ ذِي الطَّوْلِ', '(Allah) Yang Mengampuni dosa dan Menerima tobat, keras hukuman-Nya, Yang memiliki karunia...', 'Al-Qur\'an', 'perasaan bersalah, penerima taubat, keagungan Allah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(519, 5, 39, 'فَمَنْ تَابَ مِنْ بَعْدِ ظُلْمِهِ وَأَصْلَحَ فَإِنَّ اللَّهَ يَتُوبُ عَلَيْهِ ۗ إِنَّ اللَّهَ غَفُورٌ رَحِيمٌ', 'Maka barangsiapa bertobat setelah melakukan kezaliman itu dan memperbaiki diri, maka sesungguhnya Allah menerima tobatnya...', 'Al-Qur\'an', 'perasaan bersalah, perbaikan diri, ampunan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(520, 9, 118, 'وَعَلَى الثَّلَاثَةِ الَّذِينَ خُلِّفُوا حَتَّىٰ إِذَا ضَاقَتْ عَلَيْهِمُ الْأَرْضُ بِمَا رَحُبَتْ وَضَاقَتْ عَلَيْهِمْ أَنْفُسُهُمْ وَظَنُّوا أَنْ لَا مَلْجَأَ مِنَ اللَّهِ إِلَّا إِلَيْهِ ثُمَّ تَابَ عَلَيْهِمْ لِيَتُوبُوا', 'Dan terhadap tiga orang yang ditangguhkan (penerimaan tobatnya), hingga bumi terasa sempit oleh mereka padahal bumi itu luas, dan jiwa mereka pun telah terasa sempit oleh mereka... kemudian Allah menerima tobat mereka...', 'Al-Qur\'an', 'perasaan bersalah, kesesakan batin, penyesalan mendalam', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(521, 9, 104, 'أَلَمْ يَعْلَمُوا أَنَّ اللَّهَ هُوَ يَقْبَلُ التَّوْبَةَ عَنْ عِبَادِهِ وَيَأْخُذُ الصَّدَقَاتِ', 'Tidakkah mereka mengetahui, bahwa Allah menerima tobat dari hamba-hamba-Nya dan menerima sedekah...', 'Al-Qur\'an', 'perasaan bersalah, penerimaan taubat, penenteram jiwa', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(522, 20, 82, 'وَإِنِّي لَغَفَّارٌ لِمَنْ تَابَ وَآمَنَ وَعَمِلَ صَالِحًا ثُمَّ اهْتَدَىٰ', 'Dan sungguh, Aku Maha Pengampun bagi yang bertobat, beriman, dan berbuat kebajikan, kemudian tetap di jalan yang benar.', 'Al-Qur\'an', 'perasaan bersalah, janji ampunan, konsistensi', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(523, 42, 25, 'وَهُوَ الَّذِي يَقْبَلُ التَّوْبَةَ عَنْ عِبَادِهِ وَيَعْفُو عَنِ السَّيِّئَاتِ وَيَعْلَمُ مَا تَفْعَلُونَ', 'Dan Dialah yang menerima tobat dari hamba-hamba-Nya dan memaafkan kesalahan-kesalahan dan mengetahui apa yang kamu kerjakan.', 'Al-Qur\'an', 'perasaan bersalah, maaf Allah, peleburan kesalahan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(524, 12, 97, 'قَالُوا يَا أَبَانَا اسْتَغْفِرْ لَنَا ذُنُوبَنَا إِنَّا كُنَّا خَاطِئِينَ', 'Mereka berkata: \'Wahai ayah kami! Mohonkanlah ampunan untuk kami atas dosa-dosa kami, sesungguhnya kami adalah orang-orang yang bersalah.\'', 'Al-Qur\'an', 'perasaan bersalah, saudara Nabi Yusuf, pengakuan bersalah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(525, 12, 98, 'قَالَ سَوْفَ أَسْتَغْفِرُ لَكُمْ رَبِّي ۖ إِنَّهُ هُوَ الْغَفُورُ الرَّحِيمُ', 'Dia (Yakub) berkata: \'Aku akan memohonkan ampunan bagimu kepada Tuhanku. Sungguh, Dialah Yang Maha Pengampun lagi Maha Penyayang.\'', 'Al-Qur\'an', 'perasaan bersalah, permintaan maaf, ampunan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(526, 7, 153, 'وَالَّذِينَ عَمِلُوا السَّيِّئَاتِ ثُمَّ تَابُوا مِنْ بَعْدِهَا وَآمَنُوا إِنَّ رَبَّكَ مِنْ بَعْدِهَا لَغَفُورٌ رَحِيمٌ', 'Dan orang-orang yang telah mengerjakan kejahatan, kemudian bertobat sesudah itu dan beriman; sesungguhnya Tuhanmu setelah itu Maha Pengampun lagi Maha Penyayang.', 'Al-Qur\'an', 'perasaan bersalah, perbaikan, ampunan Allah', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(527, 6, 54, 'كَتَبَ رَبُّكُمْ عَلَىٰ نَفْسِهِ الرَّحْمَةَ ۖ أَنَّهُ مَنْ عَمِلَ مِنْكُمْ سُوءًا بِجَهَالَةٍ ثُمَّ تَابَ مِنْ بَعْدِهِ وَأَصْلَحَ فَأَنَّهُ غَفُورٌ رَحِيمٌ', '...Tuhanmu telah menetapkan sifat kasih sayang pada diri-Nya, (yaitu) barangsiapa di antara kamu yang berbuat kejahatan karena kebodohan, kemudian bertobat setelah itu dan memperbaiki diri, maka sungguh Allah Maha Pengampun lagi Maha Penyayang.', 'Al-Qur\'an', 'perasaan bersalah, rahmat Allah, penerimaan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(528, 15, 49, 'نَبِّئْ عِبَادِي أَنِّي أَنَا الْغَفُورُ الرَّحِيمُ', 'Kabarkanlah kepada hamba-hamba-Ku, bahwa sesungguhnya Akulah Yang Maha Pengampun lagi Maha Penyayang.', 'Al-Qur\'an', 'perasaan bersalah, penghibur batin, kabar gembira', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(529, 2, 286, 'رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَسِينَا أَوْ أَخْطَأْنَا', '...Ya Tuhan kami, janganlah Engkau hukum kami jika kami lupa atau kami melakukan kesalahan...', 'Al-Qur\'an', 'perasaan bersalah, kekhilafan, doa permohonan ampun', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(530, 3, 16, 'الَّذِينَ يَقُولُونَ رَبَّنَا إِنَّنَا آمَنَّا فَاغْفِرْ لَنَا ذُنُوبَنَا وَقِنَا عَذَابَ النَّارِ', '(yaitu) orang-orang yang berdoa: \'Ya Tuhan kami, sungguh kami telah beriman, maka ampunilah dosa-dosa kami dan lindungilah kami dari azab neraka.\'', 'Al-Qur\'an', 'perasaan bersalah, doa hamba, ampunan dosa', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(531, 3, 193, 'رَبَّنَا فَاغْفِرْ لَنَا ذُنُوبَنَا وَكَفِّرْ عَنَّا سَيِّئَاتِنَا وَتَوَفَّنَا مَعَ الْأَبْرَارِ', '...Ya Tuhan kami, ampunilah dosa-dosa kami dan hapuskanlah kesalahan-kesalahan kami, dan matikanlah kami beserta orang-orang yang berbakti.', 'Al-Qur\'an', 'perasaan bersalah, penyesalan, pemaafan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(532, 71, 10, 'فَقُلْتُ اسْتَغْفِرُوا رَبَّكُمْ إِنَّهُ كَانَ غَفَّارًا', 'Maka aku berkata (kepada mereka): \'Mohonlah ampunan kepada Tuhanmu, sungguh, Dia Maha Pengampun.\'', 'Al-Qur\'an', 'perasaan bersalah, anjuran istighfar, Nabi Nuh', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(533, 11, 3, 'وَأَنِ اسْتَغْفِرُوا رَبَّكُمْ ثُمَّ تُوبُوا إِلَيْهِ يُمَتِّعْكُمْ مَتَاعًا حَسَنًا', 'Dan hendaklah kamu memohon ampunan kepada Tuhanmu dan bertobat kepada-Nya, niscaya Dia akan memberi kenikmatan yang baik kepadamu...', 'Al-Qur\'an', 'perasaan bersalah, istighfar, kelapangan hidup', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(534, 11, 90, 'وَاسْتَغْفِرُوا رَبَّكُمْ ثُمَّ تُوبُوا إِلَيْهِ ۚ إِنَّ رَبِّي رَحِيمٌ وَدُودٌ', 'Dan mohonlah ampunan kepada Tuhanmu, kemudian bertobatlah kepada-Nya. Sungguh, Tuhanku Maha Penyayang lagi Maha Pengasih.', 'Al-Qur\'an', 'perasaan bersalah, kasih sayang, istighfar', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(535, 24, 31, 'وَتُوبُوا إِلَى اللَّهِ جَمِيعًا أَيُّهَ الْمُؤْمِنُونَ لَعَلَّكُمْ تُفْلِحُونَ', '...Dan bertobatlah kamu sekalian kepada Allah, wahai orang-orang yang beriman, agar kamu beruntung.', 'Al-Qur\'an', 'perasaan bersalah, perintah taubat, keberuntungan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(536, 27, 44, 'قَالَتْ رَبِّ إِنِّي ظَلَمْتُ نَفْسِي وَأَسْلَمْتُ مَعَ سُلَيْمَانَ لِلَّهِ رَبِّ الْعَالَمِينَ', '...Dia (Ratu Balqis) berkata: \'Ya Tuhanku, sungguh aku telah menzalimi diriku sendiri dan aku berserah diri bersama Sulaiman kepada Allah, Tuhan seluruh alam.\'', 'Al-Qur\'an', 'perasaan bersalah, penyesalan, Balqis, kepasrahan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(537, 12, 29, 'وَاسْتَغْفِرِي لِذَنْبِكِ ۖ إِنَّكِ كُنْتِ مِنَ الْخَاطِئِينَ', '...Dan (wahai Zulaikha) mohonlah ampunan atas dosamu, karena sesungguhnya engkau termasuk orang-orang yang bersalah.', 'Al-Qur\'an', 'perasaan bersalah, teguran dosa, permohonan maaf', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(538, 25, 71, 'وَمَنْ تَابَ وَعَمِلَ صَالِحًا فَإِنَّهُ يَتُوبُ إِلَى اللَّهِ مَتَابًا', 'Dan barangsiapa bertobat dan mengerjakan kebajikan, maka sesungguhnya dia bertobat kepada Allah dengan tobat yang sebenar-benarnya.', 'Al-Qur\'an', 'perasaan bersalah, kelurusan niat, kesungguhan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(539, 41, 6, 'فَاسْتَقِيمُوا إِلَيْهِ وَاسْتَغْفِرُوهُ', '...maka tetaplah di jalan yang lurus menuju kepada-Nya dan mohonlah ampunan kepada-Nya...', 'Al-Qur\'an', 'perasaan bersalah, istiqamah, istighfar', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(540, 47, 19, 'وَاسْتَغْفِرْ لِذَنْبِكَ وَلِلْمُؤْمِنِينَ وَالْمُؤْمِنَاتِ', '...dan mohonlah ampunan atas dosamu dan atas (dosa) orang-orang mukmin, laki-laki dan perempuan...', 'Al-Qur\'an', 'perasaan bersalah, istighfar, solidaritas mukmin', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(541, 110, 3, 'فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ ۚ إِنَّهُ كَانَ تَوَّابًا', 'maka bertasbihlah dengan memuji Tuhanmu dan mohonlah ampunan kepada-Nya. Sungguh, Dia Maha Penerima tobat.', 'Al-Qur\'an', 'perasaan bersalah, tasbih, penutup amalan', 'approved', NULL, NULL, '2026-07-29 10:26:20', '2026-07-29 10:26:20'),
(542, 28, 25, 'فَجَاءَتْهُ إِحْدَاهُمَا تَمْشِي عَلَى اسْتِحْيَاءٍ', 'Kemudian datanglah kepada Musa salah seorang dari kedua perempuan itu berjalan dengan malu-malu...', 'Al-Qur\'an', 'malu, adab wanita, iffah, kesopanan', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(543, 7, 22, 'فَلَمَّا ذَاقَا الشَّجَرَةَ بَدَتْ لَهُمَا سَوْآتُهُمَا وَطَفِقَا يَخْصِفَانِ عَلَيْهِمَا مِنْ وَرَقِ الْجَنَّةِ', '...Maka ketika keduanya telah merasa manisnya pohon itu, tampaklah bagi keduanya aurat-auratnya, dan mulailah keduanya menutupi dengan daun-daun surga.', 'Al-Qur\'an', 'malu, aurat, fitrah manusia, Nabi Adam', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(544, 20, 121, 'فَأَكَلَا مِنْهَا فَبَدَتْ لَهُمَا سَوْآتُهُمَا وَطَفِقَا يَخْصِفَانِ عَلَيْهِمَا مِنْ وَرَقِ الْجَنَّةِ', 'Lalu keduanya memakannya, maka tampaklah bagi keduanya aurat-auratnya dan mulailah keduanya menutupi dengan daun-daun surga...', 'Al-Qur\'an', 'malu, menutup aurat, fitrah, kesucian', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(545, 24, 30, 'قُلْ لِلْمُؤْمِنِينَ يَغُضُّوا مِنْ أَبْصَارِهِمْ وَيَحْفَظُوا فُرُوجَهُمْ ۚ ذَٰلِكَ أَزْكَىٰ لَهُمْ', 'Katakanlah kepada laki-laki yang beriman, agar mereka menjaga pandangannya, dan memelihara kemaluannya; yang demikian itu lebih suci bagi mereka...', 'Al-Qur\'an', 'malu, menjaga pandangan, iffah, kesucian', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(546, 24, 31, 'وَقُلْ لِلْمُؤْمِنَاتِ يَغْضُضْنَ مِنْ أَبْصَارِهِنَّ وَيَحْفَظْنَ فُرُوجَهُنَّ وَلَا يُبْدِينَ زِينَتَهُنَّ إِلَّا مَا ظَهَرَ مِنْهَا', 'Dan katakanlah kepada para perempuan yang beriman, agar mereka menjaga pandangannya, dan memelihara kemaluannya, dan janganlah menampakkan perhiasannya (auratnya), kecuali yang (biasa) tampak darinya...', 'Al-Qur\'an', 'malu, adab wanita, menutup aurat, kehormatan', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(547, 33, 53, 'إِنَّ ذَٰلِكُمْ كَانَ يُؤْذِي النَّبِيَّ فَيَسْتَحْيِي مِنْكُمْ ۖ وَاللَّهُ لَا يَسْتَحْيِي مِنَ الْحَقِّ', '...Sesungguhnya yang demikian itu akan menyakiti hati Nabi lalu dia malu kepadamu (untuk menyuruh kamu keluar), dan Allah tidak malu (menerangkan) yang benar...', 'Al-Qur\'an', 'malu, akhlak Nabi, adab bertamu, kebenaran', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(548, 33, 59, 'يَا أَيُّهَا النَّبِيُّ قُلْ لِأَزْوَاجِكَ وَبَنَاتِكَ وَنِسَاءِ الْمُؤْمِنِينَ يُدْنِينَ عَلَيْهِنَّ مِنْ جَلَابِيبِهِنَّ ۚ ذَٰلِكَ أَدْنَىٰ أَنْ يُعْرَفْنَ فَلَا يُؤْذَيْنَ', 'Wahai Nabi! Katakanlah kepada istri-istrimu, anak-anak perempuanmu dan istri-istri orang mukmin, \'Hendaklah mereka mengulurkan jilbabnya ke seluruh tubuh mereka.\' Yang demikian itu agar mereka lebih mudah untuk dikenal, sehingga mereka tidak diganggu...', 'Al-Qur\'an', 'malu, jilbab, perlindungan, iffah', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(549, 7, 26, 'يَا بَنِي آدَمَ قَدْ أَنْزَلْنَا عَلَيْكُمْ لِبَاسًا يُوَارِي سَوْآتِكُمْ وَرِيشًا ۖ وَلِبَاسُ التَّقْوَىٰ ذَٰلِكَ خَيْرٌ', 'Wahai anak cucu Adam! Sesungguhnya Kami telah menyediakan pakaian untuk menutupi auratmu dan untuk perhiasan bagimu. Tetapi pakaian takwa, itulah yang terbaik...', 'Al-Qur\'an', 'malu, menutup aurat, pakaian takwa, kehormatan', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(550, 2, 273, 'يَحْسَبُهُمُ الْجَاهِلُ أَغْنِيَاءَ مِنَ التَّعَفُّفِ تَعْرِفُهُمْ بِسِيمَاهُمْ لَا يَسْأَلُونَ النَّاسَ إِلْحَافًا', '...Orang yang tidak tahu mengira mereka adalah orang-orang kaya karena mereka memelihara diri dari meminta-minta (karena rasa malu). Engkau (Muhammad) mengenal mereka dari ciri-cirinya, mereka tidak meminta kepada manusia secara mendesak...', 'Al-Qur\'an', 'malu, menjaga kehormatan, ta\'affuf, tidak meminta-minta', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(551, 23, 5, 'وَالَّذِينَ هُمْ لِفُرُوجِهِمْ حَافِظُونَ', 'dan orang-orang yang memelihara kemaluannya,', 'Al-Qur\'an', 'malu, kesucian, iffah, sifat mukmin', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(552, 70, 29, 'وَالَّذِينَ هُمْ لِفُرُوجِهِمْ حَافِظُونَ', 'Dan orang-orang yang memelihara kemaluannya,', 'Al-Qur\'an', 'malu, menjaga kehormatan, dorongan moral', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(553, 2, 26, 'إِنَّ اللَّهَ لَا يَسْتَحْيِي أَنْ يَضْرِبَ مَثَلًا مَا بَعُوضَةً فَمَا فَوْقَهَا', 'Sesungguhnya Allah tidak malu membuat perumpamaan berupa nyamuk atau yang lebih kecil dari itu...', 'Al-Qur\'an', 'malu, kebenaran, hikmah perumpamaan', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(554, 24, 58, 'يَا أَيُّهَا الَّذِينَ آمَنُوا لِيَسْتَأْذِنْكُمُ الَّذِينَ مَلَكَتْ أَيْمَانُكُمْ وَالَّذِينَ لَمْ يَبْلُغُوا الْحُلُمَ مِنْكُمْ ثَلَاثَ مَرَّاتٍ', 'Wahai orang-orang yang beriman! Hendaklah hamba sahaya yang kamu miliki dan orang-orang yang belum balig di antara kamu, meminta izin kepadamu tiga kali (dalam sehari)...', 'Al-Qur\'an', 'malu, privasi, adab meminta izin, menjaga aurat', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(555, 24, 59, 'وَإِذَا بَلَغَ الْأَطْفَالُ مِنْكُمُ الْحُلُمَ فَلْيَسْتَأْذِنُوا كَمَا اسْتَأْذَنَ الَّذِينَ مِنْ قَبْلِهِمْ', 'Dan apabila anak-anakmu telah sampai umur balig, maka hendaklah mereka (juga) meminta izin, seperti orang-orang yang sebelum mereka meminta izin...', 'Al-Qur\'an', 'malu, adab rumah tangga, kehormatan privasi', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(556, 24, 27, 'يَا أَيُّهَا الَّذِينَ آمَنُوا لَا تَدْخُلُوا بُيُوتًا غَيْرَ بُيُوتِكُمْ حَتَّىٰ تَسْتَأْنِسُوا وَتُسَلِّمُوا عَلَىٰ أَهْلِهَا', 'Wahai orang-orang yang beriman! Janganlah kamu memasuki rumah yang bukan rumahmu sebelum meminta izin dan memberi salam kepada penghuninya...', 'Al-Qur\'an', 'malu, adab bertamu, menjaga pandangan', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(557, 24, 28, 'فَإِنْ لَمْ تَجِدُوا فِيهَا أَحَدًا فَلَا تَدْخُلُوهَا حَتَّىٰ يُؤْذَنَ لَكُمْ ۖ وَإِنْ قِيلَ لَكُمُ ارْجِعُوا فَارْجِعُوا', 'Dan jika kamu tidak menemui seorang pun di dalamnya, maka janganlah kamu masuk sebelum kamu mendapat izin. Dan jika dikatakan kepadamu, \'Kembalilah!\' Maka hendaklah kamu kembali...', 'Al-Qur\'an', 'malu, tenggang rasa, menghormati hak orang lain', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(558, 33, 35, 'وَالْحَافِظِينَ فُرُوجَهُمْ وَالْحَافِظَاتِ وَالذَّاكِرِينَ اللَّهَ كَثِيرًا وَالذَّاكِرَاتِ أَعَدَّ اللَّهُ لَهُمْ مَغْفِرَةً وَأَجْرًا عَظِيمًا', '...laki-laki dan perempuan yang memelihara kehormatannya, laki-laki dan perempuan yang banyak menyebut (nama) Allah, Allah telah menyediakan untuk mereka ampunan dan pahala yang besar.', 'Al-Qur\'an', 'malu, kesucian, ampunan, pahala', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(559, 66, 12, 'وَمَرْيَمَ ابْنَتَ عِمْرَانَ الَّتِي أَحْصَنَتْ فَرْجَهَا فَنَفَخْنَا فِيهِ مِنْ رُوحِنَا', 'Dan Maryam putri Imran yang memelihara kehormatannya, lalu Kami tiupkan ke dalam rahimnya sebagian dari roh (ciptaan) Kami...', 'Al-Qur\'an', 'malu, kesucian Maryam, iffah, teladan', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(560, 21, 91, 'وَالَّتِي أَحْصَنَتْ فَرْجَهَا فَنَفَخْنَا فِيهَا مِنْ رُوحِنَا وَجَعَلْنَاهَا وَابْنَهَا آيَةً لِلْعَالَمِينَ', 'Dan (ingatlah kisah Maryam) yang telah memelihara kehormatannya, lalu Kami tiupkan ke dalam (tubuh)nya roh dari Kami dan Kami jadikan dia dan anaknya tanda (kekuasaan Allah) bagi seluruh alam.', 'Al-Qur\'an', 'malu, menjaga diri, kehormatan wanita', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(561, 4, 25, 'مُحْصَنَاتٍ غَيْرَ مُسَافِحَاتٍ وَلَا مُتَّخِذَاتِ أَخْدَانٍ', '...sedang mereka pun wanita-wanita yang memelihara diri, bukan pezina dan bukan pula wanita yang mengambil laki-laki lain sebagai piaraannya...', 'Al-Qur\'an', 'malu, pergaulan, memelihara diri, pernikahan', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(562, 5, 5, 'وَالْمُحْصَنَاتُ مِنَ الْمُؤْمِنَاتِ وَالْمُحْصَنَاتُ مِنَ الَّذِينَ أُوتُوا الْكِتَابَ مِنْ قَبْلِكُمْ إِذَا آتَيْتُمُوهُنَّ أُجُورَهُنَّ مُحْصِنِينَ غَيْرَ مُسَافِحِينَ وَلَا مُتَّخِذِي أَخْدَانٍ', '...Dan (dihalalkan bagimu menikahi) wanita-wanita yang menjaga kehormatan di antara wanita-wanita yang beriman... dengan maksud menikahi mereka, bukan dengan maksud berzina dan bukan pula menjadikan mereka gundik...', 'Al-Qur\'an', 'malu, kehormatan, pernikahan suci', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(563, 24, 33, 'وَلْيَسْتَعْفِفِ الَّذِينَ لَا يَجِدُونَ نِكَاحًا حَتَّىٰ يُغْنِيَهُمُ اللَّهُ مِنْ فَضْلِهِ', 'Dan orang-orang yang belum mampu menikah hendaklah menjaga kesucian (diri)nya, sampai Allah memberi kemampuan kepada mereka dengan karunia-Nya...', 'Al-Qur\'an', 'malu, ta\'affuf, menjaga kesucian diri', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(564, 24, 60, 'وَالْقَوَاعِدُ مِنَ النِّسَاءِ اللَّاتِي لَا يَرْجُونَ نِكَاحًا فَلَيْسَ عَلَيْهِنَّ جُنَاحٌ أَنْ يَضَعْنَ ثِيَابَهُنَّ غَيْرَ مُتَبَرِّجَاتٍ بِزِينَةٍ ۖ وَأَنْ يَسْتَعْفِفْنَ خَيْرٌ لَهُنَّ', 'Dan para perempuan tua yang telah berhenti (dari haid dan beranak) yang tidak ingin menikah (lagi), tidak ada dosa bagi mereka menanggalkan pakaian (luar) mereka dengan tidak (maksud) menampakkan perhiasan; tetapi memelihara kesucian (dan rasa malu) adalah lebih baik bagi mereka...', 'Al-Qur\'an', 'malu, ta\'affuf, kesopanan, wanita tua', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(565, 40, 19, 'يَعْلَمُ خَائِنَةَ الْأَعْيُنِ وَمَا تُخْفِي الصُّدُورُ', 'Dia mengetahui (pandangan) mata yang khianat dan apa yang disembunyikan oleh hati.', 'Al-Qur\'an', 'malu kepada Allah, pengawasan Allah, pandangan mata', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(566, 10, 61, 'وَمَا تَكُونُ فِي شَأْنٍ وَمَا تَتْلُو مِنْهُ مِنْ قُرْآنٍ وَلَا تَعْمَلُونَ مِنْ عَمَلٍ إِلَّا كُنَّا عَلَيْكُمْ شُهُودًا إِذْ تُفِيضُونَ فِيهِ', 'Dan tidakkah engkau berada dalam suatu urusan, dan tidak membaca suatu ayat Al-Qur\'an, dan tidak pula kamu melakukan suatu pekerjaan, melainkan Kami menjadi saksi atasmu ketika kamu melakukannya...', 'Al-Qur\'an', 'malu kepada Allah, merasa diawasi, muraqabah', 'approved', NULL, NULL, '2026-07-29 10:29:04', '2026-07-29 10:29:04'),
(567, 113, 5, 'وَمِنْ شَرِّ حَاسِدٍ إِذَا حَسَدَ', 'dan dari kejahatan orang yang dengki apabila dia dengki.', 'Al-Qur\'an', 'iri, hasad, perlindungan, Al-Falaq', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(568, 4, 32, 'وَلَا تَتَمَنَّوْا مَا فَضَّلَ اللَّهُ بِهِ بَعْضَكُمْ عَلَىٰ بَعْضٍ', 'Dan janganlah kamu iri hati terhadap apa yang dikaruniakan Allah kepada sebagian kamu lebih banyak dari sebagian yang lain...', 'Al-Qur\'an', 'iri, larangan iri hati, karunia Allah', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(569, 4, 54, 'أَمْ يَحْسُدُونَ النَّاسَ عَلَىٰ مَا آتَاهُمُ اللَّهُ مِنْ فَضْلِهِ', 'Ataukah mereka dengki kepada manusia (Muhammad) lantaran karunia yang Allah telah berikan kepadanya?', 'Al-Qur\'an', 'iri, dengki, karunia, celaan hasad', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(570, 2, 109, 'وَدَّ كَثِيرٌ مِنْ أَهْلِ الْكِتَابِ لَوْ يَرُدُّونَكُمْ مِنْ بَعْدِ إِيمَانِكُمْ كُفَّارًا حَسَدًا مِنْ عِنْدِ أَنْفُسِهِمْ', 'Sebagian besar Ahli Kitab menginginkan agar mereka dapat mengembalikan kamu kepada kekafiran setelah kamu beriman, karena rasa dengki yang (timbul) dari diri mereka sendiri...', 'Al-Qur\'an', 'dengki, hasad, bahaya dengki', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(571, 12, 8, 'إِذْ قَالُوا لَيُوسُفُ وَأَخُوهُ أَحَبُّ إِلَىٰ أَبِينَا مِنَّا وَنَحْنُ عُصْبَةٌ إِنَّ أَبَانَا لَفِي ضَلَالٍ مُبِينٍ', '(Yaitu) ketika mereka berkata: \'Sesungguhnya Yusuf dan saudaranya (Bunyamin) lebih dicintai oleh ayah kita daripada kita sendiri, padahal kita adalah satu golongan (yang kuat)...\'', 'Al-Qur\'an', 'iri, kecemburuan, Nabi Yusuf, hubungan keluarga', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(572, 12, 9, 'اقْتُلُوا يُوسُفَ أَوِ اطْرَحُوهُ أَرْضًا يَخْلُ لَكُمْ وَجْهُ أَبِيكُمْ', '\'Bunuhlah Yusuf atau buanglah dia ke suatu tempat (yang asing) supaya perhatian ayahmu tertumpah kepadamu saja...\'', 'Al-Qur\'an', 'dampak iri, kejahatan akibat hasad, Nabi Yusuf', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(573, 12, 5, 'قَالَ يَا بُنَيَّ لَا تَقْصُصْ رُؤْيَاكَ عَلَىٰ إِخْوَتِكَ فَيَكِيدُوا لَكَ كَيْدًا', 'Dia (ayahnya) berkata: \'Wahai anakku, janganlah engkau ceritakan mimpimu itu kepada saudara-saudaramu, maka mereka akan membuat tipu daya (untuk membinasakan)mu...\'', 'Al-Qur\'an', 'mencegah iri, kewaspadaan, tipu daya hasad', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(574, 5, 27, 'وَاتْلُ عَلَيْهِمْ نَبَأَ ابْنَيْ آدَمَ بِالْحَقِّ إِذْ قَرَّبَا قُرْبَانًا فَتُقُبِّلَ مِنْ أَحَدِهِمَا وَلَمْ يُتَقَبَّلْ مِنَ الْآخَرِ قَالَ لَأَقْتُلَنَّكَ', 'Ceritakanlah kepada mereka kisah kedua putra Adam (Habil dan Qabil) menurut yang sebenarnya, ketika keduanya mempersembahkan korban, maka diterima dari salah seorang dari mereka dan tidak diterima dari yang lain. Ia berkata (Qabil): \'Aku pasti membunuhmu!\'', 'Al-Qur\'an', 'iri, pembunuhan pertama, Habil dan Qabil', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38');
INSERT INTO `quran_verses` (`id`, `surah`, `ayat_number`, `arabic_text`, `translation`, `source`, `tags`, `status`, `reviewer_id`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(575, 5, 30, 'فَطَوَّعَتْ لَهُ نَفْسُهُ قَتْلَ أَخِيهِ فَقَتَلَهُ فَأَصْبَحَ مِنَ الْخَاسِرِينَ', 'Maka hawa nafsu Qabil mendorongnya untuk membunuh saudaranya, sebab itu dibunuhnyalah, maka jadilah dia seorang di antara orang-orang yang rugi.', 'Al-Qur\'an', 'dampak iri, penyesalan, dorongan nafsu', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(576, 7, 12, 'قَالَ مَا مَنَعَكَ أَلَّا تَسْجُدَ إِذْ أَمَرْتُكَ ۖ قَالَ أَنَا خَيْرٌ مِنْهُ خَلَقْتَنِي مِنْ نَارٍ وَخَلَقْتَهُ مِنْ طِينٍ', 'Allah berfirman: \'Apakah yang menghalangimu untuk bersujud (kepada Adam) ketika Aku menyuruhmu?\' Iblis menjawab: \'Saya lebih baik daripadanya: Engkau ciptakan saya dari api sedang dia Engkau ciptakan dari tanah.\'', 'Al-Qur\'an', 'iri pertama, kesombongan Iblis, asal usul hasad', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(577, 15, 47, 'وَنَزَعْنَا مَا فِي صُدُورِهِمْ مِنْ غِلٍّ إِخْوَانًا عَلَىٰ سُرُرٍ مُتَقَابِلِينَ', 'Dan Kami lenyapkan segala rasa dendam/dengki yang berada dalam dada mereka, mereka merasa bersaudara duduk berhadap-hadapan di atas dipan-dipan.', 'Al-Qur\'an', 'suci dari dengki, surga, kebersihan hati', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(578, 59, 10, 'وَلَا تَجْعَلْ فِي قُلُوبِنَا غِلًّا لِلَّذِينَ آمَنُوا رَبَّنَا إِنَّكَ رَءُوفٌ رَحِيمٌ', '...dan janganlah Engkau jadikan dengan rasa dengki/dendam dalam hati kami terhadap orang-orang yang beriman. Ya Tuhan kami, sungguh Engkau Maha Penyantun lagi Maha Penyayang.', 'Al-Qur\'an', 'doa pembersih iri, kedamaian hati, ukhuwah', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(579, 3, 120, 'إِنْ تَمْسَسْكُمْ حَسَنَةٌ تَسُؤْهُمْ وَإِنْ تُصِبْكُمْ سَيِّئَةٌ يَفْرَحُوا بِهَا', 'Jika kamu memperoleh kebaikan, niscaya mereka bersedih hati, tetapi jika kamu mendapat bencana, mereka bergembira karenanya...', 'Al-Qur\'an', 'sifat iri, kebencian, ciri pendengki', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(580, 9, 50, 'إِنْ تُصِبْكَ حَسَنَةٌ تَسُؤْهُمْ ۖ وَإِنْ تُصِبْكَ مُصِيبَةٌ يَقُولُوا قَدْ أَخَذْنَا أَمْرَنَا مِنْ قَبْلُ', 'Jika kamu mendapat kebaikan, mereka tidak senang; dan jika kamu ditimpa bencana, mereka berkata: \'Sesungguhnya kami telah bersiap siaga sebelum itu\'...', 'Al-Qur\'an', 'sifat iri, kemunafikan, kedengkian', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(581, 28, 79, 'فَخَرَجَ عَلَىٰ قَوْمِهِ فِي زِينَتِهِ ۖ قَالَ الَّذِينَ يُرِيدُونَ الْحَيَاةَ الدُّنْيَا يَا لَيْتَ لَنَا مِثْلَ مَا أُوتِيَ قَارُونُ', 'Maka keluarlah Karun kepada kaumnya dalam kemewahannya. Berkatalah orang-orang yang menghendaki kehidupan dunia: \'Moga-moga kita mempunyai seperti apa yang telah diberikan kepada Karun...\'', 'Al-Qur\'an', 'iri kemewahan, Karun, cinta dunia', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(582, 28, 80, 'وَقَالَ الَّذِينَ أُوتُوا الْعِلْمَ وَيْلَكُمْ ثَوَابُ اللَّهِ خَيْرٌ لِمَنْ آمَنَ وَعَمِلَ صَالِحًا', 'Berkatalah orang-orang yang dianugerahi ilmu: \'Kecelakaan besarlah bagimu, pahala Allah adalah lebih baik bagi orang-orang yang beriman dan beramal saleh...\'', 'Al-Qur\'an', 'penawar iri, ilmu, nilai akhirat', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(583, 18, 39, 'وَلَوْلَا إِذْ دَخَلْتَ جَنَّتَكَ قُلْتَ مَا شَاءَ اللَّهُ لَا قُوَّةَ إِلَّا بِاللَّهِ', 'Dan mengapa kamu tidak mengucapkan ketika kamu memasuki kebunmu \'Maasya-Allah, laa quwwata illa billah\' (Sungguh atas kehendak Allah semua ini terwujud, tidak ada kekuatan kecuali dengan pertolongan Allah)...', 'Al-Qur\'an', 'mencegah ain, penawar iri, mengagungkan Allah', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(584, 15, 88, 'وَلَا تَمُدَّنَّ عَيْنَيْكَ إِلَىٰ مَا مَتَّعْنَا بِهِ أَزْوَاجًا مِنْهُمْ', 'Jangan sekali-kali engkau menujukan pandanganmu (dengan iri) kepada kenikmatan yang telah Kami berikan kepada beberapa golongan di antara mereka...', 'Al-Qur\'an', 'iri, membatasi pandangan, qana\'ah', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(585, 20, 131, 'وَلَا تَمُدَّنَّ عَيْنَيْكَ إِلَىٰ مَا مَتَّعْنَا بِهِ أَزْوَاجًا مِنْهُمْ زَهْرَةَ الْحَيَاةِ الدُّنْيَا لِنَفْتِنَهُمْ فِيهِ', 'Dan janganlah kamu tujukan kedua matamu kepada apa yang telah Kami berikan kepada golongan-golongan dari mereka, sebagai bunga kehidupan dunia untuk Kami uji mereka dengannya...', 'Al-Qur\'an', 'iri, kenikmatan fana, ujian harta', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(586, 3, 54, 'وَمَكَرُوا وَمَكَرَ اللَّهُ ۖ وَاللَّهُ خَيْرُ الْمَاكِرِينَ', 'Orang-orang kafir itu membuat tipu daya (karena dengki), dan Allah membalas tipu daya mereka itu. Dan Allah sebaik-baik pembalas tipu daya.', 'Al-Qur\'an', 'makar dengki, perlindungan Allah', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(587, 113, 1, 'قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ', 'Katakanlah: \'Aku berlindung kepada Tuhan Yang Menguasai subuh,\'', 'Al-Qur\'an', 'perlindungan dari dengki, Al-Falaq', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(588, 113, 2, 'مِنْ شَرِّ مَا خَلَقَ', 'dari kejahatan makhluk-Nya,', 'Al-Qur\'an', 'perlindungan, kejahatan makhluk', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(589, 26, 88, 'يَوْمَ لَا يَنْفَعُ مَالٌ وَلَا بَنُونَ', '(yaitu) di hari di mana harta dan anak-anak laki-laki tidak berguna,', 'Al-Qur\'an', 'bebas iri, kesucian batin, hari kiamat', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(590, 26, 89, 'إِلَّا مَنْ أَتَى اللَّهَ بِقَلْبٍ سَلِيمٍ', 'kecuali orang-orang yang menghadap Allah dengan hati yang bersih.', 'Al-Qur\'an', 'hati bersih, bebas hasad, qalbun salim', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(591, 68, 51, 'وَإِنْ يَكَادُ الَّذِينَ كَفَرُوا لَيُزْلِقُونَكَ بِأَبْصَارِهِمْ لَمَّا سَمِعُوا الذِّكْرَ', 'Dan sesungguhnya orang-orang kafir itu benar-benar hampir menggelincirkanmu dengan pandangan mata mereka (karena dengki) ketika mereka mendengar Al-Qur\'an...', 'Al-Qur\'an', 'penyakit ain, pandangan dengki, Al-Qalam', 'approved', NULL, NULL, '2026-07-29 10:32:38', '2026-07-29 10:32:38'),
(592, 94, 1, 'أَلَمْ نَشْرَحْ لَكَ صَدْرَكَ', 'Bukankah Kami telah melapangkan dadamu (Muhammad)?', 'Al-Qur\'an', 'stres, kelapangan dada, penenang jiwa', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(593, 94, 2, 'وَوَضَعْنَا عَنْكَ وِزْرَكَ', 'dan Kami pun telah melepaskan bebanmu darimu,', 'Al-Qur\'an', 'stres, beban berat, pelepasan beban', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(594, 94, 3, 'الَّذِي أَنْقَضَ ظَهْرَكَ', 'yang memberatkan punggungmu,', 'Al-Qur\'an', 'stres, tekanan hidup, beban berat', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(595, 94, 5, 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Maka sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'stres, kemudahan, optimisme', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(596, 94, 6, 'إِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'stres, janji Allah, kelapangan', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(597, 15, 97, 'وَلَقَدْ نَعْلَمُ أَنَّكَ يَضِيقُ صَدْرُكَ بِمَا يَقُولُونَ', 'Dan sungguh, Kami mengetahui bahwa dadamu menjadi sempit (tertekan/stres) disebabkan apa yang mereka katakan.', 'Al-Qur\'an', 'stres, tekanan batin, penyempitan dada', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(598, 15, 98, 'فَسَبِّحْ بِحَمْدِ رَبِّكَ وَكُنْ مِنَ السَّاجِدِينَ', 'Maka bertasbihlah dengan memuji Tuhanmu dan jadilah engkau di antara orang-orang yang bersujud.', 'Al-Qur\'an', 'stres, solusi stres, tasbih dan sujud', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(599, 20, 25, 'قَالَ رَبِّ اشْرَحْ لِي صَدْرِي', 'Dia (Musa) berkata: \'Ya Tuhanku, lapangkanlah dadaku,\'', 'Al-Qur\'an', 'stres, kelapangan dada, doa Nabi Musa', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(600, 20, 26, 'وَيَسِّرْ لِي أَمْرِي', 'dan mudahkanlah untukku urusanku,', 'Al-Qur\'an', 'stres, kemudahan urusan, doa', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(601, 2, 286, 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا', 'Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya.', 'Al-Qur\'an', 'stres, beban hidup, batas kemampuan', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(602, 2, 286, 'رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ', '...Ya Tuhan kami, janganlah Engkau pikulkan kepada kami apa yang tidak sanggup kami memikulnya...', 'Al-Qur\'an', 'stres, doa pembebas beban, batas kemampuan', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(603, 13, 28, 'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ ۗ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ', '(yaitu) orang-orang yang beriman dan hati mereka menjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.', 'Al-Qur\'an', 'stres, zikir, penenang batin', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(604, 90, 4, 'لَقَدْ خَلَقْنَا الْإِنْسَانَ فِي كَبَدٍ', 'Sungguh, Kami telah menciptakan manusia berada dalam susah payah.', 'Al-Qur\'an', 'stres, hakikat hidup, susah payah', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(605, 65, 2, 'وَمَنْ يَتَّقِ اللَّهَ يَجْعَلْ لَهُ مَخْرَجًا', '...Barangsiapa bertakwa kepada Allah niscaya Dia akan membukakan jalan keluar baginya.', 'Al-Qur\'an', 'stres, jalan keluar, takwa', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(606, 65, 3, 'وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ', '...Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya...', 'Al-Qur\'an', 'stres, tawakal, kecukupan', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(607, 65, 7, 'لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا مَا آتَاهَا ۚ سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا', '...Allah tidak membebani seseorang melainkan sesuai dengan apa yang diberikan Allah kepadanya. Allah kelak akan memberikan kelapangan setelah kesempitan.', 'Al-Qur\'an', 'stres, kelapangan, kesempitan', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(608, 2, 153, 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ', 'Wahai orang-orang yang beriman! Mohonlah pertolongan (kepada Allah) dengan sabar dan salat. Sungguh, Allah beserta orang-orang yang sabar.', 'Al-Qur\'an', 'stres, pertolongan, sabar dan salat', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(609, 21, 87, 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ', 'Maka dia (Yunus) berdoa dalam kegelapan: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'', 'Al-Qur\'an', 'stres, terdesak, Nabi Yunus, doa', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(610, 21, 88, 'فَاسْتَجَبْنَا لَهُ وَنَجَّيْنَاهُ مِنَ الْغَمِّ ۚ وَكَذَٰلِكَ نُنْجِي الْمُؤْمِنِينَ', 'Maka Kami kabulkan doanya dan Kami selamatkan dia dari duka cita/kesesakan batin. Dan demikianlah Kami menyelamatkan orang-orang yang beriman.', 'Al-Qur\'an', 'stres, duka cita, penyelamatan', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(611, 12, 86, 'قَالَ إِنَّمَا أَشْكُو بَثِّي وَحُزْنِي إِلَى اللَّهِ', 'Dia (Yakub) menjawab: \'Sesungguhnya hanyalah kepada Allah aku mengadukan kesusahan dan kesedihanku...\'', 'Al-Qur\'an', 'stres, curhat kepada Allah, Nabi Yakub', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(612, 93, 3, 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ', 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.', 'Al-Qur\'an', 'stres, penguat batin, kasih sayang Allah', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(613, 93, 4, 'وَلَلْآخِرَةُ خَيْرٌ لَكَ مِنَ الْأُولَىٰ', 'Dan sungguh, yang kemudian itu lebih baik bagimu daripada yang permulaan.', 'Al-Qur\'an', 'stres, perspektif masa depan, harapan', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(614, 93, 5, 'وَلَسَوْفَ يُعْطِيكَ رَبُّكَ فَتَرْضَىٰ', 'Dan sungguh, kelak Tuhanmu pasti memberikan karunia-Nya kepadamu, sehingga engkau menjadi puas.', 'Al-Qur\'an', 'stres, kepuasan batin, janji Allah', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(615, 33, 10, 'إِذْ جَاءُوكُمْ مِنْ فَوْقِكُمْ وَمِنْ أَسْفَلَ مِنْكُمْ وَإِذْ زَاغَتِ الْأَبْصَارُ وَبَلَغَتِ الْقُلُوبُ الْحَنَاجِرَ', 'Ketika mereka datang kepadamu dari atas dan dari bawahmu, dan ketika penglihatanmu terpana dan hatimu menyesak sampai ke tenggorokan (sangat stres/panik)...', 'Al-Qur\'an', 'stres, kepanikan, perang ahzab', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(616, 3, 173, 'الَّذِينَ قَالَ لَهُمُ النَّاسُ إِنَّ النَّاسَ قَدْ جَمَعُوا لَكُمْ فَاخْشَوْهُمْ فَزَادَهُمْ إِيمَانًا وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', '...ternyata ucapan itu menambah iman mereka dan mereka menjawab: \'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.\'', 'Al-Qur\'an', 'stres, tekanan publik, tawakal', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(617, 16, 127, 'وَاصْبِرْ وَمَا صَبْرُكَ إِلَّا بِاللَّهِ ۚ وَلَا تَحْزَنْ عَلَيْهِمْ وَلَا تَكُ فِي ضَيْقٍ مِمَّا يَمْكُرُونَ', 'Bersabarlah (hai Muhammad) dan tiadalah kesabaranmu itu melainkan dengan pertolongan Allah dan janganlah kamu bersedih hati terhadap mereka dan jangan (pula) kamu bersempit dada (stres) terhadap apa yang mereka reka-dekakan.', 'Al-Qur\'an', 'stres, kesabaran, berlapang dada', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(618, 28, 10, 'وَأَصْبَحَ فُؤَادُ أُمِّ مُوسَىٰ فَارِغًا ۖ إِنْ كَادَتْ لَتُبْدِي بِهِ لَوْلَا أَنْ رَبَطْنَا عَلَىٰ قَلْبِهَا', 'Dan hati ibu Musa menjadi kosong (hampa/stres berat). Sungguh, hampir saja dia menyatakan rahasia tentang Musa, seandainya tidak Kami teguhkan hatinya...', 'Al-Qur\'an', 'stres, kehampaan batin, keteguhan', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(619, 26, 61, 'فَلَمَّا تَرَاءَى الْجَمْعَانِ قَالَ أَصْحَابُ مُوسَىٰ إِنَّا لَمُدْرَكُونَ', 'Maka ketika kedua golongan itu saling melihat, berkatalah pengikut-pengikut Musa: \'Kita benar-benar akan tersusul!\'', 'Al-Qur\'an', 'stres, kebuntuan, kepanikan', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(620, 26, 62, 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ', 'Dia (Musa) menjawab: \'Sekali-kali tidak akan tersusul! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'', 'Al-Qur\'an', 'stres, keyakinan, pertolongan Allah', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(621, 10, 57, 'يَا أَيُّهَا النَّاسُ قَدْ جَاءَتْكُمْ مَوْعِظَةٌ مِنْ رَبِّكُمْ وَشِفَاءٌ لِمَا فِي الصُّدُورِ', 'Wahai manusia! Sungguh, telah datang kepadamu pelajaran (Al-Qur\'an) dari Tuhanmu, dan penyembuh bagi penyakit yang ada dalam dada...', 'Al-Qur\'an', 'stres, syifa, obat hati, Al-Qur\'an', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(622, 17, 82, 'وَنُنَزِّلُ مِنَ الْقُرْآنِ مَا هُوَ شِفَاءٌ وَرَحْمَةٌ لِلْمُؤْمِنِينَ', 'Dan Kami turunkan dari Al-Qur\'an suatu yang menjadi penawar/penyembuh dan rahmat bagi orang-orang yang beriman...', 'Al-Qur\'an', 'stres, obat mental, rahmat', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(623, 6, 125, 'فَمَنْ يُرِدِ اللَّهُ أَنْ يَهْدِيَهُ يَشْرَحْ صَدْرَهُ لِلْإِسْلَامِ', 'Barangsiapa dikehendaki Allah akan mendapat petunjuk, Dia akan melapangkan dadanya untuk (menerima) Islam...', 'Al-Qur\'an', 'stres, kelapangan dada, hidayah', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(624, 39, 22, 'أَفَمَنْ شَرَحَ اللَّهُ صَدْرَهُ لِلْإِسْلَامِ فَهُوَ عَلَىٰ نُورٍ مِنْ رَبِّهِ', 'Maka apakah orang-orang yang dibukakan hatinya oleh Allah untuk (menerima) agama Islam lalu ia mendapat cahaya dari Tuhannya (sama dengan orang yang hatinya membatu)?', 'Al-Qur\'an', 'stres, pencerahan, ketenangan', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(625, 41, 30, 'إِنَّ الَّذِينَ قَالُوا رَبُّنَا اللَّهُ ثُمَّ اسْتَقَامُوا تَتَنَزَّلُ عَلَيْهِمُ الْمَلَائِكَةُ أَلَّا تَخَافُوا وَلَا تَحْزَنُوا', 'Sesungguhnya orang-orang yang berkata \'Tuhan kami ialah Allah\' kemudian mereka meneguhkan pendirian mereka, maka malaikat akan turun kepada mereka (dengan mengatakan): \'Janganlah kamu takut dan janganlah merasa sedih...\'', 'Al-Qur\'an', 'stres, ketenangan malaikat, istiqamah', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(626, 48, 4, 'هُوَ الَّذِي أَنْزَلَ السَّكِينَةَ فِي قُلُوبِ الْمُؤْمِنِينَ لِيَزْدَادُوا إِيمَانًا مَعَ إِيمَانِهِمْ', 'Dialah yang telah menurunkan ketenangan (sakinah) ke dalam hati orang-orang mukmin untuk menambah iman atas iman mereka...', 'Al-Qur\'an', 'stres, penawar gelisah, sakinah', 'approved', NULL, NULL, '2026-07-29 10:34:21', '2026-07-29 10:34:21'),
(627, 94, 8, 'وَإِلَىٰ رَبِّكَ فَارْغَبْ', 'Dan hanya kepada Tuhanmulah engkau berharap.', 'Al-Qur\'an', 'kecewa, sandaran harapan, tawakal', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(628, 12, 84, 'وَتَوَلَّىٰ عَنْهُمْ وَقَالَ يَا أَسَفَىٰ عَلَىٰ يُوسُفَ وَابْيَضَّتْ عَيْنَاهُ مِنَ الْحُزْنِ فَهُوَ كَظِيمٌ', 'Dan dia (Yakub) berpaling dari mereka seraya berkata: \'Aduhai duka citaku terhadap Yusuf,\' dan kedua matanya menjadi putih karena kesedihan dan dia menahan amarahnya.', 'Al-Qur\'an', 'kecewa, kehilangan, Nabi Yakub, kesedihan', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(629, 12, 86, 'قَالَ إِنَّمَا أَشْكُو بَثِّي وَحُزْنِي إِلَى اللَّهِ وَأَعْلَمُ مِنَ اللَّهِ مَا لَا تَعْلَمُونَ', 'Dia (Yakub) menjawab: \'Sesungguhnya hanyalah kepada Allah aku mengadukan kesusahan dan kesedihanku, dan aku mengetahui dari Allah apa yang tidak kamu ketahui.\'', 'Al-Qur\'an', 'kecewa, pengaduan batin, harapan pada Allah', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(630, 12, 87, 'وَلَا تَيْأَسُوا مِنْ رَوْحِ اللَّهِ ۖ إِنَّهُ لَا يَيْأَسُ مِنْ رَوْحِ اللَّهِ إِلَّا الْقَوْمُ الْكَافِرُونَ', '...dan jangan kamu berputus asa dari rahmat Allah. Sesungguhnya yang berputus asa dari rahmat Allah, hanyalah kaum yang kafir.', 'Al-Qur\'an', 'kecewa, larangan putus asa, optimisme', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(631, 9, 129, 'فَإِنْ تَوَلَّوْا فَقُلْ حَسْبِيَ اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ ۖ عَلَيْهِ تَوَكَّلْتُ ۖ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ', 'Maka jika mereka berpaling (meninggalkanmu), katakanlah: \'Cukuplah Allah bagiku; tidak ada tuhan selain Dia. Hanya kepada-Nya aku bertawakal, dan Dia adalah Tuhan yang memiliki \'Arsy yang agung.\'', 'Al-Qur\'an', 'kecewa, ditinggalkan, kecukupan Allah', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(632, 93, 3, 'مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ', 'Tuhanmu tidak meninggalkan engkau (Muhammad) dan tidak (pula) membencimu.', 'Al-Qur\'an', 'kecewa, merasa ditinggalkan, kasih sayang Allah', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(633, 93, 5, 'وَلَسَوْفَ يُعْطِيكَ رَبُّكَ فَتَرْضَىٰ', 'Dan sungguh, kelak Tuhanmu pasti memberikan karunia-Nya kepadamu, sehingga engkau menjadi puas (ridha).', 'Al-Qur\'an', 'kecewa, penawar kecewa, kepuasan batin', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(634, 3, 153, 'لِكَيْ لَا تَحْزَنُوا عَلَىٰ مَا فَاتَكُمْ وَلَا مَا أَصَابَكُمْ', '...agar kamu tidak bersedih hati (kecewa) terhadap apa yang luput dari kamu dan terhadap apa yang menimpa kamu...', 'Al-Qur\'an', 'kecewa, kegagalan, takdir', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(635, 57, 23, 'لِكَيْ لَا تَأْسَوْا عَلَىٰ مَا فَاتَكُمْ وَلَا تَفْرَحُوا بِمَا آتَاكُمْ', 'Agar kamu tidak bersedih hati (kecewa) terhadap apa yang luput dari kamu, dan jangan pula terlalu bergembira terhadap apa yang diberikan-Nya kepadamu...', 'Al-Qur\'an', 'kecewa, lapang dada, qada dan qadar', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(636, 2, 216, 'وَعَسَىٰ أَنْ تَكْرَهُوا شَيْئًا وَهُوَ خَيْرٌ لَكُمْ ۖ وَعَسَىٰ أَنْ تُحِبُّوا شَيْئًا وَهُوَ شَرٌّ لَكُمْ ۗ وَاللَّهُ يَعْلَمُ وَأَنْتُمْ لَا تَعْلَمُونَ', '...Boleh jadi kamu membenci sesuatu, padahal ia amat baik bagimu, dan boleh jadi (pula) kamu menyukai sesuatu, padahal ia amat buruk bagimu; Allah mengetahui, sedang kamu tidak mengetahui.', 'Al-Qur\'an', 'kecewa, takdir, hikmah tersembunyi', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(637, 18, 6, 'فَلَعَلَّكَ بَاخِعٌ نَفْسَكَ عَلَىٰ آثَارِهِمْ إِنْ لَمْ يُؤْمِنُوا بِهَٰذَا الْحَدِيثِ أَسَفًا', 'Maka boleh jadi engkau (Muhammad) akan membinasakan dirimu karena bersedih hati (kecewa) setelah mereka berpaling, sekiranya mereka tidak beriman kepada keterangan ini (Al-Qur\'an).', 'Al-Qur\'an', 'kecewa, penolakan, beban mental', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(638, 26, 3, 'لَعَلَّكَ بَاخِعٌ نَفْسَكَ أَلَّا يَكُونُوا مُؤْمِنِينَ', 'Boleh jadi engkau (Muhammad) akan membinasakan dirimu (karena kecewa) karena mereka tidak beriman.', 'Al-Qur\'an', 'kecewa, empati Nabi, penolakan dakwah', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(639, 6, 33, 'قَدْ نَعْلَمُ إِنَّهُ لَيَحْزُنُكَ الَّذِي يَقُولُونَ ۖ فَإِنَّهُمْ لَا يُكَذِّبُونَكَ وَلَٰكِنَّ الظَّالِمِينَ بِآيَاتِ اللَّهِ يَجْحَدُونَ', 'Sungguh, Kami mengetahui bahwa apa yang mereka katakan itu menyedihkan (mengecewakan) hatimu, (maka janganlah berduka cita) karena sebenarnya mereka bukan mendustakan engkau, melainkan orang-orang zalim itu mengingkari ayat-ayat Allah.', 'Al-Qur\'an', 'kecewa, penghibur batin, penolakan', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(640, 15, 97, 'وَلَقَدْ نَعْلَمُ أَنَّكَ يَضِيقُ صَدْرُكَ بِمَا يَقُولُونَ', 'Dan sungguh, Kami mengetahui bahwa dadamu menjadi sempit (merasa kecewa/tertekan) disebabkan apa yang mereka katakan.', 'Al-Qur\'an', 'kecewa, penyempitan dada, kata-kata menyakitkan', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(641, 15, 98, 'فَسَبِّحْ بِحَمْدِ رَبِّكَ وَكُنْ مِنَ السَّاجِدِينَ', 'Maka bertasbihlah dengan memuji Tuhanmu dan jadilah engkau di antara orang-orang yang bersujud.', 'Al-Qur\'an', 'kecewa, penawar kekecewaan, tasbih dan sujud', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(642, 28, 10, 'وَأَصْبَحَ فُؤَادُ أُمِّ مُوسَىٰ فَارِغًا ۖ إِنْ كَادَتْ لَتُبْدِي بِهِ لَوْلَا أَنْ رَبَطْنَا عَلَىٰ قَلْبِهَا', 'Dan hati ibu Musa menjadi kosong (karena guncangan/kecewa mendalam). Sungguh, hampir saja dia menyatakan rahasia tentang Musa, seandainya tidak Kami teguhkan hatinya...', 'Al-Qur\'an', 'kecewa, kehampaan batin, keteguhan hati', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(643, 20, 86, 'فَرَجَعَ مُوسَىٰ إِلَىٰ قَوْمِهِ غَضْبَانَ أَسِفًا', 'Kemudian Musa kembali kepada kaumnya dengan marah dan kecewa hati...', 'Al-Qur\'an', 'kecewa, kekecewaan Musa, penyimpangan', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(644, 7, 150, 'وَلَمَّا رَجَعَ مُوسَىٰ إِلَىٰ قَوْمِهِ غَضْبَانَ أَسِفًا قَالَ بِئْسَمَا خَلَفْتُمُونِي مِنْ بَعْدِي', 'Dan ketika Musa telah kembali kepada kaumnya, dengan marah dan kecewa hati berkatalah dia: \'Alangkah buruknya perbuatan yang kamu kerjakan sesudah kepergianku!\'', 'Al-Qur\'an', 'kecewa, kekecewaan pada manusia, Nabi Musa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(645, 9, 92, 'تَوَلَّوْا وَأَعْيُنُهُمْ تَفِيضُ مِنَ الدَّمْعِ حَزَنًا أَلَّا يَجِدُوا مَا يُنْفِقُونَ', '...mereka kembali, sedang mata mereka bercucuran air mata karena sedih/kecewa, lantaran mereka tidak memperoleh apa yang akan mereka infakkan (untuk ikut berjuang).', 'Al-Qur\'an', 'kecewa, niat baik terhalang, air mata', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(646, 9, 25, 'وَيَوْمَ حُنَيْنٍ ۙ إِذْ أَعْجَبَتْكُمْ كَثْرَتُكُمْ فَلَمْ تُغْنِ عَنْكُمْ شَيْئًا وَضَاقَتْ عَلَيْكُمُ الْأَرْضُ بِمَا رَحُبَتْ ثُمَّ وَلَّيْتُمْ مُدْبِرِينَ', '...dan (ingatlah) perang Hunain, yaitu ketika kamu menjadi congkak karena banyaknya jumlahmu, maka jumlah yang banyak itu tidak memberi manfaat kepadamu sedikit pun, dan bumi yang luas itu terasa sempit olehmu, kemudian kamu lari berpaling ke belakang.', 'Al-Qur\'an', 'kecewa, ekspektasi salah, Perang Hunain', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(647, 22, 11, 'وَمِنَ النَّاسِ مَنْ يَعْبُدُ اللَّهَ عَلَىٰ حَرْفٍ ۖ فَإِنْ أَصَابَهُ خَيْرٌ اطْمَأَنَّ بِهِ ۖ وَإِنْ أَصَابَتْهُ فِتْنَةٌ انْقَلَبَ عَلَىٰ وَجْهِهِ خَسِرَ الدُّنْيَا وَالْآخِرَةَ', 'Dan di antara manusia ada orang yang menyembah Allah dengan berada di tepi; maka jika ia memperoleh kebaikan, tetaplah ia dalam keadaan itu, dan jika ia ditimpa suatu bencana (kecewa), berbaliklah ia ke belakang. Rugilah ia di dunia dan di akhirat.', 'Al-Qur\'an', 'kecewa, kemanjaan iman, ujian', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(648, 3, 139, 'وَلَا تَهِنُوا وَلَا تَحْزَنُوا وَأَنْتُمُ الْأَعْلَوْنَ إِنْ كُنْتُمْ مُؤْمِنِينَ', 'Janganlah kamu (merasa) lemah, dan jangan (pula) bersedih hati (kecewa), padahal kamu pun orang-orang yang paling tinggi (derajatnya), jika kamu orang-orang yang beriman.', 'Al-Qur\'an', 'kecewa, penguat mental, optimisme', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(649, 2, 214, 'مَسَّتْهُمُ الْبَأْسَاءُ وَالضَّرَّاءُ وَزُلْزِلُوا حَتَّىٰ يَقُولَ الرَّسُولُ وَالَّذِينَ آمَنُوا مَعَهُ مَتَىٰ نَصْرُ اللَّهِ ۗ أَلَا إِنَّ نَصْرَ اللَّهِ قَرِيبٌ', '...Mereka ditimpa kemelaratan, penderitaan dan digoncangkan (hatinya) sehingga berkatalah Rasul dan orang-orang yang beriman bersamanya: \'Bilakah datangnya pertolongan Allah?\' Ingatlah, sesungguhnya pertolongan Allah itu amat dekat.', 'Al-Qur\'an', 'kecewa, krisis batin, pertolongan dekat', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(650, 65, 3, 'وَمَنْ يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ', 'Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.', 'Al-Qur\'an', 'kecewa, penyandaran batin, tawakal', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(651, 39, 36, 'أَلَيْسَ اللَّهُ بِكَافٍ عَبْدَهُ', 'Bukankah Allah yang mencukupi hamba-Nya?', 'Al-Qur\'an', 'kecewa, kecukupan, penenang', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(652, 3, 173, 'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', 'Cukuplah Allah menjadi Penolong kami dan Dia adalah sebaik-baik Pelindung.', 'Al-Qur\'an', 'kecewa, tawakal, benteng jiwa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(653, 11, 77, 'وَلَمَّا جَاءَتْ رُسُلُنَا لُوطًا سِيءَ بِهِمْ وَضَاقَ بِهِمْ ذَرْعًا وَقَالَ هَٰذَا يَوْمٌ عَصِيبٌ', 'Dan ketika utusan-utusan Kami (para malaikat) itu datang kepada Lut, dia merasa curiga dan merasa sempit dadanya (kecewa/terdesak) karena kedatangan mereka, dan dia berkata: \'Ini adalah hari yang amat sulit.\'', 'Al-Qur\'an', 'kecewa, Nabi Lut, krisis terdesak', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(654, 21, 87, 'فَنَادَىٰ فِي الظُّلُمَاتِ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ', 'Maka dia (Yunus) berdoa dalam kegelapan: \'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.\'', 'Al-Qur\'an', 'kecewa, Nabi Yunus, krisis jiwa', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(655, 94, 5, 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Maka sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'kecewa, kemudahan, harapan', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(656, 94, 6, 'إِنَّ مَعَ الْعُسْرِ يُسْرًا', 'Sesungguhnya bersama kesulitan ada kemudahan.', 'Al-Qur\'an', 'kecewa, janji pasti, kepastian', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(657, 65, 7, 'سَيَجْعَلُ اللَّهُ بَعْدَ عُسْرٍ يُسْرًا', 'Allah kelak akan memberikan kelapangan setelah kesempitan.', 'Al-Qur\'an', 'kecewa, kelapangan, pergantian keadaan', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(658, 28, 24, 'رَبِّ إِنِّي لِمَا أَنْزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ', '(Musa berdoa): \'Ya Tuhanku, sesungguhnya aku sangat memerlukan sesuatu kebaikan yang Engkau turunkan kepadaku.\'', 'Al-Qur\'an', 'kecewa, Nabi Musa, permohonan hamba', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(659, 26, 62, 'قَالَ كَلَّا ۖ إِنَّ مَعِيَ رَبِّي سَيَهْدِينِ', 'Dia (Musa) menjawab: \'Sekali-kali tidak! Sesungguhnya Tuhanku bersamaku, Dia akan memberi petunjuk kepadaku.\'', 'Al-Qur\'an', 'kecewa, keyakinan batin, pertolongan', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(660, 2, 155, 'وَلَنَبْلُوَنَّكُمْ بِشَيْءٍ مِنَ الْخَوْفِ وَالْجُوعِ وَنَقْصٍ مِنَ الْأَمْوَالِ وَالْأَنْفُسِ وَالثَّمَرَاتِ ۗ وَبَشِّرِ الصَّابِرِينَ', 'Dan Kami pasti akan menguji kamu dengan sedikit ketakutan, kelaparan, kekurangan harta, jiwa, dan buah-buahan. Dan sampaikanlah kabar gembira kepada orang-orang yang sabar.', 'Al-Qur\'an', 'kecewa, ujian kegagalan, sabar', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45'),
(661, 2, 156, 'الَّذِينَ إِذَا أَصَابَتْهُمْ مُصِيبَةٌ قَالُوا إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ', '(yaitu) orang-orang yang apabila ditimpa musibah, mereka berkata: \'Inna lillahi wa inna ilaihi raji\'un\' (Sesungguhnya kami milik Allah dan kepada-Nyalah kami kembali).', 'Al-Qur\'an', 'kecewa, istirja, keikhlasan', 'approved', NULL, NULL, '2026-07-29 10:39:45', '2026-07-29 10:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `reflection_results`
--

CREATE TABLE `reflection_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `session_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(64) NOT NULL,
  `verse_id` int(10) UNSIGNED DEFAULT NULL,
  `hadith_id` int(10) UNSIGNED DEFAULT NULL,
  `advice` text DEFAULT NULL,
  `reflection_guide` text DEFAULT NULL,
  `printed` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reflection_results`
--

INSERT INTO `reflection_results` (`id`, `session_id`, `token`, `verse_id`, `hadith_id`, `advice`, `reflection_guide`, `printed`, `created_at`) VALUES
(1, 1, '16e05e9b12f3f9fd1a9575deaff9bd89', 392, 160, NULL, NULL, 0, '2026-07-29 13:05:02'),
(2, 1, '9f0c83f1cfb251815311d85c7b1820a2', 549, 11, NULL, NULL, 0, '2026-07-29 13:08:33'),
(3, 1, 'b53a2caee9a674071246190a3b448001', 33, 87, NULL, NULL, 0, '2026-07-29 13:10:12'),
(4, 1, '6890536136904489f27f869445b3c915', 273, 119, NULL, NULL, 0, '2026-07-29 13:16:17'),
(5, 1, 'cd4c2fd8002a4f47da31347bff7a59e9', 114, 209, NULL, NULL, 0, '2026-07-29 13:18:13'),
(6, 1, '7c924372b55caee94c4286724e335cd1', 597, 42, NULL, NULL, 0, '2026-07-29 13:22:52'),
(7, 1, '2a0e6883358a677ef6e57d8b24c98076', 132, 58, NULL, NULL, 0, '2026-07-29 13:26:00'),
(8, 1, 'd5f342218ce1937c13299b7374fa9689', 274, 115, NULL, NULL, 0, '2026-07-29 13:26:34'),
(9, 1, '5f0af81a48f278ea00804d411bc82161', 155, 143, NULL, NULL, 0, '2026-07-29 13:28:24'),
(10, 1, '62b63e9b60341ad6d03ed3b3a38611e8', 282, 9, NULL, NULL, 0, '2026-07-29 13:30:12'),
(11, 1, 'a3010fcdc43af8d23949e2e47f3bcd8a', 271, 120, NULL, NULL, 0, '2026-07-31 07:56:56'),
(12, 1, '5bfcfbd3e0e3bdce60070f2d9b3d9c7d', 243, 143, NULL, NULL, 0, '2026-07-31 09:47:26'),
(13, 1, '5f465a0965b70b5f3c5b574db9ff09c3', 295, 121, NULL, NULL, 0, '2026-07-31 09:48:09'),
(14, 1, '2e9ef4e35a6640fcc3fc95438a2f660c', 639, 26, NULL, NULL, 0, '2026-07-31 10:03:09'),
(15, 1, '41020c5536016f5b6c32798a3727ad73', 178, 118, NULL, NULL, 0, '2026-07-31 10:05:36'),
(16, 1, 'f7d17d33a1b7ad05911be9ab7d630397', 122, 40, NULL, NULL, 0, '2026-07-31 10:06:15'),
(17, 1, '95e0c801bbb5ee19d995383f66c5bd63', 112, 33, NULL, NULL, 0, '2026-07-31 10:12:49'),
(18, 1, 'd9191983826914267deaa437e013e6a4', 47, 309, NULL, NULL, 0, '2026-07-31 11:05:41'),
(19, 1, 'd21c8fe921c8268032b1dceb2ba09740', 348, 150, NULL, NULL, 0, '2026-07-31 11:08:04'),
(20, 1, '1e97f6f6becfa0257e4452c01108c7c5', 238, 95, NULL, NULL, 0, '2026-07-31 11:15:29'),
(21, 1, 'e46c176dd1e44a259701f7e0ec8385cf', 142, 295, NULL, NULL, 0, '2026-07-31 11:16:49'),
(22, 1, '555f5bbb1a611b2d160bd2dce4dabc93', 177, 63, NULL, NULL, 0, '2026-07-31 11:21:28'),
(23, 1, 'c2729d0cde0aa2119a93fcc180a524b4', 582, 94, NULL, NULL, 0, '2026-07-31 11:36:32'),
(24, 1, 'cb9cb261d53940edace0446c960ef657', 580, 263, NULL, NULL, 0, '2026-07-31 11:49:18'),
(25, 1, '999dc2c132815e4005a5a3e55b7916e8', 267, 116, NULL, NULL, 0, '2026-08-03 08:17:25'),
(26, 1, 'f03f97ac62e1cb1a232ed4114c705bc1', 264, 186, NULL, NULL, 0, '2026-08-03 08:21:57'),
(27, 1, '8ac128f90f102d68b382bfc16965a9e2', 249, 92, NULL, NULL, 0, '2026-08-03 08:24:15'),
(28, 1, '7c4618b38b0312ed8e69f81296333e1f', 174, 65, NULL, NULL, 0, '2026-08-03 08:43:01'),
(29, 1, 'c1c3e3705b76bcc9539d53dc467ec78c', 241, 97, NULL, NULL, 0, '2026-08-03 09:02:13'),
(30, 1, '6e89e5ed14914367ee67ac71e986515b', 233, 109, NULL, NULL, 0, '2026-08-03 09:02:40'),
(31, 1, 'd110a33e03df581b5437d3945106ee8d', 251, 95, NULL, NULL, 0, '2026-08-03 09:35:26'),
(32, 1, '05e4da0b48508a9b4add6dcdfdba2c07', 481, 42, NULL, NULL, 0, '2026-08-03 09:36:04'),
(33, 1, '4d3a9392cd24a49c57edde8d0e07a5d2', 234, 101, NULL, NULL, 0, '2026-08-03 11:20:43'),
(34, 1, '440aa92c359b7031559a602e94a439f6', 572, 281, NULL, NULL, 0, '2026-08-03 11:28:43'),
(35, 1, '991276f29d7dcf38265cbf88afb7ec3a', 645, 139, NULL, NULL, 0, '2026-08-03 11:29:17'),
(36, 1, '78194ee5bdbc95ff980c1a6699d255e6', 46, 302, NULL, NULL, 0, '2026-08-03 11:29:46'),
(37, 1, '1bfb42012127a7ff7a3951fdfd0df4cd', 646, 11, NULL, NULL, 0, '2026-08-03 11:30:22'),
(38, 1, 'c8f74b2f4749e2072b6ffb743d21c2e7', 102, 58, NULL, NULL, 0, '2026-08-03 11:45:43'),
(39, 1, '40bc968cee56223c8d28b94f37a0d0dd', 459, 267, NULL, NULL, 0, '2026-08-04 09:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `reflection_sessions`
--

CREATE TABLE `reflection_sessions` (
  `id` int(11) UNSIGNED NOT NULL,
  `kiosk_id` int(11) UNSIGNED NOT NULL,
  `location_id` int(11) UNSIGNED NOT NULL,
  `tenant_id` int(11) UNSIGNED NOT NULL,
  `visitor_name` varchar(255) DEFAULT NULL,
  `visitor_email` varchar(255) DEFAULT NULL,
  `emotion_id` int(11) UNSIGNED DEFAULT NULL,
  `context_id` int(11) UNSIGNED DEFAULT NULL,
  `cause_id` varchar(100) DEFAULT NULL,
  `story` text DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'in_progress',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reflection_sessions`
--

INSERT INTO `reflection_sessions` (`id`, `kiosk_id`, `location_id`, `tenant_id`, `visitor_name`, `visitor_email`, `emotion_id`, `context_id`, `cause_id`, `story`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 2, 3, NULL, NULL, 35, NULL, NULL, NULL, 'completed', '2026-07-29 12:15:49', '2026-08-04 09:31:44'),
(2, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:20:46', '2026-07-29 12:20:46'),
(3, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:21:57', '2026-07-29 12:21:57'),
(4, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:23:47', '2026-07-29 12:23:47'),
(5, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:25:34', '2026-07-29 12:25:34'),
(6, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:26:06', '2026-07-29 12:26:06'),
(7, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:26:22', '2026-07-29 12:26:22'),
(8, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:34:35', '2026-07-29 12:34:35'),
(9, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:37:42', '2026-07-29 12:37:42'),
(10, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:39:33', '2026-07-29 12:39:33'),
(11, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:41:50', '2026-07-29 12:41:50'),
(12, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:42:20', '2026-07-29 12:42:20'),
(13, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:42:40', '2026-07-29 12:42:40'),
(14, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:47:40', '2026-07-29 12:47:40'),
(15, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 12:58:37', '2026-07-29 12:58:37'),
(16, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:00:11', '2026-07-29 13:00:11'),
(17, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:02:20', '2026-07-29 13:02:20'),
(18, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:04:54', '2026-07-29 13:04:54'),
(19, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:08:25', '2026-07-29 13:08:25'),
(20, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:09:59', '2026-07-29 13:09:59'),
(21, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:14:30', '2026-07-29 13:14:30'),
(22, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:18:03', '2026-07-29 13:18:03'),
(23, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:20:39', '2026-07-29 13:20:39'),
(24, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:22:38', '2026-07-29 13:22:38'),
(25, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:24:27', '2026-07-29 13:24:27'),
(26, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:26:18', '2026-07-29 13:26:18'),
(27, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:28:12', '2026-07-29 13:28:12'),
(28, 5, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-29 13:30:01', '2026-07-29 13:30:01'),
(29, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:25:21', '2026-07-31 07:25:21'),
(30, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:26:07', '2026-07-31 07:26:07'),
(31, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:27:53', '2026-07-31 07:27:53'),
(32, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:29:01', '2026-07-31 07:29:01'),
(33, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:32:33', '2026-07-31 07:32:33'),
(34, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:35:21', '2026-07-31 07:35:21'),
(35, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:35:48', '2026-07-31 07:35:48'),
(36, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:39:00', '2026-07-31 07:39:00'),
(37, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:39:00', '2026-07-31 07:39:00'),
(38, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:40:23', '2026-07-31 07:40:23'),
(39, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:41:30', '2026-07-31 07:41:30'),
(40, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:47:40', '2026-07-31 07:47:40'),
(41, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:51:03', '2026-07-31 07:51:03'),
(42, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:53:05', '2026-07-31 07:53:05'),
(43, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 07:56:49', '2026-07-31 07:56:49'),
(44, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 09:47:19', '2026-07-31 09:47:19'),
(45, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 09:47:46', '2026-07-31 09:47:46'),
(46, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 09:47:46', '2026-07-31 09:47:46'),
(47, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 09:47:46', '2026-07-31 09:47:46'),
(48, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 09:48:02', '2026-07-31 09:48:02'),
(49, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 09:48:03', '2026-07-31 09:48:03'),
(50, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 10:02:27', '2026-07-31 10:02:27'),
(51, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 10:05:27', '2026-07-31 10:05:27'),
(52, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 10:06:08', '2026-07-31 10:06:08'),
(53, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 10:12:42', '2026-07-31 10:12:42'),
(54, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:05:34', '2026-07-31 11:05:34'),
(55, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:07:57', '2026-07-31 11:07:57'),
(56, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:15:20', '2026-07-31 11:15:20'),
(57, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:16:36', '2026-07-31 11:16:36'),
(58, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:21:17', '2026-07-31 11:21:17'),
(59, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:28:30', '2026-07-31 11:28:30'),
(60, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:28:37', '2026-07-31 11:28:37'),
(61, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:28:37', '2026-07-31 11:28:37'),
(62, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:29:08', '2026-07-31 11:29:08'),
(63, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:29:08', '2026-07-31 11:29:08'),
(64, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:29:08', '2026-07-31 11:29:08'),
(65, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:33:14', '2026-07-31 11:33:14'),
(66, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:35:57', '2026-07-31 11:35:57'),
(67, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:36:09', '2026-07-31 11:36:09'),
(68, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:40:01', '2026-07-31 11:40:01'),
(69, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-07-31 11:49:10', '2026-07-31 11:49:10'),
(70, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 08:17:06', '2026-08-03 08:17:06'),
(71, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 08:18:04', '2026-08-03 08:18:04'),
(72, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 08:21:45', '2026-08-03 08:21:45'),
(73, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 08:23:30', '2026-08-03 08:23:30'),
(74, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 08:24:21', '2026-08-03 08:24:21'),
(75, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 08:42:53', '2026-08-03 08:42:53'),
(76, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 08:43:08', '2026-08-03 08:43:08'),
(77, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 09:02:03', '2026-08-03 09:02:03'),
(78, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 09:02:34', '2026-08-03 09:02:34'),
(79, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 09:35:19', '2026-08-03 09:35:19'),
(80, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 09:35:54', '2026-08-03 09:35:54'),
(81, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 09:36:10', '2026-08-03 09:36:10'),
(82, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 11:20:32', '2026-08-03 11:20:32'),
(83, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 11:25:24', '2026-08-03 11:25:24'),
(84, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 11:29:02', '2026-08-03 11:29:02'),
(85, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 11:29:30', '2026-08-03 11:29:30'),
(86, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 11:30:12', '2026-08-03 11:30:12'),
(87, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 11:45:34', '2026-08-03 11:45:34'),
(88, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-03 11:48:19', '2026-08-03 11:48:19'),
(89, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'in_progress', '2026-08-04 09:30:22', '2026-08-04 09:30:22');

-- --------------------------------------------------------

--
-- Table structure for table `reflection_templates`
--

CREATE TABLE `reflection_templates` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `summary_template` text DEFAULT NULL,
  `reflection_template` text DEFAULT NULL,
  `question_template` text DEFAULT NULL,
  `disclaimer` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'super_admin', 'Full akses semua fitur platform', '2026-07-27 23:25:27'),
(2, 'tenant_owner', 'Kelola organisasi sendiri, approve kiosk request', '2026-07-27 23:25:27'),
(3, 'tenant_admin', 'Kelola data operasional tenant', '2026-07-27 23:25:27'),
(4, 'content_reviewer', 'Review dan approve konten (quran, hadis, emosi)', '2026-07-27 23:25:27'),
(5, 'finance', 'Kelola donasi dan kampanye', '2026-07-27 23:25:27'),
(6, 'viewer', 'Read-only akses semua data', '2026-07-27 23:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission`, `created_at`) VALUES
(5, 1, 'tenants.view', '2026-07-27 23:25:27'),
(6, 1, 'tenants.create', '2026-07-27 23:25:27'),
(7, 1, 'tenants.update', '2026-07-27 23:25:27'),
(8, 1, 'tenants.delete', '2026-07-27 23:25:27'),
(9, 1, 'tenants.approve', '2026-07-27 23:25:27'),
(10, 1, 'locations.view', '2026-07-27 23:25:27'),
(11, 1, 'locations.create', '2026-07-27 23:25:27'),
(12, 1, 'locations.update', '2026-07-27 23:25:27'),
(13, 1, 'locations.delete', '2026-07-27 23:25:27'),
(14, 1, 'kiosks.view', '2026-07-27 23:25:27'),
(15, 1, 'kiosks.create', '2026-07-27 23:25:27'),
(16, 1, 'kiosks.update', '2026-07-27 23:25:27'),
(17, 1, 'kiosks.delete', '2026-07-27 23:25:27'),
(18, 1, 'kiosks.activate', '2026-07-27 23:25:27'),
(19, 1, 'kiosks.revoke', '2026-07-27 23:25:27'),
(20, 1, 'kiosk_requests.view', '2026-07-27 23:25:27'),
(21, 1, 'kiosk_requests.create', '2026-07-27 23:25:27'),
(22, 1, 'kiosk_requests.approve', '2026-07-27 23:25:27'),
(23, 1, 'kiosk_requests.reject', '2026-07-27 23:25:27'),
(24, 1, 'content.view', '2026-07-27 23:25:27'),
(25, 1, 'content.create', '2026-07-27 23:25:27'),
(26, 1, 'content.update', '2026-07-27 23:25:27'),
(27, 1, 'content.delete', '2026-07-27 23:25:27'),
(28, 1, 'campaigns.view', '2026-07-27 23:25:27'),
(29, 1, 'campaigns.create', '2026-07-27 23:25:27'),
(30, 1, 'campaigns.update', '2026-07-27 23:25:27'),
(31, 1, 'campaigns.delete', '2026-07-27 23:25:27'),
(32, 1, 'donations.view', '2026-07-27 23:25:27'),
(33, 1, 'donations.manage', '2026-07-27 23:25:27'),
(34, 1, 'users.view', '2026-07-27 23:25:27'),
(35, 1, 'users.create', '2026-07-27 23:25:27'),
(36, 1, 'users.update', '2026-07-27 23:25:27'),
(37, 1, 'users.delete', '2026-07-27 23:25:27'),
(38, 1, 'roles.view', '2026-07-27 23:25:27'),
(39, 1, 'roles.manage', '2026-07-27 23:25:27'),
(40, 1, 'audit.view', '2026-07-27 23:25:27'),
(41, 1, 'settings.view', '2026-07-27 23:25:27'),
(42, 1, 'settings.update', '2026-07-27 23:25:27'),
(43, 2, 'tenants.view', '2026-07-27 23:25:27'),
(44, 2, 'tenants.update', '2026-07-27 23:25:27'),
(45, 2, 'locations.view', '2026-07-27 23:25:27'),
(46, 2, 'locations.create', '2026-07-27 23:25:27'),
(47, 2, 'locations.update', '2026-07-27 23:25:27'),
(48, 2, 'kiosks.view', '2026-07-27 23:25:27'),
(49, 2, 'kiosks.activate', '2026-07-27 23:25:27'),
(50, 2, 'kiosk_requests.view', '2026-07-27 23:25:27'),
(51, 2, 'kiosk_requests.create', '2026-07-27 23:25:27'),
(52, 2, 'content.view', '2026-07-27 23:25:27'),
(53, 2, 'campaigns.view', '2026-07-27 23:25:27'),
(54, 2, 'campaigns.create', '2026-07-27 23:25:27'),
(55, 2, 'donations.view', '2026-07-27 23:25:27'),
(56, 2, 'users.view', '2026-07-27 23:25:27'),
(57, 2, 'users.create', '2026-07-27 23:25:27'),
(58, 2, 'audit.view', '2026-07-27 23:25:27'),
(59, 3, 'tenants.view', '2026-07-27 23:25:27'),
(60, 3, 'locations.view', '2026-07-27 23:25:27'),
(61, 3, 'locations.create', '2026-07-27 23:25:27'),
(62, 3, 'locations.update', '2026-07-27 23:25:27'),
(63, 3, 'kiosks.view', '2026-07-27 23:25:27'),
(64, 3, 'kiosk_requests.view', '2026-07-27 23:25:27'),
(65, 3, 'kiosk_requests.create', '2026-07-27 23:25:27'),
(66, 3, 'content.view', '2026-07-27 23:25:27'),
(67, 3, 'content.create', '2026-07-27 23:25:27'),
(68, 3, 'content.update', '2026-07-27 23:25:27'),
(69, 3, 'campaigns.view', '2026-07-27 23:25:27'),
(70, 3, 'campaigns.create', '2026-07-27 23:25:27'),
(71, 3, 'donations.view', '2026-07-27 23:25:27'),
(72, 4, 'tenants.view', '2026-07-27 23:25:27'),
(73, 4, 'content.view', '2026-07-27 23:25:27'),
(74, 4, 'content.create', '2026-07-27 23:25:27'),
(75, 4, 'content.update', '2026-07-27 23:25:27'),
(76, 4, 'content.delete', '2026-07-27 23:25:27'),
(77, 5, 'tenants.view', '2026-07-27 23:25:27'),
(78, 5, 'donations.view', '2026-07-27 23:25:27'),
(79, 5, 'donations.manage', '2026-07-27 23:25:27'),
(80, 5, 'campaigns.view', '2026-07-27 23:25:27'),
(81, 5, 'campaigns.create', '2026-07-27 23:25:27'),
(82, 5, 'campaigns.update', '2026-07-27 23:25:27'),
(83, 5, 'campaigns.delete', '2026-07-27 23:25:27'),
(84, 5, 'audit.view', '2026-07-27 23:25:27'),
(85, 6, 'tenants.view', '2026-07-27 23:25:27'),
(86, 6, 'locations.view', '2026-07-27 23:25:27'),
(87, 6, 'kiosks.view', '2026-07-27 23:25:27'),
(88, 6, 'kiosk_requests.view', '2026-07-27 23:25:27'),
(89, 6, 'content.view', '2026-07-27 23:25:27'),
(90, 6, 'campaigns.view', '2026-07-27 23:25:27'),
(91, 6, 'donations.view', '2026-07-27 23:25:27'),
(92, 6, 'users.view', '2026-07-27 23:25:27'),
(93, 6, 'audit.view', '2026-07-27 23:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsors`
--

INSERT INTO `sponsors` (`id`, `name`, `contact_name`, `contact_email`, `phone`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test Sponsor', 'Sponsor Budi', NULL, NULL, 'active', '2026-07-25 18:46:55', '2026-07-25 18:46:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT 'masjid',
  `owner_user_id` int(11) UNSIGNED DEFAULT NULL,
  `logo_url` varchar(500) DEFAULT NULL,
  `cover_url` varchar(500) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `website_url` varchar(500) DEFAULT NULL,
  `social_links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`social_links`)),
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `verification_status` varchar(30) DEFAULT 'pending',
  `verification_notes` text DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `reviewed_by` int(11) UNSIGNED DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `name`, `slug`, `type`, `owner_user_id`, `logo_url`, `cover_url`, `bio`, `website_url`, `social_links`, `contact_name`, `contact_email`, `phone`, `address`, `status`, `verification_status`, `verification_notes`, `submitted_at`, `reviewed_at`, `reviewed_by`, `settings`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test Masjid Updated', '1784980009-test-masjid-crud', 'masjid', NULL, NULL, NULL, NULL, NULL, NULL, 'Budi', 'budi@test.com', NULL, NULL, 'active', 'pending', NULL, NULL, NULL, NULL, '[]', '2026-07-25 11:46:49', '2026-07-25 11:46:50', '2026-07-25 11:46:50'),
(2, 'Yayasan ABC', '1785158340-yayasan-abc', 'masjid', NULL, NULL, NULL, '', '', NULL, 'baba', 'yab@gmail.com', '081212121', 'Jl bahari 2 no 18 gandaria selatan, jakarta selatan', 'active', 'approved', NULL, '2026-07-27 13:51:42', '2026-07-27 15:29:32', 5, '[]', '2026-07-27 13:19:00', '2026-07-27 15:29:32', NULL),
(3, 'Yayasan Bunga Bangsa', '1785158528-yayasan-bunga-bangsa', 'masjid', NULL, NULL, NULL, NULL, NULL, NULL, 'baba', 'bab@gmail.com', '0818181', '', 'active', 'approved', NULL, '2026-07-27 15:29:23', '2026-07-27 15:29:36', 5, '[]', '2026-07-27 13:22:08', '2026-07-27 15:29:36', NULL),
(4, 'Masjid Test Onboarding', '1785161712-masjid-test-onboarding', 'masjid', NULL, NULL, NULL, NULL, NULL, NULL, 'Budi', 'budi@test.com', '08123456789', 'Jl Test No 1', 'active', 'pending', NULL, NULL, NULL, NULL, '[]', '2026-07-27 14:15:12', '2026-07-27 14:15:12', '2026-07-27 15:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'viewer',
  `tenant_id` int(11) UNSIGNED DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `login_attempts` int(11) NOT NULL DEFAULT 0,
  `locked_until` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `role`, `tenant_id`, `status`, `login_attempts`, `locked_until`, `last_login_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test User Updated', 'admin@refleksidiri.id', '$2y$10$7iTsm3mGqEQT1tPJ2t6nn.ZcY.uH1i4UxahvjWarOx2sce2nN40xO', 'super_admin', NULL, 'active', 0, NULL, '2026-07-31 06:52:06', '2026-07-24 23:50:47', '2026-07-25 11:15:02', '2026-07-25 11:15:02'),
(2, 'Super Admin', 'admin@refleksi.app', '$2y$10$SSdi6zExCCnYw7FAbVZHMu4Q.jkZoTZViSrizPi01e6wToICXgbgi', 'admin', NULL, 'active', 0, NULL, NULL, '2026-07-25 18:05:31', '2026-07-25 18:05:31', NULL),
(3, 'Test User', 'testuser@test.com', '$2y$10$uLz/eXd0aWkSj86sHjFrfuXIXSaidmaie.8znb0nMTxRn40R8cGEe', 'mosque_admin', NULL, 'active', 0, NULL, '2026-07-27 16:42:40', '2026-07-25 11:15:01', '2026-07-25 11:15:01', NULL),
(4, 'Test User Updated', 'testuser@refleksi.test', '$2y$10$I4cr00uOQVNyBJvDtRnpL.GY.0l4t9IRUcCnikkcHvAn7iRMHXxe.', 'mosque_admin', NULL, 'active', 0, NULL, NULL, '2026-07-25 11:46:52', '2026-07-25 11:46:52', '2026-07-25 11:46:52'),
(5, 'dek jiman', 'dekjima@gmail.com', '$2y$10$E9ze6ZRK81gymQXFH1.zDuCxhOcqrxMbLh.0D8.rrp7cde5BChYRC', 'tenant_admin', NULL, 'active', 0, NULL, '2026-07-27 16:56:47', '2026-07-27 10:57:12', '2026-07-27 12:38:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role_assignments`
--

CREATE TABLE `user_role_assignments` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `scope_type` varchar(20) DEFAULT 'global',
  `scope_id` int(11) UNSIGNED DEFAULT NULL,
  `tenant_id` int(11) UNSIGNED DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role_assignments`
--

INSERT INTO `user_role_assignments` (`id`, `user_id`, `role_id`, `scope_type`, `scope_id`, `tenant_id`, `valid_from`, `valid_until`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'global', NULL, NULL, NULL, NULL, 'active', '2026-07-27 23:25:27', '2026-07-27 23:25:27'),
(2, 3, 6, 'global', NULL, NULL, NULL, NULL, 'active', '2026-07-27 23:39:04', '2026-07-27 23:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token_hash` varchar(64) NOT NULL,
  `refresh_token_hash` varchar(64) NOT NULL,
  `device_fingerprint` varchar(255) DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`id`, `user_id`, `token_hash`, `refresh_token_hash`, `device_fingerprint`, `expires_at`, `revoked_at`, `created_at`) VALUES
(1, 1, '1c8adab9ee7ed68d9550dc79af8450eddad7d5b3e417bd8f83166b4bfbe19706', 'c7cac3c115c7fe5566602818031d8d43ed6e80b3a69c3dd684c5ab999f7b34d7', '', '2026-07-26 11:09:13', NULL, '2026-07-25 11:09:13'),
(2, 1, '7e676f60d7bf046811de8d8377e3b9cdbea1e304185bd839271ba87f022bab26', '53143a36ca90ca544e657b947e40163da8b7a3742c994bffb8bad6c23e4a6e22', '', '2026-07-26 11:15:00', '2026-07-25 11:15:00', '2026-07-25 11:15:00'),
(3, 1, '36797c434532eb284bb120be4385fd8fbe20d25ab97739bbbfeda6109e0a4244', '53143a36ca90ca544e657b947e40163da8b7a3742c994bffb8bad6c23e4a6e22', '', '2026-07-26 11:15:00', NULL, '2026-07-25 11:15:00'),
(4, 1, 'f0508ab66b3a4ec512d6bb19db31378b3e5bd7537d4c0d71c354c5b061fd0586', '53143a36ca90ca544e657b947e40163da8b7a3742c994bffb8bad6c23e4a6e22', '', '2026-07-26 11:15:00', NULL, '2026-07-25 11:15:00'),
(5, 1, '5aa02c19f798bcda69e7e7a6edf8a09e84e3aa8808cc5b8f7d570354c05aeda7', '7f41e4c4045da1e3897147bfef21442d263c7ae7078d6b93b6a760857b06479f', '', '2026-07-26 11:46:49', '2026-07-25 11:46:49', '2026-07-25 11:46:49'),
(6, 1, '6a855f76900fbc551629e3f7832a8af6799b493a2fbc16909197c8cf92f0c2e0', '7f41e4c4045da1e3897147bfef21442d263c7ae7078d6b93b6a760857b06479f', '', '2026-07-26 11:46:49', NULL, '2026-07-25 11:46:49'),
(7, 1, 'd17c6846a6c0a7784ab9d4e5282b991eb1f31ac6dcb82236b190e865460cb95b', '7f41e4c4045da1e3897147bfef21442d263c7ae7078d6b93b6a760857b06479f', '', '2026-07-26 11:46:49', NULL, '2026-07-25 11:46:49'),
(8, 1, '07d95b4066be49eb717f10c0f277a649a59468c993ad2351d8b5a913fe557e8a', '82f92b61a5ef1ed77c519248ccff68fb5d95516aaab4d6af4927599973e1ec4b', '', '2026-07-26 12:28:08', NULL, '2026-07-25 12:28:08'),
(9, 1, '5b162ede224439808f9229ea7edf6ef98c67ac1afe6e153f2bfa980251c92892', 'd40c6f7dd0d4bf7b813c8463a9f723becd3f1f46b6b7ce0943291d6f67c86cc6', '', '2026-07-26 12:39:07', NULL, '2026-07-25 12:39:07'),
(10, 5, 'bc55995ab99010d0aabbce7f8dab339e0f01edf78414e1cbb52d09269e48dab4', '6eeb78d8348e7c3de31a0eba87d78983f4ef9c3452a2b9ea926114ab3db7f170', 'email_verification', '2026-07-28 10:57:12', '2026-07-27 12:38:00', '2026-07-27 10:57:12'),
(11, 5, '108137ae3eeae8b01f5736d6751f580e636ddee89d6feaeeb479269bfffd4a56', 'c6c6775967873fd7b25925f11bd7f060914f9d8cf7226efd8343c58d35d7b6e3', 'email_verification', '2026-07-28 12:38:00', '2026-07-27 12:38:16', '2026-07-27 12:38:00'),
(12, 5, 'f1629bd2e4f1f5f2279f0885f5fb3082d6f3ba2bd819c2d413506f0ffde5d13a', 'b222b3b34f7ef6d43189f60d23c4634214760c50637e9230d97fcddd4a05ee3f', NULL, '2026-07-28 12:38:16', NULL, '2026-07-27 12:38:16'),
(13, 5, '2566e96d0c19800c7a3be1f9e31cb9310e184ad9a9c396483529370915584613', '78bdfea59cf9dd7983263c58c76d1ad52aaa10b61cb497282e7d580815c9bcae', '', '2026-07-28 13:19:41', NULL, '2026-07-27 13:19:41'),
(14, 5, '3b4df240225486a3abb58fb42dc7a560ac37702c9f7b4efc410b31d34b66f655', 'fc1b77f83a7bdcc190de64899c76d6b983c60d8ba7660c572e981bc4fc879a6c', '', '2026-07-28 13:41:42', NULL, '2026-07-27 13:41:42'),
(15, 5, '2fed65ef9d6c59a691269955f0d66fabe2a6c2223cde0419cdb77450514c0749', 'cd11f8de21f5dc40fa7e456b6d77a067dabc9ce42b429adc50064adc4df95206', '', '2026-07-28 13:57:06', NULL, '2026-07-27 13:57:06'),
(16, 1, '4411032afb178d540463c43e3ccc7f7f7f1375f3b069fc5b9ac05646ff0bdbdc', '3736420f70e3a57d833d0973bab56be84117239ebb125a980ac503fc2611b3ac', '', '2026-07-28 14:12:40', NULL, '2026-07-27 14:12:40'),
(17, 1, '2421c1cd15de911ddbfdfd25d5bcbd58ef5d85218846a2c4cb31d52b9cc8f9b4', '33930ca1293df622edad9b77ec7ae16892e2c11cf91db8a076c67881fa24a586', '', '2026-07-28 16:31:33', NULL, '2026-07-27 16:31:33'),
(18, 1, 'bd722f9b4a38491ba8cbbe27c24af75e769ef93f8c7c61d6243ec61b4a55d4f8', '1b1f3fafab8c051de28d56853030766d5a57f8816127bb70217664dccb20ab48', '', '2026-07-28 16:31:44', NULL, '2026-07-27 16:31:44'),
(19, 3, '36eb0705169046d8e9d3707a0c4e4e9d548f4a571d67e0ee45f6f74f54319bfe', '575699d85fb210bf6afd930fe271f09694a5bf3505c567f1e1487a35f22b1d65', '', '2026-07-28 16:42:40', NULL, '2026-07-27 16:42:40'),
(20, 5, '76517def36352da0cac3b6cd690c9630456359154639fefe2c4670706c07c555', '47f0875b6959de248325c1c782ac50ea49d1ddad01140696b29d905582165ae6', '', '2026-07-28 16:56:48', NULL, '2026-07-27 16:56:48'),
(21, 1, '6e27473a243cdcc7d619a1522e9704ff035261b3ffaf6098b66b5468fc585882', '5c43f7c674df50756fadd8cf96426547865b59552839b3e37298637d8771a7c5', '', '2026-07-30 06:50:28', NULL, '2026-07-29 06:50:28'),
(22, 1, 'fae9de9c4d775b90b3ef864035a94b250ab962746576968f9b42991ef55ebf8a', 'bb36f1548318b20701a9ae9882e6f57711a074ae3ac1b89358c6b1ba4fcbb575', '', '2026-07-30 07:01:05', NULL, '2026-07-29 07:01:05'),
(23, 1, 'b12f1a010766740009737fe988679c6d7f3e75985ed22df040970de3c7d37fac', 'a1747a29f217d452479978e27239c1ac8068044d4c73aec903167bda74e1d057', '', '2026-07-30 12:05:28', NULL, '2026-07-29 12:05:28'),
(24, 1, 'b1baeb89b6ffa6b4c6f541e89ff0e872052a0cbc501acde46817d97c4bf451e4', '834bcad31647a62aa55d59dfc0636d4cc04dcfd069148fddee3c7f1c13c0d14c', '', '2026-08-01 06:42:44', NULL, '2026-07-31 06:42:44'),
(25, 1, 'ed17f95deceeff77ed9a4a563e57dafe410ff9320ac986015815f4d264ad4a10', 'cf8bc4978ba4fa919f6f7e2cedf0768c0b97c95ad93624f6fe99f956670d2032', '', '2026-08-01 06:48:48', NULL, '2026-07-31 06:48:48'),
(26, 1, '5bc208f4360b5babc577e534c2bb5b36fb838851392244bc2a56ad4acb1b8e27', 'b8b37165606729c471b04baa6c7db8a55f5550c78e0cc0d5991fe92fd7586762', '', '2026-08-01 06:48:52', NULL, '2026-07-31 06:48:52'),
(27, 1, '26c200afe04ff01bf2e96949b11fc808453a0f75692b7f17e2e4ac696bfae351', '29608189b23b612575795293eaf8a79450986c0e46e6738cee3c86a281ab30a2', '', '2026-08-01 06:48:59', NULL, '2026-07-31 06:48:59'),
(28, 1, '40e0c5d320d28450cac0f7e54095ea2c123a1336cb95d956a60f18d70fd00c7a', '65f1282ea5d3495ee709d58153aa653b83165f085aae584c6071049b675f9fd9', '', '2026-08-01 06:52:06', NULL, '2026-07-31 06:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `xendit_static_qrs`
--

CREATE TABLE `xendit_static_qrs` (
  `id` int(10) UNSIGNED NOT NULL,
  `xendit_qr_id` varchar(100) NOT NULL,
  `external_id` varchar(100) NOT NULL,
  `qr_string` text NOT NULL,
  `tenant_id` int(10) UNSIGNED DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `xendit_static_qrs`
--

INSERT INTO `xendit_static_qrs` (`id`, `xendit_qr_id`, `external_id`, `qr_string`, `tenant_id`, `location_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'qr_3b57ef1e-fa58-4b1f-baae-0a223d1927a3', 'STATIC-T3-L2', 'some-random-qr-string', 3, 2, 'active', '2026-07-29 12:55:07', '2026-07-29 12:55:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_resource_type` (`resource_type`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sponsor_id` (`sponsor_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `campaign_plays`
--
ALTER TABLE `campaign_plays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_campaign_id` (`campaign_id`),
  ADD KEY `idx_kiosk_id` (`kiosk_id`);

--
-- Indexes for table `contexts`
--
ALTER TABLE `contexts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_activations`
--
ALTER TABLE `device_activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kiosk_id` (`kiosk_id`),
  ADD KEY `idx_code_hash` (`activation_code_hash`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference` (`reference`),
  ADD KEY `idx_session_id` (`session_id`),
  ADD KEY `idx_reference` (`reference`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_xendit_external_id` (`xendit_external_id`),
  ADD KEY `idx_xendit_payment_request_id` (`xendit_payment_request_id`),
  ADD KEY `idx_expires_at` (`expires_at`),
  ADD KEY `idx_tenant_id` (`tenant_id`),
  ADD KEY `idx_campaign_id` (`campaign_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `emotions`
--
ALTER TABLE `emotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hadiths`
--
ALTER TABLE `hadiths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `kiosks`
--
ALTER TABLE `kiosks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kiosk_code` (`kiosk_code`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `kiosk_heartbeats`
--
ALTER TABLE `kiosk_heartbeats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kiosk_id` (`kiosk_id`);

--
-- Indexes for table `kiosk_requests`
--
ALTER TABLE `kiosk_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_number` (`request_number`),
  ADD KEY `idx_tenant` (`tenant_id`),
  ADD KEY `idx_location` (`location_id`),
  ADD KEY `idx_requested_by` (`requested_by`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `kiosk_tokens`
--
ALTER TABLE `kiosk_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kiosk_id` (`kiosk_id`),
  ADD KEY `idx_token_hash` (`token_hash`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_webhooks`
--
ALTER TABLE `payment_webhooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_donation_id` (`donation_id`);

--
-- Indexes for table `print_jobs`
--
ALTER TABLE `print_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_session_id` (`session_id`),
  ADD KEY `idx_kiosk_id` (`kiosk_id`);

--
-- Indexes for table `quran_verses`
--
ALTER TABLE `quran_verses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `reflection_results`
--
ALTER TABLE `reflection_results`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_session_id` (`session_id`),
  ADD KEY `idx_token` (`token`);

--
-- Indexes for table `reflection_sessions`
--
ALTER TABLE `reflection_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kiosk_id` (`kiosk_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `reflection_templates`
--
ALTER TABLE `reflection_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_role_id` (`role_id`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_role_assignments`
--
ALTER TABLE `user_role_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_role` (`role_id`),
  ADD KEY `idx_tenant` (`tenant_id`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_token_hash` (`token_hash`);

--
-- Indexes for table `xendit_static_qrs`
--
ALTER TABLE `xendit_static_qrs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_external_id` (`external_id`),
  ADD KEY `idx_tenant_id` (`tenant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `campaign_plays`
--
ALTER TABLE `campaign_plays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contexts`
--
ALTER TABLE `contexts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `device_activations`
--
ALTER TABLE `device_activations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `emotions`
--
ALTER TABLE `emotions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `hadiths`
--
ALTER TABLE `hadiths`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT for table `kiosks`
--
ALTER TABLE `kiosks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kiosk_heartbeats`
--
ALTER TABLE `kiosk_heartbeats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kiosk_requests`
--
ALTER TABLE `kiosk_requests`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kiosk_tokens`
--
ALTER TABLE `kiosk_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `payment_webhooks`
--
ALTER TABLE `payment_webhooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `print_jobs`
--
ALTER TABLE `print_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quran_verses`
--
ALTER TABLE `quran_verses`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=662;

--
-- AUTO_INCREMENT for table `reflection_results`
--
ALTER TABLE `reflection_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `reflection_sessions`
--
ALTER TABLE `reflection_sessions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `reflection_templates`
--
ALTER TABLE `reflection_templates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_role_assignments`
--
ALTER TABLE `user_role_assignments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `xendit_static_qrs`
--
ALTER TABLE `xendit_static_qrs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
