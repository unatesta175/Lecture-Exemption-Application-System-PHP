<?php

include 'components/connect.php';

session_start();

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
<html>

<head>
	<title>Sistem Kenderaan Pelajar</title>
	<!-- Font Awesome -->
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="./css/style1.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">


	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<!-- jQuery -->

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300&display=swap" rel="stylesheet">


	<link rel="stylesheet" href="css/styleTable.css">

	<!-- Style -->
	<style>

	</style>

	<?php
	if (isset($message)) {
		foreach ($message as $message) {
			echo '
         <div class="message">
            <span >' . $message . '</span>
       <div style=" display: flex; ">
          <p style="font-family: Roboto; font-size:20px; margin-right:10px; color:#e74c3c;">Close this</p>
          <i class="fas fa-times" onclick="this.parentElement.parentElement.remove();"> </i>
      </div>
         </div>
         ';
		}
	}
	?>

<body>

	<header class="header">

		<section class="flex">

			<a href="home.php"><img class=" underline" width="auto" height="100" src="./images/a.png" alt=""></a>


			<nav class="navbar">
				<a href="home.php" class="underline"><i class="fa fa-home fa-fw"
						style="margin-right:15px"></i>ANJUNG</a>
				<a href="application_menu.php" class="underline"><i class="fa fa-sliders fa-fw"
						style="margin-right:15px"></i>PERMOHONAN</a>
				<a href="record.php" class="underline"><i class="fa fa-database fa-fw"
						style="margin-right:15px"></i>REKOD
					PERMOHONAN</a>
			</nav>

			<div class="icons" >
				<!-- <div id="menu-btn" class="fas fa-bars"></div> -->
			
				<div style=" display: flex; font-size:16px;">
					<i class="fas fa-user" style=" font-size:28px;"> </i>
					<p style="font-family: Roboto; font-size:20px; margin-left:10px;  text-transform:uppercase;"><?php echo $user_name ?></p>
				</div>

			</div>



			<div class="profile">
				<?php
				$select_profile = $conn->prepare("SELECT * FROM `students` WHERE student_id = ?");
				$select_profile->execute([$user_id]);
				if ($select_profile->rowCount() > 0) {
					$fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
					?>
					<p>
						<?= $fetch_profile["name"]; ?>
					</p>
					<a href="update_profile.php" class="btn underline">Kemaskini profile</a>
					<div class="flex-btn">
						<a href="user_login.php" class="option-btn underline">Login</a>
					</div>
					<a href="components/user_logout.php" class="delete-btn underline"
						onclick="return confirm('logout from the website?');">logout</a>
					<?php
				} else {
					?>

					<p>Sila login atau daftar dahulu!</p>
					<div class="flex-btn">
						<a href="user_register.php" class="option-btn underline">Daftar</a>
						<a href="user_login.php" class="option-btn underline">login</a>
					</div>
					<?php
				}
				?>



		</section>

	</header>

	<br>
	<div class="container " styles="border-radius: 15px;">

		<div class="row">
			<div class="col-lg-12">
				<div class="card card-default rounded-0 shadow">
					<div class="card-header">
						<div class="row">
							<div class="col-lg-8 col-md-8 col-sm-8">
								<h1 class="card-title"
									style=" font-family: 'Roboto Condensed', sans-serif;display: flex;  display: flex; align-items: center;">
									SENARAI PERMOHONAN
								</h1>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 text-end justify-content-end ">
								<div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">
									<a href="application_add.php"
										style="border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 65%;"
										class="text-light btn me-1 underline">Isi permohonan
										Baru</a>
								</div>
							</div>

						</div>
						<div style="clear:both"></div>
					</div>
					<div class="card-body">
						<br><br>
						<div class="row">
							<div class="col-sm-12 table-responsive">
								<table id="myTable" class="table table-bordered table-striped">
									<thead style="font-family: 'Roboto Condensed', sans-serif;">
										<tr>
											<th>No.</th>
											<th>Nama Pemohon</th>
											<th>Sebab Pengecualian</th>
											<th>Kelas/Kuliah Yang Terlibat</th>
											<th>Tarikh/Masa Permohonan</th>
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
										$result = $conn->prepare("SELECT * FROM `applications` WHERE student_id=?");
										$result->execute([$user_id]);

										if ($result->rowCount() > 0) {
											while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
												$application_id = $row['application_id'];

												// $class_items[] = '';
												// $total_classes = '';
												// $count=1;
												// $result2 = $conn->prepare("SELECT * FROM `classes` WHERE application_id=?");
												// $result2->execute([$application_id]);
												// if ($result2->rowCount() > 0) {
												//     while ($row2 = $result2->fetch(PDO::FETCH_ASSOC)) {
										

												//      $class_items[] ="\n(".$count.")[Kod Kursus : ". $row2['course_code']."\n Kumpulan : ".$row2['group']."\n Pensyarah : ". $row2['lecturer_name'].'] - ';
												//      $total_classes = implode($class_items);
												//      $count = $count +1;
												//      }}
										
												$reason_exemption = $row['reason_exemption'];
												$total_classes = $row['total_class'];
												$datetime_application = $row['datetime_application'];
												$authorization_status = $row['authorization_status'];
												$support_status = $row['support_status'];
												$approval_status = $row['approval_status'];
												$application_stat = $row['application_stat'];

												echo '<tr>
                							        <th>' . $no . '</th>
                                                    <td>' . $user_name . '</td>
                							        <td>' . $reason_exemption . '</td>
                							        <td>' . $total_classes . '</td>
                                                    <td>' . $datetime_application . '</td>
                							        <td>' . $authorization_status . '</td>
										        	<td>' . $support_status . '</td>
                							        <td>' . $approval_status . '</td>
											        <td>' . $application_stat . '</td>	
               								        <td>

                                                       <div style="display: flex; justify-content: flex-start; flex-wrap: wrap;">
                                                       <a class="text-light btn me-1 underline" href="application_view.php?application_id=' . $application_id . '" 
                                                       style=" border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;">
                                                       Lihat
                                                    </a>
    <a style="border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;" class="text-light btn me-1 underline" href="application_update.php?application_id=' . $application_id . '">Kemaskini</a>
    <a  style="border-radius: 15px; font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%;" class="text-light btn me-1 underline" href="application_delete.php?application_id=' . $application_id . '" onclick="return confirm(`Buang Maklumat Permohonan?`);" >Buang</a>
    <a class=" text-light btn me-2 underline" style=" border-radius: 15px;font-size: 14px; padding: 5px 10px; display: flex; align-items: center; justify-content: center; height: 30px; width: 100%; white-space: nowrap;" href="application_add_class.php?application_id=' . $application_id . '" >Tambah Kelas/Kuliah baru</a>
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
				</div>
			</div>
		</div>
	</div>

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
	<br>
	<br>
</body>