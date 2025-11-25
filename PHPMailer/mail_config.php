<?php
/**
 * Email Configuration
 * Centralized email settings using environment variables
 */

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once __DIR__ . '/../components/config.php';
require 'vendor/autoload.php';

/**
 * Create and configure PHPMailer instance
 * 
 * @return PHPMailer
 */
function getMailer() {
    $mail = new PHPMailer(true);
    
    try {
        // Server settings
        $mail->isSMTP();
        $mail->Host       = env('MAIL_HOST', 'smtp.gmail.com');
        $mail->SMTPAuth   = true;
        $mail->Username   = env('MAIL_USERNAME');
        $mail->Password   = env('MAIL_PASSWORD');
        
        // Encryption
        $encryption = strtolower(env('MAIL_ENCRYPTION', 'tls'));
        if ($encryption === 'ssl') {
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        } else {
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        }
        
        $mail->Port = env('MAIL_PORT', 587);
        
        // Default sender
        $mail->setFrom(
            env('MAIL_FROM_ADDRESS'),
            env('MAIL_FROM_NAME', 'ELEAS System')
        );
        
        // Character set
        $mail->CharSet = 'UTF-8';
        
        // Enable HTML
        $mail->isHTML(true);
        
    } catch (Exception $e) {
        error_log("PHPMailer Configuration Error: {$e->getMessage()}");
        throw $e;
    }
    
    return $mail;
}

/**
 * Send email using configured settings
 * 
 * @param string $to Recipient email address
 * @param string $subject Email subject
 * @param string $body Email body (HTML)
 * @param array $attachments Array of file paths to attach
 * @param array $cc Array of CC email addresses
 * @param array $bcc Array of BCC email addresses
 * @return bool
 */
function sendEmail($to, $subject, $body, $attachments = [], $cc = [], $bcc = []) {
    try {
        $mail = getMailer();
        
        // Recipients
        $mail->addAddress($to);
        
        // CC recipients
        foreach ($cc as $ccEmail) {
            $mail->addCC($ccEmail);
        }
        
        // BCC recipients
        foreach ($bcc as $bccEmail) {
            $mail->addBCC($bccEmail);
        }
        
        // Attachments
        foreach ($attachments as $attachment) {
            if (file_exists($attachment)) {
                $mail->addAttachment($attachment);
            }
        }
        
        // Content
        $mail->Subject = $subject;
        $mail->Body    = $body;
        $mail->AltBody = strip_tags($body); // Plain text version
        
        // Send email
        $mail->send();
        
        // Log success if debugging
        if (env('APP_DEBUG', false)) {
            error_log("Email sent successfully to: $to");
        }
        
        return true;
        
    } catch (Exception $e) {
        error_log("Email sending failed: {$mail->ErrorInfo}");
        
        if (env('APP_DEBUG', false)) {
            throw $e;
        }
        
        return false;
    }
}

/**
 * Send email to student
 * 
 * @param string $studentEmail
 * @param string $studentName
 * @param string $subject
 * @param string $message
 * @return bool
 */
function sendStudentEmail($studentEmail, $studentName, $subject, $message) {
    $body = "
    <html>
    <head>
        <style>
            body { font-family: Arial, sans-serif; line-height: 1.6; }
            .header { background-color: #003366; color: white; padding: 20px; text-align: center; }
            .content { padding: 20px; }
            .footer { background-color: #f4f4f4; padding: 10px; text-align: center; font-size: 12px; }
        </style>
    </head>
    <body>
        <div class='header'>
            <h2>ELEAS - UiTM</h2>
        </div>
        <div class='content'>
            <p>Dear $studentName,</p>
            $message
            <p>Best regards,<br>Academic Affairs Department<br>Universiti Teknologi MARA</p>
        </div>
        <div class='footer'>
            <p>This is an automated email from ELEAS. Please do not reply to this email.</p>
        </div>
    </body>
    </html>
    ";
    
    return sendEmail($studentEmail, $subject, $body);
}

/**
 * Send email to lecturer
 * 
 * @param string $lecturerEmail
 * @param string $lecturerName
 * @param string $subject
 * @param string $message
 * @return bool
 */
function sendLecturerEmail($lecturerEmail, $lecturerName, $subject, $message) {
    $body = "
    <html>
    <head>
        <style>
            body { font-family: Arial, sans-serif; line-height: 1.6; }
            .header { background-color: #003366; color: white; padding: 20px; text-align: center; }
            .content { padding: 20px; }
            .footer { background-color: #f4f4f4; padding: 10px; text-align: center; font-size: 12px; }
        </style>
    </head>
    <body>
        <div class='header'>
            <h2>ELEAS - UiTM</h2>
        </div>
        <div class='content'>
            <p>Dear $lecturerName,</p>
            $message
            <p>Best regards,<br>Academic Affairs Department<br>Universiti Teknologi MARA</p>
        </div>
        <div class='footer'>
            <p>This is an automated email from ELEAS. Please do not reply to this email.</p>
        </div>
    </body>
    </html>
    ";
    
    return sendEmail($lecturerEmail, $subject, $body);
}
?>


