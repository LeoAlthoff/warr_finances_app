import 'package:flutter/material.dart';
import 'package:flutter_teste_app/shared/utils/database_helper.dart';

class MyTheme with ChangeNotifier {
  static bool isDark = false;

  ThemeMode currentTheme() {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void setTheme() async {
    bool theme = await DatabaseHelper.instance.checkTheme();
    isDark = theme;
    notifyListeners();
  }

  void switchTheme() {
    isDark = !isDark;
    if (isDark == true) {
      DatabaseHelper.instance.changeTheme(1);
    } else if (isDark == false) {
      DatabaseHelper.instance.changeTheme(0);
    }
    notifyListeners();
  }
}
