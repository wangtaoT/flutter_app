import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'page/NewsListPage.dart';
import 'page/TweetsListPage.dart';
import 'page/DiscoveryPage.dart';
import 'page/MyInfoPage.dart';
import 'page/NewsDetailPage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyOSCClientState();
}

class MyOSCClientState extends State<MyApp> {
  // 页面底部当前tab索引值
  int _tabIndex = 0;

  // 页面内容区域
  var _body;

  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));

  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));
  var appBarTitles = ['资讯', '动弹', '发现', '我的'];
  var tabImages;

  //路由表
  Map<String, WidgetBuilder> _routes = new Map();

  // 传入图片路径，返回一个Image组件
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  // 数据初始化，包括TabIcon数据和页面内容数据
  void initData() {
    _routes["newsDetail"] = (BuildContext) {
      return new NewsDetailPage();
    };
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
    // IndexedStack是一个可以根据index来显示不同内容的组件，可以实现点击TabItem切换页面的功能
    _body = new IndexedStack(
      children: <Widget>[
        new NewsListPage(),
        new TweetsListPage(),
        new DiscoveryPage(),
        new MyInfoPage()
      ],
      index: _tabIndex,
    );
  }

  // 根据索引值确定Tab是选中状态的样式还是非选中状态的样式
  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  // 根据索引值确定TabItem的icon是选中还是非选中
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  // 根据索引值返回页面顶部标题
  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  List<BottomNavigationBarItem> getBottomNavItems() {
    List<BottomNavigationBarItem> list = new List();
    for (int i = 0; i < 4; i++) {
      list.add(new BottomNavigationBarItem(
          icon: getTabIcon(i), title: getTabTitle(i)));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      theme: new ThemeData(primaryColor: const Color(0xFF63CA6C)),
      routes: _routes,
      home: new Scaffold(
        appBar: new AppBar(
            title: new Text(appBarTitles[_tabIndex],
                style: new TextStyle(color: Colors.white)),
            iconTheme: new IconThemeData(color: Colors.white)),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: getBottomNavItems(),
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        // drawer属性用于为当前页面添加一个侧滑菜单
        drawer: new Drawer(
          child: new Center(child: new Text("this is a drawer")),
        ),
      ),
    );
  }
}
