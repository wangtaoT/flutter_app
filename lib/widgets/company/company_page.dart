import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/model/company/company.dart';
import 'package:flutter_app/widgets/company/company_item.dart';
import 'package:flutter_app/widgets/company/company_detail_page.dart';
import 'package:http/http.dart' as http;

class CompanyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CompanyPageState();
  }
}

class _CompanyPageState extends State<CompanyPage>
    with AutomaticKeepAliveClientMixin {
  List<Company> companyList = List();

  @override
  void initState() {
    super.initState();
    companyList.add(new Company(
        id: "1",
        company: "company",
        logo:
            "https://img.bosszhipin.com/beijin/mcs/useravatar/20171211/4d147d8bb3e2a3478e20b50ad614f4d02062e3aec7ce2519b427d24a3f300d68_s.jpg",
        info: "info",
        hot: "hot"));
    companyList.add(new Company(
        id: "1",
        company: "company",
        logo:
            "https://img.bosszhipin.com/beijin/mcs/useravatar/20171211/4d147d8bb3e2a3478e20b50ad614f4d02062e3aec7ce2519b427d24a3f300d68_s.jpg",
        info: "info",
        hot: "hot"));
    companyList.add(new Company(
        id: "1",
        company: "company",
        logo:
            "https://img.bosszhipin.com/beijin/mcs/useravatar/20171211/4d147d8bb3e2a3478e20b50ad614f4d02062e3aec7ce2519b427d24a3f300d68_s.jpg",
        info: "info",
        hot: "hot"));
    companyList.add(new Company(
        id: "1",
        company: "company",
        logo:
            "https://img.bosszhipin.com/beijin/mcs/useravatar/20171211/4d147d8bb3e2a3478e20b50ad614f4d02062e3aec7ce2519b427d24a3f300d68_s.jpg",
        info: "info",
        hot: "hot"));
    companyList.add(new Company(
        id: "1",
        company: "company",
        logo:
            "https://img.bosszhipin.com/beijin/mcs/useravatar/20171211/4d147d8bb3e2a3478e20b50ad614f4d02062e3aec7ce2519b427d24a3f300d68_s.jpg",
        info: "info",
        hot: "hot"));
    companyList.add(new Company(
        id: "1",
        company: "company",
        logo:
            "https://img.bosszhipin.com/beijin/mcs/useravatar/20171211/4d147d8bb3e2a3478e20b50ad614f4d02062e3aec7ce2519b427d24a3f300d68_s.jpg",
        info: "info",
        hot: "hot"));
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
        centerTitle: true,
        title: new Text(
          "公 司",
          style: new TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: new Center(
        child: _createListView(context),
      ),
    );
  }

  Widget _createListView(BuildContext context) {
    return ListView.builder(
        key: new PageStorageKey("company-list"),
        itemCount: companyList.length,
        itemBuilder: (BuildContext context, int index) {
          return CompanyItem(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // fullscreenDialog: true,
                  builder: (context) => CompanyDetailPage(
                      company: companyList[index],
                      heroLogo: "heroLogo${index}"),
                ),
              );
            },
            company: companyList[index],
            heroLogo: "heroLogo${index}",
          );
        });
  }
}
