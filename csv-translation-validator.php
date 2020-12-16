<?php
$mageFilename = __DIR__.'/github/workspace/app/Mage.php';

require_once $mageFilename;
$app = Mage::app();

$modifiedFiles=explode('\n',$argv[1]);
$modifiedFiles = array_filter($modifiedFiles, function ($item) {
    return preg_match('/^.+\.csv$/',$item);
});
foreach ($modifiedFiles as $file){
    $csvParser = (new Varien_File_Csv())->getData("/github/workspace/{$file}");

    $i = 0;
    foreach ($csvParser as $columns){
        $i++;
        if(count($columns) == 3){
            continue;
        }

        echo $file." validation failed: There are ".count($columns)." columns in the $i line, it should be 2\n";
        die();
    }
}
