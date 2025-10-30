<?php
session_start();
error_reporting(0);
include('components/connect.php');
// if (strlen($_SESSION['slogin']) == 0) {
//     header('location:index.php');
// }

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $program_code = $_SESSION['program_code'];
    $faculty = $_SESSION['faculty'];
    $user_name = $_SESSION['user_name'];

} else {
    $user_id = '';
    $program_code = '';
    $faculty = '';
    $user_name = '';

}
;


?>

<!DOCTYPE html>
<html lang="en">

<head>

    <!-- <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>print form</title>



    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
    <link rel="website icon" type="png" href="assets/img/uitm.png">

    <!-- Custom styles for this template-->
    <link href="assets/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="print.css" media="print">


    <style>

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

        @media (max-width:991px) {

            html {
                font-size: 55%;
            }

        }

        @media (max-width:768px) {

            html {
                font-size: 55%;
            }

        }

        @media (max-width:450px) {

            html {
                font-size: 50%;
            }


        }


        html {
            font-size: 62.5%;
            overflow-x: hidden;
        }

        .btn,
        .delete-btn,
        .option-btn,
        .green-btn {
            display: block;
            width: 100%;
            margin-top: 1rem;
            border-radius: .5rem;
            padding: 1rem 3rem;
            font-size: 1.7rem;
            text-transform: capitalize;
            color: var(--white);
            cursor: pointer;
            text-align: center;
        }



        .btn:hover,
        .delete-btn:hover,
        .green-btn:hover,
        .option-btn:hover {
            background-color: black;
            position: relative;
        }



        .btn {
            background-color: var(--main-color);
        }

        .green-btn {
            background-color: var(--green);
        }


        .option-btn {
            background-color: var(--orange);
        }

        .delete-btn {
            background-color: var(--red);
        }


        body {
            font-family: "Calibri";
        }

        *:disabled {
            background-color: transparent;
        }

        ::-webkit-scrollbar {
            display: none;
        }

        @media print {
            .pagebreak {
                page-break-before: always;
            }

            /* page-break-after works, as well */
        }
    </style>

</head>

<body>
    <!-- onload="findSum();" -->
    <center><button onclick="window.print();" class="option-btn btn me-2 underline" style="width:20%;"
            id="print-btn">Cetak</button></center>
    <b style="float: right; font-size:14px; color:black">UiTMJ/HEA/UR(Pengecualian Kuliah) 2023 <i>pind.</i> 01</b><br>
    <center><br><img src="assets/img/logo.png" widht="100" height="100"><br>

        <p style="font-size:18px; color:black"><b>BAHAGIAN HAL EHWAL AKADEMIK<br>
                UNIVERSITI TEKNOLOGI MARA CAWANGAN JOHOR</b><br>
        <h5 style="font-size:20px; color:black">SENARAI PELAJAR BAWAH KOD PROGRAM BERKAITAN SAHAJA<br></h5>
        <b>
            <hr style="border: 1px solid;">
            </hr>
        </b>

        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tbody>
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
                            $program_code = $row2['program_code'];
                            $semester = $row2['semester'];
                            $ic = $row2['ic'];
                            $phone_no = $row2['phone_no'];
                            $home_phone_no = $row2['home_phone_no'];

                        }
                    }

                    $result3 = $conn->prepare("SELECT * FROM `programs` WHERE program_code=?");
                    $result3->execute([$program_code]);
                    if ($result3->rowCount() > 0) {
                        while ($row3 = $result3->fetch(PDO::FETCH_ASSOC)) {
                            $faculty_name = $row3['faculty_name'];


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

                            $date_authorized_all = $row['date_authorized'];
                            $authorization_status_all = $row['authorization_status'];
                            $authorizer_all = $row['authorizer'];

                            $date_supported = $row['date_supported'];
                            $support_status = $row['support_status'];
                            $supporter = $row['supporter'];

                            $date_approved = $row['date_approved'];
                            $approval_status = $row['approval_status'];
                            $approver = $row['approver'];

                            $application_stat = $row['application_stat'];
                            $supportDoc = $row['supportDoc'];
                            $total_class = $row['total_class'];

                            ?>
                            <tr>
                                <td colspan="2" style="font-size:20px; color:black"><b>A: MAKLUMAT AM PELAJAR</b></td>
                            </tr>

                            <tr>
                                <td width="30%" style="font-size:18px; color:black"><b>NAMA:</b></td>
                                <td style="text-transform:uppercase; font-size:18px; color:black">
                                    <?php echo '&nbsp;&nbsp;' . $user_name; ?>
                                </td>
                            </tr>

                            <tr>
                                <td style="font-size:18px; color:black"><b>NO. KAD PENGENALAN:</b></td>
                                <td style="text-transform:uppercase; font-size:18px; color:black">
                                    <?php echo '&nbsp;&nbsp;' . $student_no; ?>
                                </td>
                            </tr>

                            <tr>
                                <td style="font-size:18px; color:black"><b>NO. PELAJAR:</b></td>
                                <td style="text-transform:uppercase; font-size:18px; color:black">
                                    <?php echo '&nbsp;&nbsp;' . $ic; ?>
                                </td>
                            </tr>

                            <tr>
                                <td style="font-size:18px; color:black"><b>FAKULTI:</b></td>
                                <td style="text-transform:uppercase; font-size:18px; color:black">
                                    <?php echo '&nbsp;&nbsp;' . $faculty; ?>
                                </td>
                            </tr>

                            <tr>
                                <td style="font-size:18px; color:black"><b>KOD PROGRAM:</b></td>
                                <td style="text-transform:uppercase; font-size:18px; color:black">
                                    <?php echo '&nbsp;&nbsp;' . $program_code; ?>
                                </td>
                            </tr>

                            <tr>
                                <td style="font-size:18px; color:black"><b>BAHAGIAN:</b></td>
                                <td style="text-transform:uppercase; font-size:18px; color:black">
                                    <?php echo '&nbsp;&nbsp;' . $semester; ?>
                                </td>
                            </tr>

                            <tr>
                                <td style="font-size:18px; color:black"><b>NO. TELEFON (HP):</b></td>
                                <td style="text-transform:uppercase; font-size:18px; color:black">
                                    <?php echo '&nbsp;&nbsp;' . $phone_no; ?>
                                </td>
                            </tr>

                            <tr>
                                <td style="font-size:18px; color:black"><b>NO. TELEFON (RUMAH):</b></td>
                                <td style="text-transform:uppercase; font-size:18px; color:black">
                                    <?php echo '&nbsp;&nbsp;' . $home_phone_no; ?>
                                </td>
                            </tr>

                            <?php $cnt++;
                        }
                    } ?>
            </table>

            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tbody>
                    <tr>
                        <td colspan="2" style="font-size:20px; color:black"><b>B: MAKLUMAT PERMOHONAN PENGECUALIAN
                                KULIAH</b></td>
                    </tr>

                    <tr>
                        <td style="font-size:18px; color:black"><b>SEBAB PERMOHONAN</b></td>
                        <td style="font-size:18px; color:black">
                            <?php echo '&nbsp;&nbsp;' . $reason_exemption; ?>
                        </td>
                    </tr>
                    <tr>
                        <td width="30%" style="font-size:18px; color:black"><b>TARIKH MULA</b></td>
                        <td style="font-size:18px; color:black">
                            <?php echo '&nbsp;&nbsp;' . $startDate; ?>
                        </td>
                    </tr>

                    <tr>
                        <td style="font-size:18px; color:black"><b>TARIKH TAMAT</b></td>
                        <td style="font-size:18px; color:black">
                            <?php echo '&nbsp;&nbsp;' . $endDate; ?>
                        </td>
                    </tr>

                    <tr>
                        <td style="font-size:18px; color:black"><b>BILANGAN HARI</b></td>
                        <td style="font-size:18px; color:black">
                            <?php echo '&nbsp;&nbsp;' . $noDay; ?>
                        </td>
                    </tr>

                    <tr>
                        <td style="font-size:18px; color:black"><b>TARIKH PERMOHONAN DIHANTAR</b></td>
                        <td style="font-size:18px; color:black">
                            <?php echo '&nbsp;&nbsp;' . $datetime_application; ?>
                        </td>
                    </tr>



            </table>



            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tbody>
                    <tr>
                        <td colspan="7" style="font-size:20px; color:black"><b>C: MAKLUMAT SENARAI KULIAH </b></td>
                    </tr>

                    <th>No.</th>
                                    <th>Nama Pelajar</th>
                                    <th>kod Program</th>


                                    <th>Fakulti</th>
                                    <th>Semester</th>
                                    <th>Emel</th>
                                    <th>No. Pelajar</th>
                                    <th>No. Telefon</th>
                                    <th>No. Telefon Rumah</th>

                    <tr>
                        <th style="font-size:18px; color:black" width="1%">NO.</th>
                        <th style="font-size:18px; color:black" width="5%">NAMA PELAJAR</th>
                        <th style="font-size:18px; color:black" width="2%">KOD PROGRAM</th>
                        <th style="font-size:18px; color:black" width="10%">FAKULTI</th>
                        <th style="font-size:18px; color:black" width="10%">SEMESTER</th>
                        <th style="font-size:18px; color:black" width="20%">EMEL</th>
                        <th style="font-size:18px; color:black" width="10%">NO PELAJAR</th>
                        <th style="font-size:18px; color:black" width="10%">NO TELEFON</th>
                        <th style="font-size:18px; color:black" width="10%">NO TELEFON RUMAH</th>
                        
                    </tr>
                    <?php



                    $no = 1;
                    $result = $conn->prepare("SELECT * FROM `classes` WHERE application_id=?");
                    $result->execute([$application_id]);

                    if ($result->rowCount() > 0) {
                        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                            $class_id = $row['class_id'];
                            $student_name = $row['student_name'];
                            $class_date = $row['class_date'];
                            $class_day = $row['class_day'];
                            $class_time = $row['class_time'];
                            $course_code = $row['course_code'];
                            $group = $row['group'];
                            $lecturer_name = $row['lecturer_name'];
                            $authorization_status = $row['authorization_status'];

                            echo '<tr>
<th style="font-size:18px; color:black">' . $no . '</th>

<td style="font-size:18px; color:black">' . $class_date . '</td>

<td style="font-size:18px; color:black">' . $class_time . '</td>
<td style="font-size:18px; color:black">' . $course_code . '</td>
<td style="font-size:18px; color:black">' . $group . '</td>	
<td style="font-size:18px; color:black">' . $lecturer_name . '</td>
<td style="font-size:18px; color:black">' . $authorization_status . '</td>


</tr>';
                            $no++;
                        }
                    }
                  ?>
                </tbody>
            </table>

            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tbody>
                    <tr>
                        <td colspan="2" style="font-size:20px; color:black"><b>D: MAKLUMAT SOKONGAN KETUA PUSAT PROGRAM</b></td>
                    </tr>

                    <tr>
                        <td style="font-size:18px; color:black"><b>DISOKONG OLEH :</b></td>
                        <td style="font-size:18px; color:black">
                            <?php echo '&nbsp;&nbsp;' . $supporter; ?>
                        </td>
                    </tr>
                    <tr>
                        <td width="30%" style="font-size:18px; color:black"><b>STATUS SOKONGAN</b></td>
                        <td style="font-size:18px; color:black">
                            <?php echo '&nbsp;&nbsp;' . $support_status; ?>
                        </td>
                    </tr>

                    <tr>
                        <td style="font-size:18px; color:black"><b>TARIKH DISOKONG</b></td>
                        <td style="font-size:18px; color:black">
                            <?php echo '&nbsp;&nbsp;' . $date_supported; ?>
                    </tr>

        

            </table>

            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tbody>
                    <tr>
                        <td colspan="2" style="font-size:20px; color:black"><b>D: MAKLUMAT KELULUSAN TIMBALAN REKTOR HAL EHWAL AKADEMIK</b></td>
                    </tr>

                    <tr>
                        <td style="font-size:18px; color:black"><b>DILULUSKAN OLEH :</b></td>
                        <td style="font-size:18px; color:black">
                            <?php echo '&nbsp;&nbsp;' . $approver; ?>
                        </td>
                    </tr>
                    <tr>
                        <td width="30%" style="font-size:18px; color:black"><b>STATUS KLULUSAN</b></td>
                        <td style="font-size:18px; color:black">
                            <?php echo '&nbsp;&nbsp;' . $approval_status; ?>
                        </td>
                    </tr>

                    <tr>
                        <td style="font-size:18px; color:black"><b>TARIKH DILULUSKAN</b></td>
                        <td style="font-size:18px; color:black">
                            <?php echo '&nbsp;&nbsp;' . $date_approved; ?>
                        </td>
                    </tr>

        

            </table>



            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tbody>
                    <tr>
                        <td colspan="3"
                            style="font-family:'Times New Roman', Times, serif; font-size:18px; color:black"><b>
                                Nota:<br><i>
                                    1. Permohonan perlu dimajukan kepada HEA selewat-lewatnya 3 hari sebelum
                                    pengecualian kuliah.<br>
                                    2. Salinan keputusan permohonan perlu diberikan kepada setiap pensyarah yang
                                    terlibat.<br></i></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <center><button onclick="window.print();" class="btn me-2 underline" id="print-btn">Cetak</button></center>
</body>

</html>