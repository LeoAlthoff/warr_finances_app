import 'package:flutter/material.dart';
import 'input_widget_login_page.dart';
import 'login_page.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        navigateBackToHomeScreen(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/password2.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
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
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Informe seu endereço de email associado a sua conta, para enviarmos as instruções de redefinir a senha',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InputWidget(
                  controller: emailController,
                  icon: Icons.email,
                  isPassword: false,
                  labelTextInput: 'Email',
                ),
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
