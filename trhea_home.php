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

   <?php include 'components/trhea_header.php'; 
   
   if (!isset($_SESSION['trhea_id'])) {
      header("location:trhea_login.php");
   } ?>


   <br>
   <br>
   <section style="width:90%;">

   <div style="display:flex; flex-direction:row;">

<div style="margin-right:10px; box-shadow: var(--box-shadow);  border-radius: 15px; width:20%; " class="card">
   <div class="card-body">


      <p
         style=" text-align:center; margin-left:10px;margin:auto; justify-content:center; align-items:center; font-size:2em; font-family:  'Roboto Condensed', sans-serif; display:flex; flex-direction:row;">
         T.REKTOR HEA </p>


   </div>
</div>
<div style="margin:auto; box-shadow: var(--box-shadow);  border-radius: 15px; width:100%; " class="card">
   <div class="card-body">


      <p
         style="margin:auto;  justify-content:center; align-items:center; font-size:2em; font-family:  'Roboto Condensed', sans-serif; display:flex; flex-direction:row;">
         SELAMAT DATANG KE WEBSITE KAMI , <span style="  font-weight:bold;">
            <?php echo $trhea_name ?>
         </span></p>


   </div>
</div>

</div>
   


      <br>
      <div style="box-shadow: var(--box-shadow);  border-radius: 15px;" class="card text-center">

         <div class="card-body" style="flex-wrap: nowrap;">
            <h1 class="card-title heading ">

               <p style="-webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;font-size:1em; font-weight:bold;font-family:  'Roboto Condensed', sans-serif; ">
                  SISTEM PERMOHONAN ATAS TALIAN PENGECUALIAN KULIAH BAGI PELAJAR UITM CAWANGAN JOHOR KAMPUS SEGAMAT</p>

            </h1>
            <p class="card-text" style="font-size:2em;" style="font-family: 'Roboto Condensed', sans-serif;">Perhatian
               kepada pelajar yang ingin mohon pengecualian kuliah atau
               kelas atas
               sebab-sebab yang tertentu
               ,sila isi borang permohonan pengecualian
               kuliah ini untuk mendapatkan kelulusan daripada pihak Universiti.</p>

            <!-- <div style="display:flex; flex-direction:row"><a href="#" class="btn me-2">Isi Sekarang</a>
            <a href="#" class="btn me-2">Hubungi HEA jika ada sebarang masalah</a></div>
             -->
            <div style="display: flex; align-items: center; justify-content: center; flex-wrap: wrap;">
               <a href="trhea_approval_menu.php"
                  style=" text-transform: uppercase; border-radius: 15px; font-size: 160%; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 50%;"
                  class="btn me-2 option-btn">Validasi Sekarang</a>
               <a href="#footerx"
                  style=" text-transform: uppercase;border-radius: 15px; font-size: 160%; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 50%;"
                  class="btn me-2">Hubungi HEA </a>
            </div>
         </div>

      </div>
   </section>
   <br>




   <section class="category">

      <h1 class="heading">services</h1>

      <div class="swiper category-slider">

         <div class="swiper-wrapper">



            <a href="trhea_approval_menu.php" class="swiper-slide slide underline">
               <i style="color :black; margin:20px" class="fa fa-sliders fa-5x fa-fw"></i>
               <h3>PERMOHONAN</h3>
            </a>

            <!-- <a href="record.php" class="swiper-slide slide underline">
               <i style="color :black; margin:20px" class="fa fa-database fa-5x fa-fw"></i>
               <h3>REKOD </h3>
            </a> -->


            <a href="trhea_update_profile.php" class="swiper-slide slide underline">
               <i style="color :black; margin:20px" class="fa fa-sliders fa-5x fa-fw"></i>
               <h3>PROFIL</h3>
            </a>


            <a href="components/trhea_logout.php" class="swiper-slide slide underline">
               <i style="color :black; margin:20px" class="fa fa-eject fa-fw fa-5x" "></i>
         <h3>LOG KELUAR</h3>
      </a>
         

   </div>

   <div class=" swiper-pagination">
         </div>

      </div>

   </section>

   <!-- <section class="home-products">

   <h1 class="heading">latest products</h1>

   <div class="swiper products-slider">

   <div class="swiper-wrapper">

   </div>

   <div class="swiper-pagination"></div>

   </div>

</section> -->


   <?php include 'components/trhea_footer.php';
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
         spaceBetween: 20,
         pagination: {
            el: ".swiper-pagination",
            clickable: true,
         },
         breakpoints: {
            0: {
               slidesPerView: 2,
            },
            650: {
               slidesPerView: 3,
            },
            768: {
               slidesPerView: 3,
            },
            1024: {
               slidesPerView: 3,
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