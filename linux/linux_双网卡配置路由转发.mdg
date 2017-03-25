WAN口   172.17.2.2/24  gw 172.17.2.254

LAN口     10.10.1.1/24



Root用户

ifconfig eth0 172.17.2.2 netmask 255.255.255.0

ifconfig eth1 10.10.1.1 netmask 255.255.255.0

route add -net 10.10.1.0 netmask 255.255.255.0 dev eth1

route add default gw 172.17.2.254

echo '1' > /proc/sys/net/ipv4/ip_forward 开启ip转发功能

iptables -F ;清除设置的规则链

iptables -P INPUT ACCEPT

iptables -P FORWARD ACCEPT ;定义链规则

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE ;开启nat





设置完毕



设置eth1为静态IP



root@jay-WORK-PC:/home/jay# vi /etc/network/interfaces



# This file describes the network interfaces available on your system

# and how to activate them. For more information, see interfaces(5).



# The loopback network interface

auto lo

iface lo inet loopback



# The primary network interface

auto eth0

iface eth0 inet static

        address 172.17.2.2

        netmask 255.255.255.0

        network 172.17.2.0

        broadcast 172.17.2.255

        gateway 172.17.2.254

        # dns-* options are implemented by the resolvconf package, if
installed

        dns-nameservers 172.17.2.252

auto eth1

iface eth1 inet static

        address 10.10.1.1

        netmask 255.255.255.0

        network 10.10.1.0

        broadcast 10.10.1.255

重启networking服务

/etc/init.d/networking restart

