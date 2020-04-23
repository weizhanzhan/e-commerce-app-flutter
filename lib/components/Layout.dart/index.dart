import 'package:flutter/material.dart';
import 'package:flutter_demo_list/pages/account/index.dart';
import 'package:flutter_demo_list/pages/category/index.dart';
import 'package:flutter_demo_list/pages/find/index.dart';
import 'package:flutter_demo_list/pages/home/index.dart';
import 'package:flutter_demo_list/pages/shop_cart/index.dart';



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
      body: Text('ss'),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNav,
        selectedItemColor: Color.fromRGBO(250, 121, 32, 1),
        unselectedItemColor: Colors.black,
       ),
    );
  }
}