import 'package:flutter/material.dart';
import 'package:flutter_app/ui/my/follow.dart';
import 'package:flutter_app/ui/my/recommend.dart';
import 'package:flutter_app/view/global_config.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Widget barSearch() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new FlatButton.icon(
            onPressed: () {
//              Navigator.of(context)
//                  .push(new MaterialPageRoute(builder: (context) {
//                return new SearchPage();
//              }));
            },
            icon: new Icon(Icons.search,
                color: GlobalConfig.fontColor, size: 16.0),
            label: new Text(
              "坚果R1摄像头损坏",
              style: new TextStyle(color: GlobalConfig.fontColor),
            ),
          )),
          new Container(
            decoration: new BoxDecoration(
                border: new BorderDirectional(
                    start: new BorderSide(
                        color: GlobalConfig.fontColor, width: 1))),
            height: 14,
            width: 1,
          ),
          new Container(
            child: new FlatButton.icon(
                onPressed: () {},
                icon: new Icon(
                  Icons.border_color,
                  color: GlobalConfig.fontColor,
                  size: 14,
                ),
                label: new Text(
                  "提问",
                  style: new TextStyle(color: GlobalConfig.fontColor),
                )),
          )
        ],
      ),
      decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4)),
          color: GlobalConfig.searchBackgroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            title: barSearch(),
            bottom: new TabBar(
              labelColor: GlobalConfig.dark == true
                  ? new Color(0xFF63FDD9)
                  : Colors.blue,
              unselectedLabelColor:
                  GlobalConfig.dark == true ? Colors.white : Colors.black,
              tabs: [
                new Tab(text: "关注"),
                new Tab(text: "推荐"),
                new Tab(text: "热榜"),
              ],
            ),
          ),
          body: new TabBarView(
              children: [new Follow(), new Recommend(), new Hot()]),
        ));
  }
}
