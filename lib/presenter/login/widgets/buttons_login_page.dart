import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'login_page_body.dart';

class ButtonsLogin extends StatelessWidget {
  const ButtonsLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          child: TextButton(
            onPressed: () {
              navigateToResetPassword(context);
            },
            child: const Text(
              'Esqueceu a senha?',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 220,
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ElevatedButton(
              onPressed: () {
                nagigateToHomeScreen(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 234, 198, 214),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 220,
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ElevatedButton(
              onPressed: () {
                nagigateToHomeScreen(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.blue.shade700,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Login com Facebook',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    color: Colors.blue.shade700,
                    child: SizedBox(
                      height: 30,
                      width: 50,
                      child: Image.asset('assets/images/fb.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 220,
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ElevatedButton(
              onPressed: () {
                nagigateToHomeScreen(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.red,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Login com Google',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: SizedBox(
                      height: 25,
                      width: 40,
                      child: Image.asset('assets/images/google.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
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
