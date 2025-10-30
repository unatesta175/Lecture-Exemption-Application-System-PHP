<?php

include 'components/connect.php';

session_start();

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
   
} else {
    $user_id = '';
  
}
;
if (isset($_POST['submit'])) {
    $app_id = $_POST['app_id'];
    $reason = $_POST['reason'];
    $startDate = $_POST['startDate'];
    $endDate = $_POST['endDate'];
    // $numDay = $_POST['numDay'];
    $numDay = (abs(strtotime($endDate) - strtotime($startDate)) / 86400) + 1;
    $today = date("Y-m-d");
    
    if ($reason == "Lain-lain") {
        $reason = $_POST['otherReason'];
    }
    
    // Check if the application start date is at least 7 days greater than the current date
    $sevenDaysbeforeStartDate = date('Y-m-d', strtotime('+7 days', strtotime($today)));
    if ($startDate >= $sevenDaysbeforeStartDate) {
        // Application start date is at least 7 days greater than today's date
        $supportDoc = rand(1000, 10000) . "-" . $_FILES["supportDoc"]["name"];
        $tsupportDoc = $_FILES["supportDoc"]["tmp_name"];
        $uploads_supportDoc = 'supportDocfile';
        move_uploaded_file($tsupportDoc, $uploads_supportDoc . '/' . $supportDoc);
        
        // Set timezone to Kuala Lumpur
        date_default_timezone_set('Asia/Kuala_Lumpur');
        $currentDateTime = date('Y-m-d H:i:s');
        
        $insert = $conn->prepare("INSERT INTO `applications` (reason_exemption, startDate, endDate, noDay, student_id, datetime_application, supportDoc) VALUES (?, ?, ?, ?, ?, ?, ? )");
        $insert->execute([$reason, $startDate, $endDate, $numDay, $user_id, $currentDateTime, $supportDoc]);
        ?>
        <script>
            alert('ANDA BERJAYA SIMPAN MAKLUMAT PERMOHONAN ANDA!\nSeterusnya Klik Selesai untuk isi maklumat kelas anda bagi selesaikan proses permohonan anda!');
        </script>
        <?php
    } else {
        // Application start date is not at least 7 days greater than today's date
        ?>
        <script>
            alert('Permohonan tidak berjaya! Anda hanya boleh membuat permohonan lebih daripada 7 hari sebelum tarikh mula pengecualian kuliah anda!');
        </script>
        <?php
    }
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


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />

    <!-- FONT IMPORT -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300&display=swap" rel="stylesheet">

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





        /* h5, input .form-control { font-size:162.5%; } */
    </style>
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
                                <div class="col-md-9">
                                    <h1 class="card-title "
                                        style="text-transform:uppercase; font-family: 'Roboto Condensed', sans-serif;">
                                        Permohonan Pengecualian Kuliah</h1>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                       <form method="POST" enctype="multipart/form-data"> 
                            
                                <?php

                                $result = $conn->prepare("SELECT * FROM `students` WHERE student_id=?");
                                $result->execute([$user_id]);
                                if ($result->rowCount() > 0) {
                                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                        $user_name = $row['name'];
                                        $student_no = $row['student_no'];
                                        $program_id = $row['program_id'];
                                       
                                        $faculty_id = $row['faculty_id'];
                                        $semester = $row['semester'];
                                    }
                                }
                                $result = $conn->prepare("SELECT * FROM `programs` WHERE program_id=?");
                                $result->execute([$program_id]);
                                if ($result->rowCount() > 0) {
                                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                        
                                        $program_code = $row['program_code'];
                                       
                                    }
                                }
                                $result = $conn->prepare("SELECT * FROM `faculty` WHERE faculty_id=?");
                                $result->execute([$faculty_id]);
                                if ($result->rowCount() > 0) {
                                    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                        
                                        $faculty_name = $row['name'];
                                       
                                    }
                                }
                                ?>
<br>
<?php
$today = date("Y-m-d");

// Calculate the date 7 days from today
$sevenDaysAfterToday = date('Y-m-d', strtotime('+7 days', strtotime($today)));

// Display the earliest available start date to the student

echo '<h6 style="font-size: 162%;><span style="color: black;"">** </span><i>Pelajar hanya boleh pilih tarikh mula pengecualian kuliah bermula pada  <span style="color: red;"><b>' . $sevenDaysAfterToday .'</b> </span></i></h6>';?>
<br>
                                <H4 style="color: black;">Maklumat Pemohon : </H4>
                                <br>
                                <table style="font-size: 160%;">
                                    <tr>
                                        <td style="padding-right: 45px;">Nama Pelajar </td>
                                        <td>
                                            <?php echo ':&nbsp;&nbsp;' . $user_name; ?>
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
                                            <?php echo ':&nbsp;&nbsp;' . $faculty_name; ?>
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
                                <div class="">

                                    <input type="hidden" name="app_id" value="<?= $app_id; ?>">

                                    <H5 style="color: black;" class="bigger">Sebab Permohonan : <span style="color: red;">*</span></H5>
                                    <select id="reason" required placeholder="" name="reason" onchange="showOtherReason()"
                                        class="form-control mb-2 bigger">
                                        <option value="" selected hidden>Sila Pilih</option>
                                        <option value="Konvokesyen">Menghadiri Konvokesyen</option>
                                        <option value="Muet">Menghadiri MUET</option>
                                        <option value="Haji">Mengerjakan Haji</option>
                                        <option value="Haji">Menyertai Aktiviti Kelab</option>
                                        <option value="Lain-lain">Lain-lain</option>
                                    </select>


                                    <label id="labelotherReason" for="otherReason" style="display:none"
                                        class="bigger">Nyatakan sebab lain
                                        anda:<span style="color: red;">*</span></label>
                                    <input type="text" id="otherReason" required placeholder="" name="otherReason"
                                        style="display:none" class="form-control mb-2 bigger">

                                    <H5 style="color: black;">Tarikh Mula : <span style="color: red;">*</span></H5>
                                    <input type="date" id="tarikhMula" required placeholder="" name="startDate"
                                        placeholder="Isi tarikh mula" class="form-control mb-2 bigger">

                                    <H5 style="color: black;">Tarikh Akhir : <span style="color: red;">*</span></H5>
                                    <input type="date" id="tarikAkhir" required placeholder="" name="endDate"
                                        placeholder="Isi tarikh akhir" class="form-control mb-2 bigger">

                                        <script>
  var startDateInput = document.getElementById("tarikhMula");
  var endDateInput = document.getElementById("tarikAkhir");

  endDateInput.addEventListener("change", function() {
    var startDateValue = new Date(startDateInput.value);
    var endDateValue = new Date(this.value);

    if (endDateValue < startDateValue) {
      alert("Tarikh Akhir harus sama atau lebih besar daripada Tarikh Mula.");
      this.value = ""; // Clear the endDate input field
    }
  });
</script>

                                        <H5 style="color: black;">Dokumen Sokongan : <span style="color: red;">*</span></H5>
                                    <input type="file" id="sd" name="supportDoc" required placeholder=""
                                        placeholder="Dokumen Sokongan" class="form-control mb-2 bigger">

                                        <script>
  document.getElementById("sd").addEventListener("change", function() {
    var file = this.files[0];
    var fileType = file.type.toLowerCase();
    if (fileType !== "application/pdf") {
      alert("Hanya format PDF sahaja yang diterima untuk dokumen sokongan.");
      this.value = ""; // Clear the file input field
    }
  });
</script>


                                        

                                    <!-- <H5 style="color: black;">Bilangan Hari : </H5>
                                <input type="number" id="bilanganHari" name="numDay" placeholder="Isi bilangan hari"
                                    class="form-control mb-2"> -->
                                   

                                    <div style="display: flex; flex-wrap: nowrap;">
                                        <button type="submit" name="submit"
                                            style="border-radius: 15px; text-transform: uppercase; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 30%;"
                                            class="green-btn btn btn-success me-2 underline">Simpan</button>
                                        <a href="application_menu.php"
                                           
                                            style="border-radius: 15px;text-transform: uppercase; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 30%;"
                                            class="btn me-2 underline">Kembali</a>
                                    </div>

                                </div>


                            </form>

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
</body>

</html>