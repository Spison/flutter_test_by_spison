import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SmallDetails extends ChangeNotifier {
  BuildContext context;
  SmallDetails({required this.context}) {
    asyncInit();
  }

  Map<String, String>? headers;

  Future asyncInit() async {}
}

class ListSmDetails {
  final List<SmallDetails> _smDetails = [];
  List<SmallDetails> get smDetails => _smDetails;

  void addEvent(SmallDetails smDet) {
    _smDetails.add(smDet);
  }
}
