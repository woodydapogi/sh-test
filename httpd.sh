#!/bin/bash
# Purpose: Installation of httpd service
# Env: CentOS
#

IP_ADDR=$(ip addr show eth0 | grep inet | awk '{print $2}')

echo" IP Address: $IP_ADDR"

httpd_package () {
	yum install update > /dev/null
}

if [[ "${UID}" -ne 0 ]]; then
	echo "not a root user."
	echo "sudo -i ---> to be roo."

else
	httpd_package
fi

