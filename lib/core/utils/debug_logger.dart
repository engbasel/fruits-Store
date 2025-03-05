import 'package:flutter/foundation.dart';

/// A centralized logger utility for debugging across the project.
class DebugLogger {
  static void log(String title, String message, {String? icon}) {
    final String timestamp = DateTime.now().toIso8601String();
    debugPrint('----------------------------------------\n'
        '🕒 [$timestamp] ${icon ?? '🔍'} $title\n'
        '➡️  $message\n'
        '----------------------------------------');
  }
}
