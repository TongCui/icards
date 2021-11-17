<!-- 
title: 缓存算法
from: work
create: 2021-11-17
tags: terms,algorithm
-->

## 常见缓存算法

- LFU(Least Frequently Used): 最近最不常用算法,根据数据的历史访问频率来淘汰数据
- LRU（Least Recently User） 最近最少使用算法,根据数据的历史访问记录来进行淘汰数据
- ARC(Adaptive Replacement Cache): 自适应缓存替换算法,它结合了LRU与LFU,来获得可用缓存的最佳使用。
- FIFO（First in First out），先进先出算法,最先进入的数据,最先被淘汰。
- 2Q（Two queues）有两个缓存队列，一个是FIFO队列，一个是LRU队列
