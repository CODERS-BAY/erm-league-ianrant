-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2020 at 08:32 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `league`
--

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `club_id` int(11) NOT NULL,
  `club_name` varchar(50) DEFAULT NULL,
  `club_points` int(11) DEFAULT NULL,
  `club_address` varchar(50) DEFAULT NULL,
  `league_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `club_match_assoc`
--

CREATE TABLE `club_match_assoc` (
  `club_match_assoc_id` int(11) NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fbmatch`
--

CREATE TABLE `fbmatch` (
  `match_id` int(11) NOT NULL,
  `match_date` date DEFAULT NULL,
  `match_location` varchar(50) DEFAULT NULL,
  `match_name_team1` varchar(50) DEFAULT NULL,
  `match_name_team2` varchar(50) DEFAULT NULL,
  `match_result_team1` int(2) DEFAULT NULL,
  `match_result_team2` int(2) DEFAULT NULL,
  `stadium_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

CREATE TABLE `league` (
  `league_id` int(11) NOT NULL,
  `league_name` varchar(50) DEFAULT NULL,
  `league_gender` bit(1) DEFAULT NULL,
  `league_level` varchar(50) DEFAULT NULL,
  `league_area` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `person_name` varchar(50) DEFAULT NULL,
  `person_role` varchar(50) DEFAULT NULL,
  `person_position` varchar(50) DEFAULT NULL,
  `person_gender` bit(1) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

CREATE TABLE `stadium` (
  `stadium_id` int(11) NOT NULL,
  `stadium_name` varchar(50) DEFAULT NULL,
  `stadium_address` varchar(50) DEFAULT NULL,
  `stadium_capacity` int(11) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`club_id`),
  ADD UNIQUE KEY `league_id` (`league_id`);

--
-- Indexes for table `club_match_assoc`
--
ALTER TABLE `club_match_assoc`
  ADD PRIMARY KEY (`club_match_assoc_id`),
  ADD UNIQUE KEY `match_id` (`match_id`,`club_id`),
  ADD KEY `club_id` (`club_id`);

--
-- Indexes for table `fbmatch`
--
ALTER TABLE `fbmatch`
  ADD PRIMARY KEY (`match_id`),
  ADD UNIQUE KEY `stadium_id` (`stadium_id`);

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`league_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`),
  ADD UNIQUE KEY `club_id` (`club_id`);

--
-- Indexes for table `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`stadium_id`),
  ADD UNIQUE KEY `match_id` (`match_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `club_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club_match_assoc`
--
ALTER TABLE `club_match_assoc`
  MODIFY `club_match_assoc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fbmatch`
--
ALTER TABLE `fbmatch`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `league`
--
ALTER TABLE `league`
  MODIFY `league_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stadium`
--
ALTER TABLE `stadium`
  MODIFY `stadium_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `club_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `league` (`league_id`);

--
-- Constraints for table `club_match_assoc`
--
ALTER TABLE `club_match_assoc`
  ADD CONSTRAINT `club_match_assoc_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`),
  ADD CONSTRAINT `club_match_assoc_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `fbmatch` (`match_id`);

--
-- Constraints for table `fbmatch`
--
ALTER TABLE `fbmatch`
  ADD CONSTRAINT `fbmatch_ibfk_1` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`stadium_id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`);

--
-- Constraints for table `stadium`
--
ALTER TABLE `stadium`
  ADD CONSTRAINT `stadium_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `fbmatch` (`match_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
