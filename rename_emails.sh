#!/bin/bash

ls *.eml > TMP_LIST.txt

COUNT=0

while IFS= read -r line; do

   echo "From: $line"

   TO=`echo $line | sed 's/ /_/g'`

   TO=`echo $TO | sed "s/'/-/g"`

   TO=`echo $TO | sed "s/!/-/g"`

   TO=`echo $TO | sed "s/?/-/g"`

   TO=`echo $TO | sed "s/(/-/g"`

   TO=`echo $TO | sed "s/)/-/g"`

   TO=`echo $TO | sed "s/\"/-/g"`

   TO=`echo $TO | sed "s/>/-/g"`

   TO=`echo $TO | sed "s/</-/g"`

   TO=`echo $TO | sed "s/\[/_/g"`

   TO=`echo $TO | sed "s/\]/_/g"`

   TO=`echo $TO | sed "s/,/_/g"`

   TO=`echo $TO | sed "s/|/_/g"`

   TO=`echo $TO | sed "s/;/_/g"`

   TO=`echo $TO | sed 's/\\$/_/g'`

   TO=`echo $TO | sed "s/\&/_/g"`

   TO=`echo $TO | sed "s/~/_/g"`

   #echo "To..: $TO"

   DATE_STAMP=`cat "$line" | grep "Date: " | sed 's/^.*\.eml://g'`

   #echo "Date stamp: $DATE_STAMP"

   DATE=`echo $DATE_STAMP | awk '{print $5 "_" $4 "_" $3 "_" $6}'`

   #echo "Date: $DATE"

   TO=`echo $DATE $TO`

   TO=`echo $TO | sed 's/ /_/g'`

   echo "To..: $TO"

   while test -f $TO; do 
      TO=`echo "$TO $COUNT.eml"`
      TO=`echo $TO | sed 's/ /_/g'`
      echo "===> Count: $COUNT"
      COUNT=$((COUNT + 1))
   done 

   echo "To++: $TO"

   mv "$line" $TO

done < "TMP_LIST.txt"

rm TMP_LIST.txt

