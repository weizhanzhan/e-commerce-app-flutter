import 'package:flutter/material.dart';

class ShopCart extends StatefulWidget {
  ShopCart({Key key}) : super(key: key);

  @override
  _ShopCartState createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('ShopCart'),
    );
  }
}