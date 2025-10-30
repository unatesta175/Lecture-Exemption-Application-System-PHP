<?php
include 'components/connect.php';
if (isset($_GET['class_id'])) {
    $class_id = $_GET['class_id'];
    $application_id = $_GET['application_id'];
    
    $delete = $conn->prepare("DELETE FROM `classes` WHERE class_id = ?");
    $result = $delete->execute([$class_id]);
    header('location:application_add_class.php?application_id=' . $application_id . '');
    
    $class_items[] = '';
    $total_classes = '';
    $count = 1;
    $result2 = $conn->prepare("SELECT * FROM `classes` WHERE application_id=?");
    $result2->execute([$application_id]);
    if ($result2->rowCount() > 0) {
        while ($row2 = $result2->fetch(PDO::FETCH_ASSOC)) {


            $class_items[] = "\n(" . $count . ")[Kod Kursus : " . $row2['course_code'] . "\n Kumpulan : " . $row2['group'] . "\n Pensyarah : " . $row2['lecturer_name'] . '] - ';
            $total_classes = implode($class_items);
            $count = $count + 1;
        }
    }

    $update = $conn->prepare("UPDATE `applications` SET total_class = ? WHERE application_id = ?");
    $update->execute([$total_classes, $application_id]);

    

    $resultx = $conn->prepare("SELECT * FROM `applications` WHERE application_id=?");
    $resultx->execute([$application_id]);
    if ($resultx->rowCount() > 0) {
        while ($rowx = $resultx->fetch(PDO::FETCH_ASSOC)) {
            
            $total_authorizer_needed = $rowx['total_authorizer_needed'];
            $total_authorizer_signed = $rowx['total_authorizer_signed'];
        
        }}

        $total_authorizer_needed=$total_authorizer_needed - 1;

    $update = $conn->prepare("UPDATE `applications` SET total_authorizer_needed = ? WHERE application_id = ?");
    $update->execute([ $total_authorizer_needed , $application_id]);
    
    header('location:application_add_class.php?application_id=' . $application_id . '');

}




?>