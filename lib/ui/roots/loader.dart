import 'package:flutter/material.dart';
import 'package:flutter_test_by_spison/ui/app_navigator.dart';
import 'package:provider/provider.dart';

class _ViewModel extends ChangeNotifier {
  BuildContext context;
  _ViewModel({required this.context}) {
    _asyncInit();
  }

  void _asyncInit() async {
    AppNavigator.toApp();
  }
}

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  static Widget create() => ChangeNotifierProvider<_ViewModel>(
        create: (context) => _ViewModel(context: context),
        lazy: false,
        child: const LoaderWidget(),
      );
}
