<?php

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
    include 'components/user_header.php'; ?>


    <br>
    <?php
    if (!isset($_SESSION['user_id'])) {

        header('location:user_login.php');
        //   echo '<p class="empty">Sila Login Untuk Buat Permohonan Anda</p>';
    } else {

        ?>




        <div class="container">


            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-default rounded-0 shadow">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-md-9">
                                    <h1 class="card-title " style="font-family: 'Roboto Condensed' , sans-serif;">BUTIRAN
                                        MAKLUMAT PERMOHONAN</h1>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form method="POST">
                                <div id="parent" style="display:flex; flex-direction:row;">
                                    <?php
                                    $application_id = $_GET['application_id'];
                                    $no = 1;
                                    $result = $conn->prepare("SELECT * FROM `applications` WHERE application_id=?");
                                    $result->execute([$application_id]);


                                    $result2 = $conn->prepare("SELECT * FROM `students` WHERE student_id=?");
                                    $result2->execute([$user_id]);
                                    if ($result2->rowCount() > 0) {
                                        while ($row2 = $result2->fetch(PDO::FETCH_ASSOC)) {
                                            $name = $row2['name'];
                                            $student_no = $row2['student_no'];
                                            $program_id = $row2['program_id'];
                                            $faculty_id = $row2['faculty_id'];
                                            $semester = $row2['semester'];

                                        }
                                    }

                                    $result3 = $conn->prepare("SELECT * FROM `programs` WHERE program_id=?");
                                    $result3 ->execute([$program_id]);
                                    if ($result3->rowCount() > 0) {
                                        while ($row3 = $result3->fetch(PDO::FETCH_ASSOC)) {
                                            
                                            $program_code = $row3['program_code'];
                                            
                                           

                                        }
                                    }

                                    $result3 = $conn->prepare("SELECT * FROM `faculty` WHERE faculty_id=?");
                                    $result3 ->execute([$faculty_id]);
                                    if ($result3->rowCount() > 0) {
                                        while ($row3 = $result3->fetch(PDO::FETCH_ASSOC)) {
                                            $faculty_name = $row3['name'];
                                            
                                           

                                        }
                                    }

                                    



                                    if ($result->rowCount() > 0) {
                                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {

                                            $application_id = $row['application_id'];
                                            $reason_exemption = $row['reason_exemption'];
                                            $startDate = $row['startDate'];
                                            $endDate = $row['endDate'];
                                            $noDay = $row['noDay'];
                                            $datetime_application = $row['datetime_application'];

                                            

                                            $date_supported = $row['date_supported'];
                                            $support_status = $row['support_status'];
                                            $supporter = $row['supporter'];

                                           

                                            $application_stat = $row['application_stat'];
                                            $supportDoc = $row['supportDoc'];
                                            

                                            ?>


                                            <div style="width:100%; margin-right:100px; ">
                                                <h2 style="color: black; font-family: 'Roboto Condensed' , sans-serif;">MAKLUMAT
                                                    PEMOHON : </h2>
                                                <br>
                                                <table style="font-size: 160%;">
                                                    <tr>
                                                        <td style="padding-right: 45px;">Nama Pelajar </td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $name; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Kod Program</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $program_code; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fakulti</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $faculty_name  ; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>No. Matrik Pelajar</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $student_no; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Semester</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $semester; ?>
                                                        </td>
                                                    </tr>
                                                </table>

                                              

                                                <br>
                                                <H2 style="color: black; font-family: 'Roboto Condensed' , sans-serif;">MAKLUMAT
                                                    PERMOHONAN : </H2>
                                                <br>

                                                <table style="font-size: 160%;">
                                                    <tr>
                                                        <td style="padding-right: 45px;">Sebab Permohonan </td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $reason_exemption; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Tarikh Mula Pengecualian</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $startDate; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Tarikh Akhir Pengecualian</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $endDate; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Bilangan Hari Pengecualian</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $noDay; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Tarikh Permohonan</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $datetime_application; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Status Permohonan</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $application_stat; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Dokumen Sokongan</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;'; ?><a href="downloaddocaction.php?doc=<?php echo $supportDoc; ?>"><?php echo $supportDoc; ?></a>
                                                        </td>
                                                    </tr>
                                                </table> 
                                              

                                                <br>
                                                <h2
                                                    style="color: black;  font-family: 'Roboto Condensed' , sans-serif; font-family: 'Roboto Condensed' , sans-serif;">
                                                    MAKLUMAT KEBENARAN PENSYARAH: </h2>
                                                <br>
                                                 <h3
                                                    style="color: black; ">
                                                    Senarai Kelas/Kuliah Yang Dimohon Untuk Dikecualikan : </h3>
                                                    <br>
                                                <?php
                                                $result4 = $conn->prepare("SELECT * FROM `classes` WHERE application_id=?");
                                    $result4 ->execute([$application_id]);
                                    if ($result4->rowCount() > 0) {
                                        while ($row4 = $result4->fetch(PDO::FETCH_ASSOC)) {
                                            $course_code = $row4['course_code'];
                                            $lecturer_id = $row4['lecturer_id'];
                                            $authorization_status = $row4['authorization_status'];
                                            $date_authorized = $row4['date_authorized'];

                                            $result2 = $conn->prepare("SELECT * FROM `lecturers` WHERE lecturer_id=?");
                                                $result2->execute([$lecturer_id]);
                                                if ($result2->rowCount() > 0) {
                                                    while ($row2 = $result2->fetch(PDO::FETCH_ASSOC)) {
                                                        $lecturer_name = $row2['lecturer_name'];}}
 
                                            ?>
                                            <table style="font-size: 160%;">
                                            <tr>
                                                <td style="padding-right: 45px;">Kod Kursus</td>
                                                <td>
                                                    <?php echo ':&nbsp;&nbsp;' . $course_code; ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 45px;">Tarikh Dibenarkan</td>
                                                <td>
                                                    <?php echo ':&nbsp;&nbsp;' . $date_authorized; ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Status Kebenaran</td>
                                                <td>
                                                    <?php echo ':&nbsp;&nbsp;' . $authorization_status ; ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Dibenarkan oleh</td>
                                                <td>
                                                    <?php echo ':&nbsp;&nbsp;' . $lecturer_name; ?>
                                                </td>
                                            </tr>
                                            
 

                                        </table>
                                        <br>
                                        <?php
                                        }
                                     }?><?php 
                                     $resultx = $conn->prepare("SELECT * FROM `students` WHERE student_id=?");
                                     $resultx->execute([$user_id]);
                                     if ($resultx->rowCount() > 0) {
                                         while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {
                                 
                                             
                                             $faculty_id = $rowx['faculty_id'];
                                 
                                 
                                         }
                                     }
                                 
                                    
                                 
                                     
                                 
                                     $resultx = $conn->prepare("SELECT * FROM `kpps` WHERE faculty_id=?");
                                     $resultx->execute([$faculty_id]);
                                     if ($resultx->rowCount() > 0) {
                                         while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {
                                 
                                             $kpp_name = $rowx['name'];
                                            
                                 
                                         }
                                     }?>


                                        
                                        

                                                <br>
                                                <H2 style="color: black;  font-family: 'Roboto Condensed' , sans-serif;">MAKLUMAT
                                                    KELULUSAN KETUA PENGARAH PROGRAM : </H2>
                                                <br>

                                                <table style="font-size: 160%;">
                                                    <tr>
                                                        <td style="padding-right: 45px;">Tarikh Diluluskan</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $date_supported; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Status Kelulusan</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $support_status; ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Diluluskan oleh</td>
                                                        <td>
                                                            <?php echo ':&nbsp;&nbsp;' . $kpp_name; ?>
                                                        </td>
                                                    </tr>

                                                </table>
                                            
                                                <br>
                                               
                                            


                                            </div>

                                            <?php
                                        }
                                    }
                                    ?>
                                </div>
                                <br>
                                <br>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card card-default rounded-0 shadow">
                                            <div class="card-header">
                                                <div class="row">
                                                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                                                        <h1 class="card-title headerContainer" ">Senarai kuliah/kelas/makmal/tutorial yang
                                                                terlibat </h3>
                                                        </div>

                                                    </div>
                                                    <div style=" clear:both">
                                                    </div>
                                                </div>

                                                <div class="card-body">

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

                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <?php



$no = 1;
$result = $conn->prepare("SELECT * FROM `classes` WHERE application_id=?");
$result->execute([$_GET['application_id']]);

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

        $result4 = $conn->prepare("SELECT * FROM `lecturers` WHERE lecturer_id=?");
        $result4->execute([$lecturer_id]);
        if ($result4->rowCount() > 0) {
            while ($row4 = $result4->fetch(PDO::FETCH_ASSOC)) {
               
               
               $lecturer_name = $row4['lecturer_name'];
              
            }
           }

           $result4 = $conn->prepare("SELECT * FROM `students` WHERE student_id=?");
           $result4->execute([$student_id]);
           if ($result4->rowCount() > 0) {
               while ($row4 = $result4->fetch(PDO::FETCH_ASSOC)) {
                  
                  
                  $student_name = $row4['name'];
                 
               }
              }

        echo '<tr>
<th>' . $no . '</th>
<td>' . $student_name . '</td>
<td>' . $class_date . '</td>
<td>' . $class_day . '</td>
<td>' . $class_time . '</td>
<td>' . $course_code . '</td>
<td>' . $group . '</td>	
<td>' . $lecturer_name . '</td>

</tr>';
        $no++;
    }
}
                                                                    ?>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>

                                    <div style="display: flex; flex-wrap: nowrap;">

                                        <a href="application_menu.php"
                                            style="border-radius: 15px; text-transform: uppercase; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 15%;"
                                            class="btn me-2 underline">Kembali</a>

                                    </div>


                            </form>


                        </div>
                    </div>
                </div>
            </div>
        </div>

        <?php
    }ob_end_flush();
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
    <?php include 'components/footer.php'; ?>
</body>

</html>