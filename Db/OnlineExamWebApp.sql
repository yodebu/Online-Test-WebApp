-- phpMyAdmin SQL Dump
-- version 4.2.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 23, 2015 at 12:41 AM
-- Server version: 5.5.41-0ubuntu0.14.10.1
-- PHP Version: 5.5.12-2ubuntu4.2
-- Author : Debapriya Das (yodebu)
-- Dell 15R Turbo - Kubuntu 14.04 LTS

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `OnlineExamWebApp`
--
CREATE DATABASE IF NOT EXISTS `OnlineExamWebApp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `OnlineExamWebApp`;

-- --------------------------------------------------------

--
-- Table structure for table `Question_DataBase`
--
-- Creation: Feb 22, 2015 at 06:56 PM
--

DROP TABLE IF EXISTS `Question_DataBase`;
CREATE TABLE IF NOT EXISTS `Question_DataBase` (
  `Test_ID` int(10) unsigned NOT NULL,
  `Q_No` int(3) NOT NULL,
  `Subject` enum('Science','Maths','Geography','English') CHARACTER SET ascii NOT NULL,
  `Question` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `Option_1` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `Option_2` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `Option_3` varchar(255) CHARACTER SET ucs2 COLLATE ucs2_unicode_ci NOT NULL,
  `Option_4` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `Correct Answer` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Question_DataBase`:
--   `Test_ID`
--       `Test_Database` -> `Test_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `Student_Details`
--
-- Creation: Feb 22, 2015 at 07:08 PM
--

DROP TABLE IF EXISTS `Student_Details`;
CREATE TABLE IF NOT EXISTS `Student_Details` (
`Stu_Id` int(10) unsigned NOT NULL,
  `First  Name` varchar(30) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `Last Name` varchar(30) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `Email` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `Sex` enum('Male','Female','Not Specified') CHARACTER SET ascii NOT NULL,
  `Photo` mediumblob,
  `Education` varchar(255) CHARACTER SET utf32 COLLATE utf32_bin NOT NULL,
  `Age` int(2) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- MIME TYPES FOR TABLE `Student_Details`:
--   `Photo`
--       `Image_JPEG`
--

--
-- RELATIONS FOR TABLE `Student_Details`:
--   `Email`
--       `Users` -> `email`
--

-- --------------------------------------------------------

--
-- Table structure for table `Student_Marks`
--
-- Creation: Feb 22, 2015 at 07:01 PM
--

DROP TABLE IF EXISTS `Student_Marks`;
CREATE TABLE IF NOT EXISTS `Student_Marks` (
  `Stu_Id` int(10) unsigned NOT NULL,
  `Test_ID` int(10) unsigned NOT NULL,
  `Marks` int(2) DEFAULT NULL,
  `Test_Completed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Student_Marks`:
--   `Stu_Id`
--       `Student_Details` -> `Stu_Id`
--   `Test_ID`
--       `Test_Database` -> `Test_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `Teacher_Details`
--
-- Creation: Feb 22, 2015 at 07:08 PM
--

DROP TABLE IF EXISTS `Teacher_Details`;
CREATE TABLE IF NOT EXISTS `Teacher_Details` (
`Teacher_ID` int(10) unsigned NOT NULL,
  `First _Name` varchar(30) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `Last_Name` varchar(30) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `Email` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `Sex` enum('Male','Female','Not Specified') CHARACTER SET ascii NOT NULL,
  `Photo` mediumblob,
  `Designation` varchar(255) CHARACTER SET utf32 COLLATE utf32_bin NOT NULL,
  `Age` int(2) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- MIME TYPES FOR TABLE `Teacher_Details`:
--   `Photo`
--       `Image_JPEG`
--

--
-- RELATIONS FOR TABLE `Teacher_Details`:
--   `Email`
--       `Users` -> `email`
--

-- --------------------------------------------------------

--
-- Table structure for table `Test_Database`
--
-- Creation: Feb 22, 2015 at 06:32 PM
--

DROP TABLE IF EXISTS `Test_Database`;
CREATE TABLE IF NOT EXISTS `Test_Database` (
`Test_ID` int(10) NOT NULL,
  `Teachr_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `Test_Database`:
--   `Teachr_ID`
--       `Teaher_Details` -> `Teacher_ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--
-- Creation: Feb 22, 2015 at 06:14 PM
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE IF NOT EXISTS `Users` (
`SNo` int(11) NOT NULL,
  `email` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `password` varchar(16) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `check_Stu_Teach` enum('Student','Teacher') CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Student_Details`
--
ALTER TABLE `Student_Details`
 ADD PRIMARY KEY (`Stu_Id`), ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `Teacher_Details`
--
ALTER TABLE `Teacher_Details`
 ADD PRIMARY KEY (`Teacher_ID`), ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `Test_Database`
--
ALTER TABLE `Test_Database`
 ADD PRIMARY KEY (`Test_ID`), ADD UNIQUE KEY `Teachr_ID` (`Teachr_ID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
 ADD PRIMARY KEY (`email`), ADD UNIQUE KEY `SNo` (`SNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Student_Details`
--
ALTER TABLE `Student_Details`
MODIFY `Stu_Id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Teacher_Details`
--
ALTER TABLE `Teacher_Details`
MODIFY `Teacher_ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Test_Database`
--
ALTER TABLE `Test_Database`
MODIFY `Test_ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
MODIFY `SNo` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Student_Details`
--
ALTER TABLE `Student_Details`
ADD CONSTRAINT `Student_Details_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `Users` (`email`);

--
-- Constraints for table `Teacher_Details`
--
ALTER TABLE `Teacher_Details`
ADD CONSTRAINT `Teacher_Details_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `Users` (`email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
