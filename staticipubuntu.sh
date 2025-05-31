#!/bin/bash

read -p "Set Ubuntu Static Ip:> " set

# Configure static IP
interface="eth0"
static_ip="$set"
gateway="192.168.1.1"
dns1="8.8.8.8"
dns2="8.8.4.4"
subnet_mask="255.255.255.0"

nmcli con modify "$interface" ipv4.addresses "$static_ip/$subnet_mask"
nmcli con modify "$interface" ipv4.gateway "$gateway"
nmcli con modify "$interface" ipv4.dns "$dns1,$dns2"
nmcli con modify "$interface" ipv4.method "manual"
nmcli con up "$interface"

