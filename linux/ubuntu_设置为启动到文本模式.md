Ubuntu的默认开机的runlevel是2,可以用runlevel来查看当前的默认运行级别。

debian系(ubuntu是基于debian)的Linux一直是用runlevel
2来默认启动，并且runlevel定义也与redhat有区别。debian的runlevel级别定义如下：

0 – Halt，关机模式

1 – Single，单用户模式

2 \- Full multi-user with display manager (GUI)

3 \- Full multi-user with display manager (GUI)

4 \- Full multi-user with display manager (GUI)

5 \- Full multi-user with display manager (GUI)

6 – Reboot，重启

可以发现2~5级是没有任何区别的。他们为多用户模式，这和一般的linux不一样。而redhat的runlevel级别定义如下：



0：关机。不能将系统缺省运行级别设置为0，否则无法启动。



1：单用户模式，只允许root用户对系统进行维护。



2：多用户模式，但不能使用NFS（相当于Windows下的网上邻居）



3：字符界面的多用户模式。



4：未定义。



5：图形界面的多用户模式。



6：重启。不能将系统缺省运行级别设置为0，否则会一直重启。



这里补充一下，多数的linux都是用一种叫System
V的机制来启动运行级别，而ubuntu使用upstart代替init启动系统进程。所以没有那个inittab文件来改默认运行级别。ubuntu
的默认运行级别文件是/etc/init/rc-sysinit.conf。



成功的方法：



第一种方法：(内核级别的)



Sudo vi /etc/default/grub

修改GRUB_CMDLINE_LINUX_DEFAULT=”quiet splash”

为：GRUB_CMDLINE_LINUX_DEFAULT=” text”

然后运行下sudo update-grub2就可了



第二种方法：（基于upstart的”正统”方法）



ubuntu的upstart的体系下，/etc/init.d里面基本上都是连接到/lib/init/upstart-job的软连接，所以，对 initscr
ipts的请求全部转化为upstart事件，upstart系统对启动项目的管理全部根据/etc/init里面的配置文件来启动，可以启动lightdm的事件就
让人咂舌



编辑文件 /etc/init/lightdm.conf



start on （(filesystem

and started dbus

and (graphics-device-added fb0 PRIMARY_DEVICE_FOR_DISPLAY=1

or drm-device-added card0 PRIMARY_DEVICE_FOR_DISPLAY=1

or stopped udevtrigger))

or runlevel PREVLEVEL=s）

stop on runlevel [016]



可见，一旦发生文件系统初始化，DBUS总线启动和发生graphics-device-added fb0
PRIMARY_DEVICE_FOR_DISPLAY=1 or drm-device-added card0
PRIMARY_DEVICE_FOR_DISPLAY=1 or stopped udevtrigger or runlevel
PREVLEVEL=s这里面的任何一个事件，GDM就会被启动，只在运行级别在016的时候，GDM不启动。

所以，事件也就明了了、要在upstart层面干掉gdm，把上面的启动相关事件注释掉，改写下就行了



由于ubuntu 默认模式为2，所以：

start on (filesystem

and started dbus

and (graphics-device-added fb0 PRIMARY_DEVICE_FOR_DISPLAY=1

or drm-device-added card0 PRIMARY_DEVICE_FOR_DISPLAY=1

or stopped udevtrigger)

and runlevel [345])

stop on runlevel [0126]



重启。



第三种方法：



1、阻止默认图形桌面启动



ubuntu 12.04默认的开机会进入一个图形界面，他是由lightdm进程来实现的。



首先要做的，就是阻止这个lightdm的进程开机启动。 做法：



（1）、查看文件/etc/init/rc-sysinit.conf，在第14行附近：确认“env
DEFAULT_RUNLEVEL=2”。2是新装系统默认的，确保不被修改。



（2）、编辑文件 /etc/init/lightdm.conf，在第12行附近，原句“ and runlevel [!06]” 改为“ and
runlevel [!026]”。



解释：linux系统都有一个运行级别(runlevel)的概念，不同的运行级别配置将导致系统的启动过程有很大差异，比如当配置 runlevel为 1是，是不
进入图形界面的。系统启动过程中会有一个init进程来拉起许多其他进程(各种系统服务，窗口界面)。在ubuntu上(11.10,12.04是这样，其他版本或其
他linux发行版不确定)init会执行两个目录下的脚本，一个是/etc/init/下的，另一个是/etc/rc?.d/下的，问号可能是0~6的其中一个数字
，代表运行级别。接下来，讲解一下流程以加深理解。



在ubuntu上，init进程首先执行/etc/init/目录下的rc-sysinit.conf，这个文件指明了本次启动的默认运行级别。这是上面第一步的意义
：确保默认运行级别是2。接下来目录/etc/init下的其他脚本的执行都会根据不同的运行级别做出不同的动作，比如lightdm会判断运行级别是否处于1,2,
3,4,5中的一个，是则启动lightdm，不是则不启动lightdm。这便是上面第二步的意义，修改 lightdm.conf ，把“2”加入到判断语句，使
得lightdm在运行级别2的时候不要启动。明白了这些，你就可以灵活一点，例如把默认级别设置为3，而把3加入那个判断语句，也可以达到阻止lightdm启动的
效果。完成了/etc/init/目录下的启动动作，init进程会继续执行/etc/rc2.d目录下的脚本。



2、关闭Ubuntu的载入画面



ubuntu启动时，会有一个ubuntu字样出现在屏幕，文字下方有闪烁的点，这时按ESC可以在动画和文字界面之间切换。这一步骤不属于lightdm，而是一个
叫 plymouth 的进程在起作用。实际上，plymouth的意义就在于，在开机到图形桌面
(lightdm)起来这段时间里展示出一个动画，从而提高用户体验。



屏蔽的方法：



（1）、编辑 /etc/default/grub文件，原文11行附近：

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"



去掉”splash“，改后：

GRUB_CMDLINE_LINUX_DEFAULT="quiet"

（2）、执行命令：

sudu updat-grub

重启，即可看到，不再有载入画面出现。



