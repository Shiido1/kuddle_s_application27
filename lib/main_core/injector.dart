import 'package:get_it/get_it.dart';

import 'package:kuddle_s_application27/main_core/session_manager.dart';

final inject = GetIt.instance;
final sessionManager = SessionManager();

Future<void> initializeCore() async {
  // AppConfig.environment = environment;
  await _initializeCore();
}

/// Initialize the core functions here
Future<void> _initializeCore() async {
  await sessionManager.initializeSession();
  inject.registerLazySingleton<SessionManager>(() => sessionManager);
}
