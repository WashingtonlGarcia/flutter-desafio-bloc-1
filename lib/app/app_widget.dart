import 'package:flutter/material.dart';
import 'presentation/routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
