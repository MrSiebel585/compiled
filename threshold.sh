#!/bin/bash

THRESHOLD=90   # Set the disk space utilization threshold in percentage

# Function to perform cleanup actions
perform_cleanup() {
    echo "Performing cleanup..."

    # Clean up temporary files
    echo "Cleaning up temporary files in /tmp..."
    rm -rf /tmp/*

    # Clean up logs
    echo "Cleaning up log files in /var/log..."
    find /var/log -type f -name "*.log" -exec rm {} \;

    # Clean up package caches
    echo "Cleaning up package caches in /var/cache/apt/archives..."
    apt-get clean

    # Clean up browser caches (Google Chrome)
    echo "Cleaning up Google Chrome cache..."
    rm -rf ~/.cache/google-chrome/*

    # Clean up browser caches (Mozilla Firefox)
    echo "Cleaning up Mozilla Firefox cache..."
    rm -rf ~/.mozilla/firefox/*/cache/*

    # Clean up trash/recycle bin
    echo "Emptying trash/recycle bin..."
    rm -rf ~/.local/share/Trash/* ~/.Trash/*

    # Clean up old kernel versions (Linux)
    echo "Cleaning up old kernel versions..."
    # Add your commands to remove old kernel versions from /boot here

    # Clean up user-specific directories
    echo "Cleaning up user-specific directories..."
    # Add your commands to clean up user-specific directories here
}

# Main script
while true; do
    # Get the disk space utilization percentage
    UTILIZATION=$(df -h --output=pcent / | awk 'NR==2 {print substr($1, 1, length($1)-1)}')

    # Check if the disk space utilization exceeds the threshold
    if [ "$UTILIZATION" -ge "$THRESHOLD" ]; then
        echo "Disk space utilization is $UTILIZATION%. Cleaning up..."
        perform_cleanup
    fi

    # Wait for some time before checking again
    sleep 300  # Adjust the sleep duration (in seconds) as needed
done
