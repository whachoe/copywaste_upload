#!/bin/bash
# 
# Upload image to copywaste and put the url to the image in paste-buffer
#

#API_BASE=https://copywaste.org/rest.php?action=uploadImage
IMAGE=$@
LOGFILE=/tmp/copywaste_upload.log
PHP_BINARY="/opt/homebrew/bin/php"

echo "Incoming: $IMAGE" >> $LOGFILE 
if echo "$IMAGE" | grep -q "\/Screenshot.*\.png$" ; then
  echo "IS SS: $IMAGE" >> $LOGFILE
  FILENAME=`basename "$IMAGE" | jq -Rr @uri`
  #echo "Basename: $FILENAME" >> $LOGFILE
  IMGURL="https://ss.copywaste.org/img/$FILENAME"
  echo $IMGURL >> $LOGFILE
  echo "$IMGURL" | pbcopy
  /usr/local/bin/terminal-notifier -message "$IMGURL" -open "$IMGURL" -contentImage "$IMGURL" -title "New Screenshot" -subtitle "$IMGURL"
fi


