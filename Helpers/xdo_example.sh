#!/bin/sh

# This is only necessary when your keyboard layout is not QWERTY.
setxkbmap be

# Move mouse to specified location
xdotool mousemove 939 280
xdotool click 1

# Start VIM
xdotool type "vim"
xdotool key Return
# Wait a sec
sleep 1
xdotool type "i"
# Wait another sec
sleep 1

# Start for loop.
for num in {1..50}
do
	xdotool type "Tweet no. $num."
	xdotool key Return
done

# Set VIM back to Normal Mode
xdotool key Escape
