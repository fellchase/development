#!/bin/bash

## Please take note of the "yes j" command and replace it with pacman's "confirm installation" character. yes defaults to "y".
## Also modify the mirror to the one you added in /etc/pacman.conf.
## Here "https://blackarch.pr0s3c.nl/blackarch/blackarch/os/$arch" has been used.
## Backslash "/", "$", "[", and "]". Refrain from doing so with the slashes of the regular expression.
##
## /etc/pacman.conf should contain
## #[blackarch]
## #SigLevel = Never
## #Server = https://blackarch.pr0s3c.nl/blackarch/blackarch/os/$arch

echo Backing up pacman config...
sudo cp /etc/pacman.conf /etc/pacman.conf.bak
sed -i "s/sudo cp/#sudo cp/" blackarch.sh
sed -i "s/echo Backing up pacman config.../#echo Backing up pacman config.../" blackarch.sh
sudo chmod 000 /etc/pacman.conf.bak
read -p "What package? " pkg
echo "Updating system..."
yes j | sudo pacman -Syyu &>/dev/null
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
