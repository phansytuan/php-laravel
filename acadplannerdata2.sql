-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 19, 2025 at 02:29 PM
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
-- Database: `acadplannerdata2`
--

-- --------------------------------------------------------

--
-- Table structure for table `a_course`
--

CREATE TABLE `a_course` (
  `C_CODE` varchar(45) NOT NULL,
  `C_NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `a_course`
--

INSERT INTO `a_course` (`C_CODE`, `C_NAME`) VALUES
('BA-BUS', 'Bachelor of Business'),
('BA-CS', 'Bachelor of Computer Science'),
('BA-MCMN', 'Bachelor of Media and Communication');

-- --------------------------------------------------------

--
-- Table structure for table `a_course_unit`
--

CREATE TABLE `a_course_unit` (
  `U_CODE` varchar(45) NOT NULL,
  `U_NAME` varchar(100) NOT NULL,
  `LEVEL` int(11) NOT NULL,
  `CREDITS` decimal(5,2) NOT NULL,
  `PREREQUISITE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `a_course_unit`
--

INSERT INTO `a_course_unit` (`U_CODE`, `U_NAME`, `LEVEL`, `CREDITS`, `PREREQUISITE`) VALUES
('BUS10015', 'Design Thinking and Teamwork', 1, 12.50, 'No'),
('COS10004', 'Computer Systems', 1, 12.50, 'No'),
('COS10005', 'Web Programming', 1, 12.50, 'No'),
('COS10009', 'Introduction to Programming', 1, 12.50, 'No'),
('COS10022', 'Data Science Principles', 1, 12.50, 'No'),
('COS10025', 'Technology in an Indigenous Context Project', 1, 12.50, 'No'),
('COS10026', 'Computing Technology Inquiry Project', 1, 12.50, 'No'),
('COS20007', 'Object Oriented Programming', 2, 12.50, 'COS10009 OR SWE20004'),
('COS20015', 'Fundamentals of Data Management', 2, 12.50, 'COS10009 OR SWE20004'),
('COS20019', 'Cloud Computing Architecture', 2, 12.50, '50 cps'),
('COS20028', 'Big Data Architecture and Application', 2, 12.50, 'COS20007 AND COS10022'),
('COS20030', 'Malware Analysis', 2, 12.50, 'TNE10005 OR TNE10006'),
('COS20031', 'Computing Technology Design Project', 2, 12.50, 'COS10009 OR COS10005 OR COS10026'),
('COS30008', 'Data Structures and Patterns', 3, 12.50, 'COS30016 OR COS20007 OR COS20011'),
('COS30015', 'IT Security', 3, 12.50, 'COS10009 OR SWE20004 OR COS30043 AND COS10005 OR COS10026 OR COS10026 OR COS10011 AND TNE10005 OR TNE10006'),
('COS30017', 'Software Development for Mobile Devices', 3, 12.50, 'COS20007 OR COS20011 OR COS30014'),
('COS30018', 'Intelligent Systems', 3, 12.50, 'COS20007 OR SWE20004 OR COS20011 OR COS30016'),
('COS30019', 'Introduction to Artificial Intelligence', 3, 12.50, 'COS20007 OR COS30008'),
('COS30020', 'Advanced Web Development', 3, 12.50, 'COS10009 AND one of COS10011 OR COS10005 OR COS10026'),
('COS30043', 'Interface Design and Development', 3, 12.50, 'COS10005 OR COS10011 OR COS10026 AND COS20007 OR SWE20004'),
('COS30045', 'Data Visualisation', 3, 12.50, 'COS10009'),
('COS30049', 'Computing Technology Innovation Project', 3, 12.50, 'No'),
('COS30082', 'Applied Machine Learning', 3, 12.50, 'COS30019 OR COS30018'),
('COS40003', 'Concurrent Programming', 4, 12.50, 'COS20007 OR SWE20004 OR COS30008'),
('COS40005', 'Computing Technology Project A', 4, 12.50, '175 cps'),
('COS40006', 'Computing Technology Project B', 4, 12.50, 'COS40005'),
('COS40007', 'Artificial Intelligence for Engineering', 4, 12.50, '100 cps AND COS10009'),
('ICT20015', 'ICT Internship', 2, 25.00, '150 cps'),
('ICT20016', 'Work Integrated Learning Placement (ICT)', 2, 25.00, '150 cps'),
('STA10003', 'Foundation of Statistics', 1, 12.50, 'No'),
('SWE30003', 'Software Architectures and Design', 3, 12.50, 'COS20007 AND 150 cps'),
('SWE30009', 'Software Testing and Reliability', 3, 12.50, 'COS20007 OR SWE20004 OR COS20011'),
('SWE30011', 'IoT Programming', 3, 12.50, 'One of COS10026 OR COS10011 OR COS10005 AND COS20007'),
('SWE40006', 'Software Deployment and Evolution', 4, 12.50, 'INF30029 OR SWE30010 OR SWE20001 OR SWE30003 OR COS20031 OR ICT20025 OR ENG20010 OR INF30033'),
('TNE10005', 'Network Administration', 1, 12.50, 'No'),
('TNE10006', 'Networks and Switching', 1, 12.50, 'No'),
('TNE20002', 'Network Routing Principles', 2, 12.50, 'TNE10006'),
('TNE30009', 'Network Security and Resilience', 3, 12.50, 'TNE10006 OR COS20012');

-- --------------------------------------------------------

--
-- Table structure for table `a_major`
--

CREATE TABLE `a_major` (
  `M_CODE` varchar(45) NOT NULL,
  `M_NAME` varchar(100) DEFAULT NULL,
  `COURSE` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `a_major`
--

INSERT INTO `a_major` (`M_CODE`, `M_NAME`, `COURSE`) VALUES
('BUS-MAR', 'Marketing', 'BA-BUS'),
('CS-AI', 'Artificial Intelligence', 'BA-CS'),
('CS-CYBSEC', 'Cyber Security', 'BA-CS'),
('CS-DS', 'Data Science', 'BA-CS'),
('CS-IOT', 'Internet of Things', 'BA-CS'),
('CS-SD', 'Software Development', 'BA-CS'),
('MCMN-PR', 'Public Relations', 'BA-MCMN');

-- --------------------------------------------------------

--
-- Stand-in structure for view `a_student_cohort_view`
-- (See below for the actual view)
--
CREATE TABLE `a_student_cohort_view` (
`U_CODE` varchar(45)
,`U_NAME` varchar(100)
,`semester_month` enum('Jan','May','Sep')
,`semester_year` year(4)
,`m_code` varchar(45)
,`not_enrolled_or_failed_students` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `a_student_credit_history`
--

CREATE TABLE `a_student_credit_history` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `semester_code` varchar(16) NOT NULL,
  `credits` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_student_credit_history`
--

INSERT INTO `a_student_credit_history` (`id`, `student_id`, `semester_code`, `credits`, `created_at`, `updated_at`) VALUES
(1, 1, '2023A', 15, '2023-01-15 01:00:00', '2023-01-15 01:00:00'),
(2, 1, '2023B', 18, '2023-07-01 02:00:00', '2023-07-01 02:00:00'),
(3, 2, '2022A', 12, '2022-01-20 03:00:00', '2022-01-20 03:00:00'),
(4, 2, '2022B', 15, '2022-07-05 07:30:00', '2022-07-05 07:30:00'),
(5, 3, '2024A', 20, '2024-02-01 04:00:00', '2024-02-01 04:00:00'),
(6, 3, '2024B', 18, '2024-08-01 04:30:00', '2024-08-01 04:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `a_student_enroll`
--

CREATE TABLE `a_student_enroll` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `u_code` varchar(45) NOT NULL,
  `semester_month` enum('Jan','May','Sep') NOT NULL,
  `semester_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `a_student_enroll`
--

INSERT INTO `a_student_enroll` (`id`, `student_id`, `u_code`, `semester_month`, `semester_year`) VALUES
(153, 3, 'COS40005', 'Sep', '2025'),
(154, 3, 'COS40006', 'Sep', '2025'),
(155, 3, 'COS30082', 'Sep', '2025'),
(210, 1, 'TNE10005', 'Sep', '2025'),
(211, 1, 'COS20019', 'Sep', '2025'),
(212, 1, 'COS40006', 'Sep', '2025'),
(213, 8, 'TNE10006', 'May', '2025'),
(214, 8, 'COS10026', 'May', '2025'),
(215, 8, 'COS10025', 'May', '2025'),
(216, 13, 'COS10004', 'May', '2025'),
(217, 13, 'COS10025', 'May', '2025'),
(218, 13, 'COS10026', 'May', '2025'),
(222, 13, 'COS10022', 'Sep', '2025'),
(223, 13, 'STA10003', 'Sep', '2025'),
(224, 13, 'TNE10005', 'Sep', '2025'),
(227, 1, 'COS10025', 'May', '2025'),
(228, 1, 'COS20031', 'May', '2025'),
(229, 1, 'COS30045', 'May', '2025'),
(230, 1, 'COS20030', 'Jan', '2026'),
(231, 1, 'TNE20002', 'Jan', '2026'),
(232, 1, 'COS30020', 'Jan', '2026'),
(235, 2, 'SWE30011', 'Jan', '2026'),
(236, 2, 'COS40006', 'Jan', '2026'),
(237, 2, 'COS40007', 'Jan', '2026'),
(292, 2, 'COS20031', 'May', '2025'),
(293, 2, 'COS20007', 'May', '2025'),
(294, 2, 'BUS10015', 'May', '2025'),
(298, 2, 'COS10022', 'Sep', '2025'),
(299, 2, 'COS30008', 'Sep', '2025'),
(300, 2, 'COS20015', 'Sep', '2025');

-- --------------------------------------------------------

--
-- Table structure for table `a_student_major`
--

CREATE TABLE `a_student_major` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `m_code` varchar(45) NOT NULL,
  `semester_month` enum('Jan','May','Sep') NOT NULL,
  `semester_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `a_student_major`
--

INSERT INTO `a_student_major` (`student_id`, `student_name`, `m_code`, `semester_month`, `semester_year`) VALUES
(1, 'Nguyen Tien A', 'CS-CYBSEC', 'Sep', '2024'),
(2, 'Phan Van B', 'CS-IOT', 'May', '2024'),
(3, 'Truong Cong C', 'CS-SD', 'Jan', '2023'),
(4, 'Le Minh D', 'CS-AI', 'May', '2025'),
(5, 'Wilbur', 'CS-DS', 'May', '2026'),
(6, 'Corinna', 'CS-IOT', 'May', '2025'),
(7, 'Perry', 'CS-IOT', 'Jan', '2025'),
(8, 'Carmel', 'CS-CYBSEC', 'Sep', '2026'),
(9, 'Marven', 'CS-AI', 'Jan', '2026'),
(10, 'Foss', 'CS-CYBSEC', 'Sep', '2024'),
(11, 'Linnell', 'CS-CYBSEC', 'Sep', '2023'),
(12, 'Nanete', 'CS-SD', 'Jan', '2023'),
(13, 'Ethe', 'CS-AI', 'May', '2024'),
(14, 'George', 'CS-IOT', 'Sep', '2023'),
(15, 'Joli', 'CS-CYBSEC', 'Sep', '2026'),
(16, 'Donnell', 'CS-CYBSEC', 'Jan', '2026'),
(17, 'Mathilde', 'CS-IOT', 'Jan', '2026'),
(18, 'Tedman', 'CS-CYBSEC', 'Jan', '2024'),
(19, 'Aimil', 'CS-DS', 'May', '2025'),
(20, 'Rhodie', 'CS-IOT', 'Jan', '2025'),
(21, 'Dorene', 'CS-AI', 'May', '2026'),
(22, 'Wendall', 'CS-AI', 'May', '2025'),
(23, 'Hilliard', 'CS-IOT', 'Sep', '2025'),
(24, 'Amity', 'CS-SD', 'May', '2023'),
(25, 'Conrado', 'CS-CYBSEC', 'May', '2025'),
(26, 'Papagena', 'CS-DS', 'Sep', '2026'),
(27, 'Eadmund', 'CS-IOT', 'Sep', '2023'),
(28, 'Quintina', 'CS-AI', 'Jan', '2023'),
(29, 'Susi', 'CS-AI', 'Jan', '2025'),
(30, 'Launce', 'CS-CYBSEC', 'May', '2024'),
(31, 'Chrissy', 'CS-IOT', 'Jan', '2024'),
(32, 'Arnie', 'CS-SD', 'Sep', '2025'),
(33, 'Spike', 'CS-IOT', 'May', '2025'),
(34, 'Ambrosius', 'CS-DS', 'May', '2024'),
(35, 'Nicolea', 'CS-AI', 'Sep', '2024'),
(36, 'Gavan', 'CS-IOT', 'May', '2026'),
(37, 'Florence', 'CS-DS', 'Sep', '2025'),
(38, 'Appolonia', 'CS-IOT', 'Jan', '2026'),
(39, 'Coletta', 'CS-AI', 'May', '2025'),
(40, 'Carolin', 'CS-SD', 'Sep', '2025'),
(41, 'Cathy', 'CS-DS', 'Sep', '2026'),
(42, 'Denny', 'CS-DS', 'Sep', '2025'),
(43, 'Findlay', 'CS-CYBSEC', 'Jan', '2023'),
(44, 'Jarvis', 'CS-SD', 'Sep', '2023'),
(45, 'Austine', 'CS-CYBSEC', 'May', '2026'),
(46, 'Garnette', 'CS-DS', 'Jan', '2024'),
(47, 'Shaylah', 'CS-AI', 'Jan', '2025'),
(48, 'Erskine', 'CS-AI', 'May', '2025'),
(49, 'Shellysheldon', 'CS-AI', 'Sep', '2025'),
(50, 'Rycca', 'CS-AI', 'Jan', '2023'),
(51, 'Othilie', 'CS-CYBSEC', 'May', '2023'),
(52, 'Alastair', 'CS-SD', 'May', '2024'),
(53, 'Douglass', 'CS-AI', 'May', '2024'),
(54, 'Somerset', 'CS-DS', 'Jan', '2023'),
(55, 'Jolene', 'CS-DS', 'Sep', '2023'),
(56, 'Devin', 'CS-DS', 'Sep', '2025'),
(57, 'Thoma', 'CS-DS', 'Jan', '2024'),
(58, 'Zared', 'CS-AI', 'Sep', '2024'),
(59, 'Zack', 'CS-AI', 'Sep', '2024'),
(60, 'Gussie', 'CS-AI', 'Sep', '2023'),
(61, 'Vanni', 'CS-SD', 'May', '2026'),
(62, 'Gustav', 'CS-DS', 'Jan', '2023'),
(63, 'Laverna', 'CS-CYBSEC', 'May', '2023'),
(64, 'Evangelina', 'CS-DS', 'May', '2025'),
(65, 'Mahmud', 'CS-IOT', 'Jan', '2025'),
(66, 'Hamid', 'CS-CYBSEC', 'Jan', '2023'),
(67, 'Trudy', 'CS-IOT', 'Jan', '2024'),
(68, 'Yehudi', 'CS-DS', 'Sep', '2025'),
(69, 'Holt', 'CS-DS', 'Jan', '2026'),
(70, 'Agnesse', 'CS-DS', 'Sep', '2024'),
(71, 'Wallie', 'CS-AI', 'Sep', '2024'),
(72, 'Alberta', 'CS-DS', 'Jan', '2025'),
(73, 'Marti', 'CS-IOT', 'May', '2023'),
(74, 'Spencer', 'CS-CYBSEC', 'Sep', '2024'),
(75, 'Harper', 'CS-SD', 'Sep', '2025'),
(76, 'Linet', 'CS-AI', 'Sep', '2024'),
(77, 'Nessy', 'CS-SD', 'Sep', '2025'),
(78, 'Ryan', 'CS-AI', 'Jan', '2024'),
(79, 'Randal', 'CS-IOT', 'May', '2024'),
(80, 'Deva', 'CS-CYBSEC', 'Sep', '2026'),
(81, 'Nev', 'CS-CYBSEC', 'Sep', '2026'),
(82, 'Yardley', 'CS-SD', 'Jan', '2024'),
(83, 'Conney', 'CS-AI', 'Sep', '2026'),
(84, 'Guenna', 'CS-SD', 'Sep', '2023'),
(85, 'Clarissa', 'CS-SD', 'Sep', '2024'),
(86, 'Amalee', 'CS-IOT', 'Sep', '2025'),
(87, 'Jemmie', 'CS-SD', 'Jan', '2026'),
(88, 'Arvie', 'CS-CYBSEC', 'May', '2024'),
(89, 'Zola', 'CS-DS', 'Jan', '2023'),
(90, 'Pennie', 'CS-CYBSEC', 'Jan', '2023'),
(91, 'Brook', 'CS-SD', 'Sep', '2023'),
(92, 'Joby', 'CS-IOT', 'Sep', '2025'),
(93, 'Nelia', 'CS-AI', 'Sep', '2026'),
(94, 'Dani', 'CS-IOT', 'Sep', '2025'),
(95, 'Adeline', 'CS-AI', 'Jan', '2025'),
(96, 'Evangelin', 'CS-IOT', 'Jan', '2024'),
(97, 'Junia', 'CS-AI', 'Sep', '2026'),
(98, 'Sonnnie', 'CS-AI', 'Jan', '2024'),
(99, 'Annabell', 'CS-DS', 'Jan', '2025'),
(100, 'Tedi', 'CS-AI', 'Sep', '2024');

-- --------------------------------------------------------

--
-- Table structure for table `a_student_planner`
--

CREATE TABLE `a_student_planner` (
  `id` int(11) NOT NULL,
  `total_credits_required` int(11) NOT NULL,
  `credits_earned` int(11) NOT NULL,
  `avg_credits_per_semester` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `a_student_planner`
--

INSERT INTO `a_student_planner` (`id`, `total_credits_required`, `credits_earned`, `avg_credits_per_semester`, `created_at`, `updated_at`) VALUES
(1, 120, 30, 15.00, '2025-01-10 02:00:00', '2025-07-01 03:30:00'),
(2, 120, 60, 20.00, '2025-02-15 05:15:00', '2025-07-01 03:30:00'),
(3, 120, 90, 18.00, '2024-09-05 01:00:00', '2025-06-30 07:45:00'),
(4, 150, 75, 25.00, '2023-10-01 03:00:00', '2025-07-01 03:30:00'),
(5, 130, 65, 21.67, '2024-03-20 08:30:00', '2025-07-01 03:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `a_student_unit_status`
--

CREATE TABLE `a_student_unit_status` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `unit_id` varchar(45) NOT NULL,
  `status` enum('Enrolled','Passed','Failed','Studying') NOT NULL,
  `enrollment_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `a_student_unit_status`
--

INSERT INTO `a_student_unit_status` (`id`, `student_id`, `unit_id`, `status`, `enrollment_count`) VALUES
(1, 1, 'COS10004', 'Studying', 1),
(2, 1, 'COS10009', 'Studying', 1),
(3, 1, 'TNE10006', 'Passed', 1),
(4, 1, 'STA10003', 'Passed', 1),
(5, 2, 'COS10004', 'Passed', 1),
(6, 2, 'COS10025', 'Passed', 1),
(7, 2, 'COS10026', 'Passed', 1),
(8, 2, 'TNE10006', 'Passed', 1),
(9, 2, 'COS10005', 'Failed', 1),
(10, 2, 'TNE10005', 'Studying', 1),
(11, 2, 'COS10009', 'Studying', 2),
(12, 2, 'COS20019', 'Studying', 1),
(13, 3, 'COS10004', 'Passed', 1),
(14, 3, 'COS10009', 'Passed', 1),
(15, 3, 'COS10025', 'Passed', 1),
(16, 3, 'COS10026', 'Passed', 2),
(17, 3, 'TNE10006', 'Passed', 1),
(18, 3, 'COS10005', 'Passed', 1),
(19, 3, 'BUS10015', 'Passed', 3),
(20, 3, 'COS20007', 'Passed', 1),
(21, 3, 'COS20031', 'Passed', 2),
(22, 3, 'COS20015', 'Passed', 1),
(23, 3, 'COS20019', 'Passed', 1),
(24, 3, 'COS30049', 'Passed', 2),
(25, 3, 'SWE30003', 'Passed', 1),
(26, 3, 'COS30043', 'Studying', 1),
(27, 3, 'SWE30009', 'Studying', 1),
(28, 1, 'COS10005', 'Studying', 1),
(29, 1, 'COS10026', 'Failed', 1),
(30, 3, 'COS30045', 'Studying', 1),
(31, 20, 'COS20007', 'Failed', 1),
(32, 87, 'COS10005', 'Passed', 2),
(33, 46, 'COS30082', 'Passed', 2),
(34, 83, 'COS30008', 'Passed', 2),
(35, 51, 'COS30045', 'Passed', 2),
(36, 41, 'STA10003', 'Failed', 1),
(37, 22, 'TNE10006', 'Passed', 2),
(38, 49, 'COS30049', 'Failed', 2),
(39, 60, 'COS20015', 'Failed', 2),
(40, 33, 'COS10025', 'Failed', 1),
(41, 88, 'COS30017', 'Failed', 1),
(42, 11, 'COS20019', 'Failed', 2),
(43, 53, 'ICT20016', 'Failed', 2),
(44, 75, 'ICT20016', 'Passed', 1),
(45, 37, 'COS10009', 'Failed', 1),
(46, 83, 'COS10022', 'Passed', 2),
(47, 24, 'COS30045', 'Passed', 2),
(48, 22, 'SWE30011', 'Failed', 1),
(49, 77, 'COS20030', 'Passed', 1),
(50, 38, 'COS30019', 'Failed', 2),
(51, 49, 'COS10009', 'Passed', 2),
(52, 39, 'COS30045', 'Failed', 1),
(53, 61, 'COS10005', 'Failed', 1),
(54, 57, 'COS10009', 'Failed', 1),
(55, 62, 'COS10022', 'Passed', 1),
(56, 40, 'SWE30003', 'Passed', 2),
(57, 31, 'COS40007', 'Failed', 1),
(58, 84, 'COS10022', 'Failed', 1),
(59, 11, 'COS30049', 'Failed', 2),
(60, 34, 'TNE10006', 'Failed', 1),
(61, 63, 'COS40005', 'Passed', 1),
(62, 89, 'COS10025', 'Passed', 2),
(63, 24, 'COS40006', 'Passed', 2),
(64, 56, 'COS40005', 'Failed', 1),
(65, 52, 'COS10009', 'Passed', 2),
(66, 39, 'COS20030', 'Failed', 1),
(67, 60, 'ICT20016', 'Failed', 1),
(68, 90, 'COS10004', 'Passed', 2),
(69, 61, 'COS20031', 'Passed', 1),
(70, 48, 'COS10009', 'Failed', 1),
(71, 95, 'COS30015', 'Passed', 2),
(72, 98, 'SWE30009', 'Passed', 1),
(73, 31, 'SWE30003', 'Passed', 1),
(74, 10, 'BUS10015', 'Passed', 1),
(75, 10, 'COS10022', 'Failed', 1),
(76, 28, 'COS30020', 'Passed', 1),
(77, 89, 'COS30049', 'Failed', 1),
(78, 17, 'COS40005', 'Failed', 1),
(79, 32, 'SWE30003', 'Passed', 2),
(80, 87, 'COS40006', 'Failed', 1),
(81, 91, 'COS20019', 'Passed', 2),
(82, 75, 'COS20031', 'Passed', 1),
(83, 39, 'TNE30009', 'Passed', 1),
(84, 61, 'TNE30009', 'Passed', 2),
(85, 88, 'COS20030', 'Passed', 2),
(86, 25, 'ICT20016', 'Failed', 1),
(87, 51, 'SWE30011', 'Failed', 2),
(88, 66, 'TNE10005', 'Failed', 1),
(89, 91, 'COS10009', 'Passed', 2),
(90, 75, 'BUS10015', 'Failed', 2),
(91, 42, 'TNE10006', 'Passed', 2),
(92, 54, 'COS30017', 'Failed', 1),
(93, 6, 'COS30017', 'Passed', 2),
(94, 61, 'COS10009', 'Failed', 2),
(95, 97, 'TNE30009', 'Failed', 2),
(96, 16, 'COS10026', 'Passed', 1),
(97, 51, 'ICT20016', 'Passed', 1),
(98, 91, 'TNE10005', 'Failed', 1),
(99, 50, 'COS30018', 'Passed', 2),
(100, 40, 'COS10005', 'Passed', 2),
(101, 91, 'COS20007', 'Failed', 2),
(102, 48, 'BUS10015', 'Passed', 1),
(103, 29, 'COS10025', 'Failed', 2),
(104, 17, 'COS10026', 'Passed', 2),
(105, 91, 'SWE30011', 'Failed', 1),
(106, 36, 'BUS10015', 'Failed', 2),
(107, 54, 'TNE10005', 'Failed', 2),
(108, 15, 'COS20019', 'Passed', 1),
(109, 80, 'TNE30009', 'Passed', 1),
(110, 56, 'COS30008', 'Passed', 2),
(111, 40, 'COS20028', 'Passed', 1),
(112, 40, 'TNE20002', 'Failed', 1),
(113, 15, 'STA10003', 'Failed', 1),
(114, 100, 'TNE30009', 'Failed', 2),
(115, 18, 'BUS10015', 'Passed', 2),
(116, 53, 'COS10005', 'Passed', 1),
(117, 35, 'SWE30009', 'Passed', 2),
(118, 100, 'COS30018', 'Failed', 1),
(119, 75, 'COS30017', 'Failed', 2),
(120, 26, 'COS30082', 'Failed', 2),
(121, 48, 'COS10005', 'Passed', 1),
(122, 57, 'COS40005', 'Failed', 2),
(123, 27, 'TNE10006', 'Passed', 2),
(124, 94, 'SWE30003', 'Passed', 1),
(125, 35, 'COS30008', 'Passed', 1),
(126, 87, 'COS30082', 'Failed', 1),
(127, 50, 'TNE30009', 'Failed', 1),
(128, 13, 'COS30082', 'Passed', 1),
(129, 51, 'ICT20015', 'Failed', 2),
(130, 80, 'COS20030', 'Failed', 1),
(131, 39, 'TNE10005', 'Failed', 1),
(132, 23, 'COS20031', 'Failed', 2),
(133, 42, 'COS30045', 'Passed', 2),
(134, 43, 'COS20007', 'Failed', 2),
(135, 45, 'TNE10005', 'Passed', 1),
(136, 73, 'COS40003', 'Passed', 1),
(137, 47, 'COS40007', 'Passed', 1),
(138, 45, 'COS10025', 'Failed', 2),
(139, 15, 'BUS10015', 'Passed', 2),
(140, 22, 'COS40006', 'Passed', 2),
(141, 100, 'COS30017', 'Passed', 2),
(142, 74, 'COS20030', 'Failed', 2),
(143, 88, 'COS20028', 'Failed', 2),
(144, 32, 'COS30008', 'Passed', 2),
(145, 92, 'SWE30011', 'Passed', 2),
(146, 73, 'COS20028', 'Failed', 1),
(147, 89, 'COS20015', 'Passed', 1),
(148, 61, 'TNE20002', 'Passed', 2),
(149, 35, 'COS30015', 'Failed', 2),
(150, 66, 'COS10005', 'Passed', 2),
(151, 64, 'COS20015', 'Failed', 2),
(152, 79, 'SWE40006', 'Passed', 2),
(153, 67, 'COS30082', 'Passed', 2),
(154, 100, 'COS30045', 'Failed', 1),
(155, 18, 'COS20031', 'Failed', 2),
(156, 7, 'COS30015', 'Failed', 1),
(157, 14, 'COS30049', 'Failed', 1),
(158, 96, 'SWE30003', 'Failed', 2),
(159, 20, 'COS40005', 'Failed', 1),
(160, 99, 'COS10025', 'Passed', 1),
(161, 41, 'ICT20015', 'Passed', 2),
(162, 7, 'COS30045', 'Passed', 2),
(163, 22, 'SWE30009', 'Failed', 1),
(164, 29, 'COS10022', 'Passed', 2),
(165, 36, 'COS30018', 'Failed', 2),
(166, 88, 'COS10026', 'Failed', 2),
(167, 22, 'SWE30011', 'Failed', 1),
(168, 58, 'TNE10006', 'Passed', 2),
(169, 72, 'COS20007', 'Passed', 2),
(170, 37, 'STA10003', 'Failed', 1),
(171, 56, 'COS10026', 'Failed', 2),
(172, 56, 'COS30043', 'Failed', 2),
(173, 94, 'COS30019', 'Passed', 2),
(174, 33, 'SWE30011', 'Failed', 2),
(175, 54, 'COS30018', 'Failed', 1),
(176, 60, 'COS20028', 'Passed', 2),
(177, 46, 'COS10004', 'Failed', 2),
(178, 83, 'TNE30009', 'Failed', 2),
(179, 87, 'COS10005', 'Passed', 1),
(180, 66, 'COS30082', 'Passed', 1),
(181, 46, 'ICT20016', 'Failed', 2),
(182, 38, 'ICT20015', 'Failed', 1),
(183, 91, 'BUS10015', 'Passed', 1),
(184, 9, 'COS10022', 'Passed', 2),
(185, 59, 'COS20019', 'Passed', 1),
(186, 81, 'COS20019', 'Passed', 2),
(187, 15, 'SWE30011', 'Failed', 1),
(188, 100, 'COS30017', 'Passed', 2),
(189, 21, 'COS10004', 'Passed', 2),
(190, 89, 'SWE40006', 'Failed', 2),
(191, 31, 'COS40005', 'Failed', 1),
(192, 75, 'ICT20016', 'Failed', 1),
(193, 38, 'SWE30009', 'Failed', 1),
(194, 18, 'COS10004', 'Failed', 1),
(195, 95, 'SWE30009', 'Passed', 2),
(196, 26, 'COS20019', 'Failed', 1),
(197, 47, 'COS30045', 'Failed', 2),
(198, 38, 'TNE10005', 'Passed', 2),
(199, 34, 'TNE30009', 'Passed', 2),
(200, 40, 'COS20030', 'Passed', 1),
(201, 77, 'COS40005', 'Passed', 2),
(202, 52, 'ICT20015', 'Passed', 2),
(203, 45, 'COS30043', 'Passed', 1),
(204, 100, 'COS20019', 'Failed', 2),
(205, 22, 'SWE30011', 'Failed', 2),
(206, 25, 'ICT20016', 'Failed', 1),
(207, 39, 'ICT20016', 'Failed', 2),
(208, 16, 'COS30082', 'Failed', 1),
(209, 57, 'COS30020', 'Passed', 2),
(210, 63, 'COS30020', 'Passed', 1),
(211, 88, 'COS30049', 'Passed', 2),
(212, 18, 'SWE30009', 'Passed', 1),
(213, 38, 'COS10022', 'Failed', 2),
(214, 92, 'ICT20015', 'Failed', 2),
(215, 97, 'COS30043', 'Passed', 1),
(216, 73, 'COS20007', 'Passed', 1),
(217, 26, 'COS30043', 'Passed', 2),
(218, 74, 'TNE30009', 'Failed', 1),
(219, 55, 'BUS10015', 'Failed', 2),
(220, 40, 'COS30020', 'Failed', 2),
(221, 63, 'COS30015', 'Passed', 2),
(222, 44, 'COS30043', 'Passed', 1),
(223, 85, 'COS40006', 'Failed', 2),
(224, 85, 'COS30017', 'Failed', 2),
(225, 43, 'TNE10006', 'Passed', 1),
(226, 51, 'COS10022', 'Passed', 2),
(227, 100, 'COS20007', 'Passed', 2),
(228, 29, 'COS40003', 'Failed', 1),
(229, 68, 'COS20007', 'Failed', 1),
(230, 6, 'SWE40006', 'Passed', 2),
(231, 79, 'COS10026', 'Passed', 2),
(232, 52, 'TNE30009', 'Passed', 2),
(233, 63, 'COS30015', 'Failed', 2),
(234, 63, 'COS20030', 'Failed', 2),
(235, 83, 'COS30049', 'Passed', 1),
(236, 41, 'COS30049', 'Passed', 2),
(237, 15, 'COS10022', 'Passed', 2),
(238, 88, 'SWE40006', 'Failed', 2),
(239, 36, 'SWE30011', 'Passed', 1),
(240, 82, 'COS30043', 'Passed', 1),
(241, 86, 'TNE20002', 'Failed', 2),
(242, 76, 'COS20031', 'Passed', 2),
(243, 50, 'ICT20016', 'Failed', 2),
(244, 55, 'COS20007', 'Passed', 1),
(245, 89, 'COS20007', 'Failed', 2),
(246, 37, 'COS30082', 'Failed', 2),
(247, 88, 'COS20030', 'Failed', 1),
(248, 69, 'TNE10005', 'Failed', 2),
(249, 78, 'COS10025', 'Failed', 1),
(250, 78, 'COS20031', 'Failed', 2),
(251, 55, 'STA10003', 'Failed', 1),
(252, 29, 'COS30019', 'Failed', 2),
(253, 73, 'COS20007', 'Passed', 1),
(254, 15, 'TNE10006', 'Failed', 1),
(255, 11, 'COS30045', 'Failed', 2),
(256, 80, 'COS20030', 'Failed', 1),
(257, 65, 'COS10026', 'Passed', 1),
(258, 46, 'BUS10015', 'Passed', 2),
(259, 66, 'COS10022', 'Passed', 2),
(260, 37, 'COS10005', 'Passed', 2),
(261, 49, 'COS10022', 'Passed', 2),
(262, 60, 'TNE30009', 'Failed', 1),
(263, 29, 'COS20007', 'Passed', 1),
(264, 6, 'TNE30009', 'Passed', 2),
(265, 49, 'COS30049', 'Failed', 1),
(266, 32, 'COS30015', 'Passed', 1),
(267, 94, 'COS30008', 'Passed', 2),
(268, 54, 'COS10009', 'Passed', 2),
(269, 94, 'COS30019', 'Failed', 1),
(270, 82, 'TNE10005', 'Passed', 2),
(271, 91, 'COS20028', 'Failed', 1),
(272, 78, 'COS10026', 'Passed', 1),
(273, 71, 'COS30049', 'Failed', 1),
(274, 7, 'COS30082', 'Passed', 1),
(275, 93, 'COS20015', 'Failed', 2),
(276, 11, 'COS30008', 'Passed', 1),
(277, 29, 'ICT20016', 'Failed', 1),
(278, 13, 'ICT20015', 'Passed', 2),
(279, 21, 'COS20007', 'Failed', 2),
(280, 78, 'SWE40006', 'Passed', 2),
(281, 10, 'COS30018', 'Failed', 1),
(282, 66, 'COS10009', 'Passed', 1),
(283, 58, 'TNE10006', 'Failed', 1),
(284, 30, 'COS20019', 'Passed', 2),
(285, 70, 'COS30019', 'Failed', 2),
(286, 62, 'TNE30009', 'Passed', 1),
(287, 51, 'STA10003', 'Failed', 2),
(288, 70, 'COS40006', 'Failed', 2),
(289, 50, 'COS10009', 'Passed', 2),
(290, 87, 'COS30015', 'Passed', 1),
(291, 86, 'COS30018', 'Failed', 1),
(292, 67, 'COS40005', 'Passed', 2),
(293, 66, 'BUS10015', 'Failed', 1),
(294, 43, 'COS10022', 'Passed', 2),
(295, 60, 'COS20019', 'Passed', 1),
(296, 92, 'SWE40006', 'Failed', 2),
(297, 81, 'STA10003', 'Passed', 1),
(298, 36, 'COS30082', 'Failed', 2),
(299, 99, 'COS10022', 'Passed', 1),
(300, 8, 'COS20030', 'Failed', 2),
(301, 75, 'COS10025', 'Passed', 1),
(302, 84, 'COS20015', 'Passed', 1),
(303, 61, 'COS10025', 'Failed', 1),
(304, 45, 'SWE40006', 'Failed', 1),
(305, 75, 'COS10009', 'Passed', 1),
(306, 74, 'COS10026', 'Failed', 2),
(307, 70, 'SWE30003', 'Passed', 2),
(308, 73, 'COS30008', 'Failed', 1),
(309, 41, 'STA10003', 'Passed', 2),
(310, 25, 'TNE30009', 'Failed', 2),
(311, 66, 'COS10025', 'Failed', 1),
(312, 83, 'ICT20016', 'Passed', 2),
(313, 32, 'ICT20015', 'Passed', 1),
(314, 17, 'COS30019', 'Failed', 2),
(315, 68, 'COS30045', 'Passed', 2),
(316, 18, 'COS10022', 'Passed', 1),
(317, 12, 'TNE30009', 'Failed', 2),
(318, 41, 'COS30043', 'Failed', 1),
(319, 60, 'COS20007', 'Passed', 1),
(320, 40, 'COS40006', 'Passed', 1),
(321, 75, 'SWE30009', 'Passed', 2),
(322, 99, 'COS30008', 'Failed', 1),
(323, 79, 'COS30015', 'Passed', 1),
(324, 50, 'COS30018', 'Passed', 2),
(325, 69, 'COS30045', 'Passed', 1),
(326, 46, 'COS40007', 'Failed', 2),
(327, 24, 'COS40005', 'Passed', 1),
(328, 60, 'COS10009', 'Passed', 1),
(329, 80, 'COS30082', 'Failed', 1),
(330, 52, 'COS20031', 'Failed', 2),
(331, 91, 'ICT20015', 'Passed', 2),
(332, 15, 'COS30082', 'Failed', 2),
(333, 60, 'COS30020', 'Failed', 2),
(334, 91, 'COS20030', 'Passed', 2),
(335, 67, 'COS20028', 'Failed', 2),
(336, 47, 'COS30082', 'Passed', 2),
(337, 68, 'ICT20015', 'Passed', 2),
(338, 80, 'COS10022', 'Passed', 1),
(339, 83, 'COS30049', 'Failed', 1),
(340, 52, 'TNE30009', 'Failed', 1),
(341, 29, 'COS10026', 'Passed', 2),
(342, 52, 'COS20030', 'Passed', 2),
(343, 30, 'BUS10015', 'Failed', 2),
(344, 90, 'TNE20002', 'Failed', 1),
(345, 53, 'COS30018', 'Failed', 2),
(346, 92, 'COS10022', 'Passed', 2),
(347, 98, 'COS30018', 'Failed', 2),
(348, 28, 'COS30008', 'Passed', 2),
(349, 49, 'COS20015', 'Passed', 2),
(350, 71, 'BUS10015', 'Failed', 1),
(351, 87, 'COS30017', 'Passed', 2),
(352, 7, 'COS30045', 'Failed', 1),
(353, 65, 'STA10003', 'Passed', 2),
(354, 35, 'COS10025', 'Passed', 1),
(355, 64, 'TNE30009', 'Failed', 2),
(356, 51, 'BUS10015', 'Failed', 1),
(357, 8, 'COS30045', 'Passed', 2),
(358, 61, 'COS30082', 'Failed', 2),
(359, 18, 'ICT20016', 'Failed', 2),
(360, 93, 'TNE10006', 'Failed', 2),
(361, 18, 'COS20007', 'Passed', 2),
(362, 91, 'COS30020', 'Failed', 1),
(363, 26, 'ICT20016', 'Failed', 1),
(364, 99, 'COS30049', 'Failed', 2),
(365, 60, 'SWE30011', 'Passed', 1),
(366, 65, 'COS30017', 'Failed', 2),
(367, 84, 'SWE30011', 'Passed', 1),
(368, 18, 'COS20015', 'Passed', 1),
(369, 48, 'SWE30011', 'Passed', 1),
(370, 54, 'SWE40006', 'Failed', 1),
(371, 11, 'COS30017', 'Failed', 2),
(372, 58, 'COS30008', 'Passed', 1),
(373, 7, 'COS30019', 'Failed', 1),
(374, 89, 'COS10004', 'Failed', 1),
(375, 97, 'COS30008', 'Passed', 2),
(376, 81, 'COS10004', 'Passed', 2),
(377, 37, 'COS30018', 'Passed', 1),
(378, 91, 'COS20028', 'Failed', 2),
(379, 15, 'COS10022', 'Passed', 1),
(380, 38, 'TNE30009', 'Failed', 1),
(381, 49, 'COS30043', 'Failed', 1),
(382, 27, 'COS30020', 'Passed', 1),
(383, 95, 'COS30018', 'Failed', 1),
(384, 13, 'TNE10006', 'Passed', 1),
(385, 15, 'COS30018', 'Failed', 1),
(386, 83, 'ICT20015', 'Failed', 1),
(387, 24, 'BUS10015', 'Failed', 2),
(388, 70, 'BUS10015', 'Failed', 2),
(389, 25, 'SWE30009', 'Passed', 1),
(390, 100, 'COS10025', 'Passed', 2),
(391, 43, 'ICT20016', 'Passed', 1),
(392, 18, 'COS20015', 'Failed', 1),
(393, 76, 'ICT20016', 'Failed', 1),
(394, 36, 'COS10026', 'Passed', 2),
(395, 96, 'COS20019', 'Failed', 2),
(396, 67, 'COS30082', 'Passed', 2),
(397, 60, 'TNE30009', 'Failed', 1),
(398, 66, 'COS30020', 'Passed', 1),
(399, 12, 'COS30020', 'Passed', 1),
(400, 49, 'COS20019', 'Failed', 1),
(401, 10, 'SWE30011', 'Failed', 1),
(402, 13, 'COS20031', 'Passed', 1),
(403, 17, 'COS30043', 'Failed', 2),
(404, 20, 'COS30015', 'Passed', 1),
(405, 73, 'COS20030', 'Failed', 2),
(406, 76, 'BUS10015', 'Failed', 1),
(407, 25, 'TNE10006', 'Failed', 1),
(408, 82, 'COS30049', 'Passed', 2),
(409, 65, 'BUS10015', 'Failed', 2),
(410, 14, 'COS10009', 'Failed', 1),
(411, 18, 'COS10022', 'Failed', 2),
(412, 10, 'SWE40006', 'Passed', 1),
(413, 78, 'COS20007', 'Failed', 2),
(414, 83, 'COS20019', 'Passed', 2),
(415, 40, 'COS30015', 'Passed', 1),
(416, 33, 'SWE30009', 'Passed', 2),
(417, 14, 'SWE30011', 'Failed', 2),
(418, 7, 'COS20015', 'Passed', 1),
(419, 70, 'COS30019', 'Passed', 2),
(420, 30, 'COS40003', 'Passed', 1),
(421, 76, 'COS30043', 'Failed', 2),
(422, 16, 'COS30019', 'Passed', 2),
(423, 99, 'COS30019', 'Passed', 2),
(424, 43, 'TNE10005', 'Failed', 1),
(425, 59, 'COS10009', 'Failed', 2),
(426, 69, 'COS10009', 'Passed', 2),
(427, 85, 'COS40003', 'Passed', 2),
(428, 30, 'COS10004', 'Failed', 1),
(429, 11, 'ICT20015', 'Failed', 2),
(430, 94, 'COS20030', 'Failed', 2),
(431, 21, 'COS10026', 'Passed', 2),
(432, 81, 'COS40005', 'Passed', 1),
(433, 90, 'COS20007', 'Passed', 2),
(434, 76, 'COS30018', 'Failed', 1),
(435, 100, 'COS30008', 'Passed', 2),
(436, 30, 'COS10004', 'Failed', 1),
(437, 32, 'COS20015', 'Failed', 2),
(438, 94, 'COS10004', 'Failed', 2),
(439, 82, 'SWE30009', 'Passed', 2),
(440, 92, 'COS40006', 'Failed', 2),
(441, 8, 'COS30008', 'Failed', 2),
(442, 32, 'ICT20016', 'Passed', 1),
(443, 8, 'COS20028', 'Passed', 1),
(444, 65, 'COS30017', 'Failed', 2),
(445, 95, 'COS10005', 'Failed', 2),
(446, 57, 'COS20031', 'Failed', 1),
(447, 82, 'COS20030', 'Failed', 1),
(448, 94, 'SWE30003', 'Failed', 1),
(449, 42, 'COS20015', 'Failed', 1),
(450, 40, 'COS20019', 'Passed', 2),
(451, 70, 'COS40006', 'Failed', 2),
(452, 60, 'COS30043', 'Failed', 2),
(453, 9, 'TNE10005', 'Failed', 1),
(454, 83, 'COS20030', 'Failed', 1),
(455, 67, 'SWE40006', 'Passed', 2),
(456, 15, 'COS10004', 'Passed', 1),
(457, 52, 'TNE10006', 'Failed', 2),
(458, 11, 'ICT20015', 'Failed', 1),
(459, 80, 'COS20028', 'Passed', 1),
(460, 73, 'COS30008', 'Failed', 2),
(461, 57, 'SWE40006', 'Passed', 1),
(462, 52, 'COS20007', 'Passed', 2),
(463, 67, 'SWE30011', 'Failed', 1),
(464, 8, 'COS10004', 'Failed', 1),
(465, 24, 'COS40006', 'Passed', 1),
(466, 64, 'COS30017', 'Failed', 1),
(467, 86, 'COS40006', 'Failed', 1),
(468, 84, 'TNE20002', 'Failed', 1),
(469, 82, 'COS10004', 'Passed', 2),
(470, 83, 'COS30043', 'Failed', 1),
(471, 34, 'COS40007', 'Passed', 2),
(472, 48, 'COS30008', 'Failed', 2),
(473, 55, 'TNE10006', 'Passed', 2),
(474, 6, 'COS20030', 'Failed', 2),
(475, 84, 'TNE10005', 'Failed', 2),
(476, 34, 'SWE30003', 'Passed', 1),
(477, 44, 'COS30043', 'Failed', 1),
(478, 7, 'COS20019', 'Failed', 2),
(479, 72, 'COS40007', 'Failed', 1),
(480, 31, 'COS10025', 'Passed', 1),
(481, 16, 'COS30017', 'Failed', 2),
(482, 98, 'BUS10015', 'Failed', 2),
(483, 33, 'COS30008', 'Passed', 1),
(484, 85, 'COS30019', 'Failed', 1),
(485, 27, 'SWE30009', 'Failed', 2),
(486, 34, 'COS40005', 'Failed', 2),
(487, 80, 'SWE30011', 'Failed', 2),
(488, 38, 'STA10003', 'Passed', 1),
(489, 53, 'COS40007', 'Failed', 1),
(490, 25, 'COS10025', 'Passed', 1),
(491, 37, 'COS30043', 'Passed', 1),
(492, 26, 'COS10025', 'Passed', 1),
(493, 55, 'BUS10015', 'Failed', 2),
(494, 92, 'COS30045', 'Passed', 2),
(495, 36, 'COS30045', 'Passed', 2),
(496, 45, 'ICT20016', 'Failed', 2),
(497, 46, 'BUS10015', 'Passed', 2),
(498, 15, 'COS40003', 'Passed', 1),
(499, 50, 'COS20030', 'Failed', 2),
(500, 26, 'COS10026', 'Passed', 1),
(501, 44, 'ICT20015', 'Failed', 1),
(502, 39, 'SWE30009', 'Passed', 2),
(503, 88, 'COS30045', 'Failed', 2),
(504, 12, 'ICT20015', 'Failed', 1),
(505, 33, 'COS30049', 'Passed', 1),
(506, 36, 'COS30045', 'Failed', 2),
(507, 16, 'TNE20002', 'Failed', 2),
(508, 39, 'COS40003', 'Failed', 1),
(509, 50, 'COS10005', 'Passed', 2),
(510, 95, 'SWE30003', 'Failed', 1),
(511, 48, 'BUS10015', 'Failed', 1),
(512, 33, 'COS20031', 'Failed', 1),
(513, 91, 'COS20031', 'Passed', 1),
(514, 99, 'COS40006', 'Failed', 1),
(515, 36, 'TNE30009', 'Passed', 1),
(516, 15, 'COS20019', 'Failed', 2),
(517, 36, 'COS20015', 'Failed', 2),
(518, 18, 'COS20030', 'Failed', 1),
(519, 45, 'COS30015', 'Passed', 1),
(520, 91, 'COS30020', 'Passed', 2),
(521, 49, 'COS10022', 'Failed', 1),
(522, 74, 'COS20028', 'Failed', 2),
(523, 23, 'COS20030', 'Passed', 2),
(524, 85, 'COS40003', 'Failed', 1),
(525, 48, 'TNE30009', 'Failed', 1),
(526, 28, 'COS10022', 'Failed', 1),
(527, 75, 'COS30017', 'Failed', 1),
(528, 64, 'SWE30009', 'Passed', 2),
(529, 10, 'SWE40006', 'Passed', 1),
(530, 54, 'COS30017', 'Passed', 2),
(531, 39, 'COS30017', 'Failed', 1),
(532, 95, 'SWE30011', 'Failed', 2),
(533, 9, 'COS20007', 'Passed', 1),
(534, 81, 'TNE10005', 'Failed', 1),
(535, 74, 'COS30049', 'Failed', 1),
(536, 32, 'COS40007', 'Failed', 1),
(537, 95, 'COS20019', 'Failed', 1),
(538, 49, 'TNE10006', 'Failed', 1),
(539, 88, 'TNE10005', 'Passed', 1),
(540, 34, 'COS30082', 'Failed', 2),
(541, 65, 'COS30082', 'Passed', 1),
(542, 28, 'COS30082', 'Failed', 1),
(543, 34, 'COS10005', 'Failed', 2),
(544, 91, 'ICT20015', 'Passed', 2),
(545, 60, 'COS40003', 'Failed', 2),
(546, 82, 'COS20007', 'Failed', 1),
(547, 57, 'COS30017', 'Passed', 2),
(548, 77, 'TNE10006', 'Passed', 1),
(549, 92, 'COS30020', 'Passed', 1),
(550, 44, 'SWE40006', 'Failed', 2),
(551, 47, 'COS30020', 'Passed', 2),
(552, 87, 'COS10009', 'Passed', 1),
(553, 44, 'TNE10006', 'Failed', 2),
(554, 26, 'COS20031', 'Failed', 2),
(555, 83, 'TNE10006', 'Passed', 2),
(556, 19, 'COS40006', 'Passed', 2),
(557, 73, 'COS30045', 'Failed', 2),
(558, 68, 'COS20019', 'Failed', 2),
(559, 97, 'COS30017', 'Passed', 1),
(560, 75, 'COS30015', 'Failed', 2),
(561, 76, 'SWE40006', 'Passed', 1),
(562, 25, 'TNE20002', 'Failed', 2),
(563, 45, 'COS40003', 'Passed', 1),
(564, 37, 'COS30020', 'Failed', 1),
(565, 63, 'COS10004', 'Failed', 2),
(566, 80, 'COS30043', 'Passed', 1),
(567, 71, 'COS20031', 'Passed', 1),
(568, 6, 'COS20030', 'Failed', 2),
(569, 83, 'COS20030', 'Failed', 1),
(570, 31, 'COS20019', 'Failed', 1),
(571, 43, 'COS20007', 'Failed', 2),
(572, 66, 'COS30018', 'Passed', 2),
(573, 78, 'COS30043', 'Passed', 1),
(574, 83, 'TNE10005', 'Failed', 1),
(575, 70, 'SWE30003', 'Passed', 1),
(576, 39, 'COS30049', 'Passed', 2),
(577, 80, 'COS20030', 'Failed', 1),
(578, 87, 'SWE30011', 'Failed', 1),
(579, 63, 'COS40007', 'Failed', 1),
(580, 49, 'COS10025', 'Failed', 2),
(581, 44, 'COS30008', 'Passed', 1),
(582, 23, 'TNE30009', 'Passed', 2),
(583, 31, 'COS30043', 'Passed', 2),
(584, 54, 'COS10004', 'Failed', 1),
(585, 37, 'SWE40006', 'Failed', 1),
(586, 13, 'SWE40006', 'Passed', 1),
(587, 85, 'ICT20015', 'Passed', 1),
(588, 76, 'COS10025', 'Failed', 2),
(589, 12, 'TNE10006', 'Failed', 2),
(590, 91, 'SWE30011', 'Passed', 1),
(591, 26, 'COS30015', 'Passed', 1),
(592, 54, 'COS30045', 'Passed', 2),
(593, 7, 'COS40003', 'Passed', 2),
(594, 26, 'COS10009', 'Failed', 1),
(595, 27, 'COS30082', 'Failed', 1),
(596, 15, 'TNE30009', 'Passed', 2),
(597, 10, 'STA10003', 'Failed', 2),
(598, 49, 'COS30043', 'Failed', 2),
(599, 70, 'COS10022', 'Failed', 1),
(600, 34, 'SWE30011', 'Failed', 2),
(601, 86, 'SWE30003', 'Failed', 2),
(602, 11, 'COS20030', 'Failed', 2),
(603, 71, 'COS30049', 'Passed', 2),
(604, 99, 'COS20007', 'Failed', 1),
(605, 35, 'COS20007', 'Passed', 2),
(606, 77, 'COS20019', 'Failed', 2),
(607, 56, 'TNE30009', 'Failed', 1),
(608, 43, 'SWE30009', 'Failed', 2),
(609, 42, 'COS20028', 'Passed', 2),
(610, 35, 'COS40005', 'Failed', 2),
(611, 72, 'BUS10015', 'Failed', 2),
(612, 73, 'STA10003', 'Passed', 1),
(613, 84, 'TNE10006', 'Failed', 1),
(614, 84, 'COS30015', 'Passed', 2),
(615, 66, 'COS40005', 'Passed', 2),
(616, 19, 'COS30020', 'Passed', 2),
(617, 47, 'TNE20002', 'Passed', 1),
(618, 97, 'ICT20016', 'Failed', 2),
(619, 18, 'COS20031', 'Passed', 2),
(620, 61, 'COS20031', 'Failed', 2),
(621, 93, 'SWE30011', 'Passed', 1),
(622, 18, 'COS10025', 'Passed', 1),
(623, 48, 'TNE10005', 'Passed', 2),
(624, 42, 'COS20019', 'Failed', 1),
(625, 75, 'TNE10006', 'Failed', 1),
(626, 78, 'COS30020', 'Passed', 1),
(627, 26, 'COS10025', 'Failed', 2),
(628, 94, 'SWE30009', 'Failed', 2),
(629, 57, 'TNE10005', 'Failed', 1),
(630, 16, 'COS20015', 'Passed', 2),
(631, 6, 'COS20031', 'Passed', 2),
(632, 18, 'COS30045', 'Failed', 1),
(633, 73, 'STA10003', 'Failed', 1),
(634, 53, 'COS20028', 'Passed', 1),
(635, 40, 'STA10003', 'Failed', 2),
(636, 57, 'COS30020', 'Failed', 2),
(637, 81, 'COS20019', 'Passed', 2),
(638, 36, 'COS10004', 'Failed', 1),
(639, 82, 'COS20015', 'Passed', 2),
(640, 77, 'COS30015', 'Passed', 1),
(641, 87, 'COS30017', 'Failed', 2),
(642, 52, 'COS20015', 'Passed', 1),
(643, 78, 'COS30017', 'Passed', 1),
(644, 78, 'COS30017', 'Passed', 1),
(645, 42, 'COS30019', 'Passed', 2),
(646, 20, 'COS20019', 'Failed', 2),
(647, 77, 'COS30008', 'Passed', 2),
(648, 89, 'COS10026', 'Failed', 1),
(649, 44, 'COS30018', 'Passed', 2),
(650, 45, 'COS30008', 'Failed', 2),
(651, 68, 'COS30019', 'Passed', 2),
(652, 31, 'TNE30009', 'Passed', 2),
(653, 47, 'COS20031', 'Passed', 2),
(654, 28, 'ICT20015', 'Passed', 2),
(655, 23, 'COS30049', 'Passed', 2),
(656, 78, 'ICT20016', 'Failed', 2),
(657, 10, 'SWE30011', 'Passed', 1),
(658, 15, 'COS20028', 'Passed', 1),
(659, 31, 'COS20030', 'Failed', 2),
(660, 9, 'SWE30003', 'Failed', 1),
(661, 98, 'COS20028', 'Passed', 1),
(662, 15, 'BUS10015', 'Passed', 1),
(663, 92, 'COS40005', 'Passed', 1),
(664, 46, 'COS30049', 'Passed', 2),
(665, 95, 'BUS10015', 'Failed', 1),
(666, 95, 'TNE20002', 'Failed', 1),
(667, 19, 'COS30008', 'Passed', 1),
(668, 53, 'COS30017', 'Passed', 1),
(669, 84, 'COS30045', 'Failed', 2),
(670, 88, 'COS20028', 'Failed', 1),
(671, 97, 'COS30015', 'Passed', 2),
(672, 10, 'COS30082', 'Passed', 1),
(673, 76, 'COS20030', 'Passed', 2),
(674, 97, 'COS30082', 'Failed', 1),
(675, 53, 'COS30018', 'Passed', 1),
(676, 86, 'TNE10005', 'Failed', 1),
(677, 25, 'COS10005', 'Passed', 1),
(678, 20, 'BUS10015', 'Failed', 2),
(679, 50, 'COS40005', 'Failed', 1),
(680, 53, 'COS10004', 'Failed', 1),
(681, 48, 'TNE20002', 'Passed', 1),
(682, 80, 'COS10022', 'Failed', 1),
(683, 89, 'COS40005', 'Passed', 1),
(684, 13, 'SWE30011', 'Passed', 1),
(685, 64, 'COS30018', 'Failed', 1),
(686, 64, 'TNE10005', 'Failed', 2),
(687, 50, 'COS10025', 'Failed', 2),
(688, 63, 'COS20015', 'Failed', 2),
(689, 11, 'COS10022', 'Failed', 2),
(690, 79, 'COS40005', 'Failed', 2),
(691, 62, 'COS30049', 'Failed', 2),
(692, 33, 'COS30049', 'Passed', 1),
(693, 89, 'STA10003', 'Failed', 2),
(694, 98, 'SWE40006', 'Passed', 1),
(695, 51, 'TNE10006', 'Failed', 2),
(696, 8, 'COS20031', 'Failed', 2),
(697, 49, 'ICT20016', 'Passed', 2),
(698, 65, 'COS10022', 'Failed', 2),
(699, 36, 'COS10009', 'Passed', 2),
(700, 9, 'COS10026', 'Passed', 2),
(701, 6, 'BUS10015', 'Enrolled', 1),
(702, 6, 'COS10005', 'Enrolled', 2),
(703, 6, 'COS10025', 'Enrolled', 2),
(704, 7, 'COS10026', 'Enrolled', 1),
(705, 7, 'COS20007', 'Enrolled', 1),
(706, 7, 'COS20031', 'Enrolled', 1),
(707, 8, 'COS40003', 'Enrolled', 2),
(708, 8, 'TNE10006', 'Enrolled', 1),
(709, 8, 'BUS10015', 'Enrolled', 2),
(710, 9, 'COS10005', 'Enrolled', 1),
(711, 9, 'COS10025', 'Enrolled', 2),
(712, 9, 'COS10026', 'Enrolled', 2),
(713, 10, 'COS20007', 'Enrolled', 2),
(714, 10, 'COS20031', 'Enrolled', 1),
(715, 10, 'COS40003', 'Enrolled', 2),
(716, 11, 'TNE10006', 'Enrolled', 2),
(717, 11, 'BUS10015', 'Enrolled', 2),
(718, 11, 'COS10005', 'Enrolled', 2),
(719, 12, 'COS10025', 'Enrolled', 2),
(720, 12, 'COS10026', 'Enrolled', 1),
(721, 12, 'COS20007', 'Enrolled', 2),
(722, 13, 'COS20031', 'Enrolled', 2),
(723, 13, 'COS40003', 'Enrolled', 1),
(724, 13, 'TNE10006', 'Enrolled', 1),
(725, 14, 'BUS10015', 'Enrolled', 2),
(726, 14, 'COS10005', 'Enrolled', 2),
(727, 14, 'COS10025', 'Enrolled', 1),
(728, 15, 'COS10026', 'Enrolled', 2),
(729, 15, 'COS20007', 'Enrolled', 1),
(730, 15, 'COS20031', 'Enrolled', 2),
(731, 16, 'COS40003', 'Enrolled', 2),
(732, 16, 'TNE10006', 'Enrolled', 2),
(733, 16, 'BUS10015', 'Enrolled', 1),
(734, 17, 'COS10005', 'Enrolled', 2),
(735, 17, 'COS10025', 'Enrolled', 2),
(736, 17, 'COS10026', 'Enrolled', 2),
(737, 18, 'COS20007', 'Enrolled', 1),
(738, 18, 'COS20031', 'Enrolled', 1),
(739, 18, 'COS40003', 'Enrolled', 2),
(740, 19, 'TNE10006', 'Enrolled', 1),
(741, 19, 'BUS10015', 'Enrolled', 1),
(742, 19, 'COS10005', 'Enrolled', 1),
(743, 20, 'COS10025', 'Enrolled', 2),
(744, 20, 'COS10026', 'Enrolled', 2),
(745, 20, 'COS20007', 'Enrolled', 1),
(746, 21, 'COS20031', 'Enrolled', 2),
(747, 21, 'COS40003', 'Enrolled', 2),
(748, 21, 'TNE10006', 'Enrolled', 2),
(749, 22, 'BUS10015', 'Enrolled', 2),
(750, 22, 'COS10005', 'Enrolled', 1),
(751, 22, 'COS10025', 'Enrolled', 1),
(752, 23, 'COS10026', 'Enrolled', 1),
(753, 23, 'COS20007', 'Enrolled', 1),
(754, 23, 'COS20031', 'Enrolled', 1),
(755, 24, 'COS40003', 'Enrolled', 1),
(756, 24, 'TNE10006', 'Enrolled', 1),
(757, 24, 'BUS10015', 'Enrolled', 1),
(758, 25, 'COS10005', 'Enrolled', 1),
(759, 25, 'COS10025', 'Enrolled', 1),
(760, 25, 'COS10026', 'Enrolled', 2),
(761, 26, 'COS20007', 'Enrolled', 1),
(762, 26, 'COS20031', 'Enrolled', 2),
(763, 26, 'COS40003', 'Enrolled', 1),
(764, 27, 'TNE10006', 'Enrolled', 1),
(765, 27, 'BUS10015', 'Enrolled', 2),
(766, 27, 'COS10005', 'Enrolled', 1),
(767, 28, 'COS10025', 'Enrolled', 2),
(768, 28, 'COS10026', 'Enrolled', 2),
(769, 28, 'COS20007', 'Enrolled', 1),
(770, 29, 'COS20031', 'Enrolled', 1),
(771, 29, 'COS40003', 'Enrolled', 2),
(772, 29, 'TNE10006', 'Enrolled', 1),
(773, 30, 'BUS10015', 'Enrolled', 1),
(774, 30, 'COS10005', 'Enrolled', 1),
(775, 30, 'COS10025', 'Enrolled', 1),
(776, 31, 'COS10026', 'Enrolled', 2),
(777, 31, 'COS20007', 'Enrolled', 2),
(778, 31, 'COS20031', 'Enrolled', 1),
(779, 32, 'COS40003', 'Enrolled', 1),
(780, 32, 'TNE10006', 'Enrolled', 2),
(781, 32, 'BUS10015', 'Enrolled', 2),
(782, 33, 'COS10005', 'Enrolled', 1),
(783, 33, 'COS10025', 'Enrolled', 2),
(784, 33, 'COS10026', 'Enrolled', 2),
(785, 34, 'COS20007', 'Enrolled', 2),
(786, 34, 'COS20031', 'Enrolled', 1),
(787, 34, 'COS40003', 'Enrolled', 1),
(788, 35, 'TNE10006', 'Enrolled', 2),
(789, 35, 'BUS10015', 'Enrolled', 1),
(790, 35, 'COS10005', 'Enrolled', 1),
(791, 36, 'COS10025', 'Enrolled', 2),
(792, 36, 'COS10026', 'Enrolled', 2),
(793, 36, 'COS20007', 'Enrolled', 1),
(794, 37, 'COS20031', 'Enrolled', 1),
(795, 37, 'COS40003', 'Enrolled', 2),
(796, 37, 'TNE10006', 'Enrolled', 2),
(797, 38, 'BUS10015', 'Enrolled', 1),
(798, 38, 'COS10005', 'Enrolled', 2),
(799, 38, 'COS10025', 'Enrolled', 1),
(800, 39, 'COS10026', 'Enrolled', 1),
(801, 39, 'COS20007', 'Enrolled', 2),
(802, 39, 'COS20031', 'Enrolled', 1),
(803, 40, 'COS40003', 'Enrolled', 1),
(804, 40, 'TNE10006', 'Enrolled', 1),
(805, 40, 'BUS10015', 'Enrolled', 2),
(806, 41, 'COS10005', 'Enrolled', 1),
(807, 41, 'COS10025', 'Enrolled', 1),
(808, 41, 'COS10026', 'Enrolled', 2),
(809, 42, 'COS20007', 'Enrolled', 2),
(810, 42, 'COS20031', 'Enrolled', 1),
(811, 42, 'COS40003', 'Enrolled', 2),
(812, 43, 'TNE10006', 'Enrolled', 1),
(813, 43, 'BUS10015', 'Enrolled', 2),
(814, 43, 'COS10005', 'Enrolled', 1),
(815, 44, 'COS10025', 'Enrolled', 1),
(816, 44, 'COS10026', 'Enrolled', 2),
(817, 44, 'COS20007', 'Enrolled', 2),
(818, 45, 'COS20031', 'Enrolled', 2),
(819, 45, 'COS40003', 'Enrolled', 1),
(820, 45, 'TNE10006', 'Enrolled', 1),
(821, 46, 'BUS10015', 'Enrolled', 1),
(822, 46, 'COS10005', 'Enrolled', 2),
(823, 46, 'COS10025', 'Enrolled', 1),
(824, 47, 'COS10026', 'Enrolled', 1),
(825, 47, 'COS20007', 'Enrolled', 1),
(826, 47, 'COS20031', 'Enrolled', 1),
(827, 48, 'COS40003', 'Enrolled', 2),
(828, 48, 'TNE10006', 'Enrolled', 1),
(829, 48, 'BUS10015', 'Enrolled', 1),
(830, 49, 'COS10005', 'Enrolled', 2),
(831, 49, 'COS10025', 'Enrolled', 2),
(832, 49, 'COS10026', 'Enrolled', 1),
(833, 50, 'COS20007', 'Enrolled', 2),
(834, 50, 'COS20031', 'Enrolled', 1),
(835, 50, 'COS40003', 'Enrolled', 1),
(836, 51, 'TNE10006', 'Enrolled', 1),
(837, 51, 'BUS10015', 'Enrolled', 2),
(838, 51, 'COS10005', 'Enrolled', 2),
(839, 52, 'COS10025', 'Enrolled', 1),
(840, 52, 'COS10026', 'Enrolled', 2),
(841, 52, 'COS20007', 'Enrolled', 1),
(842, 53, 'COS20031', 'Enrolled', 2),
(843, 53, 'COS40003', 'Enrolled', 2),
(844, 53, 'TNE10006', 'Enrolled', 1),
(845, 54, 'BUS10015', 'Enrolled', 1),
(846, 54, 'COS10005', 'Enrolled', 1),
(847, 54, 'COS10025', 'Enrolled', 1),
(848, 55, 'COS10026', 'Enrolled', 2),
(849, 55, 'COS20007', 'Enrolled', 1),
(850, 55, 'COS20031', 'Enrolled', 2),
(851, 56, 'COS40003', 'Enrolled', 1),
(852, 56, 'TNE10006', 'Enrolled', 1),
(853, 56, 'BUS10015', 'Enrolled', 1),
(854, 57, 'COS10005', 'Enrolled', 2),
(855, 57, 'COS10025', 'Enrolled', 2),
(856, 57, 'COS10026', 'Enrolled', 1),
(857, 58, 'COS20007', 'Enrolled', 1),
(858, 58, 'COS20031', 'Enrolled', 2),
(859, 58, 'COS40003', 'Enrolled', 1),
(860, 59, 'TNE10006', 'Enrolled', 2),
(861, 59, 'BUS10015', 'Enrolled', 1),
(862, 59, 'COS10005', 'Enrolled', 1),
(863, 60, 'COS10025', 'Enrolled', 1),
(864, 60, 'COS10026', 'Enrolled', 2),
(865, 60, 'COS20007', 'Enrolled', 1),
(866, 61, 'COS20031', 'Enrolled', 2),
(867, 61, 'COS40003', 'Enrolled', 2),
(868, 61, 'TNE10006', 'Enrolled', 2),
(869, 62, 'BUS10015', 'Enrolled', 2),
(870, 62, 'COS10005', 'Enrolled', 1),
(871, 62, 'COS10025', 'Enrolled', 2),
(872, 63, 'COS10026', 'Enrolled', 1),
(873, 63, 'COS20007', 'Enrolled', 1),
(874, 63, 'COS20031', 'Enrolled', 1),
(875, 64, 'COS40003', 'Enrolled', 2),
(876, 64, 'TNE10006', 'Enrolled', 1),
(877, 64, 'BUS10015', 'Enrolled', 2),
(878, 65, 'COS10005', 'Enrolled', 1),
(879, 65, 'COS10025', 'Enrolled', 2),
(880, 65, 'COS10026', 'Enrolled', 2),
(881, 66, 'COS20007', 'Enrolled', 1),
(882, 66, 'COS20031', 'Enrolled', 1),
(883, 66, 'COS40003', 'Enrolled', 2),
(884, 67, 'TNE10006', 'Enrolled', 2),
(885, 67, 'BUS10015', 'Enrolled', 1),
(886, 67, 'COS10005', 'Enrolled', 2),
(887, 68, 'COS10025', 'Enrolled', 2),
(888, 68, 'COS10026', 'Enrolled', 1),
(889, 68, 'COS20007', 'Enrolled', 1),
(890, 69, 'COS20031', 'Enrolled', 1),
(891, 69, 'COS40003', 'Enrolled', 1),
(892, 69, 'TNE10006', 'Enrolled', 1),
(893, 70, 'BUS10015', 'Enrolled', 2),
(894, 70, 'COS10005', 'Enrolled', 1),
(895, 70, 'COS10025', 'Enrolled', 1),
(896, 71, 'COS10026', 'Enrolled', 2),
(897, 71, 'COS20007', 'Enrolled', 1),
(898, 71, 'COS20031', 'Enrolled', 2),
(899, 72, 'COS40003', 'Enrolled', 1),
(900, 72, 'TNE10006', 'Enrolled', 1),
(901, 72, 'BUS10015', 'Enrolled', 1),
(902, 73, 'COS10005', 'Enrolled', 2),
(903, 73, 'COS10025', 'Enrolled', 1),
(904, 73, 'COS10026', 'Enrolled', 1),
(905, 74, 'COS20007', 'Enrolled', 1),
(906, 74, 'COS20031', 'Enrolled', 1),
(907, 74, 'COS40003', 'Enrolled', 1),
(908, 75, 'TNE10006', 'Enrolled', 1),
(909, 75, 'BUS10015', 'Enrolled', 1),
(910, 75, 'COS10005', 'Enrolled', 1),
(911, 76, 'COS10025', 'Enrolled', 2),
(912, 76, 'COS10026', 'Enrolled', 2),
(913, 76, 'COS20007', 'Enrolled', 1),
(914, 77, 'COS20031', 'Enrolled', 1),
(915, 77, 'COS40003', 'Enrolled', 2),
(916, 77, 'TNE10006', 'Enrolled', 1),
(917, 78, 'BUS10015', 'Enrolled', 2),
(918, 78, 'COS10005', 'Enrolled', 1),
(919, 78, 'COS10025', 'Enrolled', 1),
(920, 79, 'COS10026', 'Enrolled', 1),
(921, 79, 'COS20007', 'Enrolled', 2),
(922, 79, 'COS20031', 'Enrolled', 1),
(923, 80, 'COS40003', 'Enrolled', 1),
(924, 80, 'TNE10006', 'Enrolled', 1),
(925, 80, 'BUS10015', 'Enrolled', 2),
(926, 81, 'COS10005', 'Enrolled', 2),
(927, 81, 'COS10025', 'Enrolled', 2),
(928, 81, 'COS10026', 'Enrolled', 1),
(929, 82, 'COS20007', 'Enrolled', 1),
(930, 82, 'COS20031', 'Enrolled', 1),
(931, 82, 'COS40003', 'Enrolled', 2),
(932, 83, 'TNE10006', 'Enrolled', 1),
(933, 83, 'BUS10015', 'Enrolled', 2),
(934, 83, 'COS10005', 'Enrolled', 2),
(935, 84, 'COS10025', 'Enrolled', 1),
(936, 84, 'COS10026', 'Enrolled', 2),
(937, 84, 'COS20007', 'Enrolled', 1),
(938, 85, 'COS20031', 'Enrolled', 1),
(939, 85, 'COS40003', 'Enrolled', 2),
(940, 85, 'TNE10006', 'Enrolled', 2),
(941, 86, 'BUS10015', 'Enrolled', 1),
(942, 86, 'COS10005', 'Enrolled', 2),
(943, 86, 'COS10025', 'Enrolled', 1),
(944, 87, 'COS10026', 'Enrolled', 1),
(945, 87, 'COS20007', 'Enrolled', 1),
(946, 87, 'COS20031', 'Enrolled', 1),
(947, 88, 'COS40003', 'Enrolled', 2),
(948, 88, 'TNE10006', 'Enrolled', 2),
(949, 88, 'BUS10015', 'Enrolled', 1),
(950, 89, 'COS10005', 'Enrolled', 1),
(951, 89, 'COS10025', 'Enrolled', 1),
(952, 89, 'COS10026', 'Enrolled', 1),
(953, 90, 'COS20007', 'Enrolled', 1),
(954, 90, 'COS20031', 'Enrolled', 2),
(955, 90, 'COS40003', 'Enrolled', 2),
(956, 91, 'TNE10006', 'Enrolled', 2),
(957, 91, 'BUS10015', 'Enrolled', 1),
(958, 91, 'COS10005', 'Enrolled', 2),
(959, 92, 'COS10025', 'Enrolled', 1),
(960, 92, 'COS10026', 'Enrolled', 1),
(961, 92, 'COS20007', 'Enrolled', 1),
(962, 93, 'COS20031', 'Enrolled', 2),
(963, 93, 'COS40003', 'Enrolled', 2),
(964, 93, 'TNE10006', 'Enrolled', 2),
(965, 94, 'BUS10015', 'Enrolled', 1),
(966, 94, 'COS10005', 'Enrolled', 1),
(967, 94, 'COS10025', 'Enrolled', 1),
(968, 95, 'COS10026', 'Enrolled', 1),
(969, 95, 'COS20007', 'Enrolled', 2),
(970, 95, 'COS20031', 'Enrolled', 1),
(971, 96, 'COS40003', 'Enrolled', 2),
(972, 96, 'TNE10006', 'Enrolled', 1),
(973, 96, 'BUS10015', 'Enrolled', 1),
(974, 97, 'COS10005', 'Enrolled', 2),
(975, 97, 'COS10025', 'Enrolled', 1),
(976, 97, 'COS10026', 'Enrolled', 2),
(977, 98, 'COS20007', 'Enrolled', 1),
(978, 98, 'COS20031', 'Enrolled', 2),
(979, 98, 'COS40003', 'Enrolled', 2),
(980, 99, 'TNE10006', 'Enrolled', 2),
(981, 99, 'BUS10015', 'Enrolled', 2),
(982, 99, 'COS10005', 'Enrolled', 1),
(983, 100, 'COS10025', 'Enrolled', 1),
(984, 100, 'COS10026', 'Enrolled', 1),
(985, 100, 'COS20007', 'Enrolled', 2);

-- --------------------------------------------------------

--
-- Table structure for table `a_unit_major`
--

CREATE TABLE `a_unit_major` (
  `id` int(11) NOT NULL,
  `m_code` varchar(45) DEFAULT NULL,
  `u_code` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `a_unit_major`
--

INSERT INTO `a_unit_major` (`id`, `m_code`, `u_code`, `type`) VALUES
(1, 'CS-DS', 'COS10004', 'Core'),
(2, 'CS-DS', 'COS10009', 'Core'),
(3, 'CS-DS', 'COS10025', 'Core'),
(4, 'CS-DS', 'COS10026', 'Core'),
(5, 'CS-DS', 'TNE10006', 'Core'),
(8, 'CS-DS', 'COS10022', 'Major'),
(10, 'CS-DS', 'COS20007', 'Core'),
(11, 'CS-DS', 'COS20031', 'Major'),
(13, 'CS-DS', 'COS20019', 'Major'),
(15, 'CS-DS', 'COS20028', 'Major'),
(16, 'CS-DS', 'COS30049', 'Major'),
(17, 'CS-DS', 'SWE30003', 'Major'),
(19, 'CS-DS', 'COS30045', 'Major'),
(20, 'CS-DS', 'COS40005', 'Core'),
(21, 'CS-DS', 'COS40006', 'Core'),
(22, 'CS-DS', 'SWE40006', 'Major'),
(23, 'CS-SD', 'COS10004', 'Core'),
(24, 'CS-SD', 'COS10009', 'Core'),
(25, 'CS-SD', 'COS10025', 'Core'),
(26, 'CS-SD', 'COS10026', 'Core'),
(27, 'CS-SD', 'TNE10006', 'Core'),
(30, 'CS-SD', 'COS20007', 'Core'),
(31, 'CS-SD', 'COS20031', 'Major'),
(33, 'CS-SD', 'COS20019', 'Major'),
(35, 'CS-SD', 'COS30049', 'Major'),
(36, 'CS-SD', 'SWE30003', 'Major'),
(37, 'CS-SD', 'COS30008', 'Major'),
(38, 'CS-SD', 'COS30043', 'Major'),
(39, 'CS-SD', 'SWE30009', 'Major'),
(40, 'CS-SD', 'COS40005', 'Core'),
(41, 'CS-SD', 'COS40006', 'Core'),
(42, 'CS-SD', 'COS40003', 'Major'),
(43, 'CS-CYBSEC', 'COS10004', 'Core'),
(44, 'CS-CYBSEC', 'COS10009', 'Core'),
(45, 'CS-CYBSEC', 'COS10025', 'Core'),
(46, 'CS-CYBSEC', 'COS10026', 'Core'),
(47, 'CS-CYBSEC', 'TNE10006', 'Core'),
(51, 'CS-CYBSEC', 'COS20007', 'Core'),
(52, 'CS-CYBSEC', 'COS20031', 'Major'),
(54, 'CS-CYBSEC', 'COS20019', 'Major'),
(56, 'CS-CYBSEC', 'TNE20002', 'Major'),
(57, 'CS-CYBSEC', 'COS20030', 'Major'),
(58, 'CS-CYBSEC', 'COS30049', 'Major'),
(59, 'CS-CYBSEC', 'SWE30003', 'Major'),
(61, 'CS-CYBSEC', 'COS30015', 'Major'),
(62, 'CS-CYBSEC', 'TNE30009', 'Major'),
(63, 'CS-CYBSEC', 'COS40005', 'Core'),
(64, 'CS-CYBSEC', 'COS40006', 'Core'),
(65, 'CS-IOT', 'COS10004', 'Core'),
(66, 'CS-IOT', 'COS10009', 'Core'),
(67, 'CS-IOT', 'COS10025', 'Core'),
(68, 'CS-IOT', 'COS10026', 'Core'),
(69, 'CS-IOT', 'TNE10006', 'Core'),
(71, 'CS-IOT', 'TNE10005', 'Major'),
(73, 'CS-IOT', 'COS20007', 'Core'),
(74, 'CS-IOT', 'COS20031', 'Major'),
(76, 'CS-IOT', 'COS20019', 'Major'),
(78, 'CS-IOT', 'COS30049', 'Major'),
(79, 'CS-IOT', 'SWE30003', 'Major'),
(81, 'CS-IOT', 'SWE30011', 'Major'),
(82, 'CS-IOT', 'COS30017', 'Major'),
(83, 'CS-IOT', 'COS30020', 'Major'),
(84, 'CS-IOT', 'COS40005', 'Core'),
(85, 'CS-IOT', 'COS40006', 'Core'),
(86, 'CS-AI', 'COS10004', 'Core'),
(87, 'CS-AI', 'COS10009', 'Core'),
(88, 'CS-AI', 'COS10025', 'Core'),
(89, 'CS-AI', 'COS10026', 'Core'),
(90, 'CS-AI', 'TNE10006', 'Core'),
(94, 'CS-AI', 'COS20007', 'Core'),
(95, 'CS-AI', 'COS20031', 'Major'),
(97, 'CS-AI', 'COS20019', 'Major'),
(99, 'CS-AI', 'COS30049', 'Major'),
(100, 'CS-AI', 'SWE30003', 'Major'),
(102, 'CS-AI', 'COS30018', 'Major'),
(103, 'CS-AI', 'COS30019', 'Major'),
(104, 'CS-AI', 'COS30082', 'Major'),
(105, 'CS-AI', 'COS40005', 'Core'),
(106, 'CS-AI', 'COS40006', 'Core'),
(107, 'CS-AI', 'COS40007', 'Major');

-- --------------------------------------------------------

--
-- Table structure for table `a_unit_semester`
--

CREATE TABLE `a_unit_semester` (
  `id` int(11) NOT NULL,
  `u_code` varchar(45) NOT NULL,
  `semester_month` enum('Jan','May','Sep') DEFAULT NULL,
  `semester_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `a_unit_semester`
--

INSERT INTO `a_unit_semester` (`id`, `u_code`, `semester_month`, `semester_year`) VALUES
(1, 'BUS10015', 'May', '2025'),
(2, 'COS10005', 'May', '2025'),
(3, 'COS10025', 'May', '2025'),
(4, 'COS10026', 'May', '2025'),
(5, 'COS20007', 'May', '2025'),
(6, 'COS20031', 'May', '2025'),
(7, 'COS40003', 'May', '2025'),
(8, 'ICT20016', 'May', '2025'),
(9, 'TNE10006', 'May', '2025'),
(10, 'COS10022', 'Sep', '2025'),
(11, 'COS10009', 'Sep', '2025'),
(12, 'COS20019', 'Sep', '2025'),
(13, 'TNE10005', 'Sep', '2025'),
(14, 'ICT20015', 'May', '2025'),
(15, 'STA10003', 'Sep', '2025'),
(16, 'SWE30003', 'Sep', '2025'),
(17, 'COS30008', 'Sep', '2025'),
(18, 'COS30049', 'Sep', '2025'),
(19, 'SWE40006', 'Sep', '2025'),
(20, 'COS20015', 'Sep', '2025'),
(21, 'COS40005', 'Sep', '2025'),
(22, 'COS30082', 'Sep', '2025'),
(23, 'COS10004', 'May', '2025'),
(24, 'COS10004', 'Sep', '2025'),
(25, 'COS10004', 'Jan', '2026'),
(26, 'COS20028', 'Jan', '2026'),
(27, 'COS20030', 'May', '2025'),
(28, 'COS20030', 'Jan', '2026'),
(29, 'COS30015', 'Jan', '2026'),
(30, 'COS30017', 'Jan', '2026'),
(31, 'COS30018', 'Jan', '2026'),
(32, 'COS30019', 'Jan', '2026'),
(33, 'COS30020', 'Sep', '2025'),
(34, 'COS30020', 'Jan', '2026'),
(35, 'COS30043', 'Jan', '2026'),
(36, 'COS30045', 'May', '2025'),
(37, 'COS30045', 'Sep', '2025'),
(38, 'COS40006', 'Sep', '2025'),
(39, 'COS40006', 'Jan', '2026'),
(40, 'COS40007', 'May', '2025'),
(41, 'COS40007', 'Jan', '2026'),
(42, 'SWE30009', 'Jan', '2026'),
(43, 'SWE30011', 'May', '2025'),
(44, 'SWE30011', 'Jan', '2026'),
(45, 'TNE20002', 'Jan', '2026'),
(46, 'TNE30009', 'Jan', '2026');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Cy0XgI37PwALBMX1JMKB3mvQXWip4jkfFt18H31D', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjNpa1hSQ09TYVN6eVNOb0NtRUVtRU5KajdHdEJDRDNFY3kxd3diSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQvc25hcHNob3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1752927458);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `a_student_cohort_view`
--
DROP TABLE IF EXISTS `a_student_cohort_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`binh`@`localhost` SQL SECURITY DEFINER VIEW `a_student_cohort_view`  AS SELECT `cu`.`U_CODE` AS `U_CODE`, `cu`.`U_NAME` AS `U_NAME`, `sm`.`semester_month` AS `semester_month`, `sm`.`semester_year` AS `semester_year`, `sm`.`m_code` AS `m_code`, count(distinct `sm`.`student_id`) AS `not_enrolled_or_failed_students` FROM ((`a_course_unit` `cu` join `a_student_major` `sm` on(1 = 1)) left join `a_student_unit_status` `sus` on(`sm`.`student_id` = `sus`.`student_id` and `cu`.`U_CODE` = `sus`.`unit_id`)) WHERE `sus`.`status` is null OR `sus`.`status` = 'Failed' GROUP BY `sm`.`semester_month`, `sm`.`semester_year`, `sm`.`m_code`, `cu`.`U_CODE`, `cu`.`U_NAME` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a_course`
--
ALTER TABLE `a_course`
  ADD PRIMARY KEY (`C_CODE`),
  ADD UNIQUE KEY `C_CODE` (`C_CODE`),
  ADD UNIQUE KEY `C_NAME` (`C_NAME`);

--
-- Indexes for table `a_course_unit`
--
ALTER TABLE `a_course_unit`
  ADD PRIMARY KEY (`U_CODE`),
  ADD UNIQUE KEY `u_name_UNIQUE` (`U_NAME`),
  ADD UNIQUE KEY `u_code_UNIQUE` (`U_CODE`);

--
-- Indexes for table `a_major`
--
ALTER TABLE `a_major`
  ADD PRIMARY KEY (`M_CODE`),
  ADD UNIQUE KEY `M_CODE` (`M_CODE`),
  ADD UNIQUE KEY `M_NAME` (`M_NAME`),
  ADD KEY `key_course` (`COURSE`);

--
-- Indexes for table `a_student_credit_history`
--
ALTER TABLE `a_student_credit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `a_student_enroll`
--
ALTER TABLE `a_student_enroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_a_student_enroll_1` (`u_code`),
  ADD KEY `fk_a_student_enroll_2` (`student_id`);

--
-- Indexes for table `a_student_major`
--
ALTER TABLE `a_student_major`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `m_code` (`m_code`);

--
-- Indexes for table `a_student_planner`
--
ALTER TABLE `a_student_planner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_student_unit_status`
--
ALTER TABLE `a_student_unit_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student` (`student_id`),
  ADD KEY `fk_unit` (`unit_id`);

--
-- Indexes for table `a_unit_major`
--
ALTER TABLE `a_unit_major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_code` (`m_code`),
  ADD KEY `a_unit_major_ibfk_2` (`u_code`);

--
-- Indexes for table `a_unit_semester`
--
ALTER TABLE `a_unit_semester`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_a_unit_semester_1` (`u_code`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a_student_credit_history`
--
ALTER TABLE `a_student_credit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `a_student_enroll`
--
ALTER TABLE `a_student_enroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `a_student_major`
--
ALTER TABLE `a_student_major`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `a_student_planner`
--
ALTER TABLE `a_student_planner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `a_student_unit_status`
--
ALTER TABLE `a_student_unit_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=986;

--
-- AUTO_INCREMENT for table `a_unit_major`
--
ALTER TABLE `a_unit_major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `a_unit_semester`
--
ALTER TABLE `a_unit_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `a_major`
--
ALTER TABLE `a_major`
  ADD CONSTRAINT `key_course` FOREIGN KEY (`COURSE`) REFERENCES `a_course` (`C_CODE`) ON DELETE CASCADE;

--
-- Constraints for table `a_student_credit_history`
--
ALTER TABLE `a_student_credit_history`
  ADD CONSTRAINT `a_student_credit_history_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `a_student_planner` (`id`);

--
-- Constraints for table `a_student_enroll`
--
ALTER TABLE `a_student_enroll`
  ADD CONSTRAINT `fk_a_student_enroll_1` FOREIGN KEY (`u_code`) REFERENCES `a_course_unit` (`U_CODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_a_student_enroll_2` FOREIGN KEY (`student_id`) REFERENCES `a_student_major` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `a_student_unit_status`
--
ALTER TABLE `a_student_unit_status`
  ADD CONSTRAINT `fk_student` FOREIGN KEY (`student_id`) REFERENCES `a_student_major` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_unit` FOREIGN KEY (`unit_id`) REFERENCES `a_course_unit` (`U_CODE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `a_unit_major`
--
ALTER TABLE `a_unit_major`
  ADD CONSTRAINT `a_unit_major_ibfk_1` FOREIGN KEY (`m_code`) REFERENCES `a_major` (`M_CODE`) ON DELETE CASCADE,
  ADD CONSTRAINT `a_unit_major_ibfk_2` FOREIGN KEY (`u_code`) REFERENCES `a_course_unit` (`U_CODE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `a_unit_semester`
--
ALTER TABLE `a_unit_semester`
  ADD CONSTRAINT `fk_a_unit_semester_1` FOREIGN KEY (`u_code`) REFERENCES `a_course_unit` (`U_CODE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
