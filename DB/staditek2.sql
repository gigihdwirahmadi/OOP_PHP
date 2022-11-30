-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 05:21 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `staditek2`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `open_hour` time NOT NULL,
  `close_hour` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `id` int(11) NOT NULL,
  `nik` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `name` int(100) NOT NULL,
  `gender` enum('L','P') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trx_dtl`
--

CREATE TABLE `trx_dtl` (
  `id` int(11) NOT NULL,
  `hdr_id` int(20) NOT NULL,
  `item_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(20) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trx_dtl`
--

INSERT INTO `trx_dtl` (`id`, `hdr_id`, `item_name`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Chitato', 1, 5000, '2022-11-28 02:03:22', NULL),
(2, 1, 'teh pucuk', 1, 5000, '2022-11-28 02:03:52', NULL),
(3, 1, 'aqua', 1, 3000, '2022-11-28 02:04:33', NULL),
(4, 1, 'hexos', 1, 5000, '2022-11-28 02:05:00', NULL),
(6, 2, 'indomie', 10, 25000, '2022-11-28 02:26:41', NULL),
(7, 2, 'wafer', 1, 1000, '2022-11-28 02:27:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trx_hdr`
--

CREATE TABLE `trx_hdr` (
  `id` int(10) NOT NULL,
  `info_id` int(10) NOT NULL,
  `transaktion_time` datetime NOT NULL,
  `discount` double NOT NULL,
  `price_total` double NOT NULL,
  `payment` double NOT NULL,
  `exchange` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trx_hdr`
--

INSERT INTO `trx_hdr` (`id`, `info_id`, `transaktion_time`, `discount`, `price_total`, `payment`, `exchange`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-11-28 02:58:11', 0, 18000, 20000, 2000, '2022-11-28 01:59:21', NULL),
(2, 2, '2022-11-28 02:59:54', 0, 26000, 30000, 4000, '2022-11-28 02:00:33', NULL),
(3, 2, '2022-11-28 03:00:38', 0, 43000, 50000, 7000, '2022-11-28 02:01:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trx_infos`
--

CREATE TABLE `trx_infos` (
  `id` int(11) NOT NULL,
  `branch_info` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `chasier_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trx_infos`
--

INSERT INTO `trx_infos` (`id`, `branch_info`, `chasier_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'arcade 2\r\n', 'indah', 1, '2022-11-28 01:54:53', NULL),
(2, 'arcade 2', 'dede', 1, '2022-11-28 01:56:07', NULL),
(3, 'arcade 1', 'indah', 1, '2022-11-28 01:56:39', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trx_dtl`
--
ALTER TABLE `trx_dtl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trx_hdr_dtl` (`hdr_id`);

--
-- Indexes for table `trx_hdr`
--
ALTER TABLE `trx_hdr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trx_hdr` (`info_id`);

--
-- Indexes for table `trx_infos`
--
ALTER TABLE `trx_infos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cashier`
--
ALTER TABLE `cashier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trx_dtl`
--
ALTER TABLE `trx_dtl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `trx_hdr`
--
ALTER TABLE `trx_hdr`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trx_infos`
--
ALTER TABLE `trx_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trx_dtl`
--
ALTER TABLE `trx_dtl`
  ADD CONSTRAINT `fk_trx_hdr_dtl` FOREIGN KEY (`hdr_id`) REFERENCES `trx_hdr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trx_hdr`
--
ALTER TABLE `trx_hdr`
  ADD CONSTRAINT `fk_trx_hdr` FOREIGN KEY (`info_id`) REFERENCES `trx_infos` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
