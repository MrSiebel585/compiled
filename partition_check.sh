#!/bin/bash

# Define the partitions to check (modify as needed)
partitions=(
  "/dev/sda1"
  "/dev/sdb1"
)

# Function to check and fix partition errors
check_and_fix_partition() {
  partition="$1"
  echo "Checking partition: $partition"
  
  # Check the partition for errors
  fsck -y "$partition"
  
  # Check the exit code of fsck
  exit_code=$?
  if [ $exit_code -eq 0 ]; then
    echo "No errors found on partition: $partition"
  elif [ $exit_code -eq 1 ]; then
    echo "Errors were corrected on partition: $partition"
  else
    echo "Errors were found but could not be corrected on partition: $partition"
  fi
}

# Iterate over the partitions and check for errors
for partition in "${partitions[@]}"; do
  check_and_fix_partition "$partition"
done

