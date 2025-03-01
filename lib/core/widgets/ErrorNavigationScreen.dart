import 'package:flutter/material.dart';

class ErrorNavigationScreen extends StatelessWidget {
  const ErrorNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}
