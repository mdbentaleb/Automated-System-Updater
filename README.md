# sysOpt.sh - Automated System Updater

![script](https://github.com/mdbentaleb/Automated-System-Updater/assets/132714803/95d6a3dc-4a71-40b2-90fc-bc73585b634b)


Effortlessly maintain your **Debian-based Linux system** *(e.g., Ubuntu, Debian)* with this Bash script that streamlines routine tasks using the `apt` package manager.

## Features

- `Update System` : Keep your repositories up to date.
- `Check Needed Upgrades` : See available upgrades for installed packages.
- `Upgrade System` : Perform system upgrades seamlessly.
- `Check and Fix Broken Packages` : Detect and repair broken dependencies.
- `Autoremove` : Remove unnecessary packages cluttering your system.
- `Autoclean` : Free up space by cleaning the package cache.

## Installation
### Installation

To install `sysOpt`, run the following command:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mdbentaleb/Automated-System-Updater/main/install.sh)"
```
After installation, start using sysOpt by running:
```bash
   syso
```
https://github.com/user-attachments/assets/b08215da-bb74-4649-af90-b90097e18dc1


## Keeping the Tool Updated

To ensure you have the latest features and improvements, regularly update your local repository by running the following command:

```bash
   cd "$HOME/Automated-System-Updater"
```
```bash
git pull
```


## Note for Users

- The script uses `sudo` to execute certain commands. If prompted for a password, it is expected behavior, and there is no need to be concerned. This is a standard security measure to ensure proper system maintenance.


## Disclaimer

This script is designed for personal use. Review the code before executing on critical systems.


## Author

[mdbentaleb](https://github.com/mdbentaleb)
