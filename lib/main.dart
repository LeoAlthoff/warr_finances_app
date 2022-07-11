import 'package:flutter/material.dart';
import 'presenter/login_page/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'MeuAppTeste',
      home: const LoginPage(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade100),
      debugShowCheckedModeBanner: false,
    ),
  );
}
