#!/bin/bash

# Define the backup directory
backup_dir="/path/to/backup"

# Define the package name
package_name="mariadb-server"

# Define the list of databases to backup
databases=("database1" "database2" "database3")

# Create a timestamp for the backup filename
timestamp=$(date +%Y%m%d_%H%M%S)

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Backup the package configuration files
sudo apt-get -y install debconf-utils
sudo debconf-get-selections | grep "^$package_name\s" > "$backup_dir/$package_name-$timestamp.conf"

# Backup the databases
for database in "${databases[@]}"; do
  sudo mysqldump --databases "$database" > "$backup_dir/$database-$timestamp.sql"
done

echo "Backup completed successfully."

