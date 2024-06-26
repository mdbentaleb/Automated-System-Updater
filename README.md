# sysOpt.sh - Automated System Updater

![script](https://github.com/mdbentaleb/Automated-System-Updater/assets/132714803/95d6a3dc-4a71-40b2-90fc-bc73585b634b)


Effortlessly maintain your Linux system with this Bash script that streamlines routine tasks using the `apt` package manager.

## Features

- `Update System` : Keep your repositories up to date.
- `Check Needed Upgrades` : See available upgrades for installed packages.
- `Upgrade System` : Perform system upgrades seamlessly.
- `Check and Fix Broken Packages` : Detect and repair broken dependencies.
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
	sudo ln -s ~/Automated-System-Updater/sysOpt.sh /usr/local/bin/syso
```


- Now you can enjoy the convenience of using the "sysOpt" script as a command `syso` from anywhere in your system!
- You can choose any command name to run the script, such as `/usr/local/bin/"your command name"`


![command](https://github.com/mdbentaleb/Automated-System-Updater/assets/132714803/d32601b7-69f6-4dab-9c2e-e2d4c67b9a02)


## Note for Users

- The script uses `sudo` to execute certain commands. If prompted for a password, it is expected behavior, and there is no need to be concerned. This is a standard security measure to ensure proper system maintenance.


## Disclaimer

This script is designed for personal use. Review the code before executing on critical systems.


## Author

[mdbentaleb](https://github.com/mdbentaleb)
