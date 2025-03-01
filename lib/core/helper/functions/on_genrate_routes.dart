import 'package:flutter/material.dart';
import 'package:fruites_hup/features/splash/presention/views/splashview.dart';

class OnGenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Splashview.routeName:
        return MaterialPageRoute(builder: (_) => const Splashview());
      case '/details':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => DetailsScreen(),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
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

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
