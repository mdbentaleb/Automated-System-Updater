# sysOpt.sh - Automated System Updater

![script](https://github.com/mdbentaleb/Automated-System-Updater/assets/132714803/3d37bf4f-168b-447d-871e-a3a457e6b912)


Effortlessly maintain your Linux system with this Bash script that streamlines routine tasks using the `apt` package manager.

## Features

- `Update System` : Keep your repositories up to date.
- `Check Needed Upgrades` : See available upgrades for installed packages.
- `Upgrade System` : Perform system upgrades seamlessly.
- `Autoremove` : Remove unnecessary packages cluttering your system.
- `Autoclean` : Free up space by cleaning the package cache.

## How to Use

1. **Clone the Repository:**

```bash
   git clone https://github.com/mdbentaleb/Automated-System-Updater.git
```

2. **Installation:**

```bash
   cd Automated-System-Updater
```
```bash
   chmod +x install.sh
```
```bash
   ./install.sh
```
📌**Note:** Upon completing the installation requirements, the program will seamlessly initiate and run automatically.

3. **Run the Script:**
```bash
   ./sysOpt.sh
```

4. **Select an Option:**

- Follow the on-screen menu to choose the desired action.

## Adding "sysOpt" to the Local System Path

To make the "sysOpt" script accessible from any directory in your system and to run it as a command,
you can add it to a directory that is included in your system's PATH environment variable:

- create a symbolic link.
```bash
	sudo ln -s ~/Automated-System-Updater/sysOpt.sh" /usr/local/bin/syso
```
- Now you can enjoy the convenience of using the "sysOpt" script as a command ('syso') from anywhere in your system!

![@mdbenaleb_~_Automated-System-Updater](https://github.com/mdbentaleb/Automated-System-Updater/assets/132714803/2a7a8fca-e413-434a-bf92-16d66010f258)


## Note for Users

- The script uses `sudo` to execute certain commands. If prompted for a password, it is expected behavior, and there is no need to be concerned. This is a standard security measure to ensure proper system maintenance.


## Disclaimer

This script is designed for personal use. Review the code before executing on critical systems.


## Author

[mdbentaleb](https://github.com/mdbentaleb)
