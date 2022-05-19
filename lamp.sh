#!/bin/bash
# Purpose: Install LAMP STACK
#

if [[ "${UID}" -ne 0 ]]; then
	echo "user need to be root."
	echo "sudo -i | su -"
else
	echo "root user"
fi

main() {
	echo "Ok."
}

main

