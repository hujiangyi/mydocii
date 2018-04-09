# 部署HBase-1.2.6

## 权限

groupadd hadoop

usermod -a -G hadoop xxx

将hadoop组加入到 /etc/sudoers



sudo chown -R xxx /opt/hbase-1.2.6/



## 版本下载

需要下载stable版本

wget http://mirror.bit.edu.cn/apache/hbase/stable/hbase-1.2.6-bin.tar.gz



    
    
    tar -zxvf hbase-1.2.6-bin.tar.gz -C /opt/



## 添加环境变量

export HBASE_HOME=/opt/hbase/hbase-1.2.6

export PATH=.:$JAVA_HOME/bin:$HBASE_HOME/bin:$PATH



## 集群配置

sudo vim /opt/hbase-1.2.6/conf/hbase-env.sh

export JAVA_HOME=/usr/lib/java/jdk1.8.0_121

export HBASE_MANAGES_ZK=false



sudo vim /opt/hbase-1.2.6/conf/hbase-site.xml

<configuration>

     <property>

         <name>hbase.rootdir</name>

         <value>hdfs://master:9000/hbase</value>

     </property>

     <property>

           <name>hbase.cluster.distributed</name>

         <value>true</value>

     </property>

     <property>

         <name>hbase.zookeeper.quorum</name>

         <value>master,slaver1,slaver2</value>

     </property>

     <property>

         <name>hbase.zookeeper.property.dataDir</name>

         <value>/opt/zookeeper-3.4.10/data</value>

     </property>

</configuration>



sudo vim /opt/hbase-1.2.6/conf/regionservers

master

slaver1

slaver2

    
    
     

## 启动\停止 Hbase

Start-hbase.sh



## 状态监控

http://master:16030

hbase shell

Status



PS: 如果启动的是伪分布式，使用内置zookeeper
那么jps可以看到HQuorumPeer，如果启动的是全分布式，外置zookeeper那么jps看到的就是QuorumPeerMain，网上很多没讲清楚



