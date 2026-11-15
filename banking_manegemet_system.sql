-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 15, 2026 at 02:37 PM
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
-- Database: `banking_manegemet_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` bigint UNSIGNED NOT NULL,
  `account_number` varchar(30) NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `account_type_id` int UNSIGNED NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `account_status` enum('ACTIVE','FROZEN','CLOSED') DEFAULT 'ACTIVE',
  `opened_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `account_number`, `customer_id`, `branch_id`, `account_type_id`, `balance`, `account_status`, `opened_at`) VALUES
(1, '100100001', 1, 1, 3, '32000.00', 'ACTIVE', '2026-11-12 05:32:07'),
(2, '100100002', 2, 2, 1, '34750.00', 'ACTIVE', '2026-11-12 05:32:07'),
(3, '100100003', 3, 3, 2, '35250.00', 'ACTIVE', '2026-11-12 05:32:07'),
(4, '100100004', 4, 1, 1, '42200.00', 'ACTIVE', '2026-11-12 05:32:07'),
(5, '100100005', 5, 2, 3, '34750.00', 'ACTIVE', '2026-11-12 05:32:07'),
(6, '100100006', 6, 3, 1, '44500.00', 'ACTIVE', '2026-11-12 05:32:07'),
(7, '100100007', 7, 1, 2, '48300.00', 'ACTIVE', '2026-11-12 05:32:07'),
(8, '100100008', 8, 2, 3, '48500.00', 'ACTIVE', '2026-11-12 05:32:07'),
(9, '100100009', 9, 3, 2, '54800.00', 'ACTIVE', '2026-11-12 05:32:07'),
(10, '100100010', 10, 1, 1, '49500.00', 'ACTIVE', '2026-11-12 05:32:07'),
(11, '100100011', 11, 2, 2, '55750.00', 'ACTIVE', '2026-11-12 05:32:07'),
(12, '100100012', 12, 3, 1, '61700.00', 'ACTIVE', '2026-11-12 05:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `account_type_id` int UNSIGNED NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `minimum_balance` decimal(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`account_type_id`, `type_name`, `description`, `minimum_balance`) VALUES
(1, 'Savings', 'General savings account', '500.00'),
(2, 'Current', 'Everyday business/current account', '1000.00'),
(3, 'Student', 'Student savings account', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` bigint UNSIGNED NOT NULL,
  `branch_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `branch_name`, `branch_code`, `location`, `created_at`) VALUES
(1, 'Dhaka Main Branch', 'DHK-001', 'Motijheel, Dhaka', '2026-11-12 05:32:07'),
(2, 'Chattogram Branch', 'CTG-001', 'Agrabad, Chattogram', '2026-11-12 05:32:07'),
(3, 'Khulna Branch', 'KHL-001', 'KDA Avenue, Khulna', '2026-11-12 05:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `card_id` bigint UNSIGNED NOT NULL,
  `account_id` bigint UNSIGNED NOT NULL,
  `card_reference` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_type` enum('DEBIT','CREDIT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `card_status` enum('ACTIVE','BLOCKED','EXPIRED') COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVE',
  `issued_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`card_id`, `account_id`, `card_reference`, `card_type`, `expiry_date`, `card_status`, `issued_at`) VALUES
(1, 1, 'DEMO-CARD-0001', 'DEBIT', '2029-12-31', 'ACTIVE', '2026-11-12 05:32:07'),
(2, 2, 'DEMO-CARD-0002', 'DEBIT', '2029-12-31', 'ACTIVE', '2026-11-12 05:32:07'),
(3, 3, 'DEMO-CARD-0003', 'DEBIT', '2029-12-31', 'ACTIVE', '2026-11-12 05:32:07'),
(4, 4, 'DEMO-CARD-0004', 'DEBIT', '2029-12-31', 'BLOCKED', '2026-11-12 05:32:07'),
(5, 5, 'DEMO-CARD-0005', 'DEBIT', '2029-12-31', 'ACTIVE', '2026-11-12 05:32:07'),
(6, 6, 'DEMO-CARD-0006', 'CREDIT', '2029-12-31', 'ACTIVE', '2026-11-12 05:32:07'),
(7, 7, 'DEMO-CARD-0007', 'DEBIT', '2029-12-31', 'ACTIVE', '2026-11-12 05:32:07'),
(8, 8, 'DEMO-CARD-0008', 'DEBIT', '2029-12-31', 'ACTIVE', '2026-11-12 05:32:07'),
(9, 9, 'DEMO-CARD-0009', 'DEBIT', '2029-12-31', 'ACTIVE', '2026-11-12 05:32:07'),
(10, 10, 'DEMO-CARD-0010', 'DEBIT', '2029-12-31', 'ACTIVE', '2026-11-12 05:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `full_name`, `email`, `phone`, `address`, `date_of_birth`, `created_at`) VALUES
(1, 'Ummey Salma', 'ummeysalma1@example.com', '01700000001', 'Jatrabari, Dhaka', '2002-04-18', '2026-11-12 05:32:07'),
(2, 'Nadia Rahman', 'nadiarahman2@example.com', '01700000002', 'Uttara, Dhaka', '2001-09-05', '2026-11-12 05:32:07'),
(3, 'Arif Hossain', 'arifhossain3@example.com', '01700000003', 'Agrabad, Chattogram', '1999-12-22', '2026-11-12 05:32:07'),
(4, 'Nusrat Jahan', 'nusratjahan4@example.com', '01700000004', 'Khulshi, Chattogram', '2003-01-14', '2026-11-12 05:32:07'),
(5, 'Fahim Ahmed', 'fahimahmed5@example.com', '01700000005', 'Sonadanga, Khulna', '2000-06-09', '2026-11-12 05:32:07'),
(6, 'Tania Sultana', 'taniasultana6@example.com', '01700000006', 'Dhanmondi, Dhaka', '2002-11-30', '2026-11-12 05:32:07'),
(7, 'Sakib Hasan', 'sakibhasan7@example.com', '01700000007', 'Pahartali, Chattogram', '2001-08-07', '2026-11-12 05:32:07'),
(8, 'Rafia Islam', 'rafiaislam8@example.com', '01700000008', 'Khalishpur, Khulna', '2003-03-21', '2026-11-12 05:32:07'),
(9, 'Rakib Chowdhury', 'rakibchowdhury9@example.com', '01700000009', 'Badda, Dhaka', '1998-07-11', '2026-11-12 05:32:07'),
(10, 'Tamanna Akter', 'tamannaakter10@example.com', '01700000010', 'GEC, Chattogram', '2004-02-25', '2026-11-12 05:32:07'),
(11, 'Mahmudul Hasan', 'mahmudulhasan11@example.com', '01700000011', 'Banani, Dhaka', '1997-10-03', '2026-11-12 05:32:07'),
(12, 'Farzana Yasmin', 'farzanayasmin12@example.com', '01700000012', 'Boyra, Khulna', '2000-05-19', '2026-11-12 05:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `designation` varchar(100) NOT NULL,
  `salary` decimal(15,2) DEFAULT '0.00',
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `branch_id`, `full_name`, `email`, `phone`, `designation`, `salary`, `hire_date`) VALUES
(1, 1, 'Rehan Karim', 'rehan.karim@example.com', '01600000001', 'Branch Manager', '65000.00', '2022-01-15'),
(2, 1, 'Maliha Tasnim', 'maliha.tasnim@example.com', '01600000002', 'Cash Officer', '35000.00', '2023-02-10'),
(3, 2, 'Imran Kabir', 'imran.kabir@example.com', '01600000003', 'Branch Manager', '62000.00', '2021-09-20'),
(4, 2, 'Sharmin Afroz', 'sharmin.afroz@example.com', '01600000004', 'Loan Officer', '40000.00', '2024-01-03'),
(5, 3, 'Mahin Sarker', 'mahin.sarker@example.com', '01600000005', 'Branch Manager', '60000.00', '2020-06-11'),
(6, 3, 'Tasfia Nawal', 'tasfia.nawal@example.com', '01600000006', 'Customer Service Officer', '32000.00', '2025-03-05');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loan_id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `loan_amount` decimal(15,2) NOT NULL,
  `interest_rate` decimal(5,2) DEFAULT '0.00',
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `loan_status` enum('PENDING','APPROVED','REJECTED','PAID') DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`loan_id`, `customer_id`, `branch_id`, `loan_amount`, `interest_rate`, `loan_date`, `due_date`, `loan_status`) VALUES
(1, 1, 1, '40000.00', '8.50', '2026-08-15', '2027-08-15', 'APPROVED'),
(2, 3, 3, '120000.00', '10.00', '2026-08-28', '2028-08-28', 'APPROVED'),
(3, 5, 2, '30000.00', '0.00', '2026-07-01', '2026-10-01', 'PAID'),
(4, 7, 1, '55000.00', '9.00', '2026-09-10', '2027-09-10', 'APPROVED'),
(5, 9, 3, '80000.00', '11.00', '2026-10-10', '2027-10-10', 'PENDING'),
(6, 11, 2, '60000.00', '12.00', '2026-10-12', '2027-10-12', 'REJECTED');

-- --------------------------------------------------------

--
-- Table structure for table `loan_payments`
--

CREATE TABLE `loan_payments` (
  `payment_id` bigint UNSIGNED NOT NULL,
  `loan_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` enum('CASH','BANK_TRANSFER','CARD') DEFAULT 'CASH'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `loan_payments`
--

INSERT INTO `loan_payments` (`payment_id`, `loan_id`, `amount`, `payment_date`, `payment_method`) VALUES
(1, 1, '2500.00', '2026-09-15 04:00:00', 'CASH'),
(2, 1, '2500.00', '2026-10-15 04:00:00', 'BANK_TRANSFER'),
(3, 1, '2500.00', '2026-11-10 04:00:00', 'BANK_TRANSFER'),
(4, 2, '5000.00', '2026-09-28 04:00:00', 'BANK_TRANSFER'),
(5, 2, '5000.00', '2026-10-28 04:00:00', 'BANK_TRANSFER'),
(6, 3, '10000.00', '2026-08-01 04:00:00', 'CASH'),
(7, 3, '10000.00', '2026-09-01 04:00:00', 'CASH'),
(8, 3, '10000.00', '2026-10-01 04:00:00', 'CASH'),
(9, 4, '3000.00', '2026-10-10 04:00:00', 'CARD'),
(10, 4, '3000.00', '2026-11-10 04:00:00', 'BANK_TRANSFER');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` bigint UNSIGNED NOT NULL,
  `account_id` bigint UNSIGNED NOT NULL,
  `transaction_type` enum('DEPOSIT','WITHDRAW','TRANSFER_IN','TRANSFER_OUT') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `account_id`, `transaction_type`, `amount`, `description`, `transaction_date`) VALUES
(1, 1, 'DEPOSIT', '23750.00', 'Opening cash deposit', '2026-08-05 03:19:00'),
(2, 2, 'DEPOSIT', '26500.00', 'Opening cash deposit', '2026-08-05 03:23:00'),
(3, 3, 'DEPOSIT', '29250.00', 'Opening cash deposit', '2026-08-05 03:27:00'),
(4, 4, 'DEPOSIT', '32000.00', 'Opening cash deposit', '2026-08-05 03:31:00'),
(5, 5, 'DEPOSIT', '34750.00', 'Opening cash deposit', '2026-08-05 03:35:00'),
(6, 6, 'DEPOSIT', '37500.00', 'Opening cash deposit', '2026-08-05 03:39:00'),
(7, 7, 'DEPOSIT', '40250.00', 'Opening cash deposit', '2026-08-05 03:43:00'),
(8, 8, 'DEPOSIT', '43000.00', 'Opening cash deposit', '2026-08-05 03:47:00'),
(9, 9, 'DEPOSIT', '45750.00', 'Opening cash deposit', '2026-08-05 03:51:00'),
(10, 10, 'DEPOSIT', '48500.00', 'Opening cash deposit', '2026-08-05 03:55:00'),
(11, 11, 'DEPOSIT', '51250.00', 'Opening cash deposit', '2026-08-05 03:59:00'),
(12, 12, 'DEPOSIT', '54000.00', 'Opening cash deposit', '2026-08-05 04:03:00'),
(13, 1, 'WITHDRAW', '750.00', 'Cash withdrawal', '2026-08-19 10:14:00'),
(14, 2, 'WITHDRAW', '2000.00', 'Cash withdrawal', '2026-08-19 10:18:00'),
(15, 3, 'WITHDRAW', '3250.00', 'Cash withdrawal', '2026-08-19 10:22:00'),
(16, 4, 'WITHDRAW', '1500.00', 'Cash withdrawal', '2026-08-19 10:26:00'),
(17, 5, 'WITHDRAW', '2750.00', 'Cash withdrawal', '2026-08-19 10:30:00'),
(18, 6, 'WITHDRAW', '1000.00', 'Cash withdrawal', '2026-08-19 10:34:00'),
(19, 7, 'WITHDRAW', '2250.00', 'Cash withdrawal', '2026-08-19 10:38:00'),
(20, 8, 'WITHDRAW', '3500.00', 'Cash withdrawal', '2026-08-19 10:42:00'),
(21, 9, 'WITHDRAW', '1750.00', 'Cash withdrawal', '2026-08-19 10:46:00'),
(22, 10, 'WITHDRAW', '3000.00', 'Cash withdrawal', '2026-08-19 10:50:00'),
(23, 11, 'WITHDRAW', '1250.00', 'Cash withdrawal', '2026-08-19 10:54:00'),
(24, 12, 'WITHDRAW', '2500.00', 'Cash withdrawal', '2026-08-19 10:58:00'),
(25, 1, 'DEPOSIT', '7500.00', 'Savings deposit', '2026-09-08 04:34:00'),
(26, 2, 'DEPOSIT', '9000.00', 'Savings deposit', '2026-09-08 04:38:00'),
(27, 3, 'DEPOSIT', '3000.00', 'Savings deposit', '2026-09-08 04:42:00'),
(28, 4, 'DEPOSIT', '4500.00', 'Savings deposit', '2026-09-08 04:46:00'),
(29, 5, 'DEPOSIT', '6000.00', 'Savings deposit', '2026-09-08 04:50:00'),
(30, 6, 'DEPOSIT', '7500.00', 'Savings deposit', '2026-09-08 04:54:00'),
(31, 7, 'DEPOSIT', '9000.00', 'Savings deposit', '2026-09-08 04:58:00'),
(32, 8, 'DEPOSIT', '3000.00', 'Savings deposit', '2026-09-08 05:02:00'),
(33, 9, 'DEPOSIT', '4500.00', 'Savings deposit', '2026-09-08 05:06:00'),
(34, 10, 'DEPOSIT', '6000.00', 'Savings deposit', '2026-09-08 05:10:00'),
(35, 11, 'DEPOSIT', '7500.00', 'Savings deposit', '2026-09-08 05:14:00'),
(36, 12, 'DEPOSIT', '9000.00', 'Savings deposit', '2026-09-08 05:18:00'),
(37, 1, 'WITHDRAW', '1250.00', 'Cash withdrawal', '2026-09-22 07:49:00'),
(38, 2, 'WITHDRAW', '2500.00', 'Cash withdrawal', '2026-09-22 07:53:00'),
(39, 3, 'WITHDRAW', '750.00', 'Cash withdrawal', '2026-09-22 07:57:00'),
(40, 4, 'WITHDRAW', '2000.00', 'Cash withdrawal', '2026-09-22 08:01:00'),
(41, 5, 'WITHDRAW', '3250.00', 'Cash withdrawal', '2026-09-22 08:05:00'),
(42, 6, 'WITHDRAW', '1500.00', 'Cash withdrawal', '2026-09-22 08:09:00'),
(43, 7, 'WITHDRAW', '2750.00', 'Cash withdrawal', '2026-09-22 08:13:00'),
(44, 8, 'WITHDRAW', '1000.00', 'Cash withdrawal', '2026-09-22 08:17:00'),
(45, 9, 'WITHDRAW', '2250.00', 'Cash withdrawal', '2026-09-22 08:21:00'),
(46, 10, 'WITHDRAW', '3500.00', 'Cash withdrawal', '2026-09-22 08:25:00'),
(47, 11, 'WITHDRAW', '1750.00', 'Cash withdrawal', '2026-09-22 08:29:00'),
(48, 12, 'WITHDRAW', '3000.00', 'Cash withdrawal', '2026-09-22 08:33:00'),
(49, 1, 'TRANSFER_OUT', '1250.00', 'TRF-DEMO-001: transfer to demo account 100100002', '2026-09-25 05:20:00'),
(50, 2, 'TRANSFER_IN', '1250.00', 'TRF-DEMO-001: received from demo account 100100001', '2026-09-25 05:20:00'),
(51, 1, 'DEPOSIT', '4000.00', 'Savings deposit', '2026-10-07 05:24:00'),
(52, 2, 'DEPOSIT', '5500.00', 'Savings deposit', '2026-10-07 05:28:00'),
(53, 3, 'DEPOSIT', '7000.00', 'Savings deposit', '2026-10-07 05:32:00'),
(54, 4, 'DEPOSIT', '8500.00', 'Savings deposit', '2026-10-07 05:36:00'),
(55, 6, 'DEPOSIT', '4000.00', 'Savings deposit', '2026-10-07 05:44:00'),
(56, 7, 'DEPOSIT', '5500.00', 'Savings deposit', '2026-10-07 05:48:00'),
(57, 8, 'DEPOSIT', '7000.00', 'Savings deposit', '2026-10-07 05:52:00'),
(58, 9, 'DEPOSIT', '8500.00', 'Savings deposit', '2026-10-07 05:56:00'),
(59, 10, 'DEPOSIT', '2500.00', 'Savings deposit', '2026-10-07 06:00:00'),
(60, 12, 'DEPOSIT', '5500.00', 'Savings deposit', '2026-10-07 06:08:00'),
(61, 4, 'TRANSFER_OUT', '1800.00', 'TRF-DEMO-002: transfer to demo account 100100007', '2026-10-10 09:10:00'),
(62, 7, 'TRANSFER_IN', '1800.00', 'TRF-DEMO-002: received from demo account 100100004', '2026-10-10 09:10:00'),
(63, 2, 'WITHDRAW', '3000.00', 'Cash withdrawal', '2026-10-21 08:13:00'),
(64, 4, 'WITHDRAW', '2500.00', 'Cash withdrawal', '2026-10-21 08:21:00'),
(65, 6, 'WITHDRAW', '2000.00', 'Cash withdrawal', '2026-10-21 08:29:00'),
(66, 7, 'WITHDRAW', '3250.00', 'Cash withdrawal', '2026-10-21 08:33:00'),
(67, 9, 'WITHDRAW', '2750.00', 'Cash withdrawal', '2026-10-21 08:41:00'),
(68, 10, 'WITHDRAW', '1000.00', 'Cash withdrawal', '2026-10-21 08:45:00'),
(69, 12, 'WITHDRAW', '3500.00', 'Cash withdrawal', '2026-10-21 08:53:00'),
(70, 4, 'DEPOSIT', '5000.00', 'Savings deposit', '2026-11-02 04:11:00'),
(71, 9, 'DEPOSIT', '5000.00', 'Savings deposit', '2026-11-02 04:31:00'),
(72, 9, 'TRANSFER_OUT', '2200.00', 'TRF-DEMO-003: transfer to demo account 100100012', '2026-11-04 06:35:00'),
(73, 12, 'TRANSFER_IN', '2200.00', 'TRF-DEMO-003: received from demo account 100100009', '2026-11-04 06:35:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q01_inner_join`
-- (See below for the actual view)
--
CREATE TABLE `v_q01_inner_join` (
`full_name` varchar(100)
,`account_number` varchar(30)
,`balance` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q02_left_join`
-- (See below for the actual view)
--
CREATE TABLE `v_q02_left_join` (
`full_name` varchar(100)
,`account_number` varchar(30)
,`balance` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q03_right_join`
-- (See below for the actual view)
--
CREATE TABLE `v_q03_right_join` (
`type_name` varchar(50)
,`account_number` varchar(30)
,`balance` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q05_self_join`
-- (See below for the actual view)
--
CREATE TABLE `v_q05_self_join` (
`employee_one` varchar(100)
,`employee_two` varchar(100)
,`branch_id` bigint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q06_natural_join`
-- (See below for the actual view)
--
CREATE TABLE `v_q06_natural_join` (
`full_name` varchar(100)
,`account_number` varchar(30)
,`balance` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q07_group_count`
-- (See below for the actual view)
--
CREATE TABLE `v_q07_group_count` (
`branch_name` varchar(100)
,`total_employees` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q08_all_customers`
-- (See below for the actual view)
--
CREATE TABLE `v_q08_all_customers` (
`customer_id` bigint unsigned
,`full_name` varchar(100)
,`email` varchar(150)
,`phone` varchar(20)
,`address` varchar(255)
,`date_of_birth` date
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q09_dhaka_customers`
-- (See below for the actual view)
--
CREATE TABLE `v_q09_dhaka_customers` (
`customer_id` bigint unsigned
,`full_name` varchar(100)
,`email` varchar(150)
,`phone` varchar(20)
,`address` varchar(255)
,`date_of_birth` date
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q10_high_balance_accounts`
-- (See below for the actual view)
--
CREATE TABLE `v_q10_high_balance_accounts` (
`account_number` varchar(30)
,`balance` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q11_active_accounts`
-- (See below for the actual view)
--
CREATE TABLE `v_q11_active_accounts` (
`account_id` bigint unsigned
,`account_number` varchar(30)
,`customer_id` bigint unsigned
,`branch_id` bigint unsigned
,`account_type_id` int unsigned
,`balance` decimal(15,2)
,`account_status` enum('ACTIVE','FROZEN','CLOSED')
,`opened_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q12_sorted_transactions`
-- (See below for the actual view)
--
CREATE TABLE `v_q12_sorted_transactions` (
`transaction_id` bigint unsigned
,`account_id` bigint unsigned
,`transaction_type` enum('DEPOSIT','WITHDRAW','TRANSFER_IN','TRANSFER_OUT')
,`amount` decimal(15,2)
,`description` varchar(255)
,`transaction_date` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q13_young_customers`
-- (See below for the actual view)
--
CREATE TABLE `v_q13_young_customers` (
`full_name` varchar(100)
,`date_of_birth` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q14_total_customers`
-- (See below for the actual view)
--
CREATE TABLE `v_q14_total_customers` (
`total_customers` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q15_average_balance`
-- (See below for the actual view)
--
CREATE TABLE `v_q15_average_balance` (
`average_balance` decimal(19,6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q16_total_deposits`
-- (See below for the actual view)
--
CREATE TABLE `v_q16_total_deposits` (
`total_deposit` decimal(37,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q17_high_value_transactions`
-- (See below for the actual view)
--
CREATE TABLE `v_q17_high_value_transactions` (
`transaction_type` enum('DEPOSIT','WITHDRAW','TRANSFER_IN','TRANSFER_OUT')
,`total_amount` decimal(37,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q18_customers_without_loans`
-- (See below for the actual view)
--
CREATE TABLE `v_q18_customers_without_loans` (
`customer_id` bigint unsigned
,`full_name` varchar(100)
,`email` varchar(150)
,`phone` varchar(20)
,`address` varchar(255)
,`date_of_birth` date
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q19_accounts_greater_than_students`
-- (See below for the actual view)
--
CREATE TABLE `v_q19_accounts_greater_than_students` (
`account_id` bigint unsigned
,`account_number` varchar(30)
,`customer_id` bigint unsigned
,`branch_id` bigint unsigned
,`account_type_id` int unsigned
,`balance` decimal(15,2)
,`account_status` enum('ACTIVE','FROZEN','CLOSED')
,`opened_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_q20_customers_both_accounts_loans`
-- (See below for the actual view)
--
CREATE TABLE `v_q20_customers_both_accounts_loans` (
`customer_id` bigint unsigned
,`full_name` varchar(100)
,`email` varchar(150)
,`phone` varchar(20)
,`address` varchar(255)
,`date_of_birth` date
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Structure for view `v_q01_inner_join`
--
DROP TABLE IF EXISTS `v_q01_inner_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q01_inner_join`  AS SELECT `c`.`full_name` AS `full_name`, `a`.`account_number` AS `account_number`, `a`.`balance` AS `balance` FROM (`customers` `c` join `accounts` `a` on((`c`.`customer_id` = `a`.`customer_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q02_left_join`
--
DROP TABLE IF EXISTS `v_q02_left_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q02_left_join`  AS SELECT `c`.`full_name` AS `full_name`, `a`.`account_number` AS `account_number`, `a`.`balance` AS `balance` FROM (`customers` `c` left join `accounts` `a` on((`c`.`customer_id` = `a`.`customer_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q03_right_join`
--
DROP TABLE IF EXISTS `v_q03_right_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q03_right_join`  AS SELECT `at`.`type_name` AS `type_name`, `a`.`account_number` AS `account_number`, `a`.`balance` AS `balance` FROM (`account_types` `at` left join `accounts` `a` on((`a`.`account_type_id` = `at`.`account_type_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q05_self_join`
--
DROP TABLE IF EXISTS `v_q05_self_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q05_self_join`  AS SELECT `e1`.`full_name` AS `employee_one`, `e2`.`full_name` AS `employee_two`, `e1`.`branch_id` AS `branch_id` FROM (`employees` `e1` join `employees` `e2` on(((`e1`.`branch_id` = `e2`.`branch_id`) and (`e1`.`employee_id` < `e2`.`employee_id`))))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q06_natural_join`
--
DROP TABLE IF EXISTS `v_q06_natural_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q06_natural_join`  AS SELECT `customers`.`full_name` AS `full_name`, `accounts`.`account_number` AS `account_number`, `accounts`.`balance` AS `balance` FROM (`customers` join `accounts` on((`customers`.`customer_id` = `accounts`.`customer_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q07_group_count`
--
DROP TABLE IF EXISTS `v_q07_group_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q07_group_count`  AS SELECT `b`.`branch_name` AS `branch_name`, count(`e`.`employee_id`) AS `total_employees` FROM (`branches` `b` left join `employees` `e` on((`b`.`branch_id` = `e`.`branch_id`))) GROUP BY `b`.`branch_id`, `b`.`branch_name``branch_name`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q08_all_customers`
--
DROP TABLE IF EXISTS `v_q08_all_customers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q08_all_customers`  AS SELECT `customers`.`customer_id` AS `customer_id`, `customers`.`full_name` AS `full_name`, `customers`.`email` AS `email`, `customers`.`phone` AS `phone`, `customers`.`address` AS `address`, `customers`.`date_of_birth` AS `date_of_birth`, `customers`.`created_at` AS `created_at` FROM `customers``customers`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q09_dhaka_customers`
--
DROP TABLE IF EXISTS `v_q09_dhaka_customers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q09_dhaka_customers`  AS SELECT `customers`.`customer_id` AS `customer_id`, `customers`.`full_name` AS `full_name`, `customers`.`email` AS `email`, `customers`.`phone` AS `phone`, `customers`.`address` AS `address`, `customers`.`date_of_birth` AS `date_of_birth`, `customers`.`created_at` AS `created_at` FROM `customers` WHERE (`customers`.`address` like '%Dhaka%')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q10_high_balance_accounts`
--
DROP TABLE IF EXISTS `v_q10_high_balance_accounts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q10_high_balance_accounts`  AS SELECT `accounts`.`account_number` AS `account_number`, `accounts`.`balance` AS `balance` FROM `accounts` WHERE (`accounts`.`balance` > 40000)  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q11_active_accounts`
--
DROP TABLE IF EXISTS `v_q11_active_accounts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q11_active_accounts`  AS SELECT `accounts`.`account_id` AS `account_id`, `accounts`.`account_number` AS `account_number`, `accounts`.`customer_id` AS `customer_id`, `accounts`.`branch_id` AS `branch_id`, `accounts`.`account_type_id` AS `account_type_id`, `accounts`.`balance` AS `balance`, `accounts`.`account_status` AS `account_status`, `accounts`.`opened_at` AS `opened_at` FROM `accounts` WHERE (`accounts`.`account_status` = 'ACTIVE')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q12_sorted_transactions`
--
DROP TABLE IF EXISTS `v_q12_sorted_transactions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q12_sorted_transactions`  AS SELECT `transactions`.`transaction_id` AS `transaction_id`, `transactions`.`account_id` AS `account_id`, `transactions`.`transaction_type` AS `transaction_type`, `transactions`.`amount` AS `amount`, `transactions`.`description` AS `description`, `transactions`.`transaction_date` AS `transaction_date` FROM `transactions` ORDER BY `transactions`.`amount` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q13_young_customers`
--
DROP TABLE IF EXISTS `v_q13_young_customers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q13_young_customers`  AS SELECT `customers`.`full_name` AS `full_name`, `customers`.`date_of_birth` AS `date_of_birth` FROM `customers` WHERE (`customers`.`date_of_birth` > '2000-01-01')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q14_total_customers`
--
DROP TABLE IF EXISTS `v_q14_total_customers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q14_total_customers`  AS SELECT count(0) AS `total_customers` FROM `customers``customers`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q15_average_balance`
--
DROP TABLE IF EXISTS `v_q15_average_balance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q15_average_balance`  AS SELECT avg(`accounts`.`balance`) AS `average_balance` FROM `accounts``accounts`  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q16_total_deposits`
--
DROP TABLE IF EXISTS `v_q16_total_deposits`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q16_total_deposits`  AS SELECT sum(`transactions`.`amount`) AS `total_deposit` FROM `transactions` WHERE (`transactions`.`transaction_type` = 'DEPOSIT')  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q17_high_value_transactions`
--
DROP TABLE IF EXISTS `v_q17_high_value_transactions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q17_high_value_transactions`  AS SELECT `transactions`.`transaction_type` AS `transaction_type`, sum(`transactions`.`amount`) AS `total_amount` FROM `transactions` GROUP BY `transactions`.`transaction_type` HAVING (sum(`transactions`.`amount`) > 50000)  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q18_customers_without_loans`
--
DROP TABLE IF EXISTS `v_q18_customers_without_loans`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q18_customers_without_loans`  AS SELECT `customers`.`customer_id` AS `customer_id`, `customers`.`full_name` AS `full_name`, `customers`.`email` AS `email`, `customers`.`phone` AS `phone`, `customers`.`address` AS `address`, `customers`.`date_of_birth` AS `date_of_birth`, `customers`.`created_at` AS `created_at` FROM `customers` WHERE `customers`.`customer_id` in (select `loans`.`customer_id` from `loans`) is falsefalse  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q19_accounts_greater_than_students`
--
DROP TABLE IF EXISTS `v_q19_accounts_greater_than_students`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q19_accounts_greater_than_students`  AS SELECT `accounts`.`account_id` AS `account_id`, `accounts`.`account_number` AS `account_number`, `accounts`.`customer_id` AS `customer_id`, `accounts`.`branch_id` AS `branch_id`, `accounts`.`account_type_id` AS `account_type_id`, `accounts`.`balance` AS `balance`, `accounts`.`account_status` AS `account_status`, `accounts`.`opened_at` AS `opened_at` FROM `accounts` WHERE `accounts`.`balance` > all (select `accounts`.`balance` from `accounts` where (`accounts`.`account_type_id` = 3))  ;

-- --------------------------------------------------------

--
-- Structure for view `v_q20_customers_both_accounts_loans`
--
DROP TABLE IF EXISTS `v_q20_customers_both_accounts_loans`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_q20_customers_both_accounts_loans`  AS SELECT `customers`.`customer_id` AS `customer_id`, `customers`.`full_name` AS `full_name`, `customers`.`email` AS `email`, `customers`.`phone` AS `phone`, `customers`.`address` AS `address`, `customers`.`date_of_birth` AS `date_of_birth`, `customers`.`created_at` AS `created_at` FROM `customers` WHERE (`customers`.`customer_id` in (select `accounts`.`customer_id` from `accounts`) AND `customers`.`customer_id` in (select `loans`.`customer_id` from `loans`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `account_type_id` (`account_type_id`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`account_type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD UNIQUE KEY `branch_code` (`branch_code`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`card_id`),
  ADD UNIQUE KEY `card_reference` (`card_reference`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `idx_transactions_account_date` (`account_id`,`transaction_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `account_type_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `card_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `payment_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `accounts_ibfk_3` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`account_type_id`);

--
-- Constraints for table `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD CONSTRAINT `loan_payments_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`loan_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
