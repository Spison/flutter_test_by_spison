import 'dart:convert';
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter_test_by_spison/models/point_model.dart';

class PointApiServices {
  static const String _apiKey = "/getPointList";
  final String _url = "https://api-mobile.e-m-l.ru/mobileTestApi.php$_apiKey";

  PointApiServices();

  Future<List<Point?>> fetchPoints() async {
    Dio dio = Dio();
    var response = await dio.get(_url,
        options: Options(
            method: "GET", headers: {"Access-Control-Allow-Origin": "*"}));
    List<Point> res;
    String str = response.data;
    res = List<Point>.from(jsonDecode(str).map((x) => Point.fromJson(x)));

    //Point point = Point.fromJson(response.data);
    return res;
    // Нерабочее с http
    // try {
    //   var response = await http.get(Uri.parse(_url));
    //   print(response);
    // } catch (e) {
    //   print(e);
    // }
  }
}
