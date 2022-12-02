#!/bin/bash
#

SERVERS=$(cat $1)

for nodes in "$SERVERS"; do
	echo "$nodes"
	ssh woody@$nodes uptime
done
