import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'input_widget_login_page.dart';

class CardHeaderLogin extends StatefulWidget {
  const CardHeaderLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<CardHeaderLogin> createState() => CardHeaderLoginState();
}

class CardHeaderLoginState extends State<CardHeaderLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              width: 120,
              height: 150,
              child: Lottie.asset(
                'assets/lottie/pig2.json',
              ),
            ),
            Column(children: const [
              Text(
                'Warr Finances',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 50),
              Text(
                'Entrar na sua conta',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
            InputWidget(
              controller: emailController,
              icon: Icons.email,
              isPassword: false,
              labelTextInput: 'Email',
            ),
            InputWidget(
              controller: passwordController,
              icon: Icons.lock,
              isPassword: true,
              labelTextInput: 'Senha',
            ),
          ],
        ),
      ],
    );
  }
}
