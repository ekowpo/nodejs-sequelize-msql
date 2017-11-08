-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2017 at 02:02 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodejs`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `code`, `createdAt`, `updatedAt`) VALUES
(1, 'Comparative study of programing language', 'COMP 6411', '2017-11-04 03:11:03', '2017-11-04 03:11:03'),
(2, 'Software Quality Assurance', 'INSE6261', '2017-11-04 03:11:04', '2017-11-04 03:11:04');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`id`, `firstName`, `lastName`, `createdAt`, `updatedAt`) VALUES
(1, 'george', 'Ekow-Daniels', '2017-11-04 03:11:03', '0000-00-00 00:00:00'),
(2, 'george', 'Ekow-Daniels', '2017-11-04 03:11:03', '2017-11-04 03:11:03');

-- --------------------------------------------------------

--
-- Table structure for table `semestercourses`
--

CREATE TABLE `semestercourses` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `semesterId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semestercourses`
--

INSERT INTO `semestercourses` (`createdAt`, `updatedAt`, `semesterId`, `courseId`) VALUES
('2017-11-04 03:11:03', '2017-11-04 03:11:03', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` int(11) NOT NULL,
  `name` enum('Fall','Winter','Summer 1','Summer 2') DEFAULT NULL,
  `start` varchar(255) NOT NULL,
  `end` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `name`, `start`, `end`, `createdAt`, `updatedAt`) VALUES
(1, 'Winter', '2017', '2017', '2017-11-01 00:00:00', '2017-11-04 05:23:14'),
(2, 'Fall', '2099', '2017', '2017-11-04 02:37:12', '2017-11-04 05:22:11'),
(3, 'Summer 1', '2017', '2017', '2017-11-04 02:44:24', '2017-11-04 02:44:24'),
(4, 'Summer 2', '2017', '2017', '2017-11-04 02:47:33', '2017-11-04 02:47:33'),
(5, 'Winter', '2016', '2016', '2017-11-04 02:50:43', '2017-11-04 02:50:43'),
(6, 'Fall', '2016', '2016', '2017-11-04 02:52:08', '2017-11-04 02:52:08'),
(7, 'Summer 1', '2016', '2016', '2017-11-04 02:53:23', '2017-11-04 02:53:23'),
(9, 'Winter', '2033', '2033', '2017-11-04 02:58:18', '2017-11-04 04:59:04'),
(10, 'Summer 1', '2015', '2015', '2017-11-04 02:58:57', '2017-11-04 02:58:57'),
(11, 'Winter', '2019', '2019', '2017-11-04 03:03:39', '2017-11-04 03:03:39'),
(12, 'Summer 1', '2019', '2019', '2017-11-04 03:04:24', '2017-11-04 03:04:24'),
(13, 'Fall', '2019', '2019', '2017-11-04 03:08:44', '2017-11-04 03:08:44'),
(14, 'Summer 2', '2019', '2019', '2017-11-04 03:14:55', '2017-11-04 03:14:55'),
(15, 'Summer 2', '2244', '2244', '2017-11-08 09:48:18', '2017-11-08 09:48:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semestercourses`
--
ALTER TABLE `semestercourses`
  ADD PRIMARY KEY (`semesterId`,`courseId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `semestercourses`
--
ALTER TABLE `semestercourses`
  ADD CONSTRAINT `semestercourses_ibfk_1` FOREIGN KEY (`semesterId`) REFERENCES `semesters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `semestercourses_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
