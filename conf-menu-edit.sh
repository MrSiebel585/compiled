#!/bin/bash

# Function to edit a configuration file
edit_configuration() {
  local file_path=$1

  if [[ -f "$file_path" ]]; then
    clear
    echo "=== Editing Configuration File ==="
    echo "File: $file_path"
    echo "=================================="

    # Display the current content of the file
    echo "Current content:"
    echo "----------------"
    cat "$file_path"
    echo "----------------"

    # Prompt for user input to edit the file
    read -p "Enter new content (Ctrl+D to save and exit): " new_content

    # Save the new content to the file
    echo "$new_content" > "$file_path"

    echo "File saved."
  else
    echo "File not found: $file_path"
  fi
}

# Main script
clear
echo "=== Configuration Editor ==="

while true; do
  echo "--------------------------"
  echo "1. Edit Configuration File"
  echo "2. Exit"
  echo "--------------------------"

  read -p "Enter your choice (1-2): " choice

  case $choice in
    1)
      read -p "Enter the path of the configuration file to edit: " file_path
      edit_configuration "$file_path"
      ;;
    2)
      echo "Exiting..."
      exit
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac

  read -p "Press enter to continue..."
done
