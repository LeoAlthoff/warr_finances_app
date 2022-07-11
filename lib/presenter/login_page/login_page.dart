import 'package:flutter/material.dart';

import '../home_page/home_page.dart';
import '../../shared/widgets/input_text_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 46, 93, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: Column(children: [
              Image.asset('assets/images/dinheiro.png',
              width: 90,
              height: 90,),
              SizedBox(height: 30,),
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
                  SizedBox(width: 10,),
                  Image.asset('assets/images/google.png',
                  height: 30,
                  width:30,)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextInputContainer(
                textValue: 'E-mail',
              ),
              TextInputContainer(
                
                textValue: 'Senha',
              ),
              // Form(
              //   child: Column(
              //     children: [
              //       TextFormField(
              //         keyboardType: TextInputType.emailAddress,
              //         autofocus: true,
              //         style: const TextStyle(color: Colors.white),
              //         decoration: const InputDecoration(
              //           labelText: 'E-mail',
              //           labelStyle: TextStyle(color: Colors.white,
              //           ),
              //           prefixIcon: Icon(
              //             Icons.mail_outline,
              //             color: Colors.white,
              //           ),
              //           focusedBorder: UnderlineInputBorder(
              //             borderSide: BorderSide(color: Colors.white),
              //           ),
              //         ),
              //       ),
              //       SizedBox(height: 10,),
              //       TextFormField(
              //         keyboardType: TextInputType.visiblePassword,
              //         autofocus: true,
              //         style: const TextStyle(color: Colors.white),
              //         decoration: const InputDecoration(
              //           labelText: 'Senha',
              //           labelStyle: TextStyle(color: Colors.white),
              //           prefixIcon: Icon(
              //             Icons.vpn_key_sharp,
              //             color: Colors.white,
              //           ),
              //           focusedBorder: UnderlineInputBorder(
              //             borderSide: BorderSide(color: Colors.white),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
                  width: 150,
                  height: 30,
                  child: RaisedButton(
                    elevation: 40,
                    onPressed: () {
                      nagigateToHomeScreen(context);
                    },
                    color: Color.fromARGB(255, 234, 198, 214),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              // Stack(
              //   alignment: Alignment.topCenter,
              //   children: [
              //     Image.asset(
              //       'assets/images/grafico.png',
              //       width: 420,
              //       height: 250,
              //     ),
              //   ],
              // ),
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
