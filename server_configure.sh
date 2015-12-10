#!/bin/bash

echo $new_key > /home/ubuntu/config

sleep 1m
screen -d -m -S client iperf -c $server_private -t 300
