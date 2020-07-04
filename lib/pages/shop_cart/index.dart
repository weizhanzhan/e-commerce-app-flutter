import 'package:flutter/material.dart';
import 'package:flutter_demo_list/components/SearchBar.dart';

class ShopCart extends StatefulWidget {
  ShopCart({Key key}) : super(key: key);

  @override
  _ShopCartState createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: '请输入商品名称查询',
        onPressed: (text) {
          print(text);
        },
      ),
      body: Container(),
    );
    // return Container(
    //    child: Text('ShopCart'),
    // );
  }
}
