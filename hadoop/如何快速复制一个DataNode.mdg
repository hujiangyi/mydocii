# 如何快速复制一个DataNode

## 通过master制作可复制的包

cd /opt

sudu rm -r ./hadoop-2.7.3/tmp

Sudo rm -r ./hadoop-2.7.3/logs/*

tar -zcf ~/hadoop.master.tar.gz ./hadoop-2.7.3

cd ~

scp ./hadoop.master.tar.gz slaverx:~/



## Slaver节点配置

sudo rm -r /opt/hadoop-2.7.3

sudo tar -zxf ~/hadoop.master.tar.gz -C /opt

sudo chown -R user /opt/hadoop-2.7.3



## 修改master上的slaves配置文件，加入新节点ip

vim /opt/hadoop-2.7.3/etc/hadoop/slaves



