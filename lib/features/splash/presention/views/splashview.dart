import 'package:flutter/material.dart';
import 'package:fruites_hup/features/splash/presention/widgets/SplashViewBody.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

  static const String routeName = 'Splashview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SplashViewBody(),
    );
  }
}
