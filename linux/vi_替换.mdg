文件中替换

%s/匹配模式/替换模式/g

%s/ems.topvision.cn\/ems/172.17.1.247:8180/g



在文件中查找字符串

vimgrep /查找模式/[g][i] 目录

g单行列多次

i查询完毕跳转到首次出现

vimgrep /ems.topvision.cn\/ems/gj **/topvision-*/.git/config





多文件替换

args将目录添加到搜索列表

args **/topvision-*/.git/config

argdo 对所有:args列表中的文档执行命令

argdo 命令 |[update]  update表示要写入到文件中，否则只作替换而不写入

argdo %s/ems.topvision.cn\/ems/172.17.1.247:8180/g | update



argdo set fenc=utf-8 | update





