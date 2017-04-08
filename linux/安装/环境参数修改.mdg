在Linux终端下，想要修改终端环境参数的值可分为两种方式：

暂时修改：

                此种修改只是让环境参数在当前打开的终端有效，当打开另一个终端或重新启动一个终端时，得重新设置。

方法为：$export <环境变量名>=<环境变量值>

如:

**[html]** [view plain](http://blog.csdn.net/flydream0/article/details/7330452%23)[copy](http://blog.csdn.net/flydream0/article/details/7330452%23)



1       $export PATH=$PATH:~/bin

  
永久修改:

              此种方式会让修改的参数永久生效。

方法为:

**[html]** [view plain](http://blog.csdn.net/flydream0/article/details/7330452%23)[copy](http://blog.csdn.net/flydream0/article/details/7330452%23)



2       $cd ~/

3       $sudo vim .bashrc

打开.bashrc文件，在文件末尾一行添加如下：

**[html]** [view plain](http://blog.csdn.net/flydream0/article/details/7330452%23)[copy](http://blog.csdn.net/flydream0/article/details/7330452%23)



4       $export PATH=$PATH:~/bin

如此，便可以让PATH环境参数在当前用户的终端的修改永久生效了.

上面的方法可以对当前用户永久生效，还有一种是对所有用户都有效的方法：

**[plain]** [view plain](http://blog.csdn.net/flydream0/article/details/7330452%23)[copy](http://blog.csdn.net/flydream0/article/details/7330452%23)



5       sudo vim /etc/environment

在打开的文件中添加你要修改有内容即可。保存关闭。

想要立即生效又不关闭当前终端或重启的方法为：

**[plain]** [view plain](http://blog.csdn.net/flydream0/article/details/7330452%23)[copy](http://blog.csdn.net/flydream0/article/details/7330452%23)



6       source  /etc/environment



