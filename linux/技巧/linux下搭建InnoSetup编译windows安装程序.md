## InnoSetup 命令行工具是 iscc.exe



## 在linux上安装wine，用于在linux上跑windows程序 iscc.exe



## 编辑iscc.sh脚本

#!/bin/sh  

               

# For installation and usage, please refer to my blog post:

# http://derekstavis.github.io/posts/creating-a-installer-using-inno-setup-on-
linux-and-mac-os-x/

#  

# The MIT License (MIT)

#  

# Copyright (c) 2014 Derek Willian Stavis

#  

# Permission is hereby granted, free of charge, to any person obtaining a copy

# of this software and associated documentation files (the "Software"), to
deal

# in the Software without restriction, including without limitation the rights

# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell

# copies of the Software, and to permit persons to whom the Software is

# furnished to do so, subject to the following conditions:

#  

# The above copyright notice and this permission notice shall be included in

# all copies or substantial portions of the Software.

#  

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR

# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,

# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE

# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER

# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM,

# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN

# THE SOFTWARE.





PROGRAMFILES=$1

SCRIPTNAME=$2



# Translate unix script path to windows path

PROGRAMFILES=$(winepath -w "$PROGRAMFILES" 2> /dev/null)

# Translate unix script path to windows path

SCRIPTNAME=$(winepath -w "$SCRIPTNAME" 2> /dev/null)

echo wine $PROGRAMFILES $SCRIPTNAME



# Compile!

wine "$PROGRAMFILES" "$SCRIPTNAME"



## 在编译文件中使用iscc打包应用程序



        <exec dir="${setup.dir}" executable="iscc" os="Linux">

            <env key="LANG" value="zh_CN.GBK" />

            <arg line="'${InnoSetup.dir}/ISCC.exe'" />

            <arg line="'${setup.dir}/setup.iss'" />

        </exec>

