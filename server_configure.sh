#!/bin/bash

echo $new_key > /home/ubuntu/config
echo $server_private > /home/ubuntu/sid
sleep 10s
screen -d -m -S client iperf -c $server_private -t 300
