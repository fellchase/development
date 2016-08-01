#!/bin/bash


user_input=$(\
  dialog --backtitle "Main Menu/Downloads/4chan Downloader" \
         --title "4chan Downloader" \
         --inputbox "Enter the 4chan thread:" 8 40 \
  3>&1 1>&2 2>&3 3>&- \
)

lynx -listonly -dump $user_input | grep i.4cdn.org | cut -c7- | sed -n '1~2!p' > /tmp/4chan.txt
d=$(date +%y-%m-%d)
(
  lines=$(wc -l /tmp/4chan.txt | awk '{print $1}')
  progress=$(watch -n 0.5 "wc -l /tmp/progress.txt")
  while [ $progress -le $lines ]; do
         pct=$(( $progress * 100 / $lines ))
         echo "XXX"
         echo "Downloading image $progress..."
         echo "XXX"
         echo "$pct"
         sleep 0.1
  done
) | dialog --title "Downloading..." --gauge "Please wait..." 10 60 0
wget -i /tmp/4chan.txt -P $HOME/Afbeeldingen/4chan/$d/
