#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Script wrapper menu by Condor"
TITLE="Main Menu/Downloads"
MENU="Choose one of the following options:"

OPTIONS=(1 ".."
         2 "4chan Downloader"
         3 "Quit")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            cd ..
            . main.sh
            ;;
        2)
            . 4chanDownloader.sh
            ;;
        3)
            cd ..
            echo "Over and out!"
            ;;
esac
