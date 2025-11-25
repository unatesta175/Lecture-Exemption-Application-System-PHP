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
    $empty_pass = sha1(""); // SHA1 of empty string
    $kpp_id = $_SESSION['kpp_id'];
    // Fetch current hashed password from DB
    $fetch_pass_stmt = $conn->prepare("SELECT password FROM kpps WHERE kpp_id = ?");
    $fetch_pass_stmt->execute([$kpp_id]);
    $current_user = $fetch_pass_stmt->fetch(PDO::FETCH_ASSOC);
    $prev_pass = $current_user ? $current_user['password'] : '';
    $old_pass_input = htmlspecialchars(strip_tags(trim($_POST['old_pass'])), ENT_QUOTES, 'UTF-8');
    $new_pass_input = htmlspecialchars(strip_tags(trim($_POST['new_pass'])), ENT_QUOTES, 'UTF-8');
    $cpass_input    = htmlspecialchars(strip_tags(trim($_POST['cpass'])), ENT_QUOTES, 'UTF-8');
    $old_pass = sha1($old_pass_input);
    $new_pass = sha1($new_pass_input);
    $cpass    = sha1($cpass_input);
    if ($old_pass == $empty_pass) {
        $message[] = 'Sila isi Kata Laluan lama anda!';
    } elseif ($old_pass !== $prev_pass) {
        $message[] = 'Kata Laluan lama tidak sepadan!';
    } elseif ($new_pass_input === "" || $cpass_input === "") {
        $message[] = 'Kata Laluan baru tidak boleh kosong!';
    } elseif ($new_pass !== $cpass) {
        $message[] = 'Kata Laluan konfirmasi tidak sepadan!';
    } elseif ($new_pass === $prev_pass) {
        $message[] = 'Kata Laluan baru tidak boleh sama seperti yang lama!';
    } else {
        $update_stmt = $conn->prepare("UPDATE `kpps` SET password = ? WHERE kpp_id = ?");
        $update_stmt->execute([$new_pass, $kpp_id]);
        $message[] = 'Kata Laluan anda sudah dikemaskini!';
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