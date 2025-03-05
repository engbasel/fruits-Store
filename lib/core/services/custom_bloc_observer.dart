import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class CustomBlocObserver extends BlocObserver {
  /// Utility function to print formatted debug logs
  void debugLog(String icon, String label, String message) {
    debugPrint('''
------------------------------------------------------------
$icon [$label] 
------------------------------------------------------------
$message
------------------------------------------------------------
''');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugLog('🟢', 'EVENT', 'Bloc: ${bloc.runtimeType}, Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugLog('🔄', 'TRANSITION',
        'Bloc: ${bloc.runtimeType}, Transition: $transition');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugLog('🔷', 'CHANGE', 'Bloc: ${bloc.runtimeType}, Change: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugLog('❌', 'ERROR',
        'Bloc: ${bloc.runtimeType}, Error: $error\nStackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
