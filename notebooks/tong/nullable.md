<!-- 
title: oc nullable & _Nullable
from: work
create: 2018-07-24
tags: ios,work
-->

## ios nullable

- nullable is Objective C language syntax.  _Nullable is C language extension, which is inherited by Objective C.


- Functions and blocks are part of the C language, so you must use _Nullable in those declarations. Objective C method and property declarations can use either Objective C's nullable or C's _Nullable.


```objective-c
typedef void (^SuccessBlock)(NSArray* _Nullable transactions);

- (void)doSomething:(nullable SuccessBlock)successHandler;
```
