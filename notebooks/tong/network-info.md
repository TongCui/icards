<!-- 
title: Network Info
from: working
create: 2018-07-13
tags: term,work
-->

## Network Info

- CNCopyCurrentNetworkInfo
```
CFDictionaryRef CNCopyCurrentNetworkInfo(CFStringRef interfaceName);
```
- iOS12 
```
enable the Access WiFi Information capability
```
- SSID
  * SSID（Service Set Identifier）
  * 通俗地说，SSID便是你给自己的无线网络所取的名字
  * 只有设置为名称相同SSID的值的电脑才能互相通信。
- BSSID
  * Basic Service Set (BSS)
  * 一群计算机设定相同的BSS名称，即可自成一个group，而此BSS名称，即所谓BSSID。
  * AP的Mac Address(6 bytes)，一個AP無線訊號所涵蓋的範圍即為BSS
  ```
  BSSID = "0:be:75:dd:18:f";
  ```