#!/bin/bash

read -p "URL? " url

for o in {1..1000}
do
	echo -e "Executing outer loop $o."
	midori $url &>/dev/null &
	sleep 20
	## Messaging box on Page to click on.
	xdotool mousemove 517 676 click 1
	setxkbmap be
	for i in {1..25}
	do
		echo -e "Executing inner loop $i."
		xdotool type "Lone boy huh"
		xdotool key KP_Enter
		sleep 3
		xdotool type "You're an idiot for still trying, you know that?"
		xdotool key KP_Enter
		sleep 3
		xdotool type "We found the good ways to take care of idiots like you now."
		xdotool key KP_Enter
		sleep 3
		xdotool type "Don't you like the spam?"
		xdotool key KP_Enter
		sleep 3
	done
	killall midori
done
