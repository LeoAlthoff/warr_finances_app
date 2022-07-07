import 'package:flutter/material.dart';
import 'package:flutter_teste_app/presenter/login_page/login_page.dart';



void main() {
  runApp(
    const MaterialApp(
      title: 'MeuAppTeste',
      home: LoginPage(),
      //theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade100),
      debugShowCheckedModeBanner: false,
    ),
  );
}
