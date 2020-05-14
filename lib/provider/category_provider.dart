import 'package:flutter/material.dart';
class CategoryProvider with ChangeNotifier{

  int currentTabIndex = 0 ;
  var models = [
    '推荐分类','京西超市','国际名牌','奢侈品','海囤全球','唯品会','男装','女装','男鞋','女鞋', '推荐分类','京西超市','国际名牌','奢侈品','海囤全球','唯品会','男装','女装','男鞋','女鞋','京西超市','国际名牌','奢侈品','海囤全球','唯品会','男装','女装','男鞋','女鞋'
  ];
  void changeTabIndex(int index){
    if(this.currentTabIndex != index){
      this.currentTabIndex = index;
      notifyListeners();
    }
  }
}