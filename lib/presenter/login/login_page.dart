import 'package:flutter/material.dart';

import 'widgets/body_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(238, 46, 93, 1),
      body: BodyLoginPage(),
    );
  }
}
