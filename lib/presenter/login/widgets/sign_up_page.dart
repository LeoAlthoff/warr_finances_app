import 'package:flutter/material.dart';

import '../../../shared/utils/database_helper.dart';
import 'input_widget_login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 46, 93, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 135,
                height: 135,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/avatar_verde.png'),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InputWidget(
                controller: nameController,
                icon: Icons.person,
                isPassword: false,
                labelTextInput: 'Primeiro Nome',
              ),
              const SizedBox(
                height: 15,
              ),
              InputWidget(
                controller: emailController,
                icon: Icons.email,
                isPassword: false,
                labelTextInput: 'Email',
              ),
              const SizedBox(
                height: 15,
              ),
              InputWidget(
                controller: passwordController,
                icon: Icons.lock,
                isPassword: true,
                labelTextInput: 'Senha',
              ),
              const SizedBox(
                height: 15,
              ),
              InputWidget(
                controller: passwordController1,
                icon: Icons.lock,
                isPassword: true,
                labelTextInput: 'Confirmar Senha',
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                margin: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (passwordController.text != passwordController1.text) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('As senhas precisam ser iguais!'),
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
                    } else if (emailController.text.isEmpty ||
                        nameController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        passwordController1.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                                'Nenhum dos campos pode estar vazio!'),
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
                    } else {
                      DatabaseHelper.instance.insertUser(
                        emailController.text,
                        nameController.text,
                        passwordController.text,
                      );
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Dados cadastrados com sucesso!'),
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
                      emailController.clear();
                      nameController.clear();
                      passwordController.clear();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 247, 170, 189),
                    ),
                  ),
                  child: const Text(
                    'Criar Conta',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
