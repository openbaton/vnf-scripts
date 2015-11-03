#!/bin/bash

screen -d -m -S client iperf -c $server_private_floatingIp -t 300