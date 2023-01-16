import 'dart:convert';

List<Point> pointFromJson(String str) =>
    List<Point>.from(jsonDecode(str).map((x) => Point.fromJson(x)));

class Point {
  Point({
    required this.rowN,
    required this.courierFio,
    required this.routeDate,
    required this.routeMemo,
    required this.targetTime,
    required this.targetMaxTime,
    required this.counterparty,
    required this.counterpartyAddress,
    required this.counterpartyContactPhone,
    required this.getBioMaterial,
    required this.getDocuments,
    required this.getMaterial,
    required this.giveBioMaterial,
    required this.giveDocuments,
    required this.giveMaterial,
    required this.pointMemo,
  });

  int? rowN;
  String? courierFio;
  String? routeDate;
  String? routeMemo;
  String? targetTime;
  String? targetMaxTime;
  String? counterparty;
  String? counterpartyAddress;
  String? counterpartyContactPhone;
  bool? getBioMaterial;
  bool? getDocuments;
  bool? getMaterial;
  bool? giveBioMaterial;
  bool? giveDocuments;
  bool? giveMaterial;
  String? pointMemo;

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        rowN: json["RowN"],
        courierFio: json["CourierFIO"],
        routeDate: json["RouteDate"],
        routeMemo: json["RouteMemo"],
        targetTime: json["TargetTime"],
        targetMaxTime: json["TargetMaxTime"],
        counterparty: json["Counterparty"],
        counterpartyAddress: json["CounterpartyAddress"],
        counterpartyContactPhone: json["CounterpartyContactPhone"],
        getBioMaterial: json["GetBioMaterial"],
        getDocuments: json["GetDocuments"],
        getMaterial: json["GetMaterial"],
        giveBioMaterial: json["GiveBioMaterial"],
        giveDocuments: json["GiveDocuments"],
        giveMaterial: json["GiveMaterial"],
        pointMemo: json["PointMemo"],
      );
}
