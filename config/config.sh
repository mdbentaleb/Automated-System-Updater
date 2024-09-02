#!/bin/bash

readonly GREEN='\033[38;5;84m'
readonly RED='\033[38;5;197m'
readonly BLUE='\033[38;5;45m'
readonly PURPLE='\033[38;5;63m'
readonly PINK='\033[38;5;207m'
readonly ORANGE='\033[38;5;214m'
readonly GREY='\033[38;5;8m'
readonly YELLOW='\033[1;33m'
readonly BG_GREEN='\033[48;5;84m'
readonly BG_RED='\033[48;5;197m'
readonly RESET='\033[0m'

# Function to check if a package is installed
function install_if_missing() {
	if ! dpkg -s "$1" >/dev/null 2>&1; then
		echo -e "${ORANGE}Installing$1...${RESET}"
		sudo apt-get install -y "$1"
	else
		echo -e "${GREY}$1 is already installed.${RESET}"
	fi
}