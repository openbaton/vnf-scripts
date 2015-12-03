#!/bin/bash

case "$cause" in

("Iperf-server-down") 
	echo "The Iper-server is down, let's try to restart it..."
	screen -d -m -S server iperf -s
	if [ $? -ne 0 ]; then
	    echo "ERROR: the iperf-server is not started"
	    exit 1
    	fi
	echo "The Iper-server is running again!"
	;;
*) echo "The cause $cause is unknown"
	exit 2
	;;
esac
