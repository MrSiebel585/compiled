#!/bin/bash

# Check if SSH_AGENT_PID is set
if [ -z "$SSH_AGENT_PID" ]; then
    echo "SSH agent not running. Please start the SSH agent first."
    exit 1
fi

# Check if SSH_AUTH_SOCK is set
if [ -z "$SSH_AUTH_SOCK" ]; then
    echo "SSH agent socket not found. Please make sure SSH agent is running."
    exit 1
fi

# Set the DISPLAY variable based on the SSH client's settings
DISPLAY=$(echo $SSH_CLIENT | awk '{ print $1 ":0" }')
export DISPLAY

# Enable X11 forwarding
ssh -X user@remote_host
