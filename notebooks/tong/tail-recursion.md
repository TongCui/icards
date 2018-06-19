<!-- 
title: 尾递归
from: 算法导论
create: 2018-06-19
tags: algorithm,term
-->

## 尾递归

- 特点
  * 递归调用是整个函数体中最后执行的语句
  * 返回值不属于表达式的一部分
- 编译器优化
```
def recsum(x)
  if x == 1
    return x
  else
    return x + recsum(x - 1)
  end
end

$ recsum(5)
$ 5 + recsum(4)
$ 5 + (4 + recsum(3))
...
$ 5 + (4 + (3 + (2 + 1)))

def tailrecsum(x, total = 0)
  if x == 0
    return total
  else
    return tailrecsum(x - 1, total + x)
  end
end

tailrecsum(5, 0)
tailrecsum(4, 5)
tailrecsum(3, 9)
tailrecsum(2, 12)
tailrecsum(1, 14)
tailrecsum(0, 15)
15

```