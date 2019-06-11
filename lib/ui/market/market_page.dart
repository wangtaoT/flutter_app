import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_config.dart';

class MarketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MarketPageState();
  }
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("市场"),
        ),
        body: new Center(
          child: null,
        ),
      ),
      theme: GlobalConfig.themeData,
    );
  }
}
