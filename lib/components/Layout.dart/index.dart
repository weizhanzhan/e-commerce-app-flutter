import 'package:flutter/material.dart';
import 'package:flutter_demo_list/pages/account/index.dart';
import 'package:flutter_demo_list/pages/category/index.dart';
import 'package:flutter_demo_list/pages/find/index.dart';
import 'package:flutter_demo_list/pages/home/index.dart';
import 'package:flutter_demo_list/pages/shop_cart/index.dart';
import 'package:flutter_demo_list/provider/nav_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';



class Layout extends StatefulWidget {
  Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  static double bootomIconSize = ScreenUtil().setSp(48);
  static double bootomTextSize = ScreenUtil().setSp(30);
  List<BottomNavigationBarItem> _bottomNav = [
    BottomNavigationBarItem(icon: Icon(Icons.home,size: bootomIconSize),title: Text('首页',style: TextStyle(fontSize:bootomTextSize ),)),
    BottomNavigationBarItem(icon: Icon(Icons.category,size: bootomIconSize),title: Text('分类',style: TextStyle(fontSize:bootomTextSize ))),
    BottomNavigationBarItem(icon: Icon(Icons.find_in_page,size: bootomIconSize),title: Text('发现',style: TextStyle(fontSize:bootomTextSize ))),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,size: bootomIconSize),title: Text('购物车',style: TextStyle(fontSize:bootomTextSize ))),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle,size: bootomIconSize),title: Text('我的',style: TextStyle(fontSize:bootomTextSize )))
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
    // ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
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