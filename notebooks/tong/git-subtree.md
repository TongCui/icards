<!-- 
title: git subtree
from: work
create: 2019-12-06
tags: work,tech,git
-->

## git-subtree

- git subtree 可以实现一个仓库作为其他仓库的子仓库
- 好处
	- 不用增加.gitmodule一类的文件
	- 对其他开发成员同名，看起来就是一个仓库
- 坏处
	- 新的指令
	- 指令比较复杂
- 使用

```
$ git subtree add --prefix=sub/libpng https://xxxx.xxxx.git master --squash
$ git subtree pull --prefix=sub/libpng https://xxxx.xxxx.git master --squash
$ git subtree push --prefix=sub/libpng https://xxxx.xxxx.git master

```

