<?php

include 'components/connect.php';

session_start();

if (isset($_SESSION['kpp_id'])) {
   $kpp_id = $_SESSION['kpp_id'];
} else {
   $kpp_id = '';
}
;

if (isset($_POST['submit'])) {

  

   

   $empty_pass = 'da39a3ee5e6b4b0d3255bfef95601890afd80709';
   $prev_pass = $_POST['prev_pass'];
   $old_pass = htmlspecialchars(strip_tags(trim($_POST['old_pass'])), ENT_QUOTES, 'UTF-8');
   $new_pass = htmlspecialchars(strip_tags(trim($_POST['new_pass'])), ENT_QUOTES, 'UTF-8');
   $cpass = htmlspecialchars(strip_tags(trim($_POST['cpass'])), ENT_QUOTES, 'UTF-8');

   if ($old_pass == $empty_pass) {
      $message[] = 'Sila isi Kata Laluan lama anda!';
   } elseif ($old_pass != $prev_pass) {
      $message[] = 'Kata Laluan lama tidak sepadan!';
   } elseif ($new_pass != $cpass) {
      $message[] = 'kata Laluan konfirmasi tidak sepadan!';
   } else {
      if ($new_pass != $empty_pass) {
         $update_admin_pass = $conn->prepare("UPDATE `kpps` SET password = ? WHERE kpp_id = ?");
         $update_admin_pass->execute([$cpass, $kpp_id]);
         $message[] = 'Kata Laluan anda sudah dikemaskini!';
      } else {
         $message[] = 'Sila isi kata laluan baru!';
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

</head>

<body>

   <?php include 'components/kpp_header.php'; ?>


   <br>
   <?php
   if (!isset($_SESSION['kpp_id'])) {
      header('location:kpp_login.php');
   } else {

      ?>
      <section class="form-container">

         <form action="" method="post">
            <h3>Kemaskini Kata Laluan</h3>
            <input type="hidden" name="prev_pass" value="<?= $fetch_profile["password"]; ?>">
           
            <input type="password" name="old_pass" placeholder="Isi Kata laluan lama anda" maxlength="20" class="box"
               oninput="this.value = this.value.replace(/\s/g, '')">
            <input type="password" name="new_pass" placeholder="Isi kata laluan baru anda" maxlength="20" class="box"
               oninput="this.value = this.value.replace(/\s/g, '')">
            <input type="password" name="cpass" placeholder="Isi kata laluan konfirmasi anda" maxlength="20" class="box"
               oninput="this.value = this.value.replace(/\s/g, '')">
            <input type="submit" value="Kemaskini" class="btn" name="submit">
         </form>
      </section>"
      <?php
   }
   ?>
   <br>












   <?php include 'components/kpp_footer.php'; ?>

   <script src="js/script.js"></script>

</body>

</html>