#!/bin/bash

# Install auditd package (Ubuntu)
sudo apt-get install auditd

# Configure auditd
sudo cp /etc/audit/auditd.conf /etc/audit/auditd.conf.backup   # Backup the original config file
sudo sed -i 's/^log_file.*/log_file = \/var\/log\/audit\/audit.log/' /etc/audit/auditd.conf   # Set log file location
sudo sed -i 's/^max_log_file.*/max_log_file = 50/' /etc/audit/auditd.conf   # Set maximum log file size to 50MB
sudo systemctl restart auditd   # Restart auditd service

# Create an audit rule file
sudo echo "-w /etc/passwd -p wa -k password_file" | sudo tee /etc/audit/rules.d/password.rules > /dev/null

# Restart auditd to apply the new rules
sudo systemctl restart auditd

# View audit logs
sudo ausearch -f /etc/passwd   # Search for events related to /etc/passwd file
sudo ausearch -ts today       # Search for events occurred today

# Generate an audit report
sudo aureport   # Generate a summary report of audited events

# Stop auditd service
sudo systemctl stop auditd
