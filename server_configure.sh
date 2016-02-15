#!/bin/bash

# echo $new_key > /home/ubuntu/config

screen -d -m -S client iperf -c $server_private -t 480
