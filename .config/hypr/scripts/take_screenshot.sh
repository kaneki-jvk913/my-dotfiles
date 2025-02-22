#!/bin/bash

# Take a screenshot of the entire screen and save it to ~/Pictures
grim ~/Pictures/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png

# Notify the user
notify-send "Screenshot saved to ~/Pictures"

