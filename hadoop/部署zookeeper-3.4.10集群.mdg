# 部署zookeeper-3.4.10集群

## 权限

groupadd hadoop

usermod -a -G hadoop xxx

将hadoop组加入到 /etc/sudoers



sudo chown -R xxx /opt/zookeeper-3.4.10/

## 版本下载

需要下载stable版本

wget
<http://mirrors.hust.edu.cn/apache/zookeeper/stable/zookeeper-3.4.10.tar.gz>



    
    
    tar -zxvf zookeeper-3.4.10.tar.gz -C /opt/



## 添加环境变量

export ZK_HOME=/opt/zookeeper-3.4.10

export PATH=.:$JAVA_HOME/bin:$ZK_HOME/bin:$PATH



## 集群配置

sudo vim /opt/zookeeper-3.4.10/conf/zoo.cfg



修改dataDir

dataDir=/opt/zookeeper-3.4.10/data



添加server节点，由于zookeeper有一个策略是server中超过半数的server存活则可以提供服务，故server节点个数需要时奇数个

server.0=172.17.2.20:2888:3888

server.1=172.17.2.21:2888:3888

server.2=172.17.2.22:2888:3888



## 在对应server的data目录下添加myid文件

    
    
    server.0=172.17.2.20:2888:3888【172.17.2.20服务器上面的myid填写0】
    
    
    server.1=172.17.2.21:2888:3888【172.17.2.21服务器上面的myid填写1】
    
    
    server.2=172.17.2.22:2888:3888【172.17.2.22服务器上面的myid填写2】
    
    
     

## 启动\停止 zookeeper

与hadoop不同 zookeeper的启动需要在每个节点去单独启动



    
    
    zkServer.sh start
    
    
    zkServer.sh stop
    
    
    zkServer.sh status



