import 'package:flutter/material.dart';
import 'package:flutter_app/config/AppOptions.dart';
import 'package:flutter_app/ui/Home.dart';
import 'package:flutter_app/ui/Setting.dart';
import 'package:flutter_app/ui/Splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppOptions _appOpt;

  void _handleOptChanged(AppOptions _newOpt) {
    setState(() {
      _appOpt = _newOpt;
    });
  }

  @override
  void initState() {
    super.initState();
    _appOpt = AppOptions(appTheme: defTheme);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gank',
      theme: _appOpt.appTheme.themeData,
      home: Slpash(),
      routes: <String, WidgetBuilder>{
        '/home': (_) => Home(),
        '/setting': (_) =>
            Setting(appOpt: _appOpt, onOptionsChanged: _handleOptChanged),
      },
    );
  }
}
