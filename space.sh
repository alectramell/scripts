#!/bin/bash

clear

USERNAME=$(whoami)
WHEREAMI=$(pwd)

clear

time=$(date -R)

clear

trilog() {

	echo "     " >> /home/$USERNAME/Desktop/mem.log
	echo "     " >> /home/$USERNAME/Desktop/mem.log
	echo "$USERNAME ran trilog system memory test at $time.." >> /home/$USERNAME/Desktop/mem.log
	echo "     " >> /home/$USERNAME/Desktop/mem.log
	free -h -c "1" >> /home/$USERNAME/Desktop/mem.log
}

clear

if [ $(ls /home/$USERNAME/Desktop/mem.log) = "/home/$USERNAME/Desktop/mem.log" ]
then
	echo "TRILOG=true"
	sleep 1.0
	trilog
	clear
	grep -C1 "$USERNAME ran trilog system memory test at $time.." /home/$USERNAME/Desktop/mem.log
	echo "..Press [KEY] to view log.."
	read -s -n1
	gedit /home/$USERNAME/Desktop/mem.log
	clear
else
	echo "TRILOG=false"
	sleep 1.0
	touch /home/$USERNAME/Desktop/mem.log
	trilog
	clear
	grep -C1 "$USERNAME ran trilog system memory test at $time.." /home/$USERNAME/Desktop/mem.log
	echo "..Press [KEY] to view log.."
	read -s -n1
	gedit /home/$USERNAME/Desktop/mem.log
	clear
fi

clear
