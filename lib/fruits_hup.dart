import 'package:flutter/material.dart';
import 'package:fruites_hup/core/helper/functions/on_genrate_routes.dart';
import 'package:fruites_hup/features/splash/presentation/views/splashview.dart';

class FruitsHup extends StatelessWidget {
  const FruitsHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruites App',
      theme: ThemeData(),
      onGenerateRoute: OnGenerateRoute.generateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
