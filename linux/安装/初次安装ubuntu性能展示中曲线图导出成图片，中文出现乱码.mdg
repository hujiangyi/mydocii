# 初次安装ubuntu性能展示中曲线图导出成图片，中文出现乱码

## 问题表象



【测试结论】：ubuntu服务器下性能展示界面下载pdf图片时显示http error 500  
【测试步骤】：1登录ubuntu网管服务器，点击进入性能展示界面  
                         2 在趋势图里点击下载jpg png图片（见附件）   
                         3 下载图片汉字部分出现乱码，应该与汉字编码格式有关   
                         4 在windows网管服务器下未出现此情况   
【问题出现频率】固定出现



## 问题分析

### 问题1

Ubuntu server默认安装不带字体文件，导致用到字体文件的功能出现乱码

安装字体文件

1、拷贝[simhei.ttf](http://ems.top-
vision.cn:8110/resources/fonts/simhei.ttf)文件到/usr/share/fonts 目录下

simhei.ttf文件下载地址：http://ems.top-vision.cn:8110/resources/fonts/simhei.ttf

2、执行mkfontscale

3、执行mkfontdir

4、执行fc-cache -fv

### 问题2

Mkfontscale 命令找不到

执行 sudo apt-get install ttf-mscorefonts-installer

### 问题3

Fc-cache 命令找不到

执行sudo apt-get install fontconfig







