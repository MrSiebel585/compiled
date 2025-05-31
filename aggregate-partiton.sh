#!/bin/bash

# Check if root user is running the script
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

# Check if parted command is available
if ! command -v parted >/dev/null 2>&1; then
    echo "parted command is not available. Please install parted."
    exit 1
fi

# Get the current size of /dev/sda4
current_size=$(parted /dev/sda unit GB print | awk '$1==4 {print $3}')

# Calculate the new size of /dev/sda2
new_size=$((current_size + 20))

# Resize the partitions
parted /dev/sda resizepart 2 "$new_size"GB
parted /dev/sda resizepart 4 100%

# Inform the user about the successful operation
echo "Partition resizing complete"
