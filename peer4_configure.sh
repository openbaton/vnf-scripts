#!/bin/bash

echo 'peer3_private2='$peer3_private2 > /home/ubuntu/params
echo 'peer5_private2='$peer5_private2 >> /home/ubuntu/params

screen -d -m -S client3 iperf -c $peer3_private2 -t 300
screen -d -m -S client5 iperf -c $peer5_private2 -t 300
