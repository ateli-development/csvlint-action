#!/bin/bash


ERROR=0


echo " ************** MODIFIED FILES"

printf ${MODIFIED_FILES}

printf "\n*****************************\n"
echo $(pwd)
printf "\n*****************************\n"

#PATHS=$(printf ${MODIFIED_FILES} | tr \\n '\n')
#CSV_FILES=$(grep -P '.+\.csv$' <<< $PATHS)


php /csv-translation-validator.php ${MODIFIED_FILES}


exit 0
