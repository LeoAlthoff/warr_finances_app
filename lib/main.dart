import 'package:flutter/material.dart';
import 'package:flutter_teste_app/config.dart';
import 'package:flutter_teste_app/presenter/home/home_page.dart';
import 'presenter/login/login_page.dart';

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
      print('aa');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aTheme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: LoginPage(),
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
