import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  SessionManager._internal();

  SharedPreferences? sharedPreferences;

  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  static SessionManager get instance => _instance;

  Future<void> initializeSession() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String keyAuthToken = 'auth_token';
  static const String logginKey = 'loggin';
  static const String keyAuthUserID = '';

  String get authToken => sharedPreferences!.getString(keyAuthToken) ?? '';
  bool get isLoggedIn => sharedPreferences!.getBool(logginKey) ?? false;

  String get authUserID => sharedPreferences!.getString(keyAuthUserID) ?? '';

  set isLoggedIn(bool logging) =>
      sharedPreferences!.setBool(logginKey, logging);

  set authToken(String authToken) =>
      sharedPreferences!.setString(keyAuthToken, authToken);

  set authUserID(String authUserID) =>
      sharedPreferences!.setString(keyAuthUserID, authUserID);

  Future<bool> logOut() async {
    await sharedPreferences!.clear();
    // try {
    //   final cacheDir = await getTemporaryDirectory();
    //   if (cacheDir.existsSync()) {
    //     cacheDir.deleteSync(recursive: true);
    //   }
    //   final appDir = await getApplicationSupportDirectory();
    //   if (appDir.existsSync()) {
    //     appDir.deleteSync(recursive: true);
    //   }
    // } catch (e) {
    //   logger.d("error clearing cache");
    // }
    return true;
  }
}
