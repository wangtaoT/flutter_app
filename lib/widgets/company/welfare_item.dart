import 'package:flutter/material.dart';

class WelfareItem extends StatelessWidget {
  IconData iconData;
  String title;

  WelfareItem({this.iconData, this.title});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 100,
      height: 120,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: Colors.white, width: 0.25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
            size: 32,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
          ),
          Text(
            title,
            style: new TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
