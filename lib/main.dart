import 'package:flutter/material.dart';
import 'package:fruites_hup/core/helper/functions/on_genrate_routes.dart';
import 'package:fruites_hup/features/splash/presention/views/splashview.dart';

void main(List<String> args) {
  runApp(FruitsHup());
}

class FruitsHup extends StatelessWidget {
  const FruitsHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruites App',
      theme: ThemeData(),
      onGenerateRoute: OnGenerateRoute.generateRoute,
      initialRoute: Splashview.routeName,
    );
  }
}
