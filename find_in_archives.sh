#!/bin/bash

if test $# -ne 1; then

   echo "******************************************************"
   echo "Invalid arguments"
   echo "Usage:"
   echo "   find_in_archives.sh <search_item>"
   echo "Example:"
   echo "   find_in_archives.sh printf"
   echo "******************************************************"

   exit
fi

export ITEM=$1

echo "__________________________"
echo "Begin search:"
echo "Path..........: /lib"
echo "File Type.....: lib*.a"
echo "Search item...: $ITEM"
echo "__________________________"
echo ""

export LIST=`find /lib -name "lib*.a" -print`

for each_file in $LIST; do

   export IS_FOUND=`nm $each_file | grep -i "$ITEM"`

   if test -n "$IS_FOUND"; then

      echo "In File: $each_file"

   fi

done

echo "__________________________"
echo "Begin search:"
echo "Path..........: /lib"
echo "File Type.....: lib*.so"
echo "Search item...: $ITEM"
echo "__________________________"
echo ""

export LIST=`find /lib -name "lib*.so" -print`

for each_file in $LIST; do

   export IS_FOUND=`nm $each_file | grep -i "$ITEM"`

   if test -n "$IS_FOUND"; then

      echo "In File: $each_file"

   fi

done

echo ""
echo "_________"
echo "Search done"


