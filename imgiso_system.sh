#!/bin/bash
# Variables
SRC_DIR="/dev/mmcblk0"	#Main system partition 
DEST_DIR="/tmp" 
IMAGE_NAME="backup_image_$(date +%Y%m%d).img" 
LOG_FILE="/home/research/imgiso_sys.log"
# Create a new image of the source directory
dd if="$SRC_DIR" of="$DEST_DIR/$IMAGE_NAME" bs=1M 
conv=sync,noerror status=progress | tee -a 
"$LOG_FILE"
# Sync the image to another location
rsync -avz "$DEST_DIR/$IMAGE_NAME" 
jeremy@192.168.1.82:/media/jeremy/passport | tee -a 
"$LOG_FILE"
