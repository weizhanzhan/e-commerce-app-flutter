import 'package:flutter/material.dart';
import 'package:flutter_demo_list/pages/account/index.dart';
import 'package:flutter_demo_list/pages/category/index.dart';
import 'package:flutter_demo_list/pages/find/index.dart';
import 'package:flutter_demo_list/pages/home/index.dart';
import 'package:flutter_demo_list/pages/shop_cart/index.dart';
import 'package:flutter_demo_list/provider/nav_provider.dart';
import 'package:provider/provider.dart';



class Layout extends StatefulWidget {
  Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  List<BottomNavigationBarItem> _bottomNav = [
    BottomNavigationBarItem(icon: Icon(Icons.access_alarms),title: Text('sdsd')),
    BottomNavigationBarItem(icon: Icon(Icons.access_alarms),title: Text('sdsd')),
    BottomNavigationBarItem(icon: Icon(Icons.access_alarms),title: Text('sdsd')),
    BottomNavigationBarItem(icon: Icon(Icons.access_alarms),title: Text('sdsd')),
    BottomNavigationBarItem(icon: Icon(Icons.access_alarms),title: Text('sdsd'))
  ];
  var _currentIndex = 0;
   List<Widget> _pageList = [
    HomePage(),
    CategoryPage(),
    FindPage(),
    ShopCart(),
    AccountPage(),
  
  ];
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body:Consumer<BottomNavProvider>(
        builder: (_,mProvier,__)=>IndexedStack(
          index: mProvier.bottomNavIndex,
          children:_pageList,
        )
      ),
      bottomNavigationBar:Consumer<BottomNavProvider>(
        builder: (_,mProvider,__){
          return  BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _bottomNav,
            currentIndex: mProvider.bottomNavIndex,
            onTap: (int index){
              mProvider.changeNavIndex(index);
            },
          );
        },
      )
    );
  }
}