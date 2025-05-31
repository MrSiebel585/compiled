#!/bin/bash

# Stop Apache
sudo systemctl stop apache2

# Uninstall Apache
sudo apt remove apache2 apache2-utils -y
sudo apt autoremove -y

# Uninstall MySQL
sudo systemctl stop mysql
sudo apt purge mysql-server mysql-client -y
sudo apt autoremove -y
sudo rm -rf /var/lib/mysql
sudo rm -rf /etc/mysql

# Uninstall PHP
sudo apt remove php libapache2-mod-php php-mysql -y
sudo apt autoremove -y

# Remove WordPress files
sudo rm -rf /var/www/html/*

echo "Uninstallation complete."

