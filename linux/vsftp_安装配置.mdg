sudo apt-get install vsftpd





用户设计

一个本地用户，映射多个虚拟用户

本地用户建立



sudo useradd virtual -d /home/vsftpd -s /bin/false  
sudo chown virtual.virtual /home/vsftpd



/home/vsftpd权限

dr-xr-xr-x 3 virtual virtual 4096 Aug 27 18:49 vsftpd

通过控制/home/vsftpd下的目录w权限来控制是否可写

虚拟目录通过mount命令来实现





/etc/vsftpd.conf配置内容



listen=YES

anonymous_enable=NO

local_enable=YES

write_enable=YES

local_umask=022

dirmessage_enable=YES

use_localtime=YES

xferlog_enable=YES

connect_from_port_20=YES

chown_uploads=YES

chown_username=virtual

xferlog_file=/var/log/vsftpd.log

xferlog_std_format=YES

idle_session_timeout=3000

data_connection_timeout=120

ascii_upload_enable=YES

ascii_download_enable=YES

ftpd_banner=Welcome to blah FTP service.

secure_chroot_dir=/var/run/vsftpd/empty

rsa_cert_file=/etc/ssl/private/vsftpd.pem

max_clients=10

max_per_ip=5

local_max_rate=256000

guest_enable=YES

guest_username=virtual

user_config_dir=/etc/vsftpd/vsftpd_user_conf

pam_service_name=vsftpd.vu



建立虚拟用户数据库

/home/loguser.txt

apt-get install db4.7-util

mkdir /etc/vsftpd

db4.7_load -T -t hash -f /home/loguser.txt /etc/vsftpd/vsftpd_login.db

chmod 600 /etc/vsftpd/vsftpd_login.db



配置pam

vi /etc/pam.d/vsftpd.vu



auth required /lib/security/pam_userdb.so db=/etc/vsftpd/vsftpd_login  
account required /lib/security/pam_userdb.so db=/etc/vsftpd/vsftpd_login



PAM配置容易出错

首先/lib/security/pam_userdb.so受PAM模块安装目录影响，可能不在这个目录下 需要检查



网文中/etc/vsftpd/vsftpd_login目录也是错误的 需要注意对应

建立的虚拟用户将采用PAM进行验证，这是通过/etc/vsftpd.conf文件中的 语句pam_service_name=vsftpd.vu来启用



新建etc/vsftpd_user_conf文件夹

在上面的配置中，有这么一行

user_config_dir=/etc/vsftpd/vsftpd_user_conf

要把各个用户的配置文件放到目录/etc/vsftpd/vsftpd_user_conf中

配置文件名要与/home/loguser.txt中用户名一致



配置文件内容参考

write_enable=YES  
anon_world_readable_only=NO  
anon_upload_enable=YES  
anon_mkdir_write_enable=YES  
anon_other_write_enable=YES  
local_root=/home/vsftpd





