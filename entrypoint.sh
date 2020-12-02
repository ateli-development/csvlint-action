
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
    echo $FILE
#     if xmllint $FILE --noout ; then
#       echo "xml-syntax is fine: $FILE"
#     else
#       ERROR=101
#     fi
done

exit ${ERROR}
