-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 06:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expensetrackerdb_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `expensecategorytb`
--

CREATE TABLE `expensecategorytb` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `isLimitAmount` bit(1) NOT NULL DEFAULT b'0',
  `limitAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `created_by` int(11) NOT NULL,
  `created_in` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `expensecategorytb`
--

INSERT INTO `expensecategorytb` (`id`, `name`, `isLimitAmount`, `limitAmount`, `created_by`, `created_in`) VALUES
(1, 'شخصية', b'0', 0.00, 1, '2023-11-18 16:45:42'),
(2, 'عام', b'1', 650.00, 1, '2023-11-19 13:16:06'),
(3, 'basheer eee', b'0', 0.00, 1, '2023-11-20 13:29:10'),
(4, 'التواصل والنت', b'1', 120.00, 1, '2023-11-22 06:38:21'),
(5, 'تغذية', b'1', 25.00, 1, '2023-11-22 06:38:51'),
(6, 'ououpip', b'0', 0.00, 1, '2023-11-22 11:52:42'),
(7, 'نعم بدش', b'1', 90.00, 2, '2023-12-06 11:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `expensestb`
--

CREATE TABLE `expensestb` (
  `id` bigint(21) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `theDate` date NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `theStatement` varchar(250) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_in` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `expensestb`
--

INSERT INTO `expensestb` (`id`, `categoryId`, `theDate`, `amount`, `theStatement`, `created_by`, `created_in`) VALUES
(2, 3, '2023-11-21', 850, ' hihi hih jifwjfow', 1, '2023-11-21 21:29:23'),
(8, 6, '2023-11-22', 5200, 'ooo ojo', 1, '2023-11-22 11:52:55'),
(11, 1, '2023-11-21', 250, 'uuuuuuuu', 1, '2023-11-22 17:14:07'),
(14, 2, '2023-11-22', 60, 'حق كذا', 1, '2023-11-30 21:01:57'),
(16, 4, '2023-12-05', 9800, 'test bh kio', 2, '2023-12-06 14:33:54'),
(20, 5, '2023-12-03', 250, 'uuuuiuio k', 2, '2023-12-07 21:21:35');

-- --------------------------------------------------------

--
-- Table structure for table `usertb`
--

CREATE TABLE `usertb` (
  `id` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_in` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `usertb`
--

INSERT INTO `usertb` (`id`, `userName`, `password`, `email`, `created_in`) VALUES
(1, 'bh', '123456', 'bh@gmail.com', '2023-11-18 16:45:01'),
(2, 'basheer', '123456', 'saaa@gmail.com', '2023-11-21 09:51:41'),
(6, 'bh123456', '123456', 'sjsh@dfdf.com', '2023-12-06 11:55:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expensecategorytb`
--
ALTER TABLE `expensecategorytb`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_name` (`name`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `expensestb`
--
ALTER TABLE `expensestb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `usertb`
--
ALTER TABLE `usertb`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_userName` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expensestb`
--
ALTER TABLE `expensestb`
  MODIFY `id` bigint(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `usertb`
--
ALTER TABLE `usertb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expensecategorytb`
--
ALTER TABLE `expensecategorytb`
  ADD CONSTRAINT `expensecategorytb_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `usertb` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `expensestb`
--
ALTER TABLE `expensestb`
  ADD CONSTRAINT `expensestb_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `expensecategorytb` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `expensestb_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `usertb` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
