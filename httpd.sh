#!/bin/bash
# Purpose: Install LAMP STACK
# Env: CentOS

#parse ip address and print on the screen.
IP_ADDR=$(ip addr show eth0 | grep inet | awk '{print $2}')

echo "IP Address: $IP_ADDR"


install_package () {
	yum install update > update.txt

	#testing logic kkk.
	if cat update.txt | grep "No package" > /dev/null; then
		echo "Updated."
	fi

	#httpd/apache installation.
	echo "### Installing HTTPD ###"
	sudo yum install httpd -y > /dev/null
	echo "httpd service installed."
	
	#enable httpd during restart.
	sudo systemctl enable httpd

	#start httpd.
	sudo systemctl start httpd
	
	#check status of httpd service.
	sudo systemctl status httpd 

	echo

	curl -X GET localhost > index.html
}


#check if user is a root user.
if [[ "${UID}" -ne 0 ]]; then
	echo "user need to be root."
	echo "sudo -i | su -"
	break
else
	echo "root user"
	echo
	install_package
fi

exit 0
