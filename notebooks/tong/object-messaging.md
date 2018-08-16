<!-- 
title: 对象间交互模式
from: casataloyum
create: 2018-07-30
tags: ios,tech
-->

## 对象间交互模式

- 直白交互（直接依赖）
	* (G)限制了实现手段的多样性，方便维护
	* (B)对业务上下文有依赖
- 轻度抽象
	* 多态
	* 接口
- Target-Action
- 响应式对象间交互
	* 命令式：命令仆人做饭，厨师端上来，然后你吃
	* 响应式：喊一声饿了，最后饭自己端上来了
- 基于闭包的对象间交互