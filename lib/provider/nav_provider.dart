import 'package:flutter/material.dart';
class BottomNavProvider with ChangeNotifier{

  int bottomNavIndex = 0 ;

  void changeNavIndex(int index){
    if(this.bottomNavIndex != index){
      this.bottomNavIndex = index;
      notifyListeners();
    }
  }
}