<!-- 
title: UIScrollViewDelegate
from: work
create: 2018-11-09
tags: jianshu
-->

## UIScrollViewDelegate

- 手指滑动
```
- scrollViewWillBeginDragging => 1
- scrollViewDidScroll => n
- scrollViewWillEndDragging => 1
- scrollViewDidEndDragging => 1
- scrollViewWillBeginDecelerating => 1
- scrollViewDidScroll => n
- scrollViewDidEndDecelerating => 1
```

- 返回顶部
```
- scrollViewShouldScrollToTop => 1
- scrollViewDidScroll => n
- scrollViewDidScrollToTop => 1
```

- setAnimated
```
- scrollViewDidScroll => n
- scrollViewDidEndScrollingAnimation => 1
```


