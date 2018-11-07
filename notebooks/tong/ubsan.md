<!-- 
title: UBSan
from: work
create: 2018-11-07
tags: ios
-->

## UBSan

- Undefined Behavior Sanitizer
- sanitize - make clean and hygienic
- is an LLVM tool for C languages that detects undefined behavior at runtime
- such as dividing by zero, loading memory from a misaligned pointer, or dereferencing a null pointer
- How UBSan Works
	- The Undefined Behavior Sanitizer works by using Clang to emit checks into your code during compilation. 

- Performance Impact - an average 20% CPU overhead in the Debug configuration.
	
```
// Before
int32_t n = 42;
n += 17;

// After
int32_t n = 42;
if (SignedAdditionWillOverflow(n, 17)) {
    DiagnoseUndefinedBehavior();
}
n += 17;
```

