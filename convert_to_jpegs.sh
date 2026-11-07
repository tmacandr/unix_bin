#!/bin/bash
#=============================================================================
# FILE: convert_to_jpegs.sh
#
# DESCRIPTION:
#    Uses Linux tool 'ffmpeg' to convert each 'frame' of a .mp4 video
#    to a JPEG file.
#=============================================================================
VID=VID_20250429_135002393.Work_Thunderstorm.mp4

#
# The name of each .jpg file will have up to a 9 digit
# identifier.  The video shouldn't be longer than that,
# right?
#
ffmpeg -i $VID 2025_04_29.Thunder_Storm_%9d.jpg

