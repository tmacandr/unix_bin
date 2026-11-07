#!/bin/bash
#=============================================================================
# FILE: join_mp4_slices.sh
#
# DESCRIPTION:
#    Uses the Linux tool 'ffmpeg' to join two or more .mp4 files (slices)
#    into one .mp4 video.
#=============================================================================

#
# Create a file with the names of all the .mp4 videos to be
# spliced together
#
echo "video_00.mp4" >  list_of_videos.txt
echo "viedo_01.mp4" >> list_of_videos.txt

#
# Input the list of .mp4 files and the (single) output
# is 'join_video.mp4'.
# 
ffmpeg -f concat -safe 0 -i list_of_videos.txt -c copy join_video.mp4

