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

<?php
$current_page = basename($_SERVER['PHP_SELF']);

if ($current_page !== 'admin_login.php') {
    echo '
    <div style="display:flex;flex-direction: row;align-items: center;
    justify-content: center;">
        <div>
            <a href="admin_home.php">
                <img class="underline" style="margin-top: 10px; margin-bottom: 10px;" width="auto" height="70" src="./images/logoS.png" alt="">
            </a>
        </div>
        <div>
            <a href="admin_home.php">
                <img class="underline" width="auto" height="100" src="./images/a.png" alt="">
            </a>
        </div>
    </div>';
} else {
    echo '
    <div style="display:flex;flex-direction: row;align-items: center;
    justify-content: center;">
        <div>
            <img class="underline" style="margin-top: 10px; margin-bottom: 10px;" width="auto" height="70" src="./images/logoS.png" alt="">
        </div>
        <div>
            <img class="underline" width="auto" height="100" src="./images/a.png" alt="">
        </div>
    </div>';
}
?>

      <nav class="navbar">

      <?php if (isset($_SESSION['admin_id'])) { 
        echo '<a href="admin_home.php" class="underline"><i class="fa fa-home fa-fw" style="margin-right:15px"></i>DASHBOARD</a>'; 
    } ?> 
        
        
         <a href="admin_update_profile.php" class="underline"><i class="fa fa-database fa-fw"
               style="margin-right:15px"></i>PROFILE</a>

         <a href="admin_program.php" class="underline"><i class="fa fa-layer-group fa-fw"
               style="margin-right:15px"></i>PROGRAMS</a>
               

      </nav>

      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>

      </div>



      <div class="profile">
         <?php
         $select_profile = $conn->prepare("SELECT * FROM `clerks` WHERE clerk_id = ?");
         $select_profile->execute([$admin_id]);
         if ($select_profile->rowCount() > 0) {
            $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
            ?>
            <p>
               <?php echo $clerk_name =$fetch_profile["clerk_name"]; ?>
            </p>
            <a href="admin_update_profile.php" style="border-radius:15px; text-transform:uppercase; "
               class="btn underline">Kemaskini profile</a>
            <div class="flex-btn">
               <a href="admin_login.php" style="border-radius:15px; text-transform:uppercase; "
                  class="option-btn underline">Login</a>
            </div>
            <a href="components/clerk_logout.php" style="border-radius:15px; text-transform:uppercase; "
               class="delete-btn underline" onclick="return confirm('logout from the website?');">logout</a>
            <?php
         } else {
            ?>

            <p>Sila login dahulu!</p>
            <div class="flex-btn">
               <!--<a href="admin_register.php" style="border-radius:15px; text-transform:uppercase; "
                  class="option-btn underline">Daftar</a>-->
               <a href="admin_login.php" style="border-radius:15px; text-transform:uppercase; "
                  class="option-btn underline">login</a>
            </div>
            <?php
         }
         ?>

         <script>
            function toggleDropdown(event) {
               // Prevent the link from following its href
               event.preventDefault();

               // Get the dropdown menu element
               var dropdownMenu = document.getElementById("dropdown-menu");

               // Toggle its visibility
               if (dropdownMenu.style.display === "none") {
                  dropdownMenu.style.display = "flex";
               } else {
                  dropdownMenu.style.display = "none";
               }
            }
         </script>



   </section>

</header>