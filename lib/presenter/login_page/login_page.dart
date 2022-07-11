import 'package:flutter/material.dart';

import '../home_page/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 46, 93, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(children: [
              const Icon(Icons.attach_money, size: 70),
              const Text(
                'Warr Finances',
                style: TextStyle(fontSize: 45, color: Colors.white),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Controle suas finanças de forma',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'muito simples',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 55,
              ),
              const Text(
                ' Faça seu login com uma conta Google abaixo',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    TextFormField(
                      autofocus: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
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
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 150,
                  height: 30,
                  child: RaisedButton(
                    elevation: 15,
                    onPressed: () {
                      nagigateToHomeScreen(context);
                    },
                    color: const Color.fromARGB(255, 144, 141, 142),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/images/grafico.png',
                    width: 520,
                    height: 300,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void nagigateToHomeScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
