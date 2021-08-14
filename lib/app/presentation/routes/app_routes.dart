import 'package:flutter/material.dart' show RouteSettings, Route, MaterialPageRoute;

part 'app_route_name.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.anime:
      default:
        return MaterialPageRoute(builder: (context) => throw UnimplementedError(), settings: settings);
    }
  }
}
