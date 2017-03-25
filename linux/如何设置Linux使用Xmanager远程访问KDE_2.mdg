登陆器-》桌面-》Xwindow

登陆器

Kdm、Gdm、Mdm、lightDm

都可以用作管理用户登录使用，也可以配置Xdmcp协议支持

桌面

Kde、Gnome、Unity、Xface

都是用户登录之后的Xwindow的桌面应用，各有各的优缺点

登陆器和桌面没有必要一一对应，可以使用任何一种登陆器，登录自己期望的桌面应用

启动xrdp协议支持windows远程桌面访问

sudo apt-get install xrdp  
sudo apt-get install vnc4server  
sudo apt-get install tightvncserver





如何设置Linux使用Xmanager远程访问KDE/GNOME桌面

**Step 1\. Change runlevel to enable gdm or kdm.**

1.   Open /etc/inittab file.

2.   Change the runlevel to 5 as following:

id:5:initdefault:

**Step 3\. KDM configuration (When the Linux is using kdm)**

3.   Open /etc/X11/xdm/Xaccess file.

4.   Remove the initial "#" character for the following line:

#* #any host can get a login window  
==>  
* #any host can get a login window

5.   Open /etc/X11/xdm/kdmrc,

/usr/share/config/kdm/kdmrc or  
/etc/opt/kde2/share/config/kdm/kdmrc file.

6.   Change the value of "Enable" option to "true".

**Step 4\. Firewall configuration (If the firewall has been configured)**

**ufw allow 177**

**Or ufw disable**

**Step 5\. Restart your Linux to activate the changes.**



