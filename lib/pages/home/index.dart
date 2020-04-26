import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(  
       
        appBar: AppBar(
         
          elevation: 0.0,
           title:Text('哈哈'),
           backgroundColor: Colors.red,
        ),
        body:Column(
          children:[
            HeaderBox()
          ]
        )
    ); 
  }
}

class HeaderBox extends StatelessWidget {
  const HeaderBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size =MediaQuery.of(context).size;
    final width =size.width;
    return Container(
      padding:EdgeInsets.zero,
      margin: EdgeInsets.zero,
      height: 500,
      width: width,
      color:Colors.red,
      child: Text('你好'),
    );
  }
}