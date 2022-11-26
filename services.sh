#!/bin/bash
#

set -e

CHK_STAT=$(systemctl list-units --full -all |  grep $1 | awk '{print $3}')

case "$CHK_STAT" in
	active)
		echo "The $1 service is active.";;

	inactive)
		echo "The $1 service is inactive."
		echo "####################"
		echo

		echo "Activate $1 service?"
		read ACTIVATE_SERVICE

		if [[ "$ACTIVATE_SERVICE" == 'yes' ]]; then
			echo "Activating $1 service..."
			sudo systemctl start "$1"
			echo "$1 service:"
			systemctl status "$1" | awk 'NR==5{ print $2 }'
		else
			echo "$1 Not Yet Activated."
		fi

		;;

	*)
		echo "The $1 service is unavailable.";;
esac

exit 0
