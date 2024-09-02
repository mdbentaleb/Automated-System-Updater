#!/bin/bash

source "./config/config.sh"

function tpwrt() {
	local txt="$1"
	local dly="$2"
	for ((i = 0; i < ${#txt}; i++)); do
		echo -ne "${txt:$i:1}"
		sleep "$dly"
	done
	echo
}
function menu() {
	clear
	title="sysOpt :"
	ttl1="                            ___        _                   "
	ttl2="___ _   _ ___ / _ \ _ __ | |_   _"
	ttl3="/ __| | | / __| | | | '_ \| __| (_)"
	ttl4="\__ \ |_| \__ \ |_| | |_) | |_   _ "
	ttl5="|___/\__, |___/\___/| .__/ \__| (_)"
	ttl6="|___/          |_|       "
	terminal_width=$(tput cols)
	center_text() {
		local text="$1"
		local text_length=${#text}
		local padding=$(((terminal_width - text_length) / 2))
		printf "%*s" $padding ""
		tpwrt "$text" "0.004"
	}
	center_text "$ttl1"
	center_text "$ttl2"
	center_text "$ttl3"
	center_text "$ttl4"
	center_text "$ttl5"
	center_text "$ttl6"

	echo -e "\n\n"
	echo -e "\t${GREEN}1${RESET} Update System"
	echo -e "\t${GREEN}2${RESET} Check needed Upgrades"
	echo -e "\t${GREEN}3${RESET} Upgrade System"
	echo -e "\t${GREEN}4${RESET} Check and fix broken packages${RESET}"
	echo -e "\t${GREEN}5${RESET} Autoremove"
	echo -e "\t${GREEN}6${RESET} Autoclean"
	echo -e "\t${ORANGE}7 Clear screen${RESET}"
	echo -e "\t${RED}0 Exit${RESET}"
}
function check_and_fix_broken_packages() {
	echo -e "\n    ${ORANGE}Checking for broken packages...!${RESET}"
	if sudo apt update && sudo apt --fix-broken install -y; then
		echo -e "    ${ORANGE}Done fixing broken packages.${RESET}"
	else
		echo -e "\n    ${RED}Failed to fix broken packages.${RESET}"
	fi
	sleep 1
}
menu
while true; do
	echo && read -p $'\e[32m    Select an option\e[0m: ' option
	if [[ $option == '1' ]]; then
		echo -e "\n    ${ORANGE}Checking for updates...!${RESET}"
		sleep 1
		if sudo apt update -y; then
			echo -e "    ${ORANGE}Updating system successfully.${RESET}"
		else
			echo -e "\n    ${RED}Failed to update system.${RESET}"
		fi
		sleep 1
	elif [[ $option -eq '2' ]]; then
		echo -e "\n    ${ORANGE}Checking needed upgrades...!${RESET}"
		sleep 1
		if sudo apt list --upgradable; then
			echo -e "    ${ORANGE}Done checking needed upgrades.${RESET}"
		else
			echo -e "\n    ${RED}Failed to check needed upgrades.${RESET}"
		fi
		sleep 1
	elif [[ $option == '3' ]]; then
		echo -e "\n    ${ORANGE}Upgrading system...!${RESET}"
		sleep 1
		if sudo apt upgrade -y; then
			echo -e "    ${ORANGE}System upgrade completed successfully.${RESET}"
		else
			echo -e "\n    ${RED}Failed to upgrade system.${RESET}"
		fi
		sleep 1
	elif [[ $option == '4' ]]; then
		check_and_fix_broken_packages
	elif [[ $option == '5' ]]; then
		echo -e "\n    ${ORANGE}Removing unused packages...!${RESET}"
		sleep 1
		if sudo apt autoremove -y; then
			echo -e "    ${ORANGE}Unused packages removed successfully.${RESET}"
		else
			echo -e "\n    ${RED}Failed to remove unused packages.${RESET}"
		fi
		sleep 1
	elif [[ $option == '6' ]]; then
		echo -e "\n    ${ORANGE}Cleaning package cache...!${RESET}"
		sleep 1
		if sudo apt autoclean; then
			echo -e "    ${ORANGE}Package cache cleaned successfully.${RESET}"
		else
			echo -e "\n    ${RED}Failed to clean package cache.${RESET}"
		fi
		sleep 1
	elif [[ $option == '7' ]]; then
		echo -e "\n    ${ORANGE}clear...!${RESET}"
		sleep 1
		unset option
		menu
	elif [[ $option == '0' ]]; then
		echo "    │"
		echo -e "    └── \e[31mExit.${RESET}"
		sleep 1
		clear
		exit
	else
		echo -e "\n\e[31m Wrong Option..!${RESET}"
	fi
done
