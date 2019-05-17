import 'package:flutter/material.dart';
import 'package:flutter_app/ui/Home.dart';
import 'package:flutter_app/ui/Setting.dart';
import 'package:flutter_app/ui/Splash.dart';
import 'package:flutter_app/util/Constants.dart';
import 'package:flutter_app/util/DataUtils.dart';
import 'package:flutter_app/util/ThemeUtils.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color themeColor = ThemeUtils.currentColorTheme;

  @override
  void initState() {
    super.initState();

    DataUtils.getColorThemeIndex().then((index) {
      print('color theme index = $index');
      if (index != null) {
        ThemeUtils.currentColorTheme = ThemeUtils.supportColors[index];
        Constants.eventBus.fire(ChangeThemeEvent(index));
      }
    });
    Constants.eventBus.on<ChangeThemeEvent>().listen((event) {
      setState(() {
        themeColor = ThemeUtils.supportColors[event.index];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gank',
      theme: ThemeData(primaryColor: themeColor),
      home: Slpash(),
      routes: <String, WidgetBuilder>{
        '/home': (_) => Home(),
        '/setting': (_) => Setting(),
      },
    );
  }
}
