#!/bin/sh
#=============================================================================
# FILE: find_in_files.sh
#
# DESCRIPTION:
#    Searches specified file types in the specified directory for
#    strings that match <search-item>.
#
#    Had to go 'recursive' because a 'find' would often return
#    a list of files that was too long for the shell to handle
#    as an arg (list) to the 'grep' tool.
#=============================================================================
if test $# -ne 3; then

   echo "******************************************************"
   echo "Invalid arguments"
   echo "Usage:"
   echo "   find_in_files.sh <root_path> <file_type> <search_item>"
   echo "Example:"
   echo "   find_in_files.sh /usr/include *.h static"
   echo "******************************************************"

   exit
fi

HERE=`pwd`

FILE_PATH=$1
FILE_TYPE=$2
ITEM=$3

echo "__________________________"
echo "Begin search:"
echo "Path..........: $FILE_PATH"
echo "File Type.....: $FILE_TYPE"
echo "Search item...: $ITEM"
echo "__________________________"
echo ""


#===============================================
# FUNCTION: Find_String_Match
#
# DESCRIPTION:
#    Searches all the 'FILE_TYPE' files in the
#    current-working-directory for matching
#    string(s).  Echos the any files that
#    return a 'match'.
#===============================================
Find_String_Match ()
{
    #echo "_____________________"

    #pwd

    #
    # Redirect errors from <stderr>
    # to /dev/null
    #
    LIST=`ls $FILE_TYPE 2>/dev/null`

    for each_file in $LIST; do

       IS_FOUND=`grep -i "$ITEM" $each_file`

       if test -n "$IS_FOUND"; then

          echo "In File: $each_file"

       fi

    done

    #echo "_____________________"
}


#===============================================
# FUNCTION: Find_In_Directory
#
# DESCRIPTION:
#    Recursivley drill down into each
#    subdirectory in the current-directory
#    until a 'leaf' directory is reached.  Then
#    the files in that directory are searched.
#
#    When all sub-directories have been
#    searched, then the remaining files
#    in the 'parent' directory are searched.
#===============================================
Find_In_Directory  ()
{
    ITEMS=`ls`

    for i in $ITEMS; do

       if test -d $i; then

          #echo "---> Next: $i"

          cd $i

	  Find_In_Directory

	  cd ..

       fi

    done

    Find_String_Match
}

if ! test -d $FILE_PATH; then

   echo "**********************************"
   echo "****> ERROR - Directory not found"
   echo "***>          $FILE_PATH not found"
   echo "**********************************"

else

   cd $FILE_PATH

   Find_In_Directory

fi

cd $HERE

echo ""
echo "_________"
echo "Search done"

