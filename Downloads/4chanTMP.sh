#!/bin/bash
# yesnobox.sh - An inputbox demon shell script
OUTPUT="/tmp/input.txt"

# create empty file
>$OUTPUT

# Purpose - say hello to user 
#  $1 -> name (set default to 'anonymous person')
function fetchimages(){
	#display it
	lynx -listonly -dump $url | grep i.4cdn.org | cut -c7- | sed -n '1~2!p' > /tmp/4chan.txt
	lines=$(wc -l /tmp/4chan.txt)
	dialog --title "Downloading..." --clear --msgbox "Found $lines images... Downloading." 10 41
	wget -i /tmp/4chan.txt -P $HOME/Afbeeldingen/4chan/$d/
	dialog --title "Downloading..." --clear --msgbox "Downloads finished!" 10 41
}

# cleanup  - add a trap that will remove $OUTPUT
# if any of the signals - SIGHUP SIGINT SIGTERM it received.
trap "rm $OUTPUT; exit" SIGHUP SIGINT SIGTERM

# show an inputbox
dialog --title "4chan Downloader" \
--backtitle "Main Menu/Downloads/4chan Downloader" \
--inputbox "Enter the 4chan thread " 8 60 2>$OUTPUT

# get respose
respose=$?

# get data stored in $OUPUT using input redirection
url=$(<$OUTPUT)

# make a decsion 
case $respose in
  0) 
  	fetchimages
  	;;
  1) 
  	echo "Cancel pressed." 
  	;;
  255) 
   echo "[ESC] key pressed."
esac

# remove $OUTPUT file
rm $OUTPUT
