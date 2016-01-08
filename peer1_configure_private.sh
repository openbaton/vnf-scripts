#!/bin/bash

echo 'peer1_private='$peer1_private >> /home/ubuntu/params

screen -d -m -S client1 iperf -c $peer1_private -t 300
