#!/bin/bash

echo 'peer4_private2='$peer4_private2 >> /home/ubuntu/params

screen -d -m -S client4 iperf -c $peer4_private2 -t 300
