import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruites_hup/core/helper/functions/on_genrate_routes.dart';
import 'package:fruites_hup/features/localization/app_localizations.dart';
import 'package:fruites_hup/features/splash/presentation/views/splashview.dart';

class FruitsHup extends StatelessWidget {
  const FruitsHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppLocalizations.of(context)?.translate('Fruites App') ??
          'Fruites App',
      theme: ThemeData(),
      onGenerateRoute: OnGenerateRoute.generateRoute,
      initialRoute: SplashView.routeName,
      locale: const Locale('ar'), // Default language set to Arabic
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        return supportedLocales.firstWhere(
          (supportedLocale) =>
              supportedLocale.languageCode == locale?.languageCode,
          orElse: () => const Locale('ar'),
        );
      },
    );
  }
}
