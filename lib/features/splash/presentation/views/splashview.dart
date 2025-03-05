import 'package:flutter/material.dart';
import 'package:fruites_hup/core/services/shared_preferences_singleton.dart';
import 'package:fruites_hup/core/utils/constants.dart';
import 'package:fruites_hup/features/authentication/presentation/views/login_view.dart';
import 'package:fruites_hup/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:fruites_hup/features/splash/presentation/widgets/SplashViewBody.dart';

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
      backgroundColor: Colors.white,
      body: const SplashViewBody(),
    );
  }

  /// Navigate to the onboarding screen after a delay of 3 seconds.
  void _navigateToOnboarding() {
    var IsOnBoardingViewSeenvalue =
        Prefs.getBool(Constants.kIsOnBoardingViewSeen, true);

    if (IsOnBoardingViewSeenvalue == true) {
      Future.delayed(
        const Duration(seconds: 7),
        () {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 7),
        () {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        },
      );
    }
  }
}
