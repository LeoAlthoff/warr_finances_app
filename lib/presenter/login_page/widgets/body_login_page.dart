import 'package:flutter/material.dart';

import '../../home_page/home_page.dart';
import '../../../shared/widgets/input_text_container.dart';

class BodyLoginPage extends StatelessWidget {
  const BodyLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Column(children: [
            Image.asset(
              'assets/images/dinheiro.png',
              width: 90,
              height: 90,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Warr Finances',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Controle suas finanças de forma',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'muito simples',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 70,
            ),
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
            const TextInputContainer(
              textValue: 'E-mail',
            ),
            const TextInputContainer(
              textValue: 'Senha',
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
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
          ]),
        ),
      ),
    );
  }
}

  void nagigateToHomeScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
  }