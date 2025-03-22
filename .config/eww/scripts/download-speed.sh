#!/bin/bash

# Get network interface (defaults to first active one if not specified)
INTERFACE=${1:-$(ip route | grep default | awk '{print $5}' | head -n 1)}

# Check if interface exists
if [ -z "$INTERFACE" ] || [ ! -e "/sys/class/net/$INTERFACE" ]; then
    echo "0"
    exit 1
fi

# Function to get RX bytes
get_rx_bytes() {
    cat /sys/class/net/$INTERFACE/statistics/rx_bytes
}

# Function to get speed with more precision
get_speed() {
    local start_bytes=$1
    local end_bytes=$2
    local duration=$3
    
    # Calculate bytes per second with higher precision
    local bytes_per_sec=$(echo "scale=2; ($end_bytes - $start_bytes) / $duration" | bc)
    
    # Convert to KB/s with higher precision
    local kb_per_sec=$(echo "scale=2; $bytes_per_sec / 1024" | bc)
    
    # Remove trailing zeros and decimal point if it's a whole number
    kb_per_sec=$(echo $kb_per_sec | sed 's/\.00$//')
    
    echo $kb_per_sec
}

while true; do
    # Get initial values with precise timestamp
    START_TIME=$(date +%s.%N)
    RX1=$(get_rx_bytes)
    
    # Use a smaller interval for higher accuracy
    sleep 0.5
    
    # Get values after interval with precise timestamp
    END_TIME=$(date +%s.%N)
    RX2=$(get_rx_bytes)
    
    # Calculate exact duration
    DURATION=$(echo "$END_TIME - $START_TIME" | bc)
    
    # Calculate and output speed
    SPEED=$(get_speed $RX1 $RX2 $DURATION)
    echo "$SPEED"
done
