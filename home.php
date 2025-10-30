<?php
ob_start();
include 'components/connect.php';

session_start();



if (isset($_SESSION['user_id'])) {
   $user_id = $_SESSION['user_id'];
   
} else {
   $user_id = '';
   
}
;

?>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>eleas.uitm.edu.my</title>
   <link rel="website icon" type="png" href="images/logoS.png">

   <!--Bootstrap CSS-->
   <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous" /> -->

   <!--Bootstrap CSS latest(jangan guna nanti coding berubah)-->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

   <!--stylesheet CSS-->
   <link rel="stylesheet" href="css/style.css">

   <!--editable Bootstrap CSS-->
   <!-- <link rel="stylesheet" href="css/bootstrap.css"> -->

   <!--import box icons-->
   <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> -->

   <!-- FONT IMPORT -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300&display=swap" rel="stylesheet">

   <style>
      @media (max-width:768px){

html{
font-size: 35%;
}

}
   
   </style>
</head>

<body>

   <?php include 'components/user_header.php';
   
   if (!isset($_SESSION['user_id'])) {
      header('location:user_login.php');
   } 
   
   
   $select_profile = $conn->prepare("SELECT * FROM `students` WHERE student_id = ?");
         $select_profile->execute([$user_id]);
         if ($select_profile->rowCount() > 0) {
            $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
            
            
            $user_name= $fetch_profile["name"]; }
            
      
            ?>


   <br>
   <br>
   <section style="width:90%;">
   
   <?php if (isset($_SESSION['user_id'])) {
     echo "<div id='success-alert' style='font-size:1.5em; margin-bottom:0px;' class='alert alert-success alert-dismissible fade show' role='alert'>
        <strong>Anda telah berjaya login ke akaun anda!.</strong>
        <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close' onclick='closeAlert()'></button>
    </div>";
} ?>

<script>
    function closeAlert() {
        document.getElementById("success-alert").style.display = "none";
    }
</script>
<br>
   <div style="display:flex; flex-direction:row;">
   


         <div style="margin-right:10px; box-shadow: var(--box-shadow);  border-radius: 15px; width:25%; " class="card">
            <div class="card-body">


               <p
                  style=" margin:5px; justify-content:center; align-items:center; font-size:2em; font-family:  'Roboto Condensed', sans-serif; display:flex; flex-direction:column;">
                  PELAJAR </p>


                  
            </div>
         </div>
         <div style=" box-shadow: var(--box-shadow);  border-radius: 15px; width:90%; " class="card">
            <div class="card-body">


               <p
                  style=" margin:5px; justify-content:center; align-items:center; font-size:2em; font-family:  'Roboto Condensed', sans-serif; display:flex; flex-direction:row;">
                  SELAMAT DATANG &nbsp; <span style="font-weight:bold; ">
                     <?php echo $user_name ?>
                  </span></p>


            </div>
         </div>

      </div>
      <br>
      <div style="box-shadow: var(--box-shadow);  border-radius: 15px; width: 100%;" class="card text-center">

         <div class="card-body" style="flex-wrap: nowrap; ">
            <h1 class="card-title heading ">

               <p style="-webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;font-size:em; font-weight:bold;font-family:  'Roboto Condensed', sans-serif; ">
                  SISTEM PERMOHONAN PENGECUALIAN KULIAH ATAS TALIAN </p>

            </h1>
            <p class="card-text" style="font-size:2em;" style="font-family: 'Roboto Condensed', sans-serif;">Perhatian kepada pelajar yang ingin mendapatkan pengecualian kuliah atau kelas, sila gunakan borang permohonan pengecualian kuliah atas talian ini untuk mendapatkan kelulusan daripada pihak Universiti.</p>

            <!-- <div style="display:flex; flex-direction:row"><a href="#" class="btn me-2">Isi Sekarang</a>
            <a href="#" class="btn me-2">Hubungi HEA jika ada sebarang masalah</a></div>
             -->
            <div style="display: flex; align-items: center; justify-content: center; flex-wrap: wrap;">
               <a href="application_menu.php"
                  style=" text-transform: uppercase; border-radius: 15px; font-size: 200%; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 50%;"
                  class="option-btn text-light btn me-1 underline">Isi Sekarang</a>
               <a href="#footerx"
                  style=" text-transform: uppercase;border-radius: 15px; font-size: 200%; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 50%;"
                  class=" text-light btn me-1 underline">Hubungi HEA </a>
            </div>
         </div>

      </div>
   </section>
   <br>





   <section class="category">

      <h1 class="heading">services</h1>

      <div class="swiper category-slider">

         <div class="swiper-wrapper">
			


            <a href="application_menu.php" class="swiper-slide slide underline">
               <i style="color:black; height:2em; width:auto; margin:center;  display:flex; align-items: center; justify-content: center;" class="fa fa-sliders fa-5x fa-fw"></i>
               <h3>REKOD</h3>
            </a>

            <!-- <a href="record.php" class="swiper-slide slide underline">
               <i style="color :black; margin:20px" class="fa fa-database fa-5x fa-fw"></i>
               <h3>REKOD </h3>
            </a> -->


            <a href="update_profile.php" class="swiper-slide slide underline">
               <i style="color:black; height:2em; width:auto; margin:center; display:flex; align-items: center; justify-content: center;" class="fa fa-person fa-5x fa-fw"></i>
               <h3>PROFIL</h3>
            </a>


            <a href="components/user_logout.php" class="swiper-slide slide underline">
               <i style="color:black; height:2em; width:auto; margin:center;display:flex; align-items: center; justify-content: center;" class="fa fa-eject fa-fw fa-5x" "></i>
         <h3>LOG KELUAR</h3>
      </a>

      <a href="user_password.php" class="swiper-slide slide underline">
               <i style="color:black; height:2em; width:auto; margin:center; display:flex; align-items: center; justify-content: center;" class="fa fa-key fa-fw fa-5x" "></i>
         <h3>TUKAR KATA LALUAN</h3>
      </a>
         

   </div>

   <div class=" swiper-pagination">
         </div>

      </div>

   </section>



   <?php include 'components/footer.php';
   // include 'components/scripts.php';
   
   ?>

   <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

   <script src="js/script.js"></script>

   <script>


      var swiper = new Swiper(".home-slider", {
         loop: true,
         spaceBetween: 20,
         pagination: {
            el: ".swiper-pagination",
            clickable: true,
         },
      });

      var swiper = new Swiper(".category-slider", {
         loop: true,
         spaceBetween: 10,
         pagination: {
            el: ".swiper-pagination",
            clickable: true,
         },
         breakpoints: {
            0: {
               slidesPerView: 4,
            },
            650: {
               slidesPerView: 4,
            },
            768: {
               slidesPerView: 4,
            },
            1024: {
               slidesPerView: 4,
            },
         },
      });

      var swiper = new Swiper(".products-slider", {
         loop: true,
         spaceBetween: 20,
         pagination: {
            el: ".swiper-pagination",
            clickable: true,
         },
         breakpoints: {
            550: {
               slidesPerView: 2,
            },
            768: {
               slidesPerView: 2,
            },
            1024: {
               slidesPerView: 3,
            },
         },
      });




   </script>

</body>

</html>