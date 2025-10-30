<?php
ob_start();
include 'components/connect.php';

session_start();

if (isset($_SESSION['admin_id'])) {
   $admin_id = $_SESSION['admin_id'];
 

} else {
   $admin_id = '';
  

}
;



if (isset($_POST['submit'])) {



   $clerk_name = $_POST['clerk_name'];
   $email = $_POST['email'];
   $staff_no = $_POST['staff_no'];
   
   $work_phone_no = $_POST['work_phone_no'];
 


   $update = $conn->prepare("UPDATE `clerks` SET clerk_name = ?, staff_no = ?, email = ?, work_phone_no= ? WHERE clerk_id = ?");
   $update->execute([$clerk_name , $staff_no , $email , $work_phone_no , $admin_id]);
   $_SESSION['admin_name'] =  $clerk_name ;
   ?>
    <script>
        alert('ANDA BERJAYA KEMASKINI MAKLUMAT DIRI ANDA!');

    </script>
    <?php
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

   <?php include 'components/clerk_header.php'; ?>


   <br>
   <?php
   if (!isset($_SESSION['admin_id'])) {
      header('location:admin_login.php');
   } else {

      ?>
      <section class="form-container">

         <form action="" method="post">

            <?php

            $result = $conn->prepare("SELECT * FROM `clerks` WHERE clerk_id=?");
            $result->execute([$admin_id]);



            if ($result->rowCount() > 0) {
               while ($row = $result->fetch(PDO::FETCH_ASSOC)) {

                  $clerk_name = $row['clerk_name'];
                  
                  $staff_no = $row['staff_no'];
                  $email = $row['email'];
                  
                  $work_phone_no = $row['work_phone_no'];




               }
            }
            ?>

            <h3>Kemaskini Profil</h3>
            <br>
            <br>
            <label class="bigger" style="display: flex;flex-direction: row;" for="name">Nama Penuh :</label>
            <input type="text" name="clerk_name" required placeholder="Isi nama penuh anda" maxlength="100" class="box"
               value="<?php echo $clerk_name; ?>">


               <label class="bigger" style="display: flex;flex-direction: row;" for="name">Emel :</label>
            <input type="text" name="email" required placeholder="Isi emel anda" maxlength="70" class="box"
               oninput="this.value = this.value.replace(/\s/g, '')" value=<?php echo $email; ?>>

          

            <label class="bigger" style="display: flex;flex-direction: row;" for="name">No. Staff UiTM :</label>
            <input type="text" name="staff_no" required placeholder="Isi no. staff UiTM anda" maxlength="70" class="box"
               oninput="this.value = this.value.replace(/\s/g, '')" value=<?php echo $staff_no; ?>>


            <label class="bigger" style="display: flex;flex-direction: row;" for="name">No. Telefon :</label>
            <input type="tel" name="work_phone_no" min="0" max="9999999999" placeholder="enter your home phone number"
               oninput=" this.value=this.value.replace(/\s/g, '' )" required class="box" value=<?php echo $work_phone_no; ?>>
            <input type="submit" style="border-radius:15px; text-transform:uppercase;" value="Kemaskini" class="btn"
               name="submit">

         </form>
      </section>"
      <?php
   }
   ?>
   <br>

   <?php include 'components/clerk_footer.php'; ?>

   <script src="js/script.js"></script>

</body>

</html>