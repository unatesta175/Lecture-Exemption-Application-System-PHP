
 <?php
if(isset($_POST["submit"]))
{
 $path = 'upload/' . $_FILES["supportDoc"]["name"];
 move_uploaded_file($_FILES["supportDoc"]["tmp_name"], $path);
 
// $supportDoc = rand(1000, 10000) . "-" . $_FILES["supportDoc"]["name"];
// $tsupportDoc = $_FILES["supportDoc"]["tmp_name"];
// $uploads_supportDoc = 'supportDocfile';
// move_uploaded_file($tsupportDoc, $uploads_supportDoc . '/' . $supportDoc);

 require 'PHPMailer/src/PHPMailer.php';
 require 'PHPMailer/src/SMTP.php';
 require 'PHPMailer/src/Exception.php';
 

 $app_id = $_POST['app_id'];
    $reason = $_POST['reason'];
    $startDate = $_POST['startDate'];
    $endDate = $_POST['endDate'];
    // $numDay = $_POST['numDay'];
    $numDay = abs(strtotime($endDate) - strtotime($startDate)) / 86400;
    

    if ($reason == "Lain-lain") {
        $reason = $_POST['otherReason'];
    }

        $supportDoc = rand(1000, 10000) . "-" . $_FILES["supportDoc"]["name"];
        $tsupportDoc = $_FILES["supportDoc"]["tmp_name"];
        $uploads_supportDoc = 'supportDocfile';
        move_uploaded_file($tsupportDoc, $uploads_supportDoc . '/' . $supportDoc);

        // $jken = rand(1000, 10000) . "-" . $_FILES["jken"]["name"];
        // $tjken = $_FILES["jken"]["tmp_name"];
        // $uploads_jken = 'jkenfile';
        // move_uploaded_file($tjken, $uploads_jken . '/' . $jken);

    // Set timezone to Kuala Lumpur
    date_default_timezone_set('Asia/Kuala_Lumpur');
    $currentDateTime = date('Y-m-d H:i:s');


//  $name = ($_POST['name']);
//  $matric = ($_POST['matric']);
//  $stumail = ($_POST['stumail']);
//  $subject = ($_POST['subject']);
//  $message = ($_POST['message']);
 

 $name = 'Anis Suraya';
 $matric = '2020894394';
 $stumail = 'niesuraya@gmail.com';
 $subject = 'Pemakluman Permohonan Pengecualian Kuliah Oleh Pelajar';
 $message = 'Sila validasi permohonan ini';

 $mail = new PHPMailer\PHPMailer\PHPMailer();
 $mail->IsSMTP();        //Sets Mailer to send message using SMTP
 $mail->Host = 'smtp.gmail.com';  //Sets the SMTP hosts of your Email hosting
 $mail->Port = 587;        //Sets the default SMTP server port
 $mail->SMTPAuth = true;       //Sets SMTP authentication. Utilizes the Username and Password variables
 $mail->Username = 'muhammadilyasamran@gmail.com';     //Sets SMTP username
 $mail->Password = 'hsrmhyrrkveilqeo';     //Sets SMTP password "ebozxuhjixzjwwxs" "radonsquamvcfgib"
 $mail->SMTPSecure = 'tls';       //Sets connection prefix. Options are "", "ssl" or "tls"
 $mail->AddAddress($stumail, $name);  //Adds a "To" address
 $mail->IsHTML(true);       //Sets message type to HTML
 $mail->setFrom('HEAuitm@gmail.com', 'Hal Ehwal Akademik UiTM'); // Sender email and name
 $mail->AddAttachment($path);     //Adds an attachment from a path on the filesystem
 $mail->Subject = $subject;    //Sets the Subject of the message
 $mail->Body = $message;       //An HTML or plain text message body
 if($mail->Send())        //Send an Email. Return true on success or false on error
 {
   echo "Mail has been sent successfully";
 }
 else
 {
   echo "Mail error" . $mail->ErrorInfo;
 }
} 
?>

<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<hr>
<button class="btn btn-success"><a class="nav-link" href="../emailform.php" id="print_menu">Back</a></button> 