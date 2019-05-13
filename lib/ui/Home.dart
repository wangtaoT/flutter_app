import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/models/Gank.dart';
import 'package:flutter_app/models/GankItem.dart';
import 'package:flutter_app/ui/comm/LoadingPage.dart';
import 'package:flutter_app/ui/comm/MyDrawer.dart';
import 'package:flutter_app/ui/comm/MyWebview.dart';

enum AppBarBehavior { normal, pinned, floating, snapping }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Map<String, List<GankItem>> ganks = Map<String, List<GankItem>>();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    try {
      Response response = await Dio().get("http://gank.io/api/today");
      Gank gank = Gank.fromJson(response.data);
      setState(() {
        ganks.addAll(gank.results);
      });
    } on DioError catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
    return Scaffold(
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 256.0,
            pinned: _appBarBehavior == AppBarBehavior.pinned,
            floating: _appBarBehavior == AppBarBehavior.floating ||
                _appBarBehavior == AppBarBehavior.snapping,
            snap: _appBarBehavior == AppBarBehavior.snapping,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Gank'),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'images/lake.jpg',
                    fit: BoxFit.cover,
                    height: 256.0,
                  ),
                ],
              ),
            ),
          ),
          ganks.length == 0
              ? SliverFillRemaining(
                  child: LoadingPage(),
                )
              : SliverList(
                  delegate: SliverChildListDelegate(
                    _buildGroup(ganks),
                  ),
                ),
        ],
      ),
    );
  }

  List<Widget> _buildGroup(Map<String, List<GankItem>> ganks) {
    final TextStyle titleStyle = TextStyle(
        fontSize: 16.0, color: Color(0xff333333), fontWeight: FontWeight.bold);
    List<Widget> widgets = <Widget>[];
    ganks.forEach((k, v) {
      if (k != '福利') {
        widgets.add(
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
                  child: Text(k, style: titleStyle),
                ),
                Container(
                  child: Column(
                    children: v.map((item) {
                      return ListTile(
                        title: Text(item.desc),
                        subtitle: Text(item.who),
                        onTap: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return MyWebview(title: item.desc, url: item.url);
                            })),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
    return widgets;
  }
}
