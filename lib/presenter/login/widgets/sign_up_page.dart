import 'package:flutter/material.dart';

import 'input_widget_login_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 46, 93, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/avatar_preto.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                InputWidget(
                  controller: nomeController,
                  icon: Icons.person,
                  isPassword: false,
                  labelTextInput: 'Nome',
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
                  controller: passwordController,
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
                    horizontal: 90,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 247, 170, 189),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Criar Conta',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
