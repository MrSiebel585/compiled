#!/bin/bash

DEVICE="/dev/sda2"   # Specify the device or partition where files were deleted
OUTPUT_DIR="/path/to/restore"   # Specify the directory where recovered files will be placed

# Check if extundelete is installed
command -v extundelete >/dev/null 2>&1 || { echo >&2 "extundelete is not installed. Aborting."; exit 1; }

# Check if the output directory exists
if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Output directory does not exist. Creating directory: $OUTPUT_DIR"
    mkdir -p "$OUTPUT_DIR"
fi

# Run extundelete to restore files
extundelete "$DEVICE" --restore-all -o "$OUTPUT_DIR"

# Provide summary of recovery
if [ $? -eq 0 ]; then
    echo "File recovery completed successfully."
    echo "Recovered files are located in: $OUTPUT_DIR"
else
    echo "File recovery failed."
fi
