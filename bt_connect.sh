#! /bin/bash

# This script is used to connect to my bluetooth devices.
status=$1
device=$2
jbl=F8:5C:7E:AA:D2:88
headphones=98:67:2E:E1:8C:D3

if [ $status == "con" -o $status == "connect" ]; then
    if [ $device == "jbl" ]; then
        echo "Connecting to JBL bluetooth speaker"
        bluetoothctl connect $jbl
    elif [ $device == "headphones" ]; then
        echo "Connecting to your headphones"
        bluetoothctl connect $headphones
    fi
elif [ $status == "discon" -o $status == "disconnect" ]; then
    bluetoothctl disconnect
fi
