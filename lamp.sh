#!/bin/bash
# Purpose: Sample Installation of LAMP stack packages.
# Env: CentOS
#

clear

echo "####"
date
echo "####"

PKG=("httpd" "mariadb-server" "php" "php-mysql")

packages () {
	
	sudo yum install update -y > /dev/null

	sleep 1

	echo

	# package installation.
	for package in "${PKG[@]}"; do
		yum install "$package" -y > /dev/null		
	done

	echo "### Installation done. ###"

	clear

	# check status for the packages
	for svc in "httpd" "mariadb"; do
		echo "### $svc ####"
		systemctl status $svc
		sleep 1
		clear
	done

	echo "### PHP VERSION ####"
	php --version	
}

packages

