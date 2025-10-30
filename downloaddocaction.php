<?php
if (!empty($_GET['doc'])) {
   
    $fileName  = basename($_GET['doc']);
    $filePath  = "supportDocfile/" . $fileName;

    if (!empty($fileName) && file_exists($filePath)) {
        //define header
        header("Cache-Control: public");
        header("Content-Description: File Transfer");
        header("Content-Disposition: attachment; filename=$fileName");
        header("Content-Type: application/zip");
        header("Content-Transfer-Encoding: binary");

        //read file 
        readfile($filePath);
        exit;
    } else {
        echo "File does not exist";
    }
}
