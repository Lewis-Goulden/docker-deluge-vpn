#!/bin/sh
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
route add -net 192.168.1.0 netmask 255.255.255.0 gw 172.17.0.1 dev eth0
route add -net 172.16.0.0 netmask 255.240.0.0 gw 172.17.0.1 dev eth0
route add -net 10.0.0.0 netmask 255.0.0.0 gw 172.17.0.1 dev eth0
/usr/sbin/openvpn --config /etc/openvpn/vpn.ovpn
