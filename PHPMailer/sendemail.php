

 <?php
if(isset($_POST["submit"]))
{


 require 'PHPMailer/src/PHPMailer.php';
 require 'PHPMailer/src/SMTP.php';
 require 'PHPMailer/src/Exception.php';
 

 

 $name = 'Anis Suraya';
 $matric = '2020894394';
 $stumail = 'niesuraya@gmail.com';
 $subject = 'Pemakluman Permohonan Pengecualian Kuliah Oleh Pelajar';
 $messages = 'Sila validasi permohonan ini';

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
 $mail->setFrom('HEAuitm@gmail.com', 'Hal Ehwal Akademik UiTM'); // Sender email and name    //Adds an attachment from a path on the filesystem
 $mail->Subject = $subject;    //Sets the Subject of the message
 $mail->Body = $messages;       //An HTML or plain text message body
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

