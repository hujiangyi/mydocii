对命令结果进行统计



awk '{++s[$1]} END {for(k in s) print k,s[k]}'



统计第一列出现的个数

