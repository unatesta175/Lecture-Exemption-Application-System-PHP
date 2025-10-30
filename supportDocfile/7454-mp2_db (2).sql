-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2023 at 10:03 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mp2_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `application_id` int(100) NOT NULL,
  `student_id` varchar(70) NOT NULL,
  `faculty` varchar(70) NOT NULL,
  `program_code` varchar(70) NOT NULL,
  `reason_exemption` varchar(70) NOT NULL,
  `noDay` int(70) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `datetime_application` datetime NOT NULL,
  `application_stat` varchar(70) NOT NULL DEFAULT 'aktif',
  `date_authorized` datetime NOT NULL,
  `authorizer` varchar(70) NOT NULL,
  `authorization_status` varchar(70) NOT NULL DEFAULT 'pending',
  `date_supported` datetime NOT NULL,
  `supporter` varchar(70) NOT NULL,
  `support_status` varchar(70) NOT NULL DEFAULT 'pending',
  `date_approved` datetime NOT NULL,
  `approver` varchar(70) NOT NULL,
  `approval_status` varchar(70) NOT NULL DEFAULT 'pending',
  `supportDoc` varchar(70) NOT NULL,
  `total_class` varchar(1000) NOT NULL DEFAULT 'Tiada',
  `total_authorizer_signed` varchar(70) NOT NULL DEFAULT '0',
  `total_authorizer_needed` varchar(70) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_id`, `student_id`, `faculty`, `program_code`, `reason_exemption`, `noDay`, `startDate`, `endDate`, `datetime_application`, `application_stat`, `date_authorized`, `authorizer`, `authorization_status`, `date_supported`, `supporter`, `support_status`, `date_approved`, `approver`, `approval_status`, `supportDoc`, `total_class`, `total_authorizer_signed`, `total_authorizer_needed`) VALUES
(10, '5', 'CDCS', 'CDCS110', 'Konvokesyen', 1, '2023-05-09', '2023-05-10', '2023-05-09 16:50:08', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'ORGANIZING THE PREPARATION OUTLINE (3).pdf', '\n(1)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ILYAS] - \n(2)[Kod Kursus : ITT320\n Kumpulan : CSC2485B\n Pensyarah : MUSTAIN] - \n(3)[Kod Kursus : ITT320\n Kumpulan : RTT3205A\n Pensyarah : HAZIQ] - ', '0', '0'),
(13, '5', 'CDCS', 'CDCS110', 'Muet', 12, '2023-05-13', '2023-05-01', '2023-05-09 19:16:12', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '', '\n(1)[Kod Kursus : ITT320\n Kumpulan : CSC2485B\n Pensyarah : MUSTAIN] - ', '0', '0'),
(16, '6', 'APB', 'CDIM110', 'Konvokesyen', 14, '2023-05-03', '2023-05-17', '2023-05-09 21:11:52', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '', '\n(1)[Kod Kursus : \n Kumpulan : \n Pensyarah : ] - ', '0', '0'),
(18, '6', 'APB', 'CDIM110', 'Muet', 1, '2023-05-10', '2023-05-11', '2023-05-09 21:12:32', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '', 'Tiada', '0', '0'),
(25, '2', '', 'CS110', 'Konvokesyen', 5, '2023-04-30', '2023-05-05', '2023-05-10 12:50:06', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (38).png', 'Tiada', '0', '0'),
(26, '14', '', 'CS110', 'Konvokesyen', 2, '2023-05-05', '2023-05-03', '2023-05-10 14:20:59', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (36).png', '', '0', '0'),
(27, '14', '', 'CS110', 'Konvokesyen', 2, '2023-05-02', '2023-05-04', '2023-05-10 14:21:17', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (35).png', 'Tiada', '0', '0'),
(28, '14', '', 'CS110', 'Konvokesyen', 2, '2023-05-02', '2023-05-04', '2023-05-10 14:21:35', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (36).png', 'Tiada', '0', '0'),
(29, '14', '', 'CS110', 'Muet', 0, '2023-05-05', '2023-05-05', '2023-05-10 14:22:19', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (35).png', 'Tiada', '0', '0'),
(30, '14', '', 'CS110', 'Muet', 0, '2023-05-03', '2023-05-03', '2023-05-10 14:22:35', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (38).png', 'Tiada', '0', '0'),
(31, '14', '', 'CS110', 'Konvokesyen', 1, '2023-05-04', '2023-05-05', '2023-05-10 14:22:54', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (43).png', 'Tiada', '0', '0'),
(32, '14', '', 'CS110', 'Konvokesyen', 10, '2023-05-01', '2023-05-11', '2023-05-10 15:01:20', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (38).png', 'Tiada', '0', '0'),
(33, '14', '', 'CS110', 'Muet', 16, '2023-04-30', '2023-05-16', '2023-05-10 15:01:41', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (38).png', 'Tiada', '0', '0'),
(34, '14', '', 'CS110', 'Muet', 14, '2023-05-06', '2023-05-20', '2023-05-10 15:01:54', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (44).png', 'Tiada', '0', '0'),
(37, '14', '', 'CS110', 'Muet', 2, '2023-05-08', '2023-05-06', '2023-05-10 15:50:24', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot_20230123-214057_Instagram.jpg', 'Tiada', '0', '0'),
(38, '5', 'CDCS', 'CDCS110', 'Muet', 5, '2023-05-01', '2023-05-06', '2023-05-11 11:00:47', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot_20230123-214057_Instagram.jpg', 'Tiada', '0', '0'),
(39, '5', 'CDCS', 'CDCS110', 'Haji', 3, '2023-05-06', '2023-05-09', '2023-05-11 11:01:32', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot_20230123-214057_Instagram.jpg', 'Tiada', '0', '0'),
(40, '7', 'FAKULTI PERAKAUNAN', 'ACC110', 'Konvokesyen', 7, '2023-05-01', '2023-05-08', '2023-05-11 11:48:56', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot_20230123-214057_Instagram.jpg', '\n(1)[Kod Kursus : WOI\n Kumpulan : KEPALA DIA\n Pensyarah : ZAIM] - ', '0', '0'),
(41, '12', 'KOLEJ PENGAJIAN PENGKOMPUTERAN, INFORMATIK DAN MEDIA', 'CDCS110', 'Muet', 1, '2023-05-14', '2023-05-15', '2023-05-14 14:04:24', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (3).xlsx', '\n(1)[Kod Kursus : CS265\n Kumpulan : RTT3205A\n Pensyarah : SIR MEME] - ', '0', '0'),
(42, '5', 'CDCS', 'CDCS110', 'Konvokesyen', 17, '2023-05-02', '2023-05-19', '2023-05-16 15:45:35', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (2).xlsx', 'Tiada', '0', '0'),
(43, '5', 'CDCS', 'CDCS110', 'Muet', 8, '2023-05-19', '2023-05-11', '2023-05-16 15:47:39', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'ORGANIZING THE PREPARATION OUTLINE (2).pdf', '\n(1)[Kod Kursus : CSC456\n Kumpulan : ITT3205A\n Pensyarah : ZAIM] - \n(2)[Kod Kursus : CS265\n Kumpulan : CSC2485B\n Pensyarah : HAZIQ] - \n(3)[Kod Kursus : WOI\n Kumpulan : ANIS\n Pensyarah : MUSTAIN] - ', '0', '0'),
(44, '5', 'CDCS', 'CDCS110', 'Muet', 21, '2023-05-26', '2023-05-05', '2023-05-16 16:14:14', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'ORGANIZING THE PREPARATION OUTLINE (3).pdf', 'Tiada', '0', '0'),
(45, '5', 'CDCS', 'CDCS110', 'fsewa', 14, '2023-05-19', '2023-05-05', '2023-05-16 16:18:52', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (2).xlsx', 'Tiada', '0', '0'),
(46, '5', 'CDCS', 'CDCS110', 'Konvokesyen', 25, '2023-05-26', '2023-05-01', '2023-05-16 16:19:55', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (1).xlsx', 'Tiada', '0', '0'),
(47, '5', 'CDCS', 'CDCS110', 'Muet', 8, '2023-05-04', '2023-05-12', '2023-05-16 16:42:54', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (2).xlsx', '(1)[Kod Kursus : CSC456\r\n Kumpulan : WEHHH\r\n Pensyarah : tibe]\r\n\r\n(2)[Kod Kursus : WOI\r\n Kumpulan : RTT3205A\r\n Pensyarah : ACHONG]\r\n\r\n(3)[Kod Kursus : WOI\r\n Kumpulan : RTT3205A\r\n Pensyarah : ACHONG]\r\n\r\n(4)[Kod Kursus : CSC456\r\n Kumpulan : RTT3205A\r\n Pensyarah : ACHONG]\r\n', '2', '4'),
(48, '5', 'CDCS', 'CDCS110', 'Konvokesyen', 10, '2023-05-06', '2023-05-16', '2023-05-16 16:43:58', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (3).xlsx', 'Tiada', '0', '0'),
(49, '5', 'CDCS', 'CDCS110', 'dwa', 16, '2023-05-10', '2023-05-26', '2023-05-16 16:44:28', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'ORGANIZING THE PREPARATION OUTLINE (3).pdf', 'Tiada', '0', '0'),
(50, '17', 'FAKULTI PENGURUSAN DAN PERNIAGAAN', 'BA242', 'event kelab', 1, '2023-05-17', '2023-05-18', '2023-05-16 19:21:43', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (3).xlsx', '(1)[Kod Kursus : ITT320\r\n Kumpulan : ITT3205A\r\n Pensyarah : ILYAS]\r\n\r\n(2)[Kod Kursus : CSC456\r\n Kumpulan : CSC2485B\r\n Pensyarah : ILYAS]\r\n\r\n(3)[Kod Kursus : ITT320\r\n Kumpulan : ITT3205A\r\n Pensyarah : muhammad ilyas amran bin]\r\n', '0', '3'),
(51, '3', 'Fakulti Perakaunan', 'BA252', 'Muet', 7, '2023-05-05', '2023-05-12', '2023-05-16 23:32:54', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'ORGANIZING THE PREPARATION OUTLINE (3).pdf', '\n(1)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : cikgu achings] - ', '0', '0'),
(52, '3', 'Fakulti Perakaunan', 'BA252', 'Konvokesyen', 15, '2023-05-11', '2023-05-26', '2023-05-17 00:06:27', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (1).xlsx', 'Tiada', '0', '0'),
(53, '3', 'Fakulti Perakaunan', 'BA252', 'Konvokesyen', 15, '2023-05-11', '2023-05-26', '2023-05-17 00:09:09', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (1).xlsx', 'Tiada', '0', '0'),
(54, '17', 'FAKULTI PENGURUSAN DAN PERNIAGAAN', 'BA242', 'Konvokesyen', 10, '2023-04-30', '2023-05-10', '2023-05-17 00:16:57', 'aktif', '0000-00-00 00:00:00', '', 'Selesai', '2023-05-22 21:49:27', 'kpp2', 'Disokong', '2023-05-23 09:45:12', 'trhea1', 'Tidak DiLuluskan', 'studentcar-data (2).xlsx', '(1)[Kod Kursus : CSC456\r\n Kumpulan : RTT3205A\r\n Pensyarah : ACHONG]\r\n\r\n(2)[Kod Kursus : CS265\r\n Kumpulan : KEPALA DIA\r\n Pensyarah : ACHONG]\r\n\r\n(3)[Kod Kursus : ITT320\r\n Kumpulan : ANIS\r\n Pensyarah : ACHONG]\r\n\r\n(4)[Kod Kursus : CS265\r\n Kumpulan : ANIS\r\n Pensyarah : tibe]\r\n', '4', '4'),
(55, '18', 'Fakulti Perakaunan', 'IC220', 'Konvokesyen', 22, '2023-05-26', '2023-05-04', '2023-05-17 04:42:15', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'ORGANIZING THE PREPARATION OUTLINE (3).pdf', '\n(1)[Kod Kursus : ITT320\n Kumpulan : WEHHH\n Pensyarah : Muhammad Ilyas Bin Amran]\n', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(100) NOT NULL,
  `application_id` int(100) NOT NULL,
  `student_name` varchar(70) NOT NULL,
  `class_date` date NOT NULL,
  `class_day` varchar(70) NOT NULL,
  `class_time` time NOT NULL,
  `course_code` varchar(70) NOT NULL,
  `group` varchar(70) NOT NULL,
  `lecturer_name` varchar(70) NOT NULL,
  `lecturer_id` int(100) NOT NULL,
  `authorization_status` varchar(70) NOT NULL DEFAULT 'pending',
  `signed_status` varchar(70) NOT NULL DEFAULT 'belum',
  `date_authorized` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `application_id`, `student_name`, `class_date`, `class_day`, `class_time`, `course_code`, `group`, `lecturer_name`, `lecturer_id`, `authorization_status`, `signed_status`, `date_authorized`) VALUES
(1, 1, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-11', 'AHAD', '15:00:00', 'ITT320', 'ITT3205A', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(2, 1, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-11', 'AHAD', '15:00:00', 'ITT320', 'ITT3205A', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(3, 1, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-01', 'selasa', '03:33:00', 'CSC456', 'RTT3205A', 'MUSTAIN', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(4, 1, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-11', 'RABU', '20:07:00', 'CSC248', 'CSC2485B', 'HAZIQ', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(5, 2, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-10', 'KHAMIS', '07:17:00', 'CSC456', 'RTT3205A', 'ILYAS', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(6, 6, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-04', 'RABU', '16:45:00', 'CS265', 'CSC2485B', 'HAZIQ', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(7, 9, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-13', 'KHAMIS', '06:50:00', 'CSC248', 'CSC2485B', 'ILYAS', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(8, 10, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-10', 'RABU', '16:55:00', 'ITT320', 'ITT3205A', 'ILYAS', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(9, 12, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-11', 'AHAD', '16:56:00', 'ITT320', 'ITT3205A', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(10, 11, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-04', 'RABU', '18:58:00', 'CS265', 'CSC2485B', 'HAZIQ', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(11, 11, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-05', 'SELASA', '21:01:00', 'ITT320', 'RTT3205A', 'MUSTAIN', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(12, 10, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-10', 'RABU', '09:12:00', 'ITT320', 'CSC2485B', 'MUSTAIN', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(13, 10, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-11', 'RABU', '19:17:00', 'ITT320', 'RTT3205A', 'HAZIQ', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(14, 13, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-03', 'AHAD', '09:16:00', 'ITT320', 'CSC2485B', 'MUSTAIN', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(15, 1, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-10', 'RABU', '19:23:00', 'ITT320', 'CSC2485B', 'MUSTAIN', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(16, 14, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-08', 'AHAD', '21:23:00', 'CSC456', 'ITT3205A', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(17, 14, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-17', 'AHAD', '20:22:00', 'ITT320', 'ITT3205A', 'ILYAS', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(18, 0, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-09', 'AHAD', '19:57:00', 'CSC456', 'CSC2485B', 'ZAIM', 0, 'pending', 'belum', '2023-05-17 20:45:36'),
(19, 0, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-03', 'AHAD', '23:09:00', 'ITT320', 'ITT3205A', 'HAZIQ', 0, 'pending', 'belum', '2023-05-17 20:45:36'),
(20, 16, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '0000-00-00', '', '00:00:00', '', '', '', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(37, 40, 'GRANGER', '2023-05-04', 'DAWD', '16:26:00', 'WOI', 'KEPALA DIA', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(38, 41, 'MUHAMMAD ZAIM IRFAN BIN MOHD ZAMRI', '2023-05-15', 'RABU', '14:10:00', 'CS265', 'RTT3205A', 'SIR MEME', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(39, 43, 'MUHAMMAD ZAIM BRUH', '2023-05-06', 'AHAD', '15:55:00', 'CSC456', 'ITT3205A', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(40, 43, 'MUHAMMAD ZAIM BRUH', '2023-05-04', 'RABU', '15:53:00', 'CS265', 'CSC2485B', 'HAZIQ', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(43, 43, 'MUHAMMAD ZAIM BRUH', '2023-05-03', 'AHAD', '16:14:00', 'WOI', 'ANIS', 'MUSTAIN', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(45, 50, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-05-18', 'KHAMIS', '07:30:00', 'ITT320', 'ITT3205A', 'ILYAS', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(46, 50, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-05-18', 'RABU', '09:30:00', 'CSC456', 'CSC2485B', 'ILYAS', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(47, 51, 'tibe', '2023-05-04', 'Selasa', '01:03:00', 'ITT320', 'ITT3205A', 'cikgu achings', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(48, 54, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-05-01', 'Ahad', '14:20:00', 'CSC456', 'RTT3205A', 'ACHONG', 0, 'Tidak Dibenarkan', 'belum', '2023-05-23 08:57:50'),
(49, 54, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-05-26', 'Isnin', '13:52:00', 'CS265', 'KEPALA DIA', 'ACHONG', 0, 'Dibenarkan', 'belum', '2023-05-23 08:56:26'),
(50, 54, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-05-02', 'Isnin', '16:32:00', 'ITT320', 'ANIS', 'ACHONG', 0, 'Dibenarkan', 'belum', '2023-05-23 08:57:05'),
(51, 50, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-05-12', 'Rabu', '16:40:00', 'ITT320', 'ITT3205A', 'muhammad ilyas amran bin', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(53, 55, 'bruh', '2023-05-11', 'Rabu', '05:47:00', 'ITT320', 'WEHHH', 'Muhammad Ilyas Bin Amran', 0, 'pending', 'belum', '0000-00-00 00:00:00'),
(54, 54, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-05-02', 'Isnin', '05:11:00', 'CS265', 'ANIS', 'tibe', 0, 'Tidak Dibenarkan', 'belum', '2023-05-23 08:53:47'),
(55, 47, 'MUHAMMAD ZAIM BRUH', '2023-05-29', 'Selasa', '19:58:00', 'CSC456', 'WEHHH', 'tibe', 0, 'Dibenarkan', 'belum', '2023-05-22 19:36:42'),
(56, 47, 'MUHAMMAD ZAIM BRUH', '2023-05-01', 'Isnin', '19:59:00', 'WOI', 'RTT3205A', 'ACHONG', 0, 'Tidak Dibenarkan', 'belum', '2023-05-23 09:03:03'),
(57, 47, 'MUHAMMAD ZAIM BRUH', '2023-05-01', 'Isnin', '19:59:00', 'WOI', 'RTT3205A', 'ACHONG', 0, 'pending', 'belum', '2023-05-17 21:03:19'),
(58, 47, 'MUHAMMAD ZAIM BRUH', '2023-05-10', 'Isnin', '20:03:00', 'CSC456', 'RTT3205A', 'ACHONG', 0, 'pending', 'belum', '2023-05-17 20:55:59');

-- --------------------------------------------------------

--
-- Table structure for table `clerks`
--

CREATE TABLE `clerks` (
  `clerk_id` int(100) NOT NULL,
  `clerk_name` varchar(70) NOT NULL,
  `staff_no` int(70) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(70) NOT NULL,
  `work_phone_no` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clerks`
--

INSERT INTO `clerks` (`clerk_id`, `clerk_name`, `staff_no`, `email`, `password`, `work_phone_no`) VALUES
(1, 'a1', 12321421, 'a1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131');

-- --------------------------------------------------------

--
-- Table structure for table `kpps`
--

CREATE TABLE `kpps` (
  `kpp_id` int(100) NOT NULL,
  `name` varchar(70) NOT NULL,
  `staff_no` int(70) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(70) NOT NULL,
  `work_phone_no` varchar(70) NOT NULL,
  `faculty` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kpps`
--

INSERT INTO `kpps` (`kpp_id`, `name`, `staff_no`, `email`, `password`, `work_phone_no`, `faculty`) VALUES
(1, 'kpp1', 2147483647, 'k1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 'Akademi Pengajian Islam Kontemporari'),
(2, 'kpp2', 2147483647, 'k2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 'Fakulti Pengurusan Dan Perniagaan'),
(3, 'kpp3', 2135432, 'k3@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '1113291328912', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media'),
(4, 'kpp4', 2131213, 'kp4@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '11342432', 'Fakulti Perakaunan'),
(5, 'kpp5', 2131213, 'k5@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 'Akademi Pengajian Bahasa'),
(6, 'kpp5', 2131213, 'k6@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '231321', 'Fakulti Perakaunan');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `lecturer_id` int(100) NOT NULL,
  `lecturer_name` varchar(70) NOT NULL,
  `staff_no` int(100) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(70) NOT NULL,
  `work_phone_no` varchar(70) NOT NULL,
  `faculty` varchar(70) NOT NULL,
  `program_code` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`lecturer_id`, `lecturer_name`, `staff_no`, `email`, `password`, `work_phone_no`, `faculty`, `program_code`) VALUES
(2, 'ACHONG', 2131213, 'l1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 'AKADEMI PENGAJIAN ISLAM KONTEMPORARI', 'BA114'),
(3, 'tibe', 2131213, 'l2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 'Fakulti Perakaunan', 'BA252');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `program_id` int(100) NOT NULL,
  `clerk_name` varchar(70) NOT NULL,
  `program_code` varchar(70) NOT NULL,
  `program_name` varchar(70) NOT NULL,
  `faculty_code` varchar(70) NOT NULL,
  `faculty_name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`program_id`, `clerk_name`, `program_code`, `program_name`, `faculty_code`, `faculty_name`) VALUES
(1, 'KU HARTINI BINTI ABDULLAH', 'ACC110', 'Diploma Perakaunan', 'FAC', 'Fakulti Perakaunan'),
(2, 'KU HARTINI BINTI ABDULLAH', 'ACC220', 'Sarjana Muda Perakaunan (Kepujian)', 'FAC', 'Fakulti Perakaunan'),
(3, 'ZETTY NATAMULIA BINTI ELIAS', 'BA111', 'Diploma Pengajian Perniagaan', 'FPP', 'Fakulti Pengurusan Dan Perniagaan'),
(4, 'ZETTY NATAMULIA BINTI ELIAS', 'BA114', 'Diploma Analisis Pelaburan', 'FPP', 'Fakulti Pengurusan Dan Perniagaan'),
(5, 'ZETTY NATAMULIA BINTI ELIAS', 'BA119', 'Diploma Pengajian Perbankan', 'FPP', 'Fakulti Pengurusan Dan Perniagaan'),
(6, 'ZAHARUDIN BIN OTHMAN', 'BA240', 'Sarjana Muda Pentadbiran Perniagaan (Kepujian) Pemasaran', 'FPP', 'Fakulti Pengurusan Dan Perniagaan'),
(7, 'ZAHARUDIN BIN OTHMAN', 'BA242', 'Sarjana Muda Pentadbiran Perniagaan (Kepujiaan) Kewangan', 'FPP', 'Fakulti Pengurusan Dan Perniagaan'),
(8, 'ZAHARUDIN BIN OTHMAN', 'BA249', 'Sarjana Muda Pentadbiran Perniagaan (Kepujian) Perbankan Islam', 'FPP', 'Fakulti Pengurusan Dan Perniagaan'),
(9, 'ZAHARUDIN BIN OTHMAN', 'BA251', 'Sarjana Muda Pentadbiran Perniagaan (Kepujian) Pengurusan Pelaburan', 'FPP', 'Fakulti Pengurusan Dan Perniagaan'),
(10, 'HUZAINI BIN YASEP', 'BA252', 'Sarjana Muda Pemasaran Digital (Kepujian)', 'FPP', 'Fakulti Pengurusan Dan Perniagaan'),
(11, 'ROSMAWATI BINTI SAID', 'CDCS110', 'Diploma Sains Komputer', 'KPPIM', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media'),
(12, 'ROSMAWATI BINTI SAID', 'CDCS143', 'Diploma Sains Matematik', 'KPPIM', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media'),
(13, 'ROSMAWATI BINTI SAID', 'CDIM110', 'Diploma Pengurusan Maklumat', 'KPPIM', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media'),
(14, 'ROSMAWATI BINTI SAID', 'CD1M261', 'Sarjana Muda Sains Maklumat (Kepujian) Pengurusan Rekod ', 'KPPIM', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media'),
(15, 'KU HARTINI BINTI ABDULLAH', 'LG120', 'Diploma Bahasa Inggeris Komunikasi Profesional', 'APB', 'Akademi Pengajian Bahasa'),
(16, 'HUZAINI BIN YASEP', 'IC220', 'Sarjana Muda Pengurusan Industri Halal (Kepujian)', 'ACIS', 'Akademi Pengajian Islam Kontemporari');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(100) NOT NULL,
  `name` varchar(70) NOT NULL,
  `ic` varchar(70) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(70) NOT NULL,
  `student_no` int(70) NOT NULL,
  `program_code` varchar(70) NOT NULL,
  `faculty` varchar(70) NOT NULL,
  `semester` int(70) NOT NULL,
  `phone_no` varchar(70) NOT NULL,
  `home_phone_no` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `ic`, `email`, `password`, `student_no`, `program_code`, `faculty`, `semester`, `phone_no`, `home_phone_no`) VALUES
(1, 'MUHAMMAD ILYAS BIN AMRAN', '020830101563', 'muhammadilyasamran@gmail.com', '011c945f30ce2cbafc452f39840f025693339c42', 2020894394, 'CS110', '', 6, '01111047614', '01111047611'),
(2, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '020830101561', 'ilyas@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894393, 'CS110', '', 6, '011110476111', '01111047123'),
(3, 'WADADAD', '0208301015', 'mina@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 'ACC220', 'APB', 3, '0111104761411', '01111047614112'),
(4, 'ILYASADMIN', '02083010156312', 'minaA@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 'CS110', '', 2, '0111104761421', '0111104761456'),
(5, 'MUHAMMAD ZAIM BRUH', '020830101561', 'ilyasss@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'CDCS110', 'CDCS', 3, '01111047614', '011110476142'),
(6, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '02083010156312', 'ilyass@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 'CDIM110', 'APB', 5, '01111047614', '01111047613'),
(7, 'GRANGER', '02083010156312', 'kiritokirito175@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'ACC110', 'FAKULTI PERAKAUNAN', 6, '01111047614', '01111047611'),
(10, '', '021118110049', 'zaimi4009@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020452222, 'CDCS110', 'KOLEJ PENGAJIAN PENGKOMPUTERAN, INFORMATIK DAN MEDIA', 6, '01118984887', '01118984887'),
(11, 'MUHAMMAD ILYAS BIN AMRAN', '231321', 'ilyasssss@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 'BA252', 'FAKULTI PERAKAUNAN', 1, '0111104761421', '01111047123'),
(12, 'MUHAMMAD ZAIM IRFAN BIN MOHD ZAMRI', '021118110049', 'zaimi3009@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020452222, 'CDCS110', 'KOLEJ PENGAJIAN PENGKOMPUTERAN, INFORMATIK DAN MEDIA', 6, '01118984887', '01118984887'),
(13, 'ANIS', '02083010156312', 'aniss@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'CDCS110', 'KOLEJ PENGAJIAN PENGKOMPUTERAN, INFORMATIK DAN MEDIA', 4, '01111047614', '0111104761456'),
(14, 'MUSTAINIAH BINTI ABDUL HIDAYAHUH', '02083010156312', 'ilyabjs@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'CDCS143', 'AKADEMI PENGAJIAN BAHASA', 4, '0111104761421', '01111047123'),
(15, 'AWDDAWD', '02083010156312', 'ilyaa@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'CD1M261', 'FAKULTI PENGURUSAN DAN PERNIAGAAN', 3, '01111047614', '0111104761456'),
(16, 'ILYASADMINSADW', '021118110049', 'ilyaq@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 'CD1M261', 'AKADEMI PENGAJIAN BAHASA', 3, '01111047614', '01111047123'),
(17, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '010512010800', 'niesurayaa@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2022793633, 'BA242', 'FAKULTI PENGURUSAN DAN PERNIAGAAN', 4, '01159577361', ''),
(18, 'bruh', '02083010156312', 's1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894393, 'IC220', 'Fakulti Perakaunan', 1, '011110476111', '0111104761456');

-- --------------------------------------------------------

--
-- Table structure for table `trhea`
--

CREATE TABLE `trhea` (
  `trhea_id` int(100) NOT NULL,
  `trhea_name` varchar(70) NOT NULL,
  `staff_no` int(100) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(70) NOT NULL,
  `work_phone_no` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trhea`
--

INSERT INTO `trhea` (`trhea_id`, `trhea_name`, `staff_no`, `email`, `password`, `work_phone_no`) VALUES
(1, 'trhea1', 23142, 't1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'unatesta', 'una@mail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(2, 'anjing', 'anj@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`application_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `clerks`
--
ALTER TABLE `clerks`
  ADD PRIMARY KEY (`clerk_id`);

--
-- Indexes for table `kpps`
--
ALTER TABLE `kpps`
  ADD PRIMARY KEY (`kpp_id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`lecturer_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`program_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `trhea`
--
ALTER TABLE `trhea`
  ADD PRIMARY KEY (`trhea_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `application_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `clerks`
--
ALTER TABLE `clerks`
  MODIFY `clerk_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kpps`
--
ALTER TABLE `kpps`
  MODIFY `kpp_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `lecturer_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `program_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `trhea`
--
ALTER TABLE `trhea`
  MODIFY `trhea_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
