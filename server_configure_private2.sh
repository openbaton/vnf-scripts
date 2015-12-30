#!/bin/bash

screen -d -m -S client2 iperf -c $server_private2 -t 300
