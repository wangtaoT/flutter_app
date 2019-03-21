import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "咨询详情",
          style: new TextStyle(color: Colors.white),
        ),
        iconTheme: new IconThemeData(color: Colors.w),
      ),
    );
  }
}
