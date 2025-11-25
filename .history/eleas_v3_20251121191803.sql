-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2025 at 12:04 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eleas_v3`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `application_id` int(100) NOT NULL,
  `student_id` varchar(70) NOT NULL,
  `reason_exemption` varchar(70) NOT NULL,
  `noDay` int(70) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `datetime_application` datetime NOT NULL,
  `application_stat` varchar(70) NOT NULL DEFAULT 'aktif',
  `authorization_status` varchar(70) NOT NULL DEFAULT 'pending',
  `date_supported` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `supporter` varchar(70) DEFAULT NULL,
  `support_status` varchar(70) NOT NULL DEFAULT 'pending',
  `supportDoc` varchar(70) NOT NULL,
  `total_class` varchar(1000) NOT NULL DEFAULT 'Tiada',
  `total_authorizer_signed` varchar(70) NOT NULL DEFAULT '0',
  `total_authorizer_needed` varchar(70) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_id`, `student_id`, `reason_exemption`, `noDay`, `startDate`, `endDate`, `datetime_application`, `application_stat`, `authorization_status`, `date_supported`, `supporter`, `support_status`, `supportDoc`, `total_class`, `total_authorizer_signed`, `total_authorizer_needed`) VALUES
(113, '1', 'Konvokesyen', 2, '2025-11-28', '2025-11-29', '2025-11-21 19:01:52', 'aktif', 'pending', '0000-00-00 00:00:00', NULL, 'pending', '7529-The_role_of_the_enterprise_architect.pdf', '\n(1)[Kod Kursus : ISP551\n Kumpulan : ISP5515C\n Pensyarah : ', '0', '1');

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
(130, 113, '', '2025-11-22', 'Ahad', '08:00:00', 'ISP551', 'ISP5515C', '', 5, 'pending', 'belum', '0000-00-00 00:00:00', 1);

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
(4, 'ZAHARUDIN BIN OTHMAN', 21335432, 'admin2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(5, 'ROSMAWATI BINTI SAID', 2131213, 'admin3@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(6, 'HUZAINI BIN YASEP', 21345675, 'admin4@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(7, 'KU HARTINI BINTI ABDULLAH', 1234567, 'admin5@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
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
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kpps`
--

INSERT INTO `kpps` (`kpp_id`, `name`, `staff_no`, `email`, `password`, `work_phone_no`, `faculty_id`) VALUES
(1, 'KPP Akademi Pengajian Islam Kontemporari', 2147483647, 'k1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 3),
(2, 'KPP Pengurusan Perniagaan', 2147483647, 'k2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 4),
(3, 'KPP Kolej Pengajian Pengkomputeran, Informatik Dan Media', 2135432432, 'k3@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '1113291328912', 5),
(4, 'KPP Perakaunan', 2131213, 'kp4@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '11342432', 1),
(5, 'KPP Akademi Pengajian Bahasa', 2131213, 'k5@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 2),
(8, 'KPP Pengurusan Perniagaan 2', 123414124, 'k6@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131', 4);

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
  `work_phone_no` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`lecturer_id`, `lecturer_name`, `staff_no`, `email`, `password`, `work_phone_no`) VALUES
(2, 'Ahmad Zaki Bin Ibrahim', 2147483647, 'l1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '213213123424'),
(3, 'Lim Mei Ling', 2131213, 'l2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(4, 'Siti Najihah Binti Ahmad', 2131213, 'l3@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '0111104673'),
(5, 'Mohd Faizul Bin Hassan', 2147483647, 'l4@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '0111104673'),
(6, 'Nurul Ain Binti Latif', 2131213, 'l5@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(7, 'Suryani Binti Ismail', 2131213, 'l6@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(8, 'Zulkifli Bin Mohamad', 231423, 'l7@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131');

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
  `semester` int(70) NOT NULL,
  `phone_no` varchar(70) NOT NULL,
  `home_phone_no` varchar(70) NOT NULL,
  `program_id` int(100) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `ic`, `email`, `password`, `student_no`, `semester`, `phone_no`, `home_phone_no`, `program_id`, `faculty_id`) VALUES
(1, 'Muhammad Ilyas Bin Amran', '020830101563', 'student1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 6, '01111047614', '01111047611', 11, 5),
(2, 'Nur Atikah Binti Rahman', '020830101561', 'student2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894393, 6, '011110476111', '01111047123', 11, 5),
(3, 'Farhan Bin Syukri', '0208301015', 'student3@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 3, '0111104761411', '01111047614112', 11, 5),
(4, 'Alia Binti Shamsul', '02083010156312', 'student4@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 2, '0111104761421', '0111104761456', 11, 5),
(5, 'Imran Bin Hussin', '020830101561', 'student5@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 3, '01111047614', '011110476142', 11, 5),
(6, 'Siti Mariam Binti Abdullah', '02083010156312', 'student6@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 5, '01111047614', '01111047613', 11, 5),
(7, 'Hazwan Bin Fauzi', '02083010156312', 'student7@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 6, '01111047614', '01111047611', 11, 5),
(10, 'Nurul Ain Binti Razak', '021118110049', 'student8@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020452222, 6, '01118984887', '01118984887', 11, 5),
(11, 'Saiful Bin Azlan', '231321', 'student9@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 1, '0111104761421', '01111047123', 11, 5),
(12, 'Hafizah Binti Zainuddin', '021118110049', 'student10@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020452222, 6, '01118984887', '01118984887', 11, 5),
(13, 'Fatin Nabila Binti Osman', '02083010156312', 'student11@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 4, '01111047614', '0111104761456', 11, 5),
(14, 'Akmal Bin Johari', '02083010156312', 'student12@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 4, '0111104761421', '01111047123', 11, 5),
(15, 'Izwan Bin Rahmat', '02083010156312', 'student13@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 3, '01111047614', '0111104761456', 11, 5),
(16, 'Syakirah Binti Roslan', '021118110049', 'student14@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 3, '01111047614', '01111047123', 11, 5),
(17, 'Hafiz Bin Omar', '010512010800', 'student15@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2022793633, 5, '01159577361', '0111104761456', 11, 5),
(18, 'Eryna Binti Idris', '02083010156312', 'student16@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894393, 1, '011110476111', '0111104761456', 11, 5),
(19, 'Sulaiman Bin Harun', '02083010156312', 'student17@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 6, '01111047614', '0111104761456', 11, 5),
(20, 'Syafiqah Binti Ridzuan', '02083010156312', 'student18@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 6, '01111047614', '0111104761456', 11, 5),
(21, 'Mohd Idham Bin Rusdi', '02083010156312', 'student19@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 6, '01111047614', '0111104761456', 11, 5),
(22, 'Liyana Binti Hassan', '00112233445566', 'student20@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020614182, 6, '0123456789', '', 11, 5),
(23, 'Azmir Bin Baharum', '02083010156312', 'student21@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 3, '01111047614', '0111104761456', 11, 5),
(24, 'Aina Najwa Binti Salleh', '20202302837', 'student22@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 1, '01111047614', '0111104761456', 11, 5),
(25, 'Muhammad Adli Bin Hakim', '0208301015631212', 'student23@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 2, '01111047614', '', 11, 5),
(26, 'Noraini Binti Mokhtar', '02083010156312', 'student24@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 4, '01111047614', '', 11, 5);

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
  MODIFY `application_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

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
  MODIFY `kpp_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `lecturer_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `program_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `trhea`
--
ALTER TABLE `trhea`
  MODIFY `trhea_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
