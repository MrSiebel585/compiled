#!/bin/bash

# Define the source directory and backup destination
source_dir="/var/www/html"
backup_dir="/media/csi/differential"

# Perform the initial full backup
rsync -av "$source_dir" "$backup_dir/full_backup"

# Perform subsequent differential backups
for (( i=1; ; i++ )); do
  rsync -av --link-dest="$backup_dir/full_backup" "$source_dir" "$backup_dir/differential_backup_$i"
  
  # Optionally, you can set a limit on the number of differential backups to retain
  # if [ "$i" -eq 5 ]; then
  #     break
  # fi
done

