#!/bin/bash
# Purpose: Install LAMP STACK
#

if [[ "${UID}" -ne 0 ]]; then
	echo "root user"
else
	echo "you need to be root"
fi
