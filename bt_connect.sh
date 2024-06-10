#! /bin/bash

# This script is used to connect to my headphones.
status=$1
echo $status

if [ $status == "con" -o $status == "connect" ]; then
    bluetoothctl connect 98:67:2E:E1:8C:D3
elif [ $status == "discon" -o $status == "disconnect" ]; then
    bluetoothctl disconnect 98:67:2E:E1:8C:D3 
fi
