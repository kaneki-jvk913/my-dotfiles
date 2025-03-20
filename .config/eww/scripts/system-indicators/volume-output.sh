#!/bin/bash

# Get the volume level using wpctl
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')

# Check the volume level and output the appropriate icon
if [[ $(awk "BEGIN {print ($volume == 0.0)}") -eq 1 ]]; then
  echo "" # Volume is 0
elif [[ $(awk "BEGIN {print ($volume > 0.6)}") -eq 1 ]]; then
  echo "" # Volume is above 0.6
elif [[ $(awk "BEGIN {print ($volume >= 0.35 && $volume <= 0.59)}") -eq 1 ]]; then
  echo "󰕾" # Volume is between 0.35 and 0.59
elif [[ $(awk "BEGIN {print ($volume >= 0.10 && $volume < 0.35)}") -eq 1 ]]; then
  echo "" # Volume is between 0.10 and 0.34
else
  echo "" # Volume is below 0.10
fi
