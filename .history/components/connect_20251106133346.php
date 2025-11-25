<?php

$db_name = 'mysql:host=localhost;dbname=eleas_v3';
$user_name = 'root';
$user_password = '';




try{

    $conn = new PDO($db_name, $user_name, $user_password);
    $conn ->setAttribute(PDO::ATTR_ERRMODE ,PDO::ERRMODE_EXCEPTION);
//echo "Connected Succesfully"
} catch(PDOException $e){

echo "Connection Failed" . $e ->getMessage();

}
?>