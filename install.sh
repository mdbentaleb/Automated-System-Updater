#!/bin/bash

sudo apt-get install -y figlet
chmod +x sysOpt.sh
sleep 2
clear
echo -e "\n>>>>>>>> \e[32mdone..!\e[0m"
sleep 1
echo -e "-Command to Start System Updater:  \e[38;5;214m./sysOpt.sh\e[0m\n"
sleep 2
./sysOpt.sh
