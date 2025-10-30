<?php
if(isset($_POST["submit"]))
{
 $path = 'upload/' . $_FILES["attachment"]["name"];
 move_uploaded_file($_FILES["attachment"]["tmp_name"], $path);
 
 require 'PHPMailer/src/PHPMailer.php';
 require 'PHPMailer/src/SMTP.php';
 require 'PHPMailer/src/Exception.php';
 
 $staffname = ($_POST['staffname']);
 $staffno = ($_POST['staffno']);
 $staffmail = ($_POST['staffmail']);
 $subject = ($_POST['subject']);
 $message = ($_POST['message']);
 
 $mail = new PHPMailer\PHPMailer\PHPMailer();
 $mail->IsSMTP();        //Sets Mailer to send message using SMTP
 $mail->Host = 'smtp.gmail.com';  //Sets the SMTP hosts of your Email hosting
 $mail->Port = 587;        //Sets the default SMTP server port
 $mail->SMTPAuth = true;       //Sets SMTP authentication. Utilizes the Username and Password variables
 $mail->Username = 'polisbuitm@gmail.com';     //Sets SMTP username
 $mail->Password = 'ebozxuhjixzjwwxs';     //Sets SMTP password "ebozxuhjixzjwwxs" "radonsquamvcfgib"
 $mail->SMTPSecure = 'tls';       //Sets connection prefix. Options are "", "ssl" or "tls"
 $mail->AddAddress($staffmail, $staffname);  //Adds a "To" address
 $mail->IsHTML(true);       //Sets message type to HTML
 $mail->setFrom('polisbuitm@gmail.com', 'Polis Bantuan UiTM'); // Sender email and name
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
<button class="btn btn-success"><a class="nav-link" href="../emailstaf.php" id="print_menu">Back</a></button>
