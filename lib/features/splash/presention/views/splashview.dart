import 'package:flutter/material.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

  static const String routeName = 'Splashview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/splash_logo.png'), // Replace with your splash image
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
