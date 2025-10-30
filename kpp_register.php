<?php

include 'components/connect.php';

// session for user
session_start();

if (isset($_SESSION['kpp_id'])) {
   $kpp_id = $_SESSION['kpp_id'];
} else {
   $kpp_id = '';
}
;


// if(isset($_POST['submit'])){

//    $name = $_POST['name'];
//    $name = filter_var($name, FILTER_SANITIZE_STRING);
//    $email = $_POST['email'];
//    $email = filter_var($email, FILTER_SANITIZE_STRING);
//    $pass = ($_POST['pass']);
//    $pass = filter_var($pass, FILTER_SANITIZE_STRING);
//    $cpass = ($_POST['cpass']);
//    $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);

//    $select_user = $conn->prepare("SELECT * FROM `user` WHERE email = ?");
//    $select_user->execute([$email,]);
//    $row = $select_user->fetch(PDO::FETCH_ASSOC);

//    if($select_user->rowCount() > 0){
//       $message[] = 'email already exists!';
//    }else{
//       if($pass != $cpass){
//          $message[] = 'confirm password not matched!';
//       }else{
//          $insert_user = $conn->prepare("INSERT INTO `users`(name, email, password) VALUES(?,?,?)");
//          $insert_user->execute([$name, $email, $cpass]);
//          $message[] = 'registered successfully, login now please!';
//       }
//    }

// }

if (isset($_POST['submit'])) {
   

   $kpp_name = $_POST['kpp_name'];
   $kpp_name = filter_var($kpp_name, FILTER_SANITIZE_STRING);
   
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);

   $password = ($_POST['password']);
   $password = filter_var($password, FILTER_SANITIZE_STRING);

   $cpassword = ($_POST['cpassword']);
   $cpassword = filter_var($cpassword, FILTER_SANITIZE_STRING);

   $staff_no = $_POST['staff_no'];
   $staff_no = filter_var($staff_no, FILTER_SANITIZE_STRING);

   $faculty_id = $_POST['faculty_id'];
   $faculty_id = filter_var($faculty_id, FILTER_SANITIZE_STRING);

   $work_phone_no = $_POST['work_phone_no'];
   $work_phone_no = filter_var($work_phone_no, FILTER_SANITIZE_STRING);
 


   $select_user = $conn->prepare("SELECT * FROM `kpps` WHERE email = ?");
   $select_user->execute([$email,]);
   $row = $select_user->fetch(PDO::FETCH_ASSOC);

   if ($select_user->rowCount() > 0) {
      $message[] = 'email already exists!';
   } else {
      if ($password != $cpassword) {
         $message[] = 'confirm password not matched!';
      } else {
         $insert_user = $conn->prepare("INSERT INTO `kpps`(name , staff_no , email, password ,faculty_id, work_phone_no) VALUES(?,?,?,?,?,?)");
         $insert_user->execute([$kpp_name, $staff_no, $email, $password, $faculty_id, $work_phone_no ]);
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

   <?php include 'components/kpp_header.php'; ?>


   <br>
   <section class="form-container" styles="border-radius: 15px;">
      <form action="" method="post">

     
         <h3>Daftar Ketua Pusat Program</h3>
         <br>
         <br>
         <label class="bigger" style=" display: flex;flex-direction: row;" for="name">Nama Penuh :<span style="color: red;">*</span></label> 
         <input type="text" style="text-transform:capitalize; "name="kpp_name" required placeholder="" maxlength="70" class="box">

         
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

            <label class="bigger" style="display: flex;flex-direction: row;" for="name">Fakulti Yang Dipegang:<span style="color: red;">*</span></label> 
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

       

         <label class="bigger" style="display: flex;flex-direction: row;" for="name">No. Telefon :<span style="color: red;">*</span></label> 
         <input type="tel" name="work_phone_no" min="0" max="9999999999" placeholder="" required
            class="box" oninput="this.value = this.value.replace(/\s/g, '')">

         <input type="submit" style="border-radius:15px; text-transform:uppercase;" value="daftar" class="btn" name="submit">
         <p>Anda sudah ada akaun?</p>
         <a style="border-radius:15px; text-transform:uppercase;"href="kpp_login.php" class="option-btn">login</a>
      </form>


   </section>
   <br>

   <?php include 'components/kpp_footer.php';
   include 'components/scripts.php';
   ?>
  

   <script src="js/script.js"></script>
   
  
 

</body>

</html>