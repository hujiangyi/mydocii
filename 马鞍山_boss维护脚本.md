# 马鞍山 boss同步维护脚本

## 守护进程

guardMonitor.sh 当boss同步进程被关闭会马上启动一个新的

调用runMonitor.sh

#!/bin/sh

PRO_NAME=/home/ems/ems/runMonitor.sh

while true ; do

        NUM=`ps aux | grep ${PRO_NAME} | grep -v grep |wc -l`

        if [ "${NUM}" -lt "1" ];then

                echo "${PRO_NAME} was killed"

                ${PRO_NAME} 

        fi

done

## 检查进程

checkMonitor.sh  会不停检查是否存在192.252.100.21
ip的close_wait状态连接，如果存在则调用stopMonitor.sh

#!/bin/sh

PRO_NAME=/home/ems/ems/stopMonitor.sh

while true ; do

        NUM=`netstat -nap | grep CLOSE_WAIT | grep 192.252.100.21 | wc -l`

        if [ "${NUM}" -ge "1" ];then

                echo "CLOSE_WAIT appears run stopMonitor.sh"

                ${PRO_NAME} 

                sleep 3600

        fi

done



## 启动同步

runMonitor.sh



#!/bin/sh

JAVA='jre/bin/java'

OPTS=-Dorg.osgi.framework.bootdelegation=*

CP='conf;lib:lib/com.topvision.launcher-1.0.1.jar:lib/org.apache.felix.main-5.
6.10.jar'

MAIN='com.topvision.launcher.TopvisionToolSets'

echo =====================================================================

echo   Topvision Tool Sets Server Startup Environment

echo   JAVA: ${JAVA}

echo   JAVA_OPTS: ${OPTS}

echo   CLASSPATH: ${CP}

echo   CMD: ${JAVA} ${OPTS} -classpath ${CP} ${MAIN}

echo ================================================================

$JAVA $OPTS -classpath $CP $MAIN

## 停止同步

stopMonitor.sh



#!/bin/sh

re=`ps -ef | grep java | grep "Dorg.osgi.framework.bootdelegation=*"`

cid=`echo $re |awk -F ' ' '{print $2}'`

pid=`echo $re |awk -F ' ' '{print $3}'`



kill $cid

kill $pid



## 启动守护进程和检查进程

nohup ./guardMonitor.sh &



./checkMonitor.sh >> check.log &

