#!/bin/bash

# Backup directory
BACKUP_DIR="/path/to/backup/dir"

# Function to backup configuration files
backup_configuration() {
  echo "Backing up configuration files..."
  mkdir -p "$BACKUP_DIR"
  cp /etc/*.conf "$BACKUP_DIR"
  echo "Backup completed. Configuration files are stored in: $BACKUP_DIR"
}

# Function to restore configuration files
restore_configuration() {
  echo "Restoring configuration files..."
  if [[ -d "$BACKUP_DIR" ]]; then
    cp "$BACKUP_DIR"/*.conf /etc/
    echo "Restoration completed. Configuration files are restored."
  else
    echo "No backup directory found. Unable to restore configuration files."
  fi
}

# Main script
while true; do
  clear
  echo "=== Configuration Backup and Restore ==="
  echo "1. Backup Configuration"
  echo "2. Restore Configuration"
  echo "3. Exit"
  echo "========================================"

  read -p "Enter your choice (1-3): " choice

  case $choice in
    1) backup_configuration ;;
    2) restore_configuration ;;
    3) echo "Exiting..."; exit ;;
    *) echo "Invalid choice. Please try again." ;;
  esac

  read -p "Press enter to continue..."
done
