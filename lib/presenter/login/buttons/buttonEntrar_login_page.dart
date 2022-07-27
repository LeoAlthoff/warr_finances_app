import 'package:flutter/material.dart';
import 'package:flutter_teste_app/shared/utils/database_helper.dart';

import '../widgets/login_page_body.dart';

class ButtonEntrarLoginPage extends StatelessWidget {
  final String email;
  final String password;
  const ButtonEntrarLoginPage({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 30,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink.shade100,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ElevatedButton(
          onPressed: () async {
            bool validation =
                await DatabaseHelper.instance.validateUser(email, password);
            if (validation == true) {
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
                          ))
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
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
