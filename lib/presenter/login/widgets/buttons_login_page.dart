import 'package:flutter/material.dart';
import 'login_page_body.dart';

class ButtonsLogin extends StatelessWidget {
  const ButtonsLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        

        Container(
          
          height: 50,
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
              
            child: const Text(
              'Esqueceu a senha?',
              
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 180,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
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
        ),
      ],
    );
  }
}

