#!/bin/bash

# Source and destination partitions
source_partition="/dev/sda2"
destination_partition="/dev/sda3"

# Mount points for the partitions
source_mount="/mnt/source"
destination_mount="/mnt/destination"

# Function to mount partitions
mount_partitions() {
  echo "Mounting source partition: $source_partition"
  mount "$source_partition" "$source_mount"
  
  echo "Mounting destination partition: $destination_partition"
  mount "$destination_partition" "$destination_mount"
}

# Function to unmount partitions
unmount_partitions() {
  echo "Unmounting source partition: $source_partition"
  umount "$source_mount"
  
  echo "Unmounting destination partition: $destination_partition"
  umount "$destination_mount"
}

# Main script logic
echo "Copying contents from $source_partition to $destination_partition"

# Mount partitions
mount_partitions

# Copy contents using rsync
rsync -a "$source_mount/" "$destination_mount/"

# Unmount partitions
unmount_partitions

echo "Copy completed successfully"

