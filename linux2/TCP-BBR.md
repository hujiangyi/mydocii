**TCP-BBR(3.28)**

  * BBR (Bottleneck Bandwidth and RTT)是由google工程师编写的新的 TCP 拥塞控制算法，目的是要尽量跑满带宽, 并且尽量不要有排队的情况, 加速效果不比锐速差，  
完全开源，对隐匿性要求高而无法使用锐速的人士，也可以放心使用  
开源地址

  * 测试环境 Debian 7 x64 Vultr
  * 启用TCP-BBR涉及VPS更换内核，所以如果步骤错误，或者VPS不兼容最新的内核，会导致无法开机等错误，脚本来自于 @秋水逸冰 
  * 锐速不支持，更换后的 4.9/4.10 内核

* * *

  * 系统支持：CentOS 6+，Debian 7+，Ubuntu 12+
  * 虚拟技术：OpenVZ 以外的，比如 KVM、Xen、VMware 等
  * 内存要求：≥128M

* * *

  * 连接SSH，输入下面命令，更新内核

1  
2  
3

wget \--no-check-certificate
https://github.com/teddysun/across/raw/master/bbr.sh  
chmod +x bbr.sh  
./bbr.sh

  * 安装完成后，脚本会提示需要重启 VPS，输入 y 并回车后重启
  * 重连SSH
  * 验证 内核版本

1

uname -r

  * (3.28)最新内核版本为 4.10
  * 修改sysctl.conf

1

nano /etc/sysctl.conf

  * 复制代码：

1  
2  
3  
4  
5  
6  
7  
8  
9  
10  
11  
12  
13  
14  
15  
16  
17  
18  
19  
20  
21  
22  
23

#TCP配置优化(不然你自己根本不知道你在干什么)  
fs.file-max = 51200  
#提高整个系统的文件限制  
net.core.rmem_max = 67108864  
net.core.wmem_max = 67108864  
net.core.netdev_max_backlog = 250000  
net.core.somaxconn = 4096  
  
net.ipv4.tcp_syncookies = 1  
net.ipv4.tcp_tw_reuse = 1  
net.ipv4.tcp_tw_recycle = 0  
net.ipv4.tcp_fin_timeout = 30  
net.ipv4.tcp_keepalive_time = 1200  
net.ipv4.ip_local_port_range = 10000 65000  
net.ipv4.tcp_max_syn_backlog = 8192  
net.ipv4.tcp_max_tw_buckets = 5000  
net.ipv4.tcp_fastopen = 3  
net.ipv4.tcp_mem = 25600 51200 102400  
net.ipv4.tcp_rmem = 4096 87380 67108864  
net.ipv4.tcp_wmem = 4096 65536 67108864  
net.ipv4.tcp_mtu_probing = 1  
net.ipv4.tcp_congestion_control = bbr  
#END OF LINE

  * 保存(Ctrl + X ---- y ----回车)
  * 应用

1

sysctl -p

  * 重启SSR 

1

/etc/init.d/shadowsocks restart



