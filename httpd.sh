#!/bin/bash
# Purpose: Installation of httpd service
# Env: CentOS
#

IP_ADDR=$(ip addr show eth0 | grep inet | awk '{print $2}')

echo" IP Address: $IP_ADDR"

httpd_package () {
	yum install update > /dev/null
	
	clear

	#install httpd service.
	echo "### INSTALLING HTTPD SERVICE. ###"
	sudo yum install httpd -y > /dev/null

	#enable httpd service.
	sudo systemctl enable httpd
	
	#start httpd service.
	sudo systemctl start httpd

	#confirm httpd service is running.
	
	ls /var/run/httpd.pid > /dev/null
	
	if [[ $? -eq 0 ]]; then
		echo "HTTPD service is running."
	else
		echo "HTTPD service status: stopped."
		echo "Starting HTTPD service."
		systemctl start httpd
		if [[ $? -eq 0 ]]; then
			clear
			systemctl status httpd
		else
			echo "HTTPD service status: stopped."
		fi
	fi

}

if [[ "${UID}" -ne 0 ]]; then
	echo "not a root user."
	echo "sudo -i ---> to be roo."

else
	httpd_package
fi

