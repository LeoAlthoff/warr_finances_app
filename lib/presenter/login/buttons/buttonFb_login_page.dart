import 'package:flutter/material.dart';
import '../widgets/login_page_body.dart';

class ButtonFbLoginPage extends StatelessWidget {
  const ButtonFbLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 30,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade700,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
          onPressed: () {
            nagigateToHomeScreen(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blue.shade700,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Login com Facebook',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                color: Colors.blue.shade700,
                child: SizedBox(
                  height: 30,
                  width: 50,
                  child: Image.asset('assets/images/fb.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
