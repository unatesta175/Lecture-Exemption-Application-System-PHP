<?php
include 'components/connect.php';
if (isset($_GET['application_id'])) {
    $application_id = $_GET['application_id'];
    
    $delete = $conn->prepare("DELETE FROM `applications` WHERE application_id = ?");
    $result = $delete->execute([$application_id]);
    

    $delete = $conn->prepare("DELETE FROM `classes` WHERE application_id = ?");
    $result = $delete->execute([$application_id]);
    header('location:application_menu.php');
}

?>