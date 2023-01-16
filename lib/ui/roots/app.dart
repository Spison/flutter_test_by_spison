// import 'package:flutter_test_by_spison/models/point_list_model.dart';
// import 'package:flutter_test_by_spison/services/point_api_services.dart';
// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test_by_spison/details/big_details.dart';
// import 'package:provider/provider.dart';

// //import 'package:http/http.dart' as http;

// class App extends StatefulWidget {
//   @override
//   _App createState() => _App();
// }

// class _App extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber[100],
//       appBar: AppBar(
//         title: const Text("Маршрут на сегодня"),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Discover",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//             Text("Find interesting", style: TextStyle(color: Colors.grey)),
//             SizedBox(
//               height: 20,
//             ),
//             Expanded(
//                 child: FutureBuilder<List<Point?>>(
//               future: PointApiServices().fetchPoints(),
//               builder: ((context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 } else {
//                   return ListView.builder(
//                     // itemCount: (snapshot.data!.length),
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(snapshot.data!.counterparty),
//                         subtitle: Text(
//                           snapshot.data!.counterpartyAddress,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         leading: Container(
//                           width: 150,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20)),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               }),
//             ))
//           ],
//         ),
//       )),
//     );
//   }
// }
