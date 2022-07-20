import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

<<<<<<< HEAD
import 'presenter/login/login_page.dart';
import 'shared/utils/database_helper.dart';
=======
import 'presenter/login/splash_screen_login/splash_screen_login_page.dart';

>>>>>>> 6a0ebe7ebb1d6cfc1ae448f71d8acc2c5f1e5df1

void main() {
  runApp(
    MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      title: 'MeuAppTeste',
      home: 
      const SplashScreenLoginPage(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade100),
      debugShowCheckedModeBanner: false,
    ),
  );
  DatabaseHelper();
}
