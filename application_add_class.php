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

    $application_id = $_GET['application_id'];
    $date = $_POST['date'];
    $day = $_POST['day'];
    $time = $_POST['time'];
    $course_code = strtoupper($_POST['course_code']);
    $group = strtoupper($_POST['group']);
    $lecturer_id = $_POST['lecturer_id'];

    if ($lecturer_id == "Lain-lain") {
        $lecturer_id = $_POST['otherLecturerId'];
    }

    $insert = $conn->prepare("INSERT INTO `classes`(application_id, class_date, class_day , class_time, course_code , `group` , lecturer_id, student_id) VALUES(?,?,?,?,?,?,?,?)");
    $insert->execute([$application_id, $date, $day, $time, $course_code, $group, $lecturer_id, $user_id]);


    $class_items[] = '';
    $total_classes = '';
    $count = 1;
    $result2 = $conn->prepare("SELECT * FROM `classes` WHERE application_id=?");
    $result2->execute([$application_id]);
    if ($result2->rowCount() > 0) {
        while ($row2 = $result2->fetch(PDO::FETCH_ASSOC)) {



            $class_items[] = "\n(" . $count . ")[Kod Kursus : " . $row2['course_code'] . "\n Kumpulan : " . $row2['group'] . "\n Pensyarah : " ;
            $total_classes = implode($class_items);
            $count = $count + 1;
        }
    }

    $resultx = $conn->prepare("SELECT * FROM `applications` WHERE application_id=?");
    $resultx->execute([$application_id]);
    if ($resultx->rowCount() > 0) {
        while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {
            
            $total_authorizer_needed = $rowx['total_authorizer_needed'];
            $total_authorizer_signed = $rowx['total_authorizer_signed'];
        
        }}

        $total_authorizer_needed=$total_authorizer_needed + 1;

    $update = $conn->prepare("UPDATE `applications` SET total_class = ? ,  total_authorizer_needed = ? WHERE application_id = ?");
    $update->execute([$total_classes, $total_authorizer_needed , $application_id]);

 

    ?>
    <script> alert('ANDA TELAH BERJAYA MENGISI MAKLUMAT KELAS ANDA!');</script>

    

    <?php

require 'PHPMailer/PHPMailer/src/PHPMailer.php';
require 'PHPMailer/PHPMailer/src/SMTP.php';
require 'PHPMailer/PHPMailer/src/Exception.php';



       $result4 = $conn->prepare("SELECT * FROM `lecturers` WHERE lecturer_id=?");
    $result4->execute([$lecturer_id]);
    if ($result4->rowCount() > 0) {
        while ($row4 = $result4->fetch(PDO::FETCH_ASSOC)) {
           
           $lecturer_email = $row4['email'];
           $lecturer_name = $row4['lecturer_name'];
          
        }
       }

       $lecturer_name;

       $subject = 'Pemakluman Keperluan Pensyarah Untuk Validasi Permohonan Pengecualian Kuliah Oleh Pelajar';
       $messagess = 'Assalammualaikum dan salam sejahtera.YBhg Datuk/Datin/Prof/Tuan/Puan, Sila layari laman web uitm dengan klik link <a href="http://10.90.72.114/eleas.uitm.edu.my/l_authorization_menu.php">DISINI</a> untuk menunaikan tanggungjawab anda sebagai pensyarah untuk validasi permohonan yang dibuat oleh pelajar.';      
        $mail = new PHPMailer\PHPMailer\PHPMailer();
       $mail->IsSMTP();        //Sets Mailer to send message using SMTP
       $mail->Host = 'smtp.gmail.com';  //Sets the SMTP hosts of your Email hosting
       $mail->Port = 587;        //Sets the default SMTP server port
       $mail->SMTPAuth = true;       //Sets SMTP authentication. Utilizes the Username and Password variables
       $mail->Username = 'muhammadilyasamran@gmail.com';     //Sets SMTP username
       $mail->Password = 'gnrfdypybgweurbp';     //Sets SMTP password "ebozxuhjixzjwwxs" "radonsquamvcfgib"
       $mail->SMTPSecure = 'tls';       //Sets connection prefix. Options are "", "ssl" or "tls"
       $mail->AddAddress($lecturer_email, $lecturer_name);  //Adds a "To" address
       $mail->IsHTML(true);       //Sets message type to HTML
       $mail->setFrom('HEAuitm@gmail.com', 'Hal Ehwal Akademik UiTM'); // Sender email and name    //Adds an attachment from a path on the filesystem
       $mail->Subject = $subject;    //Sets the Subject of the message
       $mail->Body = $messagess;       //An HTML or plain text message body
       if($mail->Send())        //Send an Email. Return true on success or false on error
       {
           echo "<div style='font-size:1.5em; margin-bottom:0px;'class='alert alert-success alert-dismissible fade show' role='alert'>
           <strong>Emel telah berjaya dihantar!</strong> Pensyarah yang berkaitan akan dimaklumkan untuk membuat validasi terhadap permohonan anda.
           <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
         </div>
         ";
       } 
       else
       {
        
           echo "<div style='font-size:1.5em; margin-bottom:0px;'class='alert alert-success alert-dismissible fade show' role='alert'>
           <strong>Pensyarah yang berkaitan akan dimaklumkan untuk membuat validasi terhadap permohonan anda!</strong>.
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



                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card card-default rounded-0 shadow">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                                            <h1 class="card-title"
                                                style="text-transform: uppercase; font-family: 'Roboto Condensed',sans-serif;">
                                                Senarai kuliah/kelas/makmal/tutorial yang
                                                terlibat </h1>
                                        </div>

                                    </div>
                                    <div style="clear:both"></div>
                                </div>

                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-sm-12 table-responsive bigger">
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
                                                        <th>Tindakan</th>
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
                                           <td>

                                           <div style="display: flex; justify-content: flex-start; flex-wrap: nowrap;">
                                          
                                            <a style="text-transform:uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;"href="application_delete_class.php?class_id=' . $class_id . '&' . 'application_id=' . $_GET['application_id'] . '" class="delete-btn text-light btn me-1 underline" onclick="return confirm(`Buang Maklumat Kuliah/Kelas?`);" >Buang</a>
                                           
                                            </div>

                                    
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

                                <div class="container">




                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card card-default rounded-0 shadow">
                                                <div class="card-header">
                                                    <div class="row">
                                                        <div class="col-md-9">
                                                            <h3 class="card-title"></h3>
                                                            <h1 class="card-title"
                                                                style="text-transform: uppercase; font-family: 'Roboto Condensed',sans-serif;">
                                                                Tambah Kuliah/Kelas/makmal
                                                            </h1>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-body">
                                                    <form method="POST">


                                                        <H5 style="color: black;">Tarikh : <span style="color: red;">*</span></H5>
                                                        <input type="date" id="tarikhMula" required placeholder=""
                                                            name="date" placeholder="Isi Tarikh Kelas"
                                                            class="form-control mb-2 bigger">

                                                        <H5 style="color: black;">Hari : <span style="color: red;">*</span></H5>

                                                        <select id="day" required placeholder="" name="day"
                                                            class="form-control mb-2 bigger">
                                                            <option value="" selected hidden>Sila Pilih</option>
                                                            <option value="Ahad">Ahad</option>
                                                            <option value="Isnin">Isnin</option>
                                                            <option value="Selasa">Selasa</option>
                                                            <option value="Rabu">Rabu</option>
                                                            <option value="Khamis">Khamis</option>
                                                            <option value="Jumaat">Jumaat</option>
                                                            <option value="Sabtu">Sabtu</option>
                                                        </select>

                                                        <H5 style="color: black;">Masa : <span style="color: red;">*</span></H5>
                                                        <input type="time" id="bilanganHari" required placeholder=""
                                                            name="time" placeholder="Isi Masa Kelas"
                                                            class="form-control mb-2 bigger">

                                                        <H5 style="color: black;">Kod kursus :<span style="color: red;">*</span> </H5>
                                                        <input style="text-transform:capitalize;" type="text"
                                                            id="bilanganHari" required placeholder="" name="course_code"
                                                            placeholder="Isi Kod Kursus" class="form-control mb-2 bigger">


                                                        <H5 style="color: black;">Kumpulan : <span style="color: red;">*</span></H5>
                                                        <input style="text-transform:capitalize;" type="text"
                                                            id="bilanganHari" required placeholder="" name="group"
                                                            placeholder="Isi Kumpulan Kelas "
                                                            class="form-control mb-2 bigger">


                                                    



                                                        

                                                        <H5 style="color: black;" class="bigger">Nama Pensyarah : <span style="color: red;">*</span></H5>
                                                        <select id="lecturer_id" style="text-transform:capitalize;" required placeholder="" name="lecturer_id"
                                                            onchange="showOtherReason()" class="form-control mb-2 bigger">
                                                            <option value="" selected hidden>Sila Pilih</option>
                                                            <?php

                                                            $result = $conn->prepare("SELECT * FROM `lecturers` ORDER BY lecturer_name ASC");
                                                            $result->execute();
                                                            if ($result->rowCount() > 0) {
                                                                while ($row = $result->fetch(PDO::FETCH_ASSOC)) { ?>
                                                                    <option value="<?php echo $row['lecturer_id']; ?>"><?php echo $row['lecturer_name']; ?></option>
                                                                <?php }
                                                            } ?>
                                                            
                                                        </select>


                                                        <label id="labelOther" for="otherLecturerId" style="display:none"
                                                            class="bigger">Jika Tidak Tersenarai ,Nyatakan Nama Pensyarah Anda: <span style="color: red;">*</span></label>
                                                        <input type="text" id="otherLecturerId" required placeholder=""
                                                            name="otherLecturerId" style="display:none"
                                                            class="form-control mb-2 bigger">





                                                        <div style="display: flex; flex-wrap: nowrap;">
                                                            <button
                                                                style="text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 15%;"
                                                                class="green-btn btn btn-success me-2 underline"
                                                                name="submit">Tambah</button>
                                                            <a style="text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 15%;"
                                                                class="btn btn-success me-2 underline"
                                                                href="application_menu.php"
                                                                onclick="return confirm(`Anda sudah selesai tambah maklumat kelas/kuliah?`);">Selesai</a>
                                                        </div>
                                                    </form>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <br>

                            </div>
                        </div>
                    </div>


                    <br><br>


                    </form>



                </div>
            </div>
        </div>





        <?php
    }
    ?>
    <br>
    <script>
    
</script>

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
            var select = document.getElementById("lecturer_id");
            var otherReasonInput = document.getElementById("otherLecturerId");
            var labelotherReasonInput = document.getElementById("labelOther");
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