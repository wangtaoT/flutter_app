import 'package:dio/dio.dart';
import 'package:flutter_app/util/http.dart';

class NetUtils {
  //get
  static Future<String> get(String url, {Map<String, String> params}) async {
    if (params != null && params.isNotEmpty) {
      // 如果参数不为空，则将参数拼接到URL后面
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    Response response;
    response = await dio.get(url);
    return response.data.toString();
  }

  //post
  static Future<String> post(String url, {Map<String, String> params}) async {
    Response response;
    response = await dio.post(url, queryParameters: params);
    return response.data.toString();
  }
}
