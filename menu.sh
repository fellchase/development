#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("Nest another instance" "Option 2" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Nest another instance")
            . menu.sh
            ;;
        "Option 2")
            echo "you chose choice 2"
            ;;
        "Option 3")
            echo "you chose choice 3"
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

