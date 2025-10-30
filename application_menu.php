<?php
ob_start();
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

        .fa-folder-plus , 
        .fa-trash , 
        .fa-edit , 
        .fa-eye{ 
   cursor: pointer; 
}

.fa-folder-plus :hover , 
        .fa-trash :hover , 
        .fa-edit :hover , 
        .fa-eye :hover{
   background-color: var(--black);
   font-size:5px;
}
    </style>
</head>

<body>
   
    <?php
    ob_start(); // start output buffering
    include 'components/user_header.php'; ?>


    <br>
    <?php
    if (!isset($_SESSION['user_id'])) {
        header('location:user_login.php');
    } else {

        ?>
 


        <div id="page-top" class="container " styles="border-radius: 15px;">

            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-default rounded-0 shadow">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                    <h1 class="card-title"
                                        style="display: flex;  display: flex; align-items: center; font-family: 'Roboto Condensed', sans-serif; ">
                                        SENARAI PERMOHONAN
                                    </h1>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-end justify-content-end ">
                                    <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">
                                       

                                            <a href="application_add.php" type="button" class="option-btn text-light btn me-1 underline " style="width:auto; text-transform: uppercase; border-radius: 20px; font-size: 10px; float:right">+ Tambah Permohonan Baru</a>
                                    </div>
                                </div>

                            </div>
                            
                            <div style="clear:both"></div>
                        </div>
                        <div class="card-body">

                            <br><h6 style="font-size: 140%;><span style="color: black;"">** </span><i>Sila sertakan <span style="color: black;"> <b>maklumat kelas/kuliah</b> </span>bagi setiap permohonan.</i></h6>
                            <h6 style="font-size: 140%;><span style="color: black;"">** </span><i>Permohonan yang tidak disertakan maklumat<span style="color: black;"> <b>tidak akan diterima</b> </span>.</i></h6>
                            <h6 style="font-size: 140%;><span style="color: black;"">** </span><i>Permohonan hanya boleh dibuat <span style="color: black;"><b>7 hari sebelum </b> </span>daripada tarikh mula hari pengecualian kuliah.</i></h6>
							<h6 style="font-size: 140%;><span style="color: black;"">** </span><i>Maklumat kuliah/kelas <span style="color: black;"><b>tidak boleh diubah</b> </span> setelah permohonan disemak.</i></h6>
                            

                            <br>
                            <div class="row">
                                <div class="col-sm-12 table-responsive" style="font-size:162.5%;">
                                    <table id="myTable" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Nama Pemohon</th>
                                                <th>Sebab Pengecualian</th>
                                                <th style="width: 300px;">Kelas/Kuliah Yang Terlibat</th>
                                                <th>Tarikh/Masa Permohonan</th>
                                                <th>Status Validasi</th>
                                                
                                                <th>Diluluskan</th>
                                                <th style="width: 3em;">Status Permohonan</th>
                                                <th  >Tindakan</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            <?php


                                            $no = 1;
                                            $result = $conn->prepare("SELECT * FROM `applications` WHERE student_id=?");
                                            $result->execute([$user_id]);

                                            if ($result->rowCount() > 0) {
                                                while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                                    $application_id = $row['application_id'];
                                                    $reason_exemption = $row['reason_exemption'];
                                                    $total_classes = $row['total_class'];
                                                    $datetime_application = $row['datetime_application'];
                                                    $authorization_status = $row['authorization_status'];
                                                    $support_status = $row['support_status'];
                                                   
                                                    $application_stat = $row['application_stat'];
                                                    $total_authorizer_signed= $row['total_authorizer_signed'];
                                                    $total_authorizer_needed =$row['total_authorizer_needed'];
                                                    $aid=$row['application_id'];
                                                    
                                                    
                                                   


                                                    
                                                    $result2 = $conn->prepare("SELECT * FROM `students` WHERE student_id=?");
                                    $result2->execute([$user_id]);
                                    if ($result2->rowCount() > 0) {
                                        while ($row2 = $result2->fetch(PDO::FETCH_ASSOC)) {
                                            $name = $row2['name'];
                                            $student_no = $row2['student_no'];
                                            $program_id = $row2['program_id'];
                                            $semester = $row2['semester'];

                                        }
                                    }
        
                                                    

                                                    echo '<tr>
                							        <th>' . $no . '</th>
                                                    <td>' . $name . '</td>
                							        <td>' . $reason_exemption . '</td>
                							        '; ?><?php echo '<td> ' ; ?>
                                                    



                                                        <?php
                                                        $class_status ="1";
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
                                                                $lecturer_id = $row4['lecturer_id'];
                                                                $result3 = $conn->prepare("SELECT * FROM `lecturers` WHERE lecturer_id=?");
                                                                $result3->execute([$lecturer_id]);
                                                                if ($result3->rowCount() > 0) {
                                                                    while ($row3 = $result3->fetch(PDO::FETCH_ASSOC)) {$lecturer_name = $row3['lecturer_name'];}}
                                                                $noC = $noC +1 ;
                                                                ?>


                                                                <p ">
                                                                    <?php echo "<span >(".$noC. "\n" .")".'Kod Kursus : ' . $course_code . "\n" . 'Kumpulan : ' . $group . "\n" . 'Pensyarah : ' . $lecturer_name . "\n</span>" ; ?>
                                                                </p>
         
                                                                


                                                                <?php
                                                            }} 
                                                            else{
                                                                
                                                                
                                                                $class_status=2;       
                                                                
                                                      


                                                               
         
                                                              
                                                                
                                                                
                                                            }
                                                            ?>
                                                     <?php if($total_authorizer_signed == 0 ){ echo'<center><a class="underline" style="font-size: 1.5em;" href="application_add_class.php?application_id=' . $application_id . '" title="Tambah maklumat Kuliah/Kelas/Lab"><center> <i class=" fa fa-folder-plus" style="color:">
                                                    </i></center></a>&nbsp;&nbsp;&nbsp;&nbsp</center>';} echo  '</td>';?>
                                                    <?php echo
                                                    '<td>' . $datetime_application . '</td>
                							        <td>' . $authorization_status . '</td>
										        	<td>' . $support_status . '</td>
                							       
											        <td>' . $application_stat . '</td>	
               								        <td>

                                                      
                                                       <center><a class="underline " style="font-size: 1.5em;" href="application_view.php?application_id=' . $application_id . '" title="Lihat Maklumat Permohonan"> <center><i class=" fa fa-eye" style="color:orange">
                                                       </i></center></a>&nbsp;&nbsp;&nbsp;&nbsp</center>';
?><?php
                                                      

                                                    
                                                   
                                                        




?><?php echo
                                                      '<center><a class=" underline" style="font-size: 1.5em;" href="application_delete.php?application_id=' . $application_id . '" onclick="return confirm(`Buang Maklumat Permohonan?`);" title="Buang Pemohonan"> <center><i class=" fa fa-trash" style="color:red">
                                                       </i></center></a>&nbsp;&nbsp;&nbsp;&nbsp;</center>';

                                                        
                                                     

     

   
                                                       if($support_status != 'pending' ){ echo '<center><a href="userPDFprint.php?application_id=' . $application_id . '"  class=" underline" style="font-size: 1.5em;" title="Cetak/Muat Turun Permohonan"> <center><i class=" fa fa-print" style="color:purple">
                                                       </i></center></a>&nbsp;&nbsp;&nbsp;&nbsp;</center>';}

                                                       


                                                       echo'</center>
                                                       

                                                 


                                            
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
        <a class="scroll-to-top rounded" href="#page-top">
   <i class="fas fa-circle-up" style='float:right; margin-right: 1em; margin-bottom:1em; font-size: 3em;;'></i>
</a>
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
    <?php include 'components/footer.php'; ?>
</body>

<!-- BEst BUTTON PREFIX -->
<!-- <a class=" option-btn text-light btn me-1 underline" href="application_view.php?application_id=' . $application_id . '" 
                                                       style="text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;">
                                                       Lihat
                                                    </a>
    <a style=" text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;" class=" option-btn text-light btn me-1 underline" href="application_update.php?application_id=' . $application_id . '">Kemaskini</a>
       <a title ="Tambah maklumat kelas/kuliah jika permohonan anda belum ada maklumat kelas"class=" text-light btn me-2 underline" style="text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%; white-space: nowrap;" href="application_add_class.php?application_id=' . $application_id . '" >Tambah Kelas/Kuliah baru</a>

    <a  style=" text-transform: uppercase;border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;" class=" delete-btn text-light btn me-1 underline" href="application_delete.php?application_id=' . $application_id . '" onclick="return confirm(`Buang Maklumat Permohonan?`);" >Buang</a> -->
</html>