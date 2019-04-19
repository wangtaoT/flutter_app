import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));

  //沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _userPhoneController = new TextEditingController();
    TextEditingController _userPasswordController = new TextEditingController();

    void onTextClear() {
      setState(() {
        _userPhoneController.text = "";
        _userPasswordController.text = "";
      });
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("登录"),
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            controller: _userPhoneController,
            keyboardType: TextInputType.number,
            decoration: new InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                icon: new Icon(Icons.phone),
                labelText: "请输入手机号"),
            onChanged: (String str) {
              print("最终手机号为$str-------------");
            },
          ),
          new TextField(
            controller: _userPasswordController,
            keyboardType: TextInputType.text,
            decoration: new InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                icon: new Icon(Icons.nature_people),
                labelText: "请输入名字"),
          ),
          new Builder(builder: (BuildContext context) {
            return new RaisedButton(
              onPressed: () {
                if (_userPasswordController.text.toString() == "10086" &&
                    _userPhoneController.text.toString() == "10086") {
                  Scaffold.of(context)
                      .showSnackBar(new SnackBar(content: new Text("校验通过")));
                } else {
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text("校验有问题，请重新输入")));
                  onTextClear();
                }
              },
              color: Colors.blue,
              highlightColor: Colors.deepPurple,
              disabledColor: Colors.cyan,
              child: new Text(
                "登录",
                style: new TextStyle(color: Colors.white),
              ),
            );
          })
        ],
      ),
    );
  }
}
