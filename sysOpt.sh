#!/bin/bash

clear
title="mdbentaleb :"
terminal_width=$(tput cols)
banner_width=$(figlet -t -f standard "$title" | head -n 1 | wc -c)
padding=$(( (terminal_width - banner_width) / 2 ))
figlet -t -f standard "$title" | sed "s/^/$(printf '%*s' $padding)/"
echo -e "\n\n"
echo -e "\t\e[32m1\e[0m- Update System"
echo -e "\t\e[32m2\e[0m- Check needed Upgrades"
echo -e "\t\e[32m3\e[0m- Upgrade System"
echo -e "\t\e[32m4\e[0m- Autoremove"
echo -e "\t\e[32m5\e[0m- Autoclean"
echo -e "\t\e[31m0\e[0m- \e[31mExit\e[0m"

while true; do

    echo && read -p $'\e[32m    Select an option\e[0m: ' option
    
    if [[ $option == '1' ]]; then
        echo -e "\n    \e[38;5;214mwait...!\e[0m"
        sleep 2
        sudo apt update -y
    elif [[ $option -eq '2' ]]; then
        echo -e "\n    \e[38;5;214mwait...!\e[0m"
        sleep 2
        sudo apt list --upgradable
    elif [[ $option == '3' ]]; then
        echo -e "\n    \e[38;5;214mwait...!\e[0m"
        sleep 2
        sudo apt upgrade -y
    elif [[ $option == '4' ]]; then
        echo -e "\n    \e[38;5;214mwait...!\e[0m"
        sleep 2
        sudo apt autoremove
    elif [[ $option == '5' ]]; then
        echo -e "\n    \e[38;5;214mwait...!\e[0m"
        sleep 2
        sudo apt autoclean
    elif [[ $option == '0' ]]; then
        echo -e "\n\e[31m>>>>>>>>>> Exit\e[0m"
	sleep 1
	clear
	exit
    else
        echo -e "\n\e[31m Wrong Option..!\e[0m"
    fi
done
