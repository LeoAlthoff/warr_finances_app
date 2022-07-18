import 'package:flutter/material.dart';

import '../../shared/widgets/input_text_container.dart';

class CardEmailSenhaLogin extends StatelessWidget {
  const CardEmailSenhaLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              ' Faça seu login com uma conta Google abaixo',
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/google.png',
              height: 30,
              width: 30,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextInputContainer(
          textValue: 'E-mail',
        ),
        TextInputContainer(
          textValue: 'Senha',
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
        ),
      ],
    );
  }
}
