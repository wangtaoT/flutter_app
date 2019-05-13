import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/GankItem.dart';
import 'package:flutter_app/models/GankList.dart';
import 'package:flutter_app/ui/comm/LoadingMoreFooter.dart';
import 'package:flutter_app/ui/comm/LoadingPage.dart';
import 'package:flutter_app/ui/comm/MyWebview.dart';

class ListPage extends StatefulWidget {
  final String category;

  const ListPage({Key key, this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  final List<GankItem> data = <GankItem>[];
  num currpage = 1;
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        var maxScroll = _controller.position.maxScrollExtent;
        var pixels = _controller.position.pixels;
        if (maxScroll - pixels < 200) {
          currpage++;
          _getData(false);
        }
      });
    _getData(true);
  }

  Future<Null> _getData(bool isRefresh) async {
    if (isRefresh) {
      data.clear();
      currpage = 1;
    }

    try {
      Response response = await Dio()
          .get("http://gank.io/api/data/${widget.category}/10/$currpage");
      GankList gankList = GankList.fromJson(response.data);
      setState(() {
        data.addAll(gankList.results);
      });
    } on DioError catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Android"),
      ),
      body: data.length == 0
          ? LoadingPage()
          : RefreshIndicator(
              child: ListView.builder(
                itemCount: 2 * data.length + 1,
                itemBuilder: (context, i) {
                  if (i.isOdd)
                    return Divider(
                      height: 1,
                    );
                  if (i == 2 * data.length) return LoadingMoreFooter();
                  final index = i ~/ 2;
                  return _buildRow(data[index]);
                },
                controller: _controller,
              ),
              onRefresh: () => _getData(true)),
    );
  }

  Widget _buildRow(GankItem item) {
    return ListTile(
      title: Text(item.desc),
      subtitle: Text(item.who),
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MyWebview(title: item.desc, url: item.url);
          })),
    );
  }
}
