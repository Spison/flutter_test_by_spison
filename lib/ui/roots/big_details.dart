import 'package:flutter/material.dart';
import 'package:flutter_test_by_spison/models/point_model.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.point});
  final Point point;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.

    String order = "";
    if (point.getBioMaterial == true) {
      order = "$orderЗабрать биоматериалы\n";
    }
    if (point.getDocuments == true) {
      order = "$orderЗабрать документы\n";
    }
    if (point.getMaterial == true) {
      order = "$orderЗабрать материалы\n";
    }
    if (point.giveBioMaterial == true) {
      order = "$orderОтдать материалы\n";
    }
    if (point.giveDocuments == true) {
      order = "$orderОтдать документы\n";
    }
    if (point.giveMaterial == true) {
      order = "$orderОтдать материалы\n";
    }
    order = order.substring(0, order.length - 1);

    return Scaffold(
        appBar: AppBar(
          title: Text(point.counterparty.toString()),
        ),
        backgroundColor: Colors.grey[100],
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
