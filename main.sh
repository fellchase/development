#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Script wrapper menu by Condor"
TITLE="Main Menu"
MENU="Choose one of the following options:"

OPTIONS=(1 "Downloads"
         2 "Facebook Bot"
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
            cd Downloads
            . menu.sh
            ;;
        2)
            cd Facebook\ Bot
            . menu.sh
            ;;
        3)
            echo "Over and out!"
            ;;
esac
