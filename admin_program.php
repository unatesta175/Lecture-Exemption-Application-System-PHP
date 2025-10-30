<?php

include 'components/connect.php';

session_start();

if (isset($_SESSION['admin_id'])) {
    $admin_id = $_SESSION['admin_id'];

 } else {
    $admin_id = '';
    
 
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
    include 'components/clerk_header.php'; ?>


    <br>
    <?php
    if (!isset($_SESSION['admin_id'])) {
        header('location:admin_login.php');
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
                                        <?php 
                                         echo "SENARAI PROGRAM";
                                    ?>
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
                            <div style="display:flex;"> <a id="export-btn" class=" option-btn text-light btn me-1 underline"
                                                       style=" text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 15%;">
                                                       EXPORT TO EXCEL
                                                    </a>
                                                    <a href="admin_program_add.php" class=" option-btn text-light btn me-1 underline"
                                                       style=" text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 15%;">
                                                       Tambah Program
                                                    </a></div>
                           
                                                    
                                                    <br>
                                                    
                            <div class="row">
                                <div class="col-sm-12 table-responsive" style="font-size:162.5%;">
                                    <table id="myTable" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Kod Program</th>
                                                <th>Nama Program</th>
                                                <th>Fakulti</th>
                                                <th>Ketua Pusat Program</th>
                                                
                                                <th>Tindakan</th>


                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                   
                                                $no = 1;
                                                
        
                                                        
    
                                                        

                                                        $result = $conn->prepare("SELECT * FROM `programs` ORDER BY program_code");
                                                               $result->execute();
                                                        
    
                                                        if ($result->rowCount() > 0) {
                                                            while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                                                                $program_code = $row['program_code'];
                                                                $program_name = $row['program_name'];
                                                                $program_id = $row['program_id'];
                                                                $faculty_id = $row['faculty_id'];

                                                                $results = $conn->prepare("SELECT * FROM `faculty` WHERE faculty_id =?");
                                                                $results->execute([$faculty_id]);
                                                         
     
                                                         if ($results->rowCount() > 0) {
                                                             while ($rows = $results->fetch(PDO::FETCH_ASSOC)) {
                                                                 $faculty_name = $rows['name'];}}

                                                                 $results = $conn->prepare("SELECT * FROM `kpps` WHERE faculty_id =?");
                                                                 $results->execute([$faculty_id]);
                                                          
      
                                                          if ($results->rowCount() > 0) {
                                                              while ($rows = $results->fetch(PDO::FETCH_ASSOC)) {
                                                                  $kpp_name = $rows['name'];}}
                                                              
                                                               
    
    
                                                        echo '<tr>
                                                                <th>' . $no . '</th>
                                                                <td>' . $program_code . '</td>
                                                                <td>' . $program_name . '</td>
                                                                <td>' . $faculty_name . '</td>
                                                                <td>' . $kpp_name . '</td>
                                                         
                                                                   <td>
    
                                                           <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;"><center>
                                                           <a class=" option-btn text-light btn me-1 underline" href="admin_program_update.php?program_id=' . $program_id . '" 
                                                           style="text-transform: uppercase; border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;">
                                                           Kemaskini
                                                        </a>

                                                       
       
                                                            </div>
    
                                                
                                                </td>
                                                </tr>';
                                                        $no++;
    
                                                    }}


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
            XLSX.writeFile(wb, "data.xlsx");
        });
    </script>
    <?php include 'components/clerk_footer.php'; ?>
</body>

</html>