-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2023 at 05:04 AM
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
-- Database: `eleas_db`
--

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
  `total_authorizer_needed` varchar(70) NOT NULL DEFAULT '0',
  `program_id` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_id`, `student_id`, `faculty`, `program_code`, `reason_exemption`, `noDay`, `startDate`, `endDate`, `datetime_application`, `application_stat`, `date_authorized`, `authorizer`, `authorization_status`, `date_supported`, `supporter`, `support_status`, `date_approved`, `approver`, `approval_status`, `supportDoc`, `total_class`, `total_authorizer_signed`, `total_authorizer_needed`, `program_id`) VALUES
(13, '5', 'CDCS', 'CDCS110', 'Muet', 12, '2023-05-13', '2023-05-01', '2023-05-09 19:16:12', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '', '\n(1)[Kod Kursus : ITT320\n Kumpulan : CSC2485B\n Pensyarah : MUSTAIN] - ', '0', '0', ''),
(16, '6', 'APB', 'CDIM110', 'Konvokesyen', 14, '2023-05-03', '2023-05-17', '2023-05-09 21:11:52', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '', '\n(1)[Kod Kursus : \n Kumpulan : \n Pensyarah : ] - ', '0', '0', ''),
(18, '6', 'APB', 'CDIM110', 'Muet', 1, '2023-05-10', '2023-05-11', '2023-05-09 21:12:32', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '', 'Tiada', '0', '0', ''),
(25, '2', '', 'CS110', 'Konvokesyen', 5, '2023-04-30', '2023-05-05', '2023-05-10 12:50:06', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (38).png', 'Tiada', '0', '0', ''),
(26, '14', '', 'CS110', 'Konvokesyen', 2, '2023-05-05', '2023-05-03', '2023-05-10 14:20:59', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (36).png', '', '0', '0', ''),
(27, '14', '', 'CS110', 'Konvokesyen', 2, '2023-05-02', '2023-05-04', '2023-05-10 14:21:17', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (35).png', 'Tiada', '0', '0', ''),
(28, '14', '', 'CS110', 'Konvokesyen', 2, '2023-05-02', '2023-05-04', '2023-05-10 14:21:35', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (36).png', 'Tiada', '0', '0', ''),
(29, '14', '', 'CS110', 'Muet', 0, '2023-05-05', '2023-05-05', '2023-05-10 14:22:19', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (35).png', 'Tiada', '0', '0', ''),
(30, '14', '', 'CS110', 'Muet', 0, '2023-05-03', '2023-05-03', '2023-05-10 14:22:35', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (38).png', 'Tiada', '0', '0', ''),
(31, '14', '', 'CS110', 'Konvokesyen', 1, '2023-05-04', '2023-05-05', '2023-05-10 14:22:54', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (43).png', 'Tiada', '0', '0', ''),
(32, '14', '', 'CS110', 'Konvokesyen', 10, '2023-05-01', '2023-05-11', '2023-05-10 15:01:20', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (38).png', 'Tiada', '0', '0', ''),
(33, '14', '', 'CS110', 'Muet', 16, '2023-04-30', '2023-05-16', '2023-05-10 15:01:41', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (38).png', 'Tiada', '0', '0', ''),
(34, '14', '', 'CS110', 'Muet', 14, '2023-05-06', '2023-05-20', '2023-05-10 15:01:54', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot (44).png', 'Tiada', '0', '0', ''),
(37, '14', '', 'CS110', 'Muet', 2, '2023-05-08', '2023-05-06', '2023-05-10 15:50:24', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot_20230123-214057_Instagram.jpg', 'Tiada', '0', '0', ''),
(38, '5', 'CDCS', 'CDCS110', 'Muet', 5, '2023-05-01', '2023-05-06', '2023-05-11 11:00:47', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot_20230123-214057_Instagram.jpg', 'Tiada', '0', '0', ''),
(39, '5', 'CDCS', 'CDCS110', 'Haji', 3, '2023-05-06', '2023-05-09', '2023-05-11 11:01:32', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot_20230123-214057_Instagram.jpg', 'Tiada', '0', '0', ''),
(40, '7', 'FAKULTI PERAKAUNAN', 'ACC110', 'Konvokesyen', 7, '2023-05-01', '2023-05-08', '2023-05-11 11:48:56', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'Screenshot_20230123-214057_Instagram.jpg', '\n(1)[Kod Kursus : WOI\n Kumpulan : KEPALA DIA\n Pensyarah : ZAIM] - ', '0', '0', ''),
(41, '12', 'KOLEJ PENGAJIAN PENGKOMPUTERAN, INFORMATIK DAN MEDIA', 'CDCS110', 'Muet', 1, '2023-05-14', '2023-05-15', '2023-05-14 14:04:24', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (3).xlsx', '\n(1)[Kod Kursus : CS265\n Kumpulan : RTT3205A\n Pensyarah : SIR MEME] - ', '0', '0', ''),
(42, '5', 'CDCS', 'CDCS110', 'Konvokesyen', 17, '2023-05-02', '2023-05-19', '2023-05-16 15:45:35', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (2).xlsx', 'Tiada', '0', '0', ''),
(43, '5', 'CDCS', 'CDCS110', 'Muet', 8, '2023-05-19', '2023-05-11', '2023-05-16 15:47:39', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'ORGANIZING THE PREPARATION OUTLINE (2).pdf', '\n(1)[Kod Kursus : CSC456\n Kumpulan : ITT3205A\n Pensyarah : ZAIM] - \n(2)[Kod Kursus : CS265\n Kumpulan : CSC2485B\n Pensyarah : HAZIQ] - \n(3)[Kod Kursus : WOI\n Kumpulan : ANIS\n Pensyarah : MUSTAIN] - ', '0', '0', ''),
(44, '5', 'CDCS', 'CDCS110', 'Muet', 21, '2023-05-26', '2023-05-05', '2023-05-16 16:14:14', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'ORGANIZING THE PREPARATION OUTLINE (3).pdf', 'Tiada', '0', '0', ''),
(45, '5', 'CDCS', 'CDCS110', 'fsewa', 14, '2023-05-19', '2023-05-05', '2023-05-16 16:18:52', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (2).xlsx', 'Tiada', '0', '0', ''),
(46, '5', 'CDCS', 'CDCS110', 'Konvokesyen', 25, '2023-05-26', '2023-05-01', '2023-05-16 16:19:55', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (1).xlsx', 'Tiada', '0', '0', ''),
(47, '5', 'CDCS', 'CDCS110', 'Muet', 8, '2023-05-04', '2023-05-12', '2023-05-16 16:42:54', 'aktif', '0000-00-00 00:00:00', '', 'Selesai', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (2).xlsx', '(1)[Kod Kursus : CSC456\r\n Kumpulan : WEHHH\r\n Pensyarah : tibe]\r\n\r\n(2)[Kod Kursus : WOI\r\n Kumpulan : RTT3205A\r\n Pensyarah : ACHONG]\r\n\r\n(3)[Kod Kursus : WOI\r\n Kumpulan : RTT3205A\r\n Pensyarah : ACHONG]\r\n\r\n(4)[Kod Kursus : CSC456\r\n Kumpulan : RTT3205A\r\n Pensyarah : ACHONG]\r\n', '4', '4', ''),
(48, '5', 'CDCS', 'CDCS110', 'Konvokesyen', 10, '2023-05-06', '2023-05-16', '2023-05-16 16:43:58', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (3).xlsx', 'Tiada', '0', '0', ''),
(49, '5', 'CDCS', 'CDCS110', 'dwa', 16, '2023-05-10', '2023-05-26', '2023-05-16 16:44:28', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'ORGANIZING THE PREPARATION OUTLINE (3).pdf', 'Tiada', '0', '0', ''),
(51, '3', 'Fakulti Perakaunan', 'BA252', 'Muet', 7, '2023-05-05', '2023-05-12', '2023-05-16 23:32:54', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'ORGANIZING THE PREPARATION OUTLINE (3).pdf', '\n(1)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : cikgu achings] - ', '0', '0', ''),
(52, '3', 'Fakulti Perakaunan', 'BA252', 'Konvokesyen', 15, '2023-05-11', '2023-05-26', '2023-05-17 00:06:27', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (1).xlsx', 'Tiada', '0', '0', ''),
(53, '3', 'Fakulti Perakaunan', 'BA252', 'Konvokesyen', 15, '2023-05-11', '2023-05-26', '2023-05-17 00:09:09', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'studentcar-data (1).xlsx', 'Tiada', '0', '0', ''),
(55, '18', 'Fakulti Perakaunan', 'IC220', 'Konvokesyen', 22, '2023-05-26', '2023-05-04', '2023-05-17 04:42:15', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', 'ORGANIZING THE PREPARATION OUTLINE (3).pdf', '\n(1)[Kod Kursus : ITT320\n Kumpulan : WEHHH\n Pensyarah : Muhammad Ilyas Bin Amran]\n', '0', '0', ''),
(91, '22', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', 'CDCS110', 'Konvokesyen', 5, '2023-07-06', '2023-07-11', '2023-06-18 09:16:14', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '5610-REKOD PUNCH CARD BULAN MEI MUHAMMAD ILYAS BIN AMRAN.pdf', '\n(1)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : Ahmad Mustain Ilyasiah Bin Md Zaim Haziq]\n', '0', '1', ''),
(97, '23', '', '', 'Kahwin', 1, '2023-07-24', '2023-07-24', '2023-07-24 16:02:08', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '2587-eleas_db(backup latest and complete).sql', 'Tiada', '0', '6', '11'),
(98, '17', '', '', 'Konvokesyen', 1, '2023-07-24', '2023-07-24', '2023-07-24 16:15:17', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '9869-eleas_db(backup latest and complete).sql', '\n(1)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n\n(2)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n\n(3)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n\n(4)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n\n(5)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n\n(6)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n\n(7)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n\n(8)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n', '1', '8', '7'),
(100, '24', '', '', 'Menghadiri Kenduri Kahwin Kakak', 1, '2023-07-24', '2023-07-24', '2023-07-24 19:06:21', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '4422-eleas_db(backup latest and complete).sql', '\n(1)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n\n(2)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n\n(3)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n\n(4)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n', '0', '4', ''),
(101, '17', '', '', 'Konvokesyen', 1, '2023-07-24', '2023-07-24', '2023-07-24 20:25:45', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '1054-eleas_db(backup latest and complete).sql', '', '0', '2', ''),
(102, '17', '', '', 'Konvokesyen', 8, '2023-07-17', '2023-07-24', '2023-07-24 20:29:25', 'aktif', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '0000-00-00 00:00:00', '', 'pending', '4808-MUHAMMAD_HAIKAL_IQBAL_BIN_MISNAN_2020863292_FINAL_YEAR_REPORT (1)', 'Tiada', '0', '0', ''),
(103, '25', '', '', 'Konvokesyen', 1, '2023-07-25', '2023-07-25', '2023-07-25 03:56:44', 'Selesai', '0000-00-00 00:00:00', '', 'Selesai', '2023-07-25 04:51:06', '', 'Diluluskan', '0000-00-00 00:00:00', '', 'pending', '4979-009_Private project details (100 images).pdf', '\n(1)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n\n(2)[Kod Kursus : ITT320\n Kumpulan : ITT3205A\n Pensyarah : ]\n', '2', '2', '');

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
  `date_authorized` datetime NOT NULL,
  `student_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `application_id`, `student_name`, `class_date`, `class_day`, `class_time`, `course_code`, `group`, `lecturer_name`, `lecturer_id`, `authorization_status`, `signed_status`, `date_authorized`, `student_id`) VALUES
(1, 1, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-11', 'AHAD', '15:00:00', 'ITT320', 'ITT3205A', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(2, 1, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-11', 'AHAD', '15:00:00', 'ITT320', 'ITT3205A', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(3, 1, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-01', 'selasa', '03:33:00', 'CSC456', 'RTT3205A', 'MUSTAIN', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(4, 1, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-11', 'RABU', '20:07:00', 'CSC248', 'CSC2485B', 'HAZIQ', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(5, 2, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-10', 'KHAMIS', '07:17:00', 'CSC456', 'RTT3205A', 'ILYAS', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(6, 6, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-04', 'RABU', '16:45:00', 'CS265', 'CSC2485B', 'HAZIQ', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(7, 9, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-13', 'KHAMIS', '06:50:00', 'CSC248', 'CSC2485B', 'ILYAS', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(9, 12, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-11', 'AHAD', '16:56:00', 'ITT320', 'ITT3205A', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(10, 11, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-04', 'RABU', '18:58:00', 'CS265', 'CSC2485B', 'HAZIQ', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(11, 11, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-05', 'SELASA', '21:01:00', 'ITT320', 'RTT3205A', 'MUSTAIN', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(14, 13, 'MUHAMMAD ILYAS BIN AMRANZ', '2023-05-03', 'AHAD', '09:16:00', 'ITT320', 'CSC2485B', 'MUSTAIN', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(15, 1, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-10', 'RABU', '19:23:00', 'ITT320', 'CSC2485B', 'MUSTAIN', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(16, 14, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-08', 'AHAD', '21:23:00', 'CSC456', 'ITT3205A', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(17, 14, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-17', 'AHAD', '20:22:00', 'ITT320', 'ITT3205A', 'ILYAS', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(18, 0, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-09', 'AHAD', '19:57:00', 'CSC456', 'CSC2485B', 'ZAIM', 0, 'pending', 'belum', '2023-05-17 20:45:36', 0),
(19, 0, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '2023-05-03', 'AHAD', '23:09:00', 'ITT320', 'ITT3205A', 'HAZIQ', 0, 'pending', 'belum', '2023-05-17 20:45:36', 0),
(20, 16, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '0000-00-00', '', '00:00:00', '', '', '', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(37, 40, 'GRANGER', '2023-05-04', 'DAWD', '16:26:00', 'WOI', 'KEPALA DIA', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(38, 41, 'MUHAMMAD ZAIM IRFAN BIN MOHD ZAMRI', '2023-05-15', 'RABU', '14:10:00', 'CS265', 'RTT3205A', 'SIR MEME', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(39, 43, 'MUHAMMAD ZAIM BRUH', '2023-05-06', 'AHAD', '15:55:00', 'CSC456', 'ITT3205A', 'ZAIM', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(40, 43, 'MUHAMMAD ZAIM BRUH', '2023-05-04', 'RABU', '15:53:00', 'CS265', 'CSC2485B', 'HAZIQ', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(43, 43, 'MUHAMMAD ZAIM BRUH', '2023-05-03', 'AHAD', '16:14:00', 'WOI', 'ANIS', 'MUSTAIN', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(47, 51, 'tibe', '2023-05-04', 'Selasa', '01:03:00', 'ITT320', 'ITT3205A', 'cikgu achings', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(53, 55, 'bruh', '2023-05-11', 'Rabu', '05:47:00', 'ITT320', 'WEHHH', 'Muhammad Ilyas Bin Amran', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(55, 47, 'MUHAMMAD ZAIM BRUH', '2023-05-29', 'Selasa', '19:58:00', 'CSC456', 'WEHHH', 'tibe', 0, 'Dibenarkan', 'belum', '2023-05-22 19:36:42', 0),
(56, 47, 'MUHAMMAD ZAIM BRUH', '2023-05-01', 'Isnin', '19:59:00', 'WOI', 'RTT3205A', 'ACHONG', 0, 'Tidak Dibenarkan', 'belum', '2023-05-23 09:03:03', 0),
(57, 47, 'MUHAMMAD ZAIM BRUH', '2023-05-01', 'Isnin', '19:59:00', 'WOI', 'RTT3205A', 'ACHONG', 0, 'Dibenarkan', 'belum', '2023-06-06 09:40:54', 0),
(58, 47, 'MUHAMMAD ZAIM BRUH', '2023-05-10', 'Isnin', '20:03:00', 'CSC456', 'RTT3205A', 'ACHONG', 0, 'Dibenarkan', 'belum', '2023-06-06 09:46:05', 0),
(65, 64, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-09', 'Isnin', '09:37:00', 'ITT320', 'ITT3205A', 'ACHONG', 0, 'Dibenarkan', 'belum', '2023-06-06 11:37:04', 0),
(66, 72, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-15', 'Isnin', '11:40:00', 'ITT320', 'ITT3205A', 'ACHONG', 0, 'Tidak Dibenarkan', 'belum', '2023-06-06 16:14:22', 0),
(67, 64, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-07-06', 'Isnin', '15:36:00', 'ITT320', 'CSC2485B', 'ACHONG', 0, 'Dibenarkan', 'belum', '2023-06-06 16:17:44', 0),
(68, 64, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-13', 'Isnin', '04:07:00', 'ITT320', 'ITT3205A', 'tibee', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(69, 64, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-09', 'Isnin', '18:06:00', 'ITT320', 'RTT3205A', 'tibee', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(70, 65, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-22', 'Selasa', '22:46:00', 'ITT320', 'ITT3205A', 'ACHONG', 0, 'Dibenarkan', 'belum', '2023-06-06 21:32:50', 0),
(71, 65, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-07', 'Ahad', '23:19:00', 'ITT320', 'KEPALA DIA', 'ACHONG', 0, 'Dibenarkan', 'belum', '2023-06-06 21:39:16', 0),
(72, 66, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-15', 'Selasa', '21:30:00', 'ITT320', 'CSC2485B', 'ACHONG', 0, 'Tidak Dibenarkan', 'belum', '2023-06-06 21:40:20', 0),
(73, 66, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-07', 'Ahad', '21:31:00', 'ITT320', 'ANIS', 'tibee', 0, 'Dibenarkan', 'belum', '2023-06-18 09:22:39', 0),
(74, 67, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-23', 'Isnin', '21:47:00', 'CS265', 'CSC2485B', 'ACHONG', 0, 'Tidak Dibenarkan', 'belum', '2023-06-06 21:45:42', 0),
(75, 68, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-06', 'Selasa', '09:46:00', 'ITT320', 'KEPALA DIA', 'ACHONG', 0, 'Dibenarkan', 'belum', '2023-06-06 22:01:40', 0),
(76, 68, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-06', 'Selasa', '09:46:00', 'ITT320', 'KEPALA DIA', 'ACHONG', 0, 'Dibenarkan', 'belum', '2023-06-06 22:07:39', 0),
(77, 69, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-13', 'Isnin', '21:48:00', 'CSC456', 'ITT3205A', 'ACHONG', 0, 'Tidak Dibenarkan', 'belum', '2023-06-06 22:07:53', 0),
(78, 65, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '2023-06-16', 'Selasa', '18:21:00', 'CSC456', 'KEPALA DIA', 'ACHONG', 0, 'Tidak Dibenarkan', 'belum', '2023-06-14 11:26:03', 0),
(83, 90, 'SITI NUR ANIS SURAYA BINTI MD AMRAN', '2023-06-14', 'Khamis', '11:24:00', 'ITT320', 'RTT3205A', 'ACHONG', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(84, 90, 'SITI NUR ANIS SURAYA BINTI MD AMRAN', '2023-06-14', 'Isnin', '11:26:00', 'ITT320', 'ITT3205A', 'ACHONG', 0, 'Dibenarkan', 'belum', '2023-07-05 14:58:23', 0),
(85, 90, 'SITI NUR ANIS SURAYA BINTI MD AMRAN', '2023-06-15', 'Isnin', '11:26:00', 'CSC456', 'ITT3205A', 'tibee', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(86, 91, 'test Akaun', '2023-07-06', 'Khamis', '08:00:00', 'ITT320', 'ITT3205A', 'Ahmad Mustain Ilyasiah Bin Md Zaim Haziq', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(87, 92, 'SITI NUR ANIS SURAYA BINTI MD AMRAN', '2023-07-05', 'Ahad', '14:44:00', 'CSC248', 'CSC2485B', 'ACHONG', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(88, 92, 'SITI NUR ANIS SURAYA BINTI MD AMRAN', '2023-07-06', 'Ahad', '14:53:00', 'ITT320', 'RTT3205A', 'tibee', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(89, 92, 'SITI NUR ANIS SURAYA BINTI MD AMRAN', '2023-07-08', 'Ahad', '14:01:00', 'CSC248', 'CSC2485B', 'tibee', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(90, 92, 'SITI NUR ANIS SURAYA BINTI MD AMRAN', '2023-07-05', 'Ahad', '14:59:00', 'ITT320', 'ITT3205A', 'ACHONG', 0, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(91, 94, 'SITI NUR ANIS SURAYA BINTI MD AMRAN', '2023-07-13', 'Isnin', '10:57:00', 'ITT320', 'WEHHH', 'tibee', 0, 'Dibenarkan', 'belum', '2023-07-24 09:00:03', 0),
(102, 97, '', '2023-07-24', 'Isnin', '16:02:00', 'ITT320', 'ITT3205A', '', 2, 'pending', 'belum', '0000-00-00 00:00:00', 23),
(103, 97, '', '2023-07-17', 'Isnin', '16:04:00', 'ITT320', 'RTT3205A', '', 3, 'pending', 'belum', '0000-00-00 00:00:00', 23),
(104, 97, '', '2023-07-18', 'Ahad', '04:30:00', 'ITT320', 'ITT3205A', '', 3, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(105, 97, '', '2023-07-18', 'Ahad', '04:30:00', 'ITT320', 'ITT3205A', '', 3, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(106, 97, '', '2023-07-18', 'Ahad', '04:30:00', 'ITT320', 'ITT3205A', '', 3, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(107, 97, '', '2023-07-18', 'Ahad', '04:30:00', 'ITT320', 'ITT3205A', '', 3, 'pending', 'belum', '0000-00-00 00:00:00', 0),
(108, 98, '', '2023-07-24', 'Isnin', '16:16:00', 'ITT320', 'ITT3205A', '', 2, 'pending', 'belum', '0000-00-00 00:00:00', 17),
(109, 98, '', '2023-07-24', 'Isnin', '16:16:00', 'ITT320', 'ITT3205A', '', 2, 'pending', 'belum', '0000-00-00 00:00:00', 17),
(110, 98, '', '2023-07-24', 'Isnin', '16:16:00', 'ITT320', 'ITT3205A', '', 2, 'pending', 'belum', '0000-00-00 00:00:00', 17),
(111, 98, '', '2023-07-24', 'Isnin', '16:16:00', 'ITT320', 'ITT3205A', '', 3, 'pending', 'belum', '0000-00-00 00:00:00', 17),
(112, 98, '', '2023-07-24', 'Ahad', '06:28:00', 'ITT320', 'ITT3205A', '', 3, 'pending', 'belum', '0000-00-00 00:00:00', 17),
(113, 98, '', '2023-07-24', 'Ahad', '06:28:00', 'ITT320', 'ITT3205A', '', 3, 'pending', 'belum', '0000-00-00 00:00:00', 17),
(114, 98, '', '2023-07-24', 'Ahad', '06:28:00', 'ITT320', 'ITT3205A', '', 3, 'pending', 'belum', '0000-00-00 00:00:00', 17),
(115, 100, '', '2023-07-24', 'Ahad', '19:09:00', 'ITT320', 'ITT3205A', '', 2, 'pending', 'belum', '0000-00-00 00:00:00', 24),
(116, 100, '', '2023-07-18', 'Ahad', '20:08:00', 'ITT320', 'ITT3205A', '', 5, 'pending', 'belum', '0000-00-00 00:00:00', 24),
(117, 100, '', '2023-06-25', 'Isnin', '20:08:00', 'ITT320', 'ITT3205A', '', 3, 'pending', 'belum', '0000-00-00 00:00:00', 24),
(118, 100, '', '2023-07-02', 'Isnin', '19:12:00', 'ITT320', 'ITT3205A', '', 2, 'pending', 'belum', '0000-00-00 00:00:00', 24),
(119, 98, '', '2023-07-24', 'Ahad', '22:26:00', 'ITT320', 'ITT3205A', '', 6, 'Dibenarkan', 'belum', '2023-07-25 02:57:21', 17),
(122, 103, '', '2023-07-25', 'Ahad', '03:59:00', 'ITT320', 'ITT3205A', '', 7, 'Dibenarkan', 'belum', '2023-07-25 04:16:01', 25),
(123, 103, '', '2023-07-26', 'Ahad', '04:14:00', 'ITT320', 'ITT3205A', '', 7, 'Tidak Dibenarkan', 'belum', '2023-07-25 04:18:45', 25);

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
(1, 'a1', 12321421, 'a1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(4, 'ZAHARUDIN BIN OTHMAN', 21335432, 'a2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(5, 'ROSMAWATI BINTI SAID', 2131213, 'a3@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(6, 'HUZAINI BIN YASEP', 21345675, 'a4@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(7, 'KU HARTINI BINTI ABDULLAH', 1234567, 'a5@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(8, 'ZETTY NATAMULIA BINTI ELIAS', 1234567890, 'a6@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(100) NOT NULL,
  `kpp_id` int(100) NOT NULL,
  `name` varchar(70) NOT NULL,
  `faculty_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `kpp_id`, `name`, `faculty_code`) VALUES
(1, 1, 'Fakulti Perakaunan', 'FAC'),
(2, 1, 'Akademi Pengajian Bahasa', 'APB'),
(3, 1, 'Akademi Pengajian Islam Kontemporari', 'ACIS'),
(4, 1, 'Fakulti Pengurusan Dan Perniagaan', 'FPP'),
(5, 1, 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', 'KPPIM');

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
  `faculty` varchar(70) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kpps`
--

INSERT INTO `kpps` (`kpp_id`, `name`, `staff_no`, `email`, `password`, `work_phone_no`, `faculty`, `faculty_id`) VALUES
(1, 'KPP Akademi Pengajian Islam Kontemporari', 2147483647, 'k1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 'Akademi Pengajian Islam Kontemporari', 3),
(2, 'KPP Pengurusan Perniagaan', 2147483647, 'k2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 'Fakulti Pengurusan Dan Perniagaan', 4),
(3, 'KPP Kolej Pengajian Pengkomputeran, Informatik Dan Media', 2135432, 'k3@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '1113291328912', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', 5),
(4, 'KPP Perakaunan', 2131213, 'kp4@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '11342432', 'Fakulti Perakaunan', 1),
(5, 'KPP Akademi Pengajian Bahasa', 2131213, 'k5@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 'Akademi Pengajian Bahasa', 2);

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
(2, 'ACHONG', 2147483647, 'l1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '213213123424', 'AKADEMI PENGAJIAN ISLAM KONTEMPORARI', 'BA114'),
(3, 'tibee', 2131213, 'l2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 'Fakulti Perakaunan', 'BA252'),
(4, 'mustain ahmad', 2131213, 'l3@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '0111104673', 'Fakulti Pengurusan Dan Perniagaan', 'BA242'),
(5, 'Ahmad Mustain Ilyasiah Bin Md Zaim Haziq', 2147483647, 'l4@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '0111104673', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', ''),
(6, 'Siti Fatimah Binti Zahrah', 2131213, 'l5@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', '', ''),
(7, 'Pensyarah 6', 2131213, 'l6@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', '', '');

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
  `faculty_name` varchar(70) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`program_id`, `clerk_name`, `program_code`, `program_name`, `faculty_code`, `faculty_name`, `faculty_id`) VALUES
(1, 'KU HARTINI BINTI ABDULLAH', 'ACC110', 'Diploma Perakaunan', 'FAC', 'Fakulti Perakaunan', 1),
(2, 'KU HARTINI BINTI ABDULLAH', 'ACC220', 'Sarjana Muda Perakaunan (Kepujian)', 'FAC', 'Fakulti Perakaunan', 1),
(3, 'ZETTY NATAMULIA BINTI ELIAS', 'BA111', 'Diploma Pengajian Perniagaan', 'FPP', 'Fakulti Pengurusan Dan Perniagaan', 4),
(4, 'ZETTY NATAMULIA BINTI ELIAS', 'BA114', 'Diploma Analisis Pelaburan', 'FPP', 'Fakulti Pengurusan Dan Perniagaan', 4),
(5, 'ZETTY NATAMULIA BINTI ELIAS', 'BA119', 'Diploma Pengajian Perbankan', 'FPP', 'Fakulti Pengurusan Dan Perniagaan', 4),
(6, 'ZAHARUDIN BIN OTHMAN', 'BA240', 'Sarjana Muda Pentadbiran Perniagaan (Kepujian) Pemasaran', 'FPP', 'Fakulti Pengurusan Dan Perniagaan', 4),
(7, 'ZAHARUDIN BIN OTHMAN', 'BA242', 'Sarjana Muda Pentadbiran Perniagaan (Kepujiaan) Kewangan', 'FPP', 'Fakulti Pengurusan Dan Perniagaan', 4),
(8, 'ZAHARUDIN BIN OTHMAN', 'BA249', 'Sarjana Muda Pentadbiran Perniagaan (Kepujian) Perbankan Islam', 'FPP', 'Fakulti Pengurusan Dan Perniagaan', 4),
(9, 'ZAHARUDIN BIN OTHMAN', 'BA251', 'Sarjana Muda Pentadbiran Perniagaan (Kepujian) Pengurusan Pelaburan', 'FPP', 'Fakulti Pengurusan Dan Perniagaan', 4),
(10, 'HUZAINI BIN YASEP', 'BA252', 'Sarjana Muda Pemasaran Digital (Kepujian)', 'FPP', 'Fakulti Pengurusan Dan Perniagaan', 4),
(11, 'ROSMAWATI BINTI SAID', 'CDCS110', 'Diploma Sains Komputer', 'KPPIM', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', 5),
(12, 'ROSMAWATI BINTI SAID', 'CDCS143', 'Diploma Sains Matematik', 'KPPIM', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', 5),
(13, 'ROSMAWATI BINTI SAID', 'CDIM110', 'Diploma Pengurusan Maklumat', 'KPPIM', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', 5),
(14, 'ROSMAWATI BINTI SAID', 'CD1M261', 'Sarjana Muda Sains Maklumat (Kepujian) Pengurusan Rekod ', 'KPPIM', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', 5),
(15, 'KU HARTINI BINTI ABDULLAH', 'LG120', 'Diploma Bahasa Inggeris Komunikasi Profesional', 'APB', 'Akademi Pengajian Bahasa', 2),
(16, 'HUZAINI BIN YASEP', 'IC220', 'Sarjana Muda Pengurusan Industri Halal (Kepujian)', 'ACIS', 'Akademi Pengajian Islam Kontemporari', 3);

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
  `home_phone_no` varchar(70) NOT NULL,
  `program_id` int(100) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `ic`, `email`, `password`, `student_no`, `program_code`, `faculty`, `semester`, `phone_no`, `home_phone_no`, `program_id`, `faculty_id`) VALUES
(1, 'MUHAMMAD ILYAS BIN AMRAN', '020830101563', 'muhammadilyasamran@gmail.com', '011c945f30ce2cbafc452f39840f025693339c42', 2020894394, 'CS110', '', 6, '01111047614', '01111047611', 0, 0),
(2, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '020830101561', 'ilyas@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894393, 'CS110', '', 6, '011110476111', '01111047123', 0, 0),
(3, 'WADADAD', '0208301015', 'mina@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 'ACC220', 'APB', 3, '0111104761411', '01111047614112', 0, 0),
(4, 'ILYASADMIN', '02083010156312', 'minaA@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 'CS110', '', 2, '0111104761421', '0111104761456', 0, 0),
(5, 'MUHAMMAD ZAIM BRUH', '020830101561', 'ilyasss@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'CDCS110', 'CDCS', 3, '01111047614', '011110476142', 0, 0),
(6, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '02083010156312', 'ilyass@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 'CDIM110', 'APB', 5, '01111047614', '01111047613', 0, 0),
(7, 'GRANGER', '02083010156312', 'kiritokirito175@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'ACC110', 'FAKULTI PERAKAUNAN', 6, '01111047614', '01111047611', 0, 0),
(10, '', '021118110049', 'zaimi4009@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020452222, 'CDCS110', 'KOLEJ PENGAJIAN PENGKOMPUTERAN, INFORMATIK DAN MEDIA', 6, '01118984887', '01118984887', 0, 0),
(11, 'MUHAMMAD ILYAS BIN AMRAN', '231321', 'ilyasssss@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 'BA252', 'FAKULTI PERAKAUNAN', 1, '0111104761421', '01111047123', 0, 0),
(12, 'MUHAMMAD ZAIM IRFAN BIN MOHD ZAMRI', '021118110049', 'zaimi3009@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020452222, 'CDCS110', 'KOLEJ PENGAJIAN PENGKOMPUTERAN, INFORMATIK DAN MEDIA', 6, '01118984887', '01118984887', 0, 0),
(13, 'ANIS', '02083010156312', 'aniss@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'CDCS110', 'KOLEJ PENGAJIAN PENGKOMPUTERAN, INFORMATIK DAN MEDIA', 4, '01111047614', '0111104761456', 0, 0),
(14, 'MUSTAINIAH BINTI ABDUL HIDAYAHUH', '02083010156312', 'ilyabjs@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'CDCS143', 'AKADEMI PENGAJIAN BAHASA', 4, '0111104761421', '01111047123', 0, 0),
(15, 'AWDDAWD', '02083010156312', 'ilyaa@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'CD1M261', 'FAKULTI PENGURUSAN DAN PERNIAGAAN', 3, '01111047614', '0111104761456', 0, 0),
(16, 'ILYASADMINSADW', '021118110049', 'ilyaq@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 'CD1M261', 'AKADEMI PENGAJIAN BAHASA', 3, '01111047614', '01111047123', 0, 0),
(17, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '010512010800', 'niesurayaa@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2022793633, 'BA242', 'FAKULTI PENGURUSAN DAN PERNIAGAAN', 5, '01159577361', '0111104761456', 7, 0),
(18, 'bruh', '02083010156312', 's1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894393, 'IC220', 'Fakulti Perakaunan', 1, '011110476111', '0111104761456', 0, 0),
(19, 'Abdul Zaim Haziq Bin Mustainiah Ilyas', '02083010156312', 's2', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'CDCS110', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', 6, '01111047614', '0111104761456', 0, 0),
(20, 'Abdul Zaim Haziq Bin Mustainiah Ilyas', '02083010156312', 's2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'CDCS110', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', 6, '01111047614', '0111104761456', 0, 0),
(21, 'Abdul Zaim Haziq Bin Mustainiah Ilyas', '02083010156312', 's3@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 'CDCS110', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', 6, '01111047614', '0111104761456', 0, 0),
(22, 'test Akaun', '00112233445566', 'test1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020614182, 'CDCS110', 'Kolej Pengajian Pengkomputeran, Informatik Dan Media', 6, '0123456789', '', 0, 0),
(23, 'Azmir Bin Baharum', '02083010156312', 'y1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, '', '', 3, '01111047614', '0111104761456', 11, 0),
(24, 'Granger Bin Gusion', '20202302837', 's5@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, '', '', 1, '01111047614', '0111104761456', 11, 0),
(25, 'Pelajar 1', '02083010156312', 's100@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, '', '', 1, '01111047614', '', 11, 5);

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
(1, 'doktor mus', 23142, 't1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`application_id`);

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
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `application_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `clerks`
--
ALTER TABLE `clerks`
  MODIFY `clerk_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `kpps`
--
ALTER TABLE `kpps`
  MODIFY `kpp_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `lecturer_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `program_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `trhea`
--
ALTER TABLE `trhea`
  MODIFY `trhea_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
