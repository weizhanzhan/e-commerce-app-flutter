import 'package:flutter/material.dart';
import 'package:flutter_demo_list/provider/category_provider.dart';
import 'package:flutter_demo_list/utils/tool.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_){
        var provider = new CategoryProvider();
        return provider;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('分类'), 
        ),
        body: Consumer<CategoryProvider>(
            builder: (_,mProvider,__){
              return  Container(
               child: 
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CategoryLeft(),              
                      CategoryRight()
                    ], 
                  )        
              );
            }
          )
      )
    );
  }
}

class CategoryRight extends StatelessWidget {
  const CategoryRight({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:1,
      child: SingleChildScrollView(
        
          child: Consumer<CategoryProvider>(
            
          builder: (_,mProvider,__){
            return Container(
            color:Colors.white,
            margin: EdgeInsets.all($.setWidth(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Text(mProvider.models[mProvider.currentTabIndex]), 
                CategoryItem(title:'热门分类',banner:true),
                CategoryItem(title:'推荐专区')
              ],
            ),
          );
        }),
      )
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final bool banner;
  const CategoryItem({
    Key key,this.title,this.banner = false
  }) : super(key: key);

  
  Widget getSwiperImg(){
    return Container(
      margin: EdgeInsets.only(top:$.setWidth(20),bottom:$.setWidth(40)),
      height: $.setHeight(200),
      child:new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "https://free.modao.cc/uploads4/images/3990/39902030/v2_pyl951.png",
            fit: BoxFit.fill,
          );
        },
        itemCount: 10,
        itemWidth: $.setWidth(350),
        layout: SwiperLayout.STACK,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    print(double.infinity);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all($.setWidth(10)),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: banner? getSwiperImg(): null,
          ),
          
          Text(title),
        
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            shrinkWrap: true,
             childAspectRatio: 0.8,
            children:List.generate(10, (index){
              return     Column(
              children: <Widget>[
                Image.network('https://free.modao.cc/uploads4/images/3984/39841665/v2_pyhhbc.png',width: $.setWidth(140),height: $.setHeight(140),),
                Text('华硕${index+1}',style: TextStyle(fontSize:$theme.f_12,))
              ],
            );
            })
          )
          // Wrap(
          //   children: getWidgetList(),
          // )
          // Wrap(
          //   // crossAxisAlignment:WrapCrossAlignment.end,
          //   spacing: $.setWidth(10),
          //   alignment:WrapAlignment.start,
          //   children: <Widget>[
          //   Column(
          //     children: <Widget>[
          //       Image.network('https://free.modao.cc/uploads4/images/3984/39841665/v2_pyhhbc.png',width: $.setWidth(140),height: $.setHeight(140),),
          //       Text('华硕',style: TextStyle(fontSize:$theme.f_12,))
          //     ],
          //   ),Column(
          //     children: <Widget>[
          //       Image.network('https://free.modao.cc/uploads4/images/3984/39841665/v2_pyhhbc.png',width: $.setWidth(140),height: $.setHeight(140),),
          //       Text('华硕',style: TextStyle(fontSize:$theme.f_12,))
          //     ],
          //   ),Column(
          //     children: <Widget>[
          //       Image.network('https://free.modao.cc/uploads4/images/3984/39841665/v2_pyhhbc.png',width: $.setWidth(140),height: $.setHeight(140),),
          //       Text('华硕',style: TextStyle(fontSize:$theme.f_12,))
          //     ],
          //   ),Column(
          //     children: <Widget>[
          //       Image.network('https://free.modao.cc/uploads4/images/3984/39841665/v2_pyhhbc.png',width: $.setWidth(140),height: $.setHeight(140),),
          //       Text('华硕',style: TextStyle(fontSize:$theme.f_12,))
          //     ],
          //   ),Column(
          //     children: <Widget>[
          //       Image.network('https://free.modao.cc/uploads4/images/3984/39841665/v2_pyhhbc.png',width: $.setWidth(140),height: $.setHeight(140),),
          //       Text('华硕',style: TextStyle(fontSize:$theme.f_12,))
          //     ],
          //   ),
          // ],)
        ],
      )
    );
  }
}


class CategoryLeft extends StatefulWidget {
  @override
  _CategoryLeftState createState() => _CategoryLeftState();
}

class _CategoryLeftState extends State<CategoryLeft> {
  @override
  Widget build(BuildContext context) {

    
    return SingleChildScrollView(child: Consumer<CategoryProvider>(
      builder: (_,mProvider,__){
        return Container(
          width: $.setWidth(160),
          color:Color.fromRGBO(248, 248, 248, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: mProvider.models.asMap().keys.map((index){
              bool isCurrent = mProvider.currentTabIndex == index;//是否是当前菜单
              return InkWell(
                onTap: (){
                  print(index);
                  mProvider.changeTabIndex(index);
                },
                child: Container(
                  width: $.setWidth(160),
                  padding: EdgeInsets.only(top: $.setWidth(16),bottom: $.setWidth(16)),
                  color: isCurrent?Colors.white:Colors.transparent,
                 
                  child: Container(
                    padding: EdgeInsets.only(left:$.setWidth(16)),
                    decoration: BoxDecoration(
                      border:Border(left:BorderSide(color: isCurrent ? Theme.of(context).primaryColor:Colors.transparent,width:$.setWidth(5))) 
                    ),
                    child: Text(mProvider.models[index],
                      style: TextStyle(
                        fontSize: $theme.f_14,
                        color: isCurrent?$theme.black1:$theme.grey1,
                        fontWeight: isCurrent?FontWeight.w600:FontWeight.w500
                      ),
                    ),
                  )
                ),
              );
            }).toList() 
          ), 
        );
      })
    );
  }
}
