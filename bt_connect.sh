#!/bin/bash

# Bluetooth device connection script
# Usage: bt_connect.sh [connect|disconnect] [device]

# Device MAC addresses
JBL_MAC=F8:5C:7E:AA:D2:88
HEADPHONES_MAC=98:67:2E:E1:8C:D3

# Check if bluetoothctl is available
if ! command -v bluetoothctl >/dev/null 2>&1; then
    echo "Error: bluetoothctl not found" >&2
    exit 1
fi

# Show usage information
show_usage() {
    echo "Usage: $0 [connect|disconnect] [device]"
    echo "  connect [jbl|headphones]  - Connect to specified device"
    echo "  disconnect                - Disconnect from current device"
    exit 1
}

# Validate arguments
if [ $# -eq 0 ]; then
    show_usage
fi

action="$1"

# Handle connect action
if [ "$action" = "connect" ] || [ "$action" = "conn" ]; then
    if [ $# -lt 2 ]; then
        echo "Error: Device name required for connect" >&2
        show_usage
    fi
    
    device="$2"
    
    case "$device" in
        jbl)
            echo "Connecting to JBL bluetooth speaker..."
            if bluetoothctl connect "$JBL_MAC"; then
                echo "Successfully connected to JBL speaker"
            else
                echo "Failed to connect to JBL speaker" >&2
                exit 1
            fi
            ;;
        headphones)
            echo "Connecting to headphones..."
            if bluetoothctl connect "$HEADPHONES_MAC"; then
                echo "Successfully connected to headphones"
            else
                echo "Failed to connect to headphones" >&2
                exit 1
            fi
            ;;
        *)
            echo "Error: Unknown device '$device'" >&2
            echo "Available devices: jbl, headphones" >&2
            exit 1
            ;;
    esac
# Handle disconnect action
elif [ "$action" = "disconnect" ] || [ "$action" = "disconn" ]; then
    echo "Disconnecting from bluetooth device..."
    if bluetoothctl disconnect; then
        echo "Successfully disconnected"
    else
        echo "Failed to disconnect" >&2
        exit 1
    fi
# Handle invalid action
else
    echo "Error: Invalid action '$action'" >&2
    show_usage
fi
