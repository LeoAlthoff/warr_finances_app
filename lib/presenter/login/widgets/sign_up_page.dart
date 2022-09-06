import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../../dio/dio_helper.dart';
import '../../../dio/model/user_model.dart';

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
  final FocusNode nameNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode passwordConfirmationNode = FocusNode();

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
                autoFocus: true,
                focusNode: nameNode,
                controller: nameController,
                icon: Icons.person,
                labelTextInput: 'Apelido',
              ),
              const SizedBox(
                height: 15,
              ),
              InputWidget(
                focusNode: emailNode,
                controller: emailController,
                icon: Icons.email,
                labelTextInput: 'Email',
              ),
              const SizedBox(
                height: 15,
              ),
              InputWidget(
                focusNode: passwordNode,
                controller: passwordController,
                icon: Icons.lock,
                isPassword: true,
                labelTextInput: 'Senha',
              ),
              const SizedBox(
                height: 15,
              ),
              InputWidget(
                focusNode: passwordConfirmationNode,
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
                            title: const Text('Nenhum dos campos pode estar vazio!'),
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
                    } else if (!EmailValidator.validate(emailController.text.trim())) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('E-mail inválido!'),
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
                      UserModel user = UserModel(
                          id: 0,
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text);
                      DioHelper.createUser(user);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Cadastro realizado com sucesso!'),
                            actions: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(238, 46, 93, 1)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
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
