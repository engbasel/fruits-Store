import 'package:flutter/material.dart';
import 'package:fruites_hup/core/widgets/ErrorNavigationScreen.dart';
import 'package:fruites_hup/features/auth/presention/views/login_view.dart';
import 'package:fruites_hup/features/onboarding/presention/views/on_boarding_view.dart';
import 'package:fruites_hup/features/splash/presention/views/splashview.dart';

class OnGenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case OnBoardingView.routeName:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorNavigationScreen());
    }
  }
}
