<!-- 
title: CFAbsoluteTimeGetCurrent & CACurrentMediaTime
from: work
create: 2019-12-16
tags: ios,tech,term
-->

## CFAbsoluteTimeGetCurrent vs CACurrentMediaTime

- CFAbsoluteTimeGetCurrent() 返回的时钟时间会与网络时间同步，可能受时区，夏令时等影响
- CACurrentMediaTime() 是内置时钟，更准确和原子 more accurately and atomically, 不受外界时钟影响
- CACurrentMediaTime() will be reset after the system restarts.

[link](https://topic.alibabacloud.com/a/the-difference-between-nsdate-cfabsolutetimegetcurrent-and-cacurrentmediatime_8_8_31573850.html)

