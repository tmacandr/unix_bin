#!/bin/bash

ls *.eml > TMP_LIST.txt

while IFS= read -r line; do
  echo "From: \"$line\""

  TO=`echo $line | sed 's/ /_/g'`

  echo "To..: $TO"

done < "TMP_LIST.txt"

rm TMP_LIST.txt

