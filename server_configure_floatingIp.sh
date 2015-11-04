#!/bin/bash

screen -d -m -S client iperf -c $server_shared_int_network_floatingIp -t 300