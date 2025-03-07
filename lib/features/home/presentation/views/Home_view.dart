import 'package:flutter/material.dart';

class homeView extends StatelessWidget {
  const homeView({super.key});
  static const String routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
      ),
    );
  }
}
