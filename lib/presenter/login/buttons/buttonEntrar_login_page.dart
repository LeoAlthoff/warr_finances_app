// ignore: file_names
import 'package:flutter/material.dart';

import '../widgets/login_page_body.dart';

class ButtonEntrarLoginPage extends StatelessWidget {
  const ButtonEntrarLoginPage({
    Key? key,
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
          onPressed: () {
            nagigateToHomeScreen(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 247, 170, 189),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
