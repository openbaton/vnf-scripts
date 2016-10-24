#!/bin/bash

#Set hostname in /etc/hosts
sudo sed -i 's/\(127.0.0.1\slocalhost\)/\1 '"${HOSTNAME}"'/g' /etc/hosts

#Install sipp
sudo apt-get update && sudo apt-get install -y sip-tester screen
