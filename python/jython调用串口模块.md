配套软件列表

python-2.7.14.amd64.msi                            PYTHON2.7.14

jython-installer-2.7.0.jar                              JYTHON2.7.0

mfz-rxtx-2.2-20081207-win-x64.zip        RXTX JAVA串口驱动

下载地址

链接：http://pan.baidu.com/s/1eR9klfs 密码：vl1i



1、  安装jdk，安装后我的路径如下：

D:\jdk1.8.0_92

D:\jdk1.8.0_92\jre



2、  安装python，安装后我的路径如下，系统环境变量设置如上：

C:\Python27





3、  安装jython，安装后我的路径如下，系统环境变量如上：

D:\jython2.7.0



4、  安装setuptools和pip

python -m pip install -U pip setuptools

添加path c:\Python27\Scripts 可以全局访问pip



5、  安装pyserial

如果报错ImportError: No module named serial

pip install pyserial

d:\jython2.7.0\bin>pip install pyserial

Downloading/unpacking pyserial

  Downloading pyserial-3.4-py2.py3-none-any.whl (193kB): 193kB downloaded

Installing collected packages: pyserial

Successfully installed pyserial

Cleaning up...



6、  安装importlib

如果报错ImportError: No module named importlib

pip install importlib

c:\Python27\Scripts>pip install importlib

Collecting importlib

  Using cached importlib-1.0.4.zip

Installing collected packages: importlib

  Running setup.py install for importlib ... done

Successfully installed importlib-1.0.4



7、  安装rxtx  64位java串口驱动包

Windows

\----------------------------------------------------



Choose your binary build - x64 or x86 (based on which version of

the JVM you are installing to)



NOTE: You MUST match your architecture.  You can't install the i386

version on a 64-bit version of the JDK and vice-versa.



For a JDK installation:



Copy RXTXcomm.jar ---> <JAVA_HOME>\jre\lib\ext

Copy rxtxSerial.dll ---> <JAVA_HOME>\jre\bin

Copy rxtxParallel.dll ---> <JAVA_HOME>\jre\bin



8、  执行环境的设置

由于在jython的sys.path与python不一样，需要在import
serial之前将syspath重新设置一下，并且顺序不能错误，路径根据实际安装目录来设置

import sys

sys.path.append("C:\WINDOWS\SYSTEM32\python27.zip")

sys.path.append("C:\Python27\DLLs")

sys.path.append("C:\Python27\lib")

sys.path.append("C:\Python27\lib\plat-win")

sys.path.append("C:\Python27\lib\lib-tk")

sys.path.append("C:\Python27")

sys.path.append("C:\Python27\lib\site-packages")

import serial



9、  

