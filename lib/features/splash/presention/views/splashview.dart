import 'package:flutter/material.dart';
import 'package:fruites_hup/features/onboarding/presention/views/on_boarding_view.dart';
import 'package:fruites_hup/features/splash/presention/widgets/SplashViewBody.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = 'SplashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SplashViewBody(),
    );
  }

  /// Navigate to the onboarding screen after a delay of 3 seconds.
  void _navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushNamed(context, OnBoardingView.routeName);
    });
  }
}
