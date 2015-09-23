#!/bin/bash

echo $new_key > /home/ubuntu/config

screen -d -m -S client iperf -c $ip1 --output  ~/iperf-client.log
