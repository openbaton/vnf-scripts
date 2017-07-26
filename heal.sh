#!/bin/bash

case "$cause" in

("serviceDown")
	echo "SipP server is down, let's try to restart it..."
	screen -d -m -S server sipp -sn uas
	if [ $? -ne 0 ]; then
	    echo "ERROR: SipP server does not start"
	    exit 1
    	fi
	echo "SipP server is running again!"
	;;
*) echo "The cause $cause is unknown"
	exit 2
	;;
esac
