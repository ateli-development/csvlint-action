#!/bin/bash


set -e
ERROR=0


echo " ************** MODIFIED FILES"

printf ${MODIFIED_FILES}

printf "\n*****************************\n"

PATHS=$(printf ${MODIFIED_FILES} | tr \\n '\n')
CSV_FILES=$(grep -P '.+\.csv$' <<< $PATHS)


echo "$CSV_FILES" | while read FILE ; do
    if [[ ! -f $FILE ]]
    then
      # skip deleted files
      continue
    fi
    ROW_COUNT=$(cat  ${FILE} | xargs -l echo | wc -l)
    for ((n=1;n<=${ROW_COUNT};n++))
    do
      ROW_VALUE=$(sed -n "${n}p" ${FILE})
      if [[ ! $ROW_VALUE =~ ^\"[^\"]+\",\"[^\"]+\"$ ]]
      then
        ERROR=101
        echo "line $n in ${FILE} should have exact 2 columns"
      fi
    done
done

exit $ERROR
