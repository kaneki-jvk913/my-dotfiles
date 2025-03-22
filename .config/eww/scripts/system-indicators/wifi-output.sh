#!/bin/bash

# Get Wi-Fi connection status and signal strength using nmcli
connection_status=$(nmcli -t -f WIFI g)
current_signal=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^*' | cut -d':' -f2)

# Define icons
icon_disconnected="󰤭"
icon_weak="󰤟"
icon_good="󰤥"
icon_excellent="󰤨"

# Check if Wi-Fi is enabled and connected
if [[ "$connection_status" != "enabled" ]]; then
    echo "$icon_disconnected"
elif [[ -z "$current_signal" ]]; then
    echo "$icon_disconnected"
else
    # Determine signal quality based on signal strength
    if [ "$current_signal" -lt 40 ]; then
        echo "$icon_weak"
    elif [ "$current_signal" -lt 70 ]; then
        echo "$icon_good"
    else
        echo "$icon_excellent"
    fi
fi
