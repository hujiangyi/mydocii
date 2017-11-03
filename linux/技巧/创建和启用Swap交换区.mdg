## [[Linux]创建和启用Swap交换区](http://www.cnblogs.com/zsummer/p/4808422.html)

如果你的服务器的总是报告内存不足，并且时常因为内存不足而引发服务被强制kill的话，在不增加物理内存的情况下，启用swap交换区作为虚拟内存是一个不错的选择
，我购买的DigitalOcean VPS
512M内存基本不够用的，好在VPS的母鸡使用的SSD，正常读写速度都在300MB/s以上，启用swap后性能提高了不少，特别是在处理消耗大内存的脚本方面

创建交换区原则：  
1.创建的swap交换区大小应该大于实际物理内存的容量大小，但是不要过大，以免造成硬盘空间浪费。  
2.如果内存IO请求频繁，而单一swap交换区IO队列等待时间过长的话，可以多创建几个swap交换区。  
3.原则上优先在IO速度最快的设备上创建。  
  
创建步骤：  
1.创建swap交换区硬盘存储用的空白文件。

    
    
    1
    
    
    2
    
    
    #创建一个1个G的SWAP交换区空白文件
    
    
    dd if=/dev/zero of=/swap bs=1M count=1024

通常创建物理内存2~2.5倍大小的文件作为交换区。

2.使用mkswap格式化文件为swap文件系统

    
    
    1
    
    
    2
    
    
    mkswap -f /swap
    
    
    #-f 使用文件作为swap交换区

3.启用刚才创建的Swap文件

    
    
    1
    
    
    swapon /swap

4.如果有必要可以设置开机自动启用swap文件交换区，修改/etc/fstab，增加一行

    
    
    1
    
    
    /swap swap swap defaults 0 0 #启动即启用swap

5.如果不需要启用swap或需要调整swap大小，可以使用swapoff命令关闭swap。

    
    
    1
    
    
    swapoff /swap

关闭swap后删除对应的swap文件即可删除swap交换区，如需要调整swap交换区大小，从第一部开始重新创建即可。



