import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_list/provider/nav_provider.dart';
import 'package:flutter_demo_list/utils/device_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'components/Layout.dart/index.dart';
void main() {
  runApp(ChangeNotifierProvider.value(
    value: BottomNavProvider(),
    child: MyApp()
    )
  );
   // 透明状态栏
  if (Device.isAndroid) {
    final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(201, 37, 25, 1)
      ),
      home: Layout(),
      
      builder: (BuildContext cxt,Widget w){
        ScreenUtil.init(cxt, width: 750, height: 1334, allowFontScaling: true);
        return w;
      }
    );
  }
}

