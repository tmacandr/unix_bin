#!/bin/bash
#=============================================================================
# FILE: take_mp4_slice.sh
#
# DESCRIPTION
#    Uses the Linux tool 'ffmpeg' to take a slice out of a given .mp4
#    video and save as a seperate (smaller) video.
#============================================================================= 
if test -z "$1"; then
   echo "***> ERROR - input video not specified"
   exit 99
fi

IN_VID=$1

#                     HH:MM:ss     HH:MM:SS
ffmpeg -i $IN_VID -ss 00:01:40 -to 00:01:52 -c copy slice.mp4

