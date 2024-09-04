#!/bin/bash

CONFIG_URL="https://raw.githubusercontent.com/mdbentaleb/Automated-System-Updater/main/config/config.sh"
curl -fsSL "$CONFIG_URL" -o /tmp/config.sh
source /tmp/config.sh

cd "$HOME" || {
    echo -e "${RED}Failed to change directory to HOME${RESET}"
    exit 1
}

if [ -d "$HOME/syso_temp" ]; then
    rm -rf "$HOME/syso_temp"
fi
mkdir "$HOME/syso_temp"

if [ ! -d "$HOME/syso_temp" ]; then
    echo -e "${RED}Error creating a temporary folder.${RESET}"
    exit 1
fi

cd "$HOME/syso_temp" || exit

# Clone the repository
git clone https://github.com/mdbentaleb/Automated-System-Updater.git >/dev/null 2>&1

if [ ! -d "Automated-System-Updater" ]; then
    echo -e "${RED}Error: Failed to clone the repository.${RESET}"
    cd "$HOME" || exit
    rm -rf "$HOME/syso_temp"
    exit 1
fi

# Install necessary packages
echo -e "\n${PINK}Checking for required packages...${RESET}"

function install_if_missing() {
    if ! dpkg -s "$1" >/dev/null 2>&1; then
        echo -e "│"
        echo -e "└──── ${ORANGE}Installing $1...${RESET}"
        sudo apt-get install -y "$1"
    else
        echo -e "└──── ${GREY}$1 is already installed.${RESET}"
    fi
}
sleep 4
install_if_missing "ncurses-bin"

if ! dpkg -s "ncurses-bin" >/dev/null 2>&1; then
    echo -e "${RED}Error: Failed to install ncurses-bin.${RESET}"
    exit 1
fi

if [ -d "$HOME/Automated-System-Updater" ]; then
    rm -rf "$HOME/Automated-System-Updater"
fi

cp -r Automated-System-Updater "$HOME"

if [ ! -d "$HOME/Automated-System-Updater" ]; then
    echo -e "${RED}Error: Failed to copy the directory.${RESET}"
    cd "$HOME" || exit
    rm -rf "$HOME/syso_temp"
    exit 1
fi

cd "$HOME" || exit
rm -rf "$HOME/syso_temp"

cd "$HOME/Automated-System-Updater" || exit

INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="syso"
SCRIPT_DIR=$(dirname "$(realpath "$0")")
SOURCE_SCRIPT="$SCRIPT_DIR/sysOpt.sh"

if [ ! -f "$SOURCE_SCRIPT" ]; then
    echo -e "${RED}Error: $SOURCE_SCRIPT not found. Make sure it is in the same directory as this install script.${RESET}"
    exit 1
fi

sudo ln -sf "$SOURCE_SCRIPT" "$INSTALL_DIR/$SCRIPT_NAME"

sudo chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

echo -e "${GREEN}Installation successful.${RESET}"
sleep 1
echo -e "└──── You can now run the script using the command: ${ORANGE}$SCRIPT_NAME${RESET}"
echo
