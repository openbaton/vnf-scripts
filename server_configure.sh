#!/bin/bash

echo $db > /home/ubuntu/config
screen -dm -S client iperf -c $ip1
