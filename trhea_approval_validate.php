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





if (isset($_POST['approve'])) {



    $approval_status = 'DiLuluskan';
    date_default_timezone_set('Asia/Kuala_Lumpur');
    $currentDateTime = date('Y-m-d H:i:s');
    $date_approved = $currentDateTime;
    $application_id = $_GET['application_id'];


    $update = $conn->prepare("UPDATE `applications` SET approval_status = ? , application_stat = ? , approver = ? , date_approved = ?  WHERE application_id = ?");
    $update->execute([$approval_status,"selesai",$trhea_name,$date_approved, $application_id]);


    ?>
    <script>

        alert('ANDA SUDAH BERJAYA VALIDASI KULIAH/KELAS INI DENGAN STATUS "Diluluskan"!');
    </script>
    <?php

    
$resultx = $conn->prepare("SELECT * FROM `applications` WHERE application_id = ?");
$resultx->execute([$application_id]);
if ($resultx->rowCount() > 0) {
    while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {
        $student_id = $rowx['student_id'];
    }
}

$resultx = $conn->prepare("SELECT * FROM `students` WHERE student_id = ?");
$resultx->execute([$student_id]);
if ($resultx->rowCount() > 0) {
    while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {
        $student_name = $rowx['name'];
        $student_email = $rowx['email'];
    }
}
   require 'PHPMailer/PHPMailer/src/PHPMailer.php';
   require 'PHPMailer/PHPMailer/src/SMTP.php';
   require 'PHPMailer/PHPMailer/src/Exception.php';
   
   
   
   $subject = 'Pemakluman Bahawasanya Permohonan Pengecualian Kuliah Oleh Pelajar telah berjaya dan diluluskan';
   $messagess = 'Assalammualaikum dan selamat sejahtera ,'.$student_name.' .Sila semak semula permohonan anda dengan melayari laman web ULEAS';
  
   $mail = new PHPMailer\PHPMailer\PHPMailer();
   $mail->IsSMTP();        //Sets Mailer to send message using SMTP
   $mail->Host = 'smtp.gmail.com';  //Sets the SMTP hosts of your Email hosting
   $mail->Port = 587;        //Sets the default SMTP server port
   $mail->SMTPAuth = true;       //Sets SMTP authentication. Utilizes the Username and Password variables
   $mail->Username = 'muhammadilyasamran@gmail.com';     //Sets SMTP username
   $mail->Password = 'hsrmhyrrkveilqeo';     //Sets SMTP password "ebozxuhjixzjwwxs" "radonsquamvcfgib"
   $mail->SMTPSecure = 'tls';       //Sets connection prefix. Options are "", "ssl" or "tls"
   $mail->AddAddress($student_email, $student_name);  //Adds a "To" address
   $mail->IsHTML(true);       //Sets message type to HTML
   $mail->setFrom('HEAuitm@gmail.com', 'Hal Ehwal Akademik UiTM'); // Sender email and name    //Adds an attachment from a path on the filesystem
   $mail->Subject = $subject;    //Sets the Subject of the message
   $mail->Body = $messagess;       //An HTML or plain text message body
   if($mail->Send())        //Send an Email. Return true on success or false on error
         {
             echo "<div style='font-size:1.5em; margin-bottom:0px;'class='alert alert-success alert-dismissible fade show' role='alert'>
             <strong>Permohonan telah selesai divalidasi!</strong> Emel telah dihantar kepada pelajar sebagai makluman permohonan mereka telah berjaya dan diluluskan.
             <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
           </div>
           ";
         }   
         else
         {
          
             echo "<div style='font-size:1.5em; margin-bottom:0px;'class='alert alert-success alert-dismissible fade show' role='alert'>
             <strong>Permohonan telah selesai divalidasi!</strong> Namun emel gagal dihantar.
             <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
           </div>
           ";
         }

} else if (isset($_POST['unapprove'])) {


    $approval_status = 'Tidak DiLuluskan';
    date_default_timezone_set('Asia/Kuala_Lumpur');
    $currentDateTime = date('Y-m-d H:i:s');
    $date_approved = $currentDateTime;
    $application_id = $_GET['application_id'];


    $update = $conn->prepare("UPDATE `applications` SET approval_status = ? , application_stat = ? , approver = ? , date_approved = ?  WHERE application_id = ?");
    $update->execute([$approval_status,"selesai",$trhea_name,$date_approved, $application_id]);


    ?>
    <script>

        alert('ANDA SUDAH BERJAYA VALIDASI KULIAH/KELAS INI DENGAN STATUS "Tidak Diluluskan"!');
    </script>
    <?php

    
$resultx = $conn->prepare("SELECT * FROM `applications` WHERE application_id = ?");
$resultx->execute([$application_id]);
if ($resultx->rowCount() > 0) {
    while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {
        $student_id = $rowx['student_id'];
    }
}

$resultx = $conn->prepare("SELECT * FROM `students` WHERE student_id = ?");
$resultx->execute([$student_id]);
if ($resultx->rowCount() > 0) {
    while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {
        $student_name = $rowx['name'];
        $student_email = $rowx['email'];
    }
}
   require 'PHPMailer/PHPMailer/src/PHPMailer.php';
   require 'PHPMailer/PHPMailer/src/SMTP.php';
   require 'PHPMailer/PHPMailer/src/Exception.php';
   
   
   
   $subject = 'Pemakluman Bahawasanya Permohonan Pengecualian Kuliah Oleh Pelajar telah gagal dan tidak diluluskan';
   $messagess = 'Assalammualaikum dan selamat sejahtera ,'.$student_name.' .Sila semak semula permohonan anda dengan melayari laman web ULEAS';
  
   $mail = new PHPMailer\PHPMailer\PHPMailer();
   $mail->IsSMTP();        //Sets Mailer to send message using SMTP
   $mail->Host = 'smtp.gmail.com';  //Sets the SMTP hosts of your Email hosting
   $mail->Port = 587;        //Sets the default SMTP server port
   $mail->SMTPAuth = true;       //Sets SMTP authentication. Utilizes the Username and Password variables
   $mail->Username = 'muhammadilyasamran@gmail.com';     //Sets SMTP username
   $mail->Password = 'hsrmhyrrkveilqeo';     //Sets SMTP password "ebozxuhjixzjwwxs" "radonsquamvcfgib"
   $mail->SMTPSecure = 'tls';       //Sets connection prefix. Options are "", "ssl" or "tls"
   $mail->AddAddress($student_email, $student_name);  //Adds a "To" address
   $mail->IsHTML(true);       //Sets message type to HTML
   $mail->setFrom('HEAuitm@gmail.com', 'Hal Ehwal Akademik UiTM'); // Sender email and name    //Adds an attachment from a path on the filesystem
   $mail->Subject = $subject;    //Sets the Subject of the message
   $mail->Body = $messagess;       //An HTML or plain text message body
   if($mail->Send())        //Send an Email. Return true on success or false on error
         {
             echo "<div style='font-size:1.5em; margin-bottom:0px;'class='alert alert-success alert-dismissible fade show' role='alert'>
             <strong>Permohonan telah selesai divalidasi!</strong> Emel telah dihantar kepada pelajar sebagai makluman permohonan mereka telah gagal dan tidak diluluskan.
             <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
           </div>
           ";
         }   
         else
         {
          
             echo "<div style='font-size:1.5em; margin-bottom:0px;'class='alert alert-success alert-dismissible fade show' role='alert'>
             <strong>Permohonan telah selesai divalidasi!</strong> Namun emel gagal dihantar.
             <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
           </div>
           ";
         }
}






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
    include 'components/trhea_header.php'; ?>


    <br>
    <?php
    if (!isset($_SESSION['trhea_id'])) {

        header('location:trhea_login.php');
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
                                    <h1 class="card-title headerContainer" ">VALIDASI STATUS KELULUSAN PERMOHONAN </h3>
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
                                                        <th>Sebab Pengecualian</th>
                                                        <th>Tarikh/Masa Permohonan</th>
                                                        <th>Tarikh Mula Pengecualian</th>
                                                        <th>Tarikh Akhir Pengecualian</th>
                                                        <th>Kelas/Kuliah Yang Terlibat</th>
                                                        <th>Status Kelulusan TRHEA</th>
                                                        <th>Tarikh Kelulusan TRHEA</th>
                                                        <th>Tindakan</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
$no=1;
                                                    $application_id = $_GET['application_id'];

                                                    $result = $conn->prepare("SELECT * FROM `applications` WHERE application_id=?");
                                                    $result->execute([$application_id]);

                                                    if ($result->rowCount() > 0) {
                                                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                                            $application_id = $row['application_id'];
                                                            $reason_exemption = $row['reason_exemption'];
                                                            $student_id = $row['student_id'];

                                                            $datetime_application = $row['datetime_application'];
                                                            $authorization_status_app = $row['authorization_status'];
                                                            $approval_status = $row['approval_status'];

                                                            $startDate = $row['startDate'];
                                                             $endDate = $row['endDate'];

                                                            $date_approved = $row['date_approved'];
                                                            $application_stat = $row['application_stat'];
                                                        }
                                                    }






                                                    $resultx = $conn->prepare("SELECT * FROM `students` WHERE student_id=?");
                                                    $resultx->execute([$student_id]);

                                                    if ($resultx->rowCount() > 0) {
                                                        while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {
                                                            $student_id = $rowx['student_id'];
                                                            $student_name = $rowx['name'];

                                                            echo '<tr>
                                        <th>' . $no . '</th>
                                        <td>' . $student_name . '</td>
                                        <td>' . $reason_exemption . '</td>
                                        <td>' . $datetime_application . '</td>
                                        <td>' . $startDate . '</td>
                                        <td>' . $endDate . '</td>
                                        
                                        '; ?><?php echo '<td>'; ?>
                                        



                                            <?php
                                            $noC = 0;
                                            $result4 = $conn->prepare("SELECT * FROM `classes` WHERE application_id=?");
                                            $result4->execute([$application_id]);
                                            if ($result4->rowCount() > 0) {
                                                while ($row4 = $result4->fetch(PDO::FETCH_ASSOC)) {
                                                    // $lecturer_name = $row4['lecturer_name'];
                                                    // $authorization_status = $row4['authorization_status'];
                                                    // $date_authorized = $row4['date_authorized'];
                                                    $course_code = $row4['course_code'];
                                                    $group = $row4['group'];
                                                    $lecturer_name = $row4['lecturer_name'];
                                                    $authorization_status = $row4['authorization_status'];
                                                    $noC = $noC +1 ;
                                                    ?>

                                                    <p style= "font-size:100%;">
                                                        <?php echo "(".$noC. "\n" .")".'Kod Kursus : ' . $course_code . 
                                                        "\n" . 'Kumpulan : ' . $group .
                                                         "\n" . 'Pensyarah : ' . $lecturer_name .
                                                         "\n" ; ?>
                                                    </p>

                                                    <?php
                                                }} 
                                                else{

                                                    echo "Tiada";
                                                }
                                                ?>
                                         <?php echo'</td>';?>
                                        <?php echo
                                        '<td>' . $approval_status . '</td>

                                        	
                                        <td>' . $date_approved . '</td>

                                        
                                        <td> <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">';

                                                            ?>

                                                            <?php
                                                            if ($approval_status == "pending") {
                                                                echo '<input id="btnLogin" type="submit" style=" text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;" value="Luluskan" class="green-btn text-light btn me-1 underline"
    name="approve" onclick="return confirm(`Adakah anda pasti untuk "Luluskan" permohonan pengecualian bagi kelas/kuliah ini?`);">
    <input id="btnLogin" type="submit" style=" text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;" value="Tidak Luluskan" class="delete-btn text-light btn me-1 underline"
    name="unapprove" onclick="return confirm(`Adakah anda pasti untuk "Tidak Luluskan" permohonan pengecualian bagi kelas/kuliah ini?`);">
';
                                                            } else {
                                                                echo ' <div style="display: flex; flex-wrap: nowrap;">


        <a href="trhea_approval_menu.php" style=" text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;"  class=" text-light btn me-1 underline">SELESAI
     </a>

</div>
';
                                                            }
                                                            ?>
                                                            <?php


                                                            echo '</div></td>
                                          
                                        </tr>';
                                                            $no++;
                                                        }
                                                    }
                                                    ?>
                                                </tbody>
                                            </table>
                                </form>

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