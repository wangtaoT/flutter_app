import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MaterialApp(
    home: new LayoutDemo(),
  ));

  //沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("水平方向布局"),
      ),
      body: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print("点击红色按钮");
            },
            color: const Color(0xffff0000),
            child: new Text("红色按钮"),
          ),
          new RaisedButton(
            onPressed: () {
              print("点击蓝色按钮");
            },
            color: const Color(0xff000099),
          ),
          new RaisedButton(
            onPressed: () {
              print("点击粉色按钮");
            },
            color: const Color(0xffee9999),
            child: new Text("粉色按钮"),
          )
        ],
      ),
    );
  }
}
