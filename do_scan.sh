#!/bin/sh
#=============================================================================
# FILE: do_scan.sh
#
# DESCRIPTION:
#    Uses 'linux' command 'scanimage' to scan documents from
#    Brother ADS-1200.
#=============================================================================
echo "---> Arguments: $#"

if test "$#" -ne 3; then 
    echo ""
    echo "***> Invalid number of parameters"
    echo ""
    echo "===> USAGE:"
    echo "===>    do_scan.sh <file_prefix> <count-start> <single | duplex>"
    echo "===>"
    echo "===> Example:"
    echo "===>    do_scan.sh test 0 single"

    exit 2 
fi

FILE_NAME_PREFIX=$1

COUNT_START=$2

if test "$3" = "single"; then
   SOURCE="Automatic Document Feeder(left aligned)"
elif test "$3" = "duplex"; then
   SOURCE="Automatic Document Feeder(left aligned,Duplex)"
else
   echo "***> Invalid scan option"
   echo "***> $3 is unrecognized"
   echo "***> Use 'single' or 'duplex'"

   exit 2
fi

echo $SOURCE

TO_DIR=`pwd`

#
# The 'center aligned' option doesn't work ... not sure why.
# It causes 'seg fault'.
#
# --source 'Automatic Document Feeder(center aligned,Duplex)'
#
# Only seems to accept 'left aligned'
#
# Device can change based on USB port used.
# Use:
#    scanimage -L
# to list ALL devices.
#

DEVICE='brother5:bus3;dev2'

scanimage -d $DEVICE              \
          --source "$SOURCE"      \
          --resolution 600        \
          --format jpeg           \
          --batch=$TO_DIR/$FILE_NAME_PREFIX%.2d.jpg --batch-start=$COUNT_START

