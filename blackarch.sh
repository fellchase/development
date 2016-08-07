#!/bin/bash

## Please take note of the "yes j" command and replace it with pacman's "confirm installation" character. yes defaults to "y".
## Also modify the mirror to the one you added in /etc/pacman.conf.
## Here "https://blackarch.pr0s3c.nl/blackarch/blackarch/os/$arch" has been used.
## Backslash "/", "$", "[", and "]". Refrain from doing so with the slashes of the regular expression.

read -p "What package? " pkg	## Reads package into variable
echo "Updating system..."
sudo pacman -Syyu &>/dev/null
sudo sed -i "s/\#\[blackarch\]/\[blackarch\]/" /etc/pacman.conf
sudo sed -i "s/#SigLevel = Never/SigLevel = Never/" /etc/pacman.conf
sudo sed -i "s/#Server = https:\/\/blackarch.pr0s3c.nl\/blackarch\/blackarch\/os\/\$arch/Server = https:\/\/blackarch.pr0s3c.nl\/blackarch\/blackarch\/os\/\$arch/" /etc/pacman.conf
echo "Temporarily activating BlackArch repository..."
sudo pacman -Sy &>/dev/null
echo "Installing $pkg..."
yes j | sudo pacman -S $pkg &>/dev/null
echo "Deactivating BlackArch repository..."
sudo sed -i "s/\[blackarch\]/\#\[blackarch\]/" /etc/pacman.conf
sudo sed -i "s/SigLevel = Never/#SigLevel = Never/" /etc/pacman.conf
sudo sed -i "s/Server = https:\/\/blackarch.pr0s3c.nl\/blackarch\/blackarch\/os\/\$arch/#Server = https:\/\/blackarch.pr0s3c.nl\/blackarch\/blackarch\/os\/\$arch/" /etc/pacman.conf
echo "Done."
