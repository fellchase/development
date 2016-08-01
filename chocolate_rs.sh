#!/bin/bash
for i in {1..100}
do
	# What's our loop progress?
	echo -e "Loop number $i"
	# Select Chocolate in bag
	xdotool mousemove 1769 651 click 3
	sleep 1
	# Select powder
	xdotool mousemove 1769 712 click 1
	sleep 1
	# Start grinding
	xdotool key space
	sleep 19
	# Select banker
	xdotool mousemove 964 503 click 1
	sleep 2
	# Drop all dust
	xdotool mousemove 983 848 click 1
	sleep 1.5
	# Select chocolate bar
	xdotool mousemove 653 379 click 3
	sleep 1
	# Take all chocolate
	xdotool mousemove 634 486 click 1
	sleep 1
	# Exit banking menu
	xdotool mousemove 1086 292 click 1
	sleep 4
done
