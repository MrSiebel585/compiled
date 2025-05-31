#!/bin/bash

# Define the device and partition where the file system resides
device="/dev/sda2"
partition="main-system"

# Define the output directory for recovered files
output_dir="/media/csi/recovery"

# Run extundelete to recover deleted files from 1 day ago
extundelete --restore-all --after $(date -d "-1 day" +"%Y-%m-%d") --output-dir "$output_dir" "$device$partition"

echo "File recovery completed successfully."
