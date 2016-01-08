#!/bin/bash

echo 'peer3_private='$peer3_private >> /home/ubuntu/params

screen -d -m -S client3 iperf -c $peer3_private -t 300
