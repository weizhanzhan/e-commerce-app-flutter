import 'package:flutter/material.dart';
import 'package:flutter_demo_list/provider/nav_provider.dart';
import 'package:provider/provider.dart';
import 'components/Layout.dart/index.dart';
void main() => runApp(ChangeNotifierProvider.value(
  value: BottomNavProvider(),
  child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home: Layout(),
    );
  }
}

