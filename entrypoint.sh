#!/bin/bash

ERROR=0

PHP_RESULT=$(php /csv-translation-validator.php ${MODIFIED_FILES})

echo "$PHP_RESULT"

if [[ $(echo "$PHP_RESULT" | grep -c "failed") -gt 0 ]]
then
    exit 101
elif [[ $(echo "$PHP_RESULT" | grep -c "error") -gt 0 ]]
then
    exit 102
fi

exit 0
