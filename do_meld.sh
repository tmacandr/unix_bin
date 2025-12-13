#!/bin/sh
#=============================================================================
# FILE: do_meld.sh
#
# DESCRIPTION:
#    Uses Linux 'compare' tool called 'meld' to compare two items.  Can be
#    file to file, or full directory to full directory.
#=============================================================================
echo "---> Arguments: $#"

if test $# -ne 2; then 
    echo ""
    echo "***> Invalid number of parameters"
    echo ""
    echo "===> USAGE:"
    echo "===>    do_meld.sh <file_or_dir_left> <file_or_dir_right>"
    echo "===>"
    echo "===> Example:"
    echo "===>    do_meld.sh readme1.txt readme2.txt"

    exit 1 
fi

LEFT=$1

RIGHT=$2

ITEMS="$LEFT $RIGHT"

for each in $ITEMS; do
   if test ! -f $each; then
      if test ! -d $each; then
         echo "***> ERROR - item not found"
         echo "***>       - $each not found"
         exit 2
      fi
   fi
done

if test "$LEFT" = "$RIGHT"; then
   echo "***> ERROR - Items are the same"
   echo "***>       - LEFT..: $LEFT"
   echo "***>       - RIGHT.: $RIGHT"
fi

meld $LEFT $RIGHT

