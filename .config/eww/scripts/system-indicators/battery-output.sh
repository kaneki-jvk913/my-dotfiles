#!/bin/bash

# Get battery percentage and charging status from BAT1
battery_status=$(cat /sys/class/power_supply/BAT1/status)
battery_capacity=$(cat /sys/class/power_supply/BAT1/capacity)

# Define icons
icon_charging="󰂄"
icon_full="󰂂"
icon_high="󰂀"
icon_medium="󰁾"
icon_low="󰁽"
icon_critical="󰁼"
icon_empty="󰁻"
icon_discharging="󰂎"

# Determine the appropriate icon
if [[ "$battery_status" == "Charging" ]]; then
    echo "$icon_charging"
else
    if [ "$battery_capacity" -ge 90 ]; then
        echo "$icon_full"
    elif [ "$battery_capacity" -ge 70 ]; then
        echo "$icon_high"
    elif [ "$battery_capacity" -ge 50 ]; then
        echo "$icon_medium"
    elif [ "$battery_capacity" -ge 30 ]; then
        echo "$icon_low"
    elif [ "$battery_capacity" -ge 10 ]; then
        echo "$icon_critical"
    else
        echo "$icon_empty"
    fi
fi
