-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 12:51 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;






































































-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 12:51 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--



CREATE TABLE `admins` (
  `admin_id` int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(70) NOT NULL,
  `staff_id` varchar(70) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(70) NOT NULL,
  `workphone_number` int(70) NOT NULL)
  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
  

--CREATE TABLE `students` (
 `student_id` int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `program_id` int(100) NOT NULL,
 `name` varchar(70) NOT NULL,
 `ic` int(70) NOT NULL,
 `email` varchar(70) NOT NULL,
 `password` varchar(70) NOT NULL,
 `student_no` int(70) NOT NULL,
 `course_code` varchar(70) NOT NULL,
 `semester` int(70) NOT NULL,
 `phone_number` int(70) NOT NULL,
 `home_phone_number` int(70) NOT NULL,
 FOREIGN KEY (program_id) REFERENCES programs(program_id))
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Dumping data for table `admins`
--

--CREATE TABLE `applications` (
 `application_id` int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `student_id` varchar(70) NOT NULL ,
  `event_id` varchar(70) NOT NULL ,
  `kpp_sign` varchar(70) NOT NULL ,
  `kpp_sign` varchar(70) NOT NULL ,
  `kpp_sign` varchar(70) NOT NULL ,
 `date_kppsign` date(70) NOT NULL,
 `time_kppsign` time(70) NOT NULL,
 `kpp_sign` varchar(70) NOT NULL ,
 `date_trheasign` date(70) NOT NULL,
 `time_trheasign` time(70) NOT NULL,
 `trhea_sign` varchar(70) NOT NULL,  
 `date_approved` date(70) NOT NULL,
 `supporting_document` varchar(70) NOT NULL,
 `active_status` varchar(70) NOT NULL
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID))
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
 --CREATE TABLE `programs` (
 `program_id` int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `program_name` varchar(70) NOT NULL ,
 `course_code` varchar(70) NOT NULL)
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
  --CREATE TABLE `classes` (
 `class_id` int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `date` date(70) NOT NULL ,  
 `day` date(70) NOT NULL ,
 `time` time(70) NOT NULL ,
 `lecturer_sign` varchar(70) NOT NULL ,
 `note` varchar(200) NOT NULL)
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
 --CREATE TABLE `events` (
 `event_id` int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 `reason_exemption` varchar(70) NOT NULL ,
 `place` varchar(70) NOT NULL ,
 `date_from` date(70) NOT NULL ,
 `date_until` date(70) NOT NULL,
 `num_day` int(70) NOT NULL )
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
 --CREATE TABLE `lecturers` (
 `lecturer_id` int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `name` varchar(70) NOT NULL ,  
 `staff_id` int(70) NOT NULL ,
 `email` varchar(70) NOT NULL ,
 `password` varchar(70) NOT NULL ,
 `workphone_no` int(70) NOT NULL)
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
 --CREATE TABLE `kpp` (
 `kpp_id` int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `name` varchar(70) NOT NULL ,  
 `staff_id` int(70) NOT NULL ,
 `email` varchar(70) NOT NULL ,
 `password` varchar(70) NOT NULL ,
 `workphone_no` int(70) NOT NULL)
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
 --CREATE TABLE `trhea` (
 `trhea_id` int(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `name` varchar(70) NOT NULL ,  
 `staff_id` int(70) NOT NULL ,
 `email` varchar(70) NOT NULL ,
 `password` varchar(70) NOT NULL ,
 `workphone_no` int(70) NOT NULL)
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

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
-- Table structure for table `users`
--



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
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;


























-- draft for real website

-- for every page

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
} else {
    $user_id = '';
}
;



-- for user_registration.php

if (isset($_POST['submit'])) {

   $name = strtoupper($_POST['name']);
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $ic = strtoupper($_POST['ic']);
   $ic = filter_var($ic, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $pass = sha1($_POST['pass']);
   $pass = filter_var($pass, FILTER_SANITIZE_STRING);
   $cpass = sha1($_POST['cpass']);
   $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);
   $studno = $_POST['studno'];
   $studno = filter_var($studno, FILTER_SANITIZE_STRING);
   $course = strtoupper($_POST['course']);
   $course = filter_var($course, FILTER_SANITIZE_STRING);
   $part = $_POST['part'];
   $part = filter_var($part, FILTER_SANITIZE_STRING);
   $phoneno = $_POST['phoneno'];
   $phoneno = filter_var($phoneno, FILTER_SANITIZE_STRING);
   $homephoneno = $_POST['homephoneno'];
   $homephoneno = filter_var($homephoneno, FILTER_SANITIZE_STRING);
  

   $select_user = $conn->prepare("SELECT * FROM `students` WHERE email = ?");
   $select_user->execute([$email,]);
   $row = $select_user->fetch(PDO::FETCH_ASSOC);

   if ($select_user->rowCount() > 0) {
      $message[] = 'email already exists!';
   } else {
      if ($pass != $cpass) {
         $message[] = 'confirm password not matched!';
      } else {
         $insert_user = $conn->prepare("INSERT INTO `students`(name, ic , email, password , student_no , course_code , semester , phone_number , home_phone_number) VALUES(?,?,?,?,?,?,?,?,?)");
         $insert_user->execute([$name, $ic, $email, $cpass, $studno, $course, $part, $phoneno, $homephoneno]);
         $message[] = 'YOU HAVE REGISTERED SUCESSFULLY , LOGIN NOW PLEASE!';
         $_SESSION['email']=$email;
      }
   }

}



      <form action="" method="post">
         <h3>Pendaftaran akaun</h3>
         <!-- <label class="larger-font" style="display: flex;flex-direction: row;" for="name">Full Name</label> -->
         <input type="text" name="name" required placeholder="enter your full name" maxlength="70" class="box">
         <input type="text" name="ic" required placeholder="enter your ic number" maxlength="70" class="box"
            oninput="this.value = this.value.replace(/\s/g, '')">
         <input type="text" name="email" required placeholder="enter your email" maxlength="70" class="box"
            oninput="this.value = this.value.replace(/\s/g, '')">
         <input type="password" name="pass" required placeholder="enter your password" maxlength="70" class="box "
            oninput="this.value = this.value.replace(/\s/g, '')">
         <input type="password" name="cpass" required placeholder="confirm your password" maxlength="70" class="box"
            oninput="this.value = this.value.replace(/\s/g, '')">

         <input type="text" name="studno" required placeholder="enter your student number" maxlength="70" class="box"
            oninput="this.value = this.value.replace(/\s/g, '')">
         <input type="text" name="course" required placeholder="enter your course code" maxlength="70" class="box"
            oninput="this.value = this.value.replace(/\s/g, '')">
         <input type="number" name="part" required placeholder="enter your current semester" maxlength="70" class="box">
         <input type="tel" name="phoneno" min="0" max="9999999999" placeholder="enter your phone number" required
            class="box" oninput="this.value = this.value.replace(/\s/g, '')">
         <input type="tel" name="homephoneno" min="0" max="9999999999" placeholder="enter your home phone number"
            oninput=" this.value=this.value.replace(/\s/g, '' )" required class="box">

         <input type="submit" value="daftar" class="btn" name="submit">
         <p>Anda sudah ada akaun?</p>
         <a href="user_login.php" class="option-btn">login</a>
      </form>

-- for user_header.php


<div class="profile">
         <?php
         $select_profile = $conn->prepare("SELECT * FROM `students` WHERE student_id = ?");
         $select_profile->execute([$user_id]);
         if ($select_profile->rowCount() > 0) {
            $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
            ?>
            <p>
               <?= $fetch_profile["name"]; ?>
            </p>
            <a href="update_user.php" class="btn underline">Kemaskini profile</a>
            <div class="flex-btn">
               <a href="user_login.php" class="option-btn underline">Login</a>
            </div>
            <a href="components/user_logout.php" class="delete-btn underline"
               onclick="return confirm('logout from the website?');">logout</a>
            <?php
         } else {
            ?>
   
            <p>Sila login atau daftar dahulu!</p>
            <div class="flex-btn">
               <a href="user_register.php" class="option-btn underline">Daftar</a>
               <a href="user_login.php" class="option-btn underline">login</a>
            </div>
            <?php
         }
         ?>

-- for user_login.php

if (isset($_POST['submit'])) {

    $email = $_POST['email'];
    $email = filter_var($email, FILTER_SANITIZE_STRING);
    $pass = sha1($_POST['pass']);
    $pass = filter_var($pass, FILTER_SANITIZE_STRING);

    $select_user = $conn->prepare("SELECT * FROM `students` WHERE email = ? AND password = ?");
    $select_user->execute([$email, $pass]);
    $row = $select_user->fetch(PDO::FETCH_ASSOC);

    if ($select_user->rowCount() > 0) {
        $_SESSION['user_id'] = $row['student_id'];
        header('location:home.php');
    } else {
        $message[] = 'incorrect username or password!';
    }

}



?>

<form action="" method="post">
            <h3 style="font-weight:bold">LOGIN</h3>
            <label class="larger-font" style="display: flex;flex-direction: row;" for="emailLogin">Email address</label>
            <input type="email" id="emailLogin" name="email" required placeholder="enter your email" maxlength="70"
                class="box" aria-describedby="emailHelp" oninput="this.value = this.value.replace(/\s/g, '')">
            <label class="larger-font" style="display: flex;flex-direction: row;" for="passLogin">Password</label>
            <input type="password" id="passLogin" name="pass" required
                placeholder="enter your password" maxlength="40" class="box"
                oninput="this.value = this.value.replace(/\s/g, '')">
            <input type="submit" value="login" class="btn" name="submit">
            <p>Anda tidak memiliki akaun?</p>
            <a href="user_register.php" class="underline option-btn">Daftar</a>
        </form>


-- for application_menu.php

<tbody>
									<?php
									$no = 1;
                  $result = $conn -> prepare("SELECT * FROM 'applications' WHERE student_id=?");
                    $result -> execute([user_id]);
                    if($result -> rowCount() > 0){
                      while($row = $result->fetch(PDO::FETCH_ASSOC)){
                       $application_id = $row['application_id'];
                       $reason_exemption = $row['reason_exemption'];
                       $datetime_application = $row['datetime_application'];
                       $authorization_status = $row['authorization_status'];
                       $support_status = $row['support_status'];
                       $approval_status = $row['approval_status'];
                       $application_stat = $row['application_stat'];

                       	echo '<tr>
                							<th>' . $no . '</th>
                							<td>' . $reason_exemption . '</td>
                              <td>' . $date_application . '</td>
                							<td>' . $authorization_stat . '</td>
										        	<td>' . $support_stat  . '</td>
                							<td>' . $approval_stat . '</td>
											        <td>' . $application_stat. '</td>	
               								<td>
											<center>
												<button><a href="application_view.php?id=' . $application_id . '">Lihat</a></button>
												<button><a href="application_update.php?id=' . $application_id . '">Kemaskini</a></button>
												<button><a href="application_delete.php?id=' . $application_id . '">Buang</a></button>
											</center>
											</td>
                							</tr>';
											$no++;
                      }

                    }
								
									?>
								</tbody>

-- for application_add.php


  if (isset($_POST['submit'])) {


    $reason = $_POST['reason'];
    $startDate = $_POST['startDate'];
    $endDate = $_POST['endDate'];
    $numDay = $_POST['numDay'];
    

    if ($reason == "Lain-lain") {
        $reason = $_POST['otherReason'];
    }

     $insert = $conn->prepare("INSERT INTO `applications`(reason, startDate , endDate, numDay ,student_id) VALUES(?,?,?,?,?)");
     $insert->execute([$reason, $startDate, $endDate, $numDay ,$user_id]);
      

?>

 <form method="POST">


                        <H5 style="color: black;">Sebab Permohonan : </H5>
                        <select id="reason" name="reason" onchange="showOtherReason()">
                            <option value="" selected hidden>Sila Pilih</option>
                            <option value="Konvokesyen">Konvokesyen</option>
                            <option value="Muet">Muet</option>
                            <option value="Muet">Haji</option>
                            <option value="Lain-lain">Lain-lain</option>
                        </select>

                        <label id="labelotherReason" for="otherReason" style="display:none">Nyatakan sebab lain
                            anda:</label>
                        <input type="text" id="otherReason" name="otherReason" style="display:none">

                        <H5 style="color: black;">Tarikh Mula : </H5>
                        <input type="date" id="tarikhMula" name="startDate" placeholder="Isi tarikh mula"
                            class="form-control mb-2">

                        <H5 style="color: black;">Tarikh akhir : </H5>
                        <input type="date" id="tarikAkhir" name="endDate" placeholder="Isi tarikh akhir"
                            class="form-control mb-2">

                        <H5 style="color: black;">Bilangan Hari : </H5>
                        <input type="number" id="bilanganHari" name="numDay" placeholder="Isi bilangan hari"
                            class="form-control mb-2">


                        <br>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card card-default rounded-0 shadow">
                                    <div class="card-header">
                                        <div class="row">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                                                <h1 class="card-title">Senarai kuliah/kelas/makmal/tutorial yang
                                                    terlibat </h1>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-end">
                                                <button type="button"
                                                    class="btn btn-primary bg-gradient btn-sm rounded-0"><a
                                                        href="application_add_class.php" class="text-light">Tambah
                                                        kelas</a></button>
                                            </div>
                                        </div>
                                        <div style="clear:both"></div>
                                    </div>
                                    <div class="card-body">
                                        
                                        <div class="row">
                                            <div class="col-sm-12 table-responsive">
                                                <table id="myTable" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>No.</th>
                                                            <th>Tarikh</th>
                                                            <th>Hari</th>
                                                            <th>Masa</th>
                                                            <th>Kod Kursus</th>
                                                            <th>Kumpulan</th>
                                                            <th>Nama Pensyarah</th>
                                                            <th>Tindakan</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php
                                                             $program_id = $_GET['program_id'];
                                                             $no = 1;
                                                       
                                                              $result = $conn -> prepare("SELECT * FROM 'classes' WHERE program_id=?");
                                                              $result -> execute([$program_id]);
                                                              if($result -> rowCount() > 0){
                                                                while($row = $result->fetch(PDO::FETCH_ASSOC)){
                                                                $class_id = $row['class_id'];
                                                                $class_date = $row['class_date'];
                                                                $class_day = $row['class_day'];
                                                                $class_time = $row['class_time'];
                                                                $course_code = $row['course_code'];
                                                                $group = $row['group'];
                                                                $Lecturer_name= $row['Lecturer_name];

                                                                echo '<tr>
                							<th>' . $no . '</th>
                							<td>' . $class_date. '</td>
                							<td>' . $class_day . '</td>
											        <td>' . $class_time . '</td>
                							<td>' . $course_code. '</td>
                              <td>' . $group . '</td>
									        		<td>' . $Lecturer_name . '</td>	
               								<td>
											<center>
												<button><a href="application_view_class.php?id=' . $class_id . '">Lihat</a></button>
												<button><a href="application_update_class.php?id=' . $class_id . '">Kemaskini</a></button>
												<button><a href="application_delete_class.php?id=' . $class_id . '">Buang</a></button>
											</center>
											</td>
                							</tr>';
                                                                $no++;
                                                            }
                                                        }
                                                        ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <br><br>
                        <button class="btn btn-success" name="submit">Submit</button>
                        <button><a href="application_menu.php">Kembali</a></button>
                    </form>
--application_view.php


   
    <div class="row">
        <div class="col-lg-12">
            <div class="card card-default rounded-0 shadow">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-9">
                            <h3 class="card-title">Lihat Butiran Maklumat</h3>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <form method="POST">
                        <div id="parent" style="display:flex; flex-direction:row;">
                            <?php
                                $program_id = $_GET['program_id'];
                                $no = 1;
                                $result = $conn -> prepare("SELECT * FROM 'applications' WHERE program_id=?");
                                $result -> execute([$program_id]);

                                $result2 = $conn -> prepare("SELECT * FROM 'students' WHERE user_id=?");
                                $result2 -> execute([$user_id]);
                                if($result2 -> rowCount() > 0){
                                 while($row2 = $result2->fetch(PDO::FETCH_ASSOC)){
                                  $name = $row['name'];
                                  $student_no = $row['student_no'];
                                  $student_no = $row['program_code'];
                                  $student_no = $row['semester'];
                                  $student_no = $row['program_code'];
                                  $student_no = $row['program_code'];
                                  $student_no = $row['program_code'];
                                 }}


                                if($result -> rowCount() > 0){
                                 while($row = $result->fetch(PDO::FETCH_ASSOC)){
                                   
                               $program_id = $row['program_id'];
                               $reason_exemption = $row['reason_exemption'];
                               $exe_startDate = $row['exe_startDate'];
                               $exe_endDate = $row['exe_endDate'];
                               $exe_numDay = $row['exe_numDay'];
                               $date_application = $row['date_application'];

                               $date_authorized = $row['date_authorized'];
                               $authorization status = $row['authorization status'];
                               $authorizer = $row['authorizer'];

                               $date_supported = $row['date_supported'];
                               $support_status = $row['support_status'];
                               $supporter = $row['supporter'];

                               $date_approved = $row['date_approved'];
                               $approval_status = $row['approval_status'];
                               $approver = $row['approver'];

                               $application_stat = $row['application_stat'];

                      
                                    ?>
                                    <div style="width:100%; margin-right:100px;" >
                                        <H5 style="color: black;">Nama Pelajar : </H5>
                                        <input disabled type="text" id="model" name="model" placeholder="Isi model kenderaan"
                                            class="form-control mb-2" value="<?php echo $row['model']; ?>">
                                            <H5 style="color: black;">No Matrik Pelajar: </H5>
                                        <input disabled type="text" id="sticker" name="sticker"
                                            placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                            value="<?php echo $row['sticker']; ?>">
                                            <H5 style="color: black;">Fakulti : </H5>
                                        <input disabled type="text" id="sticker" name="sticker"
                                            placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                            value="<?php echo $row['sticker']; ?>">
                                        <H5 style="color: black;">Sebab Permohonanan : </H5>
                                        <input disabled type="text" id="sticker" name="sticker"
                                            placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                            value="<?php echo $row['sticker']; ?>">
                                        <H5 style="color: black;">Tarikh Mula Pengecualian : </H5>
                                        <input disabled type="text" id="platenum" name="platenum"
                                            placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                            value="<?php echo $row['platenum']; ?>">
                                        <H5 style="color: black;">Tarikh Akhir Pengecualian : </H5>
                                        <input disabled type="text" id="sticker" name="sticker"
                                            placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                            value="<?php echo $row['sticker']; ?>">
                                        <H5 style="color: black;">Bilangan Hari : </H5>
                                        <input disabled type="text" id="sticker" name="sticker"
                                            placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                            value="<?php echo $row['sticker']; ?>">
                                        <H5 style="color: black;">Tarikh Permohonanan : </H5>
                                        <input disabled type="text" id="sticker" name="sticker"
                                            placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                            value="<?php echo $row['sticker']; ?>">
                                            <H5 style="color: black;">Masa Permohonanan : </H5>
                                        <input disabled type="text" id="sticker" name="sticker"
                                            placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                            value="<?php echo $row['sticker']; ?>">
                                            
                                    </div>
                                    <div style=" width:100%; margin-right:100px;">
                                       
                                    
                                    <H5 style="color: black;">Tarikh dibenarkan : </H5>
                                    <input disabled type="text" id="sticker" name="sticker"
                                    placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                    value="<?php echo $row['sticker']; ?>">
                                    <H5 style="color: black;">Status kebenaran : </H5>
                                    <input disabled type="text" id="sticker" name="sticker"
                                    placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                    value="<?php echo $row['sticker']; ?>">
                                    <H5 style="color: black;">Dibenarkan oleh: </H5>
                                    <input disabled type="text" id="sticker" name="sticker"
                                    placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                    value="<?php echo $row['sticker']; ?>">
                                    
                                    <H5 style="color: black;">Tarikh disokong : </H5>
                                    <input disabled type="text" id="sticker" name="sticker"
                                    placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                    value="<?php echo $row['sticker']; ?>">
                                    <H5 style="color: black;">Status Sokongan : </H5>
                                    <input disabled type="text" id="sticker" name="sticker"
                                    placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                    value="<?php echo $row['sticker']; ?>">
                                    <H5 style="color: black;">Status Sokongan : </H5>
                                    <input disabled type="text" id="sticker" name="sticker"
                                    placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                    value="<?php echo $row['sticker']; ?>">
                                    
                                    <H5 style="color: black;">Tarikh diluluskan : </H5>
                                    <input disabled type="text" id="sticker" name="sticker"
                                        placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                        value="<?php echo $row['sticker']; ?>">

                                        <H5 style="color: black;">Status kelulusan : </H5>
                                        <input disabled type="text" id="sticker" name="sticker"
                                            placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                            value="<?php echo $row['sticker']; ?>">

                                        <H5 style="color: black;">Diluluskan oleh : </H5>
                                        <input disabled type="text" id="sticker" name="sticker"
                                            placeholder="Isi nombor plat kenderaan" class="form-control mb-2"
                                            value="<?php echo $row['sticker']; ?>">
                                    
                                    </div>
                                    <?php
                                }
                            }
                            ?>
                        </div>
                        <br>
                        <br>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card card-default rounded-0 shadow">
                                    <div class="card-header">
                                        <div class="row">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                                                <h3 class="card-title">Senarai kuliah/kelas/makmal/tutorial yang
                                                    terlibat </h3>
                                            </div>

                                        </div>
                                        <div style="clear:both"></div>
                                    </div>
                                    <div class="card-body">
                                        <button id="export-btn">Eksport ke Excel</button><br><br>
                                        <div class="row">
                                            <div class="col-sm-12 table-responsive">
                                                <table id="myTable" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>No.</th>
                                                            <th>Tarikh</th>
                                                            <th>Hari</th>
                                                            <th>Masa</th>
                                                            <th>Kod Kursus</th>
                                                            <th>kumpulan</th>
                                                            <th>Nama Pensyarah</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php
                                                       

                                                              $program_id = $_GET['program_id'];
                                                              $no = 1;
                                                              $result = $conn -> prepare("SELECT * FROM 'classes' WHERE program_id=?");
                                                              $result -> execute([$program_id]);
                                                              if($result -> rowCount() > 0){
                                                                while($row = $result->fetch(PDO::FETCH_ASSOC)){
                                                                $class_id = $row['class_id'];
                                                                $class_date = $row['class_date'];
                                                                $class_day = $row['class_day'];
                                                                $class_time = $row['class_time'];
                                                                $course_code = $row['course_code'];
                                                                $group = $row['group'];
                                                                $Lecturer_name= $row['Lecturer_name];

                                                                echo '<tr>
                							<th>' . $no . '</th>
                							<td>' . $class_date. '</td>
                							<td>' . $class_day . '</td>
											        <td>' . $class_time . '</td>
                							<td>' . $course_code. '</td>
                              <td>' . $group . '</td>
									        		<td>' . $Lecturer_name . '</td>	
               								<td>
               								
											
                						            	</tr>';
                                                                $no++;
                                                            }
                                                        }
                                                        ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <button href="application_menu.php" class="btn btn-success">Kembali</button>
                    </form>

--application_update.php

if (isset($_POST['submit'])) {

    $program_id = $_GET['program_id'];
    $reason = $_POST['reason'];
    $startDate = $_POST['startDate'];
    $endDate = $_POST['endDate'];
    $numDay = $_POST['numDay'];
    

    if ($reason == "Lain-lain") {
        $reason = $_POST['otherReason'];
    }

     $update = $conn->prepare("UPDATE `applications` SET reason = ?, startDate = ?, endDate = ?, numDay = ? WHERE program_id = ?");
     $update->execute([$reason, $startDate, $endDate, $numDay ,$program_id]);

   $stmt = $conn->query( $update);
if ($stmt) {
    echo "Permohonan berjaya dikemaskini!";
    header('location:application_menu.php');
} else {
    die($conn->errorInfo()[2]);
}
   
    }

 <form method="POST">
                        <?php
                        $id = $_GET['id'];
                        $sql = "select * from `studentcar` where studentid=$id";
                        $result = mysqli_query($con, $sql);

                        if ($result) {
                            while ($row = mysqli_fetch_assoc($result)) {
                                $name = $row['name'];
                                $gender = $row['gender'];
                                $matric = $row['matric'];
                                $model = $row['model'];
                                $platenum = $row['platenum'];
                                $sticker = $row['sticker'];
                        ?>

                        
                                 <H5 style="color: black;">Sebab Permohonan : </H5>
                        <select id="reason" name="reason" onchange="showOtherReason()">
                            <option value="" selected hidden>Sila Pilih</option>
                            <option value="Konvokesyen">Konvokesyen</option>
                            <option value="Muet">Muet</option>
                            <option value="Muet">Haji</option>
                            <option value="Lain-lain">Lain-lain</option>
                        </select>

                        <label id="labelotherReason" for="otherReason" style="display:none">Nyatakan sebab lain
                            anda:</label>
                        <input type="text" id="otherReason" name="otherReason" style="display:none">

                        <H5 style="color: black;">Tarikh Mula : </H5>
                        <input type="date" id="tarikhMula" name="startDate" placeholder="Isi tarikh mula"
                            class="form-control mb-2">

                        <H5 style="color: black;">Tarikh akhir : </H5>
                        <input type="date" id="tarikAkhir" name="endDate" placeholder="Isi tarikh akhir"
                            class="form-control mb-2">

                        <H5 style="color: black;">Bilangan Hari : </H5>
                        <input type="number" id="bilanganHari" name="numDay" placeholder="Isi bilangan hari"
                            class="form-control mb-2">
                        <?php
                            }
                        }
                        ?>
                        <br><br>
                        <button class="btn btn-success" name="submit">Simpan</button>
                        <button><a href="application_menu.php">Kembali</a></button>
                    </form>

                
--application_add_class.php


$program_id=$GET['program_id'];

if (isset($_POST['submit'])) {

   $program_id=$GET['program_id'];
    $date = $_POST['date'];
    $day = $_POST['day'];
    $time = $_POST['time'];
    $course_code = $_POST['course_code'];
    $group = $_POST['group'];
    $lecturer_name = $_POST['lecturer_name'];
  
    $insert = $conn->prepare("INSERT INTO `classes`(program_id, date, day , time, course_code , group , lecturer_name) VALUES(?,?,?,?,?,?,?)");
    $insert->execute([$program_id, $date, $day, $time, $course_code, $group, $lecturer_name]);

    $stmt = $conn->query($insert);
if ($stmt) {
    echo "Kuliah berjaya didaftar!";
    header('location:application_menu.php');
} else {
    die($conn->errorInfo()[2]);
}
}


--application_update_class.php

if (isset($_POST['submit'])) {

    $class_id = $_GET['class_id'];
    $date = $_POST['date'];
    $day = $_POST['day'];
    $time = $_POST['time'];
    $course_code = $_POST['course_code'];
    $group = $_POST['group'];
    $lecturer_name = $_POST['lecturer_name'];
   

    $update = $conn->prepare("UPDATE `classes` SET date = ?, day = ?, time = ?, course_code = ?, `group` = ?, lecturer_name = ? WHERE class_id = ?");
    $update->execute([$date, $day, $time, $course_code, $group, $lecturer_name, $class_id]);

   $stmt = $conn->query( $update);
if ($stmt) {
    echo "Kuliah berjaya dikemaskini!";
    header('location:application_menu.php');
} else {
    die($conn->errorInfo()[2]);
}
   
    }

<form method="POST">

$

                        <?php
                        $class_id = $_GET['class_id'];
                         $result = $conn->prepare("SELECT * FROM classes WHERE class_id = ?");
                        $result->execute([$class_id]);
                        if($result -> rowCount() > 0){
                          while($row = $result->fetch(PDO::FETCH_ASSOC)){
                          $row['date'];
                          $row['day'];
                          $row['time'];
                          $row['course_code'];
                          $row['group'];
                          $row['lecturer_name'];
                        ?>
                               

admin/


data storage for each user TYPE
student: $_SESSION['user_id']
student: $_SESSION['program_code']
student: $_SESSION['faculty']





-- FOR lecturer picking 

value yang pick oleh student , $var = Mimi Hasliah , select * from lecturers like
$fetch['lecturer_id']

$class_items[] = '';
    $total_classes = '';
    $count = 1;
    $total_authorizer_needed=0;
    $result2 = $conn->prepare("SELECT * FROM `classes` WHERE application_id=?");
    $result2->execute([$application_id]);
    if ($result2->rowCount() > 0) {
        while ($row2 = $result2->fetch(PDO::FETCH_ASSOC)) {


            $class_items[] = "\n(" . $count . ")[Kod Kursus : " . $row2['course_code'] . "\n Kumpulan : " . $row2['group'] . "\n Pensyarah : " . $row2['lecturer_name'] . '] - ';
            $total_classes = implode($class_items);
            $count = $count + 1;
            $total_authorizer_needed = $total_authorizer_needed + 1;
        }
    }

    $update = $conn->prepare("UPDATE `applications` SET total_class = ?  SET total_authorizer_need = ? WHERE application_id = ?");
    $update->execute([$total_classes , $total_authorizer_unsigned , $application_id]);



lecturer lain nak tengok permohonan
select * from classes where lecturer_name = ? AND authorization_status = 'pending' //masalah untuk ni adalah nanti ada sesetengah lecturer nan=k tengok jugak permohonan tu walaupun permohonan tu dah dibenarkan atau tak dibenarkan
select * from applications where class_id = ?

--Cemana nak jadikan supaya setiap application tu student boleh linkkan kepada lecturer of the courses, linkkan kepada fakulti berkaitan 
if 1st benar,2nd benar ,3rd xbenar
if 1st xbenar,2nd benar - first tak benar tu so auto permohonan tak diluluskan,
if 1st benar ,2nd xbenar
if 1st xbenar,2nd xbenar

Kita buat sesiapa first lecturer yang sign permohonanan tu and dia tak benarkan , auto permohonan tu takkan dijumpai oleh pensyarah lain atau kpp dan trhea
-- For applications accessed by lecturers related to him only or if application stores the data of authourizer if there is more than 1 authorizer
if (isset($_POST['authorize'])) {
select * from classes where lecturer_name = ?
select * from applications where class_id = ?--access all application page
$authorizer =fetch['authorizer'];
$authorization_sign =fetch['authorization_sign'];
 $signed = fetch['total_authorizer_signed'] ;
 $total_authorizer_needed=fetch['total_authorizer_needed'];

$signed = $signed + 1;

if($signed = 1){
$authorizer =   $authorizer + $l_name . ' / ';
$authorization_sign =   $authorization_sign . 'Authorized' . ' / ';
update 'applications' set authorizer = ?, set total_authorizer_signed = ?,set date_authorized = ? , set authorization_status = ? where application_id =?
 $update->execute([$l_name , $signed , $default_date , 'pending' , $application_id]);
}

else if($signed < $total_authorizer_needed){
$authorizer =   $authorizer + $l_name . ' / ';
$authorization_sign =   $authorization_sign . 'Authorized' . ' / ';
update 'applications' set authorizer = ?, set total_authorizer_signed = ?,set date_authorized = ? , set authorization_status = ? where application_id =?
 $update->execute([$l_name , $signed , $default_date , 'pending' , $application_id]);
}

else if($signed == $total_authorizer_needed){
  $authorizer =' [ ' .  $authorizer + $l_name . ' ] ' ;
  $authorization_sign =' [ ' .    $authorization_sign . 'Authorized' . ' ] ';
  $signed = All;

  update 'applications' set authorizer = ?, set total_authorizer_signed = ?,set date_authorized = ? , set authorization_status = ? where application_id =?
 $update->execute([$l_name , $signed , $default_date , 'authourized' , $application_id]);

}

else if(isset($_POST['unauthorize'])){

select * from classes where lecturer_name = ?
select * from applications where class_id = ?
$authorizer =fetch['authorizer'];
$authorization_sign =fetch['authorization_sign'];
 $signed = fetch['total_authorizer_signed'] ;
 $total_authorizer_needed=fetch['total_authorizer_needed'];

 $signed = $signed + 1;

 if($signed = 1){//Kalau ada sorang je pensyarah sebagai authorizer permohonanan tu
$authorizer =   $authorizer + $l_name . ' / ';
$authorization_sign =   $authorization_sign . 'Unauthorized' . ' / ';
update 'applications' set authorizer = ?, set total_authorizer_signed = ?,set date_authorized = ? , set authorization_status = ? where application_id =?
 $update->execute([$l_name , $signed , $default_date , 'Unauthorized' , $application_id]);
}

else if($signed < $total_authorizer_needed){
$authorizer =   $authorizer + $l_name . ' / ';
$authorization_sign =   $authorization_sign . 'Authorized' . ' / ';
update 'applications' set authorizer = ?, set total_authorizer_signed = ?,set date_authorized = ? , set authorization_status = ? where application_id =?
 $update->execute([$l_name , $signed , $default_date , 'pending' , $application_id]);
}


update 'applications' set authorizer = ?, set authorization_status = ?, set total_authorizer_signed = ?,set date_authorized = ? where application_id =?
$update->execute([$l_name , 'unauthorized', $signed , $default_date]);
}








lecturer lain nak tengok permohonan even ia sudah tidak dibenarkan oleh pensyarah lain , boleh lihat , kemaskini , validasi

select * from classes where lecturer_name =?
fetch['authorization_status_self']

display

no. nama pemohon sebab permohonan 
if isset($_POST['authorization_status_self']) {validasi button exist, kemaskini button not exist yet}



select * from classes where lecturer_name =?
  select * from applications where class_id =?
-senarai permohonan untuk lecturer tengok mesti boleh dilihat walaupun sudah tak dibenarkan oleh pensyarah lain , and wajib pensyarah yang belum sign , mesti sign juga walau macam mana skalipun,
-permohonanan boleh diedit selagi takde sekurang2nya 1 pkpp dah sign permohonanan tu



{
  select * from classes where lecturer_name =?
  select * from applications where class_id=?
  fetch['support_status']

  if (fetch['support_status'] == pending){

    button kemaskini exist
  }
  }


-senarai permohonan tu akan paparkan siapa je yang dah benarkan and apa sign mereka benar atau tak benarkan(pensyarah lain boleh tahu)
select * from classes where lecturer_name =?
  select * from applications where class_id=?
  
  fetch['application_id']

  select * from classes where application_id =?
 fetch['authorizer']
 fetch['authorizer_status_self']


select * from classes where lecturer_name = ? AND authorization_status = 'pending' //masalah untuk ni adalah nanti ada sesetengah lecturer nan=k tengok jugak permohonan tu walaupun permohonan tu dah dibenarkan atau tak dibenarkan
select * from applications where class_id = ?

if 1st benar,2nd benar -first n 2nd boleh tengok lagi permohonanan ,boleh tengok , boleh sign
if 1st xbenar,2nd benar - first tak benar tu so auto permohonan tak diluluskan, so tak dapat nak disign lagi oleh next pensyarah tapi jika diedit supaya benar , boleh je next pensyarah
if 1st benar ,2nd xbenar
if 1st xbenar,2nd xbenar first tak benar tu so auto permohonan tak diluluskan,2nd tetap dapat tengok permohonanan and still tak boleh sign tapi boleh je diedit untuk benarkan semula

rule : if salah 1 pensyarah daripada total bilangan pensyarah yang diperlukan untuk sign permohonan tu tak benarkan pengecualian tu 
maka permohonanan tu tak dibenarkan 
# next pensyarah tak boleh sign kalau pensyarah pertama tu tak benarkan sebab kira sia2 even next pensyarah tu benarkan
#sebenarnya walaupun 1 pensyarah tak benarkan , pensyarah lain kena tetap boleh sign sebab boleh jadi pensyarah pertama yang tak benarkan tu tukar keputusan untuk benarkan 
if (isset($_POST['authorize'])) {

select * from classes where lecturer_name =?
select * from applications where class_id =?




}
else if(isset($_POST['unauthorize'])){
select * from classes where lecturer_name =?
select * from applications where class_id =?

}




w
--For applications accessed by kpp 
select * from programs where kpp_id=?
$fetch['program_code']

select * from students where program_code=?
$fetch['student_id']
select * from applications where student_id = ? AND authorization_status = 'Authorized' AND total_authorizer_signed = all

--For applications accessed by trhea
select * from applications where authorization_status = 'Authorized' AND support_status = 'Supported ' AND approved_status = 'pending'

--For applications accessed by clerk


select * from  programs where clerk_name=? 
$fetch['program_code']

select * from students where program_code=?
execute([$fetch['program_code']])
$fetch2['student_id']

select * from applications where student_id=?
execute([$fetch2['student_id']])
-- select * from students s join program p on s.program_id=p.program_id where faculty = ?
-- $a=$fetch['student_id']

-- select * from applications where student_id = ?
-- execute([$a])

select * from applications 
select * from applications where 
select * from applications where approval_stat = 'pending' AND application_stat ='active' 

--lecturer
$_SESSION['lecturer_id']
$_SESSION['lecturer_name']


user_login
user_register
home

class_menu
select * from classes where lecturer_name =?
$fetch['application_id'] 

OR

select * from classes where lecturer_name =?
$fetch['application_id'] 


select * from applications where application_id=?
(display all important details only)


 
$date= NULL;

-- application_authorize

select * from applications where lecturer_name=?
display all informations;
fetch['no_authorizer']


update 'applications' set authorizer = ?, set date_authorized = ? , set authorized_status = ? where application_id =?
execute([$authorizer , DEFAULT , $authorized_status ]);



-- application_view

select * from applications where program_id=?
(display all important details only)

<H5 style="color: black;">Nama pensyarah : </H5>
                        <select name="lecturer_name">
                        <option value="" selected hidden>Sila Pilih</option>
                        <?php
                       
                         $result = $conn->prepare("SELECT * FROM lecturers ");
                        $result->execute();
                        if($result -> rowCount() > 0){
                          while($row = $result->fetch(PDO::FETCH_ASSOC)){ ?>
                            <option value="<?php $row['lecturer_id'] ; ?>"><p><?php $row['lecturer_name'] ; ?></p></option> 
                            <?php }} ?>
                        </select>


untuk buat column date hanya terupdate bila authorizer update application FROM

CREATE TABLE `authorizations` (
  `authorization_id` int(100) NOT NULL AUTO_INCREMENT,
  `authorizer_name` varchar(70) NOT NULL,
  `date_authorized` timestamp NOT NULL default CURRENT_TIMESTAMP(),
  `authorized_status` varchar(10) NOT NULL,
  PRIMARY KEY (`authorization_id`)
);

INSERT INTO authorizations (authorizer_name ,authorized_status ,authorized )
VALUES ('zaid' , '1'); --masa student insert data dalam application atau 
INSERT INTO authorizations (authorizer_name ,authorized_status , date_authorized )
VALUES ('zaid' , '1' , null)


update authorizations
set authorizer_name = 'anjai' , authorized_status = '2' ,date_authorized= default
WHERE authorization_id = 1; -- masa lecturer update application form

--kpp

$_SESSION['user_id']
$_SESSION['user_name']
$_SESSION['faculty']

--cara ni macam tak pasti kalau fetch tu ambil banyak2 row ke atau 1 je
select * from programs where kpp_id=?
$fetch[program_code]

select * from students where program_code =?
$fetch[student_id]

select * from applications where student_id=?
$fetch[application_id]

OR

select * from applications where faculty=?




-- application_menu

select * from applications where faculty=? 
$fetch[$program_id]
displayAll();



-- application_support


INSERT INTO applicationss (supporter_name ,supported_status ,date_supported)
VALUES ('zaid' , 'Disokong' , null) --student

update 'applications' set supporter = ?, set date_supported = ? , set supported_status = ? where application_id =?
execute([$supporter , DEFAULT , $supported_status ]);

-- application_view
select * from applications where faculty=? 

displayAll();

--trhea
$_SESSION['user_id']
$_SESSION['user_name']

user_login
user_register
home


-- application_menu


select * from applications where approved_status=? 
execute["not approved"]

select * from applications where approved_status=? 
execute["approved"]


-- application_approve

INSERT INTO applications (approver_name ,approved_status ,date_approved)
VALUES ('zaid' , 'Dilulus' , null) --student

update 'applications' set approver = ?, set date_approved = ? , set approved_status = ? where application_id =?
execute([$approver , DEFAULT , $approved_status ]);


-- application_view

select * from applications where approved_status=? 
displayAll();

--clerk
$_SESSION['user_id']
$_SESSION['user_name']

user_register
$insert = $conn->prepare("INSERT INTO `programs`(program_id, clerk_name, program_code) VALUES(?,?,?)");
    $insert->execute([$program_id, $clerk_name, $program_code]);


--application_menu

select * from applications a join program p on a.program_code = p.program_code where clerk_name =? 
execute[($_SESSION['user_name'])];
--tengok yang completed / tengok yang still pending / tengok yang expired /tengok yang active 








                      






