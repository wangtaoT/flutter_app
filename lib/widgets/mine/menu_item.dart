import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onPressed;

  MenuItem({Key key, this.icon, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 12, right: 20, bottom: 10),
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                  ),
                  child: new Icon(
                    icon,
                    color: Colors.black54,
                  ),
                ),
                new Expanded(
                    child: new Text(
                  title,
                  style: new TextStyle(color: Colors.black54, fontSize: 16),
                )),
                new Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: new Divider(),
          )
        ],
      ),
    );
  }
}
