import 'package:flutter/material.dart';
import 'package:flutter_test_by_spison/models/point_model.dart';
import 'package:flutter_test_by_spison/services/point_api_services.dart';
import 'package:flutter_test_by_spison/ui/app_navigator.dart';
import 'package:flutter_test_by_spison/ui/roots/app.dart';
import 'package:flutter_test_by_spison/ui/roots/loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Маршрут на сегодня',
      navigatorKey: AppNavigator.key,
      onGenerateRoute: (settings) =>
          AppNavigator.onGeneratedRoutes(settings, context),
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text("Маршрут на сегодня"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: FutureBuilder<List<Point?>>(
              future: PointApiServices().fetchPoints(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: (snapshot.data!.length),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          /*snapshot.data![index]?.counterparty*/
                          snapshot.data![index]!.counterparty.toString() +
                              snapshot.data![index]!.rowN.toString(),
                          //"Заказчик: $snapshot.data[index].counterparty"
                        ),
                        subtitle: Text(
                          snapshot.data![index]!.counterpartyAddress.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //if(snapshot.data![index]!.getBioMaterial==true){const Icon(Icons.biotech);}
                                snapshot.data![index]!.getBioMaterial == true
                                    ? const Icon(
                                        Icons.biotech,
                                        color: Colors.black,
                                        size: 20,
                                      )
                                    : const Icon(
                                        Icons.biotech,
                                        color: Colors.amber,
                                        size: 0,
                                      ),
                                snapshot.data![index]!.getDocuments == true
                                    ? const Icon(
                                        Icons.document_scanner_outlined,
                                        color: Colors.black,
                                        size: 20,
                                      )
                                    : const Icon(
                                        Icons.document_scanner_outlined,
                                        color: Colors.amber,
                                        size: 0,
                                      ),
                                snapshot.data![index]!.getMaterial == true
                                    ? const Icon(
                                        Icons.folder,
                                        color: Colors.black,
                                        size: 20,
                                      )
                                    : const Icon(
                                        Icons.folder,
                                        color: Colors.amber,
                                        size: 0,
                                      ),
                                snapshot.data![index]!.giveMaterial == true
                                    ? const Icon(
                                        Icons.colorize,
                                        color: Colors.black,
                                        size: 20,
                                      )
                                    : const Icon(
                                        Icons.colorize,
                                        color: Colors.amber,
                                        size: 0,
                                      )
                              ]),
                        ),
                      );
                    },
                  );
                }
              }),
            ))
          ],
        ),
      )),
    );
  }
}
