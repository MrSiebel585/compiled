#!/bin/bash

THRESHOLD=90  # Set the disk space utilization threshold in percentage

while true; do
    UTILIZATION=$(df -h --output=pcent / | awk 'NR==2 {print substr($1, 1, length($1)-1)}')

    if [ "$UTILIZATION" -ge "$THRESHOLD" ]; then
        # Check if Zenity is installed
        if command -v zenity >/dev/null 2>&1; then
            zenity --warning --text="Warning: Disk space utilization is $UTILIZATION%."
        else
            # Display a message box using dialog if Zenity is not available
            dialog --title "Disk Usage Warning" --msgbox "Warning: Disk space utilization is $UTILIZATION%." 10 50
        fi
    fi

    sleep 300  # Adjust the sleep duration (in seconds) as needed
done
