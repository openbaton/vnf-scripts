#!/usr/bin/env python
import subprocess

def main():
    proc = subprocess.Popen("screen -d -m -S server iperf -s".split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out1, err1 = proc.communicate()
    return out1

main()