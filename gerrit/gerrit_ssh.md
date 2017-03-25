gerrit SSH KEY 的配置 （windows）

 (2013-04-22 16:03:26)

转载▼

1\. 首先登陆gerrit 注册（激活）自己的账号。

2\. 生成SSH KEY。 run ssh-keygen -t dsa -b 1024  。 提示Enter file in which to save
the key： 输入任意一文件名（例如id_dsa）。 提示Enter file in which to save the key， 连续输入两次回车。
ls /home 或者 /.ssh 。 可以发现俩文件。 id_dsa 和 id_dsa.pub. 前者是密钥，后者是公钥.

3\. 添加public key到gerrit。 打开id_isa.pub, 复制内容。进入 gerrit->settings->SSH Publick
key->add key， 粘贴公钥内容。点击add。

4\. 修改 id_dsa id_dsa.pub .ssh 的权限. chmod 700

5\.  尝试 ssh -p 29418 @gerrit......com.  如果看到 下面文字表示成功。

   Welcome to Gerrit Code Review **



    Hi xxx, you have successfully connected over SSH.

    Unfortunately, interactive shells are disabled.

    To clone a hosted Git repository, use:

可能遇到的问题。

1\.  提示 could not create directory  .ssh... 原因可能是你的cygwin 环境没有初始化。
从开始菜单打开cygwin， 会看到会有一些初始化的工作。

2\.  如果遇到Permission denied (publickey). 那可能是你没有添加密钥到ssh-agent.  尝试ssh-add
id_dsa. 在add的时候如果遇到Could not open a connection to your authentication agent.
尝试ssh-agent bash. 然后再 ssh-add.  add 成功后再run ssh -p 29418 @gerrit......com
应该就可以看到 welcome的提示了。







注意：我使用的是rsa的算法



Ssh key为哪个用户添加哪个用户就可以使用ssh访问gerrit

