#!/bin/bash

# Function to display the main menu
display_menu() {
  clear
  echo "=== Cron Job Management ==="
  echo "1. List All Cron Jobs"
  echo "2. Create a New Cron Job"
  echo "3. Remove a Cron Job"
  echo "4. Exit"
  echo "=========================="
}

# Function to list all cron jobs
list_cron_jobs() {
  echo "Listing all cron jobs:"
  crontab -l
  echo "--------------------------"
}

# Function to create a new cron job
create_cron_job() {
  read -p "Enter the cron schedule (e.g., * * * * *): " schedule
  read -p "Enter the command to execute: " command

  # Add the cron job to the user's crontab
  (crontab -l ; echo "$schedule $command") | crontab -

  echo "Cron job created successfully."
}

# Function to remove a cron job
remove_cron_job() {
  read -p "Enter the command of the cron job to remove: " command

  # Remove the cron job from the user's crontab
  (crontab -l | grep -v "$command") | crontab -

  echo "Cron job removed successfully."
}

# Main script
while true; do
  display_menu

  read -p "Enter your choice (1-4): " choice

  case $choice in
    1) list_cron_jobs ;;
    2) create_cron_job ;;
    3) remove_cron_job ;;
    4) echo "Exiting..."; exit ;;
    *) echo "Invalid choice. Please try again." ;;
  esac

  read -p "Press enter to continue..."
done
