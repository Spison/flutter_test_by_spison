import 'package:flutter/material.dart';
import 'package:flutter_test_by_spison/models/point_model.dart';
import 'package:flutter_test_by_spison/services/point_api_services.dart';
import 'package:flutter_test_by_spison/ui/app_navigator.dart';
import 'package:flutter_test_by_spison/ui/roots/big_details.dart';

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
      home: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: FutureBuilder<List<Point?>>(
                              future: PointApiServices().fetchPoints(),
                              builder: ((context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return ListView.builder(
                                      itemCount: (snapshot.data!.length),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Details(
                                                    point:
                                                        snapshot.data![index]!),
                                              ),
                                            );
                                            // AppNavigator.toDetails(snapshot.data![index]!);
                                          },
                                          child: Card(
                                            child: ListTile(
                                              title: Text(
                                                /*snapshot.data![index]?.counterparty*/
                                                snapshot.data![index]!
                                                        .counterparty
                                                        .toString() +
                                                    snapshot.data![index]!.rowN
                                                        .toString(),
                                                //"Заказчик: $snapshot.data[index].counterparty"
                                              ),
                                              subtitle: Text(
                                                snapshot.data![index]!
                                                    .counterpartyAddress
                                                    .toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              leading: SizedBox(
                                                width: 60,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(children: [
                                                      //if(snapshot.data![index]!.getBioMaterial==true){const Icon(Icons.biotech);}
                                                      snapshot.data![index]!
                                                                  .getBioMaterial ==
                                                              true
                                                          ? const Icon(
                                                              Icons.biotech,
                                                              color:
                                                                  Colors.black,
                                                              size: 15,
                                                            )
                                                          : const Icon(
                                                              Icons.biotech,
                                                              color:
                                                                  Colors.amber,
                                                              size: 0,
                                                            ),
                                                      snapshot.data![index]!
                                                                  .getDocuments ==
                                                              true
                                                          ? const Icon(
                                                              Icons
                                                                  .document_scanner_outlined,
                                                              color:
                                                                  Colors.black,
                                                              size: 15,
                                                            )
                                                          : const Icon(
                                                              Icons
                                                                  .document_scanner_outlined,
                                                              color:
                                                                  Colors.amber,
                                                              size: 0,
                                                            ),
                                                      snapshot.data![index]!
                                                                  .getMaterial ==
                                                              true
                                                          ? const Icon(
                                                              Icons.folder,
                                                              color:
                                                                  Colors.black,
                                                              size: 15,
                                                            )
                                                          : const Icon(
                                                              Icons.folder,
                                                              color:
                                                                  Colors.amber,
                                                              size: 0,
                                                            ),
                                                    ]),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        snapshot.data![index]!
                                                                    .getBioMaterial ==
                                                                true
                                                            ? const Icon(
                                                                Icons.biotech,
                                                                color: Colors
                                                                    .black,
                                                                size: 15,
                                                              )
                                                            : const Icon(
                                                                Icons.biotech,
                                                                color: Colors
                                                                    .amber,
                                                                size: 0,
                                                              ),
                                                        snapshot.data![index]!
                                                                    .getDocuments ==
                                                                true
                                                            ? const Icon(
                                                                Icons
                                                                    .document_scanner_outlined,
                                                                color: Colors
                                                                    .black,
                                                                size: 15,
                                                              )
                                                            : const Icon(
                                                                Icons
                                                                    .document_scanner_outlined,
                                                                color: Colors
                                                                    .amber,
                                                                size: 0,
                                                              ),
                                                        snapshot.data![index]!
                                                                    .getMaterial ==
                                                                true
                                                            ? const Icon(
                                                                Icons.folder,
                                                                color: Colors
                                                                    .black,
                                                                size: 15,
                                                              )
                                                            : const Icon(
                                                                Icons.folder,
                                                                color: Colors
                                                                    .amber,
                                                                size: 0,
                                                              )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }
                              })))
                    ]))));
  }
}
