# Gerrit with ssh

## Windows下配置

### 生成密锁

1、鼠标右键，选择Git Bush here 打开git bush

2、执行ssh-keygen -t rsa -C
"[youname@dvt.dvt.com"](mailto:%22youname@dvt.dvt.com%22)

![](gerrit_ssh.files/image002.gif)

### 上传公key到gerrit

1、用editplus打开c:\Users\jay\\.ssh\id_rsa.pub

2、复杂在其中的内容

3、打开gerrit，并登陆账户

4、打开右上角账户标签，点选Setting

![](gerrit_ssh.files/image004.gif)

5、打开SSH Public Keys

6、点击ADD KEY

7、将id_rsa.pub的内容填入输入框中

8、点击add

![](gerrit_ssh.files/image006.gif)

### Ssh方式clone工程

1、使用gerrit提供的ssh clone链接来clone工程

![](gerrit_ssh.files/image008.gif)

2、或修改工程中.git/config文件中项目url为ssh链接

![](gerrit_ssh.files/image010.gif)

###  

