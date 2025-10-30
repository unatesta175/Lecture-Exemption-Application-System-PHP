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

        @media (max-width:768px){

html{
font-size: 35%;
}

}
    </style>
</head>

<body>

    <?php
    ob_start(); // start output buffering
    include 'components/trhea_header.php'; ?>


    <br>
    <?php
    if (!isset($_SESSION['trhea_id'])) {
        header('location:trhea_login.php');
    } else {

        ?>



        <div class="container " styles="border-radius: 15px;">

            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-default rounded-0 shadow">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                    <h1 class="card-title"
                                        style="display: flex;  display: flex; align-items: center; font-family: 'Roboto Condensed', sans-serif; ">
                                        SENARAI KULIAH/KELAS YANG BELUM DILULUSKAN
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
                            <br><br>
                            <div class="row">
                                <div class="col-sm-12 table-responsive" style="font-size:162.5%;">
                                    <table id="myTable" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Nama Pemohon</th>
                                                <th>Sebab Pengecualian</th>
                                                <th>Tarikh/Masa Permohonan</th>


                                                <th>Kelas/Kuliah Yang Terlibat</th>
                                                <th>Status Validasi</th>
                                                <th>Disokong</th>
                                                <th>Diluluskan</th>

                                                <th style="width:60px;">Status Permohonan</th>
                                                <th>Tindakan</th>


                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php


                                            



                                                    $no = 1;
                                                    $result = $conn->prepare("SELECT * FROM `applications` WHERE support_status=?");
                                                    $result->execute(['Disokong']);

                                                    if ($result->rowCount() > 0) {
                                                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                                            $application_id = $row['application_id'];
                                                            $reason_exemption = $row['reason_exemption'];
                                                            $student_id = $row['student_id'];
                                                            $datetime_application = $row['datetime_application'];
                                                            $authorization_status_app = $row['authorization_status'];
                                                            $support_status = $row['support_status'];
                                                            $approval_status = $row['approval_status'];
                                                            $date_supported = $row['date_supported'];
                                                            $application_stat = $row['application_stat'];


                                                        
                                                            $resultx = $conn->prepare("SELECT * FROM `students` WHERE student_id=?");
                                                            $resultx->execute([$student_id]);
                
                                                            if ($resultx->rowCount() > 0) {
                                                                while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {
                                                                    $student_id = $rowx['student_id'];
                                                                    $student_name = $rowx['name'];}}







                                                    echo '<tr>
                                                            <th>' . $no . '</th>
                                                            <td>' . $student_name . '</td>
                                                            <td>' . $reason_exemption . '</td>
                                                            <td>' . $datetime_application . '</td>
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
                                                    '<td>' . $authorization_status_app . '</td>
                                                            <td>' . $support_status . '</td>
                                                            <td>' . $approval_status . '</td>
                                                            <td>' . $application_stat . '</td>	
                                                               <td>

                                                       <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;"><center>
                                                       
                                                       <a class=" option-btn text-light btn me-1 underline" href="trhea_approval_view.php?application_id=' . $application_id . '" 
                                                       style="text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;">
                                                       Lihat
                                                    </a>
    <a style=" text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;" class=" option-btn text-light btn me-1 underline" href="trhea_approval_update.php?application_id=' . $application_id . '">Kemaskini</a>';
                                                    ?>

                                                    <?php
                                                    if ($approval_status == "pending") {
                                                        echo '<a  style=" text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;" class=" green-btn text-light btn me-1 underline" href="trhea_approval_validate.php?application_id=' . $application_id . '" >Validasi</a>';
                                                    }
                                                    ?>
                                                    <?php

                                                    
if ($approval_status !== "pending") {
                                                       echo '<center><a href="userPDFprint.php?application_id=' . $application_id . '"  class=" underline" style="font-size: 1.5em;" title="Cetak/Muat Turun Permohonan"> <center><i class=" fa fa-print" style="color:purple">
                                                        </i></center></a>&nbsp;&nbsp;&nbsp;&nbsp;</center>';}
 
                                                        
 
 
                                                    echo '</center></div>

                                            
											</td>
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
        </div>
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
    <?php include 'components/trhea_footer.php'; ?>
</body>

</html>