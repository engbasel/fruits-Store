import 'package:flutter/material.dart';
import 'package:fruites_hup/core/widgets/ErrorNavigationScreen.dart';
import 'package:fruites_hup/features/authentication/presentation/views/login_view.dart';
import 'package:fruites_hup/features/authentication/presentation/views/signup_view.dart';
import 'package:fruites_hup/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:fruites_hup/features/splash/presentation/views/splashview.dart';

class OnGenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case OnBoardingView.routeName:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case SignupView.routeName:
        return MaterialPageRoute(builder: (_) => const SignupView());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorNavigationScreen());
    }
  }
}
