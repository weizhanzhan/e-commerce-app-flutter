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
            children: [
              HeaderBox(),
              MenuBox(),
              Seckill(),
              SeckillCategory(),
              Recommend()
            ])
          ),
        );
  }
}
class Recommend extends StatefulWidget {
  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this,length: 6);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        
        children: <Widget>[
          TabBar(
            labelColor: Colors.grey,
            tabs: <Widget>[
              Tab(text: "热门",),
              Tab(text: "推荐"),
              Tab(text: "关注"),
              Tab(text: "收藏"),
              Tab(text: "新增"),
              Tab(text: "点赞"),
            ],
            controller: _tabController,  // 记得要带上tabController
          ),
         

        ],
      )
    );
  }
}
class SeckillCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   var models = [
      { 'label':'品牌秒杀','color':Colors.blueAccent,'sub':'品质好物秒'},
      { 'label':'品类秒杀','color':Colors.redAccent,'sub':'低至1588'},
      { 'label':'新品首发','color':Colors.greenAccent,'sub':'华为智慧屏'},
      { 'label':'排行榜','color':Colors.orangeAccent,'sub':'跟榜购好物'},
      { 'label':'招牌闪购','color':Colors.pinkAccent,'sub':'享惊喜折扣'},
      { 'label':'好味道','color':Colors.purpleAccent,'sub':'寻找美食'},
      { 'label':'京西视频','color':Colors.blueAccent,'sub':'好物种草'},
      { 'label':'逛好店','color':Colors.deepOrangeAccent,'sub':'找点新鲜'},
    ];
    return Container(
      // height: ScreenUtil().setHeight(350),
      width: ScreenUtil.screenWidth,
      
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
        child: Wrap(
          spacing: ScreenUtil().setWidth(10),
          runSpacing: ScreenUtil().setWidth(20),
          alignment: WrapAlignment.spaceBetween,
          children: models.map((item){
            return Container(
              width: ScreenUtil().setWidth(150),
              child: Column(children: [
                Text(item['label'],style: TextStyle(
                  fontSize: ScreenUtil().setSp(32)
                ),),
                Container(
                  margin: EdgeInsets.only(top:ScreenUtil().setHeight(12)),
                  child:  Text(item['sub'],style: TextStyle(
                    fontSize: ScreenUtil().setSp(24),
                    color: item['color'],
                    
                  )),
                ),
                 Image.network('https://free.modao.cc/uploads4/images/3984/39841665/v2_pyhhbc.png',width: ScreenUtil().setWidth(150),),
                // Text('${item['label']}',style: TextStyle(fontSize: ScreenUtil().setSp(20)),)
              ]
            )
          );
        }
      ).toList(),
    ));
  }
}
//秒杀
class Seckill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Expanded(
            flex: 4,
            child:Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('京西秒杀',style: TextStyle(
                      fontSize: ScreenUtil().setSp(32)
                    ),),
                    Container(
                      margin: EdgeInsets.only(left:ScreenUtil().setWidth(10)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        //设置四周边框
                        border: new Border.all(width: 1, color: Colors.red),
                      ),
                      child: Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            color: Color.fromRGBO(247, 49, 24, 1),
                            child: Text('8点场', style:TextStyle(
                              fontSize: ScreenUtil().setSp(24),
                              color: Colors.white
                            )),
                          ),
                          Container(
                             padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                             child: Text('01:40:41', style:TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color.fromRGBO(247, 49, 24, 1),
                                height: 1.3
                              )), 
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(right:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SeckillItem(),
                      SeckillItem(),
                      SeckillItem()
                    ],
                  ),
                )
              ],
            )
          ),
           Expanded(
            flex: 3,
            child:Container(
              padding: EdgeInsets.only(left:ScreenUtil().setWidth(2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('发现好货',style: TextStyle(
                     fontSize: ScreenUtil().setSp(32)
                  ),),
                  Text('品质新生活',style: TextStyle(
                     fontSize: ScreenUtil().setSp(24),
                     color: Color.fromRGBO(65, 225, 137, 1)
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                       Image.network('https://free.modao.cc/uploads4/images/3984/39841665/v2_pyhhbc.png',width: ScreenUtil().setWidth(150),),
                       Image.network('https://free.modao.cc/uploads4/images/3984/39841665/v2_pyhhbc.png',width: ScreenUtil().setWidth(150),),
                    ],
                  )
                ],
              ),
            )
          )
        ]
      ),
    );
  }
}
//单个秒杀项目
class SeckillItem extends StatelessWidget {
  const SeckillItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network('https://free.modao.cc/uploads4/images/3984/39841665/v2_pyhhbc.png',width: ScreenUtil().setWidth(120),),
          Row(
           children: <Widget>[
             Text('￥',style: TextStyle(
               fontSize: ScreenUtil().setSp(20)
             ),),
             Text('8999',style: TextStyle(
               fontSize: ScreenUtil().setSp(24),
               height: 1.3
             ),)
           ], 
          ),
          Row(
           children: <Widget>[
             Text('￥',style: TextStyle(
               fontSize: ScreenUtil().setSp(18),
                decoration: TextDecoration.lineThrough,
               color: Colors.grey
             ),),
             Text('8999',style: TextStyle(
               fontSize: ScreenUtil().setSp(20),
               height: 1.3,
               decoration: TextDecoration.lineThrough,
               color: Colors.grey
             ),)
           ], 
          )
        ],
      ),
    );
  }
}
//菜单
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
      // height: ScreenUtil().setHeight(350),
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
