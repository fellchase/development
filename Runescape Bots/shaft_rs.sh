#!/bin/bash
for i in {1..100}
do
	# What's our loop progress?
	echo -e "Loop number $i"
	# Prepare for loop
	sleep 4
	# Select Log in bag
	xdotool mousemove 1769 654 click 1
	sleep 1
	# Make sure we make arrow shafts!
	xdotool mousemove 741 489 click 1
	sleep 1
	# Start fletching
	xdotool key space
	sleep 52
	# Select banker
	xdotool mousemove 962 546 click 1
	sleep 2
	# Drop all shafts
	xdotool mousemove 981 847 click 1
	sleep 1.5
	# Select logs
	xdotool mousemove 665 380 click 3
	sleep 1
	# Take all logs
	xdotool mousemove 646 487 click 1
	sleep 1
	# Exit banking menu
	xdotool mousemove 1087 293 click 1
done
