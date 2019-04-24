import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyState();
  }
}

class MyState extends State<MyApp> {
  List<ItemEntity> entityList = [];
  ScrollController _scrollController = new ScrollController();
  bool isLoadData = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("-----------------加载更多");
        _getMoreData();
      }
    });
    for (int i = 0; i < 10; i++) {
      entityList.add(ItemEntity("Item  $i", Icons.accessibility));
    }
  }

  Future<Null> _handleRefresh() async {
    print("-------------开始刷新");
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        entityList.clear();
        entityList = List.generate(10, (index) {
          return new ItemEntity("下拉刷新后-----item$index", Icons.accessibility);
        });
      });
    });
  }

  Future<Null> _getMoreData() async {
    await Future.delayed(Duration(seconds: 2), () {
      //模拟延时操作
      if (!isLoadData) {
        isLoadData = true;
        setState(() {
          isLoadData = false;
          List<ItemEntity> newList = List.generate(
              5,
              (index) => new ItemEntity(
                  "上拉加载--item ${index + entityList.length}",
                  Icons.accessibility));
          entityList.addAll(newList);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView"),
      ),
      body: RefreshIndicator(
          displacement: 50,
          color: Colors.redAccent,
          backgroundColor: Colors.blue,
          child: new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              if (index == entityList.length) {
                return LoadMoreView();
              } else {
                return ItemView(entityList[index]);
              }
            },
            itemCount: entityList.length + 1,
            controller: _scrollController,
          ),
          onRefresh: _handleRefresh),
    );
  }
}

class ItemEntity {
  String title;
  IconData iconData;

  ItemEntity(this.title, this.iconData);
}

class ItemView extends StatelessWidget {
  ItemEntity itemEntity;

  ItemView(this.itemEntity);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new Text(
            itemEntity.title,
            style: TextStyle(color: Colors.black87),
          ),
          new Positioned(
            child: Icon(
              itemEntity.iconData,
              size: 30,
              color: Colors.blue,
            ),
            left: 5,
          )
        ],
      ),
    );
  }
}

class LoadMoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Row(
            children: <Widget>[
              new CircularProgressIndicator(),
              Padding(padding: EdgeInsets.all(10)),
              Text('加载中...')
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
      color: Colors.white70,
    );
  }
}
