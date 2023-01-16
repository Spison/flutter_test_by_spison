import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test_by_spison/models/point_model.dart';
import 'package:http/http.dart' as http;

class PointApiServices {
  static String _apiKey = "/getPointList";
  String _url = "https://api-mobile.e-m-l.ru/mobileTestApi.php$_apiKey";

  PointApiServices() {}

  Future<List<Point?>> fetchPoints() async {
    Dio dio = Dio();
    var response = await dio.get(_url,
        options: Options(
            method: "GET", headers: {"Access-Control-Allow-Origin": "*"}));
    var a = 0;

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
