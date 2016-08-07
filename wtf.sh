#!/bin/bash
xdotool mousemove 844 927 click 1
for i in {1..100}
do
	setxkbmap be
	xdotool type "WTF??"
	xdotool key KP_Enter
	sleep 2
done
