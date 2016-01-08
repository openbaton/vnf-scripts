#!/bin/bash

echo 'peer2_private='$peer2_private >> /home/ubuntu/params

screen -d -m -S client2 iperf -c $peer2_private -t 300
