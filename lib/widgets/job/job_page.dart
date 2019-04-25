import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/config/config.dart';
import 'package:flutter_app/model/job/job.dart';
import 'package:flutter_app/widgets/job/job_item.dart';
import 'package:http/http.dart' as http;

class JobPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _JobPageState();
  }
}

class _JobPageState extends State<JobPage> with AutomaticKeepAliveClientMixin {
  List<Job> jobList = List<Job>();

  @override
  void initState() {
    super.initState();
    jobList.add(new Job(
        id: "1",
        title: "title",
        salary: "salary",
        company: "company",
        info: "info",
        category: "category",
        head: "head",
        publish: "publish"));
    jobList.add(new Job(
        id: "1",
        title: "title",
        salary: "salary",
        company: "company",
        info: "info",
        category: "category",
        head: "head",
        publish: "publish"));
    jobList.add(new Job(
        id: "1",
        title: "title",
        salary: "salary",
        company: "company",
        info: "info",
        category: "category",
        head: "head",
        publish: "publish"));
    jobList.add(new Job(
        id: "1",
        title: "title",
        salary: "salary",
        company: "company",
        info: "info",
        category: "category",
        head: "head",
        publish: "publish"));
    jobList.add(new Job(
        id: "1",
        title: "title",
        salary: "salary",
        company: "company",
        info: "info",
        category: "category",
        head: "head",
        publish: "publish"));
    jobList.add(new Job(
        id: "1",
        title: "title",
        salary: "salary",
        company: "company",
        info: "info",
        category: "category",
        head: "head",
        publish: "publish"));
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
          "职 位",
          style: new TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: new Center(
        child: _createListView(context),
      ),
    );
  }

  Widget _createListView(BuildContext context) {
    return ListView.builder(
        key: new PageStorageKey("job-list"),
        itemCount: jobList.length,
        itemBuilder: (BuildContext context, int index) {
          return new JobItem(onPressed: () {}, job: jobList[index]);
        });
  }
}
