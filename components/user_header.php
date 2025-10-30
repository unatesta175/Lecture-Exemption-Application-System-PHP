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

   <div style="display:flex;flex-direction: row;align-items: center;
      justify-content: center;"><div>
   <a href="home.php"><img class=" underline"  style=" margin-top: 10px;
      margin-bottom: 10px;"width="auto" height="70" src="./images/logoS.png" alt=""></a>
   </div><div> <a href="home.php"><img class=" underline" width="auto" height="100" src="./images/a.png" alt=""></a>
   </div>

</div>


      <nav class="navbar">
         <a href="home.php" class="underline"><i class="fa fa-home fa-fw" style="margin-right:15px"></i>ANJUNG</a>
         <a href="application_menu.php" class="underline"><i class="fa fa-sliders fa-fw"
               style="margin-right:15px"></i>PERMOHONAN</a>
         <a href="update_profile.php" class="underline"><i class="fa fa-database fa-fw"
               style="margin-right:15px"></i>PROFILE</a>
      </nav>

      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>

      </div>



      <div class="profile">
         <?php
         $select_profile = $conn->prepare("SELECT * FROM `students` WHERE student_id = ?");
         $select_profile->execute([$user_id]);
         if ($select_profile->rowCount() > 0) {
            $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
            ?>
            <p>
               <?= $fetch_profile["name"]; ?>
            </p>


            
            <a href="update_profile.php" style="border-radius:15px; text-transform:uppercase; "
               class="btn underline">Kemaskini profile</a>
            <div class="flex-btn">
               <a href="user_login.php" style="border-radius:15px; text-transform:uppercase; "
                  class="option-btn underline">Login</a>
            </div>
            <a href="components/user_logout.php" style="border-radius:15px; text-transform:uppercase; "
               class="delete-btn underline" onclick="return confirm('logout from the website?');">logout</a>
            <?php
         } else {
            ?>

            <p>Sila login atau daftar dahulu!</p>
            <div class="flex-btn">
               <a href="user_register.php" style="border-radius:15px; text-transform:uppercase; "
                  class="option-btn underline">Daftar</a>
               <a href="user_login.php" style="border-radius:15px; text-transform:uppercase; "
                  class="option-btn underline">login</a>
            </div>
            <?php
         }
         ?>



   </section>

</header>