#!/bin/bash

echo 'peer1_private='$peer1_private > /home/ubuntu/params
echo 'peer2_private='$peer2_private >> /home/ubuntu/params
echo 'peer3_private2='$peer3_private2 >> /home/ubuntu/params

screen -d -m -S client1 iperf -c $peer1_private -t 300
screen -d -m -S client2 iperf -c $peer2_private -t 300
screen -d -m -S client3 iperf -c $peer3_private2 -t 300
