<!-- 
title: import尖括号和引号
from: work
create: 2019-02-25
tags: ios,oc,work
-->

## #import尖括号和引号的区别

- 双引号代表引入本地工程文件
使用时，先查找用户目录下文件是否存在，User Header Search Paths，如果不存在，会继续查找库目录，System Header Search Paths
- 尖括号代表引入系统库的文件
只会查找库目录 System Header Search Paths, 如果失败了，不会继续查找用户目录
- pod引用，最好使用尖括号

