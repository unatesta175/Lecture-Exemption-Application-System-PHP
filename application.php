<?php

include 'components/connect.php';

session_start();

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $program_code = $_SESSION['program_code'];
    $faculty = $_SESSION['faculty'];
} else {
    $user_id = '';
    $program_code = '';
    $faculty = '';
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


    <!--Bootstrap CSS latest(jangan guna nanti coding berubah)-->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> -->

    <!--stylesheet CSS-->
    <link rel="stylesheet" href="css/style.css">

    <!--editable Bootstrap CSS-->
    <!-- <link rel="stylesheet" href="css/bootstrap.css"> -->

    <!--import box icons-->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    

</head>

<body>

    <?php include 'components/user_header.php'; ?>


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
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                        <h3 class="card-title">Senarai permohonan </h3>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-end">
                        <button type="button" class="btn btn-primary bg-gradient btn-sm rounded-0"><a
                                href="addStudentcar.php" class="text-light">Buat permohonan baru</a></button>
                    </div>
                </div>
                <div style="clear:both"></div>
            </div>
            <div class="card-body">
                <button id="export-btn">Eksport ke Excel</button><br><br>
                <div class="row">
                    <div class="col-sm-12 table-responsive">
                        <table id="myTable" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Sebab Pengecualian</th>
                                    <th>Tarikh Permohonan</th>
                                    <th>Dibenarkan</th>
                                    <th>Disokong</th>
                                    <th>Diluluskan</th>
                                    <th>Status Permohonan</th>
                                    <th>Tindakan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                $result = $conn->prepare("SELECT * FROM 'applications' WHERE student_id=?");
                                $result->execute([$user_id]);
                                if ($result->rowCount() > 0) {
                                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                        $application_id = $row['application_id'];
                                        $reason_exemption = $row['reason_exemption'];
                                        $datetime_application = $row['datetime_application'];
                                        $authorization_status = $row['authorization_status'];
                                        $support_status = $row['support_status'];
                                        $approval_status = $row['approval_status'];
                                        $application_stat = $row['application_stat'];

                                        echo '<tr>
                                        <th>' . $no . '</th>
                                        <td>' . $reason_exemption . '</td>
                                        <td>' . $date_application . '</td>
                                        <td>' . $authorization_stat . '</td>
                                        <td>' . $support_stat . '</td>
                                        <td>' . $approval_stat . '</td>
                                        <td>' . $application_stat . '</td>	
                                           <td>
                                        <center>
                                            <button><a href="application_view.php?id=' . $application_id . '">Lihat</a></button>
                                            <button><a href="application_update.php?id=' . $application_id . '">Kemaskini</a></button>
                                            <button><a href="application_delete.php?id=' . $application_id . '">Buang</a></button>
                                        </center>
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
   ?>
   <br>


    <?php include 'components/footer.php'; ?>

    <script src="js/script.js"></script>
    <!-- import javascript and css bootsrap bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <!-- import popper to use dropdowns, popovers, or tooltips-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>

</body>

</html>