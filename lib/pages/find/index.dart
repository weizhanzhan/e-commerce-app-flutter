import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FindPage extends StatefulWidget {
  FindPage({Key key}) : super(key: key);

  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> with SingleTickerProviderStateMixin {

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
    return Scaffold(
      body:  Column(
        children: <Widget>[
          Container(
            child: TabBar(
              isScrollable: true,
              labelStyle: TextStyle(fontSize: ScreenUtil().setSp(32)),
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
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Text('11'),
                Text('22'),
                Text('33'),
                Text('44'),
                Text('55'),
                Text('66')
              ]
            ),
          )
        ],
      ),
    );
  }
}