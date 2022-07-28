import 'package:flutter/material.dart';
import '../../../shared/utils/database_helper.dart';

import 'package:lottie/lottie.dart';

import '../buttons/buttonFb_login_page.dart';
import '../buttons/buttonGg_login_page.dart';

import 'input_widget_login_page.dart';
import 'login_page.dart';

class BodyLoginPage extends StatefulWidget {
  BodyLoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  State<BodyLoginPage> createState() => _BodyLoginPageState();
}

class _BodyLoginPageState extends State<BodyLoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 150,
                child: Lottie.asset(
                  'assets/lottie/pig2.json',
                ),
              ),
              Column(
                children: const [
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
                ],
              ),
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
              SizedBox(
                width: 220,
                height: 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      bool result = await DatabaseHelper.instance.validateUser(
                        emailController.text,
                        passwordController.text,
                      );
                      if (result) {
                        nagigateToHomeScreen(context);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Login incorreto!'),
                              actions: [
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromRGBO(238, 46, 93, 1)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Ok',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 247, 170, 189),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
          ),
        ),
      ),
    );
  }
}
