import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 46, 93, 1),
      body: Center(
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
              const TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                  icon: Icon(Icons.person),
                  labelText: 'Nome',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                  icon: Icon(Icons.email),
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                  icon: Icon(Icons.lock),
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                  icon: Icon(Icons.lock),
                  labelText: 'Confirmar senha',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                margin: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 234, 198, 214),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'Criar Conta',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
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
