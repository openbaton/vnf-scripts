#!/bin/bash

echo $new_key > /home/ubuntu/config
iperf -c $ip1 > ~/iperf-client.log &
