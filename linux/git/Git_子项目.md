# Git 子项目

## 为当前工程添加submodule

git submodule add 仓库地址 路径

典型命令

git submodule add http://172.17.1.247:8180/topvision-terminal-webapp
EMS/EMS/Pandora/apps/terminal

## 删除submodule

1、在“.gitmodules”文件中删除相应配置信息

2、使用git rm -cached命令将子模块所在的文件从git中删除。



## 下载的工程带有submodule

当使用git clone下来的工程中带有submodule时，初始的时候，submodule的内容并不会自动下载下来的，此时，只需执行如下命令：

    
    
    git submodule update --init --recursive

即可将子模块内容下载下来后工程才不会缺少相应的文件。



