# 初次安装ubuntu后直接安装NM3000无法启动MYSQL的问题

## 问题表象



**administrator@administrator**:**/home/nm3000/ems**$ ./startmysql.sh 

./mysqld: error while loading shared libraries: libaio.so.1: cannot open
shared object file: No such file or directory



## 问题分析

### 问题1

分析是缺少libaio.so,那就安装一个呗

sudo apt-get install libaio-dev



### 问题2

获取:1 http://172.17.0.10/sinstall/sinstall.htm?cn.archive.ubuntu.com/ubuntu
yakkety/main amd64 libaio1 amd64 0.3.110-3 [6,382 B]

错误:1 http://172.17.0.10/sinstall/sinstall.htm?cn.archive.ubuntu.com/ubuntu
yakkety/main amd64 libaio1 amd64 0.3.110-3

  Writing more data than expected (6991 > 6382)

  Hashes of expected file:

   \- SHA256:7d5164f037693a1942ba3a5564fb633a16f7dcf7ffcb5780368b576ad19fab9d

   \- SHA1:cb3f5b9a53a86398644a183e0b4591762cc47847 [weak]

   \- MD5Sum:f0164239167bbd4304ae425035065f40 [weak]

   \- Checksum-FileSize:6382 [weak]



这是由于http换成导致的校验和错误，这个问题比较无语，ubuntu的毛病，比较快捷的解决办法是搞一个socket5代理 安装一个tsocks
然后通过tsocks来安装这个包



sudo tsocks apt-get install libaio-dev



