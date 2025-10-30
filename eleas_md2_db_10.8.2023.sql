-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2023 at 05:16 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

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

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_id`, `student_id`, `reason_exemption`, `noDay`, `startDate`, `endDate`, `datetime_application`, `application_stat`, `authorization_status`, `date_supported`, `supporter`, `support_status`, `supportDoc`, `total_class`, `total_authorizer_signed`, `total_authorizer_needed`) VALUES
(126, '27', 'Haji', 2, '2023-09-01', '2023-09-02', '2023-08-10 10:39:12', 'Selesai', 'Selesai', '2023-08-10 10:49:22', NULL, 'Diluluskan', '8407-JULAI 2023_intersys.penang.uitm.edu.my_eClock_clocking_print.php_', '\n(1)[Kod Kursus : CTU110\n Kumpulan : JCS1106A\n Pensyarah : ', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(100) NOT NULL,
  `application_id` int(100) NOT NULL,
  `class_date` date NOT NULL,
  `class_day` varchar(70) NOT NULL,
  `class_time` time NOT NULL,
  `course_code` varchar(70) NOT NULL,
  `group` varchar(70) NOT NULL,
  `lecturer_id` int(100) NOT NULL,
  `authorization_status` varchar(70) NOT NULL DEFAULT 'pending',
  `date_authorized` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `student_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `application_id`, `class_date`, `class_day`, `class_time`, `course_code`, `group`, `lecturer_id`, `authorization_status`, `date_authorized`, `student_id`) VALUES
(152, 126, '2023-09-01', 'Jumaat', '08:00:00', 'CTU110', 'JCS1106A', 283, 'Dibenarkan', '2023-08-10 10:48:30', 27);

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
(10, 'a1', 2131213, 'a1@gmail.com', '111', '2132131'),
(11, 'a2', 2131213, 'a2@gmail.com', '111', '2132131'),
(12, 'Admin 1', 5001, 'admin1@gmail.com', '111', '079352000');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(100) NOT NULL,
  `name` varchar(70) NOT NULL,
  `faculty_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `name`, `faculty_code`) VALUES
(1, 'Akademi Pengajian Islam Kontemporari', 'ACIS'),
(2, 'Akademi Pengajian Bahasa', 'APB'),
(3, 'Fakulti Perakaunan', 'FP'),
(4, 'Fakulti Pengurusan Dan Perniagaan', 'FPDP'),
(5, 'Fakulti Pengurusan Maklumat', 'FPM'),
(6, 'Fakulti Sains Komputer & Matematik', 'FSKM'),
(7, 'Jabatan Undang-Undang', 'LAW');

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
(12, 'KPP Akademi Pengajian Islam Kontemporari', 1011, 'acis@uitmj', '111', '079352000', 1),
(13, 'KPP Akademi Pengajian Bahasa', 1012, 'apb@uitmj', '111', '079352000', 2),
(14, 'KPP Fakulti Perakaunan', 1013, 'fp@uitmj', '111', '079352000', 3),
(15, 'KPP Fakulti Pengurusan Dan Perniagaan', 1014, 'fpdp@uitmj', '111', '079352000', 4),
(16, 'KPP Fakulti Pengurusan Maklumat', 1015, 'fpm@uitmj', '111', '079352000', 5),
(17, 'KPP Fakulti Sains Komputer & Matematik', 1016, 'fskm@uitmj', '111', '079352000', 6),
(18, 'Penasihat Jabatan Undang-Undang', 1017, 'law@uitmj', '111', '079352000', 7);

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
  `work_phone_no` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`lecturer_id`, `lecturer_name`, `staff_no`, `email`, `password`, `work_phone_no`) VALUES
(17, 'SHASHAZRINA BINTI ROSLAN', 272689, 'shash689@uitm.edu.my', '@272689Yusrina', '0196242629'),
(18, 'MUHAMAD ISMAIL BIN PAHMI', 243184, 'muham184@uitm.edu.my', 'muhama03', '0122848043'),
(19, 'JASLIN BINTI MD DAHLAN', 173830, 'jasli830@uitm.edu.my', 'Lakeland71', '0127647730'),
(20, 'AEMY BIN AZIZ', 334543, 'aemy@uitm.edu.my', '334543', '2824'),
(21, 'AHMAD NAWAWI  HJ. YAAKOB (PROF. MADYA)', 120414, 'ahmad414@uitm.edu.my', '120414', '2187'),
(22, 'KHADIJAH AMIRA BINTI ABDUL RASHID', 375735, 'amirarashid@uitm.edu.my', '375735', '2781'),
(23, 'MAHASIN BINTI SAJA @ MAERAJ', 288220, 'mahas220@uitm.edu.my', '288220', '2295'),
(24, 'MOHAMAD ZAIM BIN ISAMAIL (DR)', 346638, 'mohamadzaim@uitm.edu.my', '346638', '2152'),
(25, 'MOHAMAD ZAKI BIN RAZALY', 270694, 'moham694@uitm.edu.my', '270694', '2185'),
(26, 'MOHD ASYADI BIN REDZUAN', 254131, 'mohda131@uitm.edu.my', '254131', '2185'),
(27, 'MOHD ZAINODIN BIN MUSTAFFA', 255334, 'mohdz334@uitm.edu.my', '255334', '2345'),
(28, 'MUNIRAH BINTI ZAKARIA', 278188, 'munirah188@uitm.edu.my', '278188', '2086'),
(29, 'NAJIHAH BINTI MUHAMMAD', 90036204, 'najihah0405@uitm.edu.my', '90036204', '2777'),
(30, 'NAZRUDIN BIN HASHIM', 147109, 'nazrudin@uitm.edu.my', '147109', '2090'),
(31, 'NORIZAN BINTI OTHMAN', 132127, 'noriz127@uitm.edu.my', '132127', '2172'),
(32, 'NURFARHANA BTE MOHD DAUD', 318970, 'nurfarhana0953@uitm.edu.my', '318970', '2741'),
(33, 'NURUL BADRIYAH BINTI ALI (DR)', 346573, 'nurulbadriyah@uitm.edu.my', '346573', '2768'),
(34, 'SITI HANISAH BINTI MOHD AMIN', 90013854, 'sitih854@uitm.edu.my', '90013854', '2768'),
(35, 'SITI NOOR AIN BINTI AZIZ', 326179, 'sitin308@uitm.edu.my', '326179', '2777'),
(36, 'SYAZWANI BINTI ABD RAHIM (DR)', 349224, 'syazwanirahim@uitm.edu.my', '349224', '2765'),
(37, 'ZALUDDIN BIN SULAIMAN (PROF. MADYA / HAJI)', 115157, 'zaluddin@uitm.edu.my', '115157', '2782'),
(38, 'ABD RAHMAN BIN JAMAAN', 232564, 'abdra564@uitm.edu.my', '232564', '2174'),
(39, 'AINUL ADIBA BINTI SALEH', 368904, 'ainuladiba@uitm.edu.my', '368904', '2767'),
(40, 'CHOO KIM FONG', 370471, 'kimfong@uitm.edu.my', '370471', '2104'),
(41, 'DEEPAK SINGH A/L RATAN SINGH', 177205, 'deepa205@uitm.edu.my', '177205', '2181'),
(42, 'DERWINA BINTI DAUD', 163293, 'derwi293@uitm.edu.my', '163293', '2259'),
(43, 'DIA WIDYAWATI BINTI AMAT', 286552, 'diawi188@uitm.edu.my', '286552', '2104'),
(44, 'DIANA BINTI OTHMAN', 326263, 'diana564@uitm.edu.my', '326263', '2322'),
(45, 'FARHANA BINTI IDRIS', 212885, 'farha420@uitm.edu.my', '212885', '2109'),
(46, 'FAZDILAH BINTI MD. KASSIM', 219862, 'fazdi862@uitm.edu.my', '219862', '2036'),
(47, 'FIRZANAH ISMAHANI BINTI JOHARI', 90041931, 'firzanahjohari@uitm.edu.my', '90041931', '2176'),
(48, 'HANIZA BINTI SARIJARI', 270652, 'haniz652@uitm.edu.my', '270652', '2170'),
(49, 'HARYATI BINTI AHMAD', 142395, 'harya395@uitm.edu.my', '142395', '2178'),
(50, 'IRA SYAQIRA BINTI SUKIMIN', 353964, 'irasyaqira@uitm.edu.my', '353964', '2847'),
(51, 'MOHAMAD FAKHRUL AIMAN BIN ZULKIFLEE', 90038970, 'fakhrulaiman@uitm.edu.my', '90038970', '2770'),
(52, 'MOHD IZUAN BIN ISMAIL', 219875, 'mohdi875@uitm.edu.my', '219875', '2161'),
(53, 'MUHAMAD ROZMAN BIN ABDULLAH', 179342, 'muham342@uitm.edu.my', '179342', '2091'),
(54, 'MUNIRAH BINTI AZRAE', 221041, 'munir041@uitm.edu.my', '221041', '2179'),
(55, 'NAZHATULSHIMA BINTI NOLAN', 180218, 'nazhatulshima.nolan@uitm.edu.my', '180218', '2051'),
(56, 'NORHAFIZAH BINTI AMIR', 354002, 'norhafizah.amir@uitm.edu.my', '354002', '2851'),
(57, 'NORIAH BINTI ISMAIL (PROF. MADYA DR)', 179135, 'noriah135@uitm.edu.my', '179135', '2783'),
(58, 'NORIDAH BINTI SAIN (DR)', 245726, 'noridahs@uitm.edu.my', '245726', '2166'),
(59, 'NORMALA BINTI SULAIMAN (DR)', 308553, 'norma553@uitm.edu.my', '308553', '2316'),
(60, 'NUR FADZILAH BINTI MUHAMAD ZAMANI', 352978, 'nurfadzilahzamani@uitm.edu.my', '352978', '2238'),
(61, 'NUR FARAHAYU IZZATI BINTI MOHD RUHANI', 90039240, 'nurfarahayu@uitm.edu.my', '90039240', '2176'),
(62, 'NUR SHERINA BINTI ZAINAL ABIDIN', 352981, 'nursherina@uitm.edu.my', '352981', '2238'),
(63, 'NURSHAMIRA AFIQAH BINTI MOHD SHAMSURI', 90042375, '2021962727@student.uitm.edu.my', '90042375', '2772'),
(64, 'PUTERI NUR HIDAYAH BINTI KAMALUDIN', 286523, 'puteri523@uitm.edu.my', '286523', '2195'),
(65, 'RAFIAAH BINTI ABU', 143844, 'rafia844@uitm.edu.my', '143844', '2177'),
(66, 'SHAHIRA BINTI ADAM', 357708, 'shahiraadam@uitm.edu.my', '357708', '2823'),
(67, 'SITI FATIMAH BINTI MOHAMAD RADZI', 352363, 'sitifatimahradzi@uitm.edu.my', '352363', ''),
(68, 'SITI ZARIKH SOFIAH BT ABU BAKAR', 292083, 'sitiz148@uitm.edu.my', '292083', '2284'),
(69, 'SOFWAH BINTI MD.NAWI', 343314, 'sofwah@uitm.edu.my', '343314', '2195'),
(70, 'SUHAILI BINTI MOHD YUSOF', 340579, 'suhailiyusof@uitm.edu.my', '340579', '2164'),
(71, 'SUSANNA BITHIAH VARMA A/P RAJA RAVI VARMA', 356026, 'susannavarma@uitm.edu.my', '356026', '2775'),
(72, 'SYAZALI EFFENDI BIN A.WAHAB', 155793, 'syaza793@uitm.edu.my', '155793', '2031'),
(73, 'TOH LING LING', 183273, 'tlglg273@uitm.edu.my', '183273', '2175'),
(74, 'ZAIRA BINTI MOHD. NOR (HAJJAH)', 138529, 'zaira529@uitm.edu.my', '138529', '2184'),
(75, 'ZARINA BINTI RAZLAN', 251260, 'zarina1260@uitm.edu.my', '251260', '2102'),
(76, 'ZURAIDAH BINTI SUMERY', 263012, 'zurai012@uitm.edu.my', '263012', '2188'),
(77, 'AHMAD MARZUKI AMIRUDDIN BIN OTHMAN', 186801, 'Berpindah kampus', '186801', '2816'),
(78, 'ALIA SOFEA BINTI SA\'DON', 90042555, 'aliasofea@uitm.edu.my', '90042555', '2772'),
(79, 'ARYANI BINTI ABDULLAH (DATIN)', 150248, 'aryan248@uitm.edu.my', '150248', '2182'),
(80, 'EMELIN BINTI ABDUL WAHID', 169459, 'emeli459@uitm.edu.my', '169459', '2482'),
(81, 'FATIMAH BINTI HASHIM', 214427, 'fatim427@uitm.edu.my', '214427', '2105'),
(82, 'FATIN NABIHAH BINTI MOHD TAHA', 368878, 'fatinnabihah@uitm.edu.my', '368878', '2853'),
(83, 'FAZRUL HANIM BINTI ABD SATA', 269715, 'fazrulhanim@uitm.edu.my', '269715', '2190'),
(84, 'FILOUZ BIN HASHIM', 285032, 'filou032@uitm.edu.my', '285032', '2811'),
(85, 'HENNY HAZLIZA BINTI MOHD TAHIR', 232030, 'henny030@uitm.edu.my', '232030', '2271'),
(86, 'IFFAH HANANI BINTI AZMAN', 90042453, 'iffahhanani@uitm.edu.my', '90042453', '2850'),
(87, 'JUYATI BINTI MOHD. AMIN', 155777, 'juyati777@uitm.edu.my', '155777', '2192'),
(88, 'MAS ERVINA BINTI SAMSUDDIN (DR)', 221313, 'maser313@uitm.edu.my', '221313', '2180'),
(89, 'MOHAMAD HAFIZ BIN ROSLI', 355991, 'hafizrosli@uitm.edu.my', '355991', '2092'),
(90, 'MOHD HALIM BIN KADRI (PROF. MADYA DR)', 142528, 'mhalim@uitm.edu.my', '142528', '2094'),
(91, 'MUHAMAD ASHAARI BIN SUKAR', 311964, 'muham964@uitm.edu.my', '311964', '2082'),
(92, 'MUSMAILINA BINTI MUSTAFA KAMAL', 182504, 'musmailina@uitm.edu.my', '182504', '2098'),
(93, 'NIK NUR FARAHIYAH BINTI NIK ASNI', 90041856, 'farahiyah@uitm.edu.my', '90041856', '2851'),
(94, 'NINI SUHANA MASTINI BINTI RAZI', 151726, 'ninisuhana@uitm.edu.my', '151726', '2099'),
(95, 'NOOR HIDAYAH BINTI AB AZIZ', 285469, 'noorh469@uitm.edu.my', '285469', '2321'),
(96, 'NOR HAFIZAH BINTI ABD MANSOR (DR)', 191058, 'norha058@uitm.edu.my', '191058', '2038'),
(97, 'NORAIZAH BINTI ABU BAKAR (DR)', 136738, 'norai738@uitm.edu.my', '136738', '2763'),
(98, 'NORFIZAH BINTI OTHMAN', 126094, 'norfi094@uitm.edu.my', '126094', '2103'),
(99, 'NORHIDAYAH BINTI ABDULLAH', 269498, 'norhi498@uitm.edu.my', '269498', '2183'),
(100, 'NUR EYLIAWATI BINTI JAPELUS', 342179, 'eyliawati@uitm.edu.my', '342179', '2097'),
(101, 'NUR FAIZAH BINTI MAT JABAR', 861058, 'nurfa061@uitm.edu.my', '861058', '2749'),
(102, 'NURUL AZLIN BINTI AZMI (DR)', 277516, 'nurul516@uitm.edu.my', '277516', '2165'),
(103, 'RAHIMAH BINTI MOHAMED YUNOS (PROF. MADYA DR)', 148221, 'rahim221@uitm.edu.my', '148221', '2733'),
(104, 'RAJA ADZRIN BINTI RAJA AHMAD (PROF. MADYA DR)', 173814, 'adzrin75@uitm.edu.my', '173814', '2732'),
(105, 'ROSMAWATI BINTI HARON (DR)', 246741, 'rosma741@uitm.edu.my', '246741', '2329'),
(106, 'SAUNAH BINTI ZAINON (PROF. MADRA DR)', 129509, 'sauna509@uitm.edu.my', '129509', '2084'),
(107, 'SITI MASNAH BINTI SARINGAT (DR)', 218067, 'sitima067@uitm.edu.my', '218067', '2088'),
(108, 'SITI RAHAYU BINTI SARMAN', 214032, 'sitir032@uitm.edu.my', '214032', '2108'),
(109, 'SITI SALIMAH BINTI JALAL', 356398, 'salimahjalal@uitm.edu.my', '356398', '2100'),
(110, 'SYAHRUL AHMAR BIN AHMAD (PROF. MADYA DR)', 182591, 'syahrul.ahmar@uitm.edu.my', '182591', '2734'),
(111, 'SYED KHUSAIRI BIN TUAN AZAM', 310460, 'syedk460@uitm.edu.my', '310460', '2371'),
(112, 'ZARINA BINTI ABU BAKAR', 214524, 'zarin524@uitm.edu.my', '214524', '2163'),
(113, 'AFLAH BT ISA @ DARAMI', 308171, 'aflah171@uitm.edu.my', '308171', '2741'),
(114, 'AHMAD SYAHMI BIN AHMAD FADZIL (DR)', 353951, 'syahmifadzil@uitm.edu.my', '353951', '2789'),
(115, 'AIDAROHANI BINTI SAMSUDIN', 274551, 'aidar551@uitm.edu.my', '274551', '2258'),
(116, 'AINOL MARDHIYAH BINTI RAHMAT', 376695, 'dhiyarahmat@uitm.edu.my', '376695', '2765'),
(117, 'AKMAL AINI BINTI OTHMAN (PROF. MADYA DR.)', 152123, 'akmal123@uitm.edu.my', '152123', '2115'),
(118, 'AMIR IMRAN BIN ZAINODDIN (DR)', 355933, 'amirimran@uitm.edu.my', '355933', '2789'),
(119, 'AZILA BINTI JAINI (DR)', 356437, 'azilajaini@uitm.edu.my', '356437', '2753'),
(120, 'AZMAN BIN ALI @ SAIP', 155557, 'azman557@uitm.edu.my', '155557', '2035'),
(121, 'BASARUDDIN SHAH BIN BASRI (DR)', 176264, 'basar264@uitm.edu.my', '176264', '2738'),
(122, 'BAZRI BIN ABU BAKAR', 152136, 'bazri136@uitm.edu.my', '152136', '2787'),
(123, 'CHE FARIDAH BINTI CHE MAHMOOD', 126104, 'cfcm104@uitm.edu.my', '126104', '2127'),
(124, 'CHE KHALILAH BINTI MAHMOOD', 323017, 'chekh121@uitm.edu.my', '323017', '2754'),
(125, 'DIANA\' BINTI MAZAN', 245564, 'diana481@uitm.edu.my', '245564', '2295'),
(126, 'FARIDAH NAJUNA BINTI MISMAN (DR)', 190978, 'farid978@uitm.edu.my', '190978', '2739'),
(127, 'FARIZAH BINTI MAMAT@MOHD NOR', 272676, 'fariz676@uitm.edu.my', '272676', '2162'),
(128, 'FATIN FARAZH BINTI YA\'ACOB  (DR)', 346654, 'fatinfarazh@uitm.edu.my', '346654', '2850'),
(129, 'FERRI BIN NASRUL', 329244, 'ferri@uitm.edu.my', '329244', '2137'),
(130, 'HAFIZUDDIN BIN MD. DALI', 368852, 'hafizuddindali@uitm.edu.my', '368852', '2834'),
(131, 'HAIRIANI BINTI ABDUL HAMID', 262327, 'hairi327@uitm.edu.my', '262327', '2167'),
(132, 'HUSNIZAM HOSIN', 329231, 'husni455@uitm.edu.my', '329231', '2135'),
(133, 'IRWAN BIN ISMAIL', 277134, 'irwanismail@uitm.edu.my', '277134', '2235'),
(134, 'JANNAH MUNIRAH BT. MOHD NOOR', 281748, 'jannah653@uitm.edu.my', '281748', '2839'),
(135, 'JULIANA BINTI MOHAMED ABDUL KADIR (DR)', 232593, 'julia593@uitm.edu.my', '232593', '2736'),
(136, 'KAMAL FAHRULRAZI BIN RAHIM', 209791, 'kamal791@uitm.edu.my', '209791', '2836'),
(137, 'KAMEL TAUFIQ BIN ABDUL GHANI (PROF. MADYA/ HAJI)', 117375, 'kamel375@uitm.edu.my', '117375', '2146'),
(138, 'KHAIRUNNISA BINTI RAHMAN', 262330, 'khair330@uitm.edu.my', '262330', '2083'),
(139, 'KHARUDIN BIN MOHD SALI @ SALLEH', 138037, 'kharu037@uitm.edu.my', '138037', '2328'),
(140, 'MAIZURA BINTI MOHD ISA (DR)', 222493, 'maizu493@uitm.edu.my', '222493', '2133'),
(141, 'MARDZIYANA BINTI MOHAMAD MALOM', 208307, 'mardz307@uitm.edu.my', '208307', '2829'),
(142, 'MAZIDA  BINTI ISMAIL', 232933, 'mazid933@uitm.edu.my', '232933', '2355'),
(143, 'MAZLINA BINTI ISMAIL', 268499, 'mazli499@uitm.edu.my', '268499', '2116'),
(144, 'MOHAMAD AZWAN BIN MD. ISA', 250821, 'moham821@uitm.edu.my', '250821', '2248'),
(145, 'MOHAMAD FAIZAL BIN RAMLI (DR)', 346683, 'faizalramli@uitm.edu.my', '346683', '2772'),
(146, 'MOHD AZIM BIN SARDAN', 256252, 'mohda252@uitm.edu.my', '256252', '2118'),
(147, 'MOHD HAKIMI BIN HARMAN', 318543, 'mohdh245@uitm.edu.my', '318543', '2832'),
(148, 'MOHD KHAIRUL ARIFF BIN NOH', 249890, 'ariff890@uitm.edu.my', '249890', '2143'),
(149, 'MUHAMAD ADDIN BIN BURHANUDDIN', 288576, 'addin576@uitm.edu.my', '288576', '2039'),
(150, 'MUHAMAD KHODRI BIN KHOLIB JATI', 293338, 'khodri338@uitm.edu.my', '293338', '2158'),
(151, 'MUHAMMAD BIN MAJID (DR)', 346696, 'muhdmajid@uitm.edu.my', '346696', '2772'),
(152, 'MUHAMMAD HARIS NAQIUDDIN BIN MUDA', 376763, 'harisnaqiuddin@uitm.edu.my', '376763', '2085'),
(153, 'MUHARRATUL SHARIFAH BINTI SHAIK ALAUDEEN', 267416, 'muharr416@uitm.edu.my', '267416', '2101'),
(154, 'MURUGA A/L CHINNIAH', 222480, 'murug480@uitm.edu.my', '222480', '2159'),
(155, 'NADIA NURUL NAJWA MOHMAD HASSAN', 266666, 'nadia666@uitm.edu.my', '266666', '2189'),
(156, 'NAZIHAH BINTI OMAR', 207573, 'nazih573@uitm.edu.my', '207573', '2372'),
(157, 'NIK NUR SHAFIKA BINTI MUSTAFA', 321475, 'niknu518@uitm.edu.my', '321475', '2841'),
(158, 'NOR AZAIRIAH FATIMAH BINTI OTHMAN (DR)', 357591, 'norazairiah@uitm.edu.my', '357591', '2823'),
(159, 'NOR HADALIZA BINTI ABD RAHMAN', 137313, 'hadaliza@uitm.edu.my', '137313', '2822'),
(160, 'NOR HAZILA BINTI ISMAIL (DR)', 190884, 'norha884@uitm.edu.my', '190884', '2145'),
(161, 'NORASHIKIN BINTI ISMAIL (DR)', 165479, 'noras479@uitm.edu.my', '165479', '2730'),
(162, 'NOREEN NOOR BINTI ABD AZIZ (DR)', 220974, 'noree974@uitm.edu.my', '220974', '2318'),
(163, 'NORFARIZA BINTI MOHD ALI', 214456, 'norfa456@uitm.edu.my', '214456', '2378'),
(164, 'NORHASNIZA MOHD HASAN ABDULLAH', 272702, 'norhasniza702@uitm.edu.my', '272702', '2326'),
(165, 'NORLINA BINTI M. ALI', 251846, 'norli846@uitm.edu.my', '251846', '2265'),
(166, 'NORSHAHNIZA BINTI SAHARI (DR)', 253239, 'norsh239@uitm.edu.my', '253239', '2139'),
(167, 'NUR ADILAH BINTI SAUD', 218106, 'nurad106@uitm.edu.my', '218106', '2275'),
(168, 'NUR AMALINA BINTI AZIZ (DR)', 353883, 'amalinaaziz@uitm.edu.my', '353883', '2756'),
(169, 'NUR FATIHAH BINTI SHAARI (DR)', 356068, 'fatihahshaari@uitm.edu.my', '356068', '2781'),
(170, 'NUR HANISAH BINTI MOHAMAD RAZALI (DR)', 368881, 'hanisahmr@uitm.edu.my', '368881', '2830'),
(171, 'NUR LIYANA BINTI MOHAMED YOUSOP', 268473, 'nurliyana@uitm.edu.my', '268473', '2125'),
(172, 'NUR RIFHAN BINTI A. RAHIM (DR)', 368797, 'rifhan@uitm.edu.my', '368797', '2764'),
(173, 'NURUL AIEN BINTI ABD AZIZ', 321488, 'nurul106@uitm.edu.my', '321488', '2160'),
(174, 'NURUL FAHANA AINI BINTI HARUN (DR)', 288259, 'fahana_aini@uitm.edu.my', '288259', '2095'),
(175, 'NURUL HAIDA BINTI JOHAN', 233042, 'nurul042@uitm.edu.my', '233042', '2150'),
(176, 'NURULASHIKIN BINTI ROMLI', 290276, 'nurulashikin@uitm.edu.my', '290276', '2751'),
(177, 'OSWALD @ TIMOTHY EDWARD', 138765, 'oswald@uitm.edu.my', '138765', '2735'),
(178, 'RABIATUL ALAWIYAH BINTI ZAINAL ABIDIN', 156284, 'rabia284@uitm.edu.my', '156284', '2315'),
(179, 'ROHA BINTI MOHAMED NOAH', 255994, 'roham994@uitm.edu.my', '255994', '2121'),
(180, 'ROHANI BINTI JANGGA (HAJJAH)', 97107, 'rohan107@uitm.edu.my', '97107', '2138'),
(181, 'ROHANIZAN BINTI MD LAZAN', 280134, 'rohan134@uitm.edu.my', '280134', '2096'),
(182, 'ROS HASRI BIN HAJI AHMAD', 169446, 'rosha446@uitm.edu.my', '169446', '2131'),
(183, 'ROSMAH BINTI ABD GHANI @ ISMAIL', 269702, 'rosma702@uitm.edu.my', '269702', '2124'),
(184, 'RUDZA HANIM BINTI MOHAMED ANUAR', 184146, 'hanim146@uitm.edu.my', '184146', '2747'),
(185, 'RUZIAH BINTI A. LATIF', 252418, 'ruzia418@uitm.edu.my', '252418', '2135'),
(186, 'SHAFIEE BIN MD TARMUDI', 254128, 'shafi128@uitm.edu.my', '254128', '2289'),
(187, 'SHAHERAH BINTI ABD MALEK', 262314, 'shahe314@uitm.edu.my', '262314', '2327'),
(188, 'SHAHIRA BINTI ABDUL JABAR', 317997, 'shahi997@uitm.edu.my', '317997', '2144'),
(189, 'SHAHRINIZAM BIN MANSHOR @MANSOR', 273633, 'shahr633@uitm.edu.my', '273633', '2314'),
(190, 'SHARAZAD BINTI HARIS', 277448, 'sharazad@uitm.edu.my', '277448', '2266'),
(191, 'SITI FARRAH BINTI SHAHWIR', 260057, 'sitif057@uitm.edu.my', '260057', '2287'),
(192, 'SITI NOORHASLINA BINTI ABD HALIM', 368771, 'snhaslina@uitm.edu.my', '368771', '2774'),
(193, 'SITI NORDIYANA BINTI ISAHAK', 268486, 'sitin486@uitm.edu.my', '268486', '2336'),
(194, 'SUHAIDI BIN ELIAS @ALIAS (DR/ HAJI)', 146427, 'suhaidi27@uitm.edu.my', '146427', '2757'),
(195, 'SUZANA BINTI HASSAN', 287218, 'suzan218@uitm.edu.my', '287218', '2117'),
(196, 'SYAIDATUL ZARINA BINTI MAT DIN', 165725, 'sasai2003@uitm.edu.my', '165725', '2129'),
(197, 'SYAMSYUL BIN  SAMSUDIN', 199681, 'syam681@uitm.edu.my', '199681', '2820'),
(198, 'TAN YAN LING (DR)', 222163, 'tanya163@uitm.edu.my', '222163', '2269'),
(199, 'TAY BEE HOONG', 212869, 'taybe869@uitm.edu.my', '212869', '2169'),
(200, 'WAN HASLIN AZIAH BTE WAN HASSAN', 173623, 'wanha623@uitm.edu.my', '173623', '2140'),
(201, 'WAN MOHD FARID BIN WAN ZAKARIA', 302096, 'wmfwz@uitm.edu.my', '302096', '2153'),
(202, 'YUSLIZAWATI BINTI MOHD YUSOFF', 199908, 'yusli908@uitm.edu.my', '199908', '2737'),
(203, 'ZAIBEDAH BINTI ZAHARUM', 255101, 'zaibe101@uitm.edu.my', '255101', '2134'),
(204, 'ZANARIAH BINTI ABDUL RAHMAN', 170561, 'zanariah633@uitm.edu.my', '170561', '2130'),
(205, 'ZARITH SOFIA BINTI JASMI (DR)', 369330, 'zarithsofia@uitm.edu.my', '369330', '2764'),
(206, 'ZURAIDAH BINTI AHMAD', 262792, 'zurai692@uitm.edu.my', '262792', '2089'),
(207, 'ZURAIDAH BINTI SIPON', 234973, 'zurai973@uitm.edu.my', '234973', '2055'),
(208, 'ZURINA BINTI OMAR', 221300, 'zurin300@uitm.edu.my', '221300', '2114'),
(209, 'AHMAD FUZI BIN MD. AJIS (DR)', 293396, 'ahmadfuzi@uitm.edu.my', '293396', '2770'),
(210, 'AZURA BINTI ABDUL JAMIL @ KAMARUDZZAMAN', 168447, 'azura447@uitm.edu.my', '168447', '2157'),
(211, 'FATEN ELINA BINTI KAMARUDDIN', 368784, 'fatenelina@uitm.edu.my', '368784', '2830'),
(212, 'ISMA BIN ISHAK', 253242, 'ismai242@uitm.edu.my', '253242', '2745'),
(213, 'MUHAMMAD ASYRAF BIN WAHI ANUAR', 286853, 'muham6853@uitm.edu.my', '286853', '2158'),
(214, 'NOR DIANA BINTI ABD RAHMAN', 131513, 'nordi513@uitm.edu.my', '131513', '2324'),
(215, 'NOR RASHIDAH BINTI MOHAMED', 185734, 'norra734@uitm.edu.my', '185734', '2752'),
(216, 'NURHAFIZAH BT AZIZAN', 278175, 'nurha175@uitm.edu.my', '278175', '2746'),
(217, 'NURUL HUDA BINTI MD YATIM (DR)', 293082, 'nurul082@uitm.edu.my', '293082', '2087'),
(218, 'QAMARUL NAZRIN BIN HARUN', 355085, 'qamarulnazrin@uitm.edu.my', '355085', '2291'),
(219, 'RABIATUL ADAWIYAH KAMARULZAMAN', 210418, 'rabia418@uitm.edu.my', '210418', '2743'),
(220, 'ROHAYU BINTI AHMAD', 254555, 'rohay555@uitm.edu.my', '254555', '2748'),
(221, 'SITI HAJAR BINTI BAHARIN', 288903, 'hajar903@uitm.edu.my', '288903', '2778'),
(222, 'SITI NOORSIAH BINTI JAMALUDIN', 286866, 'sitin866@uitm.edu.my', '286866', '2740'),
(223, 'SITI NUUR-ILA BINTI MAT KAMAL (DR)', 268509, 'sitin509@uitm.edu.my', '268509', '2151'),
(224, 'SUHAILA BINTI OSMAN', 271208, 'suhai208@uitm.edu.my', '271208', '2750'),
(225, 'ABD. MALIK BIN MOHD RICK', 251817, 'malikrick@uitm.edu.my', '251817', '2119'),
(226, 'AHMAD FAIZ BIN GHAZALI (Ts. DR)', 346612, 'faizghazali@uitm.edu.my', '346612', '2784'),
(227, 'AHMAD KAMALRULZAMAN BIN OTHMAN (Ts)', 153177, 'ahmad177@uitm.edu.my', '153177', '2319'),
(228, 'AZLINA BINTI JUMADI', 278201, 'azlina201@uitm.edu.my', '278201', '2032'),
(229, 'BASRI BIN BADYALINA (DR)', 347161, 'basribdy@uitm.edu.my', '347161', '2784'),
(230, 'CT MUNNIRAH NIESHA BINTI MOHD SHAFEE', 329273, 'ctmun518@uitm.edu.my', '329273', '2753'),
(231, 'FARAH SURAYA BINTI MD. NASRUDIN', 291453, 'farah53@uitm.edu.my', '291453', '2755'),
(232, 'HASLENDA BINTI YUSOP', 253381, 'haslenda381@uitm.edu.my', '253381', '2148'),
(233, 'KERK LEE CHANG (DR)', 346667, 'kerkleechang@uitm.edu.my', '346667', '2831'),
(234, 'LAU GEE CHOON (DR)', 184065, 'laugc@uitm.edu.my', '184065', '2154'),
(235, 'MASYFU\'AH BINTI MOKHTAR', 264037, 'masyf037@uitm.edu.my', '264037', '2132'),
(236, 'MAZLYDA BINTI ABD RAHMAN', 210971, 'mazly971@uitm.edu.my', '210971', '2029'),
(237, 'MOHD HAFIZAN BIN MUSA', 327233, 'mohdh233@uitm.edu.my', '327233', '2200'),
(238, 'MOHD HANAFI BIN AZMAN ONG', 331818, 'napieong@uitm.edu.my', '331818', '2766'),
(239, 'MOHD LEZAM BIN LEHAT', 265489, 'mohdlezam@uitm.edu.my', '265489', '2186'),
(240, 'MUHAMMAD YASSAR BIN YUSRI', 326247, 'muham449@uitm.edu.my', '326247', '2766'),
(241, 'MUHAMMAD ZULQARNAIN HAKIM BIN ABD JALAL', 356071, 'zulqarnainhakim@uitm.edu.my', '356071', '2824'),
(242, 'NAFISAH BINTI JAMINGAN @ AMIN', 237200, 'nafis200@uitm.edu.my', '237200', '2256'),
(243, 'NAJWA BINTI ABD GHAFAR', 329260, 'najwa923@uitm.edu.my', '329260', '2762'),
(244, 'NIK INTAN SYAHIDDATUL ILANI BINTI JAILANI', 90043536, 'syahiddatul@uitm.edu.my', '90043536', '2785'),
(245, 'NOOR AZRIN BINTI ZAINUDDIN', 127909, 'noora909@uitm.edu.my', '127909', '2819'),
(246, 'NOOR SYAZANA BINTI NGARISAN', 280781, 'syazana@uitm.edu.my', '280781', '2337'),
(247, 'NOR FAUZIAH BINTI ABU BAKAR ', 302643, 'norfa643@uitm.edu.my', '302643', '2330'),
(248, 'NOR HIDAYAH BINTI HASHIM', 330958, 'hidayah@uitm.edu.my', '330958', '2762'),
(249, 'NOR SITI KHADIJAH ARUNAH', 329257, 'norsi830@uitm.edu.my', '329257', '2773'),
(250, 'NORAISYAH BINTI ABDL AZIZ', 222477, 'norai477@uitm.edu.my', '222477', '2357'),
(251, 'NORAZAM BIN ARBIN (DR)', 196574, 'noraz574@uitm.edu.my', '196574', '2742'),
(252, 'NUR AFIQAH BINTI AZHAM', 90043599, 'afiqahazham@uitm.edu.my', '90043599', '2785'),
(253, 'NUR DIANA BINTI ZAMANI', 220958, 'nurdi958@uitm.edu.my', '220958', '2285'),
(254, 'NUR HUDA BINTI JAAFAR (Ts. DR)', 208378, 'nurhu378@uitm.edu.my', '208378', '2846'),
(255, 'NUR SYAFIKAH BINTI IBRAHIM', 332914, 'nursyafikah@uitm.edu.my', '332914', '2779'),
(256, 'NUR SYAHIDAH BINTI NORDIN', 269980, 'nsyahidahnordin@uitm.edu.my', '269980', '2132'),
(257, 'NURFARHANA BINTI HASSAN (DR)', 365415, 'farhanahassan@uitm.edu.my', '365415', '2774'),
(258, 'NURKHAIRANY AMYRA BINTI MOKHTAR (DR)', 346670, 'nurkhairany@uitm.edu.my', '346670', '2155'),
(259, 'NURUL \'AINI BINTI HARUN (DR)', 339195, 'ainiharun@uitm.edu.my', '339195', '2337'),
(260, 'NURULZULAIHA BINTI SA\'UDAH@SUHADAK', 212872, 'nurulzulaiha@uitm.edu.my', '212872', '2123'),
(261, 'P. SIVA SHAMALA A/P PALANIAPPAN (DR)', 346586, 'shamalap@uitm.edu.my', '346586', '2325'),
(262, 'RASHIDAH BINTI MOKHTAR (Ts. DR)', 208271, 'rashi271@uitm.edu.my', '208271', '2837'),
(263, 'RUSNANI MOHAMAD KHALID', 326250, 'rusna162@uitm.edu.my', '326250', '2842'),
(264, 'SAFURA ADEELA BINTI SUKIMAN', 229085, 'safur185@uitm.edu.my', '229085', '2198'),
(265, 'SHAFARUNIZA BINTI MAHADI (DR)', 291615, 'shafa669@uitm.edu.my', '291615', '2755'),
(266, 'SHAMSATUN NAHAR BINTI AHMAD (DR)', 232551, 'shams551@uitm.edu.my', '232551', '2771'),
(267, 'SITI AFIQAH BINTI MOHAMMAD (DR)', 345781, 'sitiafiqah@uitm.edu.my', '345781', '2112'),
(268, 'SITI FATIMAH NOR BINTI AB WAHAB', 90032364, 'fatimahnor@uitm.edu.my', '90032364', '2837'),
(269, 'SITI HASMA HAJAR BINTI MAT ZIN', 365253, 'hasmahajar@uitm.edu.my', '365253', '2835'),
(270, 'SUHANAH BINTI ROSNAN', 331009, 'suhan009@uitm.edu.my', '331009', '2835'),
(271, 'WAN NOR HAFIDZAH BINTI WAN MOHD', 322995, 'wanno995@uitm.edu.my', '322995', '2744'),
(272, 'YUSNITA BINTI SOKMAN', 156996, 'yusni996@uitm.edu.my', '156996', '2142'),
(273, 'ZURIATI BINTI ISMAIL @ KHORI', 166986, 'zuria986@uitm.edu.my', '166986', '2779'),
(274, 'ALIZAH BINTI ALI', 224941, 'aliza941@uitm.edu.my', '224941', '2197'),
(275, 'NORAINI BINTI ISMAIL', 170257, 'norai257@uitm.edu.my', '170257', '2335'),
(276, 'NORINTAN BINTI WAHAB', 243210, 'norin210@uitm.edu.my', '243210', '2316'),
(277, 'RAHMAWATI BINTI MOHD YUSOFF (DR)', 346599, 'rahmawatimy@uitm.edu.my', '346599', '2196'),
(278, 'ROSNANI BINTI MOHD SALLEH', 223243, 'rosna243@uitm.edu.my', '223243', '2120'),
(279, 'SITI MARIAM BINTI ATAN', 243223, 'sitim223@uitm.edu.my', '243223', '2320'),
(280, 'WAN AMIR AZLAN BIN WAN HANIFF (DR)', 353977, 'wamirazlan@uitm.edu.my', '353977', '2776'),
(281, 'ZULHAZMI BIN YUSOF', 353980, 'zulhazmi@uitm.edu.my', '353980', '2776'),
(282, 'ZURAMAZNUM BINTI SAINAN', 138778, 'zuram778@uitm.edu.my', '138778', '2201'),
(283, 'Pensyarah 1', 111000, 'p1@gmail.com', '111', '0123456789');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `program_id` int(100) NOT NULL,
  `program_code` varchar(70) NOT NULL,
  `program_name` varchar(70) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`program_id`, `program_code`, `program_name`, `faculty_id`) VALUES
(1, 'ACC110', 'Diploma Perakaunan ', 1),
(2, 'ACC220', 'Sarjana Muda Perakaunan (Kepujian)', 1),
(3, 'BA111', 'Diploma Pengajian Perniagaan', 4),
(4, 'BA114', 'Diploma Analisis Pelaburan', 4),
(5, 'BA119', 'Diploma Pengajian Perbankan', 4),
(6, 'BA240', 'Sarjana Muda Pentadbiran Perniagaan (Kepujian) Pemasaran', 4),
(7, 'BA242', 'Sarjana Muda Pentadbiran Perniagaan (Kepujiaan) Kewangan', 4),
(8, 'BA249', 'Sarjana Muda Pentadbiran Perniagaan (Kepujian) Perbankan Islam', 4),
(9, 'BA251', 'Sarjana Muda Pentadbiran Perniagaan (Kepujian) Pengurusan Pelaburan', 4),
(10, 'BA252', 'Sarjana Muda Pemasaran Digital (Kepujian)', 4),
(11, 'CDCS110', 'Diploma Sains Komputer', 5),
(12, 'CDCS143', 'Diploma Sains Matematik', 5),
(13, 'CDIM110', 'Diploma Pengurusan Maklumat', 5),
(14, 'CD1M261', 'Sarjana Muda Sains Maklumat (Kepujian) Pengurusan Rekod ', 5),
(15, 'LG120', 'Diploma Bahasa Inggeris Komunikasi Profesional', 2),
(16, 'IC220', 'Sarjana Muda Pengurusan Industri Halal (Kepujian)', 3);

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
(17, 'SITI NUR ANIS SURAYA BINTI MD SAMIRI', '010512010800', 'niesurayaa@gmail.com', '111', 2022793633, 5, '01159577361', '0111104761456', 7, 4),
(27, 'Pelajar 1', '02083010156312', 's1@gmail.com', '111', 2020894394, 4, '01111047614', '', 11, 6),
(28, 'AHMAD MUSTA&#39;IN', '000727010067', 'mus@gmail.com', '111', 2020614182, 6, '0142701906', '', 11, 5),
(29, 'Pelajar 2', '23411231232', 's2@gmail.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 2020894394, 3, '01111047614', '0111104761456', 11, 5),
(30, 'MUHD MUQHARABBIN BIN KAMARULBARIN', '041209040179', '2022454508@student.uitm.edu.my', '1a75d88d3f976c13c139372327753c2b08619924', 2022454508, 2, '0199380081', '0136019197', 0, 0),
(31, 'PUTRA ZIKRULLAH BIN AHMAD REDZUAN', '040318080079', '2022459582@student.uitm.edu.my', 'e2bd4d6c8074b6f4d5bf0e43ac76b8135781ab12', 2022459582, 2, '01112980977', '0193694097', 0, 0),
(32, 'MUHAMMAD NAZIRUL MUALIF BIN AMAR ', '040219020783', '2022465162@student.uitm.edu.my', '0e63135f3f44d38a925a1f38d53791e723a8b097', 2022465162, 2, '0174308452', '', 0, 0),
(33, 'AHMAD ALIF QAYYIM BIN AHMAD MURAD', '040112100257', '2022450158@student.uitm.edu.my', 'b0b82d802fc2e47ec5fc4ea7650907cd144daf6b', 2022450158, 2, '0132003911', '0362616911', 0, 0),
(34, 'MUHAMMAD AIMAN BIN ZULKIFLI', '030809011511', '2021484516@student.uitm.edu.my', 'f56e7a5c3dd8dd4cd4f50fbd1a12955601c8ebd7', 2021484516, 4, '01121698698', '', 0, 0),
(35, 'MUHAMAD RIDZUAN BIN ABDUL MAJID', '031118010493', '2021896192@student.uitm.edu.my', 'b1d3fbf8e94fd12f1f71a9be960fd44d55d9c404', 2021896192, 4, '0172112408', '', 0, 0),
(36, 'AIRIL AZMAN BIN MD AZMANI SYAH', '040617010345', '2022468968@student.uitm.edu.my', 'd68f57a33ff13fd09121b33ee2373c3bef2caff4', 2022468968, 2, '0167522272', '-', 0, 0),
(37, 'MUHAMMAD IKMAL HAKIM BIN ZAIHANUDIN', '041015011345', '2022454116@student.uitm.edu.my', 'fdc994d084365ff3572940fef150e3db9db48e70', 2022454116, 2, '0137487515', '0167578362', 0, 0),
(38, 'NIK HASHRI QASHRI BIN NIK KHAIROL REZA', '040220030081', '2022465106@student.uitm.edu.my', '5250002607438b62a60c058b0137f9f650ed175d', 2022465106, 2, '0199396132', '', 0, 0),
(39, 'MUHAMMAD MUZHAFFAR ZAWIR', '040311120867', '2022802184@student.uitm.edu.my', '7e957d9933fff5a06e8b37d6e57a682bc121da9a', 2022802184, 2, '0192544350', '', 0, 0),
(40, 'NEILY EIZZA ARISSA BINTI FIRDAUS EFFENDY', '041231101556', '2022448938@student.uitm.edu.my', 'e3a777fa944688b6d1062353815b7aa211fc2bfd', 2022448938, 2, '0123913455', '', 0, 0),
(41, 'HURIL AIN IMAN BINTI MUHAMMAD AZMI', '040214080234', '2022458768@student.uitm.edu.my', '165d98ae0d0a4489983cfd361edc91e1fba3ad61', 2022458768, 2, '01165522929', '', 0, 0),
(42, 'NUR ADILAH INSYIRAH BINTI AZHAR', '041207100668', '2022460956@student.uitm.edu.my', 'c833ebf859e9ee88eb72f2c190b3baa5f74d6317', 2022460956, 2, '0193938907', '-', 0, 0),
(43, 'HALEEDA BINTI MOHAMAD SAUFI', '040926011122', '2022452158@student.uitm.edu.my', 'f4d8cdacad6fd22fbd275c5aa0796ea4c66be8dd', 2022452158, 2, '0177454311', '075988814', 0, 0),
(44, 'ANIS ZAHIRAH BINTI ZULKEFLY', '040331020644', '2022471732@student.uitm.edu.my', 'e9b7b86c8e353e09a0f1c95cc363c9e58e5bffb7', 2022471732, 2, '0194500644', '', 0, 0),
(45, 'IZZAH BINTI ABD HALIM', '040320011064', '2022459748@student.uitm.edu.my', '7a9400bbdd6da9dee00c307d654e5216caf79e22', 2022459748, 2, '0195326562', '-', 0, 0),
(46, 'SYAHIR AMMAR BIN MADAZAFAR', '040928140091', '2022895222@student.uitm.edu.my', '7f85b16bc17c1704d3173c2bdd91c3ad9eade904', 2022895222, 2, '0192300812', '', 0, 0),
(47, 'MUHAMAD AMIRUL IRWAN BIN ABU BAKAR', '040119100049', '2022450726@student.uitm.edu.my', '48ab03b87a6739be9ce356eb2ff7c6b122797006', 2022450726, 2, '01112832808', '-', 0, 0),
(48, 'NUR ALIA BINTI MOHD JANI', '010628010140', 'aliasahaja35@gmail.com', '5d6870f6d044fa9056fda9fba8bbc4fda0cd2880', 2022972739, 4, '0138864423', '062831050', 0, 0),
(49, 'MAIZATULMARDIAH BINTI ZAINI', '030419040130', '2021652142@student.uitm.edu.my', '98c3fd68ac586e80aa16f1175b9ca006e0526fa1', 2021652142, 4, '0107062447', '-', 0, 0),
(50, 'DIANAH AQILAH BINTI JAMASRI BAYOK @ JUMARDI', '031221120164', '2021687872@student.uitm.edu.my', '765f44749c2f8c68567718742d869169e6ca89f1', 2021687872, 4, '0106622604', '089885010', 0, 0),
(51, 'NAZIRA NATASHA BINTI KHAIRUL HISHAM', '030326050188', '2021687204@student.uitm.edu.my', '7241b569757eabfadfed4a0e5bee48c20f139785', 2021687204, 4, '0173091808', '', 0, 0),
(52, 'ANIS AWADAH BINTI ABDUL RAZAK', '030108010292', '2021213156@student.uitm.edu.my', '1a79bd9a52de8463c26984cd230b69f8de4c22b5', 2021213156, 4, '0172200399', '', 0, 0),
(53, 'YASMIN ELLYSHA BINTI KHAIRULNIZAM', '030831010048', '2021453592@student.uitm.edu.my', '5d3c3f3ea67e48012a4337907e95b03d57137250', 2021453592, 4, '01121219517', '-', 0, 0),
(54, 'ZAHIRA BINTI MOHD ZAKI', '030120040128', '2021202432@Sstudent.uitm.edu.my', '4b6b14f0fb3206da63cecd7a223e66f6c824a48e', 2021202432, 4, '0136612928', '', 0, 0),
(55, 'NUR ZAHIRAH BINTI AZMAN', '031011130428', '2021499908@student.uitm.edu.my', '91c7cfb3f26588f0107951d5fd7141e91002ac0a', 2021499908, 4, '01118987673', '', 0, 0),
(56, 'SHONNA JITE ANAK JOHN FRANCIS', '030213130982', 'shonnajite13@gmail.com', '681760a3e36d373b2316c67b8adae5a85a7d0f94', 2021215864, 4, '0169077794', '-', 0, 0),
(57, 'Julia Afiqah Binti Mohd Jaffar', '030310010122', '2021891506@student.uitm.edu.my', '34a7c308d2d18b608bca51dd043bec1176f5f7cb', 2021891506, 4, '0187611419', '', 0, 0),
(58, 'Nurul Natasya Syuhada bt Azman', '030517011456', '2021885554@student.uitm.edu.my', '990acdf41978d17c6652a7816693110d35c43aa9', 2021885554, 4, '01112756874', '-', 0, 0),
(59, 'DAMIA NATASYA QAIYISA', '031216140136', '2021885038@student.uitm.edu.my', '7120701540a63499b480b40a8ce14321405e0f20', 2021885038, 4, '0172540968', '', 0, 0),
(60, 'NUR HAZIRAH BINTI MOHAMED SALLEH', '030227011538', '2021210262@student.uitm.edu.my', '5559ab30a6f5245a955c2266354134af864e1ffa', 2021210262, 4, '01114648437', '-', 0, 0),
(61, 'NUR NAMEERA AYUMI BINTI MOHD FAKARUDDIN', '030403010762', '2021449536@student.uitm.edu.my', '30ea3e43d7cf1c21b6bf071a00df3486e762f3b4', 2021449536, 4, '0136209661', '0196239661', 0, 0),
(62, 'NAJWA SHAFIKA BINTI KHAIROL AZMAN', '020925081382', '2022369205@student.uitm.edu.my', '1142754fbe8d55cd961167e2d607cbef86b54d60', 2022369205, 3, '0174367649', '', 0, 0),
(63, 'MU&#39;AZ HIDAYAT BIN MIZRAWAN', '031215101725', 'muaz.hidayat03@gmail.com', 'b28b12d026502916fc0ec2c03fbb8eae4fcb87f4', 2022170467, 3, '0172696742', '-', 0, 0),
(64, 'NUREEN AMIERA AFIQA BINTI MAHATHIR', '020811030528', '2022935427@student.uitm.edu.my', '6c684ac70b34587d3091fa4ada0859756ca5621f', 2022935427, 3, '0193184990', '', 0, 0),
(65, 'NASRIN ZAFRINA BINTI ZULKIFLI ', '030204070420', '2022151185@STUDENT.UITM.EDU.MY', 'ff0508ca2a659eb243b22b9affde973f4a5e349d', 2022151185, 3, '0195726172', '-', 0, 0),
(66, 'FATINIE BINTI ABD HADI', '031223030752', '2022931041@student.uitm.edu.my', '44d6edcd00453d816a11c23855b927797b8a5f99', 2022931041, 3, '01129970383', '0139351499', 0, 0),
(67, 'NUR WARDINA SAFIYYAH BINTI MAT LIAS', '030807060328', '2021821734@student.uitm.edu.my', 'a58722e1c4ea1d6f6598bfa58bf1fa2a85d449a5', 2021821734, 4, '01110107202', '0199696836', 0, 0),
(68, 'NOR &#39;ASYIQAH BINTI ADNAN', '031029101094', 'asyiqahadnan@gmail.com', '5c90a168b494ec446e5bd9b1af0701213a66e5d9', 2021840404, 4, '0173825211', '0177325120', 0, 0),
(69, 'NUR ATIRAH BINTI ANUWA', '031030010990', '2021840412@student.uitm.edu.my', '044823d7f8b82e6d5640fb12d122b9c3d5e9b57f', 2021840412, 4, '0189105530', '01139157516', 0, 0),
(70, 'IZZA HAFIDZAH BINTI LUKMAN', '030130011574', '2021204616@student.uitm.edu.my', '3b12e49a1e5fe875a1265c5f153a279cbca2ef42', 2021204616, 4, '0199657099', '0199657099', 0, 0),
(71, 'MUHAMMAD SYAMIM MUZHAFAR BIN IZHAR', '030526050385', 'syamimmuzhafar@gmail.com', 'b9c48ef27c835dc3623b4374bf4b7cfde0beb710', 2021623972, 4, '01113080883', '0132979993', 0, 0),
(72, 'NUR ZARIFAH ADLIN BINTI ZAMRI', '030731020222', 'zarifahadlin14@gmail.com', '548856914dba1f2ab5fc82bd5e42c05c5dcdb742', 2021832466, 4, '0182704241', '0125022241', 0, 0),
(73, 'MOHAMAD AIMAN HAKIMI BIN HISHAM MUDIN', '031210080849', '2021625268@student.uitm.edu.my', 'b002c5e271fbd346456ed949c13c1bc826712fda', 2021625268, 4, '01136632425', '0124798324', 0, 0),
(74, 'DANISH FAZWAN BIN FAZALI', '031211140073', '2021652052@student.uitm.edu.my', '588ffa231804d8d18a0394f2c8f3b3b049c11894', 2021652052, 4, '01160553684', '0172366707', 0, 0),
(75, 'PUTERI ANIS SOFEA BINTI AHMAD TAUFIK', '030130060368', '2021814588@student.uitm.edu.my', 'd3b031080902b4b026ed44c4b42cb0d1347d8d65', 2021814588, 4, '0192066545', '', 0, 0),
(76, 'ASNOL KHAIRULZAKRY BIN AINIE', '031002131373', '2021838818@student.uitm.edu.my', 'e0c129ddd53417ba48e197963924333d57397e37', 2021838818, 4, '01136632524', '0163376161', 0, 0),
(77, 'MUHAMMAD AIMAN', '030111121217', '2021203084@student.uitm.edu.my', 'c2847366e4ebf93258a90d7f1c5c25095717e7e1', 2021203084, 4, '0196380079', '0128036005', 0, 0),
(78, 'SHAHIRA HAMIZA BINTI AZMAN', '031220140104', 'shahirahamizaa@gmail.com', '837cffc019012993da20e9b633d4ccc8d530036c', 2021819832, 4, '0129809706', '', 0, 0),
(79, 'AXEL OLIER RESA ANAK FRANCIS', '030217130373', '2021210152@student.uitm.edu.my', 'f25fc7f41df1bd7fde6ea9c3527c0bbb5043949b', 2021210152, 4, '0172603738', '086317239', 0, 0),
(80, 'SITI NURASWANA BINTI ASMADI', '031212100620', '2021652394@student.uitm.edu.my', '3f698ded6e509adbe2d832b9336d6fec949ec3b7', 2021652394, 4, '01157579586', '', 0, 0),
(81, 'NURUL AZIRAH BINTI MOHD DIAH', '031123040216', '2021605862@student.uitm.edu.my', '4f676144525931b67b12f5020e02382fceafb2e0', 2021605862, 4, '0136984187', '', 0, 0),
(82, 'HIJJAZ BIN HASNEE', '030919090169', '2022770011@student.uitm.edu.my', '0d099f6a8510f7f6b4afd7640256c8078d9edaee', 2022770011, 3, '01158956362', '0195598955', 0, 0),
(83, 'AIN BALQIS BINTI ZULCEPLE', '031201011470', '2021496816@student.uitm.edu.my', '23336d87ba5d4ded38b1b7af175f894435a90959', 2021496816, 4, '0194871245', '0197165523', 0, 0),
(84, 'NOOR ZULAIKA BIMTI ZUHAIMI', '030416140136', '2021892166@student.uitm.edu.my', '85acd20d602a6cca8ae48cb21415717af572e16f', 2021892166, 4, '0183167097', '', 0, 0),
(85, 'NUR EZRYNA SYAFRYNA BINTI GHANI ', '030711020698', '2021460836@student.uitm.edu.my', 'de501ad704ebbb8c5dd24975a1e5778ed863b1e4', 2021460836, 4, '0195771178', '0183279161', 0, 0),
(86, 'LAILA ATHIRAH BINTI MD HASANAS&#39;ARI', '031105010902', '2021840862@student.uitm.edu.my', '70e130cc8530bb6f4396f21acc854f6a2e21c5f2', 2021840862, 4, '0168978707', '078613230', 0, 0),
(87, 'MAISARAH ALIAH AISYAH BINTI HALIM', '030121040082', '2021201656@student.uitm.edu.my', '3a827ec739a6d7ca82add6d73e12f2517962258d', 2021201656, 4, '0133513244', '-', 0, 0),
(88, 'WAN MUHAMMAD ARIFF BIN AMINURRASHID', '030401011083', '2021699996@student.uitm.edu.my', '4c2710144b69e797817336f60642dd560ce3979b', 2021699996, 4, '01112437449', '-', 0, 0),
(89, 'MUHAMMAD MIFZAL NAZMI BIN ZULKIFLEE', '030630010295', '2021808166@student.uitm.edu.my', '39b4cc5ef5625972db368da8c1dc1571081ff3b4', 2021808166, 4, '01111130603', '', 0, 0),
(90, 'MUHAMMAD DANIEL MUTTAQIN BIN INDRA SHAHRIN', '031115020063', '2021813872@student.uitm.edu.my', '046773844769e82e017239b396fd7ae7d1a67622', 2021813872, 4, '01126465007', '-', 0, 0),
(91, 'NUR FAREENA BINTI HUSSIN ', '031111101982', '2022565235@student.uitm.edu.my', '91eb5ab7433353bb5aeb96a95d319a0fb0a73b78', 2022565235, 3, '0145055091', '', 0, 0),
(92, 'SYAH IQLIL HAWA BINTI SHAHAKMAL', '030708011512', '2021602282@student.uitm.edu.my', 'd9b5a4765fd432320487ac8a103140afe1560252', 2021602282, 4, '01161130307', '-', 0, 0),
(93, 'NOOR ELYANA INSYIRAH BINTI AZLAN', '031009081102', '2021600044@student.uitm.edu.my', '3b3fb2c975c753d0e7237dfc6a8a590d7b75d9f4', 2021600044, 4, '01123358929', '', 0, 0),
(94, 'NUR AQILAH BINTI ISMAIL', '030422010952', '2021856782@student.uitm.edu.my', '632b8681d07c6861faaab57eeffdef0aaa279ae2', 2021856782, 4, '0102449374', '', 0, 0),
(95, 'NOR IZZATI BINTI MOHD AZHAR', '030713100114', '2022309371@student.uitm.edu.my', '750703f67d28c4fbd6385dc7be5750e492770011', 2022309371, 3, '01151294219', '', 0, 0),
(96, 'MUHAMMAD HAQEEM BIN MOHAMAD PUZI', '03040614027', '2021486978@uitm.edu.my', 'd5668f6d5ccc4ff185cfaad6469d8906099706bc', 2021486978, 4, '0172242123', '', 0, 0),
(97, 'ANIS UMAIRAH BINTI MD KASSIM', '030402050076', '2021605298@student.uitm.edu.my', '09b2640c920b20cbd283924ec9125035438e77b8', 2021605298, 4, '01130361065', '-', 0, 0),
(98, 'NURIN QISTINA AUNI BINTI KHIRUL SHAHRUDDIN', '030729080074', '2021497752@student.uitm.edu.my', 'd21897898ba5d7bec8e572eed305ba0a9b283e61', 2021497752, 4, '0175963248', '-', 0, 0),
(99, 'PUTRI BATRISYIA QASDINA BINTI MOHAMMAD HAMIDI', '030418030272', '2021662462@STUDENT.UITM.EDU.MY', 'a08551c7d8e04fcc174da6a8c02a615561a7f753', 2021662462, 4, '0102690504', '-', 0, 0),
(100, 'AINA SOFEA BINTI HELMY', '030707140048', '2021606202@student.uitm.edu.my', '79e985ba2aadd11eba0284919d0801b5a57d21c6', 2021606202, 4, '0182085857', '0173413422', 0, 0),
(101, 'ASYIQA JASMEEN BINTI MUHAMMAD RAZLAN', '030701060020', '2021493154@student.uitm.edu.my', '20be68003d5880a5d62bcb31fb0559cb979cfd8a', 2021493154, 4, '0193741046', '-', 0, 0),
(102, 'NURYASMIN NASRIN BINTI MOHD ZIN', '031012050120', '2021499796@student.uitm.edu.my', '325052d3a4df97cbc24c158ef7484f27b340ab3b', 2021499796, 4, '01118583125', '-', 0, 0),
(103, 'NURAZEERA BINTI SAPRI', '030912120070', '2021894618@student.uitm.edu.my', 'a78992ed099a9aea2b53e6d37315b4e5f78d8ba8', 2021894618, 4, '0166186625', '-', 0, 0),
(104, 'NUR NABILAH BINTI MOHD NUR IMAN CHAN ', '031106141058', '2021896966@student.uitm.edu.my', '8c7945c84cabe0a100aec682c995ca8d5833d614', 2021896966, 4, '0126598124', '-', 0, 0),
(105, 'NUR ANALIZA BINTI ISHAK', '031019040048', '2021896956@student.uitm.edu.my', '08291234b924427a949156abf8e3219df54381ad', 2021896956, 4, '0183244859', '-', 0, 0),
(106, 'MUHAMMAD DANIAL BIN TAURAN', '030417100881', '2022389543@student.uitm.edu.my', '46d03ec621f37c2525ffc623232c346592143fc1', 2022389543, 3, '0167469454', '0167469454', 0, 0),
(107, 'NUR AINA BALQIS BINTI MUHAMMAD NOH', '031011100560', '2021882812@student.uitm.edu.my', 'a4800215f5ca8e06a1cf0e5758d447b3bcda23e3', 2021882812, 4, '0182878920', '0164139890', 0, 0),
(108, 'MUHAMMAD DANIL FAQRUL HAJARUL ASWAD BIN ZULKEFELY', '031014100873', '2022767969@student.uitm.edu.my', '5edc0beaef20b064642a632ac9d1931fe945080a', 2022767969, 3, '01139099120', '0172026874', 0, 0),
(109, 'SITI HAJAR BINTI M.FAZID ', '021125010468', '2021851316@student.uitm.edu.my', 'e0c1eabaaeacb2028c501e0b91dc8fce459cd318', 2021851316, 4, '0192599074', '0192599074', 0, 0),
(110, 'BATRISYIA BT MOHD HAFIZ', '031219011356', '2021688012@student.uitm.edu.my', 'c6976dd971891397fbf3d894c083c2acc6af16aa', 2021688012, 4, '01161177045', '0197979438', 0, 0),
(111, 'NUR AKMA ALIAH BINTI YUDKHA', '031221010264', '2021831448@student.edu.my', 'f98220b7acf8d5dbe5da32c82b08250ff46793d3', 2021831448, 4, '01126483517', '01120900738', 0, 0),
(112, 'NUR AZFAR ALYAA BINTI ALIAS', '030614010156', '2021863478@Student.uitm.edu.my', '88668dea8234224482559819c33b95cf02c95ef3', 2021863478, 4, '01117552035', '-', 0, 0),
(113, 'NADHIRA AIN IZZATI BT MOHD HAIRUL NIZAM', '030406010258', '2021463134@student.uitm.edu.my', 'e21ca12eb7da8b3853dca07cb4499bbac9223593', 2021463134, 4, '0176741642', '01137348837', 0, 0),
(114, 'NURUL SHAFIQAH NABILA BINTI AHMAD TARMIDI', '030427010716', '2022762007@studen.uitm.edu.my', '08e6ee31e0bb1cd6e602ef229972be9439718f96', 2022762007, 3, '01126907184', '0147744395', 0, 0),
(115, 'HANIS NADZIRAH ASHURA BINTI NOOR MUHAMMAD', '031025010056', '2021812038@student.uitm.edu.my', '45995bfb7d72337f1fdb63307986b838b023a602', 2021812038, 4, '0137800477', '0177211673', 0, 0),
(116, 'NURAIN SYAMIMI BINTI MOHD ISA', '030504010892', '2022971911@student.uitm.edu.my', 'e142fe6b90bc5096673261ff31b1c4e8430f2818', 2022971911, 3, '01114273116', '01114273204', 0, 0),
(117, 'NURUL HUSNA UMAIRAH BINTI ABDAN', '030528010918', '2022942587@student.uitm.edu.my', 'd4300da23de8889ec426663b1c4a731d53457dc9', 2022942587, 3, '01160578498', '0187676137', 0, 0),
(118, 'NURUL SHAFIQAH NABILA BINTI AHMAD TARMIDI', '030427010716', '2022762007@student.uitm.edu.my', '08e6ee31e0bb1cd6e602ef229972be9439718f96', 2022762007, 3, '01126907184', '0147744395', 0, 0),
(119, 'AHMAD FIQRI IKHMAL BIN AHMAD KAMAL', '030130141213', '2021891062@student.uitm.edu.my', '76e50e05a0c2103a77ec86a83258109c8444db47', 2021891062, 4, '0172620103', '', 0, 0),
(120, 'MUHAMAD HAFZI BIN ADNAN', '030526070191', '2021883932@student.uitm.edu.my', '281943cd7cd126506058dff54defc57d4ca6ca9c', 2021883932, 4, '01127444262', '045070616', 0, 0),
(121, 'MUHAMMAD AKMAL BIN ABDUL LATIFF', '030628070811', '2021896884@student.uitm.edu.my', 'f67e1653a7346e442a53d31c6d1129847f9ecc23', 2021896884, 4, '0169356251', '01126520599', 0, 0),
(122, 'MUHAMMAD AMIRUL HAKIMI BIN MOHD NASIR', '030103010859', '2021212006@student.uitm.edu.my', '178ad103b110090c758a452058e38a00ac59df6b', 2021212006, 4, '0177036595', '-', 0, 0),
(123, 'MUHAMAD IDHAM BINSULAIMAN', '030826081351', '2021885284@student.uitm.edu.my', '41d83a563b1ef8cb7b28986b6eab3a765e2c9aeb', 2021885284, 4, '0189834603', '0104012704', 0, 0),
(124, 'SHAMSUL IKMAL BIN SHAMSUL AZMAN', '030301010243', '2021818376@STUDENT.UITM.EDU.MY', '012bf016d6667b08b1b32cb57635f85f602ec7db', 2021818376, 4, '0104515431', '', 0, 0),
(125, 'MUHAMMAD AZRUL BIN AZNAN', '020704110813', '2021627288@student.uitm.edu.my', '34742e654d887f390b14c3ab334d54741415eb9e', 2021627288, 4, '0173551162', '', 0, 0),
(126, 'EZMAL BIN FIRDAUS', '031030020101', '2021895238@student.uitm.edu.my', 'b1494939a8e228ed990752aadac227678fffd928', 2021895238, 4, '0123926577', '', 0, 0),
(127, 'MUHAMMAD AZMIN BIN KHAIRUL ANUAR', '030502011955', '2021841804@student.uitm.edu.my', '0b6ddaef91c9e6cd473b7c12a38bcb17c4690c8a', 2021841804, 4, '0192818417', '', 0, 0),
(128, 'MOHAMAD HAIKAL BIN MA&#39;AROF', '031007080093', '2021490322@student.uitm.edu.my', 'ee7d9697120795fc6ca0d6c4b4d2d6aed04259a8', 2021490322, 4, '01128779288', '0139841965', 0, 0),
(129, 'MUHAMMAD ALIF DANIEL BIN MOHD FAIZ', '031019140575', '2021467402@student.uitm.edu.my', 'e661bd2ebce1ff622a29d98ac59bce588db4bbb8', 2021467402, 4, '0188704544', '0123593626', 0, 0),
(130, 'MUHAMMAD DANIAL AFIF BIN MOHD AFFENDI', '031114101371', '2021825462@student.uitm.edu.my', '0902d3d1539431979654e3daaca4953857e1c073', 2021825462, 4, '01133871626', '', 0, 0),
(131, 'MOHAMAD FAIZUL HILMI BIN HASHIM', '031028010107', '2021846098@student.uitm.edu.my', '71057be7c2f55ded408c216e2eda52ee12dcd8e5', 2021846098, 4, '01117696170', '', 0, 0),
(132, 'MUHAMMAD AKMAL BIN ABDUL JABAR', '031214010063', '2021473822@student.uitm.edu.my', '7e3dd0e75c16bd89ebfe8ff10edb463792c11746', 2021473822, 4, '0172403686', '0107175643', 0, 0),
(133, 'ADAM AKMAL BIN BADRUL HISAM', '030925160055', '2021473078@student.uitm.edu.my', 'a4d526cdf2f3a70d70ee26d18b2f6e6b79a20243', 2021473078, 4, '0198053225', '', 0, 0),
(134, 'MUHAMMAD AMIRUL ADZLAN BIN ADNAN', '030716011555', '2021452946@student.uitm.edu.my', '5ba2c89afda271bf6cd49112218646dd712c3d4c', 2021452976, 4, '01127304064', '0177588578', 0, 0),
(135, 'IMAN HAIKAL BIN KAMARUL NAZLI', '030619100513', '2021857756@student.uitm.edu.my', '66dddd3aa05ce1bcdd6226c6f4916682c690d671', 2021857756, 4, '0185741288', '', 0, 0),
(136, 'AHMAD MUSTA’IN BILLAH BIN MUSTAFA', '000727010067', 'ahmd.muss@gmail.com', '1234', 2020614182, 6, '0142701906', '', 13, 5);

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
  MODIFY `application_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `clerks`
--
ALTER TABLE `clerks`
  MODIFY `clerk_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `kpps`
--
ALTER TABLE `kpps`
  MODIFY `kpp_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `lecturer_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `program_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `trhea`
--
ALTER TABLE `trhea`
  MODIFY `trhea_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
