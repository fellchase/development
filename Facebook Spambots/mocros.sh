#!/bin/bash
for i in {1..100}
do
	setxkbmap be
	xdotool mousemove 1513 998 click 1
	xdotool type "Afspreken? Op 127.0.0.1 ;)"
	xdotool key KP_Enter
	sleep 2
done
