#!/bin/bash

while true; do
    clear
    echo "==== Bettercap Menu ===="
    echo "1. Transparent HTTP(S) Proxy"
    echo "2. DNS Spoofing"
    echo "3. ARP Spoofing"
    echo "4. DNS/ARP Spoofing"
    echo "5. Password Sniffing"
    echo "6. Proxy JS Injection (XSS)"
    echo "7. Terminate Target Connectivity - Ban (LAN)"
    echo "8. MAC Changer"
    echo "9. WiFi Network Monitoring (Playground)"
    echo "10. BLE (Bluetooth Low Energy device discovery)"
    echo "11. Quit"

    read -p "Enter your choice (1-11): " choice

    case $choice in
        1)
            sudo bettercap -X
            ;;
        2)
            sudo bettercap --proxy-module dns_spoof
            ;;
        3)
            sudo bettercap --proxy-module arp_spoof
            ;;
        4)
            sudo bettercap --proxy-module dns_spoof,arp_spoof
            ;;
        5)
            sudo bettercap --sniffer
            ;;
        6)
            sudo bettercap --proxy-module injectjs
            ;;
        7)
            sudo bettercap --proxy-module ban
            ;;
        8)
            sudo bettercap --netiface wlan0 -eval "set wifi.monitor true; wifi.recon on"
            ;;
        9)
            sudo bettercap -iface wlan0 -eval "set bluetooth.showall true; ble.recon on"
            ;;
        10)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            read -p "Press Enter to continue..."
            ;;
    esac
done
