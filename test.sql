-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 24, 2019 at 05:11 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patch_detail`
--

CREATE TABLE IF NOT EXISTS `patch_detail` (
  `patch_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) NOT NULL,
  `custom_board_id` int(11) DEFAULT NULL,
  `patch_version` varchar(8) NOT NULL COMMENT 'patch  version in format of YY.MR.IR',
  `product_id` int(11) NOT NULL,
  `container_id` int(11) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `checklist_filename` varchar(255) NOT NULL,
  `priority_detail` text NOT NULL,
  `svn` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'accepted = 1, rejected = 0, deleted = 5',
  `release_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'patch release type (Internal =1,  Market Release = 2)',
  `is_complete` tinyint(4) NOT NULL DEFAULT '0',
  `is_new` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 => new packets, 0 => old packets',
  `comments` varchar(512) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extraedge` tinyint(1) NOT NULL DEFAULT '0',
  `released_packets` varchar(200) NOT NULL,
  `notified` tinyint(2) DEFAULT '0',
  `patch_status` tinyint(4) NOT NULL DEFAULT '4' COMMENT '4 => Generated , 5 =>  Testing, 6 => Released , 7 => Failed',
  `patch_type` int(11) NOT NULL COMMENT '1 => Academic, 2 => Major, 3 => Correction',
  `crs_file_size` int(11) NOT NULL COMMENT 'in GB',
  `master_file_size` int(11) NOT NULL COMMENT 'in GB',
  PRIMARY KEY (`patch_id`),
  KEY `fk_cl_pi` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=80 ;

--
-- Dumping data for table `patch_detail`
--

INSERT INTO `patch_detail` (`patch_id`, `request_id`, `custom_board_id`, `patch_version`, `product_id`, `container_id`, `filename`, `checklist_filename`, `priority_detail`, `svn`, `created_date`, `created_by`, `status`, `release_type`, `is_complete`, `is_new`, `comments`, `modified_by`, `modified_date`, `extraedge`, `released_packets`, `notified`, `patch_status`, `patch_type`, `crs_file_size`, `master_file_size`) VALUES
(16, 4, 499, '19.1.0.2', 75, 412582, '75/499/19.1.0.2/complete/2_37_412582.zip', '', '', 0, '2019-01-02 10:32:55', 0, 1, 1, 1, 1, 'Comment goes here.', 0, '2019-01-02 04:03:53', 0, '', 1, 6, 3, 4, 3),
(37, 8, 486, '19.1.0.1', 75, 182, '75/486/19.1.0.1/complete/2_36_182.zip', '', '', 0, '2019-01-04 11:19:36', 0, 1, 1, 1, 1, 'Comment goes here.', 0, '2019-01-04 04:50:11', 0, '', 0, 7, 3, 4, 0),
(65, 10, 183, '19.1.0.2', 75, 412794, '75/183/19.1.0.2/complete/2_38_412794.zip', '', '', 0, '2019-01-16 06:25:20', 0, 1, 1, 1, 1, 'Comment goes here.', 0, '2019-02-27 04:44:14', 0, '', 0, 7, 3, 4, 1),
(67, 11, 492, '19.2.0.0', 75, 146448, '75/492/19.2.0.0/incremental/2_87203_146448.zip', '', '', 0, '2019-02-27 08:03:39', 0, 1, 1, 0, 1, 'Comment goes here.', 0, '2019-02-27 01:35:38', 0, '', 1, 6, 1, 4, 0),
(79, 13, 484, '19.1.0.1', 75, 515471, '75/484/19.1.0.1/complete/2_37_515471.zip', '', '', 0, '2019-02-27 08:14:05', 0, 1, 1, 1, 1, 'Comment goes here.', 0, '2019-02-27 04:00:12', 0, '', 1, 6, 3, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE IF NOT EXISTS `record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `dept` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`id`, `name`, `last_name`, `email`, `role`, `dept`) VALUES
(1, 'Vikas', 'Sharma', 'vikas@gmail.com', 'admin', 'Tech'),
(11, 'Aakash', 'Sharma', 'aakash@gmail.com', 'Admin', 'Tech'),
(12, 'Ayush', 'Rawat', 'ayush@gmail.com', 'Super Admin', 'Tech'),
(16, 'Nagandra', 'Sir', 'nagandra@extramarks.com', 'Head of Dept.', 'Accounts'),
(19, 'Arvind', 'Sir', 'arvind@gmail.com', 'Tester', 'Aca'),
(20, 'Vikram', 'Kumar', 'vikram@extramarks.com', 'Abc', 'Tech');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sr_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `sr_name`) VALUES
(1, 'Priyanshi', 'Sharma'),
(2, 'ayush', 'rawat'),
(3, 'Rajendra', 'singh'),
(4, 'sonu', 'singh'),
(5, 'aakash', 'bhardwaj');

-- --------------------------------------------------------

--
-- Table structure for table `testCheck`
--

CREATE TABLE IF NOT EXISTS `testCheck` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `sr_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testCheck`
--

INSERT INTO `testCheck` (`id`, `name`, `sr_name`) VALUES
(1, 'Priyanshi', 'Sharma'),
(2, 'ayush', 'rawat'),
(3, 'Rajendra', 'singh'),
(4, 'sonu', 'singh'),
(5, 'aakash', 'bhardwaj');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
