<?php

include 'components/connect.php';

session_start();

if (isset($_SESSION['admin_id'])) {
    $admin_id = $_SESSION['admin_id'];
    $admin_name = $_SESSION['admin_name'];

} else {
    $admin_id = '';
    $admin_name = '';

}
;




?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>application</title>


    <!-- Ikut urutan ni kalau tak dia tak jadi -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <!-- import only this as only css will produce the best size table as big -->
    <!-- <link rel="stylesheet" href="css/style1.css"> -->


    <!-- import only this as only css will produce the standard small table-->
    <link rel="stylesheet" href="css/style.css">

    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />

    <!-- FONT IMPORT -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300&display=swap" rel="stylesheet">

    <style>
        /* default max width is 600px */
        @media only screen and (max-width: 300px) {
            table {
                width: 100%;
            }

            thead {
                display: none;
            }

            tr:nth-of-type(2n) {
                background-color: inherit;
            }

            tr td:first-child {
                background: #f0f0f0;
                font-weight: bold;
                font-size: 1em;
                text-align: center;
            }

            tbody td {
                display: block;
                text-align: center;
            }

            tbody td:before {
                content: attr(data-th);
                display: block;
                text-align: left;
            }
        }

        @media (max-width:768px) {

            html {
                font-size: 35%;
            }

        }
    </style>
</head>

<body>

    <?php
    ob_start(); // start output buffering
    include 'components/clerk_header.php'; ?>


    <br>
    <?php
    if (!isset($_SESSION['admin_id'])) {
        header('location:admin_login.php');
    } else {

        ?>

        <?php if ($_GET['user_type'] == 1) {
            echo ' <div class="container " styles="border-radius: 15px;">

<div class="row">
    <div class="col-lg-12">
        <div class="card card-default rounded-0 shadow">
            <div class="card-header">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-8">
                        <h1 class="card-title"
                            style="display: flex;  display: flex; align-items: center; font-family: Roboto Condensed, sans-serif; ">
                            CARIAN PELAJAR
                            
                        </h1>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-end justify-content-end ">
                        <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">

                        </div>
                    </div>

                </div>
                <div style="clear:both"></div>
            </div>
            <div class="card-body">

            
            <br>
                            
            <a id="export-btn" class=" option-btn text-light btn me-1 underline"
                                       style=" text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 15%;">
                                       EXPORT TO EXCEL
                                    </a>
                                    
                                    <br>
                <div class="row">
                    
                    <div class="col-sm-12 table-responsive" style="font-size:162.5%;">
                        <table id="myTable" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Nama Pelajar</th>
                                    <th>kod Program</th>


                                    <th>Fakulti</th>
                                    <th>Semester</th>
                                    <th>Emel</th>
                                    <th>No. Pelajar</th>
                                    <th>No. Telefon</th>
                                    <th>No. Telefon Rumah</th>

                                
                                    <th>Tindakan</th>


                                </tr>
                            </thead>
                            <tbody>'; ?>
            <?php

            $no = 1;
            $resultz = $conn->prepare("SELECT * FROM `programs` WHERE clerk_name=?");
            $resultz->execute([$admin_name]);

            if ($resultz->rowCount() > 0) {
                while ($rowz = $resultz->fetch(PDO::FETCH_ASSOC)) {

                    $program_code_admin = $rowz['program_code'];



                    $result = $conn->prepare("SELECT * FROM `students` WHERE  program_code =?");
                    $result->execute([$program_code_admin]);


                    if ($result->rowCount() > 0) {
                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                            $name = $row['name'];
                            $email = $row['email'];
                            $student_no = $row['student_no'];
                            $program_code = $row['program_code'];
                            $faculty = $row['faculty'];
                            $semester = $row['semester'];
                            $phone_no = $row['phone_no'];
                            $home_phone_no = $row['home_phone_no'];
                            $student_id = $row['student_id'];




                            echo '<tr>
                                                <th>' . $no . '</th>
                                                <td>' . $name . '</td>
                                                <td>' . $program_code . '</td>
            
                                        <td>' . $faculty . '</td>
                                                <td>' . $semester . '</td>
                                                <td>' . $email . '</td>
                                                <td>' . $student_no . '</td>
                                                <td>' . $phone_no . '</td>
                                                <td>' . $home_phone_no . '</td>	
                                                   <td>

                                           <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">
                                           <a class=" option-btn text-light btn me-1 underline" href="admin_application_view.php?view_id=' . $student_id . '" 
                                           style="text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;">
                                           Lihat
                                        </a>

                                            </div>

                                
                                </td>
                                </tr>';
                            $no++;

                        }
                    }
                }
            }
            ?>
            <?php echo
                '</tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>';
        } 
         else if ($_GET['user_type'] == 2) {
            echo ' <div class="container " styles="border-radius: 15px;">

    <div class="row">
        <div class="col-lg-12">
            <div class="card card-default rounded-0 shadow">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <h1 class="card-title"
                                style="display: flex;  display: flex; align-items: center; font-family: Roboto Condensed, sans-serif; ">
                                CARIAN STAFF
                            </h1>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-end justify-content-end ">
                            <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">
    
                            </div>
                        </div>
    
                    </div>
                    <div style="clear:both"></div>
                </div>
                <div class="card-body">
                <br>
                            
                <a id="export-btn" class=" option-btn text-light btn me-1 underline"
                                           style=" text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 15%;">
                                           EXPORT TO EXCEL
                                        </a>
                                        
                                        <br>
                    <div class="row">
                        
                        <div class="col-sm-12 table-responsive" style="font-size:162.5%;">
                            <table id="myTable" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Nama Pensyarah</th>
                                        <th>Emel</th>
    
    
                                        <th>No. Staff</th>
                                        <th>Kod Program Yang Diuruskan</th>
                                        <th>Fakulti</th>
                                        <th>No. Telefon</th>
                                        <th>Peranan</th>
                                        
    
                                    
                                        <th>Tindakan</th>
    
    
                                    </tr>
                                </thead>
                                <tbody>'; ?>
                <?php

                $no = 1;



                $result = $conn->prepare("SELECT * FROM `lecturers`");
                $result->execute();


                if ($result->rowCount() > 0) {
                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                        $lecturer_name = $row['lecturer_name'];
                        $lecturer_email = $row['email'];
                        $lecturer_no = $row['staff_no'];
                        $lecturer_program_code = $row['program_code'];
                        $lecturer_faculty = $row['faculty'];


                        $lecturer_work_phone_no = $row['work_phone_no'];
                        $lecturer_id = $row['lecturer_id'];





                        echo '<tr>
                                                    <th>' . $no . '</th>
                                                    <td>' . $lecturer_name . '</td>
                                                    <td>' . $lecturer_email . '</td>
                
                                            <td>' . $lecturer_no . '</td>
                                            <td>' . $lecturer_program_code . '</td>
                                                    <td>' . $lecturer_faculty . '</td>
                                                    <td>' . $lecturer_work_phone_no . '</td>
                                                    <td>' . "Pensyarah" . '</td>
                                                       <td>
    
                                               <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">
                                               <a class=" option-btn text-light btn me-1 underline" href="admin_application_view.php?view_id=' . $lecturer_id . '" 
                                               style="text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;">
                                               Lihat
                                            </a>
    
                                                </div>
    
                                    
                                    </td>
                                    </tr>';
                        $no++;

                    }
                }


                $result = $conn->prepare("SELECT * FROM `kpps`");
                $result->execute();


                if ($result->rowCount() > 0) {
                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                        $kpp_name = $row['name'];
                        $kpp_email = $row['email'];
                        $kpp_no = $row['staff_no'];

                        $kpp_faculty = $row['faculty'];


                        $kpp_work_phone_no = $row['work_phone_no'];
                        $kpp_id = $row['kpp_id'];





                        echo '<tr>
                                                    <th>' . $no . '</th>
                                                    <td>' . $kpp_name . '</td>
                                                    <td>' . $kpp_email . '</td>
                
                                            <td>' . $kpp_no . '</td>
                                            <td>' . " - " . '</td>
                                                    <td>' . $kpp_faculty . '</td>
                                                    <td>' . $kpp_work_phone_no . '</td>
                                                    <td>' . "Ketua Pusat Program" . '</td>
                                                    
                                                       <td>
    
                                               <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">
                                               <a class=" option-btn text-light btn me-1 underline" href="admin_application_view.php?view_id=' . $kpp_id . '" 
                                               style="text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;">
                                               Lihat
                                            </a>
    
                                                </div>
    
                                    
                                    </td>
                                    </tr>';
                        $no++;

                    }
                }


                $result = $conn->prepare("SELECT * FROM `trhea`");
                $result->execute();


                if ($result->rowCount() > 0) {
                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                        $trhea_name = $row['trhea_name'];
                        $trhea_email = $row['email'];
                        $trhea_no = $row['staff_no'];



                        $trhea_work_phone_no = $row['work_phone_no'];
                        $trhea_id = $row['trhea_id'];





                        echo '<tr>
                                                    <th>' . $no . '</th>
                                                    <td>' . $trhea_name . '</td>
                                                    <td>' . $trhea_email . '</td>
                
                                            <td>' . $trhea_no . '</td>
                                            <td>' . " - " . '</td>
                                            <td>' . " - " . '</td>  
                                                    <td>' . $trhea_work_phone_no . '</td>
                                                    <td>' . "Timbalan Rektor Hal Ehwal Akademik" . '</td>
                                                    
                                                       <td>
    
                                               <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">
                                               <a class=" option-btn text-light btn me-1 underline" href="admin_application_view.php?view_id=' . $trhea_id . '" 
                                               style="text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;">
                                               Lihat
                                            </a>
    
                                                </div>
    
                                    
                                    </td>
                                    </tr>';
                        $no++;

                    }
                }

                $result = $conn->prepare("SELECT * FROM `clerks`");
                $result->execute();


                if ($result->rowCount() > 0) {
                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                        $clerk_name = $row['clerk_name'];
                        $clerk_email = $row['email'];
                        $clerk_no = $row['staff_no'];



                        $clerk_work_phone_no = $row['work_phone_no'];
                        $clerk_id = $row['clerk_id'];





                        echo '<tr>
                                                    <th>' . $no . '</th>
                                                    <td>' . $clerk_name . '</td>
                                                    <td>' . $clerk_email . '</td>
                
                                                    <td>' . $clerk_no . '</td>
                							        '; ?>
                    <?php echo '<td>'; ?>




                        <?php
                        $noC = 0;
                        $result4 = $conn->prepare("SELECT * FROM `programs` WHERE clerk_name=?");
                        $result4->execute([$clerk_name]);
                        if ($result4->rowCount() > 0) {
                            while ($row4 = $result4->fetch(PDO::FETCH_ASSOC)) {

                                $program_code = $row4['program_code'];

                                $noC = $noC + 1;
                                ?>

                                    <p style="font-size:100%;">
                                <?php echo "(" . $noC . "\n" . ")" . $program_code .
                                    "\n"; ?>
                                    </p>

                            <?php
                            }
                        } else {

                            echo " - ";
                        }
                        ?>
                    <?php echo '</td>'; ?>
                    <?php echo
                        '<td>' . ' - ' . '</td>
                                                    <td>' . $clerk_work_phone_no . '</td>
                                                    <td>' . "Sistem Admin" . '</td>
                                                    
                                                       <td>
    
                                               <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">
                                               <a class=" option-btn text-light btn me-1 underline" href="admin_application_view.php?view_id=' . $clerk_id . '" 
                                               style="text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;">
                                               Lihat
                                            </a>
    
                                                </div>
    
                                    
                                    </td>
                                    </tr>';
                    $no++;

                    }
                }

                ?>
            <?php echo
                '</tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>';
        }

        ?>

        <?php
    }
    ob_end_flush(); // flush output buffer
    ?>
    <br>




    <script src="js/script.js"></script>
    <!-- import javascript and css bootsrap bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <!-- import popper to use dropdowns, popovers, or tooltips-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>

    <script>
        $(document).ready(function () {
            $('#myTable').DataTable({
                "language": {
                    "search": "Cari:",
                    "lengthMenu": "Papar _MENU_ rekod setiap halaman",
                    "zeroRecords": "Tiada data yang sepadan",
                    "info": "Papar halaman _PAGE_ dari _PAGES_",
                    "infoEmpty": "Tiada rekod",
                    "infoFiltered": "(disaring dari jumlah _MAX_ rekod)"
                }
            });
        });
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.1/xlsx.full.min.js"></script>
    <script>
        var table = document.getElementById("myTable");

        document.getElementById("export-btn").addEventListener("click", function () {
            var wb = XLSX.utils.table_to_book(table);
            XLSX.writeFile(wb, "studentcar-data.xlsx");
        });
    </script>
    <?php include 'components/clerk_footer.php'; ?>

    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>


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