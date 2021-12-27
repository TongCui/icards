<!-- 
title: 六边形架构
from: work
create: 2021-12-27
tags: term,work,architecture
-->

## Hexagonal Architecture
- 六边形架构 [说明](https://juejin.cn/post/6844904056603820039)
- 解决什么问题？“软件应用程序的最大缺陷之一是业务逻辑渗透到用户界面代码中”
- 架构思想
	- 明确区分应用程序，领域和基础结构三个层 Explicitly separate Application, Domain, and Infrastructure
	- 依赖关系是从应用程序和基础结构再到领域 Dependencies are going from Application and Infrastructure to the Domain
	- 使用端口和适配器隔离它们的边界 We isolate the boundaries by using Ports and Adapters
- 设计图

![Hexagonal Architecture 1](https://raw.githubusercontent.com/TongCui/icards/master/notebooks/tong/images/hex-arch-1.webp)
![Hexagonal Architecture 2](https://raw.githubusercontent.com/TongCui/icards/master/notebooks/tong/images/hex-arch-2.webp)
![Hexagonal Architecture 3](https://raw.githubusercontent.com/TongCui/icards/master/notebooks/tong/images/hex-arch-3.webp)
![Hexagonal Architecture 4](https://raw.githubusercontent.com/TongCui/icards/master/notebooks/tong/images/hex-arch-4.webp)

