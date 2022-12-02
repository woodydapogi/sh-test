#!/bin/bash
#Purpose: Installation of Apache2 remotely.
#Host: Ubuntu
#Version: 14.04
#Note: For additional security and smooth relay, first create a key exchange between the client host to the server nodes.


#Use case: ./<script> <$1> <$2>

set -e

#Check ip address of the nodes.
if [[ ! -f $1 ]]; then
	echo "$1 file does not exist."
else
	echo "File exist."

	#Read ip address of each nodes.
	for HOST in `cat $1`; do
		echo "Current Hosts on the file:"
		echo "$HOST"

		#Check if remote host responds through icmp.
		echo "#### Checking Connection of $HOST ####"
		PING_HOST=$(ping "$HOST" -c 1 | awk 'NR==5{print $6}')

		#Installation script to the remote host.
		if [[ "$PING_HOST" == "0%" ]]; then
			echo "$HOST - Ok."

			#Copying the installation script.
			scp $1 woody@"$HOST":/tmp

			#Executing the script.
			ssh $2 woody@"$HOST" /tmp/$2
		else
			echo "$HOST - Unreachable."
		fi

	done
fi

exit 0

