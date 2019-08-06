<!-- 
title: gitlab stat command
from: web
create: 2019-08-06
tags: shell,command
-->

## gitlab stat command

```
git log --author='cuitong' --since=2.weeks.ago --pretty=tformat: --numstat |awk '{add+=$1;subs+=$2;loc+=$1-$2;} END{print "adds : "add", subs : "subs" loc: "loc}' 
```

