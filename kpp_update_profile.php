<?php
ob_start();
include 'components/connect.php';

session_start();

if (isset($_SESSION['kpp_id'])) {
   $kpp_id = $_SESSION['kpp_id'];
 

} else {
   $kpp_id = '';
   

}
;



if (isset($_POST['submit'])) {



   $kpp_name = $_POST['kpp_name'];
   $email = $_POST['email'];
   $staff_no = $_POST['staff_no'];
   $faculty_id =$_POST['faculty_id'];
   
   $work_phone_no = $_POST['work_phone_no'];
 


   $update = $conn->prepare("UPDATE `kpps` SET name = ?, staff_no = ?, email = ?,faculty_id=? , work_phone_no= ? WHERE kpp_id = ?");
   $update->execute([$kpp_name , $staff_no , $email ,$faculty_id, $work_phone_no , $kpp_id]);
   $_SESSION['kpp_name'] =  $kpp_name ;
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

   <?php include 'components/kpp_header.php'; ?>


   <br>
   <?php
   if (!isset($_SESSION['kpp_id'])) {
      header('location:kpp_login.php');
   } else {

      ?>
      <section class="form-container">

         <form action="" method="post">

            <?php

            $result = $conn->prepare("SELECT * FROM `kpps` WHERE kpp_id=?");
            $result->execute([$kpp_id]);



            if ($result->rowCount() > 0) {
               while ($row = $result->fetch(PDO::FETCH_ASSOC)) {

                  $kpp_name = $row['name'];
                  $faculty_id = $row['faculty_id'];
                  $staff_no = $row['staff_no'];
                  $email = $row['email'];
                  
                  $work_phone_no = $row['work_phone_no'];




               }
            }

            $result2 = $conn->prepare("SELECT * FROM `faculty` WHERE faculty_id=?");
                  $result2->execute([$faculty_id ]);
                  if ($result2->rowCount() > 0) {
                     while ($row2 = $result2->fetch(PDO::FETCH_ASSOC)) {

                       
                        $faculty_name = $row2['name'];
                        $faculty_code = $row2['faculty_code'];
                        

                     }
                  }
            ?>

            <h3>Kemaskini Profil</h3>
            <br>
            <br>
            <label class="bigger" style="display: flex;flex-direction: row;" for="name">Nama Penuh :</label>
            <input type="text" name="kpp_name" required placeholder="Isi nama penuh anda" maxlength="100" class="box"
               value="<?php echo $kpp_name; ?>">


               <label class="bigger" style="display: flex;flex-direction: row;" for="name">Emel :</label>
            <input type="text" name="email" required placeholder="Isi emel anda" maxlength="70" class="box"
               oninput="this.value = this.value.replace(/\s/g, '')" value=<?php echo $email; ?>>

          

            <label class="bigger" style="display: flex;flex-direction: row;" for="name">No. Staff UiTM :</label>
            <input type="text" name="staff_no" required placeholder="Isi no. staff UiTM anda" maxlength="70" class="box"
               oninput="this.value = this.value.replace(/\s/g, '')" value=<?php echo $staff_no; ?>>

               <label class="bigger" style="display: flex;flex-direction: row;" for="name">Fakulti :</label>
       
            <select name="faculty_id" class="box" required placeholder="Isi fakulti anda">
               <option value="<?php echo $faculty_id; ?>" selected hidden><?php echo $faculty_code . ' - ' . $faculty_name; ?>
               </option>


               <?php

               $result = $conn->prepare("SELECT * FROM `faculty`");
               $result->execute();
               if ($result->rowCount() > 0) {
                  while ($row = $result->fetch(PDO::FETCH_ASSOC)) { ?>
                     <option value="<?php echo $row['faculty_id']; ?>"><?php echo $row['faculty_code'] . " - " . $row['name']; ?></option>
                  <?php }
               } ?>
            </select>


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

   <?php include 'components/kpp_footer.php'; ?>

   <script src="js/script.js"></script>

</body>

</html>