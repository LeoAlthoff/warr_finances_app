import 'package:flutter/material.dart';

import '../widgets/login_page_body.dart';
import 'buttonEntrar_login_page.dart';
import 'buttonFb_login_page.dart';
import 'buttonGg_login_page.dart';

class ButtonsBodyLogin extends StatelessWidget {
  const ButtonsBodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                navigateToResetPassword(context);
              },
              child: const Text(
                'Esqueceu a senha?',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const ButtonEntrarLoginPage(),
        const SizedBox(height: 10),
        const SizedBox(
          width: 220,
          height: 30,
          child: ButtonFbLoginPage(),
        ),
        const SizedBox(height: 10),
        const ButtonGgBodyLogin(),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            navigateToSignUpPage(context);
          },
          child: const Text(
            'Cadastre-se',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
