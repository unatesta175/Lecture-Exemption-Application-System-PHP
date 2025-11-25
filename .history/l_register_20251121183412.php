<?php

include 'components/connect.php';

// session for user
session_start();

if (isset($_SESSION['lecturer_id'])) {
   $lecturer_id = $_SESSION['lecturer_id'];
} else {
   $lecturer_id = '';
}
;



if (isset($_POST['submit'])) {
   

   $lecturer_name = htmlspecialchars(strip_tags(trim($_POST['lecturer_name'])), ENT_QUOTES, 'UTF-8');
   $email = htmlspecialchars(strip_tags(trim($_POST['email'])), ENT_QUOTES, 'UTF-8');
   $password = sha1(htmlspecialchars(strip_tags(trim($_POST['password'])), ENT_QUOTES, 'UTF-8'));
   $cpassword = sha1(htmlspecialchars(strip_tags(trim($_POST['cpassword'])), ENT_QUOTES, 'UTF-8'));
   $staff_no = htmlspecialchars(strip_tags(trim($_POST['staff_no'])), ENT_QUOTES, 'UTF-8');
   $work_phone_no = htmlspecialchars(strip_tags(trim($_POST['work_phone_no'])), ENT_QUOTES, 'UTF-8');
 


   $select_user = $conn->prepare("SELECT * FROM `lecturers` WHERE email = ?");
   $select_user->execute([$email,]);
   $row = $select_user->fetch(PDO::FETCH_ASSOC);

   if ($select_user->rowCount() > 0) {
      $message[] = 'email already exists!';
   } else {
      if ($password != $cpassword) {
         $message[] = 'confirm password not matched!';
      } else {
         $insert_user = $conn->prepare("INSERT INTO `lecturers`(lecturer_name , staff_no , email, password , work_phone_no ) VALUES(?,?,?,?,?)");
         $insert_user->execute([$lecturer_name, $staff_no, $email, $password,  $work_phone_no ]);
         $_SESSION['email'] = $email;
         $message[] = 'YOU HAVE REGISTERED SUCESSFULLY , LOGIN NOW PLEASE!';
         
      }
   }

}


?>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>eleas.uitm.edu.my</title>
   <link rel="website icon" type="png" href="images/logoS.png">

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

   <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
   integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> -->


</head>

<body>

   <?php include 'components/l_header.php'; ?>


   <br>
   <section class="form-container" styles="border-radius: 15px;">
      <form action="" method="post">

     
         <h3>Daftar Pensyarah</h3>
         <br>
         <br>
         <label class="bigger" style=" display: flex;flex-direction: row;" for="name">Nama Penuh :<span style="color: red;">*</span></label> 
         <input type="text" style="text-transform:capitalize; "name="lecturer_name" required placeholder="" maxlength="70" class="box">

         
         <label class="bigger" style="display: flex;flex-direction: row;" for="name">Staff ID :<span style="color: red;">*</span></label> 
      <input type="text" name="staff_no" required placeholder="" maxlength="70" class="box"
         oninput="this.value = this.value.replace(/\s/g, '')">

            <label class="bigger" style="display: flex;flex-direction: row;" for="name">Alamat Emel :<span style="color: red;">*</span></label> 
         <input type="text" name="email" required placeholder="" maxlength="70" class="box"
            oninput="this.value = this.value.replace(/\s/g, '')">

            <label class="bigger" style="display: flex;flex-direction: row;" for="name">Kata Laluan :<span style="color: red;">*</span></label> 
         <input type="password" name="password" required placeholder="" maxlength="70" class="box "
            oninput="this.value = this.value.replace(/\s/g, '')">

            <label class="bigger" style="display: flex;flex-direction: row;" for="name">Konfirm Kata Laluan :<span style="color: red;">*</span></label> 
         <input type="password" name="cpassword" required placeholder="" maxlength="70" class="box"
            oninput="this.value = this.value.replace(/\s/g, '')">


       
            

         <label class="bigger" style="display: flex;flex-direction: row;" for="name">No. Telefon :<span style="color: red;">*</span></label> 
         <input type="tel" name="work_phone_no" min="0" max="9999999999" placeholder="" required
            class="box" oninput="this.value = this.value.replace(/\s/g, '')">

         <input type="submit" style="border-radius:15px; text-transform:uppercase;" value="daftar" class="btn" name="submit">
         <p>Anda sudah ada akaun?</p>
         <a style="border-radius:15px; text-transform:uppercase;"href="l_login.php" class="option-btn">login</a>
      </form>


   </section>
   <br>

   <?php include 'components/l_footer.php';
   include 'components/scripts.php';
   ?>
  

   <script src="js/script.js"></script>
   
  
 

</body>

</html>