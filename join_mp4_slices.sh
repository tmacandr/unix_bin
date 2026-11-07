#!/bin/bash
#=============================================================================
# FILE: join_mp4_slices.sh
#
# DESCRIPTION:
#    Uses the Linux tool 'ffmpeg' to join two or more .mp4 files (slices)
#    into one .mp4 video.
#
#    NOTE - the 'concat' option isn't listed in the 'man' page for the
#    'ffmpeg' tool.  Had to use 'google' query ... something about too
#    many options ... and to use 'ffmpeg -h demuxer=concat' to see more.
#=============================================================================

#
# Create a file with the names of all the .mp4 videos to be
# spliced together
#
LIST_FILE=list_of_videos.txt

if test -f $LIST_FILE; then 

   echo "===> ATTEN - delete previous list of input files"

   rm $LIST_FILE

fi

touch list_of_videos.txt

INPUTS=`ls part_*.mp4`

for each in $INPUTS; do

   echo "file $each" >>  list_of_videos.txt

done

#
# Input the list of .mp4 files and the (single) output
# is 'join_video.mp4'.
# 
ffmpeg -f concat -safe 0 -i list_of_videos.txt -c copy join_video.mp4

