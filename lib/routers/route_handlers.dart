import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_list/components/Layout.dart/index.dart';
import 'package:flutter_demo_list/components/Search.dart';

/// 跳转到主页
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Layout();
});

/// 跳转到首页Splash
var searchHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new SearchPage();
});
