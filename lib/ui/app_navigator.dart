import 'package:flutter/material.dart';
import 'package:flutter_test_by_spison/ui/roots/loader.dart';

class NavigationRoutes {
  static const loaderWidget = "/";
  static const details = "/details";
  static const app = "/app"; //main
}

class AppNavigator {
  static final key = GlobalKey<NavigatorState>();

  static Future toLoader() async {
    return await key.currentState?.pushNamedAndRemoveUntil(
        NavigationRoutes.loaderWidget, ((route) => false));
  }

  static Future toApp() async {
    return await key.currentState
        ?.pushNamedAndRemoveUntil(NavigationRoutes.app, ((route) => false));
  }

  static Future toDetails(BuildContext bc) async {
    return await key.currentState?.pushNamed(NavigationRoutes.details);
  }

  static Route<dynamic>? onGeneratedRoutes(RouteSettings settings, context) {
    switch (settings.name) {
      case NavigationRoutes.loaderWidget:
        return PageRouteBuilder(
            pageBuilder: ((_, __, ___) => LoaderWidget.create()));
      // case NavigationRoutes.details:
      //   return PageRouteBuilder(
      //       pageBuilder: ((_, __, ___) =>
      //           Details.create(context))); //добавить чуть позже
      // case NavigationRoutes.app:
      //   return PageRouteBuilder(
      //       pageBuilder: ((_, __, ___) => App.create())); //добавить чуть позже
    }
    return null;
  }
}
