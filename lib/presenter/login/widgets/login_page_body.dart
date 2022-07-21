import 'package:flutter/material.dart';

import '../../home/home_page.dart';
import '../buttons/buttons_body_login.dart';
import 'card_header_login_page.dart';
import 'reset_passaword_page.dart';
import 'sign_up_page.dart';

class BodyLoginPage extends StatelessWidget {
  const BodyLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(children: const [
            CardHeaderLogin(),
            ButtonsBodyLogin(),
          ]),
        ),
      ),
    );
  }
}

void nagigateToHomeScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => HomePage()));
}

void navigateToResetPassword(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ResetPassawordPage()));
}

void navigateToSignUpPage(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SignUpPage()));
}
