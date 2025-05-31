#!/bin/bash

# Define the backup directory
backup_dir="/media/csi/heartbeat"

# Create a timestamp for the backup filename
timestamp=$(date +%Y%m%d_%H%M%S)

# Get a list of user-installed packages
package_list=$(dpkg --get-selections | grep -v deinstall | cut -f1)

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Backup each package using dpkg
for package in $package_list; do
  sudo dpkg -s "$package" >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    sudo dpkg -L "$package" | sudo tar -czvf "$backup_dir/$package-$timestamp.tar.gz" -T -
  fi
done

echo "Backup completed successfully."

