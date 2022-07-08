import 'package:flutter/material.dart';

import 'presenter/home_page/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'MeuAppTeste',
      home: const HomePage(), //TODO alterar para a página de login
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade100),
      debugShowCheckedModeBanner: false,
    ),
  );
}
