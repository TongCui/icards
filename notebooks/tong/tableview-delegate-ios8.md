<!-- 
title: TableViewDelelegate
from: work
create: 2018-11-06
tags: ios
-->

## UITableView delegate nil

```objective-c
// UITableView iOS 8 之前
@property(nonatomic, assign) id<UITableViewDataSource> dataSource
@property(nonatomic, assign) id<UITableViewDelegate> delegate
// UICollectionView iOS 8 之前
@property(nonatomic, assign)id<UICollectionViewDelegate> delegate
@property(nonatomic, assign) id<UICollectionViewDataSource> dataSource

// UITableView iOS 9中使用
@property(nonatomic, weak, nullable) id<UITableViewDataSource> dataSource
@property(nonatomic, weak, nullable) id<UITableViewDelegate> delegate
// UICollectionView iOS 9中使用
@property(nonatomic, weak, nullable) id<UICollectionViewDelegate> delegate
@property(nonatomic, weak, nullable) id<UICollectionViewDataSource> dataSource

```
