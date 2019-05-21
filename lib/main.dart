import 'package:flutter/material.dart';

void main() => runApp(Zhihu());

class Zhihu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "知乎",
      home: new Index(),
    );
  }
}
