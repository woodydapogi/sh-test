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
	clear
	sudo systemctl status httpd

}

if [[ "${UID}" -ne 0 ]]; then
	echo "not a root user."
	echo "sudo -i ---> to be roo."

else
	httpd_package
fi

