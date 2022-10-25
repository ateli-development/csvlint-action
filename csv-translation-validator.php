<?php
$mageFilename = __DIR__.'/github/workspace/app/Mage.php';

require_once $mageFilename;
// $app = Mage::app();

$modifiedFiles = glob('app/locale/*/*.csv');

foreach ($modifiedFiles as $file){
	$csvParser = (new Varien_File_Csv())->getData("{$file}");

    $i = 0;
    foreach ($csvParser as $columns){
        $i++;
        if(count($columns) == 2){
            continue;
        }

        echo $file." validation failed: There are ".count($columns)." columns in line $i, it should be 2\n";
    }
}

if($i > 0){
    exit(101);
}
