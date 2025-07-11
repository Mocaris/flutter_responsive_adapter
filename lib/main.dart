import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:lib_screen_adapter/screen_adapter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (BuildContext context) {
        return ProportionAdapter(
          targetDpi: 375,
          // data: MediaQuery.of(context)
          //     .copyWith(textScaler: TextScaler.linear(2.0)),
          builder: (BuildContext context, _) {
            return MaterialApp(
              useInheritedMediaQuery: true,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              builder: (context, child) {
                // return SizedBox.expand(child: child);
                return MyHomePage(title: 'Flutter Demo Home Page');
              },
              // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ResponsiveLayoutBuilder(
              builder: (BuildContext context, ResponsiveScreen screen) {
                return Text(
                  "14sp 当前屏幕 ${screen.screenSize} ${screen.screenType}",
                  style: TextStyle(fontSize: 14.sp),
                );
              },
            ),
            Row(
              spacing: 10.dp,
              children: [
                Container(
                  width: 118.dp,
                  height: 118.dp,
                  color: Colors.red,
                ),
                Container(
                  width: 118.dp,
                  height: 118.dp,
                  color: Colors.green,
                ),
                Container(
                  width: 118.dp,
                  height: 118.dp,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
            Text(
              '屏幕适配 14',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              '屏幕适配 14.dp',
              style: TextStyle(fontSize: 14.dp),
            ),
            Text(
              '屏幕适配 14.sp ${14.sp}',
              style: TextStyle(fontSize: 14.sp),
            ),
            Text(
              '屏幕适配 14.spf ${14.spf}',
              style: TextStyle(fontSize: 14.spf),
            ),
            Text(
              '屏幕适配 20.dp ${20.dp}',
              style: TextStyle(fontSize: 20.dp),
            ),
            Text(
              '屏幕适配 20 ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '屏幕适配 20.sp ${20.sp}',
              style: TextStyle(fontSize: 20.sp),
            ),
            Text(
              '屏幕适配 20.spf ${20.spf}',
              style: TextStyle(fontSize: 20.spf),
            ),
            Text(
              '屏幕适配 30.dp ${30.dp}',
              style: TextStyle(fontSize: 30.dp),
            ),
            Text(
              '屏幕适配 30.sp ${30.sp}',
              style: TextStyle(fontSize: 30.sp),
            ),
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 14.sp),
            ),
            Text(
              '口' * 26,
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
