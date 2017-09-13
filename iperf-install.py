#!/usr/bin/env python
import subprocess
def main():
    proc = subprocess.Popen("sudo apt-get update".split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out1, err1 = proc.communicate()
    proc = subprocess.Popen("sudo apt-get install -y iperf screen".split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out2, err2 = proc.communicate()
    print out1 + "\n" + out2
    return out1 + "\n" + out2

main()
