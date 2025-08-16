#!/bin/bash
# 
# Upload image to copywaste and put the url to the image in paste-buffer
#

#API_BASE=https://copywaste.org/rest.php?action=uploadImage
IMAGE=$1
LOGFILE=/tmp/copywaste_upload.log

echo "Incoming: $IMAGE" >> $LOGFILE 
if echo $IMAGE | grep -q "\/Screenshot.*\.png$" ; then
  echo "IS SS: $IMAGE" >> $LOGFILE
  FILENAME=`basename "$IMAGE"`
  FILENAME=`php -r "echo rawurlencode('$FILENAME');"`
#  IMGURL=`curl -F "file=@$IMAGE" -d "data=Screenshot" $API_BASE` 
  IMGURL="https://ss.copywaste.org/img/$FILENAME"
  echo $IMGURL >> $LOGFILE
  echo $IMGURL | pbcopy
  /usr/local/bin/terminal-notifier -message "$IMGURL" -open "$IMGURL" -contentImage "$IMGURL" -title "$IMGURL"
fi


