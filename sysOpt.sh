#!/bin/bash

function menu() {
	clear
	title="sysOpt :"
	terminal_width=$(tput cols)
	banner_width=$(figlet -t -f standard "$title" | head -n 1 | wc -c)
	padding=$(( (terminal_width - banner_width) / 2 ))
	figlet -t -f standard "$title" | sed "s/^/$(printf '%*s' $padding)/"
	copyright=$(( (terminal_width - 28) / 2 ))
	echo -e "$(printf '%*s' $copyright)" "\e[32mProgrammed by mdbentaleb\e[0m"
	echo -e "\n\n"
	echo -e "\t\e[32m1\e[0m- Update System"
	echo -e "\t\e[32m2\e[0m- Check needed Upgrades"
	echo -e "\t\e[32m3\e[0m- Upgrade System"
	echo -e "\t\e[32m4\e[0m- Check and fix broken packages\e[0m"
	echo -e "\t\e[32m5\e[0m- Autoremove"
	echo -e "\t\e[32m6\e[0m- Autoclean"
	echo -e "\t\e[38;5;214m7\e[0m- \e[38;5;214mClear screen\e[0m"
	echo -e "\t\e[31m0\e[0m- \e[31mExit\e[0m"
}

function check_and_fix_broken_packages() {
	echo -e "\n    \e[38;5;214mChecking for broken packages...!\e[0m"
	if sudo apt update && sudo apt --fix-broken install -y; then
		echo -e "\n    \e[38;5;214mDone fixing broken packages.\e[0m"
	else
		echo -e "\n    \e[38;5;196mFailed to fix broken packages.\e[0m"
	fi
	sleep 2
}

menu

while true; do
	echo && read -p $'\e[32m    Select an option\e[0m: ' option

	if [[ $option == '1' ]]; then
		echo -e "\n    \e[38;5;214mChecking for updates...!\e[0m"
		sleep 1
		if sudo apt update -y; then
			echo -e "\n    \e[38;5;214mUpdating system successfully.\e[0m"
		else
			echo -e "\n    \e[38;5;196mFailed to update system.\e[0m"
		fi
		sleep 2

	elif [[ $option -eq '2' ]]; then
		echo -e "\n    \e[38;5;214mChecking needed upgrades...!\e[0m"
		sleep 1
		if sudo apt list --upgradable; then
			echo -e "\n    \e[38;5;214mDone checking needed upgrades.\e[0m"
		else
			echo -e "\n    \e[38;5;196mFailed to check needed upgrades.\e[0m"
		fi
		sleep 2

	elif [[ $option == '3' ]]; then
		echo -e "\n    \e[38;5;214mUpgrading system...!\e[0m"
		sleep 1
		if sudo apt upgrade -y; then
			echo -e "\n    \e[38;5;214mSystem upgrade completed successfully.\e[0m"
		else
			echo -e "\n    \e[38;5;196mFailed to upgrade system.\e[0m"
		fi
		sleep 2

	elif [[ $option == '4' ]]; then
                check_and_fix_broken_packages

	elif [[ $option == '5' ]]; then
		echo -e "\n    \e[38;5;214mRemoving unused packages...!\e[0m"
		sleep 1
		if sudo apt autoremove -y; then
			echo -e "\n    \e[38;5;214mUnused packages removed successfully.\e[0m"
		else
			echo -e "\n    \e[38;5;196mFailed to remove unused packages.\e[0m"
		fi
		sleep 2

	elif [[ $option == '6' ]]; then
		echo -e "\n    \e[38;5;214mCleaning package cache...!\e[0m"
		sleep 1
		if sudo apt autoclean; then
			echo -e "\n    \e[38;5;214mPackage cache cleaned successfully.\e[0m"
		else
			echo -e "\n    \e[38;5;196mFailed to clean package cache.\e[0m"
		fi
		sleep 2

	elif [[ $option == '7' ]]; then
		echo -e "\n    \e[38;5;214mclear...!\e[0m"
		sleep 1
		unset option
		menu

	elif [[ $option == '0' ]]; then
		echo -e "\n\e[31m>>>>>>>>>> Exit\e[0m"
		sleep 1
		clear
		exit

	else
		echo -e "\n\e[31m Wrong Option..!\e[0m"
	fi
done
