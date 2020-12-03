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
      ROW_COMMAS_COUNT=$(awk -F"," '{print NF-1}' <<<  $ROW_VALUE)
      ROW_COLUMNS_COUNT=$((ROW_COMMAS_COUNT+1))
      if [[ $ROW_COLUMNS_COUNT != 2 ]]
      then
        echo "line $n in ${FILE} should have 2 columns, $ROW_COLUMNS_COUNT Columns gotted"
        ERROR=101
      fi
    done
done

exit ${ERROR}
