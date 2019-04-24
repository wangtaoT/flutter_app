import 'package:flutter/material.dart';
import 'package:flutter_app/model/company/company.dart';

class CompanyItem extends StatelessWidget {
  Company company;
  String heroLogo;
  VoidCallback onPressed;

  CompanyItem({Key key, this.company, this.onPressed, this.heroLogo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding:
            const EdgeInsets.only(left: 18, top: 10, right: 18, bottom: 10),
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Hero(
                      tag: heroLogo,
                      child: Image.network(
                        company.logo,
                        width: 40,
                      )),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Text(
                        company.company,
                        style: new TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Text(
                      company.info,
                      style: new TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
            new Container(
              decoration: new BoxDecoration(
                  color: new Color(0xFFF6F6F8),
                  borderRadius: new BorderRadius.all(new Radius.circular(6))),
              padding:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 8, right: 8),
              margin: const EdgeInsets.only(top: 12),
              child: Text(
                company.hot,
                style: new TextStyle(color: new Color(0xFF9fa3b0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
