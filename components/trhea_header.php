<?php
if (isset($message)) {
   foreach ($message as $message) {
      echo '
         <div class="message">
            <span >' . $message . '</span>
       <div style=" display: flex; ">
          <p style="font-family: Roboto; font-size:20px; margin-right:10px; color:#e74c3c;">Close this</p>
          <i class="fas fa-times" onclick="this.parentElement.parentElement.remove();"> </i>
      </div>
         </div>
         ';
   }
}
?>



<header class="header">

   <section class="flex">

      <a href="home.php"><img class=" underline" width="auto" height="100" src="./images/a.png" alt=""></a>


      <nav class="navbar">
         <a href="trhea_home.php" class="underline"><i class="fa fa-home fa-fw" style="margin-right:15px"></i>ANJUNG</a>
         <a href="trhea_approval_menu.php" class="underline"><i class="fa fa-sliders fa-fw"
               style="margin-right:15px"></i>PERMOHONAN</a>
         <a href="trhea_update_profile.php" class="underline"><i class="fa fa-database fa-fw"
               style="margin-right:15px"></i>PROFILE</a>
      </nav>

      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>

      </div>



      <div class="profile">
         <?php
         $select_profile = $conn->prepare("SELECT * FROM `trhea` WHERE trhea_id = ?");
         $select_profile->execute([$trhea_id]);
         if ($select_profile->rowCount() > 0) {
            $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
            ?>
            <p>
               <?= $fetch_profile["trhea_name"]; ?>
            </p>
            <a href="trhea_update_profile.php" style="border-radius:15px; text-transform:uppercase; "
               class="btn underline">Kemaskini profile</a>
            <div class="flex-btn">
               <a href="trhea_login.php" style="border-radius:15px; text-transform:uppercase; "
                  class="option-btn underline">Login</a>
            </div>
            <a href="components/trhea_logout.php" style="border-radius:15px; text-transform:uppercase; "
               class="delete-btn underline" onclick="return confirm('logout from the website?');">logout</a>
            <?php
         } else {
            ?>

            <p>Sila login atau daftar dahulu!</p>
            <div class="flex-btn">
               <a href="trhea_register.php" style="border-radius:15px; text-transform:uppercase; "
                  class="option-btn underline">Daftar</a>
               <a href="trhea_login.php" style="border-radius:15px; text-transform:uppercase; "
                  class="option-btn underline">login</a>
            </div>
            <?php
         }
         ?>



   </section>

</header>