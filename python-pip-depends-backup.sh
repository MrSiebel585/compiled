#!/bin/bash

# Define the backup directory
backup_dir="/media/csi/heartbeat"

# Create a timestamp for the backup filename
timestamp=$(date +%Y%m%d_%H%M%S)

# Get a list of Python packages installed with pip
pip_packages=$(pip freeze | cut -d '=' -f 1)

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Backup each Python package using pip
for package in $pip_packages; do
  pip show "$package" >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    pip show "$package" | sudo tar -czvf "$backup_dir/$package-$timestamp.tar.gz" -T -
  fi
done

echo "Backup completed successfully."

