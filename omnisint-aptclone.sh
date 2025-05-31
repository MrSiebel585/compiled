#!/bin/bash

# Define the packages to be cloned
packages=("package1" "package2" "package3")

# Define the backup file path
backup_file="/media/csi/heartbeat/omnisint.apt-clone"

# Create a temporary directory
temp_dir=$(mktemp -d)

# Install apt-clone if not already installed
if ! command -v apt-clone &>/dev/null; then
  sudo apt-get update
  sudo apt-get install -y apt-clone
fi

# Create a backup of the specified packages
sudo apt-clone clone ${packages[@]} --destination=$temp_dir

# Move the backup file to the desired location
sudo mv "$temp_dir"/*.apt-clone "$backup_file"

# Clean up the temporary directory
rm -r "$temp_dir"

echo "Backup completed successfully."

