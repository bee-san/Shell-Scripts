ifconfig wlan0 down
iwconfig wlan0 mode monitor
ifconfig wlan0 up
ifconfig wlan0 | grep Mode
