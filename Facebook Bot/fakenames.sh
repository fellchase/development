#!/bin/bash

read -p "Do you want to connect to Tor first? " query
if test "$query" = "yes"
then
	echo "OK, Connecting to Tor."
	ssh -D1080 -NTCf -p 443 wasrek.duckdns.org
	sudo screen -dmS Tor tor
elif test "$query" = "no"
then
	echo "OK, Never mind."
else
	echo "Please answer yes or no. Assuming no."
fi
for i in {1..1000}
do
	lynx -dump fakenamegenerator.com > /tmp/fakename
	sed '32!d' /tmp/fakename | sed -e 's/^[ \t]*//' >> ~/Documents/fakenames
	sed '61!d' /tmp/fakename | sed -e 's/^[ \t]*//' >> ~/Documents/fakenames
	sed '26!d' /tmp/fakename | sed -e 's/^[ \t]*//' >> ~/Documents/fakenames
done
