#!/bin/bash

# Check if Bluetooth is powered on using rfkill
bluetooth_status=$(rfkill list bluetooth | grep -i "Soft blocked" | awk '{print $3}')

if [[ "$bluetooth_status" == "no" ]]; then
  # Bluetooth is enabled
  echo "󰂯"
else
  # Bluetooth is disabled
  echo "󰂲"
fi
