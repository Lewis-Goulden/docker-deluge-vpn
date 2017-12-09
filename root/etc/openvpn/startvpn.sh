#!/bin/sh
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
/usr/sbin/openvpn --config /etc/openvpn/vpn.ovpn
