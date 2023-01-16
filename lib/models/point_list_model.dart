import 'dart:convert';

Point? pointFromJson(String str) => Point.fromJson(json.decode(str));

String pointToJson(Point? data) => json.encode(data!.toJson());

class Point {
  Point({
    this.pointList,
  });

  List<PointList?>? pointList;

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        pointList: json["PointList"] == null
            ? []
            : List<PointList?>.from(
                json["PointList"]!.map((x) => PointList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PointList": pointList == null
            ? []
            : List<dynamic>.from(pointList!.map((x) => x!.toJson())),
      };
}

class PointList {
  PointList({
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

  int rowN;
  String courierFio;
  String routeDate;
  String routeMemo;
  String targetTime;
  String targetMaxTime;
  String counterparty;
  String counterpartyAddress;
  String counterpartyContactPhone;
  bool getBioMaterial;
  bool getDocuments;
  bool getMaterial;
  bool giveBioMaterial;
  bool giveDocuments;
  bool giveMaterial;
  String pointMemo;

  factory PointList.fromJson(Map<String, dynamic> json) => PointList(
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

  Map<String, dynamic> toJson() => {
        "RowN": rowN,
        "CourierFIO": courierFio,
        "RouteDate": routeDate,
        "RouteMemo": routeMemo,
        "TargetTime": targetTime,
        "TargetMaxTime": targetMaxTime,
        "Counterparty": counterparty,
        "CounterpartyAddress": counterpartyAddress,
        "CounterpartyContactPhone": counterpartyContactPhone,
        "GetBioMaterial": getBioMaterial,
        "GetDocuments": getDocuments,
        "GetMaterial": getMaterial,
        "GiveBioMaterial": giveBioMaterial,
        "GiveDocuments": giveDocuments,
        "GiveMaterial": giveMaterial,
        "PointMemo": pointMemo,
      };
}
