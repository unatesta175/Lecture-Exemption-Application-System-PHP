<?php
ob_start();
include 'components/connect.php';

session_start();

if (isset($_SESSION['lecturer_id'])) {
    $lecturer_id = $_SESSION['lecturer_id'];
  
} else {
    $lecturer_id = '';

}
;





if (isset($_POST['authorize'])) {



    $authorization_status = 'Dibenarkan';
    date_default_timezone_set('Asia/Kuala_Lumpur');
    $currentDateTime = date('Y-m-d H:i:s');
    $date_authorized = $currentDateTime;
    $class_id = $_GET['class_id'];

    $resultx = $conn->prepare("SELECT * FROM `classes` WHERE class_id=?");
    $resultx->execute([$class_id]);
    if ($resultx->rowCount() > 0) {
        while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {

            $application_id = $rowx['application_id'];


        }
    }

    // $resultx = $conn->prepare("SELECT * FROM `applications` WHERE application_id=?");
    // $resultx->execute([$application_id]);
    // if ($resultx->rowCount() > 0) {
    //     while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {

    //         $total_authorizer_needed = $rowx['total_authorizer_needed'];
    //         $total_authorizer_signed = $rowx['total_authorizer_signed'];

    //     }
    // }

    // $total_authorizer_signed = $total_authorizer_signed + 1;

    $update = $conn->prepare("UPDATE `classes` SET authorization_status = ? , date_authorized = ?  WHERE application_id = ? AND class_id = ?");
    $update->execute([$authorization_status, $date_authorized, $application_id, $class_id]);


    ?>

    <script>

        alert('ANDA SUDAH BERJAYA TUKAR STATUS VALIDASI KULIAH/KELAS KEPADA "Dibenarkan"!');
    </script>
    <?php

} else if (isset($_POST['unauthorize'])) {



    $authorization_status = 'Tidak Dibenarkan';
    date_default_timezone_set('Asia/Kuala_Lumpur');
    $currentDateTime = date('Y-m-d H:i:s');
    $date_authorized = $currentDateTime;
    $class_id = $_GET['class_id'];

    $resultx = $conn->prepare("SELECT * FROM `classes` WHERE class_id=?");
    $resultx->execute([$class_id]);
    if ($resultx->rowCount() > 0) {
        while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {

            $application_id = $rowx['application_id'];


        }
    }

    $update = $conn->prepare("UPDATE `classes` SET authorization_status = ? , date_authorized = ?  WHERE application_id = ? AND class_id = ?");
    $update->execute([$authorization_status, $date_authorized, $application_id, $class_id]);


    ?>
        <script>

            alert('ANDA SUDAH BERJAYA TUKAR STATUS VALIDASI KULIAH/KELAS INI KEPADA "Tidak Dibenarkan"!');
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
        crossorigin="anonymous" referrerpolicy="no-referrer"></locale_get_script >
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                    crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />

    <link rel="stylesheet" href="css/style.css">

    <!-- FONT IMPORT -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300&display=swap" rel="stylesheet">

    <style>
        @media only screen and (max-width: 600px) {
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
                font-size: 1.3em;
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

        .headerContainer {

            text-transform: uppercase;
            font-family: 'Roboto Condensed', sans-serif;
        }
    </style>
</head>

<body>

    <?php
    ob_start();
    include 'components/l_header.php'; ?>


    <br>
    <?php
    if (!isset($_SESSION['lecturer_id'])) {

        header('location:l_login.php');
        //   echo '<p class="empty">Sila Login Untuk Buat Permohonan Anda</p>';
    } else {

        ?>




        <div class="container">


            <br>

            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-default rounded-0 shadow">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                                    <h1 class="card-title headerContainer" ">KEMASKINI STATUS VALIDASI KELAS/KULIAH </h3>
                                                                        </div>

                                                                    </div>
                                                                    <div style=" clear:both">
                                </div>
                            </div>

                            <div class="card-body">

                                <form method="POST">

                                    <div class="row">
                                        <div class="col-sm-12 table-responsive" style="font-size:162.5%;">
                                            <table id="myTable" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Nama Pemohon</th>
                                                        <th>Tarikh</th>
                                                        <th>Hari</th>
                                                        <th>Masa</th>
                                                        <th>Kod Kursus</th>
                                                        <th>kumpulan</th>
                                                        <th>Nama Pensyarah</th>
                                                        <th>Status Kebenaran Pensyarah</th>
                                                        <th>Tarikh/Masa Dibenarkan</th>
                                                        <th>Tindakan</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php



                                                    $no = 1;
                                                    $result = $conn->prepare("SELECT * FROM `classes` WHERE class_id=?");
                                                    $result->execute([$_GET['class_id']]);

                                                    if ($result->rowCount() > 0) {
                                                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                                            $class_id = $row['class_id'];
                                                            $student_id = $row['student_id'];
                                                            $class_date = $row['class_date'];
                                                            $class_day = $row['class_day'];
                                                            $class_time = $row['class_time'];
                                                            $course_code = $row['course_code'];
                                                            $group = $row['group'];
                                                            $lecturer_id = $row['lecturer_id'];
                                                            $application_id = $row['application_id'];

                                                            $authorization_status = $row['authorization_status'];
                                                            $date_authorized = $row['date_authorized'];

                                                            $result2 = $conn->prepare("SELECT * FROM `students` WHERE student_id=?");
                                                            $result2->execute([$student_id]);
        
                                                            if ($result2->rowCount() > 0) {
                                                                while ($row2 = $result2->fetch(PDO::FETCH_ASSOC)) {
                                                                    $student_name = $row2['name'];}}

                                                                    $result2 = $conn->prepare("SELECT * FROM `lecturers` WHERE lecturer_id=?");
                                                                    $result2->execute([$lecturer_id]);
                
                                                                    if ($result2->rowCount() > 0) {
                                                                        while ($row2 = $result2->fetch(PDO::FETCH_ASSOC)) {
                                                                            $lecturer_name = $row2['lecturer_name'];}}

                                                            echo '<tr>
                                        <th>' . $no . '</th>
                                        <td>' . $student_name . '</td>
                                        <td>' . $class_date . '</td>
                                        <td>' . $class_day . '</td>
                                        <td>' . $class_time . '</td>
                                        <td>' . $course_code . '</td>
                                        <td>' . $group . '</td>	
                                        <td>' . $lecturer_name . '</td>
                                        <td>' . $authorization_status . '</td>	
                                        <td>' . $date_authorized . '</td>

                                        
                                        <td> <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">
 
<input id="btnLogin" type="submit" style=" text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;" value="Benarkan" class="green-btn text-light btn me-1 underline"
                name="authorize" onclick="return confirm(`Adakah anda pasti untuk "BENARKAN" pengecualian bagi kelas/kuliah ini?`);">



                <input id="btnLogin" type="submit" style=" text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;" value="Tidak Benarkan" class="delete-btn text-light btn me-1 underline"
                name="unauthorize" onclick="return confirm(`Adakah anda pasti untuk "TIDAK BENARKAN" pengecualian bagi kelas/kuliah ini?`);">

</div></td>
                                          
                                        </tr>';
                                                            $no++;
                                                        }
                                                    }
                                                    ?>
                                                </tbody>
                                            </table>
                                </form>
                                <div style="display: flex; flex-wrap: nowrap;">

                                    <a href="l_authorization_menu.php"
                                        style="border-radius: 15px; text-transform: uppercase; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 15%;"
                                        class="btn me-2 underline">Kembali</a>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        </div>
        <br>





        <?php
    }
    ob_end_flush();
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

    <script>
                                                                     function showOtherReason() {
            var select = document.getElementById("reason");
                                                                     var otherReasonInput = document.getElementById("otherReason");
                                                                     var labelotherReasonInput = document.getElementById("labelotherReason");
                                                                     if (select.value == "Lain-lain") {
                                                                         otherReasonInput.style.display = "block";
                                                                     labelotherReasonInput.style.display = "block";
                                                                     otherReasonInput.setAttribute("required", true);
            } else {
                                                                         otherReasonInput.style.display = "none";
                                                                     labelotherReasonInput.style.display = "none";
                                                                     otherReasonInput.removeAttribute("required");
            }
        }
    </script>
    <?php include 'components/l_footer.php'; ?>
</body>

</html>