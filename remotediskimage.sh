#!/bin/bash

# Function to display script usage
function display_usage {
    echo "Usage: $0 <source_disk> <destination_host> <destination_path>"
    echo "Example: $0 /dev/sdX remote-server /path/to/destination/image.img"
}

# Check if the required arguments are provided
if [[ $# -ne 3 ]]; then
    display_usage
    exit 1
fi

# Read the source disk, destination host, and path from the command-line arguments
source_disk="$1"
destination_host="$2"
destination_path="$3"

# Function to create the disk image on the remote host
function create_remote_image {
    local source_disk="$1"
    local destination_host="$2"
    local destination_path="$3"

    # Create the disk image on the remote host using SSH
    ssh "$destination_host" "sudo dd if=$source_disk bs=4M | gzip -c" > "$destination_path"

    # Check the exit status of the SSH command
    if [[ $? -eq 0 ]]; then
        echo "Disk image created successfully at $destination_host:$destination_path"
    else
        echo "Failed to create the disk image on $destination_host"
        exit 1
    fi
}

# Call the function to create the remote disk image
create_remote_image "$source_disk" "$destination_host" "$destination_path"

