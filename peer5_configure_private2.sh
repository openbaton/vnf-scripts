#!/bin/bash

echo 'peer5_private2='$peer5_private2 >> /home/ubuntu/params

screen -d -m -S client5 iperf -c $peer5_private2 -t 300
