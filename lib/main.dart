import 'package:flutter/material.dart';

import 'package:flutter_components/router/app_routes.dart';
import 'package:flutter_components/theme/app_theme.dart';

void main() => runApp(const FlutterComponentes());

class FlutterComponentes extends StatelessWidget {
  const FlutterComponentes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Components App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes() ,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      //onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings) // Mismo proceso que el anterior
      theme: AppTheme.darkTheme,
    );
  }
}