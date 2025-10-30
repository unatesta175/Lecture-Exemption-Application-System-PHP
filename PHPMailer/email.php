<?php
//Send email using the code 
//define name spaces
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

//create instance of phpmailer
$mail = new PHPMailer(true);

try {
	$mail->SMTPDebug = 2; //debug information @ User input information
	$mail->isSMTP(); //set mail to smtp
	$mail->Host = "smtp.gmail.com"; //SMTP server that is being used //Google app password:radonsquamvcfgib
	$mail->SMTPAuth = true; 
	$mail->Username = "dumacc696@gmail.com"; 
	$mail->Password = "radonsquamvcfgib";
	$mail->SMTPSecure = "tls";
	$mail->Port = 587; //SMTP server port
	
	$mail->setFrom('dumacc696@gmail.com', 'Admin'); //Sender
	$mail->addAddress('yuki33605@gmail.com'); //Receiver
	//$mail->addAddress('recipient2@example.com', 'Name'); //2nd Receiver
	
	$mail->isHTML(true);
	$mail->Subject = 'Test Mail using PHPMailer'; //Subject of the email
	$mail->Body = 'HTML message body in <b>bold</b>'; //Sent email as HTML 
	$mail->AltBody = 'Body in plain text for non-HTML mail clients'; //Alternate body will be shown as for receipent that dont use HTML
	$mail->send(); 
	echo "Mail has been sent successfully";
} catch (Exception $e) {
	echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";//error message
}

//<H5 style="color: black;">Lampiran email : </H5>
//<input type="file" id="file" name="file" class="form-control">
?>
