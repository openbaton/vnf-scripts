#!/bin/bash

echo 'peertwo_private='$peertwo_private > /home/ubuntu/params

screen -d -m -S client2 iperf -c $peertwo_private -t 300
