# 屏幕适配
导入组件
```dart
import 'package:lib_screen_adapter/screen_adapter.dart';
```

## ProportionAdapter 等比缩放组件



example:
```dart
  ProportionAdapter(
    targetDpi: 375,
    builder: (BuildContext context, _) {
      return MaterialApp(
        useInheritedMediaQuery: true,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: (context, child) {
          return MyHomePage(title: 'Flutter Demo Home Page');
        },
      );
    },
  );
```
### 单位适配
#### dp
```dart
Text(
'屏幕适配 20.dp ${20.dp}',
style: TextStyle(fontSize: 20.dp),
),
```
#### sp
```dart
Text(
'屏幕适配 20.sp ${20.sp}',
style: TextStyle(fontSize: 20.sp),
)
```

## ResponsiveLayoutBuilder 响应式布局组件

example:
```dart
  ResponsiveLayoutBuilder(
    builder: (BuildContext context, ResponsiveScreen screen) {
      return Text(
        "14sp 当前屏幕 ${screen.screenSize} ${screen.screenType}",
      );
    },
  ),
```