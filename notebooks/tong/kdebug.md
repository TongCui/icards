<!-- 
title: oc统计方法调用次数
from: work
create: 2019-07-03
tags: work,tech
-->

## kdebug

```
#import <sys/kdebug_signpost.h>
kdebug_signpost_start(10, 0, 0, 0, 8);
kdebug_signpost_end(10, 0, 0, 0, 8);
```
