import 'package:flutter/material.dart';
import 'input_widget_login_page.dart';

class ResetPassawordPage extends StatelessWidget {
  ResetPassawordPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 46, 93, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'assets/images/password.png',
                  ),
                ),
                const Text(
                  'Recupere sua senha',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  
                  'Informe seu endereço de email associado a sua conta, para enviarmos as instruções de redefinir a senha',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                InputWidget(controller: emailController, icon: Icons.email, isPassword: false, labelTextInput: 'Email',),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  height: 30,
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
                          'Enviar',
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
