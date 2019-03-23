import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SlideView extends StatefulWidget {
  var data;

  SlideView(this.data);

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class SlideViewState extends State<SlideView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List slideData;

  SlideViewState(this.slideData);

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
        length: slideData == null ? 0 : slideData.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if (slideData != null && slideData.length > 0) {
      for (var i = 0; i < slideData.length; i++) {
        var item = slideData[i];
        // 图片URL
        var imgUrl = item['imgUrl'];
        // 资讯标题
        var title = item['title'];
        // 资讯详情URL
        var detailUrl = item['detailUrl'];
        items.add(new GestureDetector(
          onTap: () {
            // 点击页面跳转到详情
          },
          child: new Stack(
            children: <Widget>[
              new Image.network(imgUrl),
              new Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0x50000000),
                child: new Padding(
                  padding: const EdgeInsets.all(6),
                  child: new Text(
                    title,
                    style: new TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ));
      }
    }
    return new TabBarView(controller: tabController, children: items);
  }
}
