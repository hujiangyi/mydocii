**修改****refs/meta/config**

从Google镜像的**Android**仓库，有的项目里含有refs/meta/config这个分支，这个是git仓库配置用的，在gerrit里显示在Pr
ojects -> Access里面，有时我们可能要对其做些修改。我们直接clone项目时这个分支不会同步，需要手动fetch

git fetch origin refs/meta/config:config

git checkout config

//modify the files

git push origin config:refs/meta/config



