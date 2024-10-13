#!/bin/bash
yum update -y
yum install -y iptables-services
systemctl start iptables
systemctl enable iptables
echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf
sysctl -p
iptables -t nat -A POSTROUTING -o enX0 -j MASQUERADE
service iptables save
service iptables restart