import 'package:flutter/material.dart';
import 'package:fruites_hup/FruitsHup.dart';
import 'package:fruites_hup/core/services/shared_preferences_singleton.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(FruitsHup());
}
