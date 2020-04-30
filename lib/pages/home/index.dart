import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
          title: Text('京西'),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [HeaderBox(), MenuBox()])
          ),
        );
  }
}

class MenuBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var models = [
      { 'label':'京东超市','color':Colors.blueAccent,'sub':'超市'},
      { 'label':'京东超市','color':Colors.redAccent,'sub':'超市'},
      { 'label':'京东超市','color':Colors.greenAccent,'sub':'超市'},
      { 'label':'京东超市','color':Colors.orangeAccent,'sub':'超市'},
      { 'label':'京东超市','color':Colors.pinkAccent,'sub':'超市'},
      { 'label':'京东超市','color':Colors.purpleAccent,'sub':'超市'},
      { 'label':'京东超市','color':Colors.blueAccent,'sub':'超市'},
      { 'label':'京东超市','color':Colors.deepOrangeAccent,'sub':'超市'},
      { 'label':'京东超市','color':Colors.blueAccent,'sub':'超市'},
      { 'label':'京东超市','color':Colors.greenAccent,'sub':'超市'}
    ];
    return Container(
      height: ScreenUtil().setHeight(290),
      width: ScreenUtil.screenWidth,
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
        child: Wrap(
          spacing: ScreenUtil().setWidth(10),
          runSpacing: ScreenUtil().setWidth(20),
          alignment: WrapAlignment.spaceBetween,
          children: models.map((item){
            return Container(
              width: ScreenUtil().setWidth(120),
              child: Column(children: [
                Container(  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    color: item['color'],
                  ),
                  width: ScreenUtil().setWidth(80), 
                  height:ScreenUtil().setWidth(80),
                  margin: EdgeInsets.only(bottom:10.0),
                  alignment: Alignment.center,
                  child: Text('${item['sub']}',style: TextStyle(color:Colors.white,fontSize: ScreenUtil().setSp(20)),)
                ),
                Text('${item['label']}',style: TextStyle(fontSize: ScreenUtil().setSp(20)),)
              ]
            )
          );
        }
      ).toList(),
    ));
  }
}

//头部
class HeaderBox extends StatelessWidget {
  const HeaderBox({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Container(
        height: ScreenUtil().setHeight(360),
        color: Colors.white,
        child: Stack(children: [
          HeaderBg(width: width),
          InputSearch(),
          HeaderSwiper(width: width)
        ]));
  }
}

//头部swiper
class HeaderSwiper extends StatelessWidget {
  const HeaderSwiper({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:  Container(
            width: ScreenUtil().setWidth(680),
            height: ScreenUtil().setHeight(250),
            color: Colors.white,
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  "https://free.modao.cc/uploads4/images/3990/39901477/v2_pyl8in.jpg",
                  fit: BoxFit.fill,
                );
              },
              itemCount: 3,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
            ),
          ),
          )
         
        ]),
      top: ScreenUtil().setHeight(80),);
  }
}

//头部背景
class HeaderBg extends StatelessWidget {
  const HeaderBg({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        height: ScreenUtil().setHeight(220),
        width: width,
        color: Colors.red,
      )
    );
  }
}

//搜索框
class InputSearch extends StatelessWidget {
  const InputSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            //设置四周边框
            border: new Border.all(width: 1, color: Colors.red),
          ),
          width: ScreenUtil().setWidth(680),
          height:  ScreenUtil().setHeight(60),
          alignment: Alignment.center,
          child: TextFileWidget())
      ]);
  }
}

///搜索控件widget
class TextFileWidget extends StatelessWidget {

  Widget buildTextField() {
    print(ScreenUtil().setHeight(13));
    //theme设置局部主题
    return TextField(
      cursorColor: Colors.red, //设置光标
      
      decoration: InputDecoration(
        //输入框decoration属性
        // contentPadding: EdgeInsets.all(2),
        fillColor: Colors.white,
        border: InputBorder.none,
        icon: Icon(Icons.search),
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Icon(Icons.camera_alt),
        ),
        hintText: "Video name",
        hintStyle: new TextStyle(fontSize: ScreenUtil().setSp(24), color: Colors.black)),
      style: new TextStyle(fontSize: ScreenUtil().setSp(24), color: Colors.black,),
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
          borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
        ),
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: buildTextField(),
      );
    }

    var cancleView = new Text("cancle");

    return editView();
  }
}
