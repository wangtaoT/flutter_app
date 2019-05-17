import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/Constants.dart';
import 'package:flutter_app/util/DataUtils.dart';
import 'package:flutter_app/util/ThemeUtils.dart';

class Setting extends StatelessWidget {
  List<Color> colors = ThemeUtils.supportColors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Text(
              "主题设置",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: GridView.count(
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                crossAxisCount: 6,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: List.generate(colors.length, (index) {
                  return GestureDetector(
                    child: Container(
                      color: colors[index],
                    ),
                    onTap: () {
                      ThemeUtils.currentColorTheme = colors[index];
                      DataUtils.setColorTheme(index);
                      Constants.eventBus.fire(ChangeThemeEvent(index));
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
