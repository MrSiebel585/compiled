#!/bin/bash

echo "File Recovery Script"
echo "---------------------"
echo "This script utilizes the extundelete utility to recover deleted files from an ext2, ext3, or ext4 file system."
echo "Please ensure that you have appropriate permissions and the extundelete utility installed on your system before running this script."

# Prompt for the device and partition where the file system resides
read -p "Enter the device where the file system resides (e.g., /dev/sdX): " device
read -p "Enter the partition number (e.g., 1 for the first partition): " partition

# Prompt for the output directory for recovered files
read -p "Enter the directory where the recovered files will be stored: " output_dir

echo "---------------------"
echo "Running file recovery..."

# Run extundelete to recover deleted files
extundelete --restore-all --after $(date -d "-1 day" +"%Y-%m-%d") --output-dir "$output_dir" "$device$partition"

echo "---------------------"
echo "File recovery completed successfully."

