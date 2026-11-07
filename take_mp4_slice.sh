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

if test -z "$2"; then
   echo "***> ERROR - start time of video not specified (HH:MM:SS)"
   exit 99
fi

START_TIME=$2

if test -z "$3"; then
   echo "***> ERROR - end time of video not specified (HH:MM:SS)"
   exit 99
fi

END_TIME=$3

#         $INPUT       HH:MM:SS        HH:MM:SS     OUTPUT
ffmpeg -i $IN_VID -ss $START_TIME -to $END_TIME -c copy slice.mp4

