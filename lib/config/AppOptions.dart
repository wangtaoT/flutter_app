import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppOptions {
  final AppTheme appTheme;

  const AppOptions({this.appTheme});

  AppOptions copyWith({AppTheme appTheme}) {
    return AppOptions(appTheme: appTheme);
  }
}

class AppTheme {
  final ThemeData themeData;

  const AppTheme(this.themeData);

  AppTheme changePrimaryColor(Color color) {
    return AppTheme(themeData.copyWith(primaryColor: color));
  }

  void changeTheme(int themeIndex) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt("themeIndex", themeIndex);
  }
}

final AppTheme defTheme =
    AppTheme(ThemeData().copyWith(primaryColor: Colors.blue));
