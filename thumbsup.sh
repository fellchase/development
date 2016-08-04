#!/bin/bash
read -p "How many times? " amount
let amount=amount-1
for ((i=0; i<=amount; i++))
do
	echo -e "Like n° $i"
	xdotool mousemove 1670 1029 click 1
	sleep 0.8
done
