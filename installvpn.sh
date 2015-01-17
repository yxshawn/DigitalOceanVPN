#!/bin/sh
apt-get install pptpd
echo >> /etc/pptpd.conf
echo "localip 10.100.0.1" >> /etc/pptpd.conf
echo "remoteip 10.100.0.2-10" >> /etc/pptpd.conf

echo "chap-secrets"

echo >> /etc/ppp/chap-secrets
echo "VPNUserName	pptpd	VPNPassword	*" >> /etc/ppp/chap-secrets
echo "ihunter	pptpd	ihunter	*" >> /etc/ppp/chap-secrets

echo "pptpd-options"
echo >> /etc/ppp/pptpd-options
echo "ms-dns 8.8.8.8" >> /etc/ppp/pptpd-options
echo "ms-dns 8.8.4.4" >> /etc/ppp/pptpd-options

service pptpd restart

echo >> /etc/sysctl.conf
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

sysctl -p

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save
iptables --table nat --append POSTROUTING --out-interface ppp0 -j MASQUERADE
iptables -I INPUT -s 10.100.0.0/24 -i ppp0 -j ACCEPT
iptables --append FORWARD --in-interface eth0 -j ACCEPT

echo >> /etc/init.d/rc.local
echo "iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save" >> /etc/init.d/rc.local
echo "iptables --table nat --append POSTROUTING --out-interface ppp0 -j MASQUERADE" >> /etc/init.d/rc.local
echo "iptables -I INPUT -s 10.100.0.0/24 -i ppp0 -j ACCEPT" >> /etc/init.d/rc.local
echo "iptables --append FORWARD --in-interface eth0 -j ACCEPT" >> /etc/init.d/rc.local

echo "恭喜，您的PPTPD已经安装成功！"
echo "您的VPN默认账号密码都是ihunter"
