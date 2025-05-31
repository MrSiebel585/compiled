#!/bin/bash

# Make Windows USB With EFI UEFI Boot Parttion

# Check if running with root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

# Prompt for the path to the Windows 10 ISO file
read -p "Enter the path to the Windows 10 ISO file: " iso_path

# Prompt for the target USB drive
read -p "Enter the target USB drive (e.g., /dev/sdX): " usb_drive

# Confirm the provided paths
echo "Windows 10 ISO file: $iso_path"
echo "Target USB drive: $usb_drive"

read -p "Do you want to proceed? (y/n): " confirm

if [[ $confirm != "y" && $confirm != "Y" ]]; then
    echo "Aborted."
    exit 0
fi

# Write the Windows 10 ISO to the USB drive using dd
dd if="$iso_path" of="$usb_drive" bs=4M status=progress

# Set the boot sector on the USB drive
if [ -x "$(command -v bootsect)" ]; then
    echo "Setting boot sector..."
    bootsect /nt60 "$usb_drive" 2>/dev/null
    echo "Boot sector set."
else
    echo "bootsect utility not found. Please set the boot sector manually using a Windows machine."
fi

echo "Process completed successfully."
