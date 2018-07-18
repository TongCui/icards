<!-- 
title: tbd文件
from: work
create: 2018-07-18
tags: term,xcode
-->

## tbd File

- tbd 是text-based stub libraries的意思， 是苹果在Xcode7中使用的一个技术，便于减少Xcode7中SDK的体积。
```
libxml2.2.tbd
libstdc++.tbd
libc++.tbd
```
- 平台 -- 对应的动态链接库所需要的架构
```
MacOSX (i386,x86_64)

iPhoneOS (armv7, armv7s, arm64)

iPhoneSimulator (i386,x86_64)

AppleTVOS (arm64)

AppleTVSimulator (x86_64)

WatchOS (armv7k)

WatchSimulator (i386)
```

- 每个平台的SDK都在对应的Developer/SDKs/的子目录下，比如iPhoneOS的sdk在/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk下

- tbd包含架构信息，以及在真实运行时候二进制所在的位置，以及包含了动态库的符号表还有类的一些信息，这些信息在编译阶段足够了

- 通过这种技术，可以大大减少所有的设备SDK的二进制动态库的体积，其中包含MacOSX，iPhoneOS，AppleTVOS，WatchOS。 

