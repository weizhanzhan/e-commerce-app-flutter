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
           title:Text('京西'),
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
    return Column(
      children:[
        Container(
          height: 300,
          width: width,
          color:Colors.red,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //设置四周边框
                  border: new Border.all(width: 1, color: Colors.red),
                ),
                width: 500,
                height: 50,
                child:TextFileWidget()
              )
            ]
          ),
        )
      ]
    );
  }
}

///搜索控件widget
class TextFileWidget extends StatelessWidget {
  Widget buildTextField() {
    //theme设置局部主题
    return TextField(
      cursorColor: Colors.red, //设置光标
      decoration: InputDecoration(
          //输入框decoration属性
//            contentPadding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 1.0),
          contentPadding: new EdgeInsets.only(left: 0.0),
//            fillColor: Colors.white,
          border: InputBorder.none,
//            icon: Icon(Icons.search),
//            icon: ImageIcon(AssetImage("image/search_meeting_icon.png",),),
          icon: Icon(Icons.search),
           suffixIcon: GestureDetector(
            onTap: () {
              
            },
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.camera_alt),
            ),
          ),
          hintText: "Video name",

          hintStyle: new TextStyle(fontSize: 14, color: Colors.black)),
          style: new TextStyle(fontSize: 14, color: Colors.white),
          
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget editView() {
      return Container(
        //修饰黑色背景与圆角
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.0), //灰色的一层边框
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
        ),
        alignment: Alignment.center,
        height: 36,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: buildTextField(),
      );
    }

    var cancleView = new Text("cancle");

    return editView();

  }
}