#!/bin/bash

#Start sipp client
screen -d -m -S client sipp -sn uac $server_private
