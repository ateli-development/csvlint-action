<?php
$mageFilename = __DIR__.'/../app/Mage.php';

require_once $mageFilename;
$app = Mage::app();

$modifiedFiles=explode('\n',$argv[1]);
foreach ($modifiedFiles as $file){
    $csvParser = (new Varien_File_Csv())->getData($file);

    $i = 0;
    foreach ($csvParser as $columns){
        $i++;
        if(count($columns) == 2){
            continue;
        }

        echo $file.": There are ".count($columns)." columns in the $i line, it should be 2";
    }
}
