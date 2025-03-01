import 'package:flutter/material.dart';
import 'package:fruites_hup/features/onboarding/presention/views/OnboardingView.dart';
import 'package:fruites_hup/features/splash/presention/views/splashview.dart';

class OnGenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case OnboardingView.routeName:
        return MaterialPageRoute(builder: (_) => const OnboardingView());

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}
