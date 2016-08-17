#!/bin/bash
operstate="$(cat /sys/class/net/wlo1/operstate)"
if [ $operstate == down ]
then
	sudo ip link set wlo1 up
	sudo ip link set wlo1 state up
	sudo ip link set lo state up
	echo "Turning on Wi-Fi..."
elif [ $operstate == up ]
then
	echo "Wi-Fi is on."
else
	echo "Please verify the state of '/sys/class/net/wlo1/operstate'."
fi
sudo ifconfig wlo1 &>/dev/null
read -p "What's the hotspot's name? " hotspot
echo "Attempting to connect to $hotspot."
sudo iwconfig wlo1 essid $hotspot
echo "Asking for DHCP..."
sudo killall dhcpcd &>/dev/null
sudo dhcpcd wlo1 &>/dev/null
echo "Done."
