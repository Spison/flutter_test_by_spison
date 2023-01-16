import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var viewModel = context.watch<_ViewModel>();
    var viewModel = context.watch<DetailsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Заказчик"),
      ),
      body: SafeArea(
          child: Padding(padding: const EdgeInsets.all(10), child: ListView())),
    );
  }

  static create(BuildContext bc) {
    return ChangeNotifierProvider(
      create: (context) {
        return DetailsViewModel(context: bc);
      },
      child: const Details(),
    );
  }
}

class DetailsViewModel extends ChangeNotifier {
  BuildContext context;
  DetailsViewModel({required this.context}) {
    asyncInit();
  }

  Future asyncInit() async {}
}
