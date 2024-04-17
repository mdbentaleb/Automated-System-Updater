# sysOpt.sh - Automated System Updater

![script-img](https://github.com/mdbentaleb/Automated-System-Updater/assets/132714803/b32dc79f-d0c9-46a7-92c6-30aeaf018491)


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
📌 **Note:** Upon completing the installation requirements, the program will seamlessly initiate and run automatically.

3. **Run the Script:**
```bash
   ./sysOpt.sh
```

4. **Select an Option:**

- Follow the on-screen menu to choose the desired action.

## Note for Users

- The script uses `sudo` to execute certain commands. If prompted for a password, it is expected behavior, and there is no need to be concerned. This is a standard security measure to ensure proper system maintenance.


## Disclaimer

This script is designed for personal use. Review the code before executing on critical systems.


## Author

[mdbentaleb](https://github.com/mdbentaleb)
