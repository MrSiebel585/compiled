#!/bin/bash

# Function to display script usage
function display_usage {
    echo "Usage: $0 <source_disk> <remote_mount_point> <destination_path>"
    echo "Example: $0 /dev/sdX /mnt/remote remote-server:/path/to/destination/image.img"
}

# Check if the required arguments are provided
if [[ $# -ne 3 ]]; then
    display_usage
    exit 1
fi

# Read the source disk, remote mount point, and destination path from the command-line arguments
source_disk="$1"
remote_mount_point="$2"
destination_path="$3"

# Mount the remote filesystem using SSHFS
sshfs "$remote_mount_point" "$remote_mount_point" -o IdentityFile=/path/to/ssh/key

# Check if the SSHFS mount was successful
if [[ $? -ne 0 ]]; then
    echo "Failed to mount the remote filesystem"
    exit 1
fi

# Create the disk image on the remote filesystem
dd if="$source_disk" bs=4M | gzip -c > "$remote_mount_point/$destination_path"

# Check if the disk image creation was successful
if [[ $? -eq 0 ]]; then
    echo "Disk image created successfully at $remote_mount_point/$destination_path"
else
    echo "Failed to create the disk image"
fi

# Unmount the remote filesystem
fusermount -u "$remote_mount_point"

