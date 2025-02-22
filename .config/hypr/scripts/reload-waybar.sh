#!/bin/bash

# Kill the specified application
killall -9 waybar

# Wait for 1 second to allow the process to terminate
sleep 1

# Launch the specified application
waybar &
