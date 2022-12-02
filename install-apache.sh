#!/bin/bash
#Purpose: Installation of Apache2.
#OS: Ubuntu
#Version: 14.04
#Note: Test Environment.
#

CHECK_APACHE_STAT=$(systemctl list-units --full -all | grep apache2)

if [[ "$CHECK_APACHE_STAT" == "" ]]; then
	echo "No available package."

	echo "System Update."
	apt-get update

	echo "Installing Apache2."
	sudo apt-get install apache2 -y

	clear

	systemctl start apache2

	systemctl enable apache2

	echo "Apache2 Status."
	systemctl status apache2 | awk 'NR==5{ print $2 }'

else
	STAT=$(systemctl status apache2 | awk 'NR==5{ print $2 }')
	echo "Apache2 status: $STAT"

fi
