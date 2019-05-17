import 'package:shared_preferences/shared_preferences.dart';

class DataUtils {
  static const String SP_COLOR_THEME_INDEX = "colorThemeIndex";

  //保存选择的主题色
  static setColorTheme(int colorThemeIndex) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(SP_COLOR_THEME_INDEX, colorThemeIndex);
  }

  //取出
  static Future<int> getColorThemeIndex() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(SP_COLOR_THEME_INDEX);
  }
}
