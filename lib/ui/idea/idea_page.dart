import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_config.dart';

class IdeaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IdeaPageState();
  }
}

class _IdeaPageState extends State<IdeaPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("想法"),
          actions: <Widget>[new Container()],
        ),
        body: new Center(
          child: null,
        ),
      ),
      theme: GlobalConfig.themeData,
    );
  }
}
