安装jdk



下载jdk-7u51-linux-x64.gz

解压



tar vxf jdk-7u51-linux-x64.gz



将解压后的目录移动到/usr/lib/jvm/下

mv jdk1.7.0_10 /usr/lib/jvm/



配置全局环境变量

gedit /etc/profile



在文件末尾加上

export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_10

export JRE_HOME=/usr/lib/jvm/jdk1.7.0_10/jre

export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/l
ib:$JRE_HOME/lib:$CLASSPATH



export PATH=$JAVA_HOME/bin:$PATH



更新一下source

source /etc/profile



用java -version检查安装成功没有

java -version

java version "1.7.0_51"

Java(TM) SE Runtime Environment (build 1.7.0_51-b13)

Java HotSpot(TM) 64-Bit Server VM (build 24.51-b03, mixed mode)



