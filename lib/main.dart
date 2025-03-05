import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruites_hup/fruits_hup.dart';
import 'package:fruites_hup/core/services/custom_bloc_observer.dart';
import 'package:fruites_hup/core/services/getit_services.dart';
import 'package:fruites_hup/core/services/shared_preferences_singleton.dart';
import 'package:fruites_hup/firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding
      .ensureInitialized(); // يجب أن يكون أول سطر داخل `main()`

  // await Firebase.initializeApp();
  Bloc.observer = CustomBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  sutepGetit();
  await Prefs.init();

  runApp(FruitsHup());
}
