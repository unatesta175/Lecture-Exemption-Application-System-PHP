<?php

include 'components/connect.php';

session_start();

if (isset($_SESSION['admin_id'])) {
   $admin_id = $_SESSION['admin_id'];
 

} else {
   $admin_id = '';
  

}
;



if (isset($_POST['submit'])) {



   $program_name = $_POST['program_name'];
   $program_code = $_POST['program_code'];
   $faculty_id = $_POST['faculty_id'];
   
   
 


   $update = $conn->prepare("UPDATE `programs` SET program_name = ?, program_code = ?, faculty_id = ? WHERE program_id = ?");
   $update->execute([$program_name , $program_code , $faculty_id ,$_GET['program_id']]);
   
   ?>
    <script>
        alert('ANDA BERJAYA KEMASKINI PROGRAM!');

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

            $result = $conn->prepare("SELECT * FROM `programs` WHERE program_id=?");
            $result->execute([$_GET['program_id']]);



            if ($result->rowCount() > 0) {
               while ($row = $result->fetch(PDO::FETCH_ASSOC)) {

                  $program_code = $row['program_code'];
                  $program_name = $row['program_name'];
                  
                  $faculty_id = $row['faculty_id'];

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

            <h3>Kemaskini Program</h3>
            <br>
            <br>
            <label class="bigger" style="display: flex;flex-direction: row;" for="name">Nama Program :</label>
            <input type="text" name="program_name"  required placeholder="Isi Nama Program " maxlength="100" class="box"
               value="<?php echo $program_name; ?>">


               <label class="bigger" style="display: flex;flex-direction: row;" for="name">Kod Program :</label>
            <input type="text" name="program_code" required placeholder="Isi Kod Program " maxlength="70" class="box"
               oninput="this.value = this.value.replace(/\s/g, '')" value=<?php echo $program_code ; ?>>

          
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