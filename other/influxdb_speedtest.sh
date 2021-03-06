#!/bin/bash
FILE="/app/speedtest/test_connection.log"

while true 
do 
    TIMESTAMP=$(date '+%s')

    speedtest-cli > $FILE

    DOWNLOAD=$(cat $FILE | grep "Download:" | awk -F " " '{print $2}')
    UPLOAD=$(cat $FILE | grep "Upload:" | awk -F " " '{print $2}')
    echo "Download: $DOWNLOAD Upload: $UPLOAD    $TIMESTAMP"
    curl -i -XPOST 'http://localhost:8086/write?db=speedtest' --data-binary "download,host=local value=$DOWNLOAD"
    curl -i -XPOST 'http://localhost:8086/write?db=speedtest' --data-binary "upload,host=local value=$UPLOAD"
    sleep $TEST_INTERVAL

done
