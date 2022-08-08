import 'package:flutter/material.dart';
import 'package:flutter_teste_app/shared/utils/shared_preferences.dart';

class MyTheme with ChangeNotifier {
  static bool isDark = false;

  ThemeMode currentTheme() {
    if (SharedPreferencesHelper.prefs?.getBool('isDark') != null) {
      isDark = SharedPreferencesHelper.prefs!.getBool('isDark')!;
    }
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    isDark = !isDark;
    SharedPreferencesHelper.prefs!.setBool('isDark', isDark);
    notifyListeners();
  }
}
