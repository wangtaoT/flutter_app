import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new PullToRefreshDemo(),
  ));

//  //沉浸式状态栏
//  if (Platform.isAndroid) {
//    SystemUiOverlayStyle systemUiOverlayStyle =
//        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//  }
}

class PullToRefreshDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("文本输入"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text(
              "简单文本输入框",
              style: new TextStyle(fontSize: 20),
            ),
            new TextField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      gapPadding: 10, borderRadius: BorderRadius.circular(10)),
                  prefixIcon: new Icon(Icons.print),
                  contentPadding: const EdgeInsets.all(15)),
            )
          ],
        ),
      ),
    );
  }
}
