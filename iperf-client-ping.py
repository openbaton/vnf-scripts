#!/usr/bin/env python
import subprocess

def main():
    proc = subprocess.Popen("screen -d -m -S client iperf -c $server_private_floatingIp -t 300".split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out1, err1 = proc.communicate()
    return out1

main()