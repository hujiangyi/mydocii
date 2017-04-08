1、由于公司的git服务器版本较低，需要安装的客户端为V1.7.7版本，故需要重新编译v1.7.7版本的git

2、从github.com下载并解压git源码

wget -O git-v1.7.7.tar.gz \--no-check-certificate
https://github.com/git/git/tarball/v1.7.7

tar xf git-v1.7.7.tar.gz

cd git-git-a258e47



3、也可以我们自己在本地克隆一个git版本库，当然前提是你自己已经安装了git的否则的话，这种方发你是用不了的，克隆版本库：

首先进入你要存放的目录，当然也可以不进入，git clone 默认的第二个参数就是你的路径，省略的话就是你当前的路径：

git clone git://git.kernel.org/pub/scm/git/git.git

克隆后默认会检出（checkout）当前最新的代码当然你也可以装以往的版本,执行下面命令可以检查出历史所有的版本

git tag

比如我当下想检出v1.7.8.2，这个版本，我只需执行以下命令就行：

git checkout v1.7.8.2



4、安装第三包依赖

asciidoc xsltproc xmlto make gcc curl curlftpfs libcurl3  libcurl4-gnutls-dev
libcurl4-openssl-dev



5、编译git

make prefix=/usr/local all doc



6、安装git

sudo make prefix=/usr/local install install-doc install-html



7、安装完成后运行git --version测试

8、











