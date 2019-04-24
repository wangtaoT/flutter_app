import 'package:flutter/material.dart';
import 'package:flutter_app/model/job/job.dart';

class JobItem extends StatelessWidget {
  Job job;
  VoidCallback onPressed;

  JobItem({this.job, this.onPressed});

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
                new Expanded(
                    child: Text(
                  job.title,
                  style: new TextStyle(color: Colors.black, fontSize: 16),
                )),
                Text(
                  job.salary,
                  style:
                      new TextStyle(color: new Color(0xFF54cbc4), fontSize: 18),
                )
              ],
            ),
            new Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(job.company),
            ),
            new Container(
              decoration: new BoxDecoration(
                  color: new Color(0xFFF6F6F8),
                  borderRadius: new BorderRadius.all(new Radius.circular(6))),
              padding:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 8, right: 8),
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              child: Text(
                job.info,
                style: new TextStyle(color: new Color(0xFF9fa3b0)),
              ),
            ),
            new Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(job.head),
                  radius: 15,
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(job.publish),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
