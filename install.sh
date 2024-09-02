#!/bin/bash

source "./config/config.sh"

cd "$HOME" || { echo -e "${RED}Failed to change directory to HOME${RESET}"; exit 1; }

# Create a temporary directory
mkdir syso_temp
cd syso_temp || exit

# Check if the directory was created successfully
if [ ! -d "syso_temp" ]; then
	echo -e "${RED}Error creating a temporary folder.${RESET}"
	exit 1
fi

#clone script repo
git clone https://github.com/mdbentaleb/Automated-System-Updater.git

# Check if the repository was cloned successfully
if [ ! -d "Automated-System-Updater" ]; then
	echo -e "${RED}Error: Failed to clone the repository.${RESET}"
	cd "$HOME" || exit
	rm -rf syso_temp/
	exit 1
fi

# Install necessary packages
echo -e "${PINK}Checking for required packages...${RESET}"
install_if_missing "figlet"
install_if_missing "ncurses-utils"
install_if_missing "sudo"

# Check if the required packages were installed successfully
if ! dpkg -s "figlet" >/dev/null 2>&1 || ! dpkg -s "ncurses-utils" >/dev/null 2>&1 || ! dpkg -s "sudo" >/dev/null 2>&1; then
	echo -e "${RED}Error: Failed to install required packages.${RESET}"
fi

#check if Automated-System-Updater directory exists
if [ -d "$HOME/Automated-System-Updater" ]; then
	rm -rf "$HOME/Automated-System-Updater"
fi

# Copy Automated-System-Updater to $HOME directory
cp -r Automated-System-Updater "$HOME"

# Check if the directory was copied successfully
if [ ! -d "$HOME/Automated-System-Updater" ]; then
	echo -e "${RED}Error: Failed to copy the directory.${RESET}"
	cd "$HOME" || exit
	rm -rf syso_temp/
	exit 1
fi

# Remove the temporary directory
cd "$HOME" || exit
rm -rf syso_temp/

cd "$HOME"/Automated-System-Updater || exit

# Define the installation directory and the name of the command
INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="syso"

# Get the directory of the current script (install.sh)
SCRIPT_DIR=$(dirname "$(realpath "$0")")

# Define the path to the source script
SOURCE_SCRIPT="$SCRIPT_DIR/sysOpt.sh"

# Check if the source script exists
if [ ! -f "$SOURCE_SCRIPT" ]; then
    echo -e "${RED}Error: $SOURCE_SCRIPT not found. Make sure it is in the same directory as this install script.${RESET}"
    exit 1
fi

# Copy the script to the installation directory
sudo cp "$SOURCE_SCRIPT" "$INSTALL_DIR/$SCRIPT_NAME"

# Make the script executable
sudo chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Notify the user of successful installation
echo -e "${GREEN}Installation successful.\nYou can now run the script using the command: $SCRIPT_NAME${RESET}"
