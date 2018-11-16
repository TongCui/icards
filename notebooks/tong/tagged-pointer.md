<!-- 
title: Tagged Pointer 
from: work
create: 2018-11-16
tags: ios,work 
-->

## Tagged Pointer

- 解决64位cpu之后内存浪费的问题
- 专门来存储小的对象，例如NSNumber，NSDate
- Tagged Pointer指针的值不再是地址了，而是真正的值
	- 实际上已经不是一个对象了，而是一个披着对象皮的普通变量
	- 它的内存并不存储在堆中，也不需要malloc和free
- 内存读取比较快，创建非常快

