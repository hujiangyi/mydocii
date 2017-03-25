Linux mint 默认安装的是 isc-dhcp-server



配置dhcp网卡绑定



/etc/default/isc-dhcp-server



INTERFACES="eth1"



配置地址池

/etc/dhcp/dhcpd.conf

subnet 172.17.2.0 netmask 255.255.255.0 {

range 172.17.2.100 172.17.2.200;

}





重启服务

service isc-dhcp-server restart



查看地址分配情况

cat /var/lib/dhcp/dhcpd.leases





