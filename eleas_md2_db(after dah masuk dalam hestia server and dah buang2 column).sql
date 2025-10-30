-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 25, 2023 at 06:32 PM
-- Server version: 10.5.19-MariaDB-1:10.5.19+maria~ubu2004
-- PHP Version: 8.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eleas_md2_db`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`lecturer_id`, `lecturer_name`, `staff_no`, `email`, `password`, `work_phone_no`) VALUES
(2, 'ACHONG', 2147483647, 'l1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '213213123424'),
(3, 'tibee', 2131213, 'l2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(4, 'mustain ahmad', 2131213, 'l3@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '0111104673'),
(5, 'Ahmad Mustain Ilyasiah Bin Md Zaim Haziq', 2147483647, 'l4@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '0111104673'),
(6, 'Siti Fatimah Binti Zahrah', 2131213, 'l5@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(7, 'Pensyarah 6', 2131213, 'l6@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131'),
(8, 'Pensyarah 7', 231423, 'l7@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '2132131');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `ic`, `email`, `password`, `student_no`, `semester`, `phone_no`, `home_phone_no`, `program_id`, `faculty_id`) VALUES
(1, 'MUHAMMAD ILYAS BIN AMRAN', '020830101563', 'muhammadilyasamran@gmail.com', '011c945f30ce2cbafc452f39840f025693339c42', 2020894394, 6, '01111047614', '01111047611', 0, 0),
(2, 'MUSTAINIAH BINTI ABDUL HIDAYAH', '020830101561', 'ilyas@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894393, 6, '011110476111', '01111047123', 0, 0),
(3, 'WADADAD', '0208301015', 'mina@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 3, '0111104761411', '01111047614112', 0, 0),
(4, 'ILYASADMIN', '02083010156312', 'minaA@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 2, '0111104761421', '0111104761456', 0, 0),
(5, 'MUHAMMAD ZAIM BRUH', '020830101561', 'ilyasss@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 3, '01111047614', '011110476142', 0, 0),
(6, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '02083010156312', 'ilyass@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 5, '01111047614', '01111047613', 0, 0),
(7, 'GRANGER', '02083010156312', 'kiritokirito175@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 6, '01111047614', '01111047611', 0, 0),
(10, '', '021118110049', 'zaimi4009@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020452222, 6, '01118984887', '01118984887', 0, 0),
(11, 'MUHAMMAD ILYAS BIN AMRAN', '231321', 'ilyasssss@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 1, '0111104761421', '01111047123', 0, 0),
(12, 'MUHAMMAD ZAIM IRFAN BIN MOHD ZAMRI', '021118110049', 'zaimi3009@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020452222, 6, '01118984887', '01118984887', 0, 0),
(13, 'ANIS', '02083010156312', 'aniss@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 4, '01111047614', '0111104761456', 0, 0),
(14, 'MUSTAINIAH BINTI ABDUL HIDAYAHUH', '02083010156312', 'ilyabjs@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 4, '0111104761421', '01111047123', 0, 0),
(15, 'AWDDAWD', '02083010156312', 'ilyaa@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 3, '01111047614', '0111104761456', 0, 0),
(16, 'ILYASADMINSADW', '021118110049', 'ilyaq@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2147483647, 3, '01111047614', '01111047123', 0, 0),
(17, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '010512010800', 'niesurayaa@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2022793633, 5, '01159577361', '0111104761456', 7, 0),
(18, 'bruh', '02083010156312', 's1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894393, 1, '011110476111', '0111104761456', 0, 0),
(19, 'Abdul Zaim Haziq Bin Mustainiah Ilyas', '02083010156312', 's2', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 6, '01111047614', '0111104761456', 0, 0),
(20, 'Abdul Zaim Haziq Bin Mustainiah Ilyas', '02083010156312', 's2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 6, '01111047614', '0111104761456', 0, 0),
(21, 'Abdul Zaim Haziq Bin Mustainiah Ilyas', '02083010156312', 's3@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 6, '01111047614', '0111104761456', 0, 0),
(22, 'test Akaun', '00112233445566', 'test1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020614182, 6, '0123456789', '', 0, 0),
(23, 'Azmir Bin Baharum', '02083010156312', 'y1@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 3, '01111047614', '0111104761456', 11, 0),
(24, 'Granger Bin Gusion', '20202302837', 's5@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 1, '01111047614', '0111104761456', 11, 0),
(25, 'Pelajar 1', '0208301015631212', 's100@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 2, '01111047614', '', 11, 5),
(26, 'pelajar 2', '02083010156312', 's99@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 4, '01111047614', '', 7, 4);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `application_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

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
