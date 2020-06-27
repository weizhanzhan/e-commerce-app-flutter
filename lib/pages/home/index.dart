import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_list/components/WTab.dart';
import 'package:flutter_demo_list/utils/tool.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
          backgroundColor: Theme.of(context).primaryColor,
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
    _tabController = TabController(vsync: this,length: 5);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    const models = [
      { 'title':'精选','sub-title':'为你推荐'},
      { 'title':'欢度十一','sub-title':'爆款巡礼'},
      { 'title':'超市','sub-title':'百货生鲜'},
      { 'title':'电器','sub-title':'3C家电'},
      { 'title':'生活','sub-title':'居家日用'},
    ];
    var length = ScreenUtil.screenWidth / 2 * (3.2/2) ;
    var count = 10;
    var listCount = (count/2).roundToDouble();
    return Container(
       height:  (listCount/2).roundToDouble() * length,
      child: Column(
        children: <Widget>[
        
          Container(
            height: $.setWidth(120),
            child: TabBar(

              isScrollable: true,
              indicatorColor: Theme.of(context).primaryColor ,
              indicatorPadding: EdgeInsets.only(left:ScreenUtil().setWidth(60),right:ScreenUtil().setWidth(60)),
              labelStyle: TextStyle(fontSize: ScreenUtil().setSp(32)),
              labelColor: Colors.grey,
              tabs: models.map((item){
                return WTab(
                  theight: $.setWidth(100),

                  child: Container(
                  child: Column(
                  children: <Widget>[
                    Text('${item['title']}',style: TextStyle(fontSize: ScreenUtil().setSp(32),color: Color.fromRGBO(19, 18, 18, 1)),),
                    Text('${item['sub-title']}',style: TextStyle(fontSize: ScreenUtil().setSp(24),color: $theme.grey1),)
                  ]),
                )
                );
              }).toList(),
              controller: _tabController,  // 记得要带上tabController
            ), 
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  color: Colors.transparent,
                  child: new StaggeredGridView.countBuilder(
                    physics:NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    itemCount: count,
                    itemBuilder: (BuildContext context, int index) => new Container(
                      color: Colors.white,
                        child: new Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.network('https://free.modao.cc/uploads4/images/3984/39841665/v2_pyhhbc.png',width: ScreenUtil().setWidth(360),),
                              Container(
                                padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                                      height: $.setHeight(50),
                                      color: Color.fromRGBO(237, 65, 51, 100),
                                      child: Center(
                                        child: Text('京西物流',style: TextStyle(
                                       color: Colors.white,
                                      //  height: 1.4,
                                       fontSize: $.setSp(24)
                                      )),
                                      )
                                    ),
                                    Text('Apple 2019款',style: TextStyle(
                                     fontSize: $.setSp(28) 
                                    ),)
                                  ],
                                ), 
                              ),
                              Container(
                               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                               child: Text('Macbook Pro 13.3苹果笔记本电脑',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                   fontSize:  $.setSp(28) 
                                  ),
                                ), 
                              ),
                              Container(
                                 padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: <Widget>[
                                   Row(
                                    children: <Widget>[
                                      Text('￥8999.00',style: TextStyle(
                                        fontSize: $.setSp(28),
                                        color: Theme.of(context).primaryColor
                                      ),),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).primaryColor, width: 1.0),
                                        ), 
                                        child: Text('满减',style: TextStyle(
                                        color: Theme.of(context).primaryColor ,
                                        fontSize: $.setSp(24)
                                        ),),
                                      )
                                    ]),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                       border: Border.all(color: $theme.grey1,width: 1.0),
                                       borderRadius: BorderRadius.all(Radius.circular(10)) 
                                      ),
                                      child: Text('看相似',style: TextStyle(fontSize: $.setSp(24)),),  
                                    )
                                 ], 
                                ),
                              )
                              ,
                              index%2==1 ? Container(
                                padding: EdgeInsets.only(left:10,top: 10),
                                child:Row(
                                 children: <Widget>[
                                   Icon(Icons.hot_tub,size: 16,color: Colors.red,),
                                   Text('电子热卖榜第2名',style: TextStyle(
                                    fontSize: $.setSp(24) 
                                   ),)
                                 ], 
                                ),
                              ) : Container(
                                height: 0,
                              )
                            ],
                          )
                        )),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index%2==1 ? 3.1 : 2.9),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
                Text('11'),
                Text('11'),
                Text('11'),
                Text('11')
              ]
            ),
          )
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

class Seckill extends StatefulWidget {
  @override
  _SeckillState createState() => _SeckillState();
}

class _SeckillState extends State<Seckill> {

  String times = '00:00:00';
  void timeFunc(){
    const period = const Duration(seconds: 1);
    Timer.periodic(period, (timer) {
      var now = new DateTime.now();
   
      setState(() {
      
        times = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
      });
    });
  }

  @override
  void initState() { 
    super.initState();
    timeFunc();
    
  }
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
                             child: Text(times, style:TextStyle(
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
                  width: ScreenUtil().setWidth(100), 
                  height:ScreenUtil().setWidth(100),
                  margin: EdgeInsets.only(bottom:10.0),
                  alignment: Alignment.center,
                  child: Text('${item['sub']}',style: TextStyle(color:Colors.white,fontSize: ScreenUtil().setSp(24)),)
                ),
                Text('${item['label']}',style: TextStyle(fontSize: ScreenUtil().setSp(22),color: Colors.grey),)
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
              // indicatorLayout: ,
              // pagination: (),
              // control: new SwiperControl(),
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
        color: Theme.of(context).primaryColor,
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
    //theme设置局部主题
    return TextField(
      cursorColor: Colors.red, //设置光标
      
      decoration: InputDecoration(
        //输入框decoration属性
        // contentPadding: EdgeInsets.all(2),
        fillColor: Colors.white,
        border: InputBorder.none,
        icon: GestureDetector(
          onTap: () {
            print('搜索');
          },
          child:  Icon(Icons.search,size: ScreenUtil().setSp(36),),
        ),
        
        
        suffixIcon: GestureDetector(
          onTap: () {
            print('相机');
          },
          child: Icon(Icons.camera_alt,size: ScreenUtil().setSp(36),),
        ),
        hintText: "家居/数码/美食",
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


