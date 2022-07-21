import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config.dart';
import 'presenter/home/home_page.dart';

import 'presenter/login/splash_screen_login/splash_screen_login_page.dart';

void main() {
  runApp(
    App(),
  );
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      title: 'MeuAppTeste',
      home: const SplashScreenLoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
    );
  }
}

class AppTheme {
  static final light = ThemeData(
    backgroundColor: Colors.red,
  );
  static final dark = ThemeData(
    backgroundColor: Colors.black87,
    scaffoldBackgroundColor: Colors.blue,
  );
}
