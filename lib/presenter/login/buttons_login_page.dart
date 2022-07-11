import 'package:flutter/material.dart';
import 'body_login_page.dart';

class ButtonsLogin extends StatelessWidget {
  const ButtonsLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Esqueceu a senha?',
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 180,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                nagigateToHomeScreen(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 234, 198, 214),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
