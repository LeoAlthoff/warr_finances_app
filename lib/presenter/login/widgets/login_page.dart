import 'package:flutter/material.dart';

import '../../home/home_page.dart';
import 'login_page_body.dart';
import 'reset_passaword_page.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 46, 93, 1),
      body: SingleChildScrollView(
        child: BodyLoginPage(),
      ),
    );
  }
}

void nagigateToHomeScreen(BuildContext context) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
}

void navigateToResetPassword(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ResetPassawordPage()));
}

void navigateToSignUpPage(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SignUpPage()));
}

void navigateBackToHomeScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => LoginPage()));
}
