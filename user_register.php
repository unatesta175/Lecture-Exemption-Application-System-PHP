<?php

include 'components/connect.php';

// session for user
session_start();

if (isset($_SESSION['user_id'])) {
   $user_id = $_SESSION['user_id'];
} else {
   $user_id = '';
}
;


if (isset($_POST['submit'])) {

   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $ic = $_POST['ic'];
   $ic = filter_var($ic, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $pass = ($_POST['pass']);
   $pass = filter_var($pass, FILTER_SANITIZE_STRING);
   $cpass = ($_POST['cpass']);
   $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);
   $studno = $_POST['studno'];
   $studno = filter_var($studno, FILTER_SANITIZE_STRING);
   $program_id = $_POST['program_id'];
   $program_id = filter_var($program_id, FILTER_SANITIZE_STRING);
   $faculty_id = $_POST['faculty_id'];
   $faculty_id = filter_var($faculty_id, FILTER_SANITIZE_STRING);
  
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
         $insert_user = $conn->prepare("INSERT INTO `students`(name, ic , email, password , student_no , program_id, faculty_id , semester , phone_no , home_phone_no) VALUES(?,?,?,?,?,?,?,?,?,?)");
         $insert_user->execute([$name, $ic, $email, $cpass, $studno, $program_id,$faculty_id,  $part, $phoneno, $homephoneno]);
         $_SESSION['email'] = $email;
         // header('location:user_login.php');
         $message[] = 'YOU HAVE REGISTERED SUCESSFULLY , LOGIN NOW PLEASE!';
         
        ?>
         <script>

         swal({
           title: "Registration!",
           text: "You have successfully registered an account!",
           icon: "success",
           button: "Continue to login!",
         });
         </script> <?php
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

   <?php include 'components/user_header.php'; ?>


   <br>
   <section class="form-container" styles="border-radius: 15px;">
      
      <form action="" method="post">

     
         <h3>Daftar Pelajar</h3>
         <br>
         <br>
         <label class="bigger" style="display: flex;flex-direction: row;" for="name">Nama Penuh :<span style="color: red;">*</span></label> 
         <input type="text" style="text-transform:capitalize; " name="name" required placeholder="" maxlength="70" class="box">

         <label class="bigger" style="display: flex;flex-direction: row;" for="name">No. Kad Pengenalan :<span style="color: red;">*</span></label> 
         <input type="text" name="ic" required placeholder="" maxlength="70" class="box"
            oninput="this.value = this.value.replace(/\s/g, '')">

            <label class="bigger" style="display: flex;flex-direction: row;" for="name">Alamat Emel :<span style="color: red;">*</span></label> 
         <input type="text" name="email" required placeholder="" maxlength="70" class="box"
            oninput="this.value = this.value.replace(/\s/g, '')">

            <label class="bigger" style="display: flex;flex-direction: row;" for="name">Kata Laluan :<span style="color: red;">*</span></label> 
         <input type="password" name="pass" required placeholder="" maxlength="70" class="box "
            oninput="this.value = this.value.replace(/\s/g, '')">

            <label class="bigger" style="display: flex;flex-direction: row;" for="name">Konfirm Kata Laluan :<span style="color: red;">*</span></label> 
         <input type="password" name="cpass" required placeholder="" maxlength="70" class="box"
            oninput="this.value = this.value.replace(/\s/g, '')">

            <label class="bigger" style="display: flex;flex-direction: row;" for="name">No. Matrik Pelajar :<span style="color: red;">*</span></label> 
         <input type="text" name="studno" required placeholder="" maxlength="70" class="box"
            oninput="this.value = this.value.replace(/\s/g, '')">

       

            <label class="bigger" style="display: flex;flex-direction: row;" for="name">Kod Program :<span style="color: red;">*</span></label> 
         <select name="program_id" class="box" required placeholder="isi kod program">
            <option value="" selected hidden>Isi kod program anda</option>
            <?php

            $result = $conn->prepare("SELECT * FROM `programs`");
            $result->execute();
            if ($result->rowCount() > 0) {
               while ($row = $result->fetch(PDO::FETCH_ASSOC)) { ?>
                  <option value="<?php echo $row['program_id']; ?>"><?php echo $row['program_code']." - ".$row['program_name']; ?></option>
               <?php }
            } ?>
         </select>

         <label class="bigger" style="display: flex;flex-direction: row;" for="name">Fakulti :<span style="color: red;">*</span></label> 
         <select name="faculty_id" class="box" required placeholder="Isi Fakulti">
            <option value="" selected hidden>Isi fakulti anda :</option>
            <?php

            $result = $conn->prepare("SELECT * FROM faculty");
            $result->execute();
            if ($result->rowCount() > 0) {
               while ($row = $result->fetch(PDO::FETCH_ASSOC)) { ?>
                  <option value="<?php echo $row['faculty_id']; ?>"><?php echo $row['faculty_code']." -  ".$row['name']; ?></option>
               <?php }
            } ?>
         </select>


         
         <label class="bigger" style="display: flex;flex-direction: row;" for="name">Semester :<span style="color: red;">*</span></label> 
         <input type="number" name="part" required placeholder="" maxlength="70" class="box">


         <label class="bigger" style="display: flex;flex-direction: row;" for="name">No. Telefon :<span style="color: red;">*</span></label> 
         <input type="tel" name="phoneno" min="0" max="9999999999" placeholder="" required
            class="box" oninput="this.value = this.value.replace(/\s/g, '')">


            <label class="bigger" style="display: flex;flex-direction: row;" for="name">No. Telefon Rumah :</label> 
         <input type="tel" name="homephoneno" min="0" max="9999999999" placeholder=""
            oninput=" this.value=this.value.replace(/\s/g, '' )" class="box">


         <input type="submit" style="border-radius:15px; text-transform:uppercase;" value="daftar" class="btn" name="submit">
         <p>Anda sudah ada akaun?</p>
         <a style="border-radius:15px; text-transform:uppercase;"href="user_login.php" class="option-btn">login</a>
      </form>


   </section>
   <br>

   <?php 
   include 'components/footer.php';
   include 'components/scripts.php';
   ?>
  

   <script src="js/script.js"></script>
   
  
 

</body>

</html>