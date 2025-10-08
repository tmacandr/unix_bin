#!/bin/bash

ls *.eml > TMP_LIST.txt

while IFS= read -r line; do

   echo "From: $line"

   TO=`echo $line | sed 's/ /_/g'`

   TO=`echo $TO | sed "s/'/-/g"`

   #echo "To..: $TO"

   DATE=`cat "$line" | grep "Date: " | sed 's/^.*\.eml://g'`

   DATE=`echo $DATE | awk '{print $5 "_" $4 "_" $3}'`

   echo "Date: $DATE"

   TO=`echo $DATE $TO`

   TO=`echo $TO | sed 's/ /_/g'`

   echo "To..: $TO"

   # mv "$line" $TO

done < "TMP_LIST.txt"

rm TMP_LIST.txt

