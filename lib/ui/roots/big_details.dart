import 'package:flutter/material.dart';
import 'package:flutter_test_by_spison/models/point_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.point});
  final Point point;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.

    String order = "";
    if (point.getBioMaterial == true) {
      order = order + "Забрать биоматериалы\n";
    }
    if (point.getDocuments == true) {
      order = order + "Забрать документы\n";
    }
    if (point.getMaterial == true) {
      order = order + "Забрать материалы\n";
    }
    if (point.giveBioMaterial == true) {
      order = order + "Отдать материалы\n";
    }
    if (point.giveDocuments == true) {
      order = order + "Отдать документы\n";
    }
    if (point.giveMaterial == true) {
      order = order + "Отдать материалы\n";
    }
    order = order.substring(0, order.length - 1);

    return Scaffold(
        appBar: AppBar(
          title: Text(point.counterparty.toString()),
        ),
        backgroundColor: Colors.amber[100],
        body: Column(
          children: [
            Container(),
            Card(
              child: ListTile(
                title: const Text("Контактные данные"),
                subtitle: Column(
                  children: [
                    ListTile(
                      title: const Text("Адрес"),
                      subtitle: Text(point.counterpartyAddress.toString()),
                    ),
                    ListTile(
                      title: const Text("ФИО"),
                      subtitle: Text(point.counterparty.toString()),
                    ),
                    ListTile(
                      title: const Text("Телефон"),
                      subtitle: Text(point.counterpartyContactPhone != ""
                          ? point.counterpartyContactPhone.toString()
                          : "Отсутствует"),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("Информация о заказе"),
                subtitle: Column(
                  children: [
                    ListTile(
                        title: const Text("Состав заказа"),
                        subtitle: Text(order)),
                    ListTile(
                      title: const Text("Комментарий"),
                      subtitle: Text(point.routeMemo.toString()),
                    ),
                  ],
                ),
              ),
            ),
            Card(
                child: ListTile(
              title: const Text("Время прибытия"),
              subtitle: Text(point.targetTime.toString()),
            )),
            TextButton(onPressed: () {}, child: const Text("Отменить заказ"))
          ],
        ));
  }
}
