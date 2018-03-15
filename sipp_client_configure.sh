#!/bin/bash

#Check if there are screens up and deletd them
result=$(screen -ls | grep client | wc -l);
if [ "${result}" -ne "0" ]; then
                echo "client running, it will be killed"
                pkill screen
fi

#Clean existing configuration files
if [ -f /root/sipp-server-ip ]; then
        echo "deleting config file"
        rm /root/sipp-server-ip
fi

#Configuration
source /opt/openbaton/scripts/ob_parameters.sh
touch /root/sipp-server-ip

echo "$OB_server_VNFC_private" > /root/sipp-server-ip

echo "Saved sipp server IP: $OB_server_VNFC_private"

# test that parameters are received
echo "running cat /opt/openbaton/scripts/ob_parameters.sh"
cat /opt/openbaton/scripts/ob_parameters.sh

