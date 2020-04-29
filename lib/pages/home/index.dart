import 'package:flutter/material.dart';
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
        body: Column(children: [HeaderBox(), MenuBox()]));
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
      height: 220,
      width: 600,
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 7.0,
          runSpacing: 20.0,
          alignment: WrapAlignment.spaceBetween,
          children: models.map((item){
                return Container(
                  width: 100,
                  child: Column(children: [
                      Container(
                        
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              color: item['color'],
                        ),
                        width: 60, 
                        height: 60,
                        margin: EdgeInsets.only(bottom:10.0),
                        alignment: Alignment.center,
                      
                        child: Text('${item['sub']}',style: TextStyle(color:Colors.white),)
                      ),
                      Text('${item['label']}')
                    ]
                  )
                );
          
          }).toList(),
    //         children: List.generate(10, (int index) {
    //   return Container(
    //     width: 100,
    //       child: Column(children: [
    //         Container(width: 50, height: 50, color: Colors.red),
    //         Text('鞋子')
    //       ]
    //      )
    //   );
    // })
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
        height: 300,
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
              Container(
                width: 500,
                height: 200,
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
              )
            ]),
        top: 80);
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
          height: 180,
          width: width,
          color: Colors.red,
        ));
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
              width: 500,
              height: 50,
              child: TextFileWidget())
        ]);
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
          contentPadding: new EdgeInsets.only(top: 12.0),
          fillColor: Colors.white,
          border: InputBorder.none,
          icon: Icon(Icons.search),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.camera_alt),
            ),
          ),
          hintText: "Video name",
          hintStyle: new TextStyle(fontSize: 14, color: Colors.black)),
      style: new TextStyle(fontSize: 14, color: Colors.black),
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
