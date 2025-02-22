#!/bin/bash

if pgrep hyprsunset > /dev/null
then
    echo "HyprSunset is running, killing process..."
    pkill hyprsunset
else
    echo "HyprSunset is not running, starting process..."
    hyprsunset -t 3000 &
fi

