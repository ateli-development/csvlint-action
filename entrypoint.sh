#!/bin/bash


ERROR=0

PHP_RESULT=$(php /csv-translation-validator.php ${MODIFIED_FILES})

echo "$PHP_RESULT"

IS_FAILED=$(echo $PHP_RESULT | grep "failed" | wc -l)




if [[ $IS_FAILED == 1 ]]
then
  exit 101
fi

exit 0
