#!/bin/bash

echo "Starting fswatch.."
SCREENSHOTDIR=~/Pictures/ss
/usr/local/bin/fswatch -0 --event=Renamed $SCREENSHOTDIR |xargs -0 -n 1 ~/bin/copywaste_upload/copywaste_upload.sh
