<!-- 
title: Flutter Types
from: work
create: 2019-09-19
tags: flutter, type
-->

## Flutter Platform channel data types

[flutter documentation](https://flutter.dev/docs/development/platform-integration/platform-channels)

| Dart | Android | iOS |
|---|---|---|
| null | null | nil |
| bool | java.lang.Boolean | NSNumber numberWithBool: |
| int | java.lang.Integer | NSNumber numberWithInt: |
| int, if 32 bits not enough | java.lang.Long | NSNumber numberWithLong: |
| double | java.lang.Double | NSNumber numberWithDouble: |
| String | java.lang.String | NSString |
| Uint8List | byte[] | FlutterStandardTypeData typedDataWithBytes: |
| Int32List | int[] | FlutterStandardTypeData typedDataWithInt32: |
| Int64List | long[] | FlutterStandardTypeData typedDataWithInt64: |
| Float64List | double[] | FlutterStandardTypeData typedDataWithFloat64: |
| List | java.util.ArrayList | NSArray |
| Map | java.util.HashMap | NSDictionary |

