import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruites_hup/FruitsHup.dart';
import 'package:fruites_hup/core/services/getit_services.dart';
import 'package:fruites_hup/core/services/shared_preferences_singleton.dart';
import 'package:fruites_hup/firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding
      .ensureInitialized(); // يجب أن يكون أول سطر داخل `main()`

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  sutepGetit();
  await Prefs.init();

  runApp(FruitsHup());
}
