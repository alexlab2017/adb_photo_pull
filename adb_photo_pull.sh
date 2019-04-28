#!/bin/bash

# adb_photo_pull.sh
#
# Utility to pull last `n` photos from an Android device.
#
# (c) 2019 Alessandro Labate

photo_dir="/sdcard/DCIM/Camera/"
out_dir="/home/alessandro/Immagini/S9_Plus/"

photos=($(adb shell ls "$photo_dir*"))

usage() {
cat <<EOF
$0 number
number:
    type: int, how many photos to pull?
EOF
}

if [[ $# -ne 1 ]]; then
    echo "Exactly one argument is needed."
    usage
    exit 1
fi

if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "\"number\" argument should be an integer."
    usage
    exit 1
fi

if [[ $1 -gt ${#photos[@]} ]]; then
    echo "There are max ${#photos[@]} items available."
    exit 1
fi

for item in ${photos[@]: -$1:$1}; do
    adb pull $item $out_dir
done
