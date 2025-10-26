#!/bin/sh
#=============================================================================
# FILE: do_printer_scan.sh
#
# DESCRIPTION:
#    Uses 'linux' command 'scanimage' to scan documents from
#    Canon TS6400 printer/scanner.
#=============================================================================
echo "---> Arguments: $#"

if test "$#" -ne 1; then 
    echo ""
    echo "***> Invalid number of parameters"
    echo ""
    echo "===> USAGE:"
    echo "===>    do_printer_scan.sh <output-file>"
    echo "===>"
    echo "===> Example:"
    echo "===>    do_printer_scan.sh test"

    exit 2 
fi

FILE_NAME_PREFIX=$1

TO_DIR=`pwd`

#
# Device can change based on USB port used.
# Use:
#    scanimage -L
# to list ALL devices.
#

USB2='escl:http://127.0.0.1:60000'

scanimage -v -x 1050 -y 1050 --format=jpeg > $FILE_NAME_PREFIX.jpg

