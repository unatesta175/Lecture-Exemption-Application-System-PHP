<?php

include 'components/connect.php';

session_start();

if (isset($_SESSION['trhea_id'])) {
   $trhea_id = $_SESSION['trhea_id'];
   $trhea_name = $_SESSION['trhea_name'];

} else {
   $trhea_id = '';
   $trhea_name = '';

}
;



if (isset($_POST['submit'])) {



   $trhea_name = $_POST['trhea_name'];
   $email = $_POST['email'];
   $staff_no = $_POST['staff_no'];
   
   $work_phone_no = $_POST['work_phone_no'];
 


   $update = $conn->prepare("UPDATE `trhea` SET trhea_name = ?, staff_no = ?, email = ?, work_phone_no= ? WHERE trhea_id = ?");
   $update->execute([$trhea_name , $staff_no , $email , $work_phone_no , $trhea_id]);
   $_SESSION['trhea_name'] =  $trhea_name ;
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
   <title>register</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>

<body>

   <?php include 'components/trhea_header.php'; ?>


   <br>
   <?php
   if (!isset($_SESSION['trhea_id'])) {
      header('location:trhea_login.php');
   } else {

      ?>
      <section class="form-container">

         <form action="" method="post">

            <?php

            $result = $conn->prepare("SELECT * FROM `trhea` WHERE trhea_id=?");
            $result->execute([$trhea_id]);



            if ($result->rowCount() > 0) {
               while ($row = $result->fetch(PDO::FETCH_ASSOC)) {

                  $trhea_name = $row['trhea_name'];
                  
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
            <input type="text" name="trhea_name" required placeholder="Isi nama penuh anda" maxlength="100" class="box"
               value="<?php echo $trhea_name; ?>">


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

   <?php include 'components/trhea_footer.php'; ?>

   <script src="js/script.js"></script>

</body>

</html>