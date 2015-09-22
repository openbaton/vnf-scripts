#!/bin/bash

echo $db > /home/ubuntu/config
screen -S client iperf -c $ip1
