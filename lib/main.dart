import 'package:flutter/material.dart';

import 'presenter/login/splash_screen_login/splash_screen_login_page.dart';
import 'presenter/login/widgets/login_page_body.dart';
import 'presenter/login/widgets/reset_passaword_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'MeuAppTeste',
      home: 
      const SplashScreenLoginPage(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade100),
      debugShowCheckedModeBanner: false,
    ),
  );
}
