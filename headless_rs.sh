#!/bin/bash
for i in {1..67}
do
        echo -e "Loop number $i"
	xdotool mousemove 1769 655 click 1
	sleep 1
	xdotool key space
	sleep 12
done
