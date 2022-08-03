import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? prefs;

  SharedPreferencesHelper() {
    initializeSharedPreferencesHelper();
  }

  static Future<void> initializeSharedPreferencesHelper() async {
    prefs = await SharedPreferences.getInstance();
  }
}
