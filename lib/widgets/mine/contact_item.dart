import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  String count;
  String title;
  VoidCallback onPressed;

  ContactItem({Key key, this.count, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: new Text(
              count,
              style: new TextStyle(fontSize: 18),
            ),
          ),
          new Text(
            title,
            style: new TextStyle(color: Colors.black54, fontSize: 14),
          )
        ],
      ),
    );
  }
}
