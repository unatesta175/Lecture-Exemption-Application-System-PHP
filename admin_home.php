<?php
ob_start();
include 'components/connect.php';

session_start();



if (isset($_SESSION['admin_id'])) {
   $admin_id = $_SESSION['admin_id'];
 ;

} else {
   $admin_id = '';
   ;
   

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
      @media (max-width:768px) {

         html {
            font-size: 35%;
         }

      }

      .inputshow {

         background-color: gainsboro;
         border-radius: 15em;
      }
   </style>
</head>

<body>

   <?php include 'components/clerk_header.php';


if (!isset($_SESSION['admin_id'])) {
   header('location:admin_login.php');
} 

	$select_profile = $conn->prepare("SELECT * FROM `clerks` WHERE clerk_id = ?");
         $select_profile->execute([$admin_id]);
         if ($select_profile->rowCount() > 0) {
            $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
            
            
            $user_name= $fetch_profile["clerk_name"]; }?>

<!--$resultg = $conn->prepare("SELECT * FROM `clerks` WHERE clerk_id = ?");
$resultg->execute();

$current_date = date('Y-m-d');

if ($resultg->rowCount() > 0) {
    while ($rowg = $resultg->fetch(PDO::FETCH_ASSOC)) {
        $startDateg = $rowg['startDate'];
        $application_statg= $rowg['application_stat'];
        $application_id= $rowg['application_id'];
        
        if ($startDateg <= $current_date && $application_statg != 'Selesai' ) {
            
            // Update the application_stat in the database
            $updateQuery = $conn->prepare("UPDATE `applications` SET `application_stat`=? WHERE application_id=?");
            $updateQuery->execute(['Tamat Tempoh',$application_id]);
        }
    }
}-->
   


   <br>
   <br>
   <section style="width:90%;">

   <?php if (isset($_SESSION['admin_id'])) {
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

         <div style="margin-right:10px; box-shadow: var(--box-shadow);  border-radius: 15px; width:20%; " class="card">
            <div class="card-body">


               <p
                  style=" margin:auto; justify-content:center; align-items:center; font-size:2em; font-family:  'Roboto Condensed', sans-serif; display:flex; flex-direction:row;">
                  SISTEM ADMIN </p>


            </div>
         </div>
         <div style=" box-shadow: var(--box-shadow);  border-radius: 15px; width:100%; " class="card">
            <div class="card-body">
              
         
            

               <p
                  style=" margin:auto; justify-content:center; align-items:center; font-size:2em; font-family:  'Roboto Condensed', sans-serif; display:flex; flex-direction:row;">
                  SELAMAT DATANG KE WEBSITE KAMI &nbsp; <span
                     style="font-weight:bold; font-family:  'Roboto Condensed', sans-serif;">
                     <?php echo $clerk_name; ?>
                  </span></p>


            </div>
         </div>

      </div>






      <br>

   </section>
   <br>


   <section>


      <div style="  box-shadow: var(--box-shadow);  border-radius: 15px; width:100%;" class="card text-center mb-3">
         <div class="card-body">
            <h1 style="font-family:  'Roboto Condensed', sans-serif;" class="heading">SENARAI PERMOHONAN </h1>

           <section style="display:flex; flex-direction:row; justify-content: space-between;">


            </section>
            <section style="display:flex; flex-direction:row; justify-content: space-between;">




               <div style="  box-shadow: var(--box-shadow);  border-radius: 15px; width:19%;"
                  class="card text-center mb-3">
                  <div class="card-body">
                     <h5 style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class="card-title">
                        <BR>PERMOHONAN<br>BELUM DIBENARKAN
                        <BR>PENSYARAH
                     </h5>

                     <?php
                     $no1 = 0;
                  

                           $result = $conn->prepare("SELECT * FROM `applications` WHERE application_stat=? AND authorization_status =?");
                           $result->execute(['aktif', "pending",]);

                           if ($result->rowCount() > 0) {
                              while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                 $no1 += 1;
                              }
                           }

                        
                     ?>
                     <br>
                     <p style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class="card-text inputshow">
                        <?= $no1; ?>
                     </p>
                     <div style="justify-content:center; "><a
                           style="font-size:2em;font-family:  'Roboto Condensed', sans-serif; text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;"
                           class=" option-btn text-light btn me-1 underline"
                           href="admin_application.php?application_type=1">Lihat</a></div>

                  </div>
               </div>

               <div style="  box-shadow: var(--box-shadow);  border-radius: 15px; width:19%;"
                  class="card text-center mb-3">
                  <div class="card-body">
                     <h5 style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class="card-title">
                        <BR>PERMOHONAN<br>BELUM DILULUSKAN
                        <BR>KPP
                     </h5>

                     <?php
                     $no1 = 0;
                


                           $result = $conn->prepare("SELECT * FROM `applications` WHERE application_stat=? AND support_status =? AND authorization_status =?");
                           $result->execute(['aktif', "pending", "selesai"]);

                           if ($result->rowCount() > 0) {
                              while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                 $no1 += 1;
                              }
                           }

                        
                     ?>
                     <br>
                     <p style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class="card-text inputshow">
                        <?= $no1; ?>
                     </p>
                     <div style="justify-content:center; "><a
                           style="font-size:2em;font-family:  'Roboto Condensed', sans-serif; text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;"
                           class=" option-btn text-light btn me-1 underline"
                           href="admin_application.php?application_type=2">Lihat</a></div>

                  </div>
               </div>

              


               <div style="  box-shadow: var(--box-shadow);  border-radius: 15px; width:19%;"
                  class="card text-center mb-3">
                  <div class="card-body">
                     <h5 style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class="card-title">
                        <BR>JUMLAH<br>PERMOHONAN
                        <BR>TIDAK DILULUSKAN
                     </h5>

                     <?php
                     $no1 = 0;
                    


                           $result = $conn->prepare("SELECT * FROM `applications` WHERE  support_status = ?");
                           $result->execute([  "Tidak Diluluskan"]);

                           if ($result->rowCount() > 0) {
                              while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                 $no1 += 1;
                              }
                           }

                      
                     ?>
                     <br>
                     <p style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class="card-text inputshow">
                        <?= $no1; ?>
                     </p>
                     <div style="justify-content:center; "><a
                           style="font-size:2em;font-family:  'Roboto Condensed', sans-serif; text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;"
                           class=" option-btn text-light btn me-1 underline"
                           href="admin_application.php?application_type=3">Lihat</a></div>

                  </div>
               </div>

               <div style="  box-shadow: var(--box-shadow);  border-radius: 15px; width:19%;"
                  class="card text-center mb-3">
                  <div class="card-body">
                     <h5 style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class="card-title">
                        <BR>JUMLAH<br>PERMOHONAN<BR>SELESAI
                     </h5>

                     <?php
                     $no1 = 0;
                    

                           $result = $conn->prepare("SELECT * FROM `applications` WHERE application_stat=? ");
                           $result->execute(['selesai']);

                           if ($result->rowCount() > 0) {
                              while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                 $no1 += 1;
                              }
                           }

                        
                     ?>
                     <br>
                     <p style="font-size:2em; font-family:  'Roboto Condensed', sans-serif;"
                        class="card-text inputshow">
                        <?= $no1; ?>
                     </p>
                     <div style="justify-content:center; "><a
                           style="font-size:2em;font-family:  'Roboto Condensed', sans-serif; text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;"
                           class=" option-btn text-light btn me-1 underline"
                           href="admin_application.php?application_type=4">Lihat</a></div>

                  </div>
               </div>


               <div style="  box-shadow: var(--box-shadow);  border-radius: 15px; width:19%;"
                  class="card text-center mb-3">
                  <div class="card-body">
                     <h5 style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class="card-title">
                        <BR>JUMLAH<br> KESELURUHAN <BR> PERMOHONAN
                     </h5>

                     <?php
                     $no1 = 0;

                     $result = $conn->prepare("SELECT * FROM `applications`");
                     $result->execute();

                     if ($result->rowCount() > 0) {
                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                           $no1 += 1;
                        }
                     }




                     ?>
                     <br>
                     <p style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class=" inputshow card-text">
                        <?= $no1; ?>
                     </p>

                     <div style="justify-content:center; ">
                        <a style="font-size:2em;font-family:  'Roboto Condensed', sans-serif; text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;"
                           class=" option-btn text-light btn me-1 underline"
                           href="admin_application.php?application_type=5">Lihat</a>
                     </div>

               </div>





            </section>
         </div>
      </div>



   </section>



   <br>



   <section style="display:flex; flex-direction:row; justify-content: space-between;">


      <div style="  box-shadow: var(--box-shadow);  border-radius: 15px; width:100%;" class="card text-center mb-3">
         <div class="card-body">
            <h1 style="font-family:  'Roboto Condensed', sans-serif;" class="heading">SENARAI PENGGUNA 
            </h1>

            <section style="display:flex; flex-direction:row; justify-content: space-between;">





            


               <div style="  box-shadow: var(--box-shadow);  border-radius: 15px; width:49%;"
                  class="card text-center mb-3">
                  <div class="card-body">
                     <br>
                     <h5 style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class="card-title">JUMLAH
                        KESELURUHAN<BR>PELAJAR
                        <BR>BERDAFTAR
                     </h5>

                     <?php
                     $no1 = 0;

                     $result = $conn->prepare("SELECT * FROM `students`");
                     $result->execute();

                     if ($result->rowCount() > 0) {
                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                           $no1 += 1;
                        }
                     }




                     ?>
                     <br>
                     <p style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class=" inputshow card-text">
                        <?= $no1; ?>
                     </p>

                     <div style="justify-content:center; ">
                        <a style="font-size:2em;font-family:  'Roboto Condensed', sans-serif; text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;"
                           class=" option-btn text-light btn me-1 underline" href="admin_user.php?user_type=1">Lihat</a>
                     </div>

                  </div>
               </div>
               <div style="  box-shadow: var(--box-shadow);  border-radius: 15px; width:49%;"
                  class="card text-center mb-3">
                  <div class="card-body">
                     <br>
                     <h5 style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class="card-title">JUMLAH
                        KESELURUHAN<BR>STAFF
                        <BR>BERDAFTAR
                     </h5>

                     <?php
                     $no = 0;



                     $result = $conn->prepare("SELECT * FROM `lecturers`");
                     $result->execute();


                     if ($result->rowCount() > 0) {
                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {

                           $no++;

                        }
                     }


                     $result = $conn->prepare("SELECT * FROM `kpps`");
                     $result->execute();


                     if ($result->rowCount() > 0) {
                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {

                           $no++;

                        }
                     }


                     $result = $conn->prepare("SELECT * FROM `trhea`");
                     $result->execute();


                     if ($result->rowCount() > 0) {
                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {

                           $no++;

                        }
                     }

                     $result = $conn->prepare("SELECT * FROM `clerks`");
                     $result->execute();


                     if ($result->rowCount() > 0) {
                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {

                           $no++;

                        }
                     }




                     ?>
                     <br>
                     <p style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;" class="inputshow card-text">
                        <?= $no; ?>
                     </p>

                     <div style="justify-content:center; ">
                        <a style="font-size:2em;font-family:  'Roboto Condensed', sans-serif; text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;"
                           class=" option-btn text-light btn me-1 underline" href="admin_user.php?user_type=2">Lihat</a>
                     </div>

                  </div>
               </div>
            </section>


         </div>
      </div>
   </section>








   <section class="category">

      <h1 style="font-family:  'Roboto Condensed', sans-serif;" class="heading">services</h1>

      <div class="swiper category-slider">

         <div class="swiper-wrapper">



          
            <a href="admin_update_profile.php" class="swiper-slide slide underline">
               <i style="color :black; margin:20px" class="fa fa-person fa-5x fa-fw"></i>
               <h3 style="font-size:2em;font-family:  'Roboto Condensed', sans-serif;">PROFIL</h3>
            </a>

            <a href="components/clerk_logout.php" class="swiper-slide slide underline">
               <i style="color :black; margin:20px" class="fa fa-eject fa-fw fa-5x" "></i>
   <h3 style=" font-size:2em;font-family: 'Roboto Condensed' , sans-serif;">LOG KELUAR</h3>
            </a>

            <a href="admin_password.php" class="swiper-slide slide underline">
               <i style="color :black; margin:20px" class="fa fa-key fa-fw fa-5x" "></i>
         <h3>Tukar Kata Laluan</h3>
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


   <?php include 'components/clerk_footer.php';
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
               slidesPerView: 3,
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
               slidesPerView: 2,
            },
         },
      });





   </script>

</body>

</html>