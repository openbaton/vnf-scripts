#!/bin/bash

echo 'peer3_private2='$peer3_private2 >> /home/ubuntu/params

screen -d -m -S client3 iperf -c $peer3_private2 -t 300
