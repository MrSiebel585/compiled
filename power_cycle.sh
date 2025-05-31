#!/bin/bash
while true; 
do uptime=$(cut -d' ' -f1 < 
  /proc/uptime) days=${uptime%.*} if [[ "$days" -ge 
  5 ]]; 
#then
    sudo reboot break 
    sleep 1800 # wait for half hour
done
