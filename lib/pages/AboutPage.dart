import 'package:flutter/material.dart';
import 'CommonWebPage.dart';

// "关于"页面

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AboutPageState();
  }
}

class AboutPageState extends State<AboutPage> {
  bool showImage = false;
  TextStyle textStyle = new TextStyle(
      color: Colors.blue,
      decoration: new TextDecoration.combine([TextDecoration.underline]));
  Widget githubLink;
  List<String> urls = new List();
  List<String> titles = new List();

  AboutPageState() {
    titles.add("GitHub");
    urls.add("https://github.com/wangtaoT");
    githubLink = new GestureDetector(
      child: new Container(
        margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("GitHub："),
            new Text(
              "https://github.com/wangtaoT",
              style: textStyle,
            ),
          ],
        ),
      ),
      onTap: getLink(0),
    );
  }

  getLink(index) {
    String url = urls[index];
    String title = titles[index];
    return () {
      Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
        return new CommonWebPage(title: title, url: url);
      }));
    };
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("关于", style: new TextStyle(color: Colors.white)),
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Container(
                width: 1.0,
                height: 100.0,
                color: Colors.transparent,
              ),
              new Image.asset(
                './images/ic_osc_logo.png',
                width: 200.0,
                height: 56.0,
              ),
              new Text("基于Google Flutter的开源中国客户端"),
              githubLink,
              new Expanded(flex: 1, child: new Container()),
              new Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: new Text(
                    "本项目仅供学习使用，与开源中国官方无关",
                    style: new TextStyle(fontSize: 12.0),
                  ))
            ],
          ),
        ));
  }
}
