#!/bin/bash

# Check media state and toggle icons accordingly
status=$(playerctl status 2>/dev/null)

if [[ $status == "Playing" ]]; then
  echo "󰐍"  # Pause icon
else
  echo "󰏦"  # Play icon
fi
