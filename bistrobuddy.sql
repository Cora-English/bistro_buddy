-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2025 at 04:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bistrobuddy`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblguest`
--

CREATE TABLE `tblguest` (
  `Guest_ID` int(11) NOT NULL,
  `Guest_firstname` varchar(50) DEFAULT NULL,
  `Guest_lastname` varchar(50) DEFAULT NULL,
  `Guest_email` varchar(50) DEFAULT NULL,
  `Guest_phone_num` int(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblguest`
--

INSERT INTO `tblguest` (`Guest_ID`, `Guest_firstname`, `Guest_lastname`, `Guest_email`, `Guest_phone_num`) VALUES
(1, 'cora', NULL, NULL, NULL),
(2, 'cora', 'english', NULL, NULL),
(3, 'cora', 'english', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblguestreservation`
--

CREATE TABLE `tblguestreservation` (
  `guest_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblreservation`
--

CREATE TABLE `tblreservation` (
  `reservation_id` int(11) NOT NULL,
  `table_num` int(50) DEFAULT NULL,
  `num_guests` int(10) DEFAULT NULL,
  `res_time` time DEFAULT NULL,
  `res_date` date DEFAULT NULL,
  `special_requests` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblguest`
--
ALTER TABLE `tblguest`
  ADD PRIMARY KEY (`Guest_ID`);

--
-- Indexes for table `tblguestreservation`
--
ALTER TABLE `tblguestreservation`
  ADD PRIMARY KEY (`guest_id`,`reservation_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `tblreservation`
--
ALTER TABLE `tblreservation`
  ADD PRIMARY KEY (`reservation_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblguest`
--
ALTER TABLE `tblguest`
  MODIFY `Guest_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblreservation`
--
ALTER TABLE `tblreservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblguestreservation`
--
ALTER TABLE `tblguestreservation`
  ADD CONSTRAINT `tblguestreservation_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `tblguest` (`Guest_ID`),
  ADD CONSTRAINT `tblguestreservation_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `tblreservation` (`reservation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
