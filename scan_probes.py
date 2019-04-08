# -*- coding: utf-8 -*-

from scapy.all import sniff

# Console colors
W = '\033[0m'  # white (normal)
R = '\033[31m'  # red
G = '\033[32m'  # green
O = '\033[33m'  # orange
B = '\033[34m'  # blue
P = '\033[35m'  # purple
C = '\033[36m'  # cyan
GR = '\033[37m'  # gray
T = '\033[93m'  # tan

interface = 'wlan1mon'
probeReqs = []


def sniff_probe(p):
    if p.haslayer(Dot11ProbeReq):
        netName = p.getlayer(Dot11ProbeReq).info
        if netName not in probeReqs:
            probeReqs.append(netName)
            print '[' + G + '+' + W + '] ' + W + 'Detected New Probe: ''' + R + '' + netName + W


if __name__ == '__main__':
    sniff(iface=interface, prn=sniff_probe)
