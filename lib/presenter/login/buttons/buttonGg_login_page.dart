import 'package:flutter/material.dart';
import '../widgets/login_page_body.dart';

class ButtonGgBodyLogin extends StatelessWidget {
  const ButtonGgBodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 30,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
          onPressed: () {
            nagigateToHomeScreen(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.red,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Login com Google',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 25,
                width: 40,
                child: Image.asset('assets/images/google.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

