#!/bin/bash
# Purpose: Install LAMP STACK
#

#parse ip address and print on the screen.
IP_ADDR=$(ip addr show eth0 | grep inet | awk '{print $2}')

echo "IP Address: $IP_ADDR"


install_package () {
	echo "Package Function"
}

#check if user is a root user.
if [[ "${UID}" -ne 0 ]]; then
	echo "user need to be root."
	echo "sudo -i | su -"
	break
else
	echo "root user"
	install_package
fi

exit 0
