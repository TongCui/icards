<!-- 
title: 分布式系统的一些理论
from: paid-lessons
create: 2018-07-30
tags: tech,server
-->

## 分布式系统的一些理论

- CAP
  * Consistency 一致性
  	all nodes see the same data at the same time
  	更新操作成功并返回客户端，所有节点在同一时间的数据完全一致
  * Availability 可用性
  	Reads and writes always succeed
  	服务正常可用，并且在正常时间内相应
  * Partition tolerance 分区容错性
    The system continues to operate despite arbitrary message loss or failure of part of the system
    某节点坏掉或者分区网络故障时，仍能对外提供服务
- ACID - 数据库管理系统保证事务的正确性
  * Atomicity 原子性
  * Consistency 一致性
  * Isolation 隔离性
  * Durability 持久性
- BASE
  * Basically Available
  	允许损失部分可用性，保证主要功能
  * Soft State
  	系统存在中间状态，该状态不会影响系统整体可用性。
  	这个中间状态就是CAP中的数据不一致
  * Eventual Consistency
    所有数据副本经过一段时间后，最终一致