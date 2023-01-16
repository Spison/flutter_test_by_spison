import 'package:flutter/material.dart';

class DetailsViewModel extends ChangeNotifier {
  BuildContext context;
  DetailsViewModel({required this.context}) {
    asyncInit();
  }

  Map<String, String>? headers;

  Future asyncInit() async {}

  String? _imagePath;
  Image? _avatar;
  Image? get avatar => _avatar;
  set avatar(Image? val) {
    _avatar = val;
    notifyListeners();
  }
}
