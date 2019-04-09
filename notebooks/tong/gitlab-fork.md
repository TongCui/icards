<!-- 
title: Gitlab form github
from: work
create: 2019-04-08
tags: git,work
-->

## gitlab fork github project

```shell
$ git remote add upstream https:/github.com/xxx/xxx.git
$ git remote -v
origin git@xxxx.git (fetch)
origin git@xxxx.git (push)
upstream https://github.com/xxx.git (fetch)
upstream https://github.com/xxx.git (push)
$ git fetch upstream
$ git merge upstream/master
$ git push origin master
```
